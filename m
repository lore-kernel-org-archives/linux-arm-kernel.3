Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A890C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFdoI8Ju1M/PWn7HdIABw+L7KS/gVbS5DzsMo/puQzA=; b=iy6JyH9zLHuUC+joHKaXjyz8Tx
	Bmia8YtnPqZiW3KxRPaO8M0rX2/OENWlrM9YUY9WRI8ci8Ka5jClWpaV2hX4t4BeNLMSVhSlSjSY2
	stwtB9F5DBYlfgDXozsU8VO7vh1NF8NIXJB/cZ9BUrW32nZCjtZ9Plw/rYA1tTsTPsiohHJ0xNfq7
	CaSNSwkUfxofDQ9qgODKrV7fOZe8dkjeFXd35IX1uKnRy7grFfg/6Vh3jkQE23/CwYchi49tdtiph
	BP6DQH5h+JdbUWLOndK58vIDDqRQsHvd7CO0chQfahsX+slRjQn0LQFqTWaP7Elm6QRaMhBEyYRMQ
	RJkHUWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teWut-0000000DcJd-2v74;
	Sun, 02 Feb 2025 10:09:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teWtY-0000000Dbll-3ar7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 10:08:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38be3bfb045so2999037f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738490883; x=1739095683; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFdoI8Ju1M/PWn7HdIABw+L7KS/gVbS5DzsMo/puQzA=;
        b=J68nZ29vZHigl0yMVFJYyKNu/qW4ZusJGffihtXmTdTEeYE9uYTm4L7CoKKpzMjO91
         VrfivdOVa8sKNtIJnlOmKAPBuNW5OLoxd/1l+SjvJ8YQ0lFgxGYT62uMkcNmD3RcdXc6
         e3ZH88VqESzcGoAQfPQW9os2Vy9i1R2XslPU9NeJZKdPCHxsd/2faGqK9ZRjn7VD9X6+
         OkN6X6I1dc4QnRZBhYpaSkUO+2jZaGvLjIpt1NEqMXqlMiFDMiGDIazKDbaTY8GW8a+0
         4j+0mSM4C8J2gsczAN+sVPPCCeloSG6PgrQkBDIEDQ/VV5DdOYMBwnTeyl+6YMUFovNv
         8OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738490883; x=1739095683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFdoI8Ju1M/PWn7HdIABw+L7KS/gVbS5DzsMo/puQzA=;
        b=hdMdgK29xTOi8Ba85OFm5kch/RPcS557ABhQGzghoaLH1LAkVuHSTTrmTozWt1vAoq
         aq6YledsF+j3qpJXzqDAB7vrSk3QkKby5SuXZ8+dNYwTfDaZ5+bWDxAgr0m/QaKG7tiK
         MDmqcdrWV26ii533RXmfNB8SjHUdxZiIyVNjX9EUuf7aSgeCulNZWLM4dRUWONEoui3x
         PQ3f/AwbqiwG5NKicMYh1jGfPdhA7UaLOfnzRitqcL3jsysEM1tEQTyKZGvFAn4ScYuN
         3J59iRA8oX7iO1odr6+0rM3UYdKC0M728xX96ZkYasNmEGSn0S2hMouul5DqvX090E2n
         il6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbkAmtR0cBi1yPPtBm6Evx9y29DNI1015TYs3q2oL3QaToHM8+vCIE1TdOsgSmddBzIjc/uWabL33yKtr+CR+w@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaK73HQko99/SmnRMMkfpJMWaa+HLJclkVpMGzF3gR/yxmNO7
	KW5uotK5HZeUnusnm2+AXVrqlGCUbKOtMmhofsU3AIt7yJ/Gkyu3
X-Gm-Gg: ASbGnctRzDBmHIiDaweOiqCFaq9GTaqIpQujzu51r5o9S2PI6wePaIa9r3z33XlnCxN
	l4ZT9te+WZk/FSgqx9GXtnUGFunY7g1Nl39AbIKyfrwz0osnTCMRuZg6QJNnsHVHXvwegTWLY6p
	r/EKhxacH3XGOKujsbyRSntdP/n0432Cs7Sa0Pc09ym4eEWkGhEGUIPUXFyKKN18oNnoh/2Cmf3
	gXmYGgp8vuM++evoFSySJZwKv7V8HTnEQiheEnvMrTrERpy9GrMioXTrezXjQ2cQLFmJDEFBHWH
	HaewaF9IMY8LA7GNSuF8fo6qQgwi6t9Jqz0ywZFVyhVmQXVzWbM+emI=
X-Google-Smtp-Source: AGHT+IGNKkQ6RmFbtSpubVq9TAAF3iwlIDcdrUun9xtcXNmIq2ukjQ9eiZ018uRqNCSUVc1oCXaPPQ==
X-Received: by 2002:a5d:588e:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38c5a96fdd7mr11060147f8f.9.1738490883129;
        Sun, 02 Feb 2025 02:08:03 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b576csm9693529f8f.63.2025.02.02.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 02:08:02 -0800 (PST)
Date: Sun, 2 Feb 2025 11:08:00 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
Message-ID: <Z59EAM9l7t4Z5Q5g@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_020804_894952_A64D514C 
X-CRM114-Status: GOOD (  18.33  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2025 at 07:13:50PM +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[snip]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59054
> +    then:
> +      properties:
> +        regulators:
> +          $ref: ../regulator/brcm,bcm59054.yaml

Full path.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59056
> +    then:
> +      properties:
> +        regulators:
> +          $ref: ../regulator/brcm,bcm59056.yaml

Full path.

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..719621c7f0e71cd9368f4d7243c79aaa97ca7255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59054 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.

Same comment as patch 1.

> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59054 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, mmsr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, tcxldo, lvldo1, lvldo2

Same comment as patch 1.

> +
> +patternProperties:
> +  "^(cam|sim|mmc)ldo[1-2]$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#

As Rob's bot pointed out, you're missing unevaluatedProperties: false in
all of these.

Regards,
Stanislav


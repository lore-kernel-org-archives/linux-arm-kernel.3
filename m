Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DAC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUQgpmI9UGt2CHhCnpshiIb65mRzxe5yVPIox+Gy9EQ=; b=cS51FpvM2/qwjc/uAxSjjLOQDO
	tYG+1cpy0FHAfNWHAkOuWVLsWFkhjaBN02Gfk8ac9iFybAOFAK7qTSjGUWnOjXqL8Tg932AEDVZyp
	gF9w80s3uW+ERmMT6JOj6GXKgDrTBJZpbKRZgqd6DbwwlFizPr1E879AKVkQg3knucj686OieZZ3x
	GKmY6DtfBk2UDITVPGW3gv/x6cFXn1f/2Qd4wW3Ibi0440H5LzCnfdhOvWFfvhwAXnf20DgbgAt5N
	xFQOW1ZGJ+gBtJzUsYWmsUW8fK0txof0BLO6C+Hvx2i5hGhbKKVdAsVt2u0iyOw+cbtlRgOfYtYRo
	jmJr/PCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Cp-0000000AnBL-0D1H;
	Wed, 16 Apr 2025 20:17:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59AM-0000000Amfr-3Bi2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A0B6156A;
	Wed, 16 Apr 2025 20:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE78C4CEE2;
	Wed, 16 Apr 2025 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834525;
	bh=2wkHVrSpRFb9zHvS2pMnzRDNmuP5IaR09Mwm8aKfwyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttCdY27VQu6ureDFgFuO6onjpbgtQ72z5/knPNgZBekYP5Gv+O2Fifgb4P4bnfd9J
	 DtrKCSBCeW9Agk1o+JMFNiVULtZU8yfW0UARIEOUtTtq3WwDeiaIAiWgZ5sm0RsrG5
	 uUEjEWSCre/r3YFbo3ytjiTjHBxarmnw8bARLpmf8X8l/kyKODfMaeHOsLlMoi02W/
	 ARaGavkNhUheyRtPN72ueSBamHQFm/jmwwRvYHf/FOvVh8+G8dSu4q2napoon9MT49
	 reAbE99tPcDFGGaKWoIXvW7wpKbC2ZJlSLrlhxs8GbzH8vPOhEcffSrZbG29KYIwEB
	 ZXWnKSBVWBjsA==
Date: Wed, 16 Apr 2025 15:15:23 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <20250416201523.GD3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>
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

On Wed, Apr 16, 2025 at 12:21:30PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia PWM controller
> as YAML schema, and switch the filename to follow the compatible
> string.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
>  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c36b8e0996cf599cec0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: via,vt8500-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#pwm-cells':
> +    const: 3
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm1: pwm@d8220000 {
> +        #pwm-cells = <3>;
> +        compatible = "via,vt8500-pwm";
> +        reg = <0xd8220000 0x1000>;
> +        clocks = <&clkpwm>;

Same order as in 'properties'.

> +    };


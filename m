Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A7C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ft0sbDzZK4jvuotvC/BcErrmybkcSe6yPYT5YfKHzOE=; b=ey5SY9HTgPSYUk9gMvO5aoqyNe
	y6HfOJaFoBUbhFWXo+8Icm3y+UWedyIqzG7p9vZSb0aafj5ZbVjEI1MaVZnLW4fZ8vdugQQ4eFVuZ
	sONZCi/kySp96k247AfxnJuROsDDbIBXnOWr80iOBZzflhjVo4hQI4311iparCEFXlMOZ3zQBPkT1
	t2NwPLiZmeeGUqCfiIn32ZiNiW2RZKi1HQpKGQ+z8MO/pcJJYJp0IBJJs3EVtcdGG1i24+UIi0tsr
	erYNSiupNbU/pp8VF+FrBpKX2O8oI8AHntQv9tW7p0wWtFkwoBFEXWjDrzmzSt+MYgpDpf9bBYx6l
	UKqapCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptKO-00000008uR8-3NDl;
	Wed, 05 Mar 2025 18:18:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tps8b-00000008kdo-2mjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3730A5C6B04
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEC7C4CED1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741194148;
	bh=GRy1WbTNuxUAPrFOSZ3eMza5+pjAFHcCZGMDO9Bw9vQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGv32PtkJgm3ELN9DsvogEvf25HQQdh19VAtxk9MeKcEX07HdRv1VUwjvDAwOacAt
	 XIBGgVsYzxCbcIK0NhgcTHmg7K6O54DnMjucpil/6OIq7+xQBDcoIF2HeAnyKCjDXJ
	 ySp5r3cYfqNtF/Usd2mNYcbn980NQlqoO9mYJiKFww0rhoAdgEEp0kktOMb5tJxSl4
	 PTcjcO60lL9HC2S6iXHVpY9Y1AiHB3EXXIS5R5jxRzPDqKBWkmns8XhfsJtwGictb+
	 7ebKt6bQmAWBQt7BOz8oyuO27LRg1Xx8aMotoH7XtVvWhfep83HwR5kCeCaBDbnc9p
	 MwUDiITjc15Hw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaec111762bso1300174766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 09:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf+VGdSOuv3wqk/MtTS7BwNOSGCtIwC2JyiMSL0jl0RS0TqZ7GY/viykHmf+RdeKRJ5umXJzQBmwUnCJyP20Sq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2e27beY59+L3CYts6F4u1wdI+OVUvRbk5VCwWfqJFDWT2nkK
	iuEMhocn4aRRGeaEbxuELBoiRgiefAhwH0n0KDC/uT87lc5pDum5xCPFPNce2FrIq/WAZQyEPlb
	9JA8q79ZI41dD/FKcIE+tJZ2r2A==
X-Google-Smtp-Source: AGHT+IGgLAXSRBzU5AFRd6PnX3IZuDCdN73sQ42dh8wgaaV3t/YCusLdNXk4zX5F2wbX8qIW+4J5KdoX4FTJoiz98Cw=
X-Received: by 2002:a17:906:6a02:b0:abf:40a2:40c5 with SMTP id
 a640c23a62f3a-ac20d92d651mr402225066b.27.1741194147152; Wed, 05 Mar 2025
 09:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-2-ae8302358443@gmail.com> <20250304141933.GA2543583-robh@kernel.org>
 <51cefa7f-df05-49d4-9006-59ed216915a4@gmail.com>
In-Reply-To: <51cefa7f-df05-49d4-9006-59ed216915a4@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Mar 2025 11:02:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Qsu-6Z72uXYKwc62idq2K169S1t0nUrrgNOyezgfYsA@mail.gmail.com>
X-Gm-Features: AQ5f1JoahPq2cFHn8OS3F1s4Px9gSAx0Gtyla8PqP28TC3Lr84PnEf8as25lYMw
Message-ID: <CAL_Jsq+Qsu-6Z72uXYKwc62idq2K169S1t0nUrrgNOyezgfYsA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_090229_788724_20253909 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Mar 5, 2025 at 10:52=E2=80=AFAM Artur Weber <aweber.kernel@gmail.co=
m> wrote:
>
> On 4.03.2025 15:19, Rob Herring wrote:
> > On Tue, Mar 04, 2025 at 07:20:33AM +0100, Artur Weber wrote:
> >> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> >> the same driver. Add compatible and specify the allowed regulator
> >> nodes.
> >>
> >> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> >> ...
> > And drop the allOf below.
> >
> >>
> >>   required:
> >>     - compatible
> >> @@ -30,6 +31,27 @@ required:
> >>
> >>   additionalProperties: false
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: brcm,bcm59054
> >> +    then:
> >> +      properties:
> >> +        regulators:
> >> +          $ref: /schemas/regulator/brcm,bcm59054.yaml#
> >> +
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: brcm,bcm59056
> >> +    then:
> >> +      properties:
> >> +        regulators:
> >> +          $ref: /schemas/regulator/brcm,bcm59056.yaml#
> >> +
> >>   examples:
> >>     - |
> >>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> "Drop the allOf" as in, drop just the "allOf" line or the entire block
> with "if" statements? If it's the latter - wouldn't that break the
> bindings for the "regulators" subnode?

Uh, I misread this thinking the regulators node had a compatible... Never m=
ind.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


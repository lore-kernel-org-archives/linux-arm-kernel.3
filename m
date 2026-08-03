Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC66DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=; b=0vugJXYSJfg89izN2FcLVRWHAJ
	c+QxrNO/lels9DeMys00d65yjwPx3a/Q35tICBluaCvtFbB1I37oyXTB1+BEsNh4+95Xui9yGYt4C
	zALr0sHOswHq5dFbhyDcKYvC1PwlWU9diRV3da6w/w1IBWBcK1vGMOqn+EbiVKz3z2rCHIgsBJJXX
	KbqXdfYhNMnDUYj6PgEI8dBdXoh5YN73/cSa0rSpnZQDFzeU5a4bdvjhiiea/p3DIdtxDg03g3Pos
	kLHsLrL+rF+ew8u/cH0PJUYGMMZVZVxEgV+eT+QN0Vjl2vonSUrJulTHiCDVkipHGLhoJ55eB6bWi
	PXqdyMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVH-0000000GZCJ-1yj9;
	Mon, 03 Aug 2026 07:54:31 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVE-0000000GZBJ-3zus
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:54:30 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-96944741eaeso989953241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785743667; cv=none;
        d=google.com; s=arc-20260327;
        b=F/pC/7GRB6nqcFQf+Mk0ibcpN/bIjyybL0Jk45w6IXjEwjCwQ96M1RdARvQnET1BOE
         RYePWO4+h/jKZ+vx4Rgwf195dfh7JTVra/SRpp47xmT9ADc1CImTZRKiPtGc5l4jQ1Rv
         Gyy8ajAhA9Jg90fE2miqPuzxUKGe067FTTbMtgZQqPx6CKyU7mK74z8LKrtRbNHqa1+W
         5DI5lQDtcE4OKXHz/4KbKZgw+XtHPExDRj6DzIBMyFe+YT3Hp9hQCladQzkeavd1bkGv
         CTUVD8t6s9p1CFwC57ookW1irm+TkFjMfFWDEg5dYBeDv18nXm75UbwjJYTjSEcRIV6m
         kqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        fh=lyFFmdwrEE0T5ZroVQwml2bqn9EZZ3JAnHFJ4BAhOts=;
        b=LYP6dy3g3ES90BJIB5aqWtjwalIRyeCbg642mLWgR8+WGWUSHMv53lapTA5W2utaT1
         2leCeM0Wu16bGArpthOVoVHcuubMvdtvu8vXGi6bgXb1+JMkgVN6/jBw+UzXjl8lmfOF
         BeGcgZmE1Gs37GdS+wG8p2IVB4Kqoe+THrTumjh1xDqqU4KPJjTeT7QnpUH/rEz8AKh1
         9XlFItaNNUTb1A+kwgsJD7oRH4YHD9xJdqvRcgbNZNhEYUyoxCQItBtYwD7BuglG7jRd
         j0RXEkckMmkZ2kcYxSzsCchv58b4eBMCluflBxCo7uGcVd7eTRiKO+7SCaTA548aTEPG
         7cug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743667; x=1786348467; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=V6Ha54d0OD4FMw0cGipQFvwq4qwbxFMYgP4SX3/ARUNErrBMRDvY6UmpF0mieYa38c
         jCGwiiLtffwNBOvT2Qw76a/eSAA1QfiVy9erht1rCf1ugiwErWrC6Yz16iWRgoVmbl4E
         gg/PDmwYb9JDdgKXgwgVRvfMQTZ4WDWcv/FEoMaZcsry/KMAhdXKIn9YIM1XYqlji/Kc
         ArKsdeUOi7T8j+QJiYzpd/nVqZc32+Y25L1gnYifpkEJYGV73gE2DJoeb33DumYgZttV
         uCUOpufmV8lrJm/iPKJ1fXY+/UqOMuHTPhE8YyoinhazcFS1oTj4gHWd6eC4t+COMDNt
         cqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743667; x=1786348467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=WYy44r79eKWlDBVTZxVQ3oJnEgYnl10Y1lYvVjnXcoCgV9VgsNq7Ac0VYyf5CeA/rq
         c7UpU7r8WVxy461jJcXVXqetdVWXXIYvgKHWoSoLjDQCFJuWCoMTqfcvtWIuY/a/jOYa
         awPFc9/hvyWgKkZ5JgS7kiBA+Wz8JCff6Q2Z06/Moutuy/Ble5PcARJwuLlsIv7ZWWBf
         /n95HC/5ydzXTq3VZQCRygdq6gOXheIeKZSBIVUt9Ia5TGfLRsIJQBn6+hGbtIvS/3ha
         2Q+9noZrS3ZOjOsmTMQhNCF726SllL+y4FTiJtPcIXSN7uWEzW040rbqSBjQo8fTQ2E+
         rQwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0O+d9PGHhxjCOszE55ANIH0WbjtFqZcTpdNukB4vX6sUILhO4DWMietMJUbimujF+zId6agKEezIU7qFuHNhW@lists.infradead.org
X-Gm-Message-State: AOJu0YxayF4WjT8ieAqKi28UtYR2Z01Nj6kob0TnfX9k9zyZIFYBMolG
	3fi7Uk7dcwt2m7Bt3CMnqOpgrZwzbdstPOnqMUPZk9FkyypuXSpY55AgjJbLpia2h5x1ejCv+Ah
	lR5iFaA32elKXO51DzwJJEFWooEThFHM=
X-Gm-Gg: AR+sD110zma4SnZZqOd1JOPBaX+QT6q/r61Q3hApCUMeCI4UZJq2jiTs6BWxWwoXw1Z
	jxMAFPCg0zySitu5d3nFLpRLSe/8vl3Fq9B2EYPXtEmUqdj3GWkDRtXBEf8JESkzwZQLIcSEGra
	rFSqXHtQf2/UYtO3a9VImv0Zwupbc6lZL0SfMSiUBdn+WTogrncaY5dAP1FEOVQgyLaZWB8Hb+4
	BwGLnVXW96z7Q5Ve6NZ6cEvKjZiPMPuKtHV3+w+2QpFCoX20tt1XfvvDjE8dGZY4LKVghhJk0o9
	yJnzgXXQMYw3enrVkY3C44Mkr9V47UFs8JVaCbpdUKkyJmjlh3gog4rGyZm8tPmtnXHU+fPHslI
	x+qRh3GZi00EJFSDl/d1V6atULuVDA+6lDezFGJfcVTGpc5nAw5nOAjhviZNtcAFASBkS+6kA9r
	j3DNpQhNW7ZXLGc4JjOcTiEtNjFyPd9wVqf/KodPBX2GY2TR0=
X-Received: by 2002:a05:6102:160e:b0:65a:fcea:5a8 with SMTP id
 ada2fe7eead31-75b21860c9dmr6557280137.3.1785743667347; Mon, 03 Aug 2026
 00:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
In-Reply-To: <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:54:16 -0600
X-Gm-Features: AUfX_mzypJX8cJAuXN5et4vt4pytYhwgZWhNFqSZnDYLwz1Lp-gZapkTkGPrkCE
Message-ID: <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_005429_009619_1181694C 
X-CRM114-Status: GOOD (  28.22  )
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

On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
>
> This fails when applied, because you did not explain the
> dependencies/merging of this patchset.
>
> This is THE MOST important information of cover letter. The first thing
> to explain.

I did mention in the cover letter that the pwm series is a dependency:
https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@bootlin.=
com/

With the pwm series first this should apply on top of master. Should
I just mention that it applies on master or should I reference a specific
commit hash or something?

> >
> > Describe the parent device, its input clock, required function supplies=
,
> > the optional SID bandgap calibration cell used by the vendor initializa=
tion
> > sequence, and its optional Ethernet PHY control child. Document the 24 =
and
> > 27 MHz rates encoded by the public EPHY clock selector.
> >
>
> ...
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - ac-ldoin-supply
> > +  - ephy-vcc-supply
> > +  - rtc-vcc-supply
> > +  - tv-vcc-supply
> > +
> > +dependencies:
> > +  interrupts: [ interrupt-controller ]
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +  nvmem-cells: [ nvmem-cell-names ]
> > +  nvmem-cell-names: [ nvmem-cells ]
>
> Why do you need all these dependencies? What are you trying to express?

Looks like we probably can get rid of all except these:
interrupt-controller: [ interrupts ]
nvmem-cells: [ nvmem-cell-names ]

I was just trying to express the MFD controller dependencies.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
>
> ...
>
> > +...
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
>
> Hardware constants are not really bindings, even though you use them in
> the driver.

Should I do something different for this?

>
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
>
>
> Best regards,
> Krzysztof


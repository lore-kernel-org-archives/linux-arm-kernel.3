Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB13C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3+DMoHHGIgy/vebIi3Jk4k7xIG+hyANlJEXNLYgE3w=; b=uc8P2tPuMoI6T4VW0gGc+yTNeS
	86NTM0ewro3lcBN6BQRPx6ScTmCfbqC2iUpBOvwsuqEJcYXhhI4pZnstF3shabLSCycPZCdBLI9nU
	VkmQ1xkgBiKfE/isWARPfC6rxm3f6jKUiPw6JrtMrERKzfw1V+YNeewZDqVeIntlH1Tjpb+YGiIiJ
	yjwqhwjVqmSqhRPkFHjG15j4yb4syoyJjIJ/ClxqFjJqwIhIKGmhmBTNTY64xIo/nK8R/jNKZz6qL
	C0rP96tX3n9pm5whhIQAX44NHyWdxdXY9avAw6l5BFKd9bd6MUOB1D2+fyxMJMCR76cm/41NspJ7E
	6qlni9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSF-0000000CT2a-194g;
	Thu, 26 Jun 2025 18:36:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrEU-0000000CRq3-2PLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:22:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so218789666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750962116; x=1751566916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3+DMoHHGIgy/vebIi3Jk4k7xIG+hyANlJEXNLYgE3w=;
        b=OrxpCycR95Tl6WhT92bmqy5I8JWbvV8ZlufpKv+TtYr9gpHHoZrTgwIVLwmaeJJ0Ik
         f/nN2YRC8sfAggZhseH9aXpAnJKBmgdZk4N2dq6Iv2q1qTnWviYwtFZveIqJwD4xDuLo
         Jjys9DS6TpLy0+M68mMXC1BsxNwlAX7JJNn+S6jXmlrEAPCsHpZO52kHirTwTiUdfS2V
         JSSywtGTftkZVEihrw5dopSPsGBmHuvlLRr7K7fdkls5KONLhtl7h9NfWJYgGAUx2MMD
         EFv1bb0YGouYfd4OagcAXUgrouLAt3ueqoXZANNFQcudaQPrDbYI0or1KWRq8AyU4Mqs
         mXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962116; x=1751566916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3+DMoHHGIgy/vebIi3Jk4k7xIG+hyANlJEXNLYgE3w=;
        b=igw6NXzgh/nJPiQ4A1R6M2SMl6LF3oBNd277EaC5rS4th7OyYYb9H4HsFnqR79i7V6
         53MIEo9q/SCK0zHBkSkJIQklvvwYMvXlCDE9jYyZ1jngmy0tXhnusZjmuHWwS9E3rPKa
         wutPSSW13KOxJii6GlJ2+3hA8JlOOF7e4M4us4GZ9fAxVLq3SOqt+YyWbI2EwMIPDt6c
         EiBB9P4El4LyKUZ/+YX/pwTjKHkKtwJ6SfJOCO6q+KigeD0Oix3FTUCTXx/U4QzymbAk
         oc13nMVyP8bW7uv27iEtuBe4D1ddZXfKxJZC/iZ0l4I2CmdSbQHBoTqNDbUwrXGTuXfZ
         SnGg==
X-Forwarded-Encrypted: i=1; AJvYcCVBnhb27xNULW2+gbhi4uY8ZRoG/dGJ34gpIAdAVzV8rOokps2OcIEUUCwjPbO/XeOkzMTY59AqomDsiY71Xfbt@lists.infradead.org
X-Gm-Message-State: AOJu0YxqiMb5YZLJUARKFETRJMPMgT9vJy+k4vfKDcHjdsaC0I1miRgt
	bii48nfzuK4bFbEfGrNXY9tZl0G+ml1P23Qai6CeyFtYR+cJ1LFv8w4GRmRls4Qk3w7FleCTbhD
	m5n23lCdKw67RQgc+WL+vqyUg573sb2k=
X-Gm-Gg: ASbGncuvs08TFAUV/XTsGlu7bIphIMVPCHSyqopFyH18uIB71BlwEs32mC2TnqB9CE9
	jnmhOorKUp5okuoQifdj+hDni3/g6+Dcer+qR0ZPjg19jFkIVATckHI/oPcASvXTffbW8bJ29by
	+H5JcQcPpfjPjzAbNVKl/Yrf1hZnkS54BowoiLkGSZ
X-Google-Smtp-Source: AGHT+IEsqtj8v2bEovOjiG46CLJ7UL5bwYCV8gHZttkfNpv1pJvRdrPCilDlgYCTp69vYR0Wg+ubr4UgooPkLo5BW/k=
X-Received: by 2002:a17:907:3da5:b0:ad8:9257:571b with SMTP id
 a640c23a62f3a-ae34fd3c530mr13268566b.16.1750962116235; Thu, 26 Jun 2025
 11:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af@eucas1p2.samsung.com>
 <CANAwSgQ=G1yJXOg1LdeEf-J56epyNiohCSdNYUvs2AHNv90Hkg@mail.gmail.com> <20250624075815.132207-1-m.majewski2@samsung.com>
In-Reply-To: <20250624075815.132207-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Jun 2025 23:51:38 +0530
X-Gm-Features: Ac12FXwpXJBzgkh-OwnIhYXUzqm4zOFzScYoLTs9xrNJZHdZ2chXs_WiTmxz6v0
Message-ID: <CANAwSgT2ROe77FVgk41s3xB-a+2SNwo5XWRZzrgxtC_SiooTXA@mail.gmail.com>
Subject: Re: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature threshold
 interrupts and clear corresponding IRQs
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_112158_628900_FE30B1B0 
X-CRM114-Status: GOOD (  47.67  )
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

Hi Mateusz

On Tue, 24 Jun 2025 at 13:28, Mateusz Majewski <m.majewski2@samsung.com> wr=
ote:
>
> > I tried to configure this, referring to the comment in the driver
> >         /*
> >          * Clear the interrupts.  Please note that the documentation fo=
r
> >          * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectl=
y
> >          * states that INTCLEAR register has a different placing of bit=
s
> >          * responsible for FALL IRQs than INTSTAT register.  Exynos5420
> >          * and Exynos5440 documentation is correct (Exynos4210 doesn't
> >          * support FALL IRQs at all).
> >          */
> >
> > By the way, I don't see Exynos5433 and Exynos7 support
> > INTSTAT and INTCLEAR registers. We are using TMU_REG_INTPEND
> >  to read and update the same register.
> >
> >         if (data->soc =3D=3D SOC_ARCH_EXYNOS5260) {
> >                 tmu_intstat =3D EXYNOS5260_TMU_REG_INTSTAT;
> >                 tmu_intclear =3D EXYNOS5260_TMU_REG_INTCLEAR;
> >         } else if (data->soc =3D=3D SOC_ARCH_EXYNOS7) {
> >                 tmu_intstat =3D EXYNOS7_TMU_REG_INTPEND;
> >                 tmu_intclear =3D EXYNOS7_TMU_REG_INTPEND;
> >         } else if (data->soc =3D=3D SOC_ARCH_EXYNOS5433) {
> >                 tmu_intstat =3D EXYNOS5433_TMU_REG_INTPEND;
> >                 tmu_intclear =3D EXYNOS5433_TMU_REG_INTPEND;
> >         } else {
> >                 tmu_intstat =3D EXYNOS_TMU_REG_INTSTAT;
> >                 tmu_intclear =3D EXYNOS_TMU_REG_INTCLEAR;
> >         }
>
> My understanding of this comment and the situation in general is like
> this:
>
Thanks for clarifying this in such detail.
> 1. On 5420, whenever there is edge interrupt, no matter if rise or fall,
>    a bit gets set to 1 inside INTSTAT, and we clear it by setting the
>    same bit to 1 inside INTCLEAR. The current code does not rely on the
>    concrete bit index, it will just check the temperature after the
>    interrupt.
Correct
> 2. On 4210, there is no falling edge interrupts (so
>    exynos4210_tmu_set_low_temp is empty, we enable polling in DT etc).
>    This is what the "Exynos4210 doesn't support FALL IRQs at all" means.
>    However, rising edge interrupts work exactly the same as on 5420:
>    a bit gets set to 1 inside INTSTAT, and we clear it by setting the
>    same bit to 1 inside INTCLEAR.
For Exynos4210, I am skipping this in the next patch.
> 3. On 3250, 4412, 5250, 5260, it again works the same way as 5420.
>    However, somebody had a copy of documentation that was incorrect: it
>    said that bit indices does not match somehow, which is not true.

> 4. On 5433 and 7, it one more time works the same way as 5420, with a
>    single change: a bit gets set to 1 inside INTPEND, and we clear it
>    by setting it to 1 inside the same INTPEND.
>
> So, all we need to do to support existing SoCs is to read the 1 bit from
> one register, and set the bit with the same index in another register
> (which on some SoCs is the same register). We could interpret the index
> to see what kind of interrupt is this, but we read the temperature to
> get similar information.
>
> So in the end, is it helpful to interpret the INTSTAT bit index, only to
> reset the exact same index inside INTCLEAR? I guess it could be valuable
> if we also used the information about which interrupt it is and somehow
> used it elsewhere (which could actually help with some issues), but that
> is another thing to do.
>
correct.
> > If you have details on how INTSTAT and INTCLEAR are used
> > particularly regarding the update bits, please share them.
> > Specifically, I'm interested in how bits [7:0] correspond to rising edg=
e
> > interrupts and bits [23:16] to falling edge interrupts
> > I feel it's the same as Exynos54222.
>
> Regarding concrete indices on 5433:
> - the 0th bit corresponds to RISE0,
> - the 1st bit corresponds to RISE1,
> - ...
> - the 7th bit corresponds to RISE7,
> - the 16th bit corresponds to FALL0,
> - the 17th bit corresponds to FALL1,
> - ...
> - the 23th bit corresponds to FALL7.
>
Thanks, I will update this in the next version.

> That is probably because this SoC supports more interrupts than others.
> Though do note that currently, we only use part of them (one RISE, one
> FALL if supported, and another RISE for critical temperature (one
> supporting hardware thermal tripping if possible)). Also note that the
> indices in INTSTAT/INTCLEAR/INTPEND match the ones in INTEN, though I
> have not checked thoroughly if that is true for all the SoCs.
>
As per the manuals, we have to enable each corresponding bit for RISE and F=
ALL

INTEN          0x0070    Interrupt enable register
INTSTAT      0x0074    Interrupt status register
INTCLEAR   0x0078    Interrupt clear register

When current temperature exceeds a threshold rise temperature, then
it generates corresponding interrupt (INTREQ_RISE[2:0]).
When current temperature goes below a threshold fall temperature, then
it generates corresponding interrupt (INTREQ_FALL[2:0].

If we correctly configure the mapping of the RISE and FALL bits along with
INTEN, INTSTAT, and INTCLEAR, the interrupt behavior should function
as expected.

The following outlines the interrupt flow as described in the user manual

[1} https://usermanual.wiki/Document/Exynos20441220SCPUsers20ManualVer01000=
Preliminary0.167615881

/* Read the measured data from e-fuse */
Triminfo_25 =3D TRIMINFO[7:0]
/* Calibrated threshold temperature is written into THRES_TEMP_RISE
and THRES_TEMP_FALL */
/* Refer to 1.6.1 */
THRES_TEMP_RISE0 =3D 0x40;
THRES_TEMP_RISE1 =3D 0x50;
THRES_TEMP_RISE2 =3D 0x60;
THRES_TEMP_RISE3 =3D 0x70;
THRES_TEMP_FALL0 =3D 0x3A;
THRES_TEMP_FALL1 =3D 0x4A;
THRES_TEMP_FALL2 =3D 0x5A;
/* Parameter for sampling interval is set */
SAMPLING_INTERVAL =3D 0x1;
/* Interrupt enable */
INTEN[24] =3D0x1; // for INTEN_FALL2
INTEN[20] =3D0x1; // for INTEN_FALL1
INTEN[16] =3D0x1; // for INTEN_FALL0
INTEN[8] =3D0x1; // for INTEN_RISE2
INTEN[4] =3D0x1; // for INTEN_RISE1
INTEN[0] =3D0x1; // for INTEN_RISE0
/* Thermal tripping mode selection */
THERM_TRIP_MODE =3D 0x4;
/* Thermal tripping enable */
THERM_TRIP_EN =3D 0x1;
/* Check sensing operation is idle */
tmu_idle =3D 0;
while(tmu_idle&1) {
    tmu_idle =3D TMU_STATUS[0];
}
/* Start sensing operation */
TMU_CONTROL |=3D 1;

ISR_INTREQ_TMU () {
/* Read interrupt status register */
int_status =3D INTSTAT;
if(int_status[24]) {
    ISR_INT_FALL2();
}
else if(int_status[20]) {
    ISR_INT_FALL1();
}
else if(int_status[16]) {
    ISR_INT_FALL0();
}
Else if(int_status[8]) {
    ISR_INT_RISE2();
}
else if(int_status[4]) {
    ISR_INT_RISE1();
}
else if(int_status[0]) {
    ISR_INT_RISE0();
}
else {
    $display("Some error occurred..!");
}
ISR_INT0 () {
   /* Perform proper task for decrease temperature */
    INTCLEAR[0] =3D 0x1;
}

Hey, if you=E2=80=99ve got a bit of time, could you take a look at these ch=
anges?
[2]  https://lore.kernel.org/all/20250430123306.15072-2-linux.amoon@gmail.c=
om/


> Thank you,
> Mateusz Majewski
Thanks
-Anand


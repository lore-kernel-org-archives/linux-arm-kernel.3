Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03425C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bcaFXfQWjofieOOSzrQZuk2N3r45IQ/D1htHwwGLOY=; b=zXy1x4C/ZBstHPFL/M3Gur7GYm
	na0KCO3khI2XXrVbGZ3Zuof3Br6FogcVd/CZNSQGmjOg3vMgWrAaVI3Au04lTigDD/+8eXzRN809h
	CWYob31GpZApdIVUTE3qzgRwGimRecbzjXYE7BArlf82jYwfeDbIZpHdXgWMVKvj7AdANJFqjSqt+
	rT8cNX070QpsR2d6t8BWsibIz9h1IEl9fLBhq5VlaZdtg8q5bDnj3cWIhvwu3jPsjrFtuK9okoemN
	VNR2caG18/Zepub80C+/5604f7J1IYMtmk4zB0m8ZuUlIMcTy5bbCBWP8YBZ0T4t+KCsWd/KlNkoX
	SEi1LGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsVh-0000000HBzy-1Eyw;
	Sat, 21 Jun 2025 07:19:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsTR-0000000HBsZ-2OVB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 07:17:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad89333d603so467162966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750490231; x=1751095031; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/bcaFXfQWjofieOOSzrQZuk2N3r45IQ/D1htHwwGLOY=;
        b=II7oBFslUimhjal0j12LvTmDKkqULwx85NllM3tasVlUI/NBoL7QaZio3+PZ9WzXdX
         pTaeI4FeDVt4H9AHgIWEof1dbPXnBppcMAbyuCOT7F1ZR6zzk7LtPYlJ7VkfJ0f7xLnG
         8fiIErJC3kuvIeF5H7JHA1Cv9YODivC6QiqH8pZnyoa6q3JDDX0EYbsHY7tFQLkBtyWY
         /vEXtD8/pHzi+DRQZ3Q5EplrLrORPsSid+mhI5RfE37rkqFus3YShWFl/cQ9Xh/FV736
         FjcuTemZTTW/HMXjjZmoKYj5BDpz58vhGwK3pHX+Jv0rYjfqRQ7BLP/bJhnSSuKMNyul
         bsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750490231; x=1751095031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bcaFXfQWjofieOOSzrQZuk2N3r45IQ/D1htHwwGLOY=;
        b=s2xh2ONAHzvRsLFwVB22UZ4Qj7GMyiKPEGR5BJOhO8Jdip4PfyWSwssYrGTNby4WU6
         SNyMyiYb63SvAklCcNNPBfTlxwcjJ74kPpgbYMWCg0P8byIKvbmcTklJpRdbhJ+4DzXA
         tFDVaSZAeTXKTMyq5m4FkrCbne4opnCkSjE3+VsU7qhj1f+ZEvhh/O1W/CKt+N7J8N3i
         Al/ZMI/JxCqJ/B45bgT9QLHAp3yBWXg6rlf514N/JFAUYvpzOMf+wb9/AysP4hjuTfkq
         D7qr3KXdyTS8PKqZnyVL+WrOpdTRLww+7WOEOPbcTR6UWVh7TdFQbHwcQsnLnC7S0ANG
         WbnA==
X-Forwarded-Encrypted: i=1; AJvYcCX7rjP4C69cwbrSvadSdVQkaEmkwsoGnT/89cg9Uq9w4kXN7K2iCnxbQzmNBt6mC972ybDuPXzYjtv70n5i2F/N@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQ9DcMa5jAumTAk8+DlgDOJDhATu+Q59pGVYmO2AWdwgNh8Cr
	ylQCm4HkOf9lOvxnOOCSnk2MBa5+s2YCf1A5hn1Z5g/hLypUz+6yCLwE4bnXcCyvld8o7GF9E1x
	YeEKYhboXBSYRh+yJjRDwy5wQGrx3JJA=
X-Gm-Gg: ASbGncuHgTFR/CTQnVr4wQfR6bgB2LfmDEdrAwWAC25AJlmJrvL2IVChDGASb0BE8+r
	1L3D6AeKncnTasr+BBDMwk/MyyiLGYwY5uPKCOZmYskB9uSdhZ3NauD5CyDCmj2ONUweJCjgRST
	/0eoWrf7O66mG2i4sxRpPVF/31IEd7iwoVY6Y5U5Qidw==
X-Google-Smtp-Source: AGHT+IH66doWMpGtWOMFqbeLqscHl6eWKJT3vUmx953SEzxCv+zBCKw7VBGa8S2Rn8h7FbOcfjnLkvGiGRemhUti3i0=
X-Received: by 2002:a17:906:30cb:b0:ad2:4da6:f58c with SMTP id
 a640c23a62f3a-ae057bdea98mr459148666b.46.1750490231238; Sat, 21 Jun 2025
 00:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f@eucas1p2.samsung.com>
 <20250616163831.8138-3-linux.amoon@gmail.com> <20250618115211.2239335-1-m.majewski2@samsung.com>
 <CANAwSgRV=JT+qdAN=M46CZdWaSZnjazdw66fQETw7HeEcLSx8A@mail.gmail.com>
In-Reply-To: <CANAwSgRV=JT+qdAN=M46CZdWaSZnjazdw66fQETw7HeEcLSx8A@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Jun 2025 12:46:53 +0530
X-Gm-Features: Ac12FXyDzDmafHO30O7tOj_g1UTTGVYFB7ldEiK1JVaf1dtCf3kj-sESMmUqQko
Message-ID: <CANAwSgQ=G1yJXOg1LdeEf-J56epyNiohCSdNYUvs2AHNv90Hkg@mail.gmail.com>
Subject: Re: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature threshold
 interrupts and clear corresponding IRQs
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_001713_614861_65F375E1 
X-CRM114-Status: GOOD (  33.29  )
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

Hi Mateusz,

On Thu, 19 Jun 2025 at 11:15, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Mateusz,
>
> On Wed, 18 Jun 2025 at 17:22, Mateusz Majewski <m.majewski2@samsung.com> wrote:
> >
> > Hello :)
> >
> > > +#define INTSTAT_FALL2        BIT(24)
> > > +#define INTSTAT_FALL1        BIT(20)
> > > +#define INTSTAT_FALL0        BIT(16)
> > > +#define INTSTAT_RISE2        BIT(8)
> > > +#define INTSTAT_RISE1        BIT(4)
> > > +#define INTSTAT_RISE0        BIT(0)
> > > +
> > > +#define INTCLEAR_FALL2       BIT(24)
> > > +#define INTCLEAR_FALL1       BIT(20)
> > > +#define INTCLEAR_FALL0       BIT(16)
> > > +#define INTCLEAR_RISE2       BIT(8)
> > > +#define INTCLEAR_RISE1       BIT(4)
> > > +#define INTCLEAR_RISE0       BIT(0)
> >
> > > +     /* Map INTSTAT bits to INTCLEAR bits */
> > > +     if (val_irq & INTSTAT_FALL2)
> > > +             clearirq |= INTCLEAR_FALL2;
> > > +     else if (val_irq & INTSTAT_FALL1)
> > > +             clearirq |= INTCLEAR_FALL1;
> > > +     else if (val_irq & INTSTAT_FALL0)
> > > +             clearirq |= INTCLEAR_FALL0;
> > > +     else if (val_irq & INTSTAT_RISE2)
> > > +             clearirq |= INTCLEAR_RISE2;
> > > +     else if (val_irq & INTSTAT_RISE1)
> > > +             clearirq |= INTCLEAR_RISE1;
> > > +     else if (val_irq & INTSTAT_RISE0)
> > > +             clearirq |= INTCLEAR_RISE0;
> >
> > This implies that only these 6 bits are used. Is this true for all SoCs
> > supported by this driver? My understanding is that Exynos 5433 in particular
> > uses bits 7:0 for rise interrupts and 23:16 for fall interrupts. When I tested
> > this patch (both alone and the whole series) on 5433 by running some CPU load,
> > the interrupt seemed to not fire consistently:
> > /sys/class/thermal/cooling_device1/cur_state would never go above 1 (which is
> > consistent with the interrupt firing once, not getting cleared and never firing
> > again; without this patch, it consistently went up to 6) and I got a quick
> > reboot every time.
> >
> Thanks for the feedback,
>
> As per the user manual Exynos4412
> INTSTAT and INTCLEAR have a clear mapping with bits
> falling 20, 16, 12 and rising 8 4 0
>
> whereas Exyno5422 has
> INTSTAT and INTCLEAR have a clear mapping with bits
> falling 24, 20, 16, and rising 8 4 0
>
> Yes, it could differ for all the SoCs,
> I don't have the user manual or TRM for these SoCs
> to configure correctly.
>
> I tried to configure this, referring to the comment in the driver
>         /*
>          * Clear the interrupts.  Please note that the documentation for
>          * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
>          * states that INTCLEAR register has a different placing of bits
>          * responsible for FALL IRQs than INTSTAT register.  Exynos5420
>          * and Exynos5440 documentation is correct (Exynos4210 doesn't
>          * support FALL IRQs at all).
>          */
>
> By the way, I don't see Exynos5433 and Exynos7 support
> INTSTAT and INTCLEAR registers. We are using TMU_REG_INTPEND
>  to read and update the same register.
>
>         if (data->soc == SOC_ARCH_EXYNOS5260) {
>                 tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
>                 tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
>         } else if (data->soc == SOC_ARCH_EXYNOS7) {
>                 tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
>                 tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
>         } else if (data->soc == SOC_ARCH_EXYNOS5433) {
>                 tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
>                 tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
>         } else {
>                 tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
>                 tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
>         }
>
I don't have Exynos  Arm64 boards to test on

I believe the Exynos5433 and Exynos7 also use the same
register addresses for INTSTAT and INTCLEAR.

[1] https://github.com/universal5433/android_kernel_samsung_universal5433/blob/lineage-18.1/drivers/thermal/exynos_thermal.c#L854-L892
[2] https://github.com/enesuzun2002/android_kernel_samsung_exynos7420/blob/nx-9.0/drivers/thermal/cal_tmu7420.c#L14-L221

If you have details on how INTSTAT and INTCLEAR are used
particularly regarding the update bits, please share them.
Specifically, I'm interested in how bits [7:0] correspond to rising edge
interrupts and bits [23:16] to falling edge interrupts
I feel it's the same as Exynos54222.

Can you test with these changes? If you have any suggestions,
please feel free to share them

Thanks
-Anand


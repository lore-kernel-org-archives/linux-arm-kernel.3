Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F129C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKAUYboHkuuwUmlAEHIaacn6NB6oYrxQ9WGKRISWuqk=; b=efdPR0WPUmqeCa9ZdWqoR0TYDZ
	O7FkizuLrncRtntbdmwGgNG0MTVNINn5wStpWdqpyThn/5QivHIMCGBDhS/dquQeON49mfdoRIQKs
	pCvtNw7Rny6AUtGmrdZPIIohKlyPrxBzZIBOEuaaXG5zlUrRYmsAN53xJeaQDeWzEOPNEoSrdH2HU
	+CgJ2/sPMAPny5AWyjO3QQ4Tv/+gDp/Tlc695Yg0tnUzYMboqhIaEsKLv2g6FA+12Ic13lPyjxVQg
	mTwCwxrEJcJp+0EkbKiRVwPDPrUUSkAeXNUsa/4lViWq38YgCg5oRWFDDwUtn9g53/7CBJjuOp/EZ
	eLEqyusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Ot-0000000C7fw-03Vt;
	Thu, 19 Jun 2025 06:05:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS868-0000000C5Oq-1VlM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:46:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad8a8da2376so53728566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750311963; x=1750916763; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rKAUYboHkuuwUmlAEHIaacn6NB6oYrxQ9WGKRISWuqk=;
        b=FJs8CNKS/QGJrpBiZ5E6e6Jxrk2J4dp4g2euyGAqLFsLnPCmMsXz8iM0mlpUPObWhx
         3DL3uo1zK5dscI+kkbzN3j6PA13fpf9NSNUs6F70wGdZyBdPAwEvxnCZVduSCGyRtxLD
         bjI9jAHDnvTjMAErN8Q85569dlOtskGE0I8Bs+OuZjHpU95Kt/zmZFKqPZ/XjidPzh7G
         KkJHujfvL/rSMlJpA59JdgrC5UYI1KLl6oowiydBCN9ToFlqT5wykz0mALbgmbcxwOC+
         deYvJe212kVfuVADPhIVrWfLITLkXF2wooapTI+gOA+LWI9ggmKBuVVmwdEBmfuIunc8
         laTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311963; x=1750916763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKAUYboHkuuwUmlAEHIaacn6NB6oYrxQ9WGKRISWuqk=;
        b=YupVAD7st1VzbgZclDovIsrA/HPj16UXYfkuArd+RyZu7YPNROpTet2/xeBlMjx1IK
         k98h2EJYgV6ZSRwISPsV3HdFl/22ZTt7vd3qtQ0xYDRrqM12YdgDaw3/uSV+djibarZn
         Bt/Pbi4qo5QaUnxF/ClltbS9K/vSzZ7a2U+pTTIUV9WlekGZSN2+ZdpTF1K6uH0pqqTR
         5BopoImQ4FVGYdx/umTUHyRK24wrZ08aMF5ubvtcZihIaZnSzUDJA3+wwL0NzPASLspX
         0+PSSGtjeU6OiXczU7T1B2YiMLs4fraz0ZbvTYqrjXXx9zk69n2gY+r3oULzZ3IYVTJm
         fPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLfczJAjSNKeGIkJSFMjnwRvp5tnNMxolh3F+PFkSowZrM0KAuO3ueFCoZ8K69dMDVS3oG8cH/aFEnYkRbZpTA@lists.infradead.org
X-Gm-Message-State: AOJu0YzwDG5uGwYx76RhZmCWF+79jJSv9KUIIoxQHxdpsTLBjclAZ8/1
	DKdMSou2/VCtDOH7CagQeK5gRNFueUFJSohWpQjXKBTTbvDEoo1SXt7JEiBYUQPwRNMCzX1Le+R
	Gn2/XekpE6HoA5ZFTEghddDAaoJrRFb4=
X-Gm-Gg: ASbGncv/AEm7Epnw/SrnVwbP8ikhyu0zqcWnXtwJmdTkGjsZ7xsUpuYu6XgpzrkoEml
	uxuB/boFA9Bz7IcNE8JoiGEIEOtb10QGipAArr3tkQtOKgFpRxRSgC/1XqEd2Dl50nc/54T4btQ
	/MjkXPSdQHhyfX6/Jk/Id8P1pYWE8d7u/EpuyTllPE7A==
X-Google-Smtp-Source: AGHT+IHqjpV+nZYSmGvYxmGFNRO50Tri+Llb+PMo2Om+LTMx4zqLyhSevKBPdts3VbuB6zf8mJvTk3wNS+h3GEbuDQI=
X-Received: by 2002:a17:907:3d8b:b0:ad2:43b6:dd75 with SMTP id
 a640c23a62f3a-adfad2a1ff8mr1916244766b.10.1750311962730; Wed, 18 Jun 2025
 22:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f@eucas1p2.samsung.com>
 <20250616163831.8138-3-linux.amoon@gmail.com> <20250618115211.2239335-1-m.majewski2@samsung.com>
In-Reply-To: <20250618115211.2239335-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Jun 2025 11:15:44 +0530
X-Gm-Features: AX0GCFvmk_wGVlRXfnhPM_Q_4DB5diREj6R5zYA0aszITzoiDTH5uE97mHC1m7Y
Message-ID: <CANAwSgRV=JT+qdAN=M46CZdWaSZnjazdw66fQETw7HeEcLSx8A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250618_224604_400967_4122C0FE 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed, 18 Jun 2025 at 17:22, Mateusz Majewski <m.majewski2@samsung.com> wrote:
>
> Hello :)
>
> > +#define INTSTAT_FALL2        BIT(24)
> > +#define INTSTAT_FALL1        BIT(20)
> > +#define INTSTAT_FALL0        BIT(16)
> > +#define INTSTAT_RISE2        BIT(8)
> > +#define INTSTAT_RISE1        BIT(4)
> > +#define INTSTAT_RISE0        BIT(0)
> > +
> > +#define INTCLEAR_FALL2       BIT(24)
> > +#define INTCLEAR_FALL1       BIT(20)
> > +#define INTCLEAR_FALL0       BIT(16)
> > +#define INTCLEAR_RISE2       BIT(8)
> > +#define INTCLEAR_RISE1       BIT(4)
> > +#define INTCLEAR_RISE0       BIT(0)
>
> > +     /* Map INTSTAT bits to INTCLEAR bits */
> > +     if (val_irq & INTSTAT_FALL2)
> > +             clearirq |= INTCLEAR_FALL2;
> > +     else if (val_irq & INTSTAT_FALL1)
> > +             clearirq |= INTCLEAR_FALL1;
> > +     else if (val_irq & INTSTAT_FALL0)
> > +             clearirq |= INTCLEAR_FALL0;
> > +     else if (val_irq & INTSTAT_RISE2)
> > +             clearirq |= INTCLEAR_RISE2;
> > +     else if (val_irq & INTSTAT_RISE1)
> > +             clearirq |= INTCLEAR_RISE1;
> > +     else if (val_irq & INTSTAT_RISE0)
> > +             clearirq |= INTCLEAR_RISE0;
>
> This implies that only these 6 bits are used. Is this true for all SoCs
> supported by this driver? My understanding is that Exynos 5433 in particular
> uses bits 7:0 for rise interrupts and 23:16 for fall interrupts. When I tested
> this patch (both alone and the whole series) on 5433 by running some CPU load,
> the interrupt seemed to not fire consistently:
> /sys/class/thermal/cooling_device1/cur_state would never go above 1 (which is
> consistent with the interrupt firing once, not getting cleared and never firing
> again; without this patch, it consistently went up to 6) and I got a quick
> reboot every time.
>
Thanks for the feedback,

As per the user manual Exynos4412
INTSTAT and INTCLEAR have a clear mapping with bits
falling 20, 16, 12 and rising 8 4 0

whereas Exyno5422 has
INTSTAT and INTCLEAR have a clear mapping with bits
falling 24, 20, 16, and rising 8 4 0

Yes, it could differ for all the SoCs,
I don't have the user manual or TRM for these SoCs
to configure correctly.

I tried to configure this, referring to the comment in the driver
        /*
         * Clear the interrupts.  Please note that the documentation for
         * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
         * states that INTCLEAR register has a different placing of bits
         * responsible for FALL IRQs than INTSTAT register.  Exynos5420
         * and Exynos5440 documentation is correct (Exynos4210 doesn't
         * support FALL IRQs at all).
         */

By the way, I don't see Exynos5433 and Exynos7 support
INTSTAT and INTCLEAR registers. We are using TMU_REG_INTPEND
 to read and update the same register.

        if (data->soc == SOC_ARCH_EXYNOS5260) {
                tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
                tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
        } else if (data->soc == SOC_ARCH_EXYNOS7) {
                tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
                tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
        } else if (data->soc == SOC_ARCH_EXYNOS5433) {
                tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
                tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
        } else {
                tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
                tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
        }

> Thank you,
> Mateusz Majewski
Thanks
Anand


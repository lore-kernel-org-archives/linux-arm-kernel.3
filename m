Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E2C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jjFd06z6IyDDI66ky5VMT2OuzWH5udSZsV9RTM3AcA=; b=1iKCYWGAU7orDSREENRqDSjqLy
	MgSx6rBX/6JreoCcOvhiZc4D2b+FtuMuHvLpaJcwpqLpDnMQSaNG8TKaqZtfKL22+ozcHpfLxtOWh
	gVsLjxkZ/XjaZtH29Nysh2e9ZeTgHI1aqqfq0qsGpuC4SZP992Oc2iC06dUyNRNoDSN0B9DgfBQJF
	PZL4GRLkMwNhAWIBITPllncLcDDLOkoJ8wkoTgSX/6UA6Y1EKMSiYgM90KAibWGQk3znDgpHVcs9N
	65Lo/MvEhrHP083Z0aaFkthgtDYNVIRTHgCYRfc0sqgWsUqKJHvkLFYPgeH/CRzNGvRvqbebFr8IW
	EwroVvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSG-0000000CT3r-1fEf;
	Thu, 26 Jun 2025 18:36:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrFR-0000000CS1W-3YGU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:22:58 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so2704347a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750962176; x=1751566976; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2jjFd06z6IyDDI66ky5VMT2OuzWH5udSZsV9RTM3AcA=;
        b=QGOvEzj/VKTD5apeWGbhkUZgMQyVrf8hsAcYoG1zye6fiXDmhqKzMRXL5LbJvm6ZMp
         nkCMhhOCtrZ0siK8LJFjaY6TIPVS/SsBkRzRadgLYyuxms4DwwGQ3DkFwiJcmVLPq+sS
         UwoWT0U0ZS96th4Yj1lixvJzn+m8aZu/xDY8WDYmm+DxuSIDr2Ez6uEXUiCwNe40fkFc
         /pPzFyBSuzyOqOTztwzGTqMVquI/afgWWKK/2fX/whpWS4JCQ5yTbvMaRqNxh981tWQO
         LH4x8uHH3kbYqzzkkvDMGaSzJ409+pLhZcQIcTi4sIJamra9tE3SKol94f82IGtR5AxV
         C/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962176; x=1751566976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jjFd06z6IyDDI66ky5VMT2OuzWH5udSZsV9RTM3AcA=;
        b=pix8EcmjcLhGHTZrVFlP8VX5DYguuIGgRhFrrGYLnNqSHbqiLhxaQ8R+AhbX/ibKNu
         WpMuLFbzVDoRcGLnaQ1HlNUGRPvuJLna0Js7HfBQPR0kselq22VnOGfYj1v1UpNhOGPD
         RRQl5T1UfUpIC8kDVdyWtp7INSZmyTrKzOFoZ0Am9LwZYGMn5l4dQDkkSXCeXP+/5PBQ
         IEdYXxh2IueGSh+G8vTC0ei+rIIfdf1L1tvBkTtaEjrHUIsKFSS3qMbk4S7/SjTKBZCu
         V733WDcJjA2czn6x1bhsXGed1s+I1lPcoXmay3AePZ+gh2Gb/Fug8env1LQuqX3cQLQ4
         Djdw==
X-Forwarded-Encrypted: i=1; AJvYcCWhX8KK2P2nWbHwXIoFb9lnA9dFkQaBYeomBObVd6FJg1JxrdIdRlWece9vVCT6D/TpmSgxWUPkl6SAei28hI5S@lists.infradead.org
X-Gm-Message-State: AOJu0YwQwv0o6EL163/lMxDHe+QMseye/SNwZ0MubT+19AtBxxbHfSrd
	HSHd1n2Tmjyy3FkmOIbabiOmEnzCPxHfrRUjuhVMe6vowncqaGrxfMqxYu+8yUtbrZ8yZXecf+2
	O280dze2ZOoVZN8C1O1p7Y2GW8ekUPSM=
X-Gm-Gg: ASbGncv8SESwFJ7oQz2hQyWoRD+FiO8IL2OyQxOAtihUGBKL/WJuBjUn5jTdGZ89FUE
	md5gq5h7m8ous7M00XimcEWSbNXz6HwzS3tq5/Bi+gr+tWh+kpv0YPEt8zhWJrgHLBDwJgLonZZ
	lB78RvZmguKhrD9hKY5T+qtQ+8PDGiJjmCOelPuSgx
X-Google-Smtp-Source: AGHT+IG/HBm4E++R0k9lVC/+RTAtOGgRPzPIB8sRecM543yqweD9y/t71VbdBQVT8JhWrXiQVwMv9oGAJcReShdI/Vc=
X-Received: by 2002:a17:907:d78b:b0:ae0:af6c:680 with SMTP id
 a640c23a62f3a-ae34fd3311fmr10304266b.2.1750962175894; Thu, 26 Jun 2025
 11:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a@eucas1p2.samsung.com>
 <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com> <20250625143816.1146123-1-m.majewski2@samsung.com>
In-Reply-To: <20250625143816.1146123-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Jun 2025 23:52:38 +0530
X-Gm-Features: Ac12FXzSOcbN1qjL1eCS7VucajWs0aI1NpEXfUMgJBZoyRlg-bsb2m048szqtZE
Message-ID: <CANAwSgTdOyOxhBuFypyJpwjBVa+uKO9R3+6DMYOrnjsC5xvUZw@mail.gmail.com>
Subject: Re: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second
 mapping and references
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_112257_884797_C660301B 
X-CRM114-Status: GOOD (  31.72  )
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

On Wed, 25 Jun 2025 at 20:08, Mateusz Majewski <m.majewski2@samsung.com> wrote:
>
> > Can you check with with following changes
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c
> > b/drivers/thermal/samsung/exynos_tmu.c
> > index 9fc085f4ea1a..0776801fafea 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -469,14 +469,11 @@ static void exynos4412_tmu_initialize(struct
> > platform_device *pdev)
> >         ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
> >         ctrl = EXYNOS_TRIMINFO_RELOAD_ENABLE;
> >         writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
> > +       return;
> >     }
> >
> > -   /* On exynos5420 the triminfo register is in the shared space */
> > -   if (data->soc == SOC_ARCH_EXYNOS5420
> > -           data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
> > -       trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> > -       sanitize_temp_error(data, trim_info);
> > -   }
> > +   trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> > +   sanitize_temp_error(data, trim_info);
> > }
>
Thanks for the feedback,
> This does seem to work (tested on 3250 and on 5420) in the sense that I
> can read the temperatures, when they increase the state of the cooling
> device gets increased, and the values look reasonable and stay in a
> reasonable range. Hard to say if the trim and the temperature values are
> correct, though.
>
The driver should read the EXYNOS_TMU_REG_TRIMINFO register
after setting the RELOAD bit to 0x1 in the TRIMINFO_CONTROL (0x14) register.

RELOAD Trim information
Before read TRIMINFO, you shall set RELOAD to 1.
1 = Reload

> (FYI I will probably have a harder time regarding the drivers from
> GitHub you linked in 2/3, so no promises on testing them.)
>
It's just a reference point for gathering information - a few things
are missing in the driver.

> > As per my Exynos5422 user manual and DTS mapping
> > thermal-sensor tmu@10060000 is mapped to CPU0 with tmu_apbif clock
> > thermal-sensor tmu@10064000 is mapped to CPU1 with tmu_apbif clock
> > thermal-sensor tmu@10068000 is mapped to CPU2 with tmu_apbif clock
> > thermal-sensor tmu@1006c000 is mapped to CPU3 with tmu_apbif clock
> > thermal-sensor tmu@100a0000 is mapped to GPU with tmu_triminfo_apbif clock.
>
> Hmm, I might be missing something, but I think the DTS does link to two
> adresses and two clocks, for instance for GPU (in
> arch/arm/boot/dts/samsung/exynos5420.dtsi):
>
>                 tmu_gpu: tmu@100a0000 {
>                         compatible = "samsung,exynos5420-tmu-ext-triminfo";
>                         reg = <0x100a0000 0x100>, <0x10068000 0x4>;
>                         interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&clock CLK_TMU_GPU>, <&clock CLK_TMU>;
>                         clock-names = "tmu_apbif", "tmu_triminfo_apbif";
>                         #thermal-sensor-cells = <0>;
>                 };
>
> The manual does indeed not say anything about this, but I feel like the
> current code in essence states that the manual is not correct. We
> probably should have some evidence that the current code is wrong and
> the manual was correct all along?
Well, I tried to fix the DTS, but it didn't work.
>
> Thank you,
> Mateusz Majewski

Thanks
-Anand


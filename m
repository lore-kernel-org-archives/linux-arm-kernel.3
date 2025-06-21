Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93F0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo59aSl355A+wShZW/KV0Ru3ekeBmk5oXEnZ7H/l/wg=; b=xrrCbmZGlQNZwEqJpdqZNZY7YO
	DSTRnlkP0SzCnZP8qrwYuGdhQi8L0etR9h6PLH3bbYRP+riG6IX7q3jMdiByrbiCSKS71RqL4x1y6
	kiFzSKBmkMQz9fax6DG5AFQofdGUsC6lySpjMHgElCdmDN/26DPJUPbq9HBYM5JYljjYxfeWDMrA6
	M/qdgEOo2t2WRdvESCCJylxzi9rMmzD7fnjV6X3gXmkjxRv3uUezFQPh84HrEpct5IMSqeOLkDsHf
	KM6EgRFJ1iTPeRZ/rJMLymLq1dpgEGZ7z+GnoWXcGEKVBP5CRcszCmvKBkX60so1GTjv7lwYrOexJ
	ej1d6cAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsXt-0000000HCAp-44iF;
	Sat, 21 Jun 2025 07:21:49 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsTp-0000000HBv5-2I8Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 07:17:38 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so4691882a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750490256; x=1751095056; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo59aSl355A+wShZW/KV0Ru3ekeBmk5oXEnZ7H/l/wg=;
        b=GQLEWURSlomqMdfPU43DgUKbczYCPhAtjiEI1gkPviEY69xggQumEVqdSpf1cmBKRP
         Tpn8wLRmu7OtOBjnsNctv7hNWiA4Ltegbex/mPd1vgRAQCD3n2X59Lv6hPe0A+APmxwS
         xtOnPjz8F3fuF96R/InHdfrZZ8Nv4HYOcUoHg0Eu3IFTFI9HS68T0SDw3+UozMbSm8Oc
         OHWmSxaUXAx6fG//pA5w9QBoMchnh/gK6wuykmC2CuKg2EHRxvXp95iJlIcLzdCCovju
         1NhmIleMsY36K/vGYHhrhcIYy3mXL32XydSn8IX5tTxSdaTU8woveQTcMmcasmXkkqUh
         ftbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750490256; x=1751095056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bo59aSl355A+wShZW/KV0Ru3ekeBmk5oXEnZ7H/l/wg=;
        b=knQCLaWxf3MVOG0giNcPyDKEmI+6ssQU1KY8F34Zqoj2MXywKtiqrLcoge7dBZ1iP0
         OJTdHGg2/YSGkRxMeGKZm4nrX0SEUm3NTwbaNbgF54VmqJ9XYdqGOwNaLI3bass2Hjs8
         Z1HWfecyh2HmOqxyDK8Ef6sK9WUjVX0X9aG1p3FpxdYC78leATt0dEzdTeieRLxPvMim
         5Jcl9nI7DURN2OzsMK3F5FkiyZ+1LAt2qMbM+uTqkHjhNGdPnsbOTH4k+94Hwd7B9G+K
         YRZeNN+y9iE4cncg+FAYOENpkp0XulrM1RHfeM5TJBh0mbn8TvFzmITmhePOcY4lM9NF
         PfpA==
X-Forwarded-Encrypted: i=1; AJvYcCVuHR5xyXNSPa5oFbgTSVzdO3UgYHNjb/KIzLFb+Axe+94E3qrF6GT/Jf6owMMgni4Us+sg1hsNDdZEVjUrIQyn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8Y7+xX8xKC357kPwC8MwxvKEieLpGB5UtIrGVH+lMKy/EiSE
	KhfuwrBCldqbA5pzUGgIUZWvxPbfvJH86Thtq7AwmEVILRp3FuMubZBWqCrcktNb96Fgz/JKKaR
	eyLbH2eUYzbTupZrDC5xZxRC9EajYhMY=
X-Gm-Gg: ASbGnctOOSacKrDCHItfenZOnkTe2o3uzte1Bkn/NYoGsES/Gp9AV+KQMffc+lVSyGm
	tC91lBRy6CFO+GtckZtYPqhizPGFUx9s0rhJXlVe0zXLo0aoiXRtbXHCmQqjleG5D3KAjolPIE5
	6KGfmwQGykgTPD8Wjd9ZLcywEXST33KNpWecrYVBS/rg==
X-Google-Smtp-Source: AGHT+IFJDhovq12Hf4eA4SNosqcCft5uT2vIt6ARrg45/n4N8HVFpkpi6/xoPTExRyFmBOJk7i7Y6xznFo8rDhMVMXI=
X-Received: by 2002:a17:907:3d86:b0:ad5:8412:1c9 with SMTP id
 a640c23a62f3a-ae057c709afmr512391466b.59.1750490255672; Sat, 21 Jun 2025
 00:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d@eucas1p1.samsung.com>
 <20250616163831.8138-2-linux.amoon@gmail.com> <20250618125806.2260184-1-m.majewski2@samsung.com>
 <CANAwSgQ-NFBtUareFmRzNVuKTSC8Vp7HTA0psBqYu2r=aqAGxg@mail.gmail.com>
In-Reply-To: <CANAwSgQ-NFBtUareFmRzNVuKTSC8Vp7HTA0psBqYu2r=aqAGxg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Jun 2025 12:47:17 +0530
X-Gm-Features: Ac12FXx6b9_Iy6FveNsY4BBaQRZfx2OrqYMft6MDANpLfMD2oPkqTyGtIAq5PSo
Message-ID: <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250621_001737_583298_F312388B 
X-CRM114-Status: GOOD (  26.44  )
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

On Thu, 19 Jun 2025 at 11:15, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Mateusz,
>
> On Wed, 18 Jun 2025 at 18:28, Mateusz Majewski <m.majewski2@samsung.com> wrote:
> >
> > >       /* On exynos5420 the triminfo register is in the shared space */
> > > -     if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> > > -             trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
> > > -     else
> > > +     if (data->soc == SOC_ARCH_EXYNOS5420 ||
> > > +                     data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
> > >               trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> > > -
> > > -     sanitize_temp_error(data, trim_info);
> > > +             sanitize_temp_error(data, trim_info);
> > > +     }
> >
> > If I understand correctly, this means that the triminfo will no longer
> > be read on other SoCs calling this function (3250, 4412, 5250, 5260). Is
> > this intended?
> >
> Thanks for your feedback.
> I will remove the data->soc check for Exynos5420 in the next patch.

Can you check with with following changes

diff --git a/drivers/thermal/samsung/exynos_tmu.c
b/drivers/thermal/samsung/exynos_tmu.c
index 9fc085f4ea1a..0776801fafea 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -469,14 +469,11 @@ static void exynos4412_tmu_initialize(struct
platform_device *pdev)
                ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
                ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
                writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
+               return;
        }

-       /* On exynos5420 the triminfo register is in the shared space */
-       if (data->soc == SOC_ARCH_EXYNOS5420 ||
-                       data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
-               trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
-               sanitize_temp_error(data, trim_info);
-       }
+       trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+       sanitize_temp_error(data, trim_info);
 }
>
> > By the way, are we sure that data->base_second really is unnecessary?
> > According to the bindings documentation (in
> > Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml),
> > the different address is necessary because the triminfo registers are
> > misplaced on 5420.
>
> As per my Exynos5422 user manual and DTS mapping
> thermal-sensor tmu@10060000 is mapped to CPU0 with tmu_apbif clock
> thermal-sensor tmu@10064000 is mapped to CPU1 with tmu_apbif clock
> thermal-sensor tmu@10068000 is mapped to CPU2 with tmu_apbif clock
> thermal-sensor tmu@1006c000 is mapped to CPU3 with tmu_apbif clock
> thermal-sensor tmu@100a0000 is mapped to GPU with tmu_triminfo_apbif clock.
>
> Well, we are using tmu_triminfo_apbif to configure clk_sec, which is
> using the data->base to enable the clk.
> So, data->base_second is not used any further in the code after we set triminfo

Thanks
Anand


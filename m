Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=; b=CkNbq8vbz5VC4wMFpT+hcHmRfE
	vAqbeZ9HsOEG6VBLNGw8IT/Xf3Rb6VbBXNCtiQ9wGI/UnbpJVxoXAFqrf1+/veVwhQ78C0HODUcQB
	b6pbkiR/FcEo0SyHlls52JVb/222Adr7c3Y1Rd+69KNROOcknxx79S9dVDju4I+2tMTadz7sQ+dPS
	6CND99s4UZd4MLHAaB2EtvGkLuGaUhk0eAq/jurGbgvqgs8IF9ltqTFibPLmRcMxjMKrSEQOFehBb
	Ef3xcRf6r0DYtjoCsn+uEKcXPMDDz3GP0irAigTatRTuMw1eop4j+2ttG2A2VWcRzZ3nMvOSIG4cr
	Z88jEaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgyT-0000000GH8O-0YuO;
	Thu, 29 May 2025 17:23:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgwJ-0000000GGzT-2rQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 17:21:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7376e311086so1159265b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748539270; x=1749144070; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=DgxLZJGicfyTEeHo8Z9dEGt+wlHHo+QYjWP2wCvzGkW0RJWrcFcE5UX0XYrL4UKhyt
         1nPerF9N7FbFrSls70R6StShyJavNxftCmBk4Y0IF5gTVmUi2DLhq4qQnGmlNII9FULI
         ISG3KllSrIXfj5YwiS6PWFgLmN61amEXUQv5SkFNZfqjiY0Ks4Tx91TSjga9XTtHvc3p
         Z/0XGqeFV5umcoEzuuQif2Mp7BxVGsV730d/OOVImU57eaXfbu9r4Jc4Qa6nUNY4ICvt
         /XfH/IkqVPqfJ4Zx4ZrO/pQAefh1d8XxIn5cSbP+9pkKX2c0XZ1AwKFPpjppaw5te4gz
         GZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539270; x=1749144070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=SrOxXfCnwKN4AFN1Dgkac3lcbYGUlfnszkirPgU47Gn+uOC8T95j4vxPELrsHYJ77P
         VI4t3nV8FYcelI6NBpoejzie5GKcTmT20RhKZSJURSqs+YUQDlNmdr3uW2NWz7i1RPLh
         N7PY1jD3CAIlbF+oivUAOh+rXKA8cytlGA4/hhy/E7Qvp0xcW6O0Oa4I2O1Cp2rW1l0+
         3+2d6JkPVEzvjZRmOwfr3zGB0WdXF4UyvR/odt3oZsaP/fzGaH/VF/3OvEMJOQecMBzB
         ExTJ5WHUTur3UX6xt1z7QjtyHj1X7DdOA7BDApCwRHIe8nJv/Yr83oqiUBk7BvJmrUF2
         dpSw==
X-Forwarded-Encrypted: i=1; AJvYcCVF0j/ALUcVLNzLFa/PMQ8YcbLGBgrxde7qkKXAtDE+91BoKF5WBE2aoEDb0F9n6NjvxRrmdD7zs9yYB9yBI41G@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6eYs4Mc4X5u5Pz5gpkFHrc6XEanKuatkI8OLZIBvWkX4NwtPn
	Er4+YH8894ZnNOjIZGy9uvLFHH+JiQfh8OVCmueeZudHQMKBXTJ6HAlgPHNqe+R3woA=
X-Gm-Gg: ASbGncsnzwLwT3teuXBd24kb18zGB7aHGJMXU58F+eKYfX4cp8W2xyhgnurVvk7ad5i
	qySVNPVx/7GHf/pjAIqL5XOLeZoNeAG9MUF1OVSReJeG9ab/Tgo5BMoZpzxXpq1FZB5evRV59f7
	AZhMZKzlFi2MSNwUoU/EdoE9moT/5CZ6pUMu8jlQfwEo1uz4ukM2Bh2BFxD4SrV9AP3qsmLINQb
	Xq5jzBtnHDmplvpXFbEGE/w9D9f98tI+cDMfQCQqkmCrNQKhfqAk6XX0yAbE1YfD28TxfQctYGC
	hnoRS6s19jFpq0eXjx7ucv64lw8UKMmaLt+m1aAS7wTDb4CAceUm1GEtjKEL
X-Google-Smtp-Source: AGHT+IH1834zzk2lUOPVUHGH3EeY98SO550LzAmtRD9p+dqmamQc9GnfdhVQPk+w3gTCeLfLx3OdJA==
X-Received: by 2002:a05:6a20:93a1:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-21ad94f971amr763041637.5.1748539270578;
        Thu, 29 May 2025 10:21:10 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm214068a12.57.2025.05.29.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:21:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sukrut Bellary <sbellary@baylibre.com>, Russell
 King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <7hbjs3tf1j.fsf@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
 <7hbjs3tf1j.fsf@baylibre.com>
Date: Thu, 29 May 2025 10:21:09 -0700
Message-ID: <7hldqfnxiy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_102111_721185_E0482274 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> Sukrut Bellary <sbellary@baylibre.com> writes:
>
>> Enable Power management related defconfigs for TI AM335x[1].
>>
>> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
> Arnd, can you take this via the SoC tree please?

Looks like this slipped through the cracks for v6.16.   Could you apply
this for v6.17 please?

Thanks,

Kevin


>> ---
>>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 37e3baa33b67..1d2600b5f975 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>>  CONFIG_EDAC_LAYERSCAPE=y
>>  CONFIG_EDAC_HIGHBANK_MC=y
>>  CONFIG_EDAC_HIGHBANK_L2=y
>> +CONFIG_RTC_DRV_OMAP=y
>>  CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_AC100=y
>>  CONFIG_RTC_DRV_AS3722=y
>> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>  CONFIG_EXYNOS_IOMMU=y
>>  CONFIG_QCOM_IOMMU=y
>>  CONFIG_REMOTEPROC=y
>> +CONFIG_WKUP_M3_RPROC=m
>>  CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>>  CONFIG_KEYSTONE_REMOTEPROC=m
>> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_SOC_TI=y
>> +CONFIG_AMX3_PM=m
>> +CONFIG_WKUP_M3_IPC=m
>>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>>  CONFIG_RASPBERRYPI_POWER=y
>> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>>  CONFIG_EXTCON_MAX8997=m
>>  CONFIG_EXTCON_USB_GPIO=y
>>  CONFIG_TI_AEMIF=y
>> +CONFIG_TI_EMIF_SRAM=m
>>  CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_EXYNOS5422_DMC=m
>>  CONFIG_IIO=y
>> -- 
>> 2.34.1


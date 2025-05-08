Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyuniMudFryF3hn/u/aLddug+sED3jw9d54qmOZEBFQ=; b=1S4/bEl8JiUnzM83v9YjD4kHSx
	cN9UrOE7wAYCS0czfzO7fxmx16gjld4LnT6vONv8QN0hmX9u5MttjNMJgppc7LuMigxxJxj/O1w5W
	cgDHMo1xK9695FbSHyNjPVpyxyDu0mjXFMQW8bBv9I8cAxmircT/F3y6rPTECXEoLkkeSXEto/Rcw
	h0l5wkpWyu4TmWfqp/g3yv1KxqLCw3S1TDqrikPCxEttJ8LKWBs0PnwdYfgsWHdzyNFC+xqRncze5
	7yZGYDIvvn8r6z2jV9e5nIUGZpfiHGeV9ZbbjV5F19sDoaRJL6gF38A9l0Vt5hzURrYA0iuLNQFUK
	ADj+c3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Cn-00000000js6-0Te6;
	Thu, 08 May 2025 13:22:29 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Ap-00000000jfU-0Ec8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:20:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so977609b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746710426; x=1747315226; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyuniMudFryF3hn/u/aLddug+sED3jw9d54qmOZEBFQ=;
        b=sNe+xiZQ5bHUIyfHH/kwZW/xhyYo/5ogAt4ZO3Ikdhcmz2OHY9RrxxdH/7+NuZme93
         PdVRNxi3tPvjjXx1JpCenP1Ey0pU6SExYTQJ2ZyMXS9V5ZTPT7G3+AanEBKtHCdg5Zi+
         MaJ5bzCVJikZRDe1aDRZknQNZcQKStjxaoTb/PybV+tiZ6WXjgzDQO7JXEpxSOexPF+h
         sK8EatMd8r+2UL/4LlmVTk9v/6k+zFZz6YuqSBJ7coIj4TvdmMWCPw3KrVy8xhDRqoWw
         66lAu27RbafPbhZX8Dv2TVcQHGO2C2Ek93gZEjNfths87CP/hcU+PbN0ZI/HgYLJyOmv
         miig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710426; x=1747315226;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyuniMudFryF3hn/u/aLddug+sED3jw9d54qmOZEBFQ=;
        b=Hi8DlGI3jtObZxdzfWhzU9XiJ2pxdHPToZHtcQE5WlR3OWcZvEQtxkUUFnxwuGJ4gq
         VBJs47S0HVnShwnoFJOuJ0+Q3UHoW9TMS4WMvQ6UcZQBEAwk1hiyahYhSnSLAd0L8iiz
         QsGtrneTehRzVITu/9azfLH5M+szvRIbwQF313UU4CkoIyoc8WnJkNHW08hUtjgKez0T
         FEZh+XizZkHFHYZ8CiBTyT2I3/fvcz2JE44ZqIeeJAn0KOrjrSk+PnNeodgHdRsXJnJX
         wVGV59PkyQNU/9NgBs5EXSi5aQKJ3SMJSzpddo4M9aarwzcgcL2ZcV1nBZ9absVWLpeT
         qwKA==
X-Forwarded-Encrypted: i=1; AJvYcCUvYdQPNEAt3gcea9gkw8o4vxlF2ZmKtzODGzoOdszu0uz4YiTfDZGfGMCfZKBwtljJEkQloNnJh0ia8dlDKkeG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxslsti3OKw+kVhhhusOWk5bFxnaPHpMLdWIRdfGA3vbvOMEvfl
	R85Q65Dh0pzZjfk3DY16LdpUdxA5BAlAtdcrJK83CgGB4Iz+sNqLmhE19uBuGPo=
X-Gm-Gg: ASbGncsd76t6I4BGzA7G9YPeaG9RFiZ6o6eGZ+CxUIC8kr4ikoot0CuaNHoiT2IrG50
	9BC2JkN/shBEA7vGYIh8c/+u5nyNry8ItVnAk1lRkBnM8WoJAC47wqKhMCaXbXjGS1/rzsTOpvG
	T2bDzGUysnD4xCHlizLXVLXrE3CEgUPB3N3iTp9554QhzqnlLk1ty1pdN/omzz+ZRXiUoyKKk5j
	bETGpLh67zc8UN3yTtiT6SUQRiJZdzcOWj6kV+jabibLjwZQE/DM7Yk75gOkGhkbo6FIS8gGHEH
	aEGfDTQWgieXK/t2FfVitvV5guBsXBNSpGb5t00=
X-Google-Smtp-Source: AGHT+IET79Nq5FMlY1YATt34uIy9W6bQc0RASasVjOkYJxKwtGwvC9A4L+o3Stc03w0qdqPEQha4oQ==
X-Received: by 2002:a05:6a20:3d92:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-2159b04ebd7mr5425027637.30.1746710425718;
        Thu, 08 May 2025 06:20:25 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740b0d154b5sm1350253b3a.56.2025.05.08.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:20:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 soc@lists.linux.dev
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <20250318230042.3138542-5-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
Date: Thu, 08 May 2025 06:20:24 -0700
Message-ID: <7hbjs3tf1j.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062027_094199_F0C13199 
X-CRM114-Status: GOOD (  12.91  )
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

Sukrut Bellary <sbellary@baylibre.com> writes:

> Enable Power management related defconfigs for TI AM335x[1].
>
> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Arnd, can you take this via the SoC tree please?

Kevin


> ---
>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 37e3baa33b67..1d2600b5f975 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>  CONFIG_EDAC_LAYERSCAPE=y
>  CONFIG_EDAC_HIGHBANK_MC=y
>  CONFIG_EDAC_HIGHBANK_L2=y
> +CONFIG_RTC_DRV_OMAP=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_AC100=y
>  CONFIG_RTC_DRV_AS3722=y
> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_EXYNOS_IOMMU=y
>  CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
> +CONFIG_WKUP_M3_RPROC=m
>  CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>  CONFIG_KEYSTONE_REMOTEPROC=m
> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>  CONFIG_ARCH_TEGRA_114_SOC=y
>  CONFIG_ARCH_TEGRA_124_SOC=y
>  CONFIG_SOC_TI=y
> +CONFIG_AMX3_PM=m
> +CONFIG_WKUP_M3_IPC=m
>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>  CONFIG_RASPBERRYPI_POWER=y
> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>  CONFIG_EXTCON_MAX8997=m
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_TI_AEMIF=y
> +CONFIG_TI_EMIF_SRAM=m
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_EXYNOS5422_DMC=m
>  CONFIG_IIO=y
> -- 
> 2.34.1


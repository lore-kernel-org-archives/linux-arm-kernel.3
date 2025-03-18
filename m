Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9CBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMDUDwI/ykvsmvKBODi6azon2DC/c4gZowN4BruVYoU=; b=cguQzR1VkaqM7pi6SXCV2tOr5y
	ng5U3lD0DXDdq36C7Jgy2YrXif+16ZnlzC6Btotf2QuBqy2+Ib7YFyzvCUDBmXf9WSVOSNPxedgkk
	hN+GwoCuZrrHsFIl/0zfL14yB/No+0nc9gdglrxSdR0CXxpUHiDuQTHJHdkubH8BEWcoosLhg1y/r
	rWHVODYkOhRssjx6nya8qVK3cQHQpN7F1NQm8ylQRO6rslTv//Dw/Ub4/r0kAPdQUDeqSz9e34F6h
	AvQdeXhxdTPj7r0S1K7e9lLxpr0H5NrtevCtp1mC5wMYtbEUX7r2OtHdZCFgk19fmmE8yqWCtJowf
	jYJz6Vqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tug5I-00000007LGU-1WkV;
	Tue, 18 Mar 2025 23:10:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufvj-00000007J8N-0uQh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:01:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22403cbb47fso117394855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338862; x=1742943662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMDUDwI/ykvsmvKBODi6azon2DC/c4gZowN4BruVYoU=;
        b=ezFCYIqMY7eqj6kJQsw4RcDLanlnGDfz1Rdeod4eWMhDOFgDVuE1j/p+DIv4vM49hs
         zJ7i5A6oh1XvIoLbokaBnem8K0M043ME3Jt/RXH3Vl2mEeBBpbOQOIRIbNDql9iTtJ4W
         g5hElXOc4an2INER+AtFHORlmOjOKmm1hgIZ6kaaLToJHUxoK21lFi7u4xZfDiVTmRje
         po0vQb7YFFNq66puKmBWy9gyGMaNc+YXqQOL5VOfiLQtFwfoEMdFc+kwSof0fimW6twU
         SaDi5obr0XTrRDWvPdFDnjifMAqKzQ0obOzAugWhsWwQTGYZiaKRY/bcMpsnSI1EW5Se
         G0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338862; x=1742943662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMDUDwI/ykvsmvKBODi6azon2DC/c4gZowN4BruVYoU=;
        b=M4UXwAkMrXrWt+9Oi0jgbNI+vTI3o22IxgezbIV5d2hQ/R9encKHQwLXT8qbB/VR6G
         vgmpS74Zs9xINOo630M65C7Fe/iHSB19mngYU5WIyLAmrk2ad8OEGJs/HXK4oFzw+bdv
         NXtuTbWhPzazmd6tPUv0vnPPn68UeS/1TwXBkVvcDajv0220J09t4AErnKwNi/Wj3/4r
         /59uwgBZE2sWjWbyiT/UL2r2eUIIGwEMbN/Ru2ES4AyMEDw+h7lsOjmeGevP3E63n4C9
         VlJRTQyALE762yLZU6KAMGUOws58v7wytOmBdoaKrg1nUXI8d9DVdbVF0Bz962FKV/Ic
         DaYg==
X-Forwarded-Encrypted: i=1; AJvYcCWe8zFCW5loPtGzDmvYNZt6PA/0RlGH6T25qMfYGO1EYd6d4Cmq7ThQseWxLiBBePxfj7qdsovLkHfqjES62yWq@lists.infradead.org
X-Gm-Message-State: AOJu0YxXnchPcgoIUNc8ICJ34cBmmRscpv3jqUG/MuXSZ6SoZ2kJMzYS
	hzYPoxn6vnE2qhPVE0aUmHWWSBup7NanwKAv85IdT7K91A8sfG10aTzf04UjFwQ=
X-Gm-Gg: ASbGncuIAb/xFhrcriybpFWkK6ztA60v65PNPOMlq3zoGr8kAWLh08Ov/TsrVs86gV6
	uo/hvoeax/LxWaDqRdZM5aJeEaoExrTiVCCmR3uyyWmOnlXOUbdVgAE55SbVFlCGJXz8S1PlYOE
	wgcso3LpDfhuX9eF2sVNrAh7siSeFrGQ/nlYm+QjY0G5ez4neqn3YjMQRWnFL6yACwRL7spbdxw
	pU51Vmls2J/cDcr8NB0zqQFOhqrybvOE7gsOeXafT84hPJnvMR8R7xEaoKPEuy3PPjtkTBJvEQs
	WYvT5+6+ttPrBV+MWQWZLp5u3i3Rnsxbwj5JkyF0ZROTSakkHtlN1TbMQKFbE8iFDQqjkXO2iUY
	xGWYoLaU=
X-Google-Smtp-Source: AGHT+IET8hPlzYxJjNAKwUxaX04oJy+bl8g7nOQMt8+vAfkRPrb30J30Y6geQFPYgmWuAJsrOk+VLA==
X-Received: by 2002:a17:902:d2c6:b0:215:acb3:3786 with SMTP id d9443c01a7336-2264993661fmr6704785ad.19.1742338862423;
        Tue, 18 Mar 2025 16:01:02 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:01:01 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
Date: Tue, 18 Mar 2025 16:00:42 -0700
Message-Id: <20250318230042.3138542-5-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160103_254671_389A0978 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Enable Power management related defconfigs for TI AM335x[1].

[1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 arch/arm/configs/multi_v7_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 37e3baa33b67..1d2600b5f975 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -985,6 +985,7 @@ CONFIG_EDAC=y
 CONFIG_EDAC_LAYERSCAPE=y
 CONFIG_EDAC_HIGHBANK_MC=y
 CONFIG_EDAC_HIGHBANK_L2=y
+CONFIG_RTC_DRV_OMAP=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AC100=y
 CONFIG_RTC_DRV_AS3722=y
@@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_EXYNOS_IOMMU=y
 CONFIG_QCOM_IOMMU=y
 CONFIG_REMOTEPROC=y
+CONFIG_WKUP_M3_RPROC=m
 CONFIG_OMAP_REMOTEPROC=m
 CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
 CONFIG_KEYSTONE_REMOTEPROC=m
@@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
+CONFIG_AMX3_PM=m
+CONFIG_WKUP_M3_IPC=m
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
 CONFIG_RASPBERRYPI_POWER=y
@@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
 CONFIG_EXTCON_MAX8997=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_TI_AEMIF=y
+CONFIG_TI_EMIF_SRAM=m
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
-- 
2.34.1



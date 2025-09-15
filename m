Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F963CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhCQj6ti4YtQV74gSqzE0JWivz/zF87SY+DolP82Plk=; b=PLVVfOvkmf41unJm7ugACQzZJD
	jnJDp1D1uRafX+hpmuna0K5KLo3Lt8cvGicDew8G4AbGHOdj4LfFMrqWXMNbIdRLwVfIOi8/PLywF
	DgJibLO06PLwOq/ZPhESsqtk7+THSiZ7B/gbXtQGdKHnRkgguxsty5qK5YbY8f/WoUytIDQk+Fgl6
	uwtYN0vVZW/sr9rph/dQqVJlGYL99TzDnL7r6nTp5djxZviPKJdG2ek4YiUO/JzbsFGkAsCQBda6S
	Xg63Y7zv5GU4qJkgI6XqImN9/pl8ZVCfj/+zR3wOb9zLWEt3cqLV34k+Vte/lR2gF3dVW7WC9eNYM
	uHDSjVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ec-00000003E6s-0tCc;
	Mon, 15 Sep 2025 08:33:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4eZ-00000003E44-399Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:33:41 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso4577903e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925218; x=1758530018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhCQj6ti4YtQV74gSqzE0JWivz/zF87SY+DolP82Plk=;
        b=Aru1o0gcGAZ+rPMNyeX3nTSoeqeJOV4SQkVM5/CrDXP3GRIMYMGdwkWQ5SXzyKixaK
         62xiGAWsYg51CHq7qp6LQLBcQbdzWVz5oLBVmaAmdK+E+pBsnXGRwIx5sSITAiAOb9Tg
         +CyONronn+cZFzHyum+18HHiakMbbv6VxqNgyUna0zhhY9q0S9+3Iltz/lqUfkDq/P5A
         fiobFlCQJamyC3j+Rqd7Cb6R0vjvpGZ1u425feVzJ4vikvjlAE09q2wjkvfWGHlr7tvr
         3Xqju52+fIlXj8aFLff/aloEJW/OnKfi6PzTjClSyOfgAZ8Q7h842fu4x9VIv8X2ANpy
         BUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925218; x=1758530018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhCQj6ti4YtQV74gSqzE0JWivz/zF87SY+DolP82Plk=;
        b=HtqqXeWDtrnVWZyHQkq9/gmXS5ZiUaYCXbkgmHwBWBVxwxyXFHdatvBJ5Bgf9Mqiv5
         aNq5FJPHmZxntB6YyledOZrdGKwjJyBMl4mHRk4oCynU+7ij1CCNZ2ZRyzTAvQicyPfm
         USW7phs9WxPQiqXJNmgeo+zjzymsilz4AD06qItEUDiMS0LD0fXYHIsvxb0+pbtrOBX6
         5cejhLX8v2fYZB/xe0Na2y32VvPGei1fv8NizSwgpeSpvIKBt1vEz2qg/YZH/kUtnrxV
         dp2vH5vVvDxg88ZkJdVRSKOrDOFc7DHXlAXv8+VWW3wnWglBV8ZYKBTxUZWsZASMNJRN
         ZpDg==
X-Forwarded-Encrypted: i=1; AJvYcCXyiPq7hKnS2hBpuunTVgk5LfJivTX3H8vp+QQcCIfbHf3S6eLNKXPKuXC4ALoEK0PyRz74oxMOrLg5FkIerKQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YyXO7+n+z9m1Bk9HRkHm1EawTnRY6gAwLFxAC7Ypz4Y/2cWr0jm
	pOTVrBwjUWjdqWPIGW52F2zuHYWTGIspdpl0NjqT1oYrIvEMEbaWc7p2lNATRFrILs4MIDGuttl
	vwcs7GRM=
X-Gm-Gg: ASbGncuINteGLolY54H8Ie5NLY20Ehi0hglZiVC1ygMY+Si4egpJtXSKyy9dsD6krit
	mGQh4f3N9QMkUJuD2aaGtuX7yShViZDv3OEQrpN/3INVfmuT+THBvsY/RIqrPBuvdPZFvDDQ+9y
	ndGFTY4IcP4IGx3F+8nZC4ZG03/O4bkDZfL/N8BVkxrtTuAfo2p8fw3D1rwyLNrIB/IMZS2yxQk
	MJ2nle/F0j5tYtSPv0+j7ykHAN/LqEtpBZcK6CLD/hsDwUODPopIbKV3KC0W2niATe0jdULn4qy
	7045emyx7yq/TzqU4fsHeEHOevOpSsfBNK+sh63Xhmp97qOjZnhwLpQAcHFpc/wyqCDxBXh//nI
	YAT2E8sr9PtS6Sp1O6Lsv4KFfnkt022sQb1c4UuJAIrVc/JiuxHuAKOnD6BNrefeV/w==
X-Google-Smtp-Source: AGHT+IFcLHjxrrKby+Md0dZGhs1/d8RSPE8VaTnfpniHXnX86nTUqa3YezXw3uHyLbu8SVbOt/ZgiQ==
X-Received: by 2002:a05:6512:3158:b0:55f:6831:6eff with SMTP id 2adb3069b0e04-5704ab94916mr3376627e87.4.1757925217538;
        Mon, 15 Sep 2025 01:33:37 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm2335142e87.46.2025.09.15.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:33:37 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 1/4] pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
Date: Mon, 15 Sep 2025 11:33:14 +0300
Message-ID: <20250915083317.2885761-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013339_821722_3A7FCA2D 
X-CRM114-Status: GOOD (  13.50  )
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

On rk3399 based rockpi4b, mounting rootfs from mmc fails unless
ROCKCHIP_PM_DOMAINS is enabled. Accoriding to
Heiko Stübner <heiko@sntech.de> all SoCs since 2012 have power
domains so the support should be enabled by default
on both arm and arm64.

Failing boot without CONFIG_ROCKCHIP_PM_DOMAINS=y:

https://ledge.validation.linaro.org/scheduler/job/119268

/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
dw-apb-uart ff1a0000.serial: forbid DMA for kernel console
root '/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e' doesn't exist or does not contain a /dev.
rk_gmac-dwmac fe300000.ethernet: deferred probe timeout, ignoring dependency
rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -110
rk_iommu ff650800.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff650800.iommu: probe with driver rk_iommu failed with error -110
dwmmc_rockchip fe320000.mmc: deferred probe timeout, ignoring dependency
rockchip-typec-phy ff7c0000.phy: deferred probe timeout, ignoring dependency
dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -110
rockchip-typec-phy ff7c0000.phy: probe with driver rockchip-typec-phy failed with error -110
rockchip-typec-phy ff800000.phy: deferred probe timeout, ignoring dependency
rockchip-typec-phy ff800000.phy: probe with driver rockchip-typec-phy failed with error -110
rk_iommu ff660480.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff660480.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff8f3f00.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff8f3f00.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff903f00.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff903f00.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff914000.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff914000.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff924000.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff924000.iommu: probe with driver rk_iommu failed with error -110
platform fe800000.usb: deferred probe pending: platform: wait for supplier /phy@ff7c0000/usb3-port
sdhci-arasan fe330000.mmc: deferred probe timeout, ignoring dependency
platform fe900000.usb: deferred probe pending: platform: wait for supplier /phy@ff800000/usb3-port
sdhci-arasan fe330000.mmc: probe with driver sdhci-arasan failed with error -110
platform ff1d0000.spi: deferred probe pending: (reason unknown)
platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

Working boot with CONFIG_ROCKCHIP_PM_DOMAINS=y:

https://ledge.validation.linaro.org/scheduler/job/119272

dwmmc_rockchip fe320000.mmc: IDMAC supports 32-bit address mode.
dwmmc_rockchip fe320000.mmc: Using internal DMA controller.
dwmmc_rockchip fe320000.mmc: Version ID is 270a
dwmmc_rockchip fe320000.mmc: DW MMC controller at irq 45,32 bit host data width,256 deep fifo
dwmmc_rockchip fe320000.mmc: Got CD GPIO
ff1a0000.serial: ttyS2 at MMIO 0xff1a0000 (irq = 44, base_baud = 1500000) is a 16550A
printk: legacy console [ttyS2] enabled
mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
dw_wdt ff848000.watchdog: No valid TOPs array specified
mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
mmc0: CQHCI version 5.10
rk_gmac-dwmac fe300000.ethernet: IRQ eth_wake_irq not found
mmc1: new high speed SDHC card at address aaaa
fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
fan53555-regulator 0-0041: FAN53555 Option[8] Rev[1] Detected!
rk_gmac-dwmac fe300000.ethernet: IRQ eth_lpi not found
mmcblk1: mmc1:aaaa SC16G 14.8 GiB
rk_gmac-dwmac fe300000.ethernet: IRQ sfty not found
GPT:Primary header thinks Alt. header is not at the end of the disk.
rk_gmac-dwmac fe300000.ethernet: Deprecated MDIO bus assumption used
GPT:1978417 != 31116287
rk_gmac-dwmac fe300000.ethernet: PTP uses main clock
GPT:Alternate GPT header not at the end of the disk.
rk_gmac-dwmac fe300000.ethernet: clock input or output? (input).
GPT:1978417 != 31116287
rk_gmac-dwmac fe300000.ethernet: TX delay(0x28).
GPT: Use GNU Parted to correct GPT errors.
rk_gmac-dwmac fe300000.ethernet: RX delay(0x11).
 mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8

Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Suggested-by: Heiko Stübner <heiko@sntech.de>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/pmdomain/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
index 218d43186e5b9..17f2e6fe86b6f 100644
--- a/drivers/pmdomain/rockchip/Kconfig
+++ b/drivers/pmdomain/rockchip/Kconfig
@@ -3,6 +3,7 @@ if ARCH_ROCKCHIP || COMPILE_TEST
 
 config ROCKCHIP_PM_DOMAINS
 	bool "Rockchip generic power domain"
+	default ARCH_ROCKCHIP
 	depends on PM
 	depends on HAVE_ARM_SMCCC_DISCOVERY
 	depends on REGULATOR
-- 
2.34.1



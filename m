Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF5CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Slorj42xucBLgcEgCTYJT1nDW78UozPuVsLaHl9+ais=; b=p/mzkLl1bViZieo2JFPyMU79oB
	P5P2oJd6DFGNNKqtj+U2NcM4ayvH1jERa+ANS+7FonrJ86nTpbmWFXDPsvCIw9Vg1btG5y/cs5Tjj
	whziIs3SqbuFB7lcmO4bkEs3wWCT1DB63R8/hocFljXneRJYR3qcxYAqES9F+LhtwQRvf1iIVWETT
	6jNL/1rwEO7zFqD+Hw5ElEQb/vt+mhkUzcQfbBbj09Qq2A7mwpki5zfzGXEyjMSc/cZ1TxoX4G+UH
	xR8RglixOtk5Tpj0IweRl4ElCAO2+8LRWD+fmxC+lyQfCuFVV7SvtuzUF4pF3Fn5X50G3gW8aQ3e3
	Kx2hfGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCM3b-0000000CqPU-1O0S;
	Tue, 06 May 2025 17:26:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOl-0000000C8GZ-0L3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso49690115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538309; x=1747143109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Slorj42xucBLgcEgCTYJT1nDW78UozPuVsLaHl9+ais=;
        b=ZZ+/nkv3hsnISQ+mCKFzj9OfbaLTQ7NzHkk4BVROHgz8QWC5ElSMhGKQnuNpHcYktS
         N6OWKZ8y5t7LNge9jltQqrjeVCGxP0MwTb3vUzspEdIbR8sGgzgUBQHVQuv2dQNcjwy7
         gAItV8R5XbZcAqyyhHu5Vr4n6o1TUb9SpTdjb2bYWK814pMKYZUuNO3ez3bSWlcHJxV2
         BA2K0SeH0tO+Y0saitk+SyJdUe56PODXKLqRcanVYie0tl0fWzN4o0AmldjU3wviQBD0
         MBfk7L7CfZ7cungP5RAhx3kUX46SWAr2sUY9WhLY436bpM2RDkozTZmpnA651px+M4+Z
         uPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538309; x=1747143109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Slorj42xucBLgcEgCTYJT1nDW78UozPuVsLaHl9+ais=;
        b=xJSESE0p6NUNXXuotwi/mLWnz0s0h8AHqze3xsB5wOSYQivgNNUxgacq7rpNbRxGAC
         OdkaW7M1XOd/UTl6UZBSCsGBmxx5VLInO3qnSSZ+txrvo+erTcX7hkgvowwXBgmgXMq+
         a3cyoy1TO0roFIJUW4KiPYx5QybcK97vTYPUOK4aA9y2SIjpWxFZAeaWP2O8DHoZFhpu
         LhcYQTWX1/C4AQYkNR68/V4hnTYPmS3thDl8b09EpxXk4k06UPNOhwXTL+9O1gweUVxk
         LBoNYvdPk/5gLyDDEw9FHttOrc83szw8NK2rLIA6ngKhloNV/DewcUqqmWwcbY2aa0Sm
         cT/A==
X-Forwarded-Encrypted: i=1; AJvYcCVPS73XNfYsS+5/Zmzqvo3HR5lW/y7ugYtf+JN3v0PkiGzjEmq5JdLZK6jCqbabeosX7wYvwEGQhx9f2JBsl2Eg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8bhk4R97snNUIKXVwSsHQzryQMVlk5R1RQDx/NMhqFPMQ8VET
	a0B+8EjQlTBFOWcYUUcnxe3C8+4MK4ypGgalYWfeqyUtBZPGEV3m
X-Gm-Gg: ASbGncvKe96824/dM74KthIUh237PBrNWEEPnwehfI/Xei2hXrY+w+fm+q02ZVJOAlI
	jC3bRvffsqc9yqN3q72V1h1SxDCSEk9Q6gdA9CTql9TOLusFBuh4wpPY5BjieaLjdMp5qFpi+AF
	+L2Xd2g+fXSqK/qw4k9a5uBoBhHR8SqkEEn3YgwRb70/nDzae/QeSeojQGiR4pBNuTWdGEqyQpv
	D0gvj6oJVx39iWtW5yOrgblI+Jg8yzK916pYcU+SlhylAIOl3w6HbMAalPjH0sJ+7++7uI6oaa3
	nnQAZ5N7b3XDp/rVKvQHLP37BiTD6NYoeBzlBnyIUKOEW7AIYVDpDaHWbxQUgaP56AHA20053Pi
	vaGKND8AY9brn4vOQ/qorE2rrcTAHu9G9
X-Google-Smtp-Source: AGHT+IEqtAFghQueMw8z+GZ68EaGQYCbkFFmcLlBWgpzWkkb1FBjdt56CDfJkVu9rAJJoM/2Z/ekWg==
X-Received: by 2002:a05:600c:1d8d:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-441c48aa302mr102353625e9.7.1746538309306;
        Tue, 06 May 2025 06:31:49 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2af4546sm218375415e9.22.2025.05.06.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/11] arm64: defconfig: Enable Tegra HSP and BPMP
Date: Tue,  6 May 2025 15:31:18 +0200
Message-ID: <20250506133118.1011777-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063151_118990_198DBEA9 
X-CRM114-Status: GOOD (  11.31  )
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

From: Thierry Reding <treding@nvidia.com>

Selecting the IVC, HSP and BPMP drivers via Kconfig is problematic
because it can create conflicting configurations. Instead, enable them
in the default configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 drivers/soc/tegra/Kconfig    | 9 ---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 98ad22833282..85582019be04 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -266,6 +266,7 @@ CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
+CONFIG_TEGRA_BPMP=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1431,6 +1432,7 @@ CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
+CONFIG_TEGRA_HSP_MBOX=y
 CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index bc532cbe32e7..9392c2c43cc8 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -97,9 +97,6 @@ config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 features a
@@ -114,9 +111,6 @@ config ARCH_TEGRA_194_SOC
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra194 SoC.
@@ -126,9 +120,6 @@ config ARCH_TEGRA_234_SOC
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
-- 
2.49.0



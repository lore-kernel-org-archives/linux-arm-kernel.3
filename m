Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1600C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LLhAPy7Ghblj+iKtj5iTpzCPso9B2g0bt1tZli2WU0=; b=ayO/n/27fwl+NiYxoSw0F9py9F
	EMlQqCL2o4EUel0rwqas4aUZgnExBMJ5VHGO1/G5cxwWl+49szNhIn7kVdx7lQxfBS4/ismZ01lyv
	3bdzHEcfotyJCmd3vPYet40I4DPHoSWN2ZhJHyejlMx6o6haRFs0Phzo25SRcxeMK5uDCvZFs0gOq
	W8DmYawOblVNV3G8Cig9wYKindatGBlDH1+dlDlcoWeW6RhdJSephuTcOxlcBwvds5e3JMuZqxNU8
	n3Rdr51RZOK1l/vpy1VnRc+6KaYwflEg6rPBp405rEX2E2lJTDBCSwfUTwLUFeMiy79oWilofDjZE
	ZZXDSJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3xB-00000004n0P-07Pc;
	Tue, 08 Jul 2025 08:45:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3gm-00000004kQD-341W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:28:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso43258785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963311; x=1752568111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LLhAPy7Ghblj+iKtj5iTpzCPso9B2g0bt1tZli2WU0=;
        b=Ap3eqQvestkvdCuZLR3KUO88fEkyZUsOJT7rkLCjEuWsjdOQn3ffYNPh770mQcSJmP
         opYgsUBwgfy+4YkNqzoq1Tq8xne1Qouv3S4k2zKsGTyyxKgr2oOBdfApKTA4n7+ZKx5D
         0Il4yah0BrQraZ2+pEnbw13hcMGVNS8LYQ4+7IRvSucnXh77SjXhXZgOtdwbCA+TMdiK
         p3JyYgJoY4qJCTDZApJktrAXXQf7oRqVsLoik0qWmToEYu+WRqaqgrkURncqbaTm5q39
         Bgh0Y+gIm6fRcFDr+adKn7BYQb5OuYYY0d/eHqj73bgRSwGf2AS2AEpA1oIZFnpidPPO
         MLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963311; x=1752568111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LLhAPy7Ghblj+iKtj5iTpzCPso9B2g0bt1tZli2WU0=;
        b=qu5EYFkClUHTq93GvBB0pZVPMN2bv6UBy9O+hUapZcjJmvfUnly8rbcUUVeDBuSqa6
         zNVxvngYHKvorW/ExR9Rm+uQKo257hAYMOKVkWrb0neeIuXfGDd6LWpUsoaHuG4PL0O3
         sgvAnDBBBdybZRLXH2XEXgdeUmfGeOlqq1FxQq2Mq72Z0CZlcKVnub3iGGLA4ac0yEld
         96AM30xLgTto/6vzuVCzoIdU6P8FLKIIcI042+cgKSFx56+gx81RhJCT/k5G4z8wPMyc
         5zhEPYMLVM+E0q8gWRYky5heikNgw0iGisw8EDHrX1660CKB77HA7+H1hz0vEIrmDuVT
         gM/w==
X-Forwarded-Encrypted: i=1; AJvYcCXI5HM+7KTX9OiS/AbS6Eh7EMwrnHTmxKZ2kZf+s8Qn+JgmXg7A4cEIzBfTW08C8SfWLsN+UWCJkohcAKTy0F0x@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/8YyIG/Xu+30relsrcJWT5S/Ihc4k7/rjU2mw/n4mWjPWWzs
	VUFPIKoXbpQUQbbG+X2PzyRoUo5RnR9xUrFqL+zlF765iEUIEO2AAUIHGLCu4A==
X-Gm-Gg: ASbGncvgRpNHMcJ/NCIf8jNushH58ktTqXiMoBhtPv3qMDh9OGwcInK0pxxE6ey9Bxx
	lNQL1PlusGD3NQ5q1fMc4Ofana20aW/kmjgMUbVtNCVcehbGmJxeDfMk7zJAeCyEo6KqGzw/Vrn
	hZtVx6dl23VFYGmE734yMEUZxNWaz0VX3ysX4jiJOERmi4fJKsI0BO32dDXldF30q4LmMy9Rzb9
	nhetEQ3eWBKwDzI/zles07WPknO42vg1DI6E77VacKNKSx4O1ppr7gjziLQw+zGp4iHbCtBf5CY
	Ya+fwEWCstKsN4pJTOi/1yOreNRZZ65Qg+KE7x6D5NPkUl2QhGd2ooWHJbp6/LBWba+SXDiIEgk
	RDzIvnVPHPP0Qi4mHYhHkAL84as9PCuNQNyOSnlmBbLr3sp4M3jPURQ==
X-Google-Smtp-Source: AGHT+IHsG5bw/pBz6eaAWGeZj02Dv5we6LevnW+89zASDG10jYaRM7fq8/KA3dUlltDsd0/UFjrNHw==
X-Received: by 2002:a05:600c:c055:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-454cdb340bcmr9487975e9.19.1751963310869;
        Tue, 08 Jul 2025 01:28:30 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b97339sm12478583f8f.64.2025.07.08.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] arm64: defconfig: Enable Tegra HSP and BPMP
Date: Tue,  8 Jul 2025 10:28:14 +0200
Message-ID: <20250708082814.1491230-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012832_766879_E42FEEED 
X-CRM114-Status: GOOD (  12.29  )
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
index 739b19302865..2cf2886a1940 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,6 +267,7 @@ CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
+CONFIG_TEGRA_BPMP=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1456,6 +1457,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_CPUCP_MBOX=m
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
2.50.0



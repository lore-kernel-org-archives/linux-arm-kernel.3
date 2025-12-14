Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00FFCFD314
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OhdeJ/LLR6L2VR6ptJ7b8rQmhPTTZ/qiN+icdGZwFSY=; b=CiW7z4HbNIFCx1gS0mHM0gE2Ss
	27Lojpv5oX75FrwHPvQa6YGWp+3uITpPc2MflhwJhlKwUXUQIbNkjsqzdv3WDexQeInslRnd5cjS5
	A2lzOdR/2mPnXvD9fnHiC0XMy2cX1hlkNEdSxUPI9ox0El69gBgLK8cHVjH6zlXIFpOFzHaAN2F0M
	k5ySuCLiC1E9yM0G/g3Pu9NX2frkjwHa/RkXfbawYUlmvmGwEX2MAxiwuzUltGgdUaiKV0OdiG9NC
	b+R4r7hfOdDppY2zlmw0qcCmiE3+PR/W/GhZPrT4NOr8OpW+utoN89Sg5KDopailGyOPIdvRwEOxp
	zxD+D4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvE-00000002NWA-15wp;
	Sun, 14 Dec 2025 11:05:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvB-00000002NVX-32Qn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso1310592f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710348; x=1766315148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhdeJ/LLR6L2VR6ptJ7b8rQmhPTTZ/qiN+icdGZwFSY=;
        b=Y7yPzjb/MV+NXHl9SJoML8eokRWKz2lb8aYsUMeTqVMUaU9KIvmiA1imMK9a1HoZRM
         P5m/5W0ruAXJpnnL7Ubn/9oxuso+ZZS293gmBfrlWe1yDW2AFk0Hqugh2Ca3PULLe0gE
         U/xF2829RVCypnLjo6NrYdSwUsKXrPMF8cRnifaddHxBy+25i4Tl7av/HIOx3eiIHGoF
         Feo/NRcF2xwETJg9Z+VZngQpzrnUBjmojpiVC+volwpypdAh+xuSJm0UESfSh9r/Dcdg
         sTJKUxst9kQ/Bx4SDKIyrqoYI9kgB4HYUZ5Fw7aQRvEyLxMoeDsdqigDr12HQ9yS1uh/
         h61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710348; x=1766315148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhdeJ/LLR6L2VR6ptJ7b8rQmhPTTZ/qiN+icdGZwFSY=;
        b=AI82L6nsJTlvx61SLPg9ZiUcNw2NUrRO4eqaBrMUEXkmcSV8G8NxyDHPST7fzBfFZh
         Uz7iuM7ewJ71EDAv10E398upNdbULyEvdY78D4ssqlVhP+g8cuf3yFlrsKff8LlRSKz1
         fYJC5Kafs5ENMFZZstKyUpDv5jgCmP7rCovVcjOQAX7l74yetAh/yOuYSdes9Zsnf/rI
         Xt6dt4oxsqpoutbGF0twfEDr/I74S4y5onP+Dmqxq4XWbp6nVIxftyU8Tn15qC+OVolw
         KtOuZ6nPNZNwNU6aeco2PwSiwu0A5rn/4Dbe3JTPCT0iie9jlBxXTGq6Akw3LGjdNq56
         NLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpzbw/TEkxkPiRHOYed8MaZqpcKkTr/oPFuCNa4rpHyYzKXqCMLHP31lTNWdslgEbkYZZV6LguxM3fpLbut4RQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPlf2XaROzP7psx59IcIasO3s4Yxu6QwaPHXoJ2d/Xj+n+G0Xa
	150dzdu3sIEyvOpz779bZGkEJpLZDoTdOoJoA9vk+iXpSaAz9n+ORBNO
X-Gm-Gg: AY/fxX7RmPpHDBKXHslJpGOY2O1eBL0M/tJ7njoPhOl3S45LSPGWGj++Gecug5Ts9/l
	BoqZiXE+6FvYaHirHFkhmJ0ZzvkSe6gzO75EbZAsNYO5vFUaCeTmnQNWZOjWsQPsCUroEnHPFpD
	gBsDZbG4DNlPklFDRVjzFlKHnC6xHr32mhJkx+98W4m9zDvPEHxwHvIlFcJ+1dXfg3SkGYVnXSm
	4/YbA5GG/ZP2mZ/jGZ0m3g13DDv1zaH8x/nSEDgUC5yqkez+0fWtoVCYGtjUbrHYtBgyPWClsI1
	CsMFDp5CifHwlxeCkacGSfS6PxQF9KT48DUBinM/wXVQjB+a7axtzMbgwvnmaPUfLy+B9cElorr
	jtFgp1+zdgK/QxPxoyly2pUGKPOuws7lEY01VA3ZDOOWEghSU9ndWsTkrF4jIR8CqDxLlD40ja5
	NTfrfg/3qEmcnY8NwBHAy8Z8MOZFNzmNRBrqeKqCd5yY/KInfT+4amlL3DouLPgHSWrY2OPfyHp
	Vxe0GqOSucxVMs=
X-Google-Smtp-Source: AGHT+IFTnNafx/D6K29dLM2hhJp5B/QbGCDyXRNcOaZQ8W5V4WHYPBO/c41/tJWjVv0ztKQKXFtfFw==
X-Received: by 2002:a05:6000:2f83:b0:42b:3e60:18e9 with SMTP id ffacd0b85a97d-42fb44d4426mr7867198f8f.10.1765710347568;
        Sun, 14 Dec 2025 03:05:47 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:47 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 12:05:23 +0100
Message-ID: <20251214110531.9475-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030549_801521_D4D2147B 
X-CRM114-Status: GOOD (  10.66  )
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

This patch series aligns the VAR-SOM-MX8MP device tree with the actual
hardware populated on the System-on-Module, and separates SOM-specific
descriptions from carrier-board-specific ones.

The first three patches move the USDHC2 interface, the PCA9534 GPIO
expander, and the UART2 debug console out of the SOM dtsi, as these
components are not present on the VAR-SOM-MX8MP module itself and are
instead routed on the Symphony carrier board. Their descriptions are
therefore provided in the carrier board DTS, keeping the SOM device
tree limited to on-module hardware.

The remaining patches add support for peripherals that are populated
on the SOM and commonly used across designs, including WiFi/Bluetooth
connectivity, the WM8904 audio codec, and the ADS7846 touchscreen
controller.

Overall, this series ensures a clear separation between SOM and carrier
board responsibilities in the device tree, avoids describing
non-existent hardware on the module, and enables key on-module
features.
v3:
 - Remove unnecessary status property
v2:
 - Move deleted nodes from SOM dts to Symphony carrier board

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
  arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
    carrier
  arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 331 +++++++++++-------
 2 files changed, 355 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3



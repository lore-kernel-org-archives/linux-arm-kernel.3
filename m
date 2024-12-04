Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B8E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=; b=BT1qdVpPraKnyUTVbQdzZL2i8z
	+/hf4nm1CYwMm9fGfT9Xz/LAPF7Kkq/QnFMzZ7Ubq36FyXaC1Ow+PlitBfFbdihdkgO4/jHzG7WIF
	iYHfYudVjzdutg4MEuG13saGcRaLLAtgyBAsXezWCuUXCJTJpig4YYyC6IUZ7fprR04eOnxi2KfHm
	J3PlUEXb9fTUl0lcXixUdgPKqfAYujJGlTXE+JWFKKrBcM33Jo1qXs7vOCM3/pXXwGg5ICygZ0CCp
	QcNuMug9nJB2/THaRC9eROB2OenEHgNAXNcnqZw9nf3B1G4Xxk7CRBlF/0B8ajaOM/aXspHBIMf0p
	twZQI7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrp4-0000000D5dZ-2Am7;
	Wed, 04 Dec 2024 16:01:54 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlE-0000000D4R1-389r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:57:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53de7321675so7510383e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327874; x=1733932674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=ZGr1VZicdcii9AA0DX7sBR1VKR7fjvXgj+l0gBBgx9chp0fgkk4A8kNiB8T+BwMtas
         fElHIj33VpM6kQMprck6Q/jZbK20h5assSZW1f2VAkrhu/GeD7dCupqdoZiLgpNs6X6X
         rUug4DRdvxPGETnYAVmet7pnvy4CRpOO3UZXi0SrukGDzMazm1fEj4OefelF1MoK15kz
         vOGPBb7MtNgK8VDGDuacwokLW4UvqVzgbR2DgM9Q/MLZIfogfUyhc9Urxu/LAGZRf4SX
         YW5px3kc4/MajAcehDL6iWaPnT3fmO7Tn7K2iKYLNxECs2TWGkSFi0L+uxVLhRfMOEs/
         NbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327874; x=1733932674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=d0FLmgEkhzbP376NygA5s3Tav4+a8gzZxRcaQ8BK8e+oseUKiNriMjk3kAiWEJlSj6
         Bkj8dM1/vGpJY0RvlNjBgOT06wCKK9jD6wpwwqmGzvp+VplZVl/0OVgNlYMb20TDVbLw
         ZqEYGNA2ZW4RwII9LFqkYPQ7TkhWWkHcFRMN4fGTrZcsTRH1dB0XeQ9uVP5BWcBXuyMW
         WoSAfmqmyWJrLACpHY4+ujzUfAPaEqbEVP2D38U0H4pTl77z4ScaUPpkcRdF2jP7q+id
         QO4vmq+GiQscTPhkLOTVIk3pNKwuW6d+C5PpF0caKNatAlUKaZX9OGjKiucPbz/weL/4
         Xz1Q==
X-Gm-Message-State: AOJu0Yxei5jFR1aX4P9ngQC5Tq1flHQf2vLkfG2Z8AZ+hEjVyyhD3SNn
	haVdWUjN5DQXFP7QViTFZKZM230rCU2Rjt5dr2k7bxz9h2T5bX4wvJQnsutg
X-Gm-Gg: ASbGncsuQOMnuYMabL90WtSEXZoLe8EvoqG8mROHAfM7JHRG+oRGeI/HHwJUCvMfgXV
	udQl8sqAQiLjdfknqsglVVMgwRrjBFHbKIRCvTewSmUjVhjJe/ktZYKoU+DzAepLM91byIYSHcv
	yxJ2YpdykvJf1L6mq08heExTYcAe4TKTh4fh2q/Ae7oo59Mo9jVK93Nl5X1uPdacK0twM2wS/dO
	V+R5G8Kp1QUl44XMJHX2lPHDXLV5mpdETX6w2PLBI+PdAXdTxsnpezhmjiQLdAb8FHMN0M4G1Wv
	JGqfmAOprr/LWD4=
X-Google-Smtp-Source: AGHT+IE9tM02DUH8MOCjzjoQQbTra+vnau6HGJnv0bJ8SHLzV3mdbCN08x9wN5NL4MZ4tHud9pXj/w==
X-Received: by 2002:a05:6512:3b1e:b0:53e:f38:60eb with SMTP id 2adb3069b0e04-53e129cd2f1mr3878419e87.10.1733327874359;
        Wed, 04 Dec 2024 07:57:54 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:45 +0100
Subject: [PATCH 3/9] ARM: dove_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-3-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=HdpaVHroT6iC/mIuADXOnpTo/dSXbaiBN9gF6efkgy0=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvTAsyCMOgmu7E7wO60y6tKwceJVxfi79/8L
 xMvNhX1cYyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B70wAKCRCIgE5vWV1S
 MoSJD/9KbSQFCcwv99pqsWFQON7Uam7nPkP8bGmLJAjlaK+anFeRQOjNCs8z+ohJSol7YY3eFwG
 u3x8NtJ0vhmHurJkTv5jzI2UuAT0povAAGeUcZPtB0XWm2c4vo7wdu96TazEMlr1BItqO3xogVn
 wZfE7jIGaXkPYaMEcJr8fu+kgGAUq2Ie6yIj6pLI4Shj1Q5C8ObGzYJttVJwAZscK+USBJNt7cP
 Y5hBvNZpl3ObqbeyMGgntiDjeQGiXblr6Yknv0oXVDWHRR8V7YlV22DNLcTT+2JTivfjG3137RX
 Gnernb3VmE3Nk/VBJE1MfwInv6y41HakaQ+MNzq//n3Wj3zSAUfo149qMfmvxCMz7f+1W6tGdNU
 NtSCYuyA6+Yfp9PWKW9M9mlHxEIBIuUhtlJ7XXbpvPaGlEW5tv7pZLwSSnc8HIqYYqTy4OjEP0t
 MOgVy+BGu+hppz7NhMGfZ63FsnqTJTVjDq0mtez7zY+yzJ/buQS8L8BhZQ1Mq7GrjgD0HbmPPvB
 6KYr9rkhVwqUUS1xt1HZ118kwupanjZH7e1XLxLR1DryxkHDSAabhYDO3d4iwuSc2wrKsgvLc+9
 zYQdAx383LofbDG6NLIOJTyVBjH7/jCt29rzXvjUs0ay3ED2Y1QIjDSqHiHuTsVJ4EPGFaBdcZX
 gBi+mFXD/llylAA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075756_790411_179C0ACA 
X-CRM114-Status: GOOD (  10.61  )
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

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm dove_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/dove_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 2849d17f585660aa8ff6aad5d554c4bb2d794c60..c3e19e6aa6c9d8e40ecee7d97d185909db61b6c2 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -3,11 +3,8 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_ARCH_MULTI_V6 is not set
-CONFIG_ARCH_MULTI_V7=y
 CONFIG_ARCH_DOVE=y
 CONFIG_MACH_CM_A510=y
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
@@ -40,7 +37,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -53,7 +49,6 @@ CONFIG_ATA=y
 CONFIG_SATA_MV=y
 CONFIG_NETDEVICES=y
 CONFIG_MV643XX_ETH=y
-# CONFIG_INPUT_MOUSEDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
@@ -96,8 +91,6 @@ CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-# CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
@@ -112,12 +105,9 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_2=y
 CONFIG_NLS_UTF8=y
-CONFIG_TIMER_STATS=y
 CONFIG_CRYPTO_NULL=y
 CONFIG_CRYPTO_BLOWFISH=y
-CONFIG_CRYPTO_TEA=y
 CONFIG_CRYPTO_TWOFISH=y
-CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD4=y
@@ -126,7 +116,6 @@ CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_CRC_CCITT=y
 CONFIG_LIBCRC32C=y

-- 
2.47.0



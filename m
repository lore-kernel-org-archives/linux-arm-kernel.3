Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3905606C907
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhhemwRh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwfvgFVT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9TzFfDcA7Xax6Jo3rySlid9F9+y/+fPUOq533rs33/A=; b=QhhemwRhUWdewe
	WvXVROmI874iXCsNqrPmVkeb1i8tvO+tfD0TPqvbeBEBtn/xPTVl4puCzYdUH11b/Ww++UQIFP5VU
	02aF4035+bWyuxJ0JrI3CsMLdq0ucvJB7/e2zNimlb6LRLSPhGiTnMj0xjmY2MNnQsh9W1QtYCCRx
	XxefMJokNzDpbWAXdMhI4zwZgNWUNwO7Fkq2+cIrHq0E+m6NW4G8vLvrEs5qY1mVl7FWqLuuKaPit
	DcrF01T5toMC5zipFo0w32Du+po1nToR+bxQSNtInBtTERgQ+lEREpDcrOVj7NH6IgU/OPfhPtWw4
	RFkvREVGn5GMGv4Okq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiax-000000072WW-1D4p;
	Wed, 04 Nov 2026 21:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiau-000000072Ts-0PIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85924429D6;
	Wed,  4 Nov 2026 21:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C166B1F000C1;
	Wed,  4 Nov 2026 21:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827951;
	bh=9TzFfDcA7Xax6Jo3rySlid9F9+y/+fPUOq533rs33/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BwfvgFVTRzn+hSsF84N5307HqaMCDWHHuZirXXXRabHBfGVxWVo0pJ5VZtmyRoUvi
	 75ZFYCSUXFanW/XFxPfyYmSyjsvgM5otFsxWPnvaTp0IyhwJG6urKU8o4MmRDGbE+x
	 JgCNGMRV1yVEX370zBVyNyz45+mGLzcH+rzYWXszrbTBSd6xQLZH+98cjBFWS4bhXx
	 raDCvVY/Lvp4EKaApQEq5Z+oHkMrqNaKOkQbcEKb1UuazchirPOas8+wGw3uAoRCuq
	 yXf2raCJ/QYnfgUD5zgU/i1AEuQL5lMeGCTmSfCGl+baPyTCUu7k+L2pIT6+lbyyWd
	 gC6fzQgyToDPg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:23 +0100
Subject: [PATCH 07/16] ARM: configs: u8500: Build peripheral drivers as
 modules
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-7-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Build the GNSS, SMSC Ethernet, CW1200 WLAN and RT8515 flash drivers
as modules so boards only load the hardware they use.

Also build Bluetooth, cfg80211, mac80211 and evdev as modules, matching
the postmarketOS configuration. Add modular rfkill support for radio
control.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index f59685399794..0e7c1ccc907e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -75,21 +75,22 @@ CONFIG_NFT_FIB_IPV6=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_PHONET=y
-CONFIG_BT=y
+CONFIG_BT=m
 CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_BCM=y
-CONFIG_CFG80211=y
+CONFIG_CFG80211=m
 CONFIG_CFG80211_DEBUGFS=y
-CONFIG_MAC80211=y
+CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
+CONFIG_RFKILL=m
 CONFIG_NFC=m
 CONFIG_NFC_HCI=m
 CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_GNSS=y
-CONFIG_GNSS_SIRF_SERIAL=y
+CONFIG_GNSS=m
+CONFIG_GNSS_SIRF_SERIAL=m
 CONFIG_ZRAM=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -103,12 +104,13 @@ CONFIG_DM_UEVENT=y
 CONFIG_NETDEVICES=y
 CONFIG_TUN=m
 CONFIG_VETH=m
-CONFIG_SMSC911X=y
-CONFIG_SMSC_PHY=y
+CONFIG_SMSC911X=m
+CONFIG_PHYLIB=y
+CONFIG_SMSC_PHY=m
 CONFIG_BRCMFMAC=m
-CONFIG_CW1200=y
-CONFIG_CW1200_WLAN_SDIO=y
-CONFIG_INPUT_EVDEV=y
+CONFIG_CW1200=m
+CONFIG_CW1200_WLAN_SDIO=m
+CONFIG_INPUT_EVDEV=m
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_STMPE=y
@@ -188,7 +190,7 @@ CONFIG_LEDS_CLASS_FLASH=y
 CONFIG_LEDS_LM3530=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_REGULATOR=y
-CONFIG_LEDS_RT8515=y
+CONFIG_LEDS_RT8515=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AB8500=y

-- 
2.56.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD0E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=; b=neQrYjchERDe/xuVSAs6g1w5tP
	8xpHBxgtGCA7fcfOSxNeYnNOGQBJ4nfQDrpNUBNEQxTLnCquiilu3dcgub1tPprg+WZgNM/4V1Mg8
	8+JL2/8oSL+5dSKaKBW+g7VGIs1aMH9Z9HwPIZkxjViQ4KUb3K9wfEANzwNNW3ikCZYl3AAT53bhs
	htw55QXICZio05pt/1yqojuAExWSTBkxizkqTAzMc4Vwl49O1OhgF/91jJFOv2B6YfnEGMfRRhe6j
	/+TJLr6t5DaHcf3OzJ9TEBu1lfrqyUk5h6eMr+Ihc4MwYeYNOoF6+W7/1qbt3uqApLyq4RBl0l4jK
	S8AzzcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrr2-0000000D69a-2z6C;
	Wed, 04 Dec 2024 16:03:56 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlK-0000000D4SA-26KE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:03 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso71762821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327880; x=1733932680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=VcABfeOyRZH1E6jVXvM//kkMHr9+X+ApgrAVePJJadksiJGTbammuGRTYr99Eb4lWW
         qkDjVJljl2mPjYgCEIGsrjMjWpobmJzA9RHiY8FGQw8WfWbsKmgvaCVloqcMIBim5+In
         rirrseqDK1Q/aNsh8Jve3S10p/p7Mfyi/A0nm/Lh+cV7rX3A3SzYd/FIaJBkyQyiK4UT
         G7PfcjQmxmeZYkIJSh7d0nQag3IhBnPIbK6zMs5i/vYnqVQfY1Thi10UTdVOf/VNdBZM
         xClC5NOJJ3EGpiNpzelMHJno0J/x4RmQZs+RIUVZUJGlIK6fs/19WMAoc5qqYPTXH43R
         oJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327880; x=1733932680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=p7QKqOpuaFOw3kxcndyBxZLSmZK/m0FMIrS/0JiwvxbWdNZ8H50aMmanu4ffsRm1T0
         JHIpd7R/E6unV6ODexfT1lJ2nJToQubDT+1BSH5b4nKRlAIC632fwdvhBf/+H2noMK26
         tmVrlrS6pd63XivvYkeWyF0oM9+tJNp86KulxPWtH5HcyX/UcOlWiDQRb74i5+6SXWSZ
         OXILV2W1GokFZ0rZm5TgsBV8/rjHUiuEUlVCm3nzEjzSPtl2FomjIiJ1BhP/EErZfaG0
         fUKA97f3BkGOb+P8QS/6bWDb2wDKFtPYxi+kvVGJ4scvWMy966S+Uviu/Hyu347/EWOe
         M4Jg==
X-Gm-Message-State: AOJu0YyzurC/CkotlwTVHULuHO8KvyWaeHYX+ZTdM1Nh+TuCCV92sN+h
	ew3saP4Gw4xdYbsKttxYUeR5TB8zdlpmU4gzxxblJQxsDBH8Jo5t
X-Gm-Gg: ASbGncs7L2j5UAlDy3nl7qcfh+UUmCPzQ1jaGcVAUGHx+PhYOBZTQ9jAVPs5ggyjTFT
	0vUFO+qUFKO3jpm+V1bo4HqyJDgJdLnhv23d87OjOaPD2ApkVLYiQaa7/xIhTF1SZ83l626pSdb
	XkWM7yaOxnO9yOaL6XJGpw/6MeHn9Qd1BRq8VidQsc3FG1CUcWALU585B2HalLPKwaf9kJdTp5N
	FuPyNeYLmlRIQHCYRuRFvlEI779H1Ptdto1H22zKaAak+4wW0kG12YHsXlC47+Xsg8Ng1Ts4tAa
	f3scW2VArBltT2g=
X-Google-Smtp-Source: AGHT+IEnG7rAIHbmYk1mvEg0ri78z0sWiaMH6QfOyp2+jXWu85eTrMU3PvGvXTghn3BBrs0fux21+w==
X-Received: by 2002:a05:6512:12cd:b0:53d:e5b0:1709 with SMTP id 2adb3069b0e04-53e12a22fc1mr5089410e87.38.1733327879786;
        Wed, 04 Dec 2024 07:57:59 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:47 +0100
Subject: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XPKa8479dz0V5E5HAGWYwOAk2JntXJAee03QMzKRTSQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvch911bcazEE3clz1x9w8iZQmmDlX4uDR9z
 07T6Hpka4SJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B73AAKCRCIgE5vWV1S
 MgBKEACj7IXfw3FWzIMmgTNg4C/ssmHFA+VrYa1r+Ni1oPjhCk3fKvz5VL2/mwxOcpWriNPVkeW
 VPIdNAzyTkw/TXyFjLYdH5mtGO1cHP6U8l+lLm1qWWImSzXyTraAuIC8iFc69gAUYUh359rj7k5
 L9rNoGsHhAT4/wjcbSCOCEWbf6z3eUuCNXQ+I8Bd6whCTSyLTfq7keKpghzzPK1o30lf8GpDnIV
 bzVYkd71OtDyKkqNXZ0r/zQhOJ0xkuy17fxfKmUwDRXW6zPjEBwkMvGoAcKRDGG2lvrZNqg3L97
 FdLG/LlX1EMP000XJbUVui5oluOvAhF41THQKnHxKdqGON+IuHzD4H36lGMOg8+VpM1Ol7UwYa0
 TpUCbEvI83waD/2riwpFDHgVrgwV9WhJsLhXAyDME7+TJU/+eCg4rQsbqJUlZ5ihwRo4XguS5L2
 petdLHofkYcZKGFR9QtJNrbywhGbRNlz9GiawyoBsBesF6bLoDs0b41fVfltuGiPKihBUhqJNSH
 +vkBmT17upIxRjy+cX9mBTi5qflxTQZcUfq2sNOjc/K7zTfdgzxcjh9sEA8UQHJFxMI36AlWG/c
 vbuqPoDDm0n8i+EVwcG0tkYOkT69xi1V904+mHesdROU8xWDJ/t1zyXLY4oR3mARqwEWhdVYog3
 VH3Y0+T0lxBzxQw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075802_539607_3B5323D3 
X-CRM114-Status: GOOD (  11.73  )
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
make ARCH=arm mvebu_v5_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mvebu_v5_defconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 2467afd32146ba7ba2bf4b71053a6747bc58d1cc..0e3da23baab417378afcbc40fca88ace5cd51e57 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -1,5 +1,4 @@
 CONFIG_SYSVIPC=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -15,7 +14,6 @@ CONFIG_MACH_DNS323=y
 CONFIG_MACH_TS209=y
 CONFIG_MACH_TERASTATION_PRO2=y
 CONFIG_MACH_LINKSTATION_PRO=y
-CONFIG_MACH_LINKSTATION_LSCHL=y
 CONFIG_MACH_LINKSTATION_MINI=y
 CONFIG_MACH_TS409=y
 CONFIG_MACH_TS78XX=y
@@ -45,7 +43,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 # CONFIG_IPV6 is not set
 CONFIG_NET_DSA=y
-CONFIG_NET_SWITCHDEV=y
 CONFIG_NET_PKTGEN=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
@@ -63,7 +60,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ORION=y
 CONFIG_MTD_SPI_NOR=y
@@ -96,12 +92,10 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_SPI=y
 CONFIG_SPI_ORION=y
-CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_POWER_RESET_QNAP=y
@@ -166,7 +160,6 @@ CONFIG_RTC_DRV_MV=y
 CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_STAGING=y
-CONFIG_FB_XGI=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_ISO9660_FS=m
@@ -194,6 +187,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y

-- 
2.47.0



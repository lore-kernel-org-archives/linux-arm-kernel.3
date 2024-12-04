Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BA3E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=; b=btS6I3tZskjPBeqZONJlYS4TXX
	MNlyyN22ogJEtupiO17FQ6/zuG0NTJBSPYveR4Uqw/QUlbxplTbRyQBXOs7TuluWVgiXkgzN7Qu/K
	Ff8JyK/nX2nrQrvWND8NLFgIsfHCx/UC2HihgfSLUjCMBDZZLmIitWhOvhx1Bye1yi5xbefyjXMqH
	K2CHI/K5WaUfcXp9eSfk72iyIVqosUjX6CfbuzBygkWwZrWhJQ62rvvIcPoA3bAcOB/6v4SN980CP
	4BgLZKuwTorc5w3FJjXxfCx/Vr2x3mpQ4r541eJIFQstlF2xH6y0NebderwIDSxgIH9744X3zHfCq
	Z5osXhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrs1-0000000D6PZ-2fbp;
	Wed, 04 Dec 2024 16:04:57 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlL-0000000D4Sh-2nKy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:04 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53df63230d0so8354032e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327882; x=1733932682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=WM2xujJzRRwHIvuox5nPpQfVAQ0f8WrVhAReR2KBhYfPRJuZuIB0ZMaw5CHHcS8xUg
         QGRMVzO9vT8wvTwzPrqd9M3Gy9gcBfM7Nt+f/cwPsL2KXYajZ/CXYuudiFijGO9mpFSG
         Kly456CsK902PVsn7ATb1LeL8CZaj0TFpZ2xGW3CdgYJoleQcfzCG2oK+x+3UXrbBxnR
         hN08kOgS8oaqRKtZgeX/ukDDqRDs5BIkTkNg/q5b+SSQ54OjrHS5nL2V7ejfcS0nk7D8
         5M7+3VRJj3wB56Fng5gubUrVYgHdySFqvTNMGVM4NRuHJmbyoQE/2/UX+9KV6hNYMv/p
         qXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327882; x=1733932682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=kcrftbBk+a89ecVMDdHD60BOz+j68/LtqdsCTBwIjUOqj2lnaU1TllFVzCuGQDNNPs
         Le55EkZvNiJK9nb7QJacu4HtgC2X74LFabrEL8+KGDUUoZW1/DW3skGa9gb/wLliLxgD
         VaaD1znNb6GgJGBBeRGyXvtw7OeS6p3hoAvmRjaAa+Cfxf/+BoqiqpjHm5No/NkUZs21
         erpiT4QJSXKslU1FcvbKnZBc7YjYnBrTvX0XSiqdhD8sTvJbWxO1hYn5OycMHEnam/Ni
         2CfA9zBiRFTUWjy5j9YXvRWpW4uQO1jpvjMmcrqvWps+pdnPpVeya1rzFP0w/9X6ZCkm
         7hdg==
X-Gm-Message-State: AOJu0Yy68CId1fuqi41nFVHkSUykU/eT6UIt920YyxoyUOEOLRXCj+yE
	48+wIICzJs9dq+MYB2uLxm9OEnfFy/gdCY3axvlmQtxHDmV+nhno
X-Gm-Gg: ASbGncvFnyoGKid0fEiGXUcXbBaibIqWIpMRwocTq5FdLmC7mrFxNFU5PXQ9ZD2IrQj
	KhFgiz0lHMIlTNhEBQiD0/zN4lLmPdA8h6PxhrwXqUkPlXH0MYB6J08yPojnjGCTv+M6mEoKIj2
	toc7vClKFIPV93pxDe0foyDqMZcfz3I7zKd22vuQknWk5tQSXWfRZh3RDqwtaQ+AyJoze+CyQIp
	fHb2rp2nuqy5+5IlAh/8YrMbjOx4lmD29259OvLqud+ixslXXmUDLCyF/EYZ3+BRqehwohXSh10
	Fe1QjsNag0MQw8Y=
X-Google-Smtp-Source: AGHT+IGlGfDEsLcZJyCzWffbXy66rLrrA/A5XMM3tlpdjuHEhy8pE4BtS8IqEvBnXzldcs47eI0LSA==
X-Received: by 2002:a05:6512:e8a:b0:53d:e5fd:a445 with SMTP id 2adb3069b0e04-53e12a06e21mr3757767e87.32.1733327881991;
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:48 +0100
Subject: [PATCH 6/9] ARM: mxs_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-6-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ajy+2nCoY0jRWJ/Q5MIKS0ER7X03c4YJ6hvrLukAy44=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvhynCLEQYuXH5PnR++kC2KxmLUbqcle8Eoq
 qUMUAZbFfmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B74QAKCRCIgE5vWV1S
 MjC4D/9948E/ZGupe0JL9qz/HV+vq88mwiMZfy5bYuiLi0mawPEdE2uesGekyVhJlUUn3u5fkHH
 23CCFWd79I360dPFYEuE8Pr5SaXEFO9Yy5CF2HTmuqGs9LjOoN6ZAt/dbH2pd0/teY6mKsMOdrp
 bBdbxn5o3R2QXMVh9MhuIG35bq5lq75RdxZlfPE6w/DEVxuO9cu8loeetlAAjvBg+ElOViZXnTa
 uo/QdfGDXKeL0FrVHWOrTFwhxlCsHpVxf9g/Sl5KcpF80f4YmDymMQzGZxZL1/cvHo97aBMy2Gy
 Uija49yz1R/kX3N+koyGQQEWZ5zrg6Gtay/hmGh9MMvVFkCaJXBVpjTSayD17D7ueVO3leJzLCv
 /TVEzz3K2PNKo8xMO3Bf1H8Cj7ffX3ZM+oZf5yVXHg4XGYYDU5/nH2QScUkz5bYi29vLrZi93rs
 etEkCa2JbLpnRGQsiiBs4ekKzqyJ3jhDm/F0lmT0PWLgYCfngpabuwsFJ7VVwKT0D4KYrHjHnj6
 W2/dbCTgkvYcji04jo6WP2r1k+nLDsPPuEqtjK731LANzG2uDxRFLFu/Kpn7Xew6eqsXOhg6B6H
 Bx2MYz3m1z4bTIwQViP5Ust1uAgH9scAprUt8I+fGVbYuXjHJgi1SQs7zB4mk0+cU8tSXmt063s
 NGxSS/YDCnB9WzA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075803_712220_83210D25 
X-CRM114-Status: GOOD (  10.51  )
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
make ARCH=arm mxs_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 43bc1255a5db9f4ed8f65a98a69284e1439e44d2..946f508ad62c326a0651c8a5da0626ee33c9bfd3 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y

-- 
2.47.0



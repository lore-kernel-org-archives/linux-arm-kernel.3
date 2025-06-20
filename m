Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7813DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=; b=dG1rc5Yp5r/1psZBNfbQHTE7pk
	gb3MBENDbc7L4VFJnPhaA8D+VHBpEBle+/ACGM1zLjgrAkniMNI92JOYwkItPLzIigADTGkeVQv2b
	PnsRFni9C2U8needGRRZ6gY3SFo67tMuYRlbq+myBqi6wzZJzz7I4E79PEHJWN/w8T5imG4IHXoM8
	3R5goNaf0skccAZRunKuw544uw21X6HOhogOr6GcpOsVMx/6j1Q8JCflWjQOrrh051J2Gr9vzOiyl
	NFlqB07q2yAYS+mT3O6tXI0rDPZ82IY7YYY4OP+PG0P0lRMPLHVSRrOF1hc5uES0spEG6otuVyE+g
	Yubn5/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWzv-0000000F2cO-2I0S;
	Fri, 20 Jun 2025 08:21:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWli-0000000F0CA-4992
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:06:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d54214adso11494765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406798; x=1751011598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=IZ16H2ZAFsnsnolrWxsKnfuh4b3nXLyU63/QlU36ILMImnqSBtCCu/JDuDkozzKhcV
         Jl55dXZxV/Gq3bJ7ubgGYMlgwiJBJmtAKlWgTKATzYuJvG0xw4RH9Qj5OPfXdbXZ7sqU
         LQKz+RzVb6R6xqni5xQWeizut2EhVfX15U4oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406798; x=1751011598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=LYiOgqg9IgXKlWnjaVRpRKWbvVZ2jVbKzLkzgw3JJEGWTtdDt/MYy0dhkDPGOUFBVL
         z5MZzQodA8Oze7r11J+VjvWhDZspzqS8AWU96TSTRPpIHjBXhm25kNLMmCn5AiNF7N+w
         dQcYzt7zScCG2bv2JtLdSIg0TgCKnTpy4fKxdFGz0xnXBXdgdNlfd6ULdKqqYSN/+Oif
         AxbuzGhMv8gKv5uHfmA0TYPwiPekcdz8dCy+qyCgqF+CxHw2JbjTLyfr+8BFLO0V3FTX
         LQwm6RlzKZrnZDBZPB/j8jFZmhE8cU1K4NoqCN8l7d3xVQaonkBVvrDQDmURThm/KPrs
         mlTg==
X-Forwarded-Encrypted: i=1; AJvYcCUip6XOH55Koxnqr27LWD6TDc9qQpoWkQzWdvAvPvnBgiew5EHY5MC/p98369Be+yAb9n2S5sFKH22eiiEAWbnL@lists.infradead.org
X-Gm-Message-State: AOJu0YynHJvM2lCOmUFGfLWV/2og/leroIFxg/wGdvFv0gdkn7DDYy6G
	KE8I0F7mvpnzgWrr0WWhA87uIHYO++cCvKkDbFz+MsOzFGjR2ekpMWtQF1bXnt1xsyU=
X-Gm-Gg: ASbGncu+/bfzDiMHCM1htRqH4ypg2IW3Hmw7WuIrfUEZCJB+ZPVvoiSMSaTRGwdPybG
	xtfXxv3djSZMRcABObfCCaOWAMbrZIdipUy2rEbQwEnL56ev15TNOgN1LHLYxJ+sPjc9fyZI4Ib
	+khv76sqUMWgJKmcZS6+zCzO7K8vKiHvdhF1UWmdfgENdx3iktxVJWZi9s1D+J5wNKQnRSuv9+z
	ZHvFOAoZpDoZ/37XivOG8cg2pjKIMJMnwG/rFBVaR+XbOndx6Ficoy/gE9Tk5l0SCjUIH3F47b7
	qHxru/TcA0JQqrNXtwZYJvP+L+3WJGVo+t0ul5XdIpoyj1ngFQMKSAifbjwciu78DTnlBEGCJsZ
	cAGWMcGcfDveVcWPBgLGL+W3NXP7+/n5cyRIrNeS0YNAdUs3iWHSX
X-Google-Smtp-Source: AGHT+IGb4WTKjAgplBaJ43AcvLwV9rDMcYvZ4FV3Nqt1/QYZAA9vX0TgK6mvlDJ83u+kYk4oGRTS0A==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr14377475e9.27.1750406797641;
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/5] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Fri, 20 Jun 2025 10:06:20 +0200
Message-ID: <20250620080626.3580397-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010639_027725_76DB3272 
X-CRM114-Status: UNSURE (   9.57  )
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

Generate mxs_defconfig by doing:

make mxs_defconfig
make savedefconfig
cp defconfig arch/arm/configs/mxs_defconfig

No functional change. The goal here is to cleanup mxs_defconfig file to
make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..91723fdd3c04 100644
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
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE1E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvkL+iGL9dXyN4VynI/wPtrLJWQRP5/GbBl00TeCCOM=; b=kByNgIi6OJpcA4BH3wR0kCSLa2
	DF7aWGZyyi33ucXkfYVHqOfDlzl3iI9uTcvnOtijTWhPbA4IUVSEugkG8HS2DgLFmguCeCMa3JOxD
	vFMw9/rAJ9UdTWYW7zEYq+vl77t2gY9GL8m2tDSyiZ6etQQHijB8Mw0gh68PtbCiRksczW7P03FJ9
	zAhVXNOAyDzOjOH633cs+guf7tSxavT4z2bO5r1Npg80plMqSoquEKDHdZ00/xM48L2ljyvoHCOCp
	tpKCLZj9hMlofRbTj37UineofbCLQy8g3/B2J9iWHPWE+PBP9EdU+SNrTMJ2BR0/bgy6kkbUEFwGp
	sYYXx7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrq4-0000000D5ue-0PxT;
	Wed, 04 Dec 2024 16:02:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlH-0000000D4RO-3tKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53de852a287so7622094e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327878; x=1733932678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvkL+iGL9dXyN4VynI/wPtrLJWQRP5/GbBl00TeCCOM=;
        b=imJPPtQmNY+cQM2Z2PAWZTR9sU9nxwlHpLbco37kDvzrTqid4YHuEPmrEihr36A3gg
         jMHAd4k0V+bke5K1wQsP4vfm3Ic7cPzOrJK1/+LDPPkPXRtXbQUtbtknOP/4COZ15crH
         1Hc4JBbFmT1r4wwT6SnbCfwmabB0iX1bgy2zzv2HZlakXV/RSHOQfjb6+vowqy8A7ryb
         nLroUb9QxiTe757/fZIo09482UUa4VsJrmpfnQrpIBEyWh6fcwdlpYWbB2h51N/eDzHH
         9MaeU+3r3Diki+uHcXRzF/Kb/jzRMNk9mef6EUc26T5IDiEPPE6iMbJRV7gOpGJx2OKS
         jYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327878; x=1733932678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvkL+iGL9dXyN4VynI/wPtrLJWQRP5/GbBl00TeCCOM=;
        b=o22qMBoiRhA9V8nmVqvAm5Zz548pOZfrPN960WlhZy6FgVEvhiYi1tClIztT8O8Htc
         ZkZ8khTp+ZH47PmT2dOs+fpJ2/r2TpNgVrsqYcwT8RWZuwcJ6QEO29g2S/lYJFsxN/6S
         E7CtxI5GXIu5LEN/STd1JnlBxaxtT3w2xQYLQ1/BKsT3M1vAGgRfwsWM5zWqGgYhGabh
         JtUbDD9DlhLddxzF2Z2TaMI/4JGhdZFE1DV8KQoqEhbeKy2y+rBjSchpLBai+ZFkbvp0
         /xhrAPVPS03sF0xprOEHN6C/7LBrjVGOYorADVMXLgBUwgLrGXKkV9HureyOMOOjD3Oy
         vIlQ==
X-Gm-Message-State: AOJu0YyYT33zqCbXsgXPz042TC72/dP0CLBjewqYNdWJyjpGTl7u3hOA
	kJKvxeqwPIrbbrC82rMCONdRUhp7PWJpN8XCXv7VXWQ0XjbvMmEs
X-Gm-Gg: ASbGncvwXPqup9jBMuo97f3SEBaS/2V5ebQU3L2PJL/tbrl0A7Zhc+5vhfX17ko6QZh
	U90bRmnZyhfY6K4JZavLyA3ynNDxzqenqoI3m3BVQZyHfduLBHF2tvrMi+BFwM9iYA1kirQEOVe
	VAqakzaXkYrsIpFodMesB3RkXBi53rYHXEK6WOLJJ2JfstS22usVg15JbtGvKHjRQBfgbG/Ekrh
	U/9b0ufYopXN98oU+/S4T+yYJX63C2HFVireqT6xqnfr/vIBUIwmlPGrAZHXLvNULthylyEKCRv
	MuMSJcsV6WCeWXU=
X-Google-Smtp-Source: AGHT+IE67J6k3HvkHJRG20ocHCZ9O3WvIIZUThbSEm9x3FYTGNUFEeEanYYSp5FF2xnbedolSUZgiA==
X-Received: by 2002:a05:6512:4028:b0:53d:dbb9:f3e8 with SMTP id 2adb3069b0e04-53e1b878e31mr1822141e87.4.1733327877559;
        Wed, 04 Dec 2024 07:57:57 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:55 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:46 +0100
Subject: [PATCH 4/9] ARM: keystone_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-4-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=oC5WpfuhGcDDhe0hfhnhh6bRD144vLn7vRt/q3XD9H4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvX6+Vxmycmjnq4bO+MBXpUvKvu6jheX/FrG
 jK4MKR7/uiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B71wAKCRCIgE5vWV1S
 MuvkEACuj0rtF9LabF7AJ6GXYrD+sFMrZqOK2SkVUNMfkMAAd0t2TS4AYvVLU3zaQbSVi8xoE6Q
 wOcpY9OvrnIWBmCV5rcQoJRDx14H6ry5LcaVrLWmvPvWqb2aoSIpxKpngH0Z1uQY/9Kk3UBc0PQ
 33t1VSiln8g1/S/L6xKTfuPTMMVQrd+R6vjMHBCS2RccCBxqb39sDZwA1dq91KiWNVG+Ca/8l7z
 iH3fGxtldUH+0is757NpjHKBqqu/OvLcWqojSSYVK9lGCuelYDIuBywqGpHpK06WJ8pCcbQgJHF
 S2tVUvEfP2oRFWGeKhVB5Ud96MbfzBIkPtHICuMAGBIPd8gD6+mTiLE8gQwDDDmjAYs2ja124X4
 bY4pqWVlQsgX4WvPgdN5tvwXFaDTgTfFQy1jYCpKU6MFVBlSFHtrmYoGe8/2wwdB3qZ/N2IujuD
 Y9gSW6MSLrQqlzy5twUNQQ+oQJU2PZ6T4LlRh3kw3hknel9e1tWahXUXwUxatTgKZAz1UKQBh6K
 UxVJebrcNHapNTNoInzydLPmtGunnInrR0EzfwF3VPrGC4qU38FBJ98BA0JS3KuusiZO4s7LGX3
 Q+AUnU9h70Rbumki0AY1Vy20+/obpZOb0XIJozYuIHvYIQVOEsmF6E3M+4VeZQIcCs+EFER7jYg
 96GgoPbronYdj2A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075759_970170_7084D2EE 
X-CRM114-Status: GOOD (  11.07  )
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
make ARCH=arm keystone_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/keystone_defconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index c1291ca290b23c7519a0c34ac5951fc0942c45bf..c5682f2728a176c054313f351186f6e548cff8e0 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -11,18 +11,16 @@ CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 CONFIG_BASE_SMALL=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_KEYSTONE=y
 CONFIG_ARM_LPAE=y
-CONFIG_PCI_KEYSTONE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_ARM_PSCI=y
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_VFP=y
 CONFIG_NEON=y
@@ -62,9 +60,6 @@ CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_INET_AH=y
 CONFIG_INET_IPCOMP=y
-CONFIG_INET6_XFRM_MODE_TRANSPORT=m
-CONFIG_INET6_XFRM_MODE_TUNNEL=m
-CONFIG_INET6_XFRM_MODE_BEET=m
 CONFIG_IPV6_SIT=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_SUBTREES=y
@@ -90,7 +85,6 @@ CONFIG_NETFILTER_XT_MATCH_MARK=y
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
-CONFIG_NF_CONNTRACK_IPV4=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_MATCH_AH=y
 CONFIG_IP_NF_MATCH_ECN=y
@@ -101,7 +95,6 @@ CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
-CONFIG_IP_NF_ARPTABLES=y
 CONFIG_IP_NF_ARPFILTER=y
 CONFIG_IP_NF_ARP_MANGLE=y
 CONFIG_IP6_NF_IPTABLES=m
@@ -117,7 +110,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_DAVINCI=y
 CONFIG_MTD_SPI_NOR=y
@@ -144,7 +136,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_SPI=y
@@ -189,7 +180,6 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_ACTIVITY=y
 CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_DMADEVICES=y
-CONFIG_TI_EDMA=y
 CONFIG_MAILBOX=y
 CONFIG_TI_MESSAGE_MANAGER=y
 CONFIG_SOC_TI=y

-- 
2.47.0



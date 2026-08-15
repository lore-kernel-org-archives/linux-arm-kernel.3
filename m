Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A97C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnre8c5ELyuSiuJWMhk8ldl+BWHHGb0FtLgEFX/aWjw=; b=woNnBKUpp1IvpHrZ47KAQIObPH
	c4XE7O9/0ZZD4fcBHnjjpYB/uC7zLkOb/s+J5HV8ZDqQdfWUNQBmS5pRZ3MCFT1YnKghvjEf8+Psr
	KchzO7QlkufTjNAwr8Zu0a14eWGmgRdhEjH6l/vbq/exnl3hduw82ubPWCHegjh5agqREys6KYYmi
	hGqG8PP64Sv1QAV+sxZ0vXFX5K9jDDA0nggu0Kc1V7HTj4/yWkm/NncYlTsesEyFb3y0lxDYJviVk
	BgN9TMvkctWIOkxtf+qW0+clfPzJPvz0d3BbvVlUPe/H0FVlu5GzLx9ZjqL0pKgrmOe/uyqdTIdgc
	f0fKSCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGMg-00000003us7-3c2M;
	Sat, 15 Aug 2026 15:32:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGMe-00000003ure-1xnh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 15:32:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f84023916so1863570f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786807922; x=1787412722; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jnre8c5ELyuSiuJWMhk8ldl+BWHHGb0FtLgEFX/aWjw=;
        b=r9Dr34ogzOgY4E4qXXgKgp4g/Td72PWeRPKj/gn+Ps6P43W9pZhG4HsE8XGnM62phn
         9FO/czYQ6x/ig9uJ3NmuFUuKHZnnp6wNoi5eh7tH/fWr9jDx3P8Vqzogssx3fOk7Vo7s
         /qrROuoQaW/zZu+Qy901MjfRxcQyUrt+yRlIKrNmm2hEY381sU4TfajvQ6HoOZSd7yyj
         VQTxbcpMmICHyfBcYfk8ySWK1ao4BytPLivJJEYCeAn7t/vdvF9AvULq3bvOSFg7vEVz
         d1G2/0bOFySBeIdFTjYi/NfOpopKon9X8/DvsHbc0gA61WrD2zCIdi1AgQJsopdhYM77
         ylKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786807922; x=1787412722;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnre8c5ELyuSiuJWMhk8ldl+BWHHGb0FtLgEFX/aWjw=;
        b=g3tQtd1NfqKzsD8coDZqnFwYEGN1of1QZbrP/AafCKNpNe2K00rJ6w0k81qOYsmAqt
         pFymtCvCO1jEtnokednzy9ZdyvqJBWs4UbZfkwSzI/mtTkOIWFlDYFlntoM07liBK8YU
         l422ydqrR16LOAPen5T8jkgHxgJLp3BYSwnx+A7ZmQpJJdGbJhY1hwzut01MOgcD48vN
         addyW8GA2Lr4R3k/anHRL0UCE46FNaCcdFPN0JbM2DhEcBpQETeWi2mA6gInRKZmt/d7
         abo1MgS/0u7sLdQUbfz2xU16Uiw/fxNYc4gIiPRuNY/3ZbcD4vytkDWMcx4OfhdzsdyK
         8YiQ==
X-Gm-Message-State: AOJu0Yxd8E5wfqIx4mbEnXs4ic+dloEiMWc3Sg/hhL6ugs+u4EFgG3iH
	1g1PKrAqEcPTAztQLuReRd2ys0GSVIpbSZ3UPsOKAQsHwJBycopN1tk+
X-Gm-Gg: AR+sD12SCbnnPg0fftVeM86A+c6E4/ng8C75xwUJ093Cpkhbldf9j5lHiW23YPI7K7t
	tOgEc1ErRYCb0P0J+wmu6fwj4hl6ck3D4Dr6Z46uARCMsxX9veaEfqQw5Mb9NhWpjxIYBMa6z7K
	v2E8RylmW5TqoR3F/nN75CI6dzrrvxS/74hNQwy/PlwnH1/oKxAYL+hrSNeYjc3I58pM5FhND7W
	W1s234FZpJir77Y64JoysAb8E3nZLynryHcU3zlBjlP+y0v7TRJf44uVuAJH6pDm9BSP3txoOl/
	2NnlNuAzWYcaX1/i+QAY4isKRfyw5TAjW1rDTtTMlXR3OswkyFvZbOxH3/4xCngmNO0ioCRbOPy
	3NO4RllT0D6NgsF+tAw0jnwTvmSHu2ImWmdWtLON9i9QOUJ8mh5+suqgmYlYb6psj+BET8vCvRv
	85nJtg1gszq1yshBRGoWkB0EF3DNH6W4HVDeWRr65hQSz+xPqYPTygIMFypEoGQf8rVVdIn6j7d
	prLFk/z/vjeR6hMMBVBwo4hMHGG4KLfaQuXyJAhSOgsORk9bAsPAvffMbUKvDdCvzoPisPLd3OO
	wlU/UIY+kZtnw5aBl8QP3Lu+P7Nap+hAU0U+fw==
X-Received: by 2002:a05:6000:992:b0:481:4f7a:f685 with SMTP id ffacd0b85a97d-4816076c695mr20415359f8f.29.1786807921745;
        Sat, 15 Aug 2026 08:32:01 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f13:e300:f992:e6b5:6d1d:31bf? (p200300ea8f13e300f992e6b56d1d31bf.dip0.t-ipconnect.de. [2003:ea:8f13:e300:f992:e6b5:6d1d:31bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm18253466f8f.1.2026.08.15.08.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 08:32:01 -0700 (PDT)
Message-ID: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
Date: Sat, 15 Aug 2026 17:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ARM: imx6q: remove KSZ9021 PHY fixup
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Stefano Babic <sbabic@nabladev.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_083204_594275_DCBE9048 
X-CRM114-Status: GOOD (  11.74  )
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

477fce49aef4 ("arm/imx6q-sabrelite: add enet phy ksz9021rn fixup") added
this PHY fixup in 2011. In 2013 954c396756e3 ("net/phy: micrel: Add OF
configuration support for ksz9021") added support for configuring
pad skew parameters via OF, removing the need for the board-level fixup.

Note:
In 2013 14078291d89b ("ARM: i.MX6: call ksz9021 phy fixup for all i.MX6
boards") extended usage of the fixup to nitrogen6x and titanium.
nitrogen6x configures the PHY properly via OF, and titanium has no
mainline Linux support. From u-boot titanium support was removed in 2021.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/mach-imx/mach-imx6q.c | 30 ------------------------------
 include/linux/micrel_phy.h     |  5 -----
 2 files changed, 35 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 7f620092575..58f53fba202 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -20,26 +20,6 @@
 #include "cpuidle.h"
 #include "hardware.h"
 
-/* For imx6q sabrelite board: set KSZ9021RN RGMII pad skew */
-static int ksz9021rn_phy_fixup(struct phy_device *phydev)
-{
-	if (IS_BUILTIN(CONFIG_PHYLIB)) {
-		/* min rx data delay */
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			0x8000 | MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_DATA_WRITE, 0x0000);
-
-		/* max rx/tx clock delay, min rx/tx control delay */
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			0x8000 | MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_DATA_WRITE, 0xf0f0);
-		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
-			MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW);
-	}
-
-	return 0;
-}
-
 /*
  * fixup for PLX PEX8909 bridge to configure GPIO1-7 as output High
  * as they are used for slots1-7 PERST#
@@ -68,14 +48,6 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8609, ventana_pciesw_early_fixup);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8606, ventana_pciesw_early_fixup);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLX, 0x8604, ventana_pciesw_early_fixup);
 
-static void __init imx6q_enet_phy_init(void)
-{
-	if (IS_BUILTIN(CONFIG_PHYLIB)) {
-		phy_register_fixup_for_uid(PHY_ID_KSZ9021, MICREL_PHY_ID_MASK,
-				ksz9021rn_phy_fixup);
-	}
-}
-
 static void __init imx6q_1588_init(void)
 {
 	struct device_node *np;
@@ -179,8 +151,6 @@ static void __init imx6q_init_machine(void)
 		imx_print_silicon_rev(cpu_is_imx6dl() ? "i.MX6DL" : "i.MX6Q",
 				imx_get_soc_revision());
 
-	imx6q_enet_phy_init();
-
 	of_platform_default_populate(NULL, NULL, NULL);
 
 	imx_anatop_init();
diff --git a/include/linux/micrel_phy.h b/include/linux/micrel_phy.h
index 9c6f9817383..bb71b2510c2 100644
--- a/include/linux/micrel_phy.h
+++ b/include/linux/micrel_phy.h
@@ -47,11 +47,6 @@
 #define MICREL_PHY_FXEN		BIT(1)
 #define MICREL_KSZ8_P1_ERRATA	BIT(2)
 
-#define MICREL_KSZ9021_EXTREG_CTRL	0xB
-#define MICREL_KSZ9021_EXTREG_DATA_WRITE	0xC
-#define MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW	0x104
-#define MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW	0x105
-
 /* Device specific MII_BMCR (Reg 0) bits */
 /* 1 = HP Auto MDI/MDI-X mode, 0 = Microchip Auto MDI/MDI-X mode */
 #define KSZ886X_BMCR_HP_MDIX			BIT(5)
-- 
2.55.0



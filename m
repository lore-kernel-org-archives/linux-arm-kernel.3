Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B7CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez718thJEgBGVPbjA/5JBbctzFxEgtajT6pnvZZIsFM=; b=QelBqzNjtjOZIR+tX1+PL2DZfZ
	dm4GxTZZwwKkUXec0vQgsGIkb8IoPJu8WAPMuavGDDRhNAcwwfd3zd4ybhmTpl5hVc66W2oW3FlqF
	mS4RU8ZEm88Ltd8hbN+XnSAVU9BYbyEpMZo/X/3ukhCwDLI0qfSXtOZwz3nhnwQdD8f3Ou37yG2eR
	U2Q/5F339e4+e/innMHCXjS0JQSrgOtRbPuYNgKg7BBMPSIwjHJ5VnoJ4AuHRM5EBBLgT79+UJ4ke
	EtI3wpL0G2NoRoUuMN/xbOFg1GxivKqjVrxzBSYmLHKNdtzQVKef4cUkaPtC2Su/PlyYW6HDITKEI
	xZXsENgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiK-0000000EG0A-0Ucq;
	Mon, 01 Sep 2025 23:13:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80u-0000000DPQE-3FPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3422797e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746495; x=1757351295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez718thJEgBGVPbjA/5JBbctzFxEgtajT6pnvZZIsFM=;
        b=AnnnyBDvR9QSglFOHn0toJBEHp4q5wJ/+F/Wd2wrnxRc59m4rl6H3wpVju5ygZsEzx
         kH7W/RLJOn50nl9kNo3Uj8U+BapHxIs5cB2tMjMCmtqHNzaQjuMEr+dRQL4lcZE/gaM0
         Rx25/SQ0oeJMQaFCbNp6SDaKLHGzmmljTfCnQT0gsUWnT8dmEqV4OMkB88K+kt3z0uap
         hzJsymRtivhcGNcPUCMGx8hhDyXvtXaWeEadrPe5NtUcu4MpenM72LFEHKY7/zn5qhx3
         lmvwf5j7jjlIkDUA1NamHBJglPJVSYuv1T04nhkuNWvQmpIQ1G+IHAScAt38BPXeHc5s
         /Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746495; x=1757351295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez718thJEgBGVPbjA/5JBbctzFxEgtajT6pnvZZIsFM=;
        b=Ege2oI1uHUJGkulltwj2ETsWXjLCDNN+t9gbRrYSDcv7XdVLrBovcieU8CrRAtrPi1
         Mt/gU0muFNas6m8fpyNFgLUThpbWr/gcS1uJIul6XFkSfVdJPBraUNRCAfzKZwWSIbt4
         c8CrLRTRyHbxnd2pUD9yPa+wKXtMTN06uZ9rAvaBQY/6HyNa/+BoS9o0J/4TLw/AvHky
         39QCPFwzVoN/w2y5OLl5ptKjlwJzRXD3Ksl+QkjxmAsy2eDrA/sGGkcMhfNNLs5sOYRF
         osptPBIkpj2od78N/jzPI8MdlzDPAYX6lmbj1Yh4Deb/2wujqzp+xpw8QbDR7P/qsGe0
         iXlA==
X-Forwarded-Encrypted: i=1; AJvYcCVM1LvLC/b+8u2A55Z2Z1l+UgLkV2TLFvZ7SVO2YTgWa9SakOEneBvYoFL0kDT0ojJEPL1IPF6g5qEx3Q/36mh4@lists.infradead.org
X-Gm-Message-State: AOJu0YyhcmiU93rfhBzeFG8sN26UzKV7EStc83U48t+Yxki3hprHBDlP
	v5E3Q1brfyFvxoOsTvt9ibNGqgmyCMXbgtc6h4tw0niwHrUlarTOf1qt
X-Gm-Gg: ASbGnctf+ml85L6f/tqPhSdXIfVCv4IUue1BosPzO+geevWMCBz+YnEfsfkVBVtQwqL
	0BWjHF9ymaGRvvfbUgLR6A7EZxAVNKQmMT31ekn++FN6CKQSUR6rjGxsd+tglbZpH8SXD2+7m1i
	75dd0DRLgg66UmR7bOHxP2p3RSDyOxghMoLfPjSe6AhaFpdJS149v8axnq+it2esX7DGlIAUIEV
	vO7QlGJ+UgZwuHXw3OrymnxcK5rWw83y1vCOMZkSvaFQr20o+0y8mKy1UYaebXZtBaRWAas3vZi
	GZfCi5hia6KuqK1HIBd0NJG+vEinmY0kwaOEvIOSYHZW15qhX97dBJW/Ra5OpI6H1b5VTMtVw8K
	XY8bKIpJbDHFTLL7MNjYqmPN7gVmC5AVn+WU=
X-Google-Smtp-Source: AGHT+IGkpS32lklXD/lmEr28JmUgh5DF7U83AUzY0TCMmOlDGuNFhdtJfvo18Z6/V6X6CkVguIgn+Q==
X-Received: by 2002:a05:6512:258c:b0:55f:43ba:9410 with SMTP id 2adb3069b0e04-55f708b4592mr2402339e87.15.1756746495041;
        Mon, 01 Sep 2025 10:08:15 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:12 +0200
Subject: [PATCH RESEND v6 6/9] clk: bcm21664: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-6-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5067;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=rAUdMtcRiLbim32aOQhQ2A3bEX5/AhJM2y49j/dPDQ4=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLKISn5Xn+v2JhuoOBbaD2kE8qnEpb7s8ddI
 ulN3Ym9gViJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSygAKCRCzu/ihE6BR
 aNF3D/4mL3It9Oiv4ExStahRWgDaCl5Rkukq9zokxYOELYbmitZd9wiYGeWEHg+4ZLVdoDS5byG
 mATA2VK0BCLHHv4zUwinu0cail6+6yMlP003bJcnBqY6Z9iP3nWMagxWcLZD54UlzsEFq/L9w0R
 FjlZ+DSSV+zV+qFTRNlNOx5fGTP5eNTALXis0OkdD0tJhTJl/a7GzpoQzjnpV181ytxrVp4ni2+
 kyBFbunn2ghHSiLyb/I8LLCpWAMkL3kTIUyXo/4fJKMUM131ED0Y0pH7FSmB/Ek4kG+Z63x1vpe
 6+sA4POM5qCvP1k8dFyrK6kJdeN4Ia8+7mLMs8zkjV7Gxd1DDIc32FMZ0zqwL5dI1CPkl4Hq7EJ
 eTrrZXxrcIN5yBk2q8DdXmHcmJjdpNdDKAwtPQ14G3zWwJVTB0JiWeak0oSxljX+rOW7C9mVmvn
 URuRkxHkV+U5BwNBMoNIzBMmuRKN9JzuMSwX3HeTM8ftFnuleHalVAqdKyoKCdQOaLXsTq1v+CR
 wlPTPQq7qkHDast99zBQkrUaj5V1zvHDeXUlE3RAjpVjxalDCyr9pBmW7KLkM7E1kSXw5oCHASd
 ithBgEqGIE1/oEICodpdhLmGiT/GZfNcPQiiU2RR+Z9RZYVKIsHb99XItxMaTGIm7e+21B8gyMh
 Z7wh9f9x6jC9qfQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100816_847201_0B0926BD 
X-CRM114-Status: GOOD (  13.31  )
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

Now that bus clock support has been implemented into the Broadcom Kona
clock driver, add bus clocks corresponding to HUB_TIMER, SDIO, UART and
BSC, as well as the USB OTG bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename
- Change commit summary to match equivalent BCM281xx commit

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Adapt to dropped prereq clocks
---
 drivers/clk/bcm/clk-bcm21664.c | 89 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 14b7db824704824b4a6bfcce79308afa44e092c6..4223ac1c35a258bd30ba2bd4b240da6b1e88fa06 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -41,7 +41,12 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
-#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
@@ -52,6 +57,8 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
+		[BCM21664_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
 		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -126,7 +133,27 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
-#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 0, 1),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 0, 1),
+};
+
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
@@ -151,6 +178,16 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
+		[BCM21664_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM21664_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -231,7 +268,39 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
-#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0400, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0404, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0408, 16, 0, 1),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0458, 16, 0, 1),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x045c, 16, 0, 1),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0470, 16, 0, 1),
+	.hyst		= HYST(0x0470, 8, 9),
+};
+
+static struct bus_clk_data bsc4_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0474, 16, 0, 1),
+	.hyst		= HYST(0x0474, 8, 9),
+};
+
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
@@ -254,6 +323,20 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
+		[BCM21664_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC4_APB] =
+			KONA_CLK(slave, bsc4_apb, bus),
 		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.51.0



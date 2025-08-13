Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ECACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6v9b5bSF0XUxHDNFzPCHx7YgPRQ9cjjoZsAismkQ8s=; b=bGDrfzJcS+ZDZOjzzdtZ5BEgMd
	slED7LKwCaUSlVWDXp60wLvY+OUVsfBXPLNfLo58bHBvUaszOBh0CInRw6kgjO7jtEvnBGrYz7Mkj
	gvuy77+1T4mkzSTfYESv/hWIhBbusaZs6hzqGkY1O2Ymycwr4PxTosw5Dk9M6SkGM/3GhybnAP+Vx
	rHTjjdkVdO09qI9yazIRkAcyc/tlNTciNryHH5/7wTkjZjHWbXU0VrktbCYWKFG6HrMPg4mJvLYQ7
	ZlOE8QjUxnIZtylz9lMpD2ov7uVM0LM8EjtuEzZumFa9gJWq6UoJWKyPRLt77LBTd4rpCAZlmQZCp
	+0Oih4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA6e-0000000DZgb-1fJk;
	Wed, 13 Aug 2025 11:57:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Dd-0000000DSEf-2BAV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-af958127df5so191107966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082832; x=1755687632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6v9b5bSF0XUxHDNFzPCHx7YgPRQ9cjjoZsAismkQ8s=;
        b=PgrGuy1cgl3mTwxTALOJ2EVs6Q5mlDRx0+2a0p7whACSSsTfXyQ0f+UFRJ4FgiklGy
         499CtOwRsbYPFOo+kGabL2rDNmdcOFNnKCP6DB5qg7M4HBngeh9CCbBCRBVyWEIwTs7j
         +YRR0NNAJAdrAB+RArMLxnFGqX/Yq0j8KLOiGXnxlxQtepYF1tyZdcxzDm7Z7O6uSKv1
         S6XxDMrDji7GAY2xxncgZj9QuPM0XrIddLz55DUBf6BkkhAXTefH1/Utlo5y5aCLx3rQ
         tBEl49s7RFhx1ebdmEVCoFntjVZoyeJRb6lc7Bfc+5U5T2XLjJGDIjkw710BLiuJUt2q
         2lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082832; x=1755687632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6v9b5bSF0XUxHDNFzPCHx7YgPRQ9cjjoZsAismkQ8s=;
        b=UtwDN16G68jCVsEzw4qd2sJmtmZt5OmndaYJwcFX1dPK8WjBwVkcWqkKUgXL/x8Ne4
         xpEadJqBRAFEgCzTBv3YrHSxf5blHwG5lm5gtlyM8zmD2caXcxJX1HcV64N1eQx5gymC
         aMZqJjOUiPBQeU6DfjMYD+y2+hnZpKB6pvZ2nEhs26YFRX73Fa1cVbSw/S/typow5njV
         Y8BuFRiLIBMqLt5iQ7qdsH9mlCAg0e9T49qt3Oy2pQ4XKglU8+OH3HgHC9Kt2pT5xiYr
         Ks5nPcLheZARwE33ua7q1tz7yzn85Mq8UH7pnTf4uyjH4pvXzQGXR8+/j5OqnfAowJ+I
         xiVg==
X-Forwarded-Encrypted: i=1; AJvYcCVGVVKN+cZ0Jroj3eJG0w8v5H3fd2lTadWLjiKJOYndgYWq7EIKWukPEIyjqBz8jmX/2yRpZWz7DUgXKQSPVEF9@lists.infradead.org
X-Gm-Message-State: AOJu0YxlcsEiHb+uxLpEYI7/+hMxoIc0DxKy25onmDH1WQtRSBvPTw70
	x4KhcqC2+6Rt8wb04+L6B4c7TiGmANhlNAro8Ikoz2NF5Fmul2CZ8SJR
X-Gm-Gg: ASbGnct3tapJtWvD41zd0YJGSXtB2k82kJ25uKheWQKptNpahByrCYiQqWvsxnrVd7U
	hDC2Pbt9l/z2nV8CrtADQRcVQ7oUzKhfSrAzavpcX96lh9/TspMZfMdcAlWuisrrNPWFnSQiKjx
	qrkO3dqt+1imLiDvCBOBsmebWOvHxYvh8vXpMpL3tI6ityPG8lWam8AOsFnrkgD9P3exf7+tB2O
	aMkya86OP23uwXmUYiNu/XDiNBdco0LFX87c0eBkzhoHnI/hswYKLFZBJJ7LDl564AknZ8esUa+
	9EQyO+l0W81IKO6XDQjRyowMnj3QGu/HApSYwQzj9CJRDmbyyva/t77cI8Q5WQelE5Hc7p7dLrX
	jVvEomENylxA0xX/o4u+oegSL8gHWGxnrS1dXBg/SmYwB0/TDoMK9nDXeuJS3jBbxUBU0DUDCFR
	0kWL2T
X-Google-Smtp-Source: AGHT+IEjpV8uKzDh0mqjSYJdMkdpDUvzmzgtcM5DbbXrgqYqpERe5r1rLRQ+ntgzzLdXaURecIaxJQ==
X-Received: by 2002:a17:907:724b:b0:ade:4339:9367 with SMTP id a640c23a62f3a-afca4db9115mr274442466b.26.1755082831981;
        Wed, 13 Aug 2025 04:00:31 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:31 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:12 +0200
Subject: [PATCH v6 6/9] clk: bcm21664: Add corresponding bus clocks for
 peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-6-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
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
 bh=Gq7lvAxtLYAke9zvYzvJyfhtBiZKv6UgZ6bOPFeWiL4=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA9PFfpIcmbnxav3qONDESI4hRMmnXIkt+GR
 N0gQvH/nEKJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aN5nD/4x15LNvhxIRyWToXPUg5x8ovQAr/3oEsuKMjO+H+yEzhxAtk0nVLKjl4QPP/LN+PkgKrg
 p0qvxUEvHgKscr+clMxQRyFv0AChlKLCDGO3BbBfAjBf2yEKESCCT628sSpghPoycTPtJ/b9244
 OM87WmVNzipTNEg7LAHeEd2CC66qhjfa/szv0vO6Z8QHlqWHH+NO0BF/RknMSRRE0RyaTSoEzFv
 pAaUFgQnBZh8s4ANQAjVBsTJlKzrMswuDPuqat0si/xyjD9ZT8dGgEMqHjZbKlHqNuIsAGmuKI6
 O/E7yY3TbwfVzDTUMzWRWgYfgjDPG4fAbz5lSZb3ND1jC5jVaOEeSDEUBfXnvwZmBIT5ajRRfqn
 6KmbbleqP+oALn3u7GVuhdoda0B557FyX8qJ2eGV0xcNd62UBcueOhtKhWnATxtnOfGzU8IEaLd
 f0Tr5Qwrp8TIUf32AYuRvi5Ap0uwaPJrtrZ6IcOvTzclF3Pr64koIO5CzR0oC6EHrLULJzJT1qX
 zZEJ78rvrvt1yAMLjWKMPtcIRAi3t7kdEVcVkGpjV4kwbwzUH8jbEIC5MCZjzBmoK4q9osUmu/I
 NDIDAgBZSIrubP9kVykSEAk9IcSAIPMqtWInNWtWLsdrjDwHlW0YgqOywrJXNwPA47AGnPMRzGi
 aeLulAuP48rOgHQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040033_586568_EE115CF6 
X-CRM114-Status: GOOD (  13.06  )
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
2.50.1



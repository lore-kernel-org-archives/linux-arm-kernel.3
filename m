Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC38FD715EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuGGQ/SEcIOglN3C1ur29tPR9UsO+YtNa/y88pcV+Ug=; b=d5bqPkqAtLYkQVu0d2fPkxL+E9
	p1wNbmRKoY9USUFbAxjkIvMXza6ctj3NSHQvpHioXf0jR1+nY31tvFSUo773Cr3Qzj3vsnqrX1Jf2
	WeU35ps0i0bvvvo5lhE3OgCZEkBSWo6p9PK6z2QRWlrZYHqXE3e9dNqQMDdQiIF/M+ULDITUnill1
	yTwopociM8D5exCKq8D+QDpfrZuStGp3m55UU7Z2U55tB977CgbZxFY0vg7hHmdbS7j0GYKnSfWbi
	ygfT29/xL4F7FtpmUTiAv+lml95p9m+BVy/6R1SmtQ2jVkcB3X1EvgxmeOoEp17835o6BmjqpZxgs
	Zcbxy5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9h-0000000AOHC-2Nnn;
	Sat, 24 Jan 2026 17:10:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9M-0000000AO6v-1i9X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8837152db5so429733266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274615; x=1769879415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuGGQ/SEcIOglN3C1ur29tPR9UsO+YtNa/y88pcV+Ug=;
        b=lGZUa+qodWjKNHVa2jeS6pWZ2H0gJzTll4FWLLWRuBTRzrldY/R1uSRmo3Ye7ZWRnC
         gzPZ1/TIevyu3XHmIUlmJw3gmocCzGd00XZFbPJAaCEDXdDIxxw9wDG3RX5qNxu2E79k
         T8ICZmCCEoBtVJqP5EFzerrsUfKZRRBksP49R10NhNPUQJvHVZ0HgD430wW+UG1PSGgG
         eZ65AbIBkSmvspwaMMhUM0pf0CBw5nUdEpEycTyZ58Lfs87DUWoIxyRANWxTecLYSMr1
         LiL2EyGKUnTGMYukQHAKcie5o9xqm1bKmAf5dNAlGwjZBTZa5z4FrBNaFi6nHQsivWxr
         27mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274615; x=1769879415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuGGQ/SEcIOglN3C1ur29tPR9UsO+YtNa/y88pcV+Ug=;
        b=I4jhOCqE4NL1iY7oEboNiIvD187rp4CmZs3khYjidVAMfETwVwsIUZ3fryMzaX03ZP
         2A1PCbQglJRWiZQoeJJ9bhWiTWx9gvOt7e3ZrfUx4i8d62Z1fvDY1oY1+48zNBjRipO+
         IAqZWjcR2NNWcxXIyUIme3NpVRIJGkARly7ZRtBVgh+JXGreQ4BetgQAw3e6FGKp9p0J
         KN3qb/PNStjFr0ifvElC50ZYUlJnkxt35iZQiK7TXS8/KLag64SRrBaUTqEoI9yYeFtN
         Z2kSqWkEPwqqkd8iIVwXAbZX6SASK+bMmD7KBdlkGbBzkodVirjgdxkIvHDbBaLHygai
         L3iw==
X-Forwarded-Encrypted: i=1; AJvYcCWgzccaDF9QXRACrnU3umjWtGI6zHHchR1fMNAoeuUFVGRguNdMiXG5UN0lNKq2JtLmErFYeebbX7mODJXf8NLA@lists.infradead.org
X-Gm-Message-State: AOJu0YzuzgehivecMNh4dG0tHQBZ1dw2beOo1u+S5viXf/1riFfPUeIz
	26OvJuqSch2r6SME6ACOatpnWMQccuFZ+ujeI3icOaUxU7JrsVIKe4um
X-Gm-Gg: AZuq6aJ1Fyko0hhWzLiVwyt4RPHJaURXFuohixSBBswcWo3HdgtcoqcvHJHLJm7Sq8L
	+QfHgF9soKg2l14lpoU9wk3grGzKUihGK/k76kmWqtCMhsn2tJBWBoCtBdmPfaQgujlj/+otfB1
	LDYoQ6Cto5SyKC9UBlxTRrHa/itrUR3YLb72OCMTECsucD5Vn2r51SHfVDRO8bNPQs7DCtdQnzW
	qGelGijDtQ0+T5IdsqAB0UwNU2zAdSSTWU3OKiIU7uBMJNNSatdm3aGEHnEYf8AfLsT/tDyfVbT
	r3FDUEoRO1BAFssCk25XpO8DJN1S0TDs355X477hWLRu5bs93jnDKLLg9LA12cKXtC+32fvj7z1
	d8vyoyujlW9cfb0aswtu6rjsaaDU//5kswp3xBuHRGIx+g94s5OyVjcnsY5+SVcR3HW7jdiBLUb
	Sgyp/akTBot1ZLU+MPB1RvVF87csIAhEKYiU5xnhftL4O24RNip87yKg/wDtxlx4ZlJjWfpZHbX
	UQFyJajdzBw0m9C/XVWN71kU03/kwr7OBfU/90EhLJBoA==
X-Received: by 2002:a17:907:7208:b0:b83:972c:77fe with SMTP id a640c23a62f3a-b885abf0014mr489898666b.2.1769274614504;
        Sat, 24 Jan 2026 09:10:14 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:14 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:07 +0100
Subject: [PATCH RESEND v7 7/7] clk: bcm281xx: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-7-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
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
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6005;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=MhD+5si1P/CXfrsB0NWiwFA6wHzB9oyernIPrIXpq00=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzsb5s2kJBEIvd7K/fyhhGYwEf/4HXbWBQQH
 NP+aNdm9fKJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT87AAKCRCzu/ihE6BR
 aK15D/4qgPBR3x8sx196BYkt2yNN3QbXdsAXq1ijJeEyLVC6SciSw7JzfMEbPHL5IV26nSsZMZF
 LKpD1/Nohl/CbuP/KfeYDRqG3Oxa9ChFSUGeQw3XVmnzFx27GJIqIfr6AMBNQ7o8OVgrWjuv6mV
 x29YHf5E9iyct9xSh5dy07nc5TbXK89byQdC2J6lMyZuEaM7V48xW8PbhJc3LoFTpE/VvZbvkkR
 pVSfpXnFfT+HeXBOnEalT0xRMY9vkD5Sd5mF7Kxu8Y58voaQqD5PRbNuXfjT68OY6U0IvXhZ4xd
 e400sJUWZ5iM9DMvpqL73xpMTr0orAiO5+hiYKuacVn2UArK4ehOKIM7tupiy6xsj95qCYlohWD
 0w+xp83+pHD/xrba0LUkJkhmuHivlfwcKvDOQyUDDzAULm4WqYH4JRmE+gSb4FH8ZKk87PqE8KP
 GtDNnr9hwT0Fgz+DPFzeXpl1lDBfWZkac6SpNxP/jQDbOS2bwXL+BTN2ws3XVcMS3JDUSkx9ZG4
 Ai5gDTdF+yiiZ/6UIwFMa3pYg+FTcmnHBYqfKbhRs9i2YgEFPWBsVM0OC93GYtiw0T0sjD9A1BA
 1Jy2OSsoNOTwHWXbD+FiW5WDaE8NbtjyjY3/JbRGW9FMu8FyzHQse+9YZdmqTGiMH7IHSYguzpe
 kBFeHLKXmntsYtA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091016_514513_054B2FA4 
X-CRM114-Status: GOOD (  11.88  )
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

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM281xx clock driver.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 drivers/clk/bcm/clk-bcm281xx.c | 127 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 62c3bf465625..13fd8a5ea8fa 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -59,7 +59,17 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
-#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+static struct bus_clk_data pmu_bsc_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 18, 3, 2),
+	.hyst		= HYST(0x0418, 10, 11),
+};
+
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
@@ -70,6 +80,10 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
+		[BCM281XX_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
+		[BCM281XX_AON_CCU_PMU_BSC_APB] =
+			KONA_CLK(aon, pmu_bsc_apb, bus),
 		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -178,7 +192,36 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
-#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_ic_ahb_data = {
+	.gate		= HW_SW_GATE(0x0354, 16, 1, 0),
+};
+
+/* also called usbh_ahb */
+static struct bus_clk_data hsic2_ahb_data = {
+	.gate		= HW_SW_GATE(0x0370, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 1, 0),
+};
+
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
@@ -197,6 +240,20 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
+		[BCM281XX_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_IC_AHB] =
+			KONA_CLK(master, usb_ic_ahb, bus),
+		[BCM281XX_MASTER_CCU_HSIC2_AHB] =
+			KONA_CLK(master, hsic2_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -309,7 +366,51 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
-#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE(0x0400, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE(0x0404, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE(0x0408, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb4_apb_data = {
+	.gate		= HW_SW_GATE(0x040c, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp0_apb_data = {
+	.gate		= HW_SW_GATE(0x0410, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp2_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 16, 1, 0),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE(0x0458, 16, 1, 0),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE(0x045c, 16, 1, 0),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE(0x0484, 16, 1, 0),
+	.hyst		= HYST(0x0484, 8, 9),
+};
+
+static struct bus_clk_data pwm_apb_data = {
+	.gate		= HW_SW_GATE(0x0468, 16, 1, 0),
+	.hyst		= HYST(0x0468, 8, 9),
+};
+
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
@@ -334,6 +435,26 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
+		[BCM281XX_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB4_APB] =
+			KONA_CLK(slave, uartb4_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP0_APB] =
+			KONA_CLK(slave, ssp0_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP2_APB] =
+			KONA_CLK(slave, ssp2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM281XX_SLAVE_CCU_PWM_APB] =
+			KONA_CLK(slave, pwm_apb, bus),
 		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E17ECA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU+2OvKdO52NBr1XCLEoYT1CqEnpX6+PT81g/aWGPRI=; b=JH+Ixs+FRTNMfhBARn+H+qa6Zu
	A/SZfrCFbTDtkEOlWLS7sdFsHV+nO3p620kyyQKd9uS4EGRsvuRebD7TvaJeo0nbTROA4Npfg6EZY
	TPqJbVFnllsBejppNMfrfvuP3Pfw2Za56BNNiMeBvkJmXZYm1bchQy/8GnGVIT0ySMLOEA7dmIR6q
	iohH6VHIfrWcacC8D0haXYmRwb3N3xVRbBcl2T9MxBPhJ1MwAycqvI6BqhBCrds55VXGd6jJGYIZu
	5mFXBls2gDnCMOSdT2WYmVEc8odHzQ6BI8oNSheZKNG3hB+LdSqUswZ6mby1uLp8jvs1nEKcN40uc
	Tf3to7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiQ-0000000EGCZ-2bIz;
	Mon, 01 Sep 2025 23:13:34 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut810-0000000DPSa-0IMY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6186cc17so3571270e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746500; x=1757351300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nU+2OvKdO52NBr1XCLEoYT1CqEnpX6+PT81g/aWGPRI=;
        b=kNldgcyngpZmopX95s34sOTrHsyRQy8xZS4rbX+r+v9d0ORpyLUFo0gYR3oOCTfWsP
         UJkJdJpmo2ExtTtc0YSdhZ5lYw4dOYipOpTwUm0ZzvCbh2t1B+rSNhtdkt3mlT91WpHY
         9qDYrFrruUWNkVwsWd/HyUZuHerYUQZXqmfWhSCpAru88k712vFv9uge0+M3ogOr1UrA
         U+B31fuWsqPrN3lFplrLMqU2rYy3QQ3uDIauzJ6wjVO6q1mCLvbHdkwmvNxi0BkKOcqM
         HRNl0XAuUK/xsGpe46zKcRH8uU0pmKJkguqOPXdGA0ZJGFYCV28bg0MVD/iPSGeVD5px
         ZEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746500; x=1757351300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU+2OvKdO52NBr1XCLEoYT1CqEnpX6+PT81g/aWGPRI=;
        b=dZCz82zv/qzTd7ux2rSfjLtsj83n7ViCk4R4LzzSIYFTKoDVeZxtGp7BvpV2tpth9j
         lnGFmim0Eu/HqgtCNtXOVx7r0yuE5Beg0NXPziRZ2GGwNGvQUyWSIXJjnFRjALdka+4W
         E5GhG93BhBgYfWom3bh+m/0Jjk+A4Od/Zqu0Wf139Rn4mmX7zFROwTdVfxBrtHS1uLBi
         b0eQ1n0U1n3MxrcaYMUrO+q3ylbmbZJEZiv5FxJNc7k3jCb2TivmRvX27HeaqEkLAdBN
         2/znNBZPucq7yDK26onO6FoG2ojTUuxuPoZSaIOV56wJ9q/F6HlOqs0hwY/FYUHZwlcU
         pmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLKwFpJQgPrSljnjAi/o2butKjCM2QEa4XCOiCAnXsQoqiuw9Bn8KaPPwsMVquIbrrDmY6HMZFUgrNlKaWplOK@lists.infradead.org
X-Gm-Message-State: AOJu0YwPeXqf0V+Q6D1btxrN/P3eyGvG7X8YeHV2fkXkT7mVVLyceKGN
	HlvY2JLqFtvxmQl35x52tQu65QmffUTDgXcK8sjf0bBmJXxs5rriDgKF
X-Gm-Gg: ASbGncuR1Zfdqqyuiq8mRbxx7mNSFIbQjt0xHq6bdeYFmR8NQSVJ1MXwboIjNRDRdEH
	2gIDkToxenDXSxEUSRi3HX/R6asFlT+ezGnWJ1jHUM7lGUSIGXGW07YZ7+0SKQH9hhIANMwySEn
	3N5Csru6Crcy6nBfrBL0GenGRBDswRByTa3xT7vbwvpxbInocgj5YTKGwGtaELBwTUD5pI5NZQh
	tJ+61CsC/4fVBIe6R79tqZGQNJeFKQz5QcT9chv+IKdPn1A5S4wNt+OFi0ns+DqQf4Y0b78nw8+
	b1eVOs6/9ITi0Z1JrhnKt+fB2e6oQvbgVaEKRt3cM0BP9XldQQcnRZK2EeGTRlQaxPrvCWflirG
	pYw2oE5Np8yZJURDZ5qM/jMWvvuUwNmiBEfELx+zd1IQNvA==
X-Google-Smtp-Source: AGHT+IH8FkGM2/AOW9Jyvo+dZ1Rwp0qYwwake7W3rzM+jTNQMzLvFjB/GSVAEwJgE3ubbrkKFePhkQ==
X-Received: by 2002:a05:6512:2347:b0:55f:42b8:b00 with SMTP id 2adb3069b0e04-55f708a2b65mr2558015e87.12.1756746500047;
        Mon, 01 Sep 2025 10:08:20 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:13 +0200
Subject: [PATCH RESEND v6 7/9] clk: bcm281xx: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-7-c3ac8215bd4d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5998;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=7aeNymfQ+oRiq3siHu3iF22xsu+e9eWllZLSuixd8zA=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLKJe64Q0Dpem6NWmOii8RTKDbMRRGPVcAO2
 NK2vhJvtT6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSygAKCRCzu/ihE6BR
 aJe5D/4rWpg6khHN4pnPPYZho9CeKKqUTVz5BCX0VMGkvFg32yUMFNexaa5XXtO6aP+vzQJ6V4E
 fn3v82yhXYQfiQY4B7TWS75haC77DgeUNswBP+86x6nUtXv8M2JM6BnObNw/TV45dMMSztnZl1y
 UV8c97Lzby0cIMqoP97X7ZfKSOR4v/B/4Aa5ir+wP96734Zqw33SGQ0ICwvrA6ATQPAiTjnyNvY
 UJvnh48XPHVipHnkyBBZh6D6AgBnU2+OhkIiI6o2QzxKlQez+4io80ldu0ErHiO+zrkiyhgXZHt
 GOBkNE0/mpQ60Iqhs30yTnFOTn/uKoF7WkjnW7+EBMl44g7WCOoukgKNLHO1W/9cyNho4KWQa80
 +w0fvmYL6TNY0ZLHuuswtog7LMjK1OkEgCU9IetLAGom/+suzCBeFjytEC+rFSTJAM22o1HbI6p
 fmy6nHd0REKjtMljLpjvT5Vovkj9jtulICu/NJB7PTDScwXlTaqNqxpVC0krTzEc4Vtum0JxVF8
 YCLY8eOapB+Q2gC4d6ombjce1RUDuUYoNad1xHzBTRt5ZeJ/yOYybMuofPoAiSpiG+59hkg7VTo
 FgVKCUAvfAdsaliEm6azcdvqd0/Ix7IgWcaqit9szQs7yGp7mIuJYdkvsDCRQd0ATYlLfyF8N5a
 SZsd5iYaryQj5YQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100822_145029_A2DB74D3 
X-CRM114-Status: GOOD (  13.33  )
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
index 62c3bf4656259261ae4f7d81dae48c90ab26c04e..13fd8a5ea8fa07bf6f3cca83b6b18e59a8de63df 100644
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
2.51.0



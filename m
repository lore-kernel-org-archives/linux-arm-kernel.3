Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE3CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrxn5V2ZLraaXqN1UhOIzjX1yimKmGYY2iP8b/c23xI=; b=v+3S+pVHCCKdUARw2Q+xMe/UA1
	E0t9YwrW16aXM1dUI5uHkFAi0AZUfCkLhxpbce/Q2Q47BnvQPk2BtlE/minAMlgEKxfQ4kLMLPMQc
	nDP7yw5OGJDpunGR6ViXvvTv6Um+JKsmy1uspIoSPiarNqtcv2CqcKljgd//78eBAZi2zXK6s6gXg
	jCBJBD+clddk9qFY8BJRj6myb4kqzHgpgMf/lr1tuAIeoO6KLa5JjvelVIbAAeYrQZteK9lD8n9IN
	tR8KLpebDhBh1ImSJryAot+xodvC2S6zH8CAjqkLDIxE8qiCGxkxi8rmqgw1tscF9wsT4HAi5+ca9
	mfQWqXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoW-0000000DFbh-2F8S;
	Mon, 13 Oct 2025 13:42:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoT-0000000DFWm-0J7g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso6225829a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362927; x=1760967727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrxn5V2ZLraaXqN1UhOIzjX1yimKmGYY2iP8b/c23xI=;
        b=IP9gnESQqFomAT31kOHpnlhfQneU8nDeqJM9uIUP72ggBu7dAnSJAYJl4r89rbpVJp
         dpuJyGA8aCSuGOh3R5/Gw9wk9u7AL37N5CMThuQcpOT+NcBgXqk3STZTadCqow2uUg8x
         w+wkubQQYO5hfZh6g+CVDIHiEof+DmHMAZhlkOg5fmYTxd1FxP2JABy1H9zS35cQAh9s
         7VEu1jWIhONbyWpgIP2pSLWPYIXgMdtLyVlFWo2M/H52hdDy+fR8dXfUcITcHCNlTSs2
         cFp/g6nOCLovNJjQ4sevEiv5HbVTEfCa9jzssnW+ekvIOCAx4mDJAC0DbN+RgVJyWpLZ
         AeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362927; x=1760967727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrxn5V2ZLraaXqN1UhOIzjX1yimKmGYY2iP8b/c23xI=;
        b=W7ZjZAROBvX+bufCuP5t1uqKIC6pfjGeG5vZKiYpZ/FpZKA4piG85BCHEH6bQ73VC3
         c1TGSIz9tRS8P39oWc9rJng4tzp6hErnNR0jjYt4RVuVhieehAs3+hGPIsJsfwVwtK6v
         K7ubFdIY1DTWsbjaAVzPaXnjAkoyz+7wISjqHZZTgggHngdlBMsKB8t0EKrwvcXsiiqx
         VJv2nBBzjYXu3QwkDD5IUYiTT/aK4J8aNaFbu1JVIBRX1RRCiD5Slpz+zNVchrhFVf39
         Zf2upDoe01Zjv9jWN7um50Lo2MqnZ8HAuIyV30zB4Y+OsLutsVs7Ds/rZNeBOIWWqoPM
         MoCw==
X-Forwarded-Encrypted: i=1; AJvYcCUb3IQC9u/0podBSk0JjvGIFUUoOvIGQ0RFpV3Oc8yYoOTEGWsOIX91hyqTV0ZMsqF0r033fShY8u9HE3+OdL5g@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2zStLTPVWLtvR7UB2T6Ja9+VH/6eJZaHGH45lYPOUDQkrsmu
	QiXyaUFKDobD5UdWs1JCOrpdWjEYnfDNf4k4VLMDMLXamILBFC5q+K/k
X-Gm-Gg: ASbGncsoDJ/eisyU3cXNRxBBd2FQS3yr3wGgyAhqOtBFr4EZ6Sg/SNCG9juqXTDA+pC
	eb9cbOGY0Z3FAeXam317+M5Peku37BlX4rg4AJWK3YDl/vuCayYtfmwuyLKqJQrARFICwdxptGS
	O6rJSvqrbWXAmX7jJjKRNQjBKkeE70UMbqjXFE+dyoiHy0T9f/JlWLVQANkkg4yaX2VAZDXq+gH
	NgUuRELI6EwHgAIQe3x5NfOEL7TB2LhCeY5fs66+Sk14yYg73nzpPjdLxW831vvd8AyhledeOuw
	BTnXCSFTrprXVHBpXK0yUilR7BdmbOWIz7rPS7S2I1Oz+U7GU0NLoAaEdeUoGq2B2bzKeC2kcd+
	xUcz7E3aBOKXGJMROONa1UkC7IRHBux+20SO26GXWI47WZRT1zB9zpwo3Shi4N8kJ13O9Ky7Wae
	QW6JdhQTWInpbz
X-Google-Smtp-Source: AGHT+IHW8B7vpbCVSo6VA1fn0F5FpN2EF++GQ7/3RSyeUuDyDe6Te8GkuSpOBf62mr76lPkgAINLng==
X-Received: by 2002:a05:6402:40d1:b0:639:ef26:a01d with SMTP id 4fb4d7f45d1cf-639ef26a47emr15112262a12.11.1760362927050;
        Mon, 13 Oct 2025 06:42:07 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:42:06 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:54 +0200
Subject: [PATCH v7 7/7] clk: bcm281xx: Add corresponding bus clocks for
 peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-7-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
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
 bh=BKr8nVscrBQotunl8u3eUCru7U4bR7e46blB/UH7zYk=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGg6q+Yc21Ig+afa32iNWFNzvHv7ZkWVlH2N
 0Em92Ym7byJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BoAAKCRCzu/ihE6BR
 aMTLEACdZNtR5aTmug+rai2D1xBgUuBhee96uc7gCs6JjvgMPMffeAChVUIytsllR71lj74m9mf
 g5X6AS9hbUWdkzNGZl8jslulemey9NH8A9W19Ld9XejQDTWGQtv9RTZ4mAHagi0m/pCoBf8b9H4
 vfM+34HRFfV05296MrCfT1kFibzDvgCKHZzEgvvM/B0J+X6hDtwezVfRi9tlarMvORZEUhaY9xu
 dM+WKd1ZUpvyc+oaFMSpxtEfkmhCR3fk8P7EANYZ/D/HOf17SiSA3Cw386UdyFoiESu43w35qlo
 zGFooOq+OowrQDWkutSUHsQrMGes5RP5twZL+9EpOIBcsesKO7mtOMxwAcbE9f35Ey91Q/kwL2R
 WzwoecopMZZB2Hcim6Qw6zZNFUyB1Z+5likC1QeAON1Gd2uGbKo+n31B9sXk0Af3vuYErD6ZqZj
 fxUBic+06J2pgC4tWVDQ+hp9H/dOeGxAUnD/G6DlFiYHJjrCIKbynMWNsecBhKPg0oA5+XUh+aZ
 yY66HmUc7Tcma0giwX2YK6SpQ/sDjOaAZWjkTiVJqr2nChHDthpLFt9/b1FvoDVgCJ6LWOCzlCp
 pFrMW7Q6KqHQUq4M/QLCWwICtIy+qvpOE2q7WDv4NRyMsdQtt6ClLslQy7E1MLymsEztaHR3oNH
 Ks8sp5Chwqk+k3Q==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064209_154222_5D92330A 
X-CRM114-Status: GOOD (  12.61  )
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
2.51.0



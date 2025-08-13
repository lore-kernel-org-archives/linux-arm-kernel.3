Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA953CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMxZP0Gqr+LI7kYspfoImpeTf4WZO3hif0vxeFkbU8Q=; b=vnHpIQBo7b3HgtrO9qteTXhJSd
	xGY7R6FMHuMMAN6T8gz24gXkOOGqexhdeksM2iULVRCdxPWvzbydjQkyijhe2x7Z/TQXf825dgi8m
	D9ySv7gW0KZCki8YNaHk+FQqRrGM4BHj7VeGcoYg8utUjnCgH1WVRsgMcdUMzzxymwvndpQ8RyzQA
	fATKfu06Dt2niEe3rjKYAefjaa2vPj7IgCEOSIc7bHkzkrKTtG4i/7oZX5psHW/Nx4P2aWCDQDd8q
	oo1R0Q6xucv3+yodsty58gbevXcGMlW7ZJMecHFB4HjJkVLd0dmO4vjL/I8dJCaPSo6C8wl9nZAYA
	3SP+X6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9u5-0000000DXzl-1Wft;
	Wed, 13 Aug 2025 11:44:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9DQ-0000000DS7g-37Zr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af9618282a5so1209300366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082819; x=1755687619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMxZP0Gqr+LI7kYspfoImpeTf4WZO3hif0vxeFkbU8Q=;
        b=MA3086GLaWoZ8+um4t8xyny1y5Ses860flLghHija0u96KPDpFsd90mulPt/6hjqGJ
         WDeNyQIBHxCO2VmtUm8xxDAgKsulYJ1hxsszBeyGQBPRfaeottSCDU6BgdNlv46N+jDH
         +kHYn8P0YNmuAKnqAQV49IGGzZ45QBSqVj53GOp4NtYqDGhzMkmKuPlm3xRJIF7Mx6t7
         iinT1Kh9QIFVeICEmazooFiR4TeJuLvZ99fgkr/xvK3fkCoWjwwOW85os31mYwCbrEun
         08QTARpvhe3nBTdsR4oYnRm6vP7+EXyXSO/NZSca2DSA1f4fQH50a/7vI7qx73HBCFU5
         gZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082819; x=1755687619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMxZP0Gqr+LI7kYspfoImpeTf4WZO3hif0vxeFkbU8Q=;
        b=D9Mc2ioJ2IehIg+xCZ1nA4i4wx32UEpguGq8yPvppVwJ19Vm6byejKS6EyDr25jzcQ
         3E6dzyKBgzUoZXBapZt7CP2bK+Ds1ARrj1EtnRHX1O+iL5+XkkfiVrla7mcylYt/0nZA
         bOYHSEZbNJSjzhV13eNTD3SBIju0gnK8fzEk1AMg81PNs1FIB0K/OGuGmJF2vLy0xPhf
         sIu3E9RdlmPLFR2s8UZumTkha9G95zXnMbCHVxKCoElNw/RI5QpYwcghfrAndLnJrrw9
         QjTTxaTvjnZCgjUD85MfXR1O1ytcVol3WZd83DhbZEMhfAKLIvqmRbVSdmptjI/hd+Ai
         CIDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGvkE4xvxvXyY1lysJetqi/x3LKPR9/uXhUXuYYhF6ou1KxOQButD0uN0nLv4j9POgooqKDMyewJIobNQtK+aE@lists.infradead.org
X-Gm-Message-State: AOJu0YxobQ7XCfmdkTAPVfeM77615DUsp8zgLH1ICgdML+GUwVX88ob7
	u9T66k8JeS+86qzmQiUONwqqA6Iq26njHDzRv1dbk8I5f7GgCOE+jGps2PyGXaRo
X-Gm-Gg: ASbGncsJrBiyIKfFHiaz2nnzXC7WcCWHzDxf9ElbbbFk9HwPD031qubnoZKYUkLHLh7
	mj/HF5S58Bb1/J6Qz9lzFUBNA/xZSzLiVhdCUdjz2M8EpXQg/cdk1kJJeL93AwdWu8zQrXireb1
	4I24zZlEY45shvPHCikGxlSRax/8eEbb1QoRdd/6TshEgS2XHLXiXweY6X+DHopI4bFL9HrlXrW
	j1pHMhMvuMm9fAcP7cMeBoyKmwzXeC2jdKBgEEdH0xs9pt4YOq/3w/Fqz+rDFUTI+ULhk5nM06d
	//q7QCIpr9YIPMeCqxjxjS/1cFOv9ffzjy3j8iaOte2H1CcbMgWyZvJSHjAM0YsNXNoZL2MMMz8
	OTtDoCs0oF9PF0TEHIYtC2h71RK+Ske0XwHsvxGb7MufO+/GrSykKlvYj6rZLLcR5o14Kh83Bn4
	qPb2JA
X-Google-Smtp-Source: AGHT+IGvq7p7zrwMDXk6ZX7lO2oP01JqYVpmGN3l1U91UMYaxQy9DeOubajdOB6pcLNRW2pBrhv2eA==
X-Received: by 2002:a17:907:7e93:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-afca4e0afd0mr229812766b.35.1755082818984;
        Wed, 13 Aug 2025 04:00:18 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:07 +0200
Subject: [PATCH v6 1/9] clk: bcm: kona: Move CLOCK_COUNT defines into the
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-1-f5a63d4920a4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=OyUyiVNH1nNJRzK5OA+EFXhH7ke4k69wyUohAzjN7Qo=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA9xM6Wt6D9eU6TsSE9GmrueMWf4cY84bCUO
 Cdx5DUVo7WJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aPQvD/9b+THxS2sbk81gNzVeVawjioZ6+EZxprycSfblHpC8h80Ofy7OFDpOgS4HITERjGYopwv
 XlWFg5KFcrgudwIo9ggTITeOpkoqLw4IflgUZA8im7DokVZuUssBY3hNltBfLnp06VoCwjt7YfU
 DJKvLI65b0wMhimm4dmSyKOQ2CcfArRethxpvtPAtETgo3L8z7naL+XyKPe+Kimxaj+SSJOkQ/R
 T4C/pIBPBQJ7WYmO4Fck2U+Ms78Lbb7d2RTrXeRTgC62RBFwpp2RCjgujOhk6OTdfPmFUqqy4i6
 uQsIf0kF+m9N95cUMQyWLGXGHeLi7MxVqV62211rW8tNjasB5rHrqXJIb6xAd8zUdTU33WLSjoP
 nq1QmR6tQhm3VH1czz8EJ/ZTV1J/T2uW2IZi9n3Y5copaxnM7AYw9K81A6ZGHCMDghZSuktdEiU
 khzw7seNCBUXQ0O7hzsF9l0nZT+A9rTIdIXD9cW4NH1eYfgeY8E/6uX6s0yGLjpGH2WDq+aOnn+
 mN4+lXC86CUkm4k5G70XgVu/ETuSDrBbJP16ekN1iXtMWZl7cdZBoJCo+M7GSjKVVBU+UkJrPr8
 5GwBELBEz16IPITbEueH0g06wrB4fPUvGXJu5vsjxgQ4f3C2jCYbb3sx7OltOXTaIEKWszM1fo5
 hImyyTOn6Hy47Yg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040020_792050_2296C931 
X-CRM114-Status: GOOD (  16.74  )
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

CLOCK_COUNT defines for each CCU are stored in the DT binding header.
This is not correct - they are not used by device trees, only internally
by the driver.

Move the CLOCK_COUNT defines directly into the driver in preparation
for dropping them from the DT binding include. To avoid conflicts with
the old defines, rename them to use the CLK_COUNT suffix.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rename CLOCK_COUNT to CLK_COUNT to avoid redefinition

Changes in v3:
- Add this commit
---
 drivers/clk/bcm/clk-bcm21664.c | 16 ++++++++++++----
 drivers/clk/bcm/clk-bcm281xx.c | 20 +++++++++++++++-----
 drivers/clk/bcm/clk-kona.h     |  2 +-
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 520c3aeb4ea9c4a431512c0909f9545c1761d17a..14b7db824704824b4a6bfcce79308afa44e092c6 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -17,13 +17,15 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM21664_ROOT_CCU_CLK_COUNT	(BCM21664_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM21664_CCU_COMMON(root, ROOT),
 	/* no policy control */
 	.kona_clks	= {
 		[BCM21664_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM21664_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -39,6 +41,8 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
 	.policy		= {
@@ -48,7 +52,7 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
-		[BCM21664_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -122,6 +126,8 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
 	.policy		= {
@@ -145,7 +151,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
-		[BCM21664_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -225,6 +231,8 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
        .policy		= {
@@ -246,7 +254,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
-		[BCM21664_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 823d5dfa31b84f502fcd6ada1eff6d8f4673b3dd..62c3bf4656259261ae4f7d81dae48c90ab26c04e 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -19,12 +19,14 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM281XX_ROOT_CCU_CLK_COUNT	(BCM281XX_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM281XX_CCU_COMMON(root, ROOT),
 	.kona_clks	= {
 		[BCM281XX_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM281XX_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -57,6 +59,8 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
 	.kona_clks	= {
@@ -66,7 +70,7 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
-		[BCM281XX_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -80,12 +84,14 @@ static struct peri_clk_data tmon_1m_data = {
 	.trig		= TRIGGER(0x0e84, 1),
 };
 
+#define BCM281XX_HUB_CCU_CLK_COUNT	(BCM281XX_HUB_CCU_TMON_1M + 1)
+
 static struct ccu_data hub_ccu_data = {
 	BCM281XX_CCU_COMMON(hub, HUB),
 	.kona_clks	= {
 		[BCM281XX_HUB_CCU_TMON_1M] =
 			KONA_CLK(hub, tmon_1m, peri),
-		[BCM281XX_HUB_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_HUB_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -172,6 +178,8 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
 	.kona_clks	= {
@@ -189,7 +197,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
-		[BCM281XX_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -301,6 +309,8 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
 	.kona_clks	= {
@@ -324,7 +334,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
-		[BCM281XX_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 348a3454ce4013e4e2b06b9542f5895a8397dd8e..d7cae437333c83e05b2960ba8d51e718480e6155 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -483,7 +483,7 @@ struct ccu_data {
 #define KONA_CCU_COMMON(_prefix, _name, _ccuname)			    \
 	.name		= #_name "_ccu",				    \
 	.lock		= __SPIN_LOCK_UNLOCKED(_name ## _ccu_data.lock),    \
-	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLOCK_COUNT
+	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLK_COUNT
 
 /* Exported globals */
 

-- 
2.50.1



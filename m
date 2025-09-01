Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2009CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N68vtqkI2Bxq8oYBTxdNshjoedAjw9IYWQbAWFZlygU=; b=Oa2nZta7Vh8Qg8p6VrZb8k+8Sq
	RZxQu825MgYtjqVho9AHsDPq3X1RymDBjJUdWI1s/iIJOX0MWY2wcKPZZIxRrT1wCcsktt+qZkGMB
	50JXk9k0gXgNZRez9jJc+Xaqdk3NNHGc19uzHmBIoLiWt3Har8Zj4Lazd8y+v3nba1dIpIxD5ZRfk
	y6KTlJn+yb+opcB5pueMEzlsA9ZKVNU6cIQpqQusx2H7cwUXUuXNxGS/qW11t5I7sfAr6mKalb6dk
	bpBXG/oSKx9FIkBlhAvc/Aw7Xwi/A3bjZwMULNh2LGlaUxg7VVVeIn0l7bIRHEpZR9HfzjgCb2okn
	gJt0HOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDhz-0000000EFTs-1pA6;
	Mon, 01 Sep 2025 23:13:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80a-0000000DPIm-0smu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:07:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f76277413so1793039e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746474; x=1757351274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N68vtqkI2Bxq8oYBTxdNshjoedAjw9IYWQbAWFZlygU=;
        b=PXebm1Xhjww+epq9ai73F7FR7ybNQjBzZCAtte/Kk/NhTNpKc8EGhkF+07OOehAdAv
         Sr7APymGi+VJ+JgqpC2246Ha9HlyzEHwW6w9c3GiVpb/mkueddVDoovN1IJEwgDEZyE7
         7dVr53a19cyaOmvVG5c+Buj4zkzGGxn6zUTJ3s8cg8VhjSZZz4RN/6y7sHtp1m1XuQFS
         ts5DEhXK8jdN3exerUwYBL3kRPXm9bDmT02zAOmaHXVAzMvlQhal6nWWx3Ec66HXtCFg
         awFwyZ6jZGgMlQj17GNBlq+dijaaxt+cQMUNGMt03RIO10wgisGAanMRX5fnuL12lp40
         wy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746474; x=1757351274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N68vtqkI2Bxq8oYBTxdNshjoedAjw9IYWQbAWFZlygU=;
        b=dY4qEBsMO9hr3rQunkxvXS28NAf0E/9xjzy/WXbDk5SD4zEKbNGTksSZ/BVh6cRHt9
         xy2B8PueTRCZaLv66ijY0MLEwy3Y3WbX1J0NHPF4j4eODIcxRH9PmGbzOGgbD6yNEw1+
         HL7rG3kSAT8Xp/iGHvTy2QAD+wLuzTV2WfGqeF6co51DhKcle9wGZhO1kcyAuVDoS9j6
         g8ioK5BUTQVc8muWTbdgbWiRPHROa8R5tvnLzvuqT9L2xbsk90fuIW8PcA4xni20rTwi
         HBKyXBiDsX5wU+e4VCZhTaIK2AMdkeSc4sLqgxLCxF4YuqBnBUimUDvAWLqRxcRbep3w
         NR7A==
X-Forwarded-Encrypted: i=1; AJvYcCVtRFQLdLME8WBQdOuzDEHYtO6GOl1xV1t7/wkG8Br7zTRou50hPNBiS7q2iG9umPJLpM/oND6L/DUK8jhZ67cB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3PyZfj0TixNE+bvcvgA+0+jXKswNs/CXXB7LY0BfkRUBkVlwd
	xmgAqwBlwzxnmyP+DJvOzJzz+iWAYL7FlAnSuZYCE0kHS/0MIMqXQUyRjHMXsw==
X-Gm-Gg: ASbGncsMtOwkbw+t8MeZ680P6L5WNto0TED8GReC3cIyNDbHpJJQProQvrxcN8vnUlY
	tZPHjLp2m9eW5gTZLkUymZiVU6Vd09KbMS0oHJvYEII5DAMahR4wIuDZL/roYHcAgSdCZ/aSs7e
	KB6a6f1W0Tisb8Q7tnqYqKXO/3xX/rF7K2g8NtreZDPyF3pUo1r80/EQSmklAG2WNADfPiIHpBx
	jQ8L710zv0M2yENr1mY+/Mhy80neFWQ8XTc5rwEJwSIuBn7qpprA4dkP0dvmKg7gHNNjx6YI3Vq
	PX5YHRAGz6TZH23hFb/qE9MWFIXpleZeWzCJNHAq7wH7eIYGKd7/eIPNrDMnTtniZL87tWWMiVn
	/HYABq9odO1q37RNHv1HC7gWwW/jXDZ29qSy7ggXao4zeKg==
X-Google-Smtp-Source: AGHT+IEBI3/9tvuQ3BUVi5V7SGZm4I3o01z5HwuLEeNOENmeRPKn3SDZwrWeSvaP0ado3JN65LNk/g==
X-Received: by 2002:a05:6512:1393:b0:55f:4506:a638 with SMTP id 2adb3069b0e04-55f7093e990mr2307618e87.41.1756746474162;
        Mon, 01 Sep 2025 10:07:54 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:07:53 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:07 +0200
Subject: [PATCH RESEND v6 1/9] clk: bcm: kona: Move CLOCK_COUNT defines
 into the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-1-c3ac8215bd4d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=nBuDWNA37MXiGLfbOM2Azb046sRyvOaXBtEsYK0w/q0=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLJgoVdyN2WpTmcp17uhOxOMloaZOyaJVDKu
 J+MM2eqA+aJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSyQAKCRCzu/ihE6BR
 aAcDD/9KS21Jls0D4Tl13jDcnM61FzSYr6XH8eZ0cL7KO8zLdBStCLqvhw3vUe48BhwWBpjj7T+
 bsVSlOJyolR8vuLXHYwlg4HZwpOWvYQ/slK67nEPQ3bCvgdQLm3dWCkzlT93VKLR3eXXONyITRn
 BAUkRoA2EavTzSSlXXSzJUOyYS2oi/qblQffCy8uKiXBBwvrYytNJBlJQtYMg0nLDZpqXHu8cWG
 Uy/VE22kaObJy6CIscTcy/vHcgYqQpIqJBk7rUqKKAzWQWYuFMuJgAsLNHqI3Srr8nslxH/2a4M
 xq+C1ZPuQnE9sVpsRRLl3yYFSZxHCD779HPCPT/iLh+XOs9QRX9eHTjQfiY0PPph8hdL1BDYSL9
 VTGXr5u4lxCl4qoY2UKAFC+dLE8WTVB3MDFiHWqhylKWnHSna2btA67ZQ9g1vtuFuzGgErXMX5t
 AyuSzhnjV8+3s13a0eTjKg4FW04yRcbmVuNh6cL+6og6VN4thWKGOALoNbr9hz5MB0nH0sSGd+j
 XqxJgCnCyQKRC1+LdAnFnyDC96+bo1zgVvYzxzPpq2B/1o05j/OXun05VU7g0JodUM8OXrsEd09
 KCB1qM50Se5Ac7L6E0litirzZVHnmKZzOab/LISG6fijRJWLNF/trA9+SnJGVnEcHvLwfMKXZUv
 HxoaIjaZ4Epwu5w==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100756_256929_2FA3EE48 
X-CRM114-Status: GOOD (  17.18  )
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
2.51.0



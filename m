Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F795CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl6F1iZ+nTtDNeb7FVvoataOw45pSnmlttNDisOfUsQ=; b=DplvcfB270SsQb5gOy0LgGYtNT
	Ok6dwyKDq6DLEUbOjauqZGlkPQNMu6d+srbLhL1G9/lR36mmyVBl1Ol4i9esCx6+KMchss1l48Kww
	uB20myXImVIiFBL7N/tVkMXkNSz467ppMH77UWOLC5QNM++IPLUzTP7yIcyyxs/+EwhwiCMlhbK6M
	GZg4DxvpugFTV/4nUaPx8GcBQzRkwG0ag3uf9/DhbYnk5wdR9CJkf3b58vMoxxa5bG5I2ff1tTIz6
	QzP/gF76ogKkdtGqsEQ4rtKwczd0LWB08vM0LCydWD7tZQu3wZTGKCUxJ+YvCl56he95oHpqTT0s6
	Is3c8/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoL-0000000DFSF-1ioO;
	Mon, 13 Oct 2025 13:42:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoI-0000000DFQr-44eP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so6649389a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362917; x=1760967717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl6F1iZ+nTtDNeb7FVvoataOw45pSnmlttNDisOfUsQ=;
        b=PU6Lwc5l/P/6f78V0z3UeYwbwdD61y0icI009oTWd4Cb93FoxwUSyB5f6LLw7Qdg2H
         Jen17IUB7GEeM6edNfDPnHQekUjdKjFbf7N1D8RRy64PeYsOnq6HCdiYTYSMoWHj9pxb
         3ETfdx2IyRRmHOTGGrcVTd/Y8ZUWsyvOqTtWcoRhRRhPaRYCohjnPhvrkPXy/iDHKxxj
         hlOB+7NeCV/ZHcB4A7MwE4HSxC81pZYlx4n5Px2X/fzYD35WDG2Qq78TxOf9R+7dhWtN
         iGC314g6ppBXnQ471XPjsUUeL54eL9GJt/bJhVW7eQhHhBX0TozJJQT3uom16Ltv46x8
         wG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362917; x=1760967717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl6F1iZ+nTtDNeb7FVvoataOw45pSnmlttNDisOfUsQ=;
        b=G9V8Nam9kN9c4damkBVz9BytnIT2kS46/k9izCK+YJjF9qPAAQJJVwWDzwgeGmNGMY
         Bu8VQ8lPzoVs3R2346nxaNw+AYh+GU4Lw8KkXIjLcUaWVxjCasxs9Y+le1J5KZLcW5nK
         +FygQpzX2fahxcGtIGRvzDPnYbTdkUD3/AvN1OnmVzSTtrum/mwdczDUEJ80+LuodLYt
         Dg5TCnRup32/zohZEOrxHXcxrBSETo/Wn6rkpaIMCVkiufMfsdfie/R3dftqOFHTAdv8
         OLqu4vj+I6gCuFxCkFjIrfRczwPyCNyt9n/j9HYM5FCKfYtMmgh3Q/II5WoCmM4S4CKo
         zhxg==
X-Forwarded-Encrypted: i=1; AJvYcCXROWWp3FimfSu2huSZai9Glk0lyGIRHk24s127OBs6rBOblolZJntq9LycCAfMF+1Ri7QtN4+FJSGhcNKendF5@lists.infradead.org
X-Gm-Message-State: AOJu0YxCn7ykNaCdpaCmRwEFlXFHMy0zA1CqgGUQpPi7FXOrE/OLUnQi
	6FHrmyZJvFEke2I+g9otdnUa7YSqX2nShajs8/diVa7jLeTlcJ4H98tm
X-Gm-Gg: ASbGncvm5HFGEc/z9IQKTE/ZXxwLwbGAxtLlHvdfF9a9n3ng2gVayJ13VWoZuXUfZCs
	Gg1a0EqyidI/B1UX8MHEllbqpWAeMEueAYerlT6FZDAaB7sBZxYXUKrwgv5PNQxwYelMBI7atRQ
	UlEFyifyYXBYMEVC5WvSyHJMCq6koT/L0Df8xAMmuY84kYxbqt0gMItYmfGJy1OzPLOHVRGEOCa
	TAitPVq26ytHQW1lNq4lAH3Mazdip6oGuwCofrgptIuMZGCg2S6ZAoefc4yIh0ecohfrx7kS/rN
	h8Srt4/vsD+8EcjYOQETSGdVGGWgDmTE23LzymI04WapWhqzFJieJJ5UInTlmTtF8B/UlHLbetn
	/7Q2d2xk0DxR5FLveae26dOKxs31XSxZcSfhqNQfKyRTiMu8A1hcU/kWOqsLTlFsSaJO6Vmxs0M
	16Hk6fwaVNSI8s28DHsezR1kM=
X-Google-Smtp-Source: AGHT+IH1R3LHTRzGleUVMZwJjjGd2hp2PO32KdCWlPdImEsFvM0BjsAVI0pE+77toFSrcdThRY8QDA==
X-Received: by 2002:a05:6402:42c6:b0:639:ef26:a015 with SMTP id 4fb4d7f45d1cf-639ef26a351mr17316622a12.23.1760362916889;
        Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:48 +0200
Subject: [PATCH v7 1/7] clk: bcm: kona: Move CLOCK_COUNT defines into the
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-1-8f473d99ae19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6586;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=z75QJxLEV0SbWN5Xpt8GE0TnWBRNEzskqUz8wVKyHMg=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGf4hJ3fgjKwFX/7o3hjktxSVfcV/Q/jo8cg
 kC+BEfCDCyJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aKlpD/99hhENXLLXpBuK9pb9P6somzlg12+rIt6+FnH2MKHK7i6y+s31wZLRzguP4L1FXnYSzJh
 BgL/9LR8LFlcaTbOVIX/s7NCiXRIHFEPfceMhScRj4q9PtmVeFl1oU35PGMHBkLe7fIH0pJbSC+
 j4/Ibl1a43ushnOGAAcgxWvcehQcUQSiXqTJCSkoHK/15AcLO0ADeAXrW48K365a5cgpOC1A8pi
 p/f4osfU/TEVvQsOXg0/VJ+rgOR71Al2PaW/Ky2zLlYT5bEQ6PnLHwt5gVu5w4k3kbjEhfFleiF
 R/fHmpWt8f9rXx2NPIq5kWQagpnqN7Fuz2Ga3HrgWcVM1GE8uARBqaNxWLSMuhC58JLYa4tnwm/
 zU9NxuMKqJCyP+TAbrkW6neNA/pTZygKtHQbT+DFF1w0siUhMGuE1T/TUb1B+2oDCznUxlGFDIG
 bqgt3c9JRj5E5Tt/jcr6XTDgkTvgj65zpSu0yeaHqqJo62pauXUxo42EP1haKalH1DNJr7HXvxE
 Q1VAIb+7084ZwVgATJJX3Soe84QxP3csNL+yyQ6GInj5inDrwcu9kF2NDkJoqNSGiZnbzqKWK8Q
 gBm6MIgifl4oeLe4mZ5gcy6hWPhnXZS2tF3/9rf4MvMaKo0ot6+ar3IRNOtP3QhQ9ss99+JbC/9
 kGsTfsTj/zECO7g==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064159_055137_B7A0EA8C 
X-CRM114-Status: GOOD (  16.45  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
index 520c3aeb4ea9..14b7db824704 100644
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
index 823d5dfa31b8..62c3bf465625 100644
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
index 348a3454ce40..d7cae437333c 100644
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



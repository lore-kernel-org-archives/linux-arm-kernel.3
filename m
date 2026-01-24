Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D701D715EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCr4Z+KNekDJl9rNVi/bQ/zDL8gFwd9M77DGpXezgFo=; b=CoQC/VK7uIZLaqlBMiZJHVLN1B
	aBqx9d/Y0du/DVxFIvQGBKCWmmlqSZTkz5r2i1WG9N9dkdSwIG6FEBZt9IBihO+jgPpAr1FkJFn2I
	w3KIchBdgss4MaT0F9qSeyWM6YKMGK6NJzn32whj4QVN9h4OIqsbMRzVh3CrYdnc1UFDLXdMeenUf
	1xqsOWN9yp0w7VfshtTKpRHtFI3R/tP153L/BfE5pCbur3sBhNi/A5Ib8gglaCE1hUHyV9ikVFfrN
	h8IOIEwuyurOEmTVR+tWxw6ea97iKQveJJCn76bJhfQE4wUImqU9KJXi/g5kPZakrIaxQnuS4fS4g
	U0xdmNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9K-0000000AO6h-39rv;
	Sat, 24 Jan 2026 17:10:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9F-0000000AO43-2lm7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b885e8c6700so317761466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274608; x=1769879408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCr4Z+KNekDJl9rNVi/bQ/zDL8gFwd9M77DGpXezgFo=;
        b=cXgJ2O9AkIBaPbMFU9gyStTPEVFrfadCDXDGSN9erf8RSwtUL2HdZ6aCi+2pq65MBE
         7Cwyv5gyJJsmEVyhXRSGbj36skLN0hcYbfFu3Ih+Jb/UZdAyH+RiO3ehviQE3d2UbrnU
         aJFzZgp7OV2FBbwm9qr69nnTcuKo9F5oYLMyGPIlwvP3TYGlyFfZm8RNmJ/MGlwaUcPj
         rlvdOL2Aspfs5chdApAzTNfx94Bzs6nNa4sjEeVD6wNl2imWvXeoQsvjbfxs+Rf4BRZ4
         uJmC6qAcgkbb5VAaN123w2Ap0OVaSqrtguBDMqJOpx9A8vwSOiKBF6Y8/N0fELUVo2r8
         5nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274608; x=1769879408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pCr4Z+KNekDJl9rNVi/bQ/zDL8gFwd9M77DGpXezgFo=;
        b=YdhB/uyFg6GEffoQk8WtiTWkiNEvSPYWOEmuLzUXDTy03qSilB3qV9iwkavR3h8LJZ
         Dx9INqA1a89TtiLifbilhFK3rlP+UjaaAn5jD6MjwzGFNarcvTbKpJbRBPzO/M/BxuqA
         Tm3a9JqxXn+c4U9rOGqDkTMOfM9MRIRuCoYDaVLxZp9AqHRMvjQOfdLqeZRBeNUalv5X
         xnlVqPn7rRRt/Tutq271vlXAbxcy8SkF5I/z1HML03gieu6gbgdN1AzXOBcbyCB8+mIX
         GUT8S8nhhguLkWagGQ2oMeDT6+Lo7vap0RCD++3XlacvQuJg/x4byEG6KWkp0H5sikpa
         vVFw==
X-Forwarded-Encrypted: i=1; AJvYcCU3e1XlyZzbwtpAaMZaNPE2EHMbw0AYZPug+ogvZcSosrM0uAzyNmmmYwS6YaYCGzYQ3lTq5DZidjcojb8LrY6y@lists.infradead.org
X-Gm-Message-State: AOJu0YypPWew6EHk6H4bndUPCH2ZZPgpDkuPvLNzbuWThziRRQ54SzUZ
	mnWu8DSQfMcZ+dY9glolLRp2427nt58WNyMHi0vnOqPs//TeGT3ZzRNM
X-Gm-Gg: AZuq6aJ17hIJBbohpAa3ITC0+yBBG4Jvq83PVUabPxaE1XdpYTa7a/gkhHsCbmAH240
	8Yiz0OqlszT9p6QoHvgM2I0+qw/FvDm3EKWvMmfvrjutBTpXX0ujD2KOAfqEoqD0OTGp9yzy8G7
	VcP8rJvtN1S/xa5qntMRPiVcDNv7WA+ntSNwENgERkDdY4e9ek7nc8SAUWRhCq37Z3XE2WGEmNu
	EwvqWjSLsjuEPCNxnIWPbVqPPD7f2mKLsQQGyg5ckWfmblvMRiBcnx1KV5u2DWXFMD6Uap+3X5u
	RG93QVq5nYQvuCIOhC6PjVjdI5xwqf55NcJR8oQiuAGKBfr2NVoCjoD7h0WBjPL0fKcdIMEtOpz
	rmgKQD+X3PaQClUCenQLUSEjdBinRu+SXBTJ5n6dC1Lr7WM3Fu06WfN1G1gRFx97bGvVUoSAy7/
	6HXZi9biChPOeSIAN0Be5BollBv78r8dyS0srVNZE6jfSXfqVlpTIELPVmDQK1pvMOGUXlhoUsK
	SWrAVW9lG+CkuWUjQ/epN5D7QiTeNeAgMg=
X-Received: by 2002:a17:907:a0e:b0:b87:3174:9bdd with SMTP id a640c23a62f3a-b885acf8808mr447577066b.28.1769274607425;
        Sat, 24 Jan 2026 09:10:07 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:07 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:01 +0100
Subject: [PATCH RESEND v7 1/7] clk: bcm: kona: Move CLOCK_COUNT defines
 into the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-1-9dffe1bdc08d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6586;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=RnZnHJ18fDqVsEwNPaA2WiUlZTCGKnUZ6u053T8HQLI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr1FfqMnbLwusKMWrFf9hyK50C1HihRKIDm
 VXJZSKRX1uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aCNPEACRa37WLyXaHqvqbwQAIll5LXDadSUTIlgrnwipH5Xj0Ogo5qg2N9Rf5PUrYR4xytOry/N
 /TLk65+/qtUelfI/7aX+v6uwPe+7lTGlu0FV0bIrtrsWU/sfpk6QwHY50jPtTZRVO9cUCHmqpnD
 BOyZCninlm4HT9+HvChhFY9FDkB0N1EmpYec/Fi+ai8hvzXK7nKt572n/OwfuPG9N5HMLkTNCEu
 7h4MAID0AWjOIR7fJquhV63bwecRCrhih8a8qZ7YntgauIyTE9G0XzZRKCP5m5nt2bzAenlwsf8
 mW4JTk20WIMQ7lFn3whGcGQw+Vcs8wkVBMicMKrulmJFWnQ8OdpJ8r+SwGSLZtXnJOKUIvx3rwm
 gE9owDqetotvhHVUl2dAWhSOu8vqAqcsJhAAZB/T+rRYaugEL2pnG243+Ru5Z1PwHJTWb2Ajnoc
 Brg/i9RpjEzRAkyIjOI4L5JZJtXagWxG4ToAkXf4DTKkBfufbVDM3+boBjjd0y7DK8fITxryTGd
 eMbVK4Wr3jDOcc8UGVOWd3GJtSFemT+pYu25uvnaNchAkU5iok0UA+ALYZiDSyfzdkxSHPlUWtH
 0ai3PiIDLRRR/FGB2H8NcH3I+wQmeiozETzgSmTKkkdJnk656/AFALFy/I6oF4347t/rfLFdRFI
 5xyO320dS4ZIauQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091009_739252_383C2B4A 
X-CRM114-Status: GOOD (  15.89  )
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
2.52.0



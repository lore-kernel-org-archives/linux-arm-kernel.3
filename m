Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D5CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2JNmAsQMXwBrZ+HkGZs8U98lPNd8boTV07cCQ2PUdg=; b=LszoyVmGxRZfkHFmhfum+qHtmn
	MM28iRxH1Up3X68WYVph82QjVW1b9COf/q4coPc+sajimNQ0DXvDkellNz3qqvWFttjqeoqNyrcD5
	9vGd683/M8bOOtPxVyzEshjg8IP0zReKkylws564whHZ7o5HGDXhfmz9zk4jZbX14uaIzSEQ8Rw1s
	fpkVYqetI+ckpyo+OpujT+d8uVJ9o1bexPP5xftdKR+J82M1I0LDA7+ACubfFTvLuEDTEQpQAxdEY
	rej+hj8NqDtR96kbUEen5QV2Dz+LawRuOrFF97wEWPuo8pAjmwwRR186akQuC3W4v8Bg2G5tofqKE
	Qsouteng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoW-0000000DFbJ-0eBo;
	Mon, 13 Oct 2025 13:42:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoR-0000000DFVd-1VPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso8200564a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362926; x=1760967726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2JNmAsQMXwBrZ+HkGZs8U98lPNd8boTV07cCQ2PUdg=;
        b=mJP//2fWLUSgJdfky7bfnkse9Anq5C5weoeKbQLBbqa6NDWJMgCHXRJZsJw1HA+0Cn
         CjVCKsDdazA8qVyZdhvTn1loo+xaivUO2vR7EcQlLGTkT0WXKaBMReYcSt+dG3AMO0M/
         h6KMnk5OUrFAedAyua9eyuRivv8/znblExcPmyckSRVVYC9gUnI4J0E9/Cp3G3iN6oah
         /xQVaPOD3mpoHCmPk15XirgFGnYPzqr/TO3WJqX2fq6my3jjT74uo5hoB3N0Z5zOQA84
         70lzjas7d4sp25JQMBO/OkM+Y3yy5gOhXIphPlmvdXLX9IWulEtmbpqzqc0cm4oiArip
         kPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362926; x=1760967726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2JNmAsQMXwBrZ+HkGZs8U98lPNd8boTV07cCQ2PUdg=;
        b=o1coyi/TQmwHrmbrYubCWamTLKZmn15pi95L0jY0oAKy8801sP1S0/RExn7N/HFpsU
         WZIDTr8x25Ed4589vyPNluRf2dN97Oke+mtsUt80iXKGykn45ARXBtAFvoWUQcic7VgC
         tAxj4M27B445uleuFyqg1ZAU9h2dmCMSTTJJqR9iba6QFUZMUuenNol+CnFv1dgzEbpe
         uHCsI4XKsiLOlwD3TDAVA6BbomokZpZB3Q67vd2njOXsEBBGDAzxmKcougYp+lVuXtKh
         v9SQis7myi1wyMEiL9sV/CKuS67ZzAiTf20OgwXsQKmO2h+BuAkChzeUd5q+ymrEiI45
         q//w==
X-Forwarded-Encrypted: i=1; AJvYcCXM2E4gRc2TuJ3v1gYEs2x8C71wDx8vpgvaoUjTVn3t4mH8oozhme906VLif7Je3Q2dbYY7s8bpGjrmTKuOlEHf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6VBDpHMlvtWk3Txg4km/eS4TkWllN1fVI+6/QY2MIgSKVBlGG
	brm2GeK5mOaOKnC8zfyLDJU5kAfqNSVUwPz2pFM9lHZkH4lEZb2fIt97
X-Gm-Gg: ASbGnctFl9gIUO+5Z/3zlQAk4nyvuDcS1rFFw8fQ+S97IMpOEo02r8aYi9zoLMekPMQ
	b/n13rbwfr02heFobVqcXXWSx0D7P4SCyAkrQts+1ZtV5S7Wib+GIHnsN7Rw44aV/Qvnydl/Zr+
	EURHTOI7B9WKulauh34B5mkWOh/HFatbmrAgSPLidW0cKflHUxsk175i0N3+LZXAmJXCz8JBZO7
	4y3T6Zzq0yMwoNpWY3uO9J31gx5XjLyxRXVQYeBejCVQ/qBsfRV6N3gqJOeTRNMs+wYd/x8AgnB
	7CJEZm2iMGNjQjfAwS/XBghzpI7Qi06Q44xe/HkjorahXXFjBd4L+ZXezRvkmDMa5V7jsuSc97y
	hHUeefycyVvSX6jIDa0vdfppSgNhPLkxNQn9QyT1n+3++qeZlE6voTcx4NBFUcCPDe3wc90J6NB
	x8H2Np1CyeOy6Y
X-Google-Smtp-Source: AGHT+IEr7XS2hclycN+mnSi01hMV+OGRLrukOUNurb7//LhjBIgEma/XQrndjKGOVHUypiZxAKTeKA==
X-Received: by 2002:a05:6402:4402:b0:63a:4f2:95fd with SMTP id 4fb4d7f45d1cf-63a04f2a1demr14173897a12.10.1760362925582;
        Mon, 13 Oct 2025 06:42:05 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:42:05 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:53 +0200
Subject: [PATCH v7 6/7] clk: bcm21664: Add corresponding bus clocks for
 peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-6-8f473d99ae19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5074;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=UvckdDHCIlUvhCo514yvPszt5ku8/k2a2D+TilE2a7o=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGgr5uUByjojIQJxP+Z4YZm92iUq2cPgfNyg
 QKlWr3LN0eJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BoAAKCRCzu/ihE6BR
 aEmBEACKgfsKSr42+oPEwgv1AHLiKQJuBWHTC+Kzq0rE8JTwfUjCQNLZoKIJ2/JdiaqV7/CKa7Q
 xESb+Ey2IHBUDjRv5yZY84EYfKi4JFQQPYKZL++VeEV0v+Tg1zka6Nz5TQlPKKv7NCxMRnqIZLl
 3osc4ORjN/CLC71rfrxnYzSlBWGG1h3epBtn9Goiesrgdwif3D6Fk9XB8EIgr0/VgYdU9o4DnEp
 CES8FQtlvPV0YpPy58OK+ra9KClBkksk7WgOZFfUl7QrGSI/WLXDyTvLfuFBHF3dxZZee2AkNGg
 59J2xaBms/g4iC+Jh9RIW+E0aUvyKCA230AlnYRXP1nppVJADhDtvfO18yyA4UxJHHD+LdQukdT
 naj617ObLIPKVWfRyA2SSCnhW2sUEA7Bq5WXnRzxOv3n16g0Wvls3kAhn1vKJnbUxpjTRqZ0EOg
 wPDxwb9Bdd4JT7ZHhzQ+aoxb8aO31tccbBtPO90f7J8CFpGRN0Ka2IrxE5+QgUEAWjPLjVIwCPl
 /uxo6tVmO7jGszkzn6mc3NXTLCIf+7QDT8SYPtRExYQjn0/Wl0RNUiAV2B3kdHXqWWGTF5JChrE
 bhd8AZf6o1iQ7LP4B6q4JA0WLIM3M/we11AlUJwrYYxl2UniQpWe3Und8/Y+RugOLIKJcAsvJjm
 CDAgLWNlXNS8FDA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064207_443955_8FD3C04B 
X-CRM114-Status: GOOD (  12.59  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
index 14b7db824704..4223ac1c35a2 100644
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633A0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVoLKCKGUvcQCGzonPZYxdyoc3VQjcmqRi5iUcJtRLQ=; b=e24brMhpBIoE817u+hBorMEaOh
	mx9xJSgi8mWa5GCYYDtlye+ihCEF5ePTd1RkZ2bH0/XFXjA1UeH9cuF5g4U0HTcODiti02+aQaTtm
	6ILtDUHPpyyAxDmFQY7w8JlKgYVIVSeyItgo/GzuFbPm4XKcjXm/lEVCm/hbtuThKA9CBe9Hlfnfe
	5rGgkFb1eWmE+g4HWVk5gosSbSN1Kl6cbppgwAM3YRySX6W/Vn2GiW/ELvNStRiVtVfpmFwUQnDyp
	WIEt0TZds4vE2jP5bU3iUtXkFAkB7teTq7oqClSIGsk7Z47U0asduMkUR+UW8tHnumO+bU3Eq6+Zo
	sSlKkvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzZS-0000000D8mr-02K7;
	Thu, 10 Jul 2025 22:16:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYm-0000000Ct4N-0woQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PVoLKCKGUvcQCGzonPZYxdyoc3VQjcmqRi5iUcJtRLQ=; b=VCdyMV3zKdqVULcZn7fu33ajFv
	6F7ZRhkOaBobteNvuc2CQ75AW8lW0Q+5QqGaDpHGyDUfEIIbh7ys6nKRiObqupY7sBFJrkp1HBHAS
	BZ6j+x0ZE/bMdYbJwZCOk8Fg+krSH7pnYZQKM1M4Kwkz0QTEZY0VSNZx4SR7fw92zLVWzqKHJ5luO
	Omb8ifbXxMDNmhMcgYWzv+3yohbTwSPSHS6wNXf7iukVJ5YSPKCioP7LMO+le6//8YX8kNuj+WZrf
	Ql6RN73gKTLcmRMkbH8xkdyi/LiwLWhkcWeuDLIsYp01i5Hs9RhHdmPILfQF2u9NjJOtWTwBzxr3I
	bx/qKWXA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYh-000000098q6-3HZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178075; x=1783714075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9aK4jdZmF1ToqNiZetoB/6dP7GUhww2O/JrrrKTukA8=;
  b=1zhTtdB6ds9GSfRvyW0MSWa9BRGM06zQVm3h0nXQaLHvIN87UWljq+EE
   wIyCWKMByZAB6xmGTCfjHUd51MJa/EyXVBWqZE3yP3doYNuv5pKlyQLfP
   rcjloLT9xkevVAcezIZkqw0DZixmJZAm6kyAO8fi0Jp+uN2Dsb/1tAdxL
   G9LNGFfzTgMxlVhR+PpbsWLTL4Sc8Fi+jpL7CLLfyDhyc4u2De/jfxNoi
   jrsfDrhFvtcyrxnPHBmGlPpLbd8Ihndmq7gwF8V+kSLurGmrs2Barvgph
   pE/1WkGH0ZwlXPsDbbQHOcDxMtedFt/o1DbSSSTC0bPh9vQMevI5Qtglp
   Q==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: NpbT3xu2Tfe2nS8n08xCCg==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448157"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:30 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:30 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 02/32] clk: at91: pmc: Move macro to header file
Date: Thu, 10 Jul 2025 13:06:55 -0700
Message-ID: <6776f06473d3be71882ef938a4314947f565e26f.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210757_346937_99B2D271 
X-CRM114-Status: GOOD (  11.09  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Move this macro to the header file as it is used by more than one driver
file.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h      | 3 +++
 drivers/clk/at91/sama7d65.c | 3 ---
 drivers/clk/at91/sama7g5.c  | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0b721a65b77f..63d4c425bed5 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -21,6 +21,9 @@
 
 #define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })
 
+/* Used to create an array entry identifying a PLL by its components. */
+#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..b74813a288a8 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -428,9 +428,6 @@ static struct sama7d65_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[0..9]) description
  * @n:			clock name
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 8385badc1c70..bf6092fea217 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -341,9 +341,6 @@ static struct sama7g5_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[1..4]) description
  * @n:			clock name
-- 
2.43.0



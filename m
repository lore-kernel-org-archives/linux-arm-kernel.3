Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D7DD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwoue6etwXNACANrpcSyWt6z5Amc2nmpEVMpidiMMUs=; b=rp2moCs5YcxMssfSmIUH8O83HL
	Fl+AlrBmoRu8qukSJQEoFI5HMzKdzg2yjF9z1IvShOHEb8BjZaQN0KlBWpVBBf7OMFX4eg3HVDsH+
	CnCBgh2T+/rSMY8SeGbbHrgpG8F2H3OBqTyAODg6Xtrls0RGdXwoVWW8WOQ+/qAvofQquM6zhgGju
	RszY80Gfp69a7JisvC7OQ2wRbU7QioU8vrZypwlUoqogWsJfcHCzb/YAQrw94E+sl3M2DyXsHmL5w
	0J0m4Gi9Xrunkwlf49HCq7SyHc72XCo9JpG9KbDqKuD1tFWp53ARfO3oyBQVm4ZjmaEujT4yKR4av
	k37vTEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsl-00000003zxu-0Vki;
	Tue, 20 Jan 2026 14:38:59 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsS-00000003zqq-0MIe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30AF6148AD46;
	Tue, 20 Jan 2026 15:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919918; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iwoue6etwXNACANrpcSyWt6z5Amc2nmpEVMpidiMMUs=;
	b=Z9NLRCM4HpsIkStvE5ywBfvF5SBI5aEY0OkWW8ddKhtLI5lf8ML49VHmCd/xm4YjLOmBl/
	/iGzvn5MopJOW+RyA8WtqJfxmnY2eS+bbe8VTTztm3E8i2xh7nTKViQ4jlW+OKQT8ISBLl
	zQ0/c0H9nER4uoyeOCeFsYk3GSWSZDeLJPpg9hblPoKt/By4j4sd35GPrAimSoqHIvITEm
	TLoX0cKqApP0KRL4N7H1bAyv4q9Hw1LO8A8+qxTrjKgS7mVluOkf9f87wOn5EZUp+Q10wl
	PZ/3M6l6Z+5aQj1Yv05WgKfRdZnpejFJ3am1g093kHga3meUb42KW0FBuU+Rew==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>
Subject: [PATCH v3 05/19] clk: at91: sama7d65: Use highest PMC definition as max index
Date: Tue, 20 Jan 2026 15:37:26 +0100
Message-ID: <20260120143759.904013-6-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063840_280937_7D9A830D 
X-CRM114-Status: GOOD (  10.46  )
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

Consistent with all the other at91 clock drivers now, which also use the
highest PMC definition as max value, and no extra number.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 drivers/clk/at91/sama7d65.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index f6f86261ceefd..4ccffa8db43a5 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -19,8 +19,6 @@ static DEFINE_SPINLOCK(pmc_pll_lock);
 static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
 
-#define PMC_INDEX_MAX	25
-
 /*
  * PLL clocks identifiers
  * @PLL_ID_CPU:		CPU PLL identifier
@@ -1120,7 +1118,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
+	sama7d65_pmc = pmc_data_allocate(SAMA7D65_PMC_MCK5 + 1,
 					 nck(sama7d65_systemck),
 					 nck(sama7d65_periphck),
 					 nck(sama7d65_gck), 8);
-- 
2.47.3



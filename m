Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D28CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rr9n/UgaFVHhF9CBGDdnyVDF3gsfRw6mucPwMNctvsE=; b=l084W0ay/I98W1quxoWliwVCcb
	gfo4trkS0rlD0e8rMM0vS+JFQecFkMNZKRen4ML7k0SMMY+Vpq4DbuwzhTDZD9U3WLqS3Ihe52qvZ
	g7i6tKK4KHSsgkLG79oVJsZ7tmqn9Yc6X3bggKO17dfxuMslBNz43z5RIVmeplH8kuMXxvGMGc1ud
	mxlyl8KcWjSmiOukLO/ObonmEmGMK8XSXQjQg9isL+8bF1aaEcSnPJbfcRscMLk70FGfPasTlO720
	k/e13KadkU2t93YOWMsjKSEoMBIlzEDfFXUG9RZeXswIghiM3iXm9GZtMhoWVZO+is5ZxdNqpbGaK
	boZUHZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBe-00000004oxE-2sgv;
	Tue, 09 Sep 2025 06:50:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvi8s-000000025NL-41y4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757362031; x=1788898031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BoqMfXbExT7t634yESc/SibX5EIdQetlbFOZlCukLw0=;
  b=F8GNcRKiGcQBIuDB/oKmGH07P8gHmc3HiPGVfuH6EEpj2GRwVmVLhz2I
   yeL7Ks41PGJ7KxwriIrk5RBWjSz/LAhiddmlj/rKismXLhrjW86gaPlvp
   v0FaNNTBRd5JzcfJyRfMD8kNeIKY2uLZLdXV3Yuaj4vnGRbg1mx089tw4
   4XfgRt0QEmDPw+uZeETmUzx91uiNFojRwzz7PDSe8XdtJgpB9o+Dg8r8o
   VI9US484ZKenMbpIpZF8Qe10ufHUVLxMuHaMAC469aR+4qzHhHUmNf26Y
   9W5xrk+v1PpJ50zhbOWA4OqqTyvxE5pr8V0JH/ALcnUBtAST61cRIhOZf
   Q==;
X-CSE-ConnectionGUID: EMpCwBz3Ssqhzk3id+g8NQ==
X-CSE-MsgGUID: Z2lHKD+gRSG+WU2V/cbPIA==
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="277602015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 13:07:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 13:06:37 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 13:06:37 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH] clk: at91: clk-master: Add check for divide by 3
Date: Mon, 8 Sep 2025 13:07:17 -0700
Message-ID: <20250908200725.75364-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_130711_255545_523AAF14 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

A potential divider for the master clock is div/3. The register
configuration for div/3 is MASTER_PRES_MAX. The current bit shifting
method does not work for this case. Checking for MASTER_PRES_MAX will
ensure the correct decimal value is stored in the system.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 7a544e429d34..d5ea2069ec83 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -580,6 +580,9 @@ clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_master *master = to_clk_master(hw);
 
+	if (master->div == MASTER_PRES_MAX)
+		return DIV_ROUND_CLOSEST_ULL(parent_rate, 3);
+
 	return DIV_ROUND_CLOSEST_ULL(parent_rate, (1 << master->div));
 }
 
-- 
2.43.0



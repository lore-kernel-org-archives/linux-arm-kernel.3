Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8508CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ky71Mnv1o4j9dtBC5FM4kNDHq6xAMnAD0l3G62aCXo=; b=P/NDMjDQabDi32aafi5KKUo+x/
	P/ByLDwQSdarrALy7lqtitbe63jhq0gligW0qdVIa5pA33O0laKRBI4brtEs4Wga9BWSaRkEx1bb/
	15sLhZfihAyvcX3jOOK+V33dWu9uQEz+bAbN9wqOqGEtUaPqv3a7AxpRUaayBdm8xom3bH0J3hp1h
	IB7RIp3aTvYoESY2y/pFJJ+yx03PkVafhKkU6xIPxY8FHGumEHrgWC51AW6FwxGPOEDY+a15CiSHv
	28cUArZJSVncppcpyioazoImyGT9Cqmgr08NXyJbrTQt5x13C+qHQOhFa4ghcMOBdD6Mq3O56Nt5V
	OMngAdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v6-00000008maS-2mpg;
	Tue, 09 Sep 2025 17:14:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvjZ-00000006SDM-197m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757414277; x=1788950277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=75ANhpaW227bGu0JKhRJlzVZJZScwakaz/wvhDzumdE=;
  b=DjS7wI6p6a1i7PRiHshI7rRMC4L8QRpVOLpWWhKnDVviDmXyTyiT9OV0
   /FVY+7uPVf7TG7pKpxWZtQ5zhxZaMgdkS/42ZqB97o3+vb2lWrVcL8TNS
   2bEf5y/aYG6kE1Xdw7HB+pysOWffxg3MZx/6s3Ca1f32OorgnfBfXnvrf
   yj1mEw+7P1lxXHin4OzWqKDtznSRUorGzDwtO4SvqJy3MBIcyXu8jvFL9
   Q4mNgEoCV3vcMio2AXvbUFaOROa8ZNRpswd8t2sK9o4o7Q64zOXr2dxvO
   hX4IIE9j1lde8SMC5wVRWNaOf7oZxujwdno82Vc9CfEZJP6pGOABAGXJM
   g==;
X-CSE-ConnectionGUID: 4S6DztCWTLSzrCQS5AblUg==
X-CSE-MsgGUID: XXV7pOUQR5KQenWm5l5WqA==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="52016856"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 03:37:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 03:37:45 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 03:37:40 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v2] clk: at91: sam9x7: Add peripheral clock id for pmecc
Date: Tue, 9 Sep 2025 16:08:17 +0530
Message-ID: <20250909103817.49334-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_033757_317994_74C63BE6 
X-CRM114-Status: GOOD (  10.37  )
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

Add pmecc instance id in peripheral clock description.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
Changes in v2:
- Removed Acked-by tag that was added by mistake

 drivers/clk/at91/sam9x7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..bce60f7393d5 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -403,6 +403,7 @@ static const struct {
 	{ .n = "pioD_clk",	.id = 44, },
 	{ .n = "tcb1_clk",	.id = 45, },
 	{ .n = "dbgu_clk",	.id = 47, },
+	{ .n = "pmecc_clk",     .id = 48, },
 	/*
 	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
 	 * need to keep it enabled in case there is no Linux consumer for it.
-- 
2.34.1



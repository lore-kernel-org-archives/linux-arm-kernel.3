Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67864C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPNJU3HUuRlIa1M2PXkqSihNGEWiLMkRLg94+plePY8=; b=y8OEwvQqe+m3mBhdW2PQMOx6g9
	fHVwOTxJn+wc109VWqlKHl0xrzfiYcQUX7lf9GWVsWhvxz9mEL2TCk2xxtwXesJHwNcW6OokkPHf/
	HmlQuEdnKaHeRAozYSdBvgyGajzrLnOwx4adtaOvukn5CQsP3sSswxejWe2FPheZkXDRuze3cq7tg
	5jylcugey5LO5vR6lzhkqBOjiWbGxmiVoN2jUVeOBrGNy/TJi3HHCETzvpVyc1+c28TcIz7Owfza/
	KxutZiW+Y0/RrWRs68PHk0V4Ohtti9cbA30LQ9Ip/LUahpAgdjhXv5GCtMeCwKScT7B+w0y2ssxRp
	/s5+94IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hs-00000006Pdr-43RW;
	Tue, 25 Mar 2025 16:00:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6ci-00000006Oiz-3V9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742918128; x=1774454128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DTPKEilYj2VhkyykiftQQRsvTuB6aohlC1zkwJ93OZg=;
  b=CjldUpSdY0MPlysMQQ4LefvKAj8MTwiZUNU9xAjE+SHlJvmpGTuT1Lg7
   VltwPJodsTZb8hGInxCsYWhjg3q0JqxYUF2ONf3srWyFXnJXzqUZ+7T55
   36hAlm2FjH7d7KiOBlqheSdHu5wT+4nZC82yJO80bXWKpYcetHhFQw6aI
   +rLDLlmGjTefEI2WYFswkNtfcGwB+N8DvlbEvw5CZELjl6Z6e1O4hv+oB
   33lRx9t1AgN5QQKpc3SK4SYKRZIxS5qhaXXO4T9zVO8pXBUuvRU1jVoTD
   mxsZhIEvvtRvxYRv0b58zZuMt7ZdhvQiBefJ9U3VtbcXUGksgSkI4m9EL
   g==;
X-CSE-ConnectionGUID: 5ZRRXf5LQVCIU2dRAgtdWw==
X-CSE-MsgGUID: IvE5j8eqQ8es0vuP6d6DeA==
X-IronPort-AV: E=Sophos;i="6.14,275,1736838000"; 
   d="scan'208";a="40152232"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Mar 2025 08:55:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 08:54:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 08:54:53 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>
CC: <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to parent_data
Date: Tue, 25 Mar 2025 08:55:08 -0700
Message-ID: <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742916867.git.Ryan.Wanner@microchip.com>
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_085528_932854_59EAFE58 
X-CRM114-Status: UNSURE (   9.91  )
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

The main_xtal clk_hw struct is not passed into parent_data.hw causing an
issue with main_osc parent. Passing the main_xtal struct into the
parent_data struct will ensure the correct parent structure.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..08306261c9c7 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_data.name = main_xtal_name;
 	parent_data.fw_name = main_xtal_name;
+	parent_data.hw = main_xtal_hw;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
 						 &parent_data, bypass);
 	if (IS_ERR(main_osc_hw))
-- 
2.43.0



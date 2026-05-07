Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD3CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7Jf8NssAb14tE0u9+C8PiM10HLAzYtfwQC4T9e5sLk=; b=Gem+l4XJjHgpGEpaDFjzXsOAhx
	uAGSXTm8QAtTTXTskOP6Lc3APJ6XR/4Gkw7NcceBq+PVy5ElGF2SDONOLNqQbKqnqMkxp2o2qRDrH
	vr399PccqCPMxh55/3dwgofYGTlkUBWYMXyJcijmi7VQcZ/wodp/WXV/QWLU+KNSzDGZ8O5q9PZI5
	v9faWszmbYvpAqQU/jy3zXoR2rxnJ5RNMjsex5cfuo8chs4HH8j8zUijp+PLcRar7qCZfu+dwAQNj
	Zag6ZYaSDpwJ4aEwTHzD14WxT/Fp/2rGNiJy1CUcnQn6A2TwmmLaApVe+FGt7JmKFgeq3fPoI9Z1B
	ujUz4Z5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPT-00000003EQX-2vGk;
	Thu, 07 May 2026 08:48:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPQ-00000003EOJ-2vWU;
	Thu, 07 May 2026 08:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143721; x=1809679721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vo8PLbEeEOLnNS7NNKfk6ws6uyzb0y2Zb4SQSEo1w98=;
  b=BGVQBBPGBbD2yGskwibVahSDItC7fU6PdD/F6jkIomwdgkePgqcskhaC
   ptEuShBq1NaIt4srQYea2Xulpj23C+FLyn9cX+bDFPHE7vogRErNUVpIs
   oKrHQT0+63Mb/PLVrrV+WUicRWpaNBIhoNRKDMP0Chhb+CSC3au7qIXiL
   Xt5N+58i8x/ThEEc8dOZacE1cQVfB1BKFL2jQwSzaQPUqLeUWe48e0z4y
   NqUiLGvzwVzQwJOyOUGU1ehxnCXKoXqNsS2P8gPvd3p/XkUhgBTwSMuZU
   aONGgigN0LCe3Gv3hW7AZIs/G7hnT7+YwEs3h63zcyL2xM6TGw1v1B9Xq
   A==;
X-CSE-ConnectionGUID: 7XU7RNWRR8S25mq9BNwyzg==
X-CSE-MsgGUID: It/1+/tZQ8q3jrnhFIcZ0A==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="288533310"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:48:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 7 May 2026 01:48:39 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:30 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <tytso@mit.edu>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 2/5] clk: at91: sama7d65: add peripheral clock for I3C
Date: Thu, 7 May 2026 14:18:02 +0530
Message-ID: <20260507084805.481737-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507084805.481737-1-manikandan.m@microchip.com>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014840_748309_2CED0794 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add peripheral clock description for I3C.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Fixed indentation issues

 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..ba8ff413fa2c 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -677,6 +677,7 @@ static struct {
 	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
 	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
 	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "i3cc_clk",	.p = PCK_PARENT_HW_MCK8, .id = 105, },
 };
 
 /*
-- 
2.25.1



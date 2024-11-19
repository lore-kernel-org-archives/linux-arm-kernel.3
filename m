Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B49D591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLlRT61xHyf+QqYkQnDL+uPcp2+l2poLCDn5meg81oY=; b=ITUE5pA5oNsTosicTI2YzrJf5r
	mcn7h7kxvnPHX1tz5ascJvZ8gZRY4QwcE6N9oCZd6t8AV99MjCdRWw0WJJ5cJEyyPCXkL6J/+5BC4
	cvi5cDUYKTIeMqvYkRr78WjNpxx6RNuB44OjLS77HkbY8nUtKJiEssE48YRzGE1zLonSovpt1jbyp
	8k+oU7GuIPL/CjTNrC3deSBQD9VeA5cD/TYAOTQyEb3W+Zw5X1XupRT0R6v6hp7Kqc+bYaGfW67XF
	m5BywVeoaE6b/GrgIqS0/lZVzT/189Mg4n3SOAOYjVo4pdy6OJz+vz2XBkiu20aMi/A8XgIcC9SaQ
	c/H0EewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRVE-0000000D7GP-2pko;
	Tue, 19 Nov 2024 16:55:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRI4-0000000D3hP-1rbo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034484; x=1763570484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOxpeVFkqnL2Y5O3hgYqoVg6mqZBgyYjDKCVB/vo2FA=;
  b=UHEcKduqowzGkf/jvvbiImgBAAcPkCuu/nmanoKS+cKwVk+1IGEIS26Y
   wiB7jzrEpyJAM8XWTrDSszYwNHsmjR+MceOrR0ayPptuvbQE2fLPxWtlm
   gKEUVN3P7hLOdSHYlTIpImO5FsHfIesDsz1+szp6rqhmsdYJFiCWXeRpV
   oWdTnP9SrYG3aA75upZ8O7IP02wwJBxLn56rbgUZYdVip+CleGMHDEQ7V
   7kLXf5BwwLY12EL7++DsGKcv2bxu22kmXCxACKmZ70S5nZv8n39CPXj5E
   otofj1ZsqxS60vnD9xzkDGx6cCV7nvP9CSXJLUVJWTLUIpm1341UpVN/k
   Q==;
X-CSE-ConnectionGUID: RxwVwqVBQ5Gt75b5OWvVzw==
X-CSE-MsgGUID: UGV5CbIoTYaHNKXralljuA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="34239909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 13/15] clk: at91: clk-master: increase maximum number of clocks
Date: Tue, 19 Nov 2024 09:40:19 -0700
Message-ID: <cd6c8be4b476e04b2d18562bf72cc9387227e765.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084124_547095_6DBF8126 
X-CRM114-Status: UNSURE (   9.71  )
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

Increase maximum number of valid master clocks. The PMC for the SAMA7D65
requires 9 master clocks.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 15c46489ba85..7a544e429d34 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -20,7 +20,7 @@
 
 #define PMC_MCR_CSS_SHIFT	(16)
 
-#define MASTER_MAX_ID		4
+#define MASTER_MAX_ID		9
 
 #define to_clk_master(hw) container_of(hw, struct clk_master, hw)
 
-- 
2.43.0



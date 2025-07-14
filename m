Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA39C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SquFaOmzhdSCPSf442i9c9ofnagg7OiOi3uY7pNnAcU=; b=ix9Upf1RK5m0oaqQfLNH//hdiW
	9bsve/vrP2oMteUZ6UN1BkfBxXWC1WXMh86drCRDhT2Yzz9mNnok6FYq7d2cdfZ4nXVWdoAbvJqSf
	yzdCkeQ9yzC5AjthMHlg2facDw7fIxGV5O6pOCYYmEJXiJJRHxUzD0AeL/4pa0ODN9eywJhOf2Fyt
	VPoAhhporMxOfjOsHudMi/JHmHYqWjt8UfMtI4cDN+j2ZOW7+bYGelJsFDaeljtLat4+i9j/xVWox
	5KwooTOfRPpiNTmwe3Ah6bRfSIAE0WNqKi3TODkniJlcwN3c3dHWWCejjDHatwWObawzOnkOj3oC9
	akDw/hZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFd-000000034AS-1c03;
	Mon, 14 Jul 2025 18:50:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMAz-00000002qj0-1MNv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511033; x=1784047033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LUBpjaHpabEBtLxMOCRh4eneG0ZnYbo5PTNkmOxwai0=;
  b=vafi2n2HT+WVuzGA2GH7cIH8y7TVmJX6ILlHsWQtWn7dcW8434UALpxA
   J3/i86e4K0nAylQ87xUmor6JWuhhY5WCn5kce322vpnrKcMl6Gzabh51X
   CaKiqvbQJ7GYlYT//a3ea9nu4YO3YaKqI3jMF7c10csXSLLFkRpM+y5PJ
   8i48rI0h2QoAgbwhd4BNDDd3QH8TZqz8C93zjbReph0yXE6zFj95MG39o
   oEm1KE4PQZtp5ms6vdDWoecEDJ7nHNIdQaljMMXbDDfNVn67TELgrgQmn
   /+FIx7joWJYAIFgm6VsduWQURohTFDrl1/wgiEbPx/h6fbbPSIqWVMxCy
   w==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: bBsoHBrySlmP3KrlcPOK0Q==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399325"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 09:36:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 09:36:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 3/5] net: cadence: macb: Enable RMII for SAMA7 gem
Date: Mon, 14 Jul 2025 09:37:01 -0700
Message-ID: <6698836e4ee7df5f6bee181f0d2e38d4b8e4cec2.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093713_444285_DDC8C422 
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This macro enables the RMII mode bit in the USRIO register when RMII
mode is requested.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 9ebe1062b359..51667263c01d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5103,6 +5103,7 @@ static const struct macb_config mpfs_config = {
 
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
+		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
 		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
-- 
2.43.0



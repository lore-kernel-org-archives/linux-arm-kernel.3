Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E83FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5mQRlvIQumBzae6DGLhGITM7U28amh0tzXei+WCJb8=; b=dLJWPQTFMMBXJfGPCCzEGaQMIz
	kbyLQVYvIcaU8O7/Y/vhF6BCF2Ddoccis8ZBmt5GRSwg05axLLAnzCll2ve2zvxKHr3zM4evqr1nB
	rPnWuztSzLGJeol7yFaDBsGcX2mEe+c6TBIUcT2b4sGTQ1H0YikjHYzEaCu88MQq85E2hEp/yn0E0
	5bmZPFbC/sQDKNHJeWBQYQNysBHl/uQNfjaKputQmQqTY75YAy792nyX8q0Qmt6OCJpS4xiGr3YOH
	5m0GLljGZaDixcOymaQZsdoQb70RIBqEryTVKHAradIJJNOg9rSJcp3mNer60abFXLIpZAhjOgWBO
	JsGFjmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXa-00000008Wne-34cP;
	Fri, 02 Jan 2026 17:02:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXY-00000008Wlk-0OF7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373336; x=1798909336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GO9TkFTYYc1lAE3J6mL7TFl1uMGeLRAzDYmt1vk20x4=;
  b=RLQxHQH/42qxwi2WKIjUlB/7FDizHgzkx7JXnsN7MWgmu310GNgK7fxZ
   iCoFAGE9RC2gk0ErPNdk4NF78iPzzzOX/DCgJenyGUanTzlmfm3bFbfhk
   mhtJEarofbeFzdjMU4dLOXYg1NoDrD/J9RBJcT/8cdk9AtuD9jQpFoqOt
   KaHvp6TvSppsI7n3a0k28FKxa8SgIY42AoiyVpS0VXNujEpjVHOOVN0iH
   5E5tSWFHCIxeImc0Hg0uQa7FgOnJd7hmamTGrzjArfPAIG3ELVfqyBLKr
   UV8HmC5cM6U3T4LWEc9qZoIDQEuMZbW8RiQBie633HLD6LRy+BNWcTIYF
   A==;
X-CSE-ConnectionGUID: AoVct/fNRmqflI0xS4d9hg==
X-CSE-MsgGUID: nSu8DN4iQ0uHNgj2X+ahCA==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="58167787"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2026 10:02:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Jan 2026 10:01:45 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:43 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 4/5] ARM: dts: microchip: sama7d65: add fifo-size to usart
Date: Fri, 2 Jan 2026 18:01:33 +0100
Message-ID: <20260102170135.70717-5-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090216_134075_81748DFF 
X-CRM114-Status: GOOD (  10.63  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

When missing, add the atmel,fifo-size = <32> property for usart nodes in
flexcom.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 92d92228f0a5..82781a1dbd6d 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -414,6 +414,7 @@ uart0: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
@@ -492,6 +493,7 @@ uart2: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
@@ -517,6 +519,7 @@ uart3: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
-- 
2.43.0



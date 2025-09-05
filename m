Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E66CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmoYqDjzv2+QqqSAR3yea7iQxchNSjXjSil2oqdNXUc=; b=Dx516FmJJf8Gr/0GMeR5BIFkyN
	JHXnqUOi8eprbs7sr+SiwePRq+JbLbcq9A00wcmNGQd1pV4ZQjiqgNjPaAWFhFP4+mHLLUQ26DOaq
	kJDwYUyiyOgWnT2heA8CUpGacRVQFHRWbonMlNFnABcqgcL1Xi+kKPusF7BtQ21tugLJUfF+ukFue
	5OpFOp+5UsGQEfJsR9LZcVs17H6b+6S8LzwjfqP34ZFktCjocnzywoCbA8HjekVEdVkqQnrj5zVrM
	m5/R9Tq6Su4RCoQAl+K1pEdyoFTTbyQLrcadmV3i1X4oI5FUAXeQTxeQRYy8qmkoA/JPQ9onjcwUA
	brpflBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWC-00000002LmP-3LSU;
	Fri, 05 Sep 2025 14:34:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSwv-00000000oIK-0DTV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757065301; x=1788601301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TWlOD5JXXoZNqvz8QV1CVTOyMCxc0QRwYAvXeE6WEKc=;
  b=TXyiRfjPPPB/2hUVz9pPriMriYcZzLgMdyqf/tHkILsJyrp8XYxIiFE4
   cogoAK0eL9/dMrye1OibnJqRPgnKFqOBAs4Y8FB9+7iS7A4XUgcRRZ30x
   bQvpQVkUVOvypFr3Y4cGNeD4IMatfHK7rROF+h/GHOGC2lktYXN3EgYvE
   CvywRfrwFCK8MuA8PqjSstsQcqLtFT9sRCWi1+zkNE/osSyA1Pzv83dpA
   8dwOkQrpQNfyk6UiOqzsNV7ra5BqqQNKFMH/RQk7ACF2RfZ3N3Bx5tSpX
   +1vcwOQ0iLUZUWDRcaM4ayb5FPMvOVGve6W7Clo1WLac8V3Npl+4WZ18Q
   g==;
X-CSE-ConnectionGUID: V3vcaq34T5mcK/flcDdNQQ==
X-CSE-MsgGUID: TK0c2vcETQKZ5tXxhj0VwA==
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="46672958"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Sep 2025 02:41:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 5 Sep 2025 02:41:29 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 5 Sep 2025 02:41:27 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: Ryan Wanner <ryan.wanner@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>
Subject: [PATCH 2/2] ARM: debug: at91: add sama7d65 debug uarts for DEBUG_LL
Date: Fri, 5 Sep 2025 11:41:12 +0200
Message-ID: <20250905094113.27480-2-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905094113.27480-1-nicolas.ferre@microchip.com>
References: <20250905094113.27480-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024141_150348_4CA91F49 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Add USART6 on Flexcom6 for AT91 DEBUG_LL with associated physical and
virtual addresses. It's the debug console on SAMA765 Curiosity board.
Add the possibility to use USART3 as well because it's the debug console
on some other SAMA7D65 boards.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ryan Wanner <ryan.wanner@microchip.com>
---
 arch/arm/Kconfig.debug | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index c941adbc850b..1f4c473b81ac 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -207,6 +207,22 @@ choice
 		  their output to the USART1 port on SAMV7 based
 		  machines.
 
+	config DEBUG_AT91_SAMA7D65_FLEXCOM3
+		bool "Kernel low-level debugging on SAMA7D65 FLEXCOM3"
+		select DEBUG_AT91_UART
+		depends on SOC_SAMA7D65
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on the FLEXCOM3 port IOSET 1 of SAMA7D65.
+
+	config DEBUG_AT91_SAMA7D65_FLEXCOM6
+		bool "Kernel low-level debugging on SAMA7D65 FLEXCOM6"
+		select DEBUG_AT91_UART
+		depends on SOC_SAMA7D65
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on the FLEXCOM6 port IOSET 4 of SAMA7D65.
+
 	config DEBUG_AT91_SAMA7G5_FLEXCOM3
 		bool "Kernel low-level debugging on SAMA7G5 FLEXCOM3"
 		select DEBUG_AT91_UART
@@ -1627,6 +1643,8 @@ config DEBUG_UART_PHYS
 	default 0xd4018000 if DEBUG_MMP_UART3
 	default 0xe0000000 if DEBUG_SPEAR13XX
 	default 0xe0064200 if DEBUG_AT91_LAN966_FLEXCOM
+	default 0xe182c200 if DEBUG_AT91_SAMA7D65_FLEXCOM3
+	default 0xe2020200 if DEBUG_AT91_SAMA7D65_FLEXCOM6
 	default 0xe1824200 if DEBUG_AT91_SAMA7G5_FLEXCOM3
 	default 0xe4007000 if DEBUG_HIP04_UART
 	default 0xe6c40000 if DEBUG_RMOBILE_SCIFA0
@@ -1690,6 +1708,8 @@ config DEBUG_UART_VIRT
 	default 0xc8821000 if DEBUG_RV1108_UART1
 	default 0xc8912000 if DEBUG_RV1108_UART0
 	default 0xe0010fe0 if ARCH_RPC
+	default 0xfc82c200 if DEBUG_AT91_SAMA7D65_FLEXCOM3
+	default 0xfd020200 if DEBUG_AT91_SAMA7D65_FLEXCOM6
 	default 0xe0824200 if DEBUG_AT91_SAMA7G5_FLEXCOM3
 	default 0xf0010000 if DEBUG_ASM9260_UART
 	default 0xf0100000 if DEBUG_DIGICOLOR_UA0
-- 
2.43.0



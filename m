Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDC2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dhxv2Ldmf3lfO6yUu/5fxZXSR7j8s2TqZGcLy5eXwJA=; b=DlipAEOISDUqiRf7R2NQWDLS4x
	pkbPq/nZ+10kWCSOgZMot6gRYAfDURgBYzYCR8gzWwTMtbzCcazN2nvVRF+qR63eN9IkAsvsOpBu5
	eroeb94GTxx9YSZlQg4yViMgZBNtWpbb7WAU9kYLoN2EdXJBD9ccSxxijEKaAHFg5SlRxjsGzoI7+
	1KRQKwtc6MHoDyahiC5mPMGezUezrfLXV4m1rEReUzhaGEmtbRC0WE9V58vaZkug0Vbi3jWzEoweB
	qTplBW6Usl0olYe1zYUULrj3N7kPdAA/7hDZvwy24/D1+Kcm/pjiytZbTEU6g2lAtbXFqyNdAUN8F
	o3nVhKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJedr-00000002eaX-0EGs;
	Fri, 06 Dec 2024 20:09:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeVy-00000002caO-1Ii5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515286; x=1765051286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EDgeR2CqOpPK7W89tJ2iGezT48Utt4/EPu+Pu86jzto=;
  b=s+7+JFHo3tFfYzp35G3okJsBMa53vk8l+HVOJcXXnAKgW7v/cj6UNAQI
   wgTpWaUBduzEoksOB6iEdPhCu1ZQFSAQXMXNMXzjNhxYvsFXd569pMv4o
   Wes2EK3y0kuBuUOZ89MO8AVBL/tJQV1BLlUVc5kDMzrl/8+WuHjpUJmSq
   V75ridM2uMDSikfFjUS0GxQvvS/Nw0kU9782LGOCNA147GsJXJpKMlQkq
   UvFKk23t5QFqVPzL0iyGVcMtjICj5rfCV/IF4FUADVKlqk94NPBkXYX+8
   A3H+vQnV8aaTNA1zeL6ZTkS+f2BSFEOxeM9b5NUqhUfpSZWun3cHaiytE
   Q==;
X-CSE-ConnectionGUID: wHv5dacKTzaP3KMzdbJ8Aw==
X-CSE-MsgGUID: Tk7POqmnSfmkzx11dwdSKw==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="202686991"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:11 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:11 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 12/13] ARM: configs: at91: sama7: add new SoC config
Date: Fri, 6 Dec 2024 12:59:57 -0700
Message-ID: <e5a1311100a4f05fdc44107e124129d2d93df2e0.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120126_432048_35C33860 
X-CRM114-Status: UNSURE (   8.38  )
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

Add sama7d65 to the sama7_defconfig.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/sama7_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 758276027dbc..b1dcec1a6df5 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -20,6 +20,7 @@ CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
 CONFIG_SOC_SAMA5D4=y
+CONFIG_SOC_SAMA7D65=y
 CONFIG_SOC_SAMA7G5=y
 CONFIG_SOC_LAN966=y
 CONFIG_ARCH_BCM=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 1a2e93c8ee71..ea7ddf640ba7 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -12,6 +12,7 @@ CONFIG_EXPERT=y
 # CONFIG_IO_URING is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_AT91=y
+CONFIG_SOC_SAMA7D65=y
 CONFIG_SOC_SAMA7G5=y
 CONFIG_ATMEL_CLOCKSOURCE_TCB=y
 # CONFIG_CACHE_L2X0 is not set
-- 
2.43.0



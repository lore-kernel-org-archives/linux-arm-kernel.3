Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9303C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s740VCpdlhQ1AfVAc4B+N1uZKDoglRgOPunmfkrh78=; b=kOhtG+9dN3cYsWpk8KlJouMbm5
	K6Xjq4sFsvUkN5x0Zn9/Ns7RWvW/MP5OfLMxjMCI6EucEjCZCYyti0/vYbnaTzbBeigGrfcYAN2EP
	OHmVWOoNfzwBC4c4TOtP0c2OWYLkP7GIn1P7TO1ZKtxEyw+Fx/Y1B5JPLJVGqZWruIkTI58SDoWXh
	4AsRX8AI3U8D2o8SykFH9HAbZrJapFCxbcYHbIqmzh3rKI4YzIXL1MHdfYvX66elERIfKo+Tv7kRD
	0LKN//HRU1Ecy3/RjOch8X3bzO87JXs4W9w8qtyvNK95bBZMs9wavxk9deOp6TSTwgM0MLIk6B8iA
	BG5d7oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUK4T-00000007kAC-1vuX;
	Wed, 25 Jun 2025 06:57:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJxM-00000007ie3-40Gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 06:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834204; x=1782370204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oY1HHv+Tb3nPaWt2I9NusdqqhMcQ7Dn/TzUoNK3kqmc=;
  b=FkEuHtPh3Qz9hMmLPjIwkzQyI+4PX4HNY/0+sCNcGXjyZTgofOus6ipa
   XiwnNaxHhANnjAlH83YB2v8y+J+CNjznfckMCE9G6eHs0UdbgxMTQomHB
   X2Q2Nr2tSM9RbWAL55HKC9ja6IaVCcEy1BUeDC2aouP6PgHqqeA1x92Pq
   O52QggXs9eAMY+Hm+9eD/d00L0Ta92o0UAiUkGhfGW4z8SpYPfA5Thj15
   zd8cBnA7WFHgyrO76U7Z4RcVxkDAL66vLdDTTD0OzQdHZ64ocvkGnV/Kk
   vd3VVCW9uIHkHs0lEvAmEDvMurPGU0rmgvV6zhaswcE7Oo8/KUcJd7P/m
   A==;
X-CSE-ConnectionGUID: 4z1r6s7rR4GWDP9QOY3lYA==
X-CSE-MsgGUID: DrkzkN5ZRQ6wt4w4NRkS5Q==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="48271089"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:53 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:50 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/3] ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:33 +0300
Message-ID: <20250625064934.4828-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625064934.4828-1-mihai.sain@microchip.com>
References: <20250625064934.4828-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_235005_001432_C9B60578 
X-CRM114-Status: UNSURE (   9.60  )
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

Add the memory size properties for L1 according with block
diagram from datasheet:

- L1 cache configuration with 32 KB for both data and instruction cache.

[root@sama5d3 ~]$ lscpu
Architecture:             armv7l
  Byte Order:             Little Endian
CPU(s):                   1
  On-line CPU(s) list:    0
Vendor ID:                ARM
  Model name:             Cortex-A5
Caches (sum of all):
  L1d:                    32 KiB (1 instance)
  L1i:                    32 KiB (1 instance)

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama5d3.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
index e95799c17fdb..00ba59ac1968 100644
--- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
@@ -48,6 +48,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0x0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 		};
 	};
 
-- 
2.50.0



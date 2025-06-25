Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3A4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ9DC8Iy452rkfQggaH7jLVjtmkxK1Xh/h8NP/FNHe0=; b=w3k2dBVAahsrTxWCG2CfAzK3bl
	SryzZqKcYnc4Cf99VKgLuufybSXvAgIKFQKNS3oQMR9IicTcxH8ciBOMSzBfcJLqIm6O+nsIwwkjz
	1DIqMZzhP2QuC4cNjAKW+aR+4qqOE3eINE1hSu4XhmbZzr8/tsWayqzwREc0EYlFsbeVJbk3g3bkT
	8dW5oTdeGdqsn3Br9JAth28ayXTMKUcVdf4UqtS1dvSqDtGv+w1FC1C9xcRxf5P0q8BDjYCKtLc5m
	vNKixau8R/3kweget5JccJcm+CMmnAaWYXrDFQ2yv4152anfARVGnzloSVQJy2fB1j557pZw2km1Z
	WrTQbWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUK2B-00000007jr9-2kcM;
	Wed, 25 Jun 2025 06:55:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJxL-00000007ie3-0FBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 06:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834203; x=1782370203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5rzPg0wfSfqPhNBHCdCHLzVY3mQVHFGvqdhIG839og=;
  b=YzcZei3i9bMIA4j6uRogRt7N8Ig/mdF4zEaXqtP9kRGRwI5LiAWNvOuH
   7pVVQsJEXtWy3c/XCn1HvGaBu4QF7JDyyGIp4ZMYGXG0tfhKFMNkj9yb/
   q0Bx2dMqJeiWuUcPfH++J/9gLntERRA/XTDM9t3xrt1XsKf3TmsvuxD5+
   4X5mPEqbHnlePgIkGBQvj/QIzXVGL6Satj3n7PNkcCs1+xW7Y+63SHMIA
   MnNT4n50SvuQMMsUhi0pCtuwZ70pb34PqRbKq4MCZxXDWlTnoSnRzQkUx
   /ZGzz0DJuV6Escq0xh+aHQ2+waUSbeQY7/2koe9o0zlx9+7xqzKcGCA1V
   w==;
X-CSE-ConnectionGUID: 4z1r6s7rR4GWDP9QOY3lYA==
X-CSE-MsgGUID: 93f+6zGoRKaRypgVE7vjKg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="48271088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:50 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:48 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/3] ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:32 +0300
Message-ID: <20250625064934.4828-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625064934.4828-1-mihai.sain@microchip.com>
References: <20250625064934.4828-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_235003_187710_3BBE4805 
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

Add the memory size properties for L1 and L2 according with block
diagram from datasheet:

- L1 cache configuration with 32 KB for both data and instruction cache.
- L2 cache configuration with 128 KB unified cache.

[root@sama5d2 ~]$ lscpu
Architecture:             armv7l
  Byte Order:             Little Endian
CPU(s):                   1
  On-line CPU(s) list:    0
Vendor ID:                ARM
  Model name:             Cortex-A5
Caches (sum of all):
  L1d:                    32 KiB (1 instance)
  L1i:                    32 KiB (1 instance)
  L2:                     128 KiB (1 instance)

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama5d2.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d2.dtsi b/arch/arm/boot/dts/microchip/sama5d2.dtsi
index dc22fb679333..17430d7f2055 100644
--- a/arch/arm/boot/dts/microchip/sama5d2.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d2.dtsi
@@ -32,6 +32,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 			next-level-cache = <&L2>;
 		};
 	};
@@ -160,6 +162,7 @@ L2: cache-controller@a00000 {
 			interrupts = <63 IRQ_TYPE_LEVEL_HIGH 4>;
 			cache-unified;
 			cache-level = <2>;
+			cache-size = <0x20000>;		// L2, 128 KB
 		};
 
 		ebi: ebi@10000000 {
-- 
2.50.0



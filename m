Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F17C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHsA90nXYmp5aDowcAxlx7LWCFWE5clS1LZ3IG2K7ZQ=; b=Abl6DLXe2DBa5mkLctLrr7ilsE
	4hEyB7IJYaoTMQfX5w1HaP9mgdR5QeLILu964NoPqwKgQ6F8ZlhuS+6ZvyEzTjZZHgRWXY6x+wYNA
	nzNzq4iD2xE5tC2RHIOXApphC8mpLZTZy0IT32GeHj80sBwBM3rpAqNcxdk+9WwX7Yn6a8MeP5RN2
	md2wfwWU6aeatr0h7+ICTT7i2qpu7Y9kwb1OzvOcXCk3QmSmunk+fddH8o3YaD2k6bRKJ7lkgQGkt
	CA9+thGK++Tk8l/0oUzE5YoossfZHh8r8bZa04jn748UkXjNBquye2thFiZSe72JXsDWCmll+imAW
	YePP0abA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsCv-0000000ABWF-45x0;
	Wed, 18 Jun 2025 12:48:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqD4-00000009ogB-1yOo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243202; x=1781779202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=22QQErwPxlBAJ0KnPlU2RXCt44GQ9my/mq7QEIY/+/4=;
  b=x0IQIDF73V90md1fVx55U/XYopnakkTbqUyQAdE0WbD5BvyPNFizguof
   LWpmYAGsXvXG+vrvmyjgQfgqVmdGzqWJ8A+9sEJFMRAeNNcDE7fnWo/Oe
   0dLE+FiQElJitTWpDpvBIjKv+kptSXTMxXEFFhl8bpGw0XwPUEl16he+x
   fS70Scsq7pk8s5afWOCdpzb6y5bbuHTr/6WGCezcNU3pyoiPu1up0fQTY
   ptJwLlP0sHLiakeDeH8ZLX2Fio+nouTc/18ozzuHRrsRG88RwjNE84YCS
   uGvTU5V6u/xEv5c315Njq4SdwuIUuWZTIiXrcjd/HS1CL1rFzovhMvqj3
   A==;
X-CSE-ConnectionGUID: 7wtXBdA6TE+fk4S1pxqqTQ==
X-CSE-MsgGUID: 4zCq3BxjQdmbuXuDHew4Mw==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="42469512"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:40:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:29 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:27 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 2/2] ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
Date: Wed, 18 Jun 2025 13:39:14 +0300
Message-ID: <20250618103914.2712-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618103914.2712-1-mihai.sain@microchip.com>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_034002_573372_06C13E69 
X-CRM114-Status: GOOD (  10.16  )
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

Describe the cache memories according with datasheet chapter 15.2:
- L1 cache configuration with 32KB for both data and instruction cache.
- L2 cache configuration with 256KB unified cache.

Before this patch:
[    0.171425] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-level
-r--r--r-- 1 root root 6 Jun 18 12:39 compatible
-r--r--r-- 1 root root 4 Jun 18 12:39 d-cache-size
-r--r--r-- 1 root root 4 Jun 18 12:39 i-cache-size
-r--r--r-- 1 root root 9 Jun 18 12:39 name
-r--r--r-- 1 root root 4 Jun 18 12:39 next-level-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 phandle

[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-level
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-size
-r--r--r-- 1 root root 0 Jun 18 12:39 cache-unified
-r--r--r-- 1 root root 6 Jun 18 12:39 compatible
-r--r--r-- 1 root root 9 Jun 18 12:39 name
-r--r--r-- 1 root root 4 Jun 18 12:39 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..a3c8bbf5d1d8 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -38,6 +38,22 @@ cpu0: cpu@0 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			next-level-cache = <&L1>;
+
+			L1: l1-cache {
+				compatible = "cache";
+				cache-level = <1>;
+				d-cache-size = <32768>;
+				i-cache-size = <32768>;
+				next-level-cache = <&L2>;
+			};
+
+			L2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <262144>;
+				cache-unified;
+			};
 		};
 	};
 
-- 
2.50.0



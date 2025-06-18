Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A53C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jX4wy9YMY9/h1VnRr3LPf54bmdN3QdI5X0ZIqnYBRvI=; b=jkqKbb4SyUFsHcW7Uh5N6UeIue
	exRa2jEfI3mQkPf9ENwW9N2UmJz+4B2W7cn/JgtvixqArox7srhVsIDzCGxAl4sSD84cN461ffxhk
	tvNtFqzzSn36m7SntvD8e7aDg6fyVVGvXxTZRf9GE+6Ic0+P6gPIfWSBse+Kgpmxc0LyEYwkedP6W
	f39Cat3gHWTdBlPGyoojCnNQdHI6WjXJmRYsSdTQNlTKbaALr2HF++Ee/HuoODyze8+Eamd/sz1p7
	L3svpRwqKf2VbdLuHxbTY18ko0VeCwVHsscIt48+p/nJrdsBhphK/mIAVTO1Vy3UgwwZb5Cg8JIoE
	MIQdXooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsAk-0000000ABFC-0j1i;
	Wed, 18 Jun 2025 12:45:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqD1-00000009ofF-2sE8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243200; x=1781779200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t51JzSN9nadmrvg70cFMDoZAbxQwS0CqONWeM5DnWpo=;
  b=aogucKYqeXccbvFyA8WXJpJKPCQILFJzqSsuuA2ET3LjtWZWGB9DFdAb
   Xbq2SFxgf8n8YAMDjjTRlkmgY41fMQ5hCoz5EBFMbJLVy+aLJvWfKZxTC
   DwnLaFfbYVOTuErAli0CNZcjI0hkbWZjA0BbupsoqOUfecUzGgerV1DxB
   rl2Zekbj9ZKsCtmIgy6SwIbG7wcfKJCC9fl/0AD6PWjV2bnjnGHW0NQSj
   KXHts4hD99SUh8WuhMEGlIPSnDyVvqI47GZ9brzNeEXFgyG03hRGQtWCs
   Sa+l/xa+ud3rIT9EkWxMQTRJbjH4PqoaHgOuaRN4YwEzqWKW95t/yPW4/
   w==;
X-CSE-ConnectionGUID: 4uH6+ir5SsWi7jPBO6gg/A==
X-CSE-MsgGUID: KZF84mskQl2lpJhI0kjZ9Q==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="274330071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:39:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:27 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:25 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/2] ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
Date: Wed, 18 Jun 2025 13:39:13 +0300
Message-ID: <20250618103914.2712-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618103914.2712-1-mihai.sain@microchip.com>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033959_732663_CE313C48 
X-CRM114-Status: GOOD (  10.03  )
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
[    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 18 12:16 cache-level
-r--r--r-- 1 root root 6 Jun 18 12:16 compatible
-r--r--r-- 1 root root 4 Jun 18 12:16 d-cache-size
-r--r--r-- 1 root root 4 Jun 18 12:16 i-cache-size
-r--r--r-- 1 root root 9 Jun 18 12:16 name
-r--r--r-- 1 root root 4 Jun 18 12:16 next-level-cache
-r--r--r-- 1 root root 4 Jun 18 12:16 phandle

[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 18 12:27 cache-level
-r--r--r-- 1 root root 4 Jun 18 12:27 cache-size
-r--r--r-- 1 root root 0 Jun 18 12:27 cache-unified
-r--r--r-- 1 root root 6 Jun 18 12:27 compatible
-r--r--r-- 1 root root 9 Jun 18 12:27 name
-r--r--r-- 1 root root 4 Jun 18 12:27 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..06a5aae93101 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -32,6 +32,22 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
 			clock-names = "cpu";
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



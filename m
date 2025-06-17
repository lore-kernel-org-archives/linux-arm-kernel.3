Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDFCC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQDaR9rQ8x/nIQ2KpUu/l8FcOMdxSD15RRP4IMwwito=; b=H5Ds6DoEbx+VZXIQ4nCnHepZf9
	aR6fn0o8lZjaz2ZozGpnxMPf86d/0p4dvna7AXucrCtSY1n9VOFE25mUCcdRcMJbNU320lESrAnxF
	VWFs84ovppcMb+8SJMnOBxcW427OWvuniL6ZJYRYxaJPpHv+SX5XTPxQ9RCNXABZsh72Z1xnTl1uf
	C8EbBSZ3t5aBKdwA6ujVwntLHFIY24fDRzXSf0UPyVvHot1IEDVtsaaWxpxsUalpW8CUTFDdZPzr4
	lk8jEu68+gnxEW213sPA305r6TnZ6gLRBQ28wfGG/V32jmT9Ya924XbKuz5rhRQncoLDfvZpOUNK0
	mkogN0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRU36-00000006zqK-1Fqb;
	Tue, 17 Jun 2025 11:00:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTqn-00000006xdP-2ALn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 10:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750157254; x=1781693254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yufdxM6CMyGLalI/7A+e1Bisy8ha1AoJNLv1GLw18bA=;
  b=nRWvwJ1ZAZAsNKo4MnAbqruFSzw30EiH/XDuDHAaihs9qcWDoLjU1Q14
   6E/5HW5rKfLUzD70U29PAeBdwh61YRGGqiQ61AajYjzH72F5sK0j0KlJ0
   eFc0fq6Z8TJDvB/nDcTqwscLaCgyN1qYNM2AQn+0rOsP6wDJvXZEu/95V
   rU63NL5p7BF1HURVXLZC5rtzzP33p7OFgclqdanqjKHsQm/fxksOfyp/5
   W0W9D1kzSefBK49Vka4cg4d8GwTf3WwUCF89nc55EUWAM3xAnthVrd4rb
   ZinAxE1fJPLrBSGsShTYyUP/e8KuW3ZTGRmBW8XrGHEg45Y0nHcTvqYr9
   g==;
X-CSE-ConnectionGUID: NlLJIgKaS1e8ItqRhu+KEg==
X-CSE-MsgGUID: aVM7kM2YQR2ta15yj2ds5Q==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="274279563"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 03:47:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 03:47:14 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 03:47:12 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
Date: Tue, 17 Jun 2025 13:47:03 +0300
Message-ID: <20250617104703.45395-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617104703.45395-1-mihai.sain@microchip.com>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_034733_562763_A53735D7 
X-CRM114-Status: UNSURE (   9.28  )
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

Describe the cache memories according with datasheet chapter 15.2:
- L1 cache configuration with 32KB for both data and instruction cache.
- L2 cache configuration with 256KB unified cache.

Before this patch:
[    0.171425] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 4 Jun 17 11:39 d-cache-size
-r--r--r-- 1 root root 4 Jun 17 11:39 i-cache-size
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 next-level-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-size
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..70175a35dc3e 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -38,6 +38,23 @@ cpu0: cpu@0 {
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
+				cache-unified;
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
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqK9sYjuO7DYCo0ffwC6/cbJHgQOhwGD3w4CdRaE3vs=; b=lT95B0FiD5S/y61AcITNNmwQ6c
	ZWVcK0gi3+nuvYDOA6m/2K1NGmQqs1sGhg54YxEd7YFo15XUL6m2zcoJG7gbusptjr2WvKvVck1Eh
	zzOctgSJPP2FM/LJv46uqJ+pF2mOL2SG5vtUZnIoMW97nEuT50wA/EPmd/5iHRFvyu8oiQdxjRlCs
	m/FYnaSq0KmZ3MpcrBrT3t4uXV2oC8RPO93qMxUROQ5Wju83lORh2o7IZIvbd6hTpl9B3t864snY2
	0pdIDgCCGIUeB/AJh/3Iprd7TNLeIusJFjN/SD4bQWYpok+2p3lVFeS6Fzpzxl1uA8Qsj2j/3+UnH
	7+/k0Kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9erH-00000008e1B-0UPI;
	Tue, 29 Apr 2025 06:54:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ejx-00000008cki-43wm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1745909210; x=1777445210;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ieiXV0ThKdfuBnVXzi3wa16gcjZ8T7wrdtl4EAofTag=;
  b=mzzI826vA8KG2pq9YRRJg573XX41Cri7daJT9Q3xsG/45nciY093Jfpu
   Dc7snA5Pm/Fm/lwp1QSN9EC42zK5KsNUfFV4jt1skmxAxcvVOM1zEyISX
   +WsID1yGx4vWE/3Y6RgrdCYw6TPvY8Dh69vyq06KLBr7HfOY9hGvMHfwK
   AL2DbVxx2B7k0UbzpRDRuEzKlRAjlqNKtJ992Jk+BQbP/UwO8S2eXDDUV
   eIAx0HO+TtSh5FuKBPcvqemVsESCOJ0VyJNpI6YUrqgoYUYi0y5cWvCNa
   sr0WYXS6cM0LBDQSPASyfqK4UUinbCXjyQtd1WVxny9QkiBM+DErfSiRf
   g==;
X-CSE-ConnectionGUID: webqCOvUQk+OxUCosxyWJQ==
X-CSE-MsgGUID: kiPcj2hiQICAXrUgF+n1kw==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; 
   d="scan'208";a="272370086"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Apr 2025 23:46:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:46:07 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 28 Apr 2025 23:46:05 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash
Date: Tue, 29 Apr 2025 09:45:47 +0300
Message-ID: <20250429064547.5807-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234650_128699_1B36762D 
X-CRM114-Status: UNSURE (   8.68  )
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

Add fixed-partitions for spi-nor flash to match the at91 boot flow
and layout of the nand flash.
Partitions can be listed from /proc/mtd:

[root@sama7g54 ~]$ cat /proc/mtd | grep qspi
mtd6: 00040000 00001000 "qspi1: at91bootstrap"
mtd7: 00100000 00001000 "qspi1: u-boot"
mtd8: 00040000 00001000 "qspi1: u-boot env"
mtd9: 00080000 00001000 "qspi1: device tree"
mtd10: 00600000 00001000 "qspi1: kernel"

[root@sama7g54 ~]$ mtdinfo /dev/mtd10
mtd10
Name:                           qspi1: kernel
Type:                           nor
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          1536 (6291456 bytes, 6.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:20
Bad blocks are allowed:         false
Device is writable:             true

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sama7g54_curiosity.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
index 2dec2218f32c..eb5f27ce1942 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
@@ -369,6 +369,38 @@ flash@0 {
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
+		label = "at91-qspi";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			at91bootstrap@0 {
+				label = "qspi1: at91bootstrap";
+				reg = <0x0 0x40000>;
+			};
+
+			bootloader@40000 {
+				label = "qspi1: u-boot";
+				reg = <0x40000 0x100000>;
+			};
+
+			bootloaderenv@140000 {
+				label = "qspi1: u-boot env";
+				reg = <0x140000 0x40000>;
+			};
+
+			dtb@180000 {
+				label = "qspi1: device tree";
+				reg = <0x180000 0x80000>;
+			};
+
+			kernel@200000 {
+				label = "qspi1: kernel";
+				reg = <0x200000 0x600000>;
+			};
+		};
 	};
 };
 

base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2057E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kABrYCRuxfjnmNnzzhb9u7inWlE7qpx9z7CqlAxlLjA=; b=Xz5q8hrnvZm6bhMwjbqugFGt/x
	770aopIjLKyEOZe/4bF5E2aEE1tcro1VIsd4Sbfihdz1fZVN3irJvs5hHQemxglazHcXy20M7SB8w
	rushZJPZTMFQ9TmuXgtTWxwCQen3IbpzsRf3lzH3lKSD0NvUAgg+jwqyxces7Wa3pJ4jVEqAzdN//
	5WTO8dX0D1ywqY6iZTrJcZfLbQ0M7okhtSYT55WnASDDmV1/YhrO3kzscn1O8lR0ecr+mEQ70ne9i
	fJ4VaF+vI8SUrUa9Fi8aDRDJtPpj49OXRaaA4vXyMftDeE6/Smx4GA8reXNGB+paLKxveqsKlwc1m
	TfNLLC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb7v-0000000DOOn-104q;
	Mon, 22 Dec 2025 08:18:47 +0000
Received: from mx-relay37-hz1.antispameurope.com ([94.100.133.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb7q-0000000DOOA-2cBH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:18:45 +0000
ARC-Authentication-Results: i=1; mx-gate37-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kABrYCRuxfjnmNnzzhb9u7inWlE7qpx9z7CqlAxlLjA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766391510;
 b=mmCEmkdBnNYFFt+2dui+HQ1tdGCrDseLONz6yN6pMnAaYgyy8D5IFRKYW/QgXW3nopJpBBqu
 aeF14I8bSE3yaCx2oJll1+tIZj3Ah4PPDfknhP+VTYnZS4CVoNS32rk4GImMX8SO7UyOCzOL/+G
 hvkh4VQ8D8Mc2vfqCSREsMxSJF5Rb8MnMMgA5rwim13/BxG+5XLdOWxe7qZqUo35fpI76vg9CXJ
 aVo75iFRRF8e7neAWasixiozkfqogwB5PM6lsHyPVWJEvcdp35EN+nLaLEXeXfMAIFXswkCQlKW
 bWy7/8B7r98k2QF8IE6/JCBgkhVzqzaHX/Wgi6Q14nLbw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766391510;
 b=qJDr9S2PDQ2cdPyZZXIU1qq+Oc9A7nFeYeYxf7G9Zlf9YN6k3y8XPA8gBqQyitQV0oWrUB9f
 S/s7UwObioSxZuGCTXjebEQrAjXfH/KoCcUsnAh2kFjkQzxs1owH14bLyHd8kFbQw7Kd7mLB8Y7
 GMpr/R1hlwxJBOaaToj1rrm0/YhbLhdSbuEHJv+F9B/ghG3+g3AFDV2lWz4zkJT/CzQF6mv7QUh
 ykS9OQV/fJYZ4yhWp7SzH5sued3HD8n/atDmaiA/FIGsa+ulbYmJ7fh29M9yOUokCqi5KX/2l/j
 X9htTszGcFzDcXb3DM3FJEwVphu1GzGrZYFYe65uhXEyQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay37-hz1.antispameurope.com;
 Mon, 22 Dec 2025 09:18:30 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C8BC2220C57;
	Mon, 22 Dec 2025 09:18:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Mon, 22 Dec 2025 09:18:08 +0100
Message-ID: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay37-hz1.antispameurope.com with 4dZWHF30qtz2YfPq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3b6200eff25a10e53cebf53f6f11a937
X-cloud-security: scantime:1.715
DKIM-Signature: a=rsa-sha256;
 bh=kABrYCRuxfjnmNnzzhb9u7inWlE7qpx9z7CqlAxlLjA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766391509; v=1;
 b=laQjBUY0+50eXpEhfuIRxrSMTEW1Ow5O6AI0Fg9x56TEEhFxIb/TGXzaBuIgqh7ZkbASb/1X
 0BaDli5zl0CgzAbkPMqT64qSptXI7ucMQc8gIgDlANl4KDlllG2SI1PRofs5f23YCnRYbX5/Hey
 yPBAfrcFFGJpneuTFzooI3LuRR5pSHJ1o9uTyxtY7mUrDuNFUunWax6JanAbQzKVVoU0M7UTx7T
 v1PjJ9Rsy+BfsbdnHmDs8X0ljPVGhi3D0dwEn/RS/phGsLGHHxYJUmBqFOymE+EIZzv/cPbJ9J7
 dsijqkb9I4AXGxNpIFdaivWfZtCw++fVJjmGW+z1B933w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_001843_133144_157F6872 
X-CRM114-Status: GOOD (  11.01  )
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

The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 68cecb0987b6b..eb25828f3b26d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -360,6 +360,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -404,6 +407,70 @@ led@2 {
 			};
 		};
 	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
 };
 
 &fec {
-- 
2.43.0



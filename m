Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CFFCE068
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+0rShqS9k9rFyhHYa5/c8HF+LK7zM3g98pXYzCnqk8=; b=IkrzK0ANah/1g1nkdBpSY9yFnL
	vKNrZZZOEVEHc9F0RRMbo/vLNATnSGIOagxOzyArxs2As4RWKmUU4TFxGYS6rcePx8UuijaJINi1B
	qOdq8fxwI5/FsopbbAMtqo6TbMcDl3+vCCwTlHBaZJsJTV6MFz7wV2OeDipAE7cVJel8QCUj6QcK0
	mgVp/EtqH9pGn/QFaG5YtAkZWOjVo9Fr0CU5sWfP9+ROZszvyfKfJ+yqBk8W5TABkEq061MoDPX4k
	9BWx75K69N1wDLoEN0uoYMBgFrSOdAjkSwWGkyIi6QAHalFhP2ElohGSVg+bIzcI84n09SplD6L8l
	SkLouFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb11-00000006A0w-1DNe;
	Thu, 26 Feb 2026 13:02:51 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb0x-00000006A09-3981
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:02:50 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3+0rShqS9k9rFyhHYa5/c8HF+LK7zM3g98pXYzCnqk8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772110957;
 b=U62q8ansHkPuEI8A4uTe91XpTXpEZuFV9/sg0b0JWDdFEJL909wGs98JdfPIISL6Zigq9HGD
 gpdqZQbZAbleQifJodrB28Ruwq+zMcET6i6aKB1LOjj40PtBd4PG1gjL//fN2nn/h5F0eONr2uR
 W+mnkjqeRocEM2L8RcrcCHvNOgLRxBN6ES6wlVtMc7BfhpnxlW6PYITmtV3OfZCrEZA0le7zLnQ
 ieTlmitQHBW2+pltGjmfbY3MZNK2H1r6ml2mB9IkYFkHNB1PKh/gBiW58htSCJui/dzvKvDU/D9
 POv1z6PYTBcSCHejpV+l0sScr+RFuum54EXXmeRin54eQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772110957;
 b=ldOH8C8HVSt/ZGLFaSc28pbEuAtR8WsKxCoIabMf48CEglTqqst7F9olZF+gVSOZLo8ALYun
 JlWnVkODTt2JLzcmUB97clpN2yZlsItri4FeCS5ETa4Y34wx/LDWPPN2Vv0v96pzIUqDy+LUwF9
 RgD30jzxdbEP8zeuREFwHrI5vEC1El/D2J0BUBkhcorDtpFaZZJDNw41/JxJlLOo5DeplQI9ORe
 9qpXizp/GsYn5GCi4dNvdXsVaL2OzRx+OgCPYeXrOFnNl8jH5N0PhnvGQLcbllA8WJlr4qyqapx
 eU/h0fWO/nBWFWATA4W3bqNAMWdKDoT243LsEUsAgSf5g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 14:02:37 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A4A97A4079E;
	Thu, 26 Feb 2026 14:02:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Thu, 26 Feb 2026 14:02:20 +0100
Message-ID: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMBSd33hjz3yb2J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fbd8ca17c9567a87f8e16a470c36f457
X-cloud-security: scantime:1.606
DKIM-Signature: a=rsa-sha256;
 bh=3+0rShqS9k9rFyhHYa5/c8HF+LK7zM3g98pXYzCnqk8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772110956; v=1;
 b=VGghkyXVWXEGCQzf20G4FSV0W8Jjetb9SEsC2EsnHb1iBj+KjcjfrMVir8v0AWTI4K61clmI
 UUJXUTkcGok0tAUDaQkX77v83/lK3QhQ/us3tnbipF66iojCm6viruUeAKJRiyzpsziXjQthWmP
 4z242jbaJajqvw8lwZnlfI8U9bx1KZsrB6ig2nm9BM9FjIftVKPVeCtB6ZOCC+oJrepkpQ0bsvC
 dPUACTxK0Fm3n8LpBv82p6bLeM0Xb+GkqAlUaETo0bOus1AqMu6DPrmtrc9wVvl6whvk44rPhHA
 EZ1fwWgwqOu9jNmMPGqVVA5dtEwVoaQKCG+v3mmLTF3OQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_050248_049510_5E122B31 
X-CRM114-Status: GOOD (  10.95  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
* Add empty line between paraphs
* Collect Frank's R-b

 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ad49bf85a04d3..890d1e525a489 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -336,6 +336,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -359,6 +362,70 @@ ethphy3: ethernet-phy@3 {
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
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



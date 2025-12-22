Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EA4E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80hdS/w+v0x8DWisrHsGxaZlP+KSYRcYUlXhBDOL7cg=; b=1COFKCOwfsSxsbUJqlN/4pwvRC
	rc92IFe4EJcCV8juyqQ1pkTgD9Gas5t/VsMKXXa2G8rcmj9sC3AfY1p/GtlDPySDSbzDN0OwBiZEF
	+jANlvGH6793zxvstgQpfUXCATVoEH7QUaZogXrtcLpdRTEpdBFN4I70YlwbEBnHR54h2IkCqLRD/
	wDmmdASmj6HIW3pvHjXit4JEkgQ6BNLrXW/1lxISHu3QR7XfFmO5IIJCuuct69UXCHR5ulygwN/vy
	zKa4/ICB3emtUbKr5vtHPRG4laqYpeZqkkk4WiMqPrElEBrJQ5R/O/4F1s+Ki2t27up3td31bmOGa
	MFPqFb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb82-0000000DOQh-2wM4;
	Mon, 22 Dec 2025 08:18:54 +0000
Received: from mx-relay36-hz2.antispameurope.com ([94.100.136.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb7z-0000000DOPI-1xDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:18:52 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=80hdS/w+v0x8DWisrHsGxaZlP+KSYRcYUlXhBDOL7cg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766391517;
 b=IO6xoyMqeZFvH5TKu520EpnBkwCDbbjJzEmLsA7ilk5f4oE+kUWLgZ+aLQyZTLLwSabpMj8m
 A1fmo6WDnY1OXH14pND+OT2/NhydZ/dPdL2l9+nTaY0CuMSWmdN1LjFcTFCE/OIfHnsOqubw6dY
 QohxhVnNBQt8ZxEEXSbxzjlPbTqd3Z7XiljvPlfPOb7KMAMSp2a68xfY6g5Xu4WQhKNwVFVGVfY
 9kPTS3RMPU2MBsQjRc0hlBr0zNnGG96smAGXTkdAzSOn+6gDbqBnvtG6jSVh1keMLG+lzEBuf71
 D5a6d3/2I9edpfMGhmHe7pnc/IXPgwLJV9Pe/J3nVfHFg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766391517;
 b=ecTupXhkolYKj0AKQwqyV3ZNwGYOlk65xTl8iqzXuiMc8O80yj+Ghm/f4CPLVduRz6dxoWIM
 WdgP9dL57O1A9xx0FBteq3nqgnUrVBDDsYxONCAs9qOTCCQIWyQKRcMVWcceY8gYCr1+iW7HFza
 3zcO9oIwsParuQRKCxmO4SIadEAUrdDUdIN+GCYmb3TGt8hS279qvmshoom9EUNMAXhUYixzH2P
 yOH0UmSG2bxYqXNi6CFJ0N7ui01k4EOmUd7zJ8hxRYtpMSGP68VJz0rLAzwa2SRVOFxaoWrYpVD
 a+fhwYcPPZByvmHt+pbn2N5i5FOczkxN166nr6TlGnskw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Mon, 22 Dec 2025 09:18:37 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A8402220D99;
	Mon, 22 Dec 2025 09:18:18 +0100 (CET)
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
Subject: [PATCH 2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
Date: Mon, 22 Dec 2025 09:18:09 +0100
Message-ID: <20251222081812.1120998-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
References: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4dZWHK4xCLz1S5Vj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 99bff2056c426201606ecfd6bb8a64f5
X-cloud-security: scantime:2.201
DKIM-Signature: a=rsa-sha256;
 bh=80hdS/w+v0x8DWisrHsGxaZlP+KSYRcYUlXhBDOL7cg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766391516; v=1;
 b=ofm0wXrcemlaP3PuTPoQkkVcV/6RXZZaOt5RbBkqo6J/Npt+FncDehgy0u1EnT9VDg7+W1uf
 iwgCvVpYalW5PMBAtGadCilmqEtPJGPTTPsHtjBEbXcRJFseF9nAFETkjQr3VbvD00Xwerhp3iw
 JY0mwOvA+JbT2B1bF959CSA91H6zaf4XGD3E82f1qgnAXNR9yG4dbcMaLB/N/WGs2BTEBImm3JT
 eq9WNsSskeO9z034KV+Rxk04sYdwnuRTKZ7ue67cOFquZfiS5tqiJvESVoHWZmMaKyzuy6JXWOg
 7QOjMcjt4a9urpr8WbqoIKt6qQNtMUaKdaG85HI/m9gNw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_001851_660650_F9CDF709 
X-CRM114-Status: GOOD (  11.57  )
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

The MBa8MP-RAS314 mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 204bbf0719890..b0d058833fbbb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -184,6 +184,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -209,6 +212,70 @@ ethphy3: ethernet-phy@3 {
 			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
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



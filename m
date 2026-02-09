Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA4E81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bW8kBX1s+EXbf2lLP1wP7V5qCWYSVmt/hNU3H0N9lZA=; b=LDu06kaIzWQCVsvUfosSonL26l
	/wZZnMsSaSe5DdH5hFBPl8fog+0/6fc7Wm7EIKSrY9+h9Rbn/S0/7RTE0HcbjzLbcL/P3+fdE4V+n
	hV9pHShzFAhjlTioiP1bon6nzu9Yuzy6E7wTUxWJzJV9OFD/+2DZjLgG3DVpxMsbOuoN+9JEb/QFs
	RYbjcUnsfGXKWHKKSKUZCbA767ChTyQQ03ByZRbqgzG4whsZ+VfqVEBj1Dn8k9hULJ6OVIKwmGzEr
	r9SmftyndSzMEiOuwlW6oB9bka+jmv4imxjwTlYRupAhMWuyRtOX0zRxp5CDfbRfcLABkLE5lWSZt
	1cgDTCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSNW-0000000FWEN-3tda;
	Mon, 09 Feb 2026 14:36:42 +0000
Received: from mx-relay186-hz1.antispameurope.com ([94.100.133.75])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSNR-0000000FWBt-0d4C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:36:41 +0000
ARC-Authentication-Results: i=1; mx-gate186-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bW8kBX1s+EXbf2lLP1wP7V5qCWYSVmt/hNU3H0N9lZA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770647783;
 b=V32S14GisTxq4J/5vcStYT857z5HyWtfp+KsMrEDfC3xAlRuLfZNyPgMsJKsmtm5H3yUbXW6
 MnV6zdYxfc/4KCOlvDSwsGjsnHT5gvqhItZfOpmXQHyYHV+7sQVcdWWetICchAaF6R7yXqj/M3I
 vXd8ywkuaUMMtLhdwZrKPzajwjLolNyGh3hRUVH6ugtIoHiSTpROsOpzmtp6ZPwS6vW2L+8jS2m
 r6Y9ZmkV2eiw4I+CCZXlBhb7XT8t/Ob00Vyu843sn3eiboyMqVHSkNOGtfKraqfx8I/HzkVfNVV
 umpXG67bME1JJhg3LG8IdiVHl/KXs3Cj3e24RNaQ3qA6A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770647783;
 b=HlacGBRfNVkhT5BOAAV6U1+WPAhnPs4tvOsHyHHfYQFO8PQw0V7a5sno4vND8sQCDZzFZg4k
 uzDeFBsWm/OJCLxqrBht5BGFu8IGWmEh9f6cmCRwXItL3bFjrB28JfPx8b5L9WD+YiA9lZ9Qnuj
 1bE2m7Hg3vzAuhfLmwy0mhtE/iomPPdLngeqzoiCKgBkK046P+AGzlttFrhrYe4sI4RZIWp9pfI
 mP9b8euRKIqcaVHwwW2fW0Yx7jCQHa+J9/3kjEc6BkFSJ44CBsQy80zc8QTc79ll9GEF1zoh1PV
 TvZKXxpXPbw7mV0fEVhL6Qnfxu64YQ6npy0kTovHjndCQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay186-hz1.antispameurope.com;
 Mon, 09 Feb 2026 15:36:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 18416220D21;
	Mon,  9 Feb 2026 15:36:05 +0100 (CET)
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
Subject: [PATCH v2 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Mon,  9 Feb 2026 15:35:52 +0100
Message-ID: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay186-hz1.antispameurope.com with 4f8nLY5s0Hz3xgwN
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 405bf8049cad9f07363be847723c878f
X-cloud-security: scantime:1.927
DKIM-Signature: a=rsa-sha256;
 bh=bW8kBX1s+EXbf2lLP1wP7V5qCWYSVmt/hNU3H0N9lZA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770647782; v=1;
 b=CwPBuyCIIdxh40j5D/Qzz74C95+/rjyGTc8lbjzPr6nvXIIVIyVYndaEKUpZliPxITIBLc7a
 L70xXb3Z7fL+mbLAkgQbg6uOSvlj0RVeLLk6QVrmvHThaARUVoVwKyrjSTkUpfIix1BU9oztBQa
 hJuJVq7kSrqqs7GLGPnHhyV8sS8VGlG478FY7mcrLV4Fsoheiwv4mN26H/LUuquT6rjyZLqH7g8
 vSwLCId+bKYfQvcXguNDosBrCwbQs1KdvSaxwybna0jALWvCx345T7Hfl0FBcsKYUzNUAtMB4BC
 iqybxMeNPX6/hwhi8HIKIdHJO15AYtilIfC7RSbI8mYzQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_063637_495076_114AAD3D 
X-CRM114-Status: GOOD (  11.16  )
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
Changes in v2:
* Rebased to correct branch

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



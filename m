Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CD6FCE074
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUO1CiLCZdzw6+XANnBhTKj15uDGYHmVnxysnV9OeO4=; b=Suomczvnpa+5pI9Mq1U7vRpiXT
	eZg6APVUYCtK4T6g6xieKOZjhRuEMRLHNT8u4boQwLP2UKs2n03EAse6GmijsmThh1K7CJarIh+Tl
	mChHSqkrjxemI82i47cQeNSeCLX/GbgmrqFCCTFgto2iWnxFaV6NupH8v2BU6heoi8dbofE7vnpLl
	9nPQQgi1jaekh9uL2HhjnHslawQWOA0BElghaSqMn1uLhYCciP6uB8M27t2MHqmON3Cg1lvPrmDZ+
	LYZb2uJ7NfhfUB05nzTUYiB5IGBaeneMbCqcv3z33czhFJ8/50+/J32X6sw5IF5Qf22AonAU6cw0k
	G9b7HdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb11-00000006A0s-02pe;
	Thu, 26 Feb 2026 13:02:51 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb0x-00000006A0B-3hLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:02:50 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=LUO1CiLCZdzw6+XANnBhTKj15uDGYHmVnxysnV9OeO4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772110958;
 b=Lm2ZmBa2m6gDBSmaBsxi5yusivH558ONcg+AjkPRqjSHoH/HC4B/gktKGgk2jFITpgIAAPjR
 2Bw6SMrCAQ19jfNf49WgtzK5W2gsT3/8WQ7jgmvq4n8G4l3GEoHjHLDpPtFLYwTSkqpi+vrbv1r
 tCzvH8N4688il4ccxchCPppTILNZTP0LGhlUp4b9+2gN3LT/BMVbwjudrp4fLy0D2PF71TaDTwQ
 WlZYKCFw+QLuFCED/EPnizTzRkg++Q+X0iZImeffVybaXvjRcpAkCR8WDV5AZDPyEW6hGVuFlA5
 L0Mik2lzKGiwCOvNiQuMs2RhVL3vc3yqV6hA/IT9J6lqQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772110958;
 b=EbO3Il42+DDNqCGLzNXMxuBT5c/AXzC9n+wBthPt9GwAABW+a1bdGKfSS/esDIMoe/W4p4MZ
 8sEQ/RWXcd0BLZXv6NaAi0erWKiSwgPjizgxnmnUpFpvKA8+2YbDtnePXfZYob4OArQi6pXtelE
 Qscvi06cZ+Rnj+SBs6/x3EUxEh8+UW3+s5cmeDuHMjdPrFvts4RnIq/Vzd7VOzars4ZRlKV29mN
 KmVLnvOGGXcLAtVt3nLp018bYxhYjk2urkotx5z1w0jXIu3JcnYF3/nmiaN5cNJiQuj7XyQSY84
 lwiKi9UupDgD302NDVWyAIq1V+CoezLveMGCYxETWtvSQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 14:02:38 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EAAA1A41357;
	Thu, 26 Feb 2026 14:02:25 +0100 (CET)
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
Subject: [PATCH v3 2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
Date: Thu, 26 Feb 2026 14:02:21 +0100
Message-ID: <20260226130223.613325-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
References: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMBSf4s71z2nHTC
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ac72cfc2a7cd79e53cd99911ee7956b3
X-cloud-security: scantime:1.506
DKIM-Signature: a=rsa-sha256;
 bh=LUO1CiLCZdzw6+XANnBhTKj15uDGYHmVnxysnV9OeO4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772110957; v=1;
 b=kKNyr4sqhFlbOC8q6FpVXFXZjQbQI/5EMVNg3XrCUhkJ6NRnXPdNe8jRnsu5e+Jptg9OPsQf
 W1Di/q5QLYWX0ZIgL9eKnWDKKKFzbkj2eGDkdmH8ZUQNqmYbsylD0VmlPsWv1zyfPGTKXmfuc6n
 I9zn8lbCEuXHd5qh/lsiK/1tNP1o703V63kePoNJLymV3GmFbxmtDkENZB9RdiVGb3zCKhCq/jy
 W3zkEu6TuIw7C58ZtzsYe6NjvJaS6NUGCRa8EYzUYtaNbPCJijo3n7xJiOaNima+3VZ2+gDVE94
 U2yQIKVEJmYgk9bDBe1XCommhuT/V9DmjuDfDk5ojTmsw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_050248_063143_8AAE14DD 
X-CRM114-Status: GOOD (  11.42  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
* Add empty line between paraphs
* Collect Frank's R-b

 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index b7f69c92b7748..04f4c2fdf2992 100644
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



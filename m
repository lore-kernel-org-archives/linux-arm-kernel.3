Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90446C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCf/XlZtziyUPtDRK6OGTZ1iwHVlAnqUsHc+bCwUDB8=; b=pvHJ4uCCfQuWS9ikfKiTpfOGCX
	rsT04QL1Ztf+3mEmnNjS0bJXgUcqPD+jCKyPUfArs0fTqCFz5ItulgsbCjED8P99DkQ4uxQ+rvyb/
	6pghBH3K3cJOP3z9OBaVEXGtXHGI8794yUYluVE4lZJr8rNDbrp3gUDs0J8AivFyCciOqT5ro93qB
	l11x0A9UXLtV2wA9rXFOJ0GJR+DkaySVolWjo1ce8WcYE+MBCaaXgPPLtUeilYq/R1xz8Yv02qDnX
	OFWtqqV9A4ubJUHMWC6wXNis0sc9hkN6mz9cx9E99n6SaAcxntE8ghHfMu9BmnDoHHTZ8LuEL3i/s
	OxEfBzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udYCO-0000000FZZ4-3SgS;
	Sun, 20 Jul 2025 17:51:44 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udY9v-0000000FZQz-3R0t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 17:49:13 +0000
Received: (wp-smtpd smtp.wp.pl 40373 invoked from network); 20 Jul 2025 19:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1753033748; bh=vCf/XlZtziyUPtDRK6OGTZ1iwHVlAnqUsHc+bCwUDB8=;
          h=From:To:Cc:Subject;
          b=CLKD3ZEQUKBP9sB1gdDbntbxETGrqnGz+Gt717JcKDruaQezXHFAuvaJh7LDowXTQ
           DZYtxA2HfZ3GQ6LSwBnGu+v7CvTTCD++XCrxAPjdGSwIdK+naatvYcIiHy4wPDCp7P
           azxQOaa+xA7hOfSz4S+VnEkXmYvEBVeJKpcrcBzZ2bcx8hsCInMnJLPxocdFYTB7/q
           jyaG8PmX9lWxgSqC/N1bOQAEX+L0M5iGKsj7faCBjnOKAWHAQPS7zJGU52g9oBrWRt
           Ie4eS/S8FYLChPubT9hGdElflJnCQJKgB2Nb2tjw5izSLvPf/kdLS0bRX8+IdO3SSc
           kBpdPxzpHrkzg==
Received: from 83.24.129.157.ipv4.supernova.orange.pl (HELO localhost.localdomain) (olek2@wp.pl@[83.24.129.157])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 20 Jul 2025 19:49:07 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: add crypto offload support on MT7981
Date: Sun, 20 Jul 2025 19:49:03 +0200
Message-Id: <20250720174903.1321533-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250720174903.1321533-1-olek2@wp.pl>
References: <20250720174903.1321533-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 2451c495f819e4f25474ddb960c350f4
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [IRpE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_104912_344278_42DC4BC0 
X-CRM114-Status: UNSURE (   8.07  )
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

The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
This commit adds the missing entry in the dts.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 5cbea9cd411f..ebab8dde1e70 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,20 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		crypto@10320000 {
+			compatible = "inside-secure,safexcel-eip97";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&topckgen CLK_TOP_EIP97B>;
+			clock-names = "core";
+			assigned-clocks = <&topckgen CLK_TOP_EIP97B_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_CB_NET1_D5>;
+		};
+
 		serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
-- 
2.39.5



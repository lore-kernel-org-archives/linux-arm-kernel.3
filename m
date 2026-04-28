Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726B6FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xswwtzad7rvDteRWu0qhZE+fNx0Z3gHT3572TPLV83U=; b=4Bp5YEjXc3QXHh4RFmSDsrBpfd
	lbqAEnF8lLTQDVtuJyDeiabxqXAuA2ex2NhI62W363pzTuz/JyHvLSf7rzmmJ5IXWrGnyebI40Qny
	CoWySKCUvn/gOVmRhoh35dweKsyz4DMR7OrYdH+tf1HOjNeQ5H2uAg3/OdZR9HuIUvRi7s64/ElN1
	LfhJGa60miR3u+QY/UebpKp+g7fnZy49jpsghIzJg0/H5yNqo3kQibU29iTtlBed45j7hvpXZK6O3
	oyMU9ImqETp/rOB44xoPp1RDDOdsrrw9lvJLZZFBxN+oK2VG7p7cv8Tt8mocuWneqtBER6V7qNmI9
	dhJxGUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHrDt-00000002aFX-3HLv;
	Tue, 28 Apr 2026 22:48:09 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHrDq-00000002aE8-0CnB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:48:08 +0000
Received: (wp-smtpd smtp.wp.pl 48429 invoked from network); 29 Apr 2026 00:47:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1777416479; bh=Xswwtzad7rvDteRWu0qhZE+fNx0Z3gHT3572TPLV83U=;
          h=From:To:Cc:Subject;
          b=OdOuHSl88j6WGUcECjLjwCpXzlhDihv2yzS4gkGZm7bg9CkgHPjpmcqHV+DuXktSY
           GUq73+1pNp8Iyvh7mCPqUS8u03QD1fMVjcgd18pxke3aT8IRo2BW67LRB0sMZZhy0C
           wOFA9zHQgjEAqhqcucjif04KFeV9mpZ1hjAraGL6vQ9HyT2PR4ylUPLiuC0Lzrajt+
           MrMCMXT8ZFWWFWvKjOJcgWQ16KObem4jTrwIymirCcTIvaDmJkhr8JltZhK43A42LN
           CAKN/4jlxGQvKw/d++X5LwY4MMvxNbKiH0qTUo39mCeMtivq+yoS+osWLk0gNOxwYP
           ArGJhwFUaFv5g==
Received: from 83.24.138.167.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.138.167])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 29 Apr 2026 00:47:59 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3] arm64: dts: mediatek: add crypto offload support on MT7981
Date: Wed, 29 Apr 2026 00:47:43 +0200
Message-ID: <20260428224755.336843-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: c4c1a66eb78616786b6a9a28261e39cd
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [IeuH]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_154806_572354_CFF49208 
X-CRM114-Status: UNSURE (   7.89  )
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

The MT7981 as well as the MT7986 have a built-in EIP-97 rev 2.3p0 crypto
accelerator. This commit adds the missing entry in the dts.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1bbe219380f9..e63ba3ae395e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -150,6 +150,21 @@ sgmiisys1: syscon@10070000 {
 			#clock-cells = <1>;
 		};
 
+		crypto@10320000 {
+			compatible = "mediatek,mt7981-crypto",
+				"inside-secure,safexcel-eip97ies";
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
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
-- 
2.53.0



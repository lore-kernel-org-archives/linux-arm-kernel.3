Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72985C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ND5I1wqWQVSRJHCCfO9DhtqF0hOCpub/kFuUDNFnLtY=; b=0WuODcLzoLF+gX3TNIh5CZaj7C
	GN3oEwW/QF0W/1WXRVOUExJfJhfXeFjMDpkUdHPdJ1xkwNZPuLwFiZNs7neAh02joEQafnzeHLcSL
	+a9Xo6Lzc39qH55tTqsrlRgNp5JJeLQg7BzQ/vIiReDBZSy+yw+M8eKz6MrRUTKUz1rPp6In3io3v
	B0EshK+KJIVJSmPKYay7Q9lOemGPKK4zYmNbw2iNC7DIZVFEinMHwH/wsFzGa3XviDBB61zMgK0nK
	2ur9GVpdthyTwU3bPwTsDHMFmgJccW7c6akFtHDiyuNrHQAaa2blaOpy/V+2oV1FTaGuYLltOHT4J
	9PnXR8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkVK-0000000D2WN-2nml;
	Wed, 04 Jun 2025 09:33:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkTE-0000000D2PL-11Sv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749029500; x=1780565500;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ND5I1wqWQVSRJHCCfO9DhtqF0hOCpub/kFuUDNFnLtY=;
  b=AJ2zO8QR4i/739hnFP9WXRU6mKjMxiCl81OhtU/wO/+X7G8HnvVGmlyv
   NBVEg6U/exn5fb9mSI9JnjrU12VUX96/nfGIHXFAN6oDuPl1jxLDpN4f4
   P+WPU3T9fA8GGd6TGSAEubVS0p8t1C/2OKifeN0Yw5AnDM+PCIGJdQsr8
   0p8QsH+BD0pf7k1FNrxDrPGXsQt5/OErMJTExdV21uWEYQowMyjYZYBpy
   1ujqi8eNYEnkFKbjtxvLANYEYMRbNmUJ0b4x33/ZXUHMorEdrJp8W1PPK
   7miRTjAx3Kjq3q/biual+jzKtjr5tjNvLjWk/N4Y0rpK0pJknFumTKjca
   w==;
X-CSE-ConnectionGUID: F7Ph8sD+Q/e2bF0tYrF90g==
X-CSE-MsgGUID: iBNkwfGuQi6WVFYwDypSOg==
X-IronPort-AV: E=Sophos;i="6.16,208,1744063200"; 
   d="scan'208";a="44448632"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Jun 2025 11:31:35 +0200
X-CheckPoint: {68401277-2E-28ACC837-DD1065DB}
X-MAIL-CPID: 598B4D6943D72BDFD2099B674382E52C_2
X-Control-Analysis: str=0001.0A006372.6840129B.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A093E170BCF;
	Wed,  4 Jun 2025 11:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749029491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ND5I1wqWQVSRJHCCfO9DhtqF0hOCpub/kFuUDNFnLtY=;
	b=qMjaYYAoyG2iSRnPM1FeM2/C1cqDqsX8Qx2OVv6BTNz1GKdkHLAErgvW2kruonHN1pPwMW
	L0JXZ9IGa3Vr9aEKQNjiGfeBYPVl627s38q47LhP5rr67xMY/ufw4KG+r+xNGFSAFFzDME
	dvDJIKKHZcTLqnHfWxG2MV4LS5stcpe4kNLmWg3w9MWHNo29YhpEcS5nV2B+ceBxjgosYP
	7CETJ29D0JaGDBTdgGZFdZ7wLUB1MLEjLVP3NIedg2Bt2vi9LF5oOpFVQXGU5GlzWvlE3N
	XIwdkCyeyN5QGrDLQXX9adHt2sHjY56QtES0MjIVclsXnw+/ilsQpeuBrCP3aQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] arm64: dts: freescale: imx93-tqma9352: add memory node
Date: Wed,  4 Jun 2025 11:31:21 +0200
Message-ID: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_023140_777764_78D69C62 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Although the bootloader should fixup with real memory size,
add memory node here with smallest assembled size for
readability.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 53e9ee6e9ca3b..3a23e2eb9febe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -11,6 +11,12 @@ /{
 	model = "TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM";
 	compatible = "tq,imx93-tqma9352", "fsl,imx93";
 
+	memory@80000000 {
+		device_type = "memory";
+		/* our minimum RAM config will be 1024 MiB */
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.43.0



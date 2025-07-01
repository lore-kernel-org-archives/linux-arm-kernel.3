Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8984C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fsPR0xBJxcnVzzuQ5Hgt7xqHX4d7tXd3SqEWWFTjc0=; b=IxLusOoJl7/GttE/NuthAoQuuu
	fygvW/FOdD+T//xwEue4T3alV9o3dtBi5M9PSPXfVKG1yk7zgNe2slB9CKk2JzUiYP7xeNu/RTMk6
	bmvkhSytHClx0kt4z7vVRr1L7CB4Rpn1TwgA8VlkKePSAZWm5y9+Z1jZ8s0GS4EaQrv0JNwKNzdqV
	RED3FCGCRWB34n0nEF2Hk9ccdS4CH6PWHH2lKpUyKTsEvPEsIssX99q+fgifcv3EE4GN6duk++BTu
	gqGrlkFWzLlYlfYN4A3jxZsfxuRUe3ZRGTxn4pbKOhud2qOMpEhfmoDW4dtgapdCLPaFXZH2VHDAn
	LE2fW9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhwT-00000006c8q-16cJ;
	Tue, 01 Jul 2025 20:51:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ9-000000068bG-02nm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9F1D46853;
	Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EABBC4CEF1;
	Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389090;
	bh=nAHJWVBqBIFgDdvlPNmXu9yu+XCBTnN7iRiEX4QfvyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOHIx/Z9SgqL7SqpGSUO7dGaLCALAHGW31NBjZxyaYZYoZ4CsOoEPiCpHlgzsPjQT
	 HmUNHMR7pb/agQnxGX+QPaEQZ5Zm8om+tDxoPZ3Eklvro//MoKclPZOWLrk51yBCgT
	 CSvjUkSQ/CYqC1lwazTAFqQvRcdrOXKY80i/KWM6Mga4G8UPqgtnWBhIAAsbxH4QUd
	 GF+G4sNNQcftc6FRmjUnn7DoEcFwcnq2WJoAqb21iWTSrto0TkK2BthlrjJ2oVLdWd
	 7I0WreVfstImBI+etS9GY77zTv0SlEE3aYLrxOpIPk6q6Y8Kf3TPVI/HH4/xIkUgnq
	 KmDF+C/mYpG7Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 13D555FF19; Wed,  2 Jul 2025 00:58:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH RFT net-next 08/10] arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
Date: Wed,  2 Jul 2025 00:57:54 +0800
Message-Id: <20250701165756.258356-9-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701165756.258356-1-wens@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095811_069895_C2E8239B 
X-CRM114-Status: GOOD (  11.95  )
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

From: Chen-Yu Tsai <wens@csie.org>

The external Ethernet PHY has a reset pin that is connected to the SoC.
It is missing from the original submission.

Add it to complete the description.

Fixes: c6800f15998b ("arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f737..9a2f29201d3c 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -80,6 +80,9 @@ &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
 	};
 };
 
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5C4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vM9byXBqBo/ARX0TQIvxQi6qJgtvneVwatJfkRW3Ag=; b=enwZ2Xl1bZlkyavs7Z0cJZGm8K
	rWrBpdv1TwNl41h+uFNvD0C4HZycDZdR3o/xJopLJ/gSc3sQysDKHAsiDtauSSpqarkza9+5RqVs8
	yjBfJb7n14ZHn2gQigZCXt9EvU+LJ5dADwpIOrh6oSRhDmACd/h5JjvvehrQ8l/PhD4JPYdRU9cRH
	jJp+WBosbtX3BTY6RDQra0hn3yL7uEhPAT5axTlRn1XJtZDcV9jZyRORWihIlHKTA4FGI3L0IGs/i
	vBsJ6xcmife6XuPQc6F2cA81I1A3J/7gZvkkGS0PMQTMHmlRcGV1KQ6jaiLHxx6gzT/7CBxEU13SU
	CBCD/ORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvley-000000033cn-3Lvl;
	Mon, 08 Sep 2025 23:52:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgKg-00000001RJX-31Sc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 285966022F;
	Mon,  8 Sep 2025 18:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ECCC113D0;
	Mon,  8 Sep 2025 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757355074;
	bh=CBUxzfQMcURd9xrdRX1X6MkdC4HdUWPC7RS7d5q4rC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QoL2bmsqrFTDNcyXn7/rTjjoOHFY6ciexniXAGJBY7IucNkeX0wgA6GiCd8cZHN29
	 AA4U4DT/VLcYDXhOo/lMdy72Ar+URZpgr/De5S9DLgQn9d7lnsZf2WXCyiqT283ZUv
	 M7GFK+G1c+I2bWFQzXb2NdhjgkKGzjgX7FFLjT8f//1RW2VEwQtaAFPON6VK8eZC9T
	 SFpeTw+/tJYvgVOQl1dBYRuMztB69btsD2Tl8IdTrI49iolxDvCHW+uvWYBwvIosaU
	 sMHPNEO2WBDkpO7OUviTpug9ymTFTKPww357bSotk4KK5SOIbCnINggjAkVFKiX0Ts
	 8EQ2gPtn+/fVg==
Received: by wens.tw (Postfix, from userid 1000)
	id 423F65FEEF; Tue, 09 Sep 2025 02:11:09 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH net-next v4 06/10] arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
Date: Tue,  9 Sep 2025 02:10:55 +0800
Message-Id: <20250908181059.1785605-7-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fixes: acca163f3f51 ("arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board")
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 70d439bc845c..d4cee2222104 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -94,6 +94,9 @@ &mdio0 {
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



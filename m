Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B24CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLTrOwwkQusxtacuXjxnsLaKiZR8tl4afo2sZ/AtH4Y=; b=NpjVgTqgvx+OMwO7aH/WC9keDv
	0TsgJnxsoMVaHZuJ+r44hxxqL4Elewbzlms2qaIyQzjJNxRymSyWoP2k1VAmUiDybewBjkLIZkCcN
	UcD2BB78KYSS1fCzFR6GTiodJNyr25e/MED/KrSqycZ+Wa5aNDY41m//n3ZndPIT96Jsl4biksC5q
	sXPZKbbSBk3GcuuPtd7rJTS6jMdFANGdiO2gnORZKebYXryGkI7oDkXObGrr7Unhx5tkreArN8S9/
	2+kInytzyHg402Tm10oj3JC086xIwyn+mWggRKHMHOWAkAqsFnYp67Ho3EnNhl2VyGa2yjVhCbxDm
	VlkM0bYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlfO-000000034Im-0SGB;
	Mon, 08 Sep 2025 23:52:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgKg-00000001RJB-1Qu4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C52D44B27;
	Mon,  8 Sep 2025 18:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF70FC4CEF9;
	Mon,  8 Sep 2025 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757355073;
	bh=coKgeanaUZ3X4I0jziHLWfdNIN3UjLw9i/nP+qWcjHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbjPAJVj+Ccx1YTKZrvpsRHmbAEV0P6asEw8LJwiUJ/hVodfJHuxDiEB3U2dkEI6y
	 NTrL18E/0x2Jj9reBGahfUtLqFZ1Wa/eCATTh3aKxaayBbifCy28Ra3bLf+7Q6EXTw
	 Pik5J8qfj9NUWYfYNH0lduTRBKe3ig+seqEi6d/kwdYzNW9r8yWKhbFC5y6tfcFBi4
	 moOY7NR8iN5YVDsDwm1noOE0ecXRsjYZ8/IcataZX+EvcYAdtea4C3JS63q4LbPKYs
	 jyt5oWNZVdgHo23+YafzlHasx82rfYbudDXTErU+BYqMH7c9xbNMJmT3Zk1go8JWEP
	 JaZtukR2iu0Ag==
Received: by wens.tw (Postfix, from userid 1000)
	id 5666E5FF5A; Tue, 09 Sep 2025 02:11:09 +0800 (CST)
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
Subject: [PATCH net-next v4 08/10] arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
Date: Tue,  9 Sep 2025 02:10:57 +0800
Message-Id: <20250908181059.1785605-9-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111114_399293_C214E373 
X-CRM114-Status: GOOD (  11.43  )
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
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index b9eeb6753e9e..e7713678208d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -85,6 +85,9 @@ &mdio0 {
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



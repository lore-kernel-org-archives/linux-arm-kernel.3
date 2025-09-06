Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4463CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 04:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLTrOwwkQusxtacuXjxnsLaKiZR8tl4afo2sZ/AtH4Y=; b=VIVnfGmSXs+6ygicw5C+9vzXK4
	WkHGtlXYAk9YY4b/wuymasz4cH5IVmZJGbyfyCnp8pLDq6MonhXK+ICjZ8bqAO863O1NVtTJRZGhR
	oKJBEG+mDv8et74IIl6kszoDpbDMaHWTsrTPrlhxLX25cTB37Jile17+5RNJuZB07bHBorb5MYWu/
	sFki8BtCq9dNlUbFNr+eBHmBNJ4aL3ehf4/prNpobT5RcsGvAu4gln1lauCs8RSlQEiZxPlghcWeU
	lzNWHGN8v1FtMwsoucxsBt2kG4s8wk369scrWzbPdTha3Fml5glVdbXps6hoYE+FWtpjjur7T/cZT
	vxHfL1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukfO-00000006cM3-2zxQ;
	Sat, 06 Sep 2025 04:36:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukJ7-00000006W4e-1dv8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 04:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 476174508D;
	Sat,  6 Sep 2025 04:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09206C4CEF8;
	Sat,  6 Sep 2025 04:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757132024;
	bh=coKgeanaUZ3X4I0jziHLWfdNIN3UjLw9i/nP+qWcjHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=coau5L4VcUBh0pb7ft7mpwoSZY/nZgwM8Umvnx01Nwbm1ZUwnwRH77dcw2XJN3rZD
	 RD7USlnj4bsrb+YF1AFycelE5v12xACcnlkDYSSJTAP4Iq/mglQZ7B9X70KTjaHAFv
	 ThofGXaZJH+gM6tDAliipZa1Y94iXBjLed94C2aNVyXwRSjnYV2ZPlcNBEfmdrVNP5
	 phiBVWBhO4wAJtlIZsNnvPbanxBywMqbUeaWhCERI+eJETInsXiDE5n+fWs2k9a6wg
	 IfngRvqzL0glUpW6RJmab9E727RyXFywaJLBvFb9jmyEcidrVdlkJ2k8vZxO+bSGb/
	 E84OJY7fVm2fg==
Received: by wens.tw (Postfix, from userid 1000)
	id F1BF75FF75; Sat, 06 Sep 2025 12:13:38 +0800 (CST)
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
Subject: [PATCH net-next v3 08/10] arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
Date: Sat,  6 Sep 2025 12:13:31 +0800
Message-Id: <20250906041333.642483-9-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906041333.642483-1-wens@kernel.org>
References: <20250906041333.642483-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_211345_472012_D44E88A5 
X-CRM114-Status: GOOD (  10.64  )
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



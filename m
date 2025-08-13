Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BD0CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/SW60XuvWVs4JyTRLIRiu2EpF7OaSYs1B49vP+EcrQ=; b=wMypXcbhYHvjkL0/TWzTGb2UxH
	BegM1RUK3tgZtMTeKCJAYg9pkdbml6iep5mS0K3vTJ3/v73rxXiUqDrygGFYuDx0MwTIIEIrGCsoi
	tkzS8n5/9Qp0bSv5JLVah5UvrWjGDvSj+7n/cvFgzxA7N5LnsRsMlXYbGgBuOCren6yqiuXV1lSuj
	Zo8W2LyjbLwhERLIXNQDPHueegX3CrBjPwsqqDlWurrdChx+Aa8BZGn7Z9fGbWEd7nl7U9o3hvE0p
	KiHsy8LCeWAqAPgUDo+98FsnjXQeZ1m/UHe/Edy9MN3jSfy5VpGyUgseRmdkeqyFbl6Yt7QLII98D
	YW+FnvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umD1c-0000000E7aT-2GDG;
	Wed, 13 Aug 2025 15:04:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtJ-0000000E4jB-2D4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 453B860202;
	Wed, 13 Aug 2025 14:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A210BC4AF09;
	Wed, 13 Aug 2025 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096947;
	bh=tDfUpZExKmJMXStQh2fTARqlHOrlMBEVmIQj8qTNpp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6YkdF24uls3iDY1HAv8Weghhp2cN67nZBA70lqLv1r2uhk3tRVBWlfJ/B3gQ9i/p
	 +YwcjV5ob/61OwEq9MLS2tjY1Q1VRbmBrWQ7pKE2NCusSJMxni3Q6SRI8fhy9QbIew
	 18J96Kf4ueIjFH4GHiaJM71wSeXxvezTPTnrVFElmQq0a5G4AsAltbN11F2+vaOffz
	 oNUG3Lv3JeLFpkcC2NjBtJKBCOb35MHNIhARhHYG0daIFjCZNhCkF+4OsC1K4xup+A
	 Bd9qI2lZozR+KsuX9TIeFqb65lzs/ZHIeAhxYL63irKbFbvJ8OWVtxTx83EE0rWvIV
	 5TctEyHhXm86Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 27E2B5FEBD; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
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
Subject: [PATCH net-next v2 06/10] arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
Date: Wed, 13 Aug 2025 22:55:36 +0800
Message-Id: <20250813145540.2577789-7-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
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



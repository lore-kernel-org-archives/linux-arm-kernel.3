Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5FCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmlHMPWedKZa3b5lspADk1yGjz374S0SlNnfit98E9I=; b=QUxPydeaNdQom0wuaryNnREXwi
	sSNxXnJHwuMm1HnPdCiGIHQlRx8v4+ECUvsemeQ0EEgru5Y5vg72AJebrnbiiClI36lwcE1Z7BTvq
	kVmWsgbHj8cVfYOrCI3biPhvnUMHAuHEafRhQsLfJqBbHpQ7SmLQLY9RNLpKZfrb+OVIS+w8PqoLP
	cvis3yGSbTmWhX7m77+E/VieVZ6mK4KK6pQHrTOC7+5I2LZCSumnz+FGvNkdFxllgC3XUe2dUtbIx
	88tZURZBR8UVMxdH4ri0HdSwO7kq79dJe7f5UiY991OtIj9k/C+kAjCulSCw9udvXg56SOq1OwX7X
	TuzceO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71q-0000000G6zs-0Nde;
	Tue, 21 Oct 2025 07:43:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71i-0000000G6nf-1Mhn;
	Tue, 21 Oct 2025 07:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=mmlHMPWedKZa3b5lspADk1yGjz374S0SlNnfit98E9I=; b=jlUVEXvAHh3IXoI8CaQJLnkll7
	5haUWO+poWoQMwL+eZ9FT43Z/c7uyRa4kqt4q24UWF52y0cu+tyeIuuC2ATYVEc1184y5zq4w3Bmt
	lcagqGU3K2VaYMpbxfNVsdyldDdFxjx64j8xlC+KQk2Ar6ThZUxzgOfQRpKKQEq10hb0yjROERpxH
	WSLuYet96m6Mb0btNwUpuEg4UA29Z20lLnoTR9jHmPyNVJxUAsuEZ9xuqU8Hq8g7mXhEK6/7/yuDK
	YVOEwpVjjKkcd2o1NprP4CQl1Oiu+KRJK6ycUlI66jikfW5avzwZHQbVUdU81fRTKcgt64QfqLuGO
	i2ao6vpA==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB71O-0000uy-Hl; Tue, 21 Oct 2025 09:43:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 5/9] arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
Date: Tue, 21 Oct 2025 09:42:50 +0200
Message-ID: <20251021074254.87065-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004326_391180_DA166D40 
X-CRM114-Status: GOOD (  11.61  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The VOP is also part of the VIO power-domain and it definitely needs to
be on when accessing it to not cause SError faults, so add the
power-domains property to it.

Fixes: ef06b5ddee1e ("arm64: dts: rockchip: Add display subsystem for RK3368")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 5b2cbb3003b6..ce4b112b082b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -862,6 +862,7 @@ vop: vop@ff930000 {
 		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
 		iommus = <&vop_mmu>;
+		power-domains = <&power RK3368_PD_VIO>;
 		resets = <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LCDC0_DCLK>;
 		reset-names = "axi", "ahb", "dclk";
 		status = "disabled";
-- 
2.47.2



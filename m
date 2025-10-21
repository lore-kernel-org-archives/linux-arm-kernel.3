Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C764CCD1B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQiFTA1Zb0f+PltH60opSgxEGjud3fhNqO/a6P7cdMQ=; b=Y03ak8R5i++J24pes3QVviG6Py
	noCXnFLR+35XkmlOWa6iueD/gwmyKQ/yAynQ97GY7z3uOp3n3Ie0UO+8mE8IHVOhaZ7keCTQ2LSJg
	muN9PjKijo1nq356rAhEt+PJdADmZGicYYadirx2vNjuQQpz+osucry3cNtoYK5YwbFRget67MymH
	vU4HiE2x0ZG9kGQl6jAAzMFqh89lVLskvQa0KQM4W6+RrWGGFg7ETemmln2Ehn4FSWMltKJ60do+j
	4Bbnj021tJV5qAhTsVEXJD3TWF3BDbF/S1gnaVng0tF+KIGzqdC5xf+CyFW8pu09zQKk9Ni3lbhqX
	gCxXLcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71o-0000000G6xj-3hRV;
	Tue, 21 Oct 2025 07:43:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71i-0000000G6ni-1PAj;
	Tue, 21 Oct 2025 07:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=DQiFTA1Zb0f+PltH60opSgxEGjud3fhNqO/a6P7cdMQ=; b=hGigLLHzRgtp20dwA8JjHs7izb
	OSAtKM6CvnKyn2qGGhTEgzXKtVgwieG5XeDqSRKz3Lpiwc6jXQXVm18YL/QiHwSTg2NRY1QBCYrgp
	Vv0adkWzqEuMnuqGSSc4xWt0s60GpXcxRETJNaYSDdwOiInDYVa6WERFcBjFzNV3HAA9ee6PGWHJS
	vpd7v9TOwOAPuSlhN2i9xWkK1YeMrBh8mcikpksA+enGOlEGDUXXVptYF+kjCkMiJtcYuKerS9xfN
	om6qupUiMEL5YZIviWcgozizaR4b9od+LoObXwACthEjFOECfWTNzPLdtUALJro6iWKBWKf33/nBw
	m+AvKbqg==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB71O-0000uy-4v; Tue, 21 Oct 2025 09:43:06 +0200
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
Subject: [PATCH v2 4/9] arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
Date: Tue, 21 Oct 2025 09:42:49 +0200
Message-ID: <20251021074254.87065-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004326_406093_FC81771B 
X-CRM114-Status: GOOD (  11.81  )
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

The DSI controller is also part of the VIO power-domain and it
definitely needs to be on when accessing it to not cause SError
faults, so add the power-domains property to it.

Fixes: 5023d0cd6183 ("arm64: dts: rockchip: Add DSI for RK3368")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 8f0216203241..5b2cbb3003b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -896,6 +896,7 @@ mipi_dsi: dsi@ff960000 {
 		clock-names = "pclk";
 		phys = <&dphy>;
 		phy-names = "dphy";
+		power-domains = <&power RK3368_PD_VIO>;
 		resets = <&cru SRST_MIPIDSI0>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-- 
2.47.2



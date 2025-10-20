Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0794CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq+OLT6kQHBvZ3SWUmco3TCZbL/ngmeaaecxDEGXCME=; b=Oc9M9YAa2u7yj7fFtwzv9BiFNU
	dizrGFGHq1H5zHqZzL2pdKedb0JnDZoOvR87GsMfPyqMoMCwWK0PErIKt63eSp7fk5Os+I9t8FI9h
	yA4llyji5IE28R8lykEjTAjmhg8T4hJ0IYQT+ToD5QeHKvAAqpbFJb4HW3HNqsknnGm2pFEsgJ2+6
	/5XXLl5eYoxJM9OSTgYJXdPolPoRhGrFhDMQJdOlTnfa/O9vo+9FmVbJd+Z5H9zdlCeyFuInolFDD
	BEq8l3oxVG/mnL4ToKXqbQopmJucouvoPfe5yWJJTGGCQ2LA8oU4TN40/QSlA5g5LW+thTZz84j4Q
	nYiI2E1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDS-0000000CN8F-0QIy;
	Mon, 20 Oct 2025 08:26:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDI-0000000CMrF-158P;
	Mon, 20 Oct 2025 08:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=vq+OLT6kQHBvZ3SWUmco3TCZbL/ngmeaaecxDEGXCME=; b=dUgmxZbiqZHYh6tpf3bP0/hewn
	qeEKPW/M+nVRk/aIuwlPJJ/6PLzWNlu52tkPtPMR+Uzdk9raOyXp7k9GdHPfu/TNRRoNFj/AstiDV
	rKFBJc1Y1ie8TBCGMgi6UdRB7ghCr2Qr6l0Ue66Mg1GehcRkFsG8K7KV8HR98U0ARbqEJJNLF23fI
	VXphZOBD0mKl7VHJPA2Tg1EVHnxJCqiwEo2KxU4SFgOlsp123cRSChTGdV1qyW2Q73+fylfd1ccMj
	TZkJLdy/9I45+QCj8ZYSGu6ylz3WkZj829rZI4OV/PBO4Zudr+MIdXUX0i7lE7PwhaNUm3xzq3BWU
	iWfbYNfg==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlCz-00078O-MZ; Mon, 20 Oct 2025 10:25:37 +0200
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
Subject: [PATCH 5/9] arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
Date: Mon, 20 Oct 2025 10:25:04 +0200
Message-ID: <20251020082508.3636511-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012556_314686_3BE32D33 
X-CRM114-Status: GOOD (  11.25  )
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

The VOP is also part of the VIO power-domain and it definitly needs to
be on when accessing it to no cause SError faults, so add the
power-domain property to it.

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



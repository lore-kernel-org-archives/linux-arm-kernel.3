Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A365C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35Y1Mvqm3PQ758mkGyOjdGnkGXdHZYwPhqgHLSP43Hg=; b=nYmmHyBQiJTXylytkH4iGe2Nov
	l8JlF1alAGyEbINoMlJPUKrolqO0Kqj+zs41fUHg9ZDHFNstr7XSIWCHbxrXF+fc+Ni1Np4H2a6Vx
	0gSl/ABMXa9X3G7hiuuC30tV36tkfrMfyxSFB+HLo2Vxe5cB/G+N+V/K4pilY+5QwGAQguf4cLIkR
	8P24tUARvB6Vagr59SRg+O5DqouXNuGNeOft9OwtWTFg9DEE76iWQNAvyJVeIri2W5Mk5afPjrHwJ
	fsoFaCFc3oOC2pS/Oh2+PbgRB+3nnkDXdvCC5Blli5OvzyHPIcPr+nTYUbcfx63oQbgX6QBSDmAaU
	Mi8tKgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvY-0000000BjIH-3Ext;
	Mon, 10 Aug 2026 12:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvR-0000000Bj1Y-2hQe;
	Mon, 10 Aug 2026 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=35Y1Mvqm3PQ758mkGyOjdGnkGXdHZYwPhqgHLSP43Hg=; b=N5GwU0VA3bBndYWplzFJrz+IOn
	Xwc0Cdw1oh7uyVaIGFf90WPtwosCWaHe2UKBmdT8dOXunImcu69ZzNzvPbVTlceVWMpGIP/HBtoR7
	QQrbDk5bjmmpmnX9ysYHM2GM6Wh82uGvoc9XKw5jYNVwKhieInIjjJVSJtva8eCUUO0pjFrAtCq4H
	BYWNZ/c8zAbuTqaCcCRrreWdkzGh/YQ6wQUqHWNXYxZqOJdcW9HTilmzSEZlP/3RaA5OJWhxbVrDA
	33wMQWDgwJS5u5N8kjhZbNvC+boE9c2GXMPNgBDJ5Z6zEvMM4mKhrw/a/pZG23N24k+kyceXB6eQ+
	uDnayinw==;
Received: from mail.zlab.su ([109.73.193.145])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtOvO-0000000DlrK-2gBW;
	Mon, 10 Aug 2026 12:16:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB488C051B;
	Mon, 10 Aug 2026 15:16:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364169; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=35Y1Mvqm3PQ758mkGyOjdGnkGXdHZYwPhqgHLSP43Hg=;
	b=Gx68abnpQU5Lp0EKxuXN1cc0xMlytXhI2rmEwQfBATpwZs6Rfk2GOdbep2obCGjzjeouRt
	k9s+rCU4ZzOvKn6ckL23ULBJrOH25KUTKzt1nrBqnauejqvTDUdwmc5kGloiXkhLaYiRLc
	Gy/v9urBQ7DFNZBIS2+yQZDkVsePckZzxbSKb/2VIqcCBDYEgPatZmolJRcIEC644pZVnq
	WUUFb+M/bIY2Mx+CWUgDv9S/lpyEHzeVPPZvgTdAlpO4iAZfScUYDtFszzBtmJyXEcOZRD
	59aft1pDiFvpoBuU0pKpoBzBkQyOxJNEP243mgOj/0JP2s1CL2ETJ66CCXbIjw==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 13/25] ARM: dts: rockchip: Add DMAC node for RV1106
Date: Mon, 10 Aug 2026 15:11:04 +0300
Message-ID: <20260810121121.210040-14-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_131614_852154_6E3F6195 
X-CRM114-Status: GOOD (  10.43  )
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

Rockchip RV1106 has a single ARM PL330 DMA controller with 8 channels,
shared by the peripherals. Add the dmac node with its 8 event
interrupts plus the abort interrupt.

The controller needs arm,pl330-periph-burst to use burst transfers for
peripheral requests, as on the other Rockchip PL330 platforms.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 43d992e3e2d6..4abc333ab370 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -235,6 +235,24 @@ u2phy_otg: otg-port {
 			};
 		};
 
+		dmac: dma-controller@ff420000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xff420000 0x4000>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMAC>;
+			clock-names = "apb_pclk";
+			arm,pl330-periph-burst;
+		};
+
 		i2c2: i2c@ff450000 {
 			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
 			reg = <0xff450000 0x1000>;
-- 
2.47.3



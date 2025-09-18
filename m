Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4C1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N75qcFlSnFBReo9pnHoHJiAtr51872oUEL7y+xdvZFM=; b=AyhVKnbeUACXPwmF863WJt4YXS
	hpebCsP+PSWiUGnH8eeA2wZ7410cgR+M0XQZXnVx1i0XzIT8EGMo+e7VEtncntefMRo49Z0ndRVOy
	+5/r+28C/xb3e7v8ij5B+d3F4nzQhSYRprIo5he/oMf9J0BKmKp/w0EH8QHd6hjq/Z/78W+G/NJh1
	6qhp4DQlYzw3mVRVYKEdmsyCQY9GJvLyJzxFzpJhVIs0qsakh5DufnIt5dH3M5e1IXxj4FHTU1JVx
	vtvejzNSvZe4KAzz4di6NGa2AmXYiFfGFHTR2KK0bumz/WyZ6MbK0WUpSVSKMwtrMhvUwudDZM3uS
	TTcLM6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGce-00000000P2A-3LxT;
	Thu, 18 Sep 2025 15:32:36 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGcc-00000000P0j-3mvb;
	Thu, 18 Sep 2025 15:32:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C39B261A3;
	Thu, 18 Sep 2025 17:32:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OFj74AdZKf4; Thu, 18 Sep 2025 17:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758209552; bh=sHDVtuH4++8ryiRLH7XMcszZN3f5qzA2Cv1Z4Rnzrrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IeA521fUUF+ISMT4xLkvU4EKmMZVqsgvseTkPxd3TEwWFIvTd9gBLEgHW0aoEPWUT
	 UTBwCrKeCNXg3vtnbUPz1y8ydJlk6FVtiPTfV8EAiixvbPE8kFX4Sxm4sBjdPKR2To
	 e/lzfP9LbgiLH8rpxZ//EmeEl2bN/jxpwI8vZGSwh+QzmYEtN+1lZ9MbcpDMuQyojG
	 xWEfrRh213XE2x6D5gaDeHTiaUS+l5eh1W3kg7axcQQbvS8efkxb716pyMrQfyUUKa
	 ZMVTpu8lOZ41k1g84G5sgE+Da6wGiU96Du4HmlF/fgm04KqW0nVoSeGQqrq/sLIyTE
	 vHzxhZWnkkHMg==
From: Yao Zi <ziyao@disroot.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
Date: Thu, 18 Sep 2025 15:30:57 +0000
Message-ID: <20250918153057.56023-4-ziyao@disroot.org>
In-Reply-To: <20250918153057.56023-1-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083235_072103_8409492C 
X-CRM114-Status: UNSURE (   8.80  )
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

Radxa E20C provides one of its GbE ports through RTL8111H connected to
SoC's PCIe controller. Let's enable the controller and the PHY used by
it to allow usage of the port.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 12eec2c1db22..b32452756155 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -171,6 +171,10 @@ vdd_logic: regulator-vdd-logic {
 	};
 };
 
+&combphy {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_arm>;
 };
@@ -229,6 +233,14 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pciem1_pins>;
+	reset-gpios = <&gpio1 RK_PA2 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
 &pinctrl {
 	ethernet {
 		gmac1_rstn_l: gmac1-rstn-l {
-- 
2.50.1



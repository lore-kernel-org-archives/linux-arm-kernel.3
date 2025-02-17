Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F29C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPAarhaxrBr08q92BGXaT0nI0qZpdkm9/MdgFjivVyw=; b=c3hJZxm6NbCRiWxchdheasUaw2
	Jitt2mojffsfex25CHmogmqYkcp0cWxMLX5aL9jQhaEAJnqK7t5z3ZBbys/fFkM9ZCNMBvauKg7cW
	54Qol5ZIh2I30t5wD+u8upMOAtwbc/tOg1/SVHvpcm1ljU8vMBQ0KC7WmtH4sxuuhvmgt+zeD0DpU
	hQgu7jXcznehc0CBMJvnyZDfkc3YZqQSy3bdB/+mtTMsOxaVYH8rrtEvmYeavPdOpZ91J6i44Z/6q
	cGa0lGMQe7uxUfypBwIhMwl2LcAXfzt1CKfp2GEe3aIkaLoNDBflyHSLFEir/5nC1XBmp0WWW03sW
	MvTxlLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk9CT-000000065mq-3qjg;
	Mon, 17 Feb 2025 22:02:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk974-000000064qR-1dC6;
	Mon, 17 Feb 2025 21:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739829433;
	bh=HqD/otvQ6CB/wALHb0KdTDbQw39m8H0tlEIqNzso+MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrTGaWmWZk7taRw20lsQ0wHef9+y9vUd8rxtGJSS2XOgvbq+FVHdXKd/2k+AqM/7X
	 OGGhSL/cyyrUgIrTpt8JY0z12EITFpcXrZTueXVNedHjbtjsL/xyG4kJsX266qFbQt
	 tRCJURjwzZoD1KR9+sGFu3k7XSTucHKSr7XYazqyd6q9PCtUGKQayebPTSCJmGOxk1
	 J87UUbiUFqfvh9gat1f4JtjYuxtpwIP1CJE9INjk2DmAKO1brjtYItY5flZrR9H+8x
	 OGt43Dubjo/ZiGYc8IxE7asXbA8diwdrFvUsw0m6oPS0GMJJr5/BT1/j0b7PCxQZED
	 QmfbCDp3iRqjQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5179C17E0391;
	Mon, 17 Feb 2025 22:57:07 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Algea Cao <algea.cao@rock-chips.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v7 3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
Date: Mon, 17 Feb 2025 16:47:42 -0500
Message-ID: <20250217215641.372723-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217215641.372723-1-detlev.casanova@collabora.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_135714_571053_FE20EB50 
X-CRM114-Status: UNSURE (   9.38  )
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

HDMI audio is available on the Rock 5B HDMI TX ports.
Enable it for both ports.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 27128c6a05a2f..8f42cd0427701 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -231,6 +231,10 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi1 {
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
 		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
@@ -249,6 +253,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
@@ -351,6 +359,14 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 
-- 
2.48.1



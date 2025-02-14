Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHFOzkiAxzz6twt11feJF8dte0Yom/t8kzgL1v3ECcs=; b=xUh/GUSpGmMunO1+R9ug57SYIO
	0TvY/5qxgCTqH1ph3BIOtgjfjl50eRQa8G6CcZB3jvqhBKm8uGI/6UWB53rl8j+bn09JlljcgkK5y
	R++wOaLJSnSEk11Ke5VSayrtTvSEqPR9ReurpDvHwQUm5ynJnQRQ85kn18u1uTQ/HiN5f2P7FtJS8
	OvW5pBZb/kxYK0Y3XUPXlbkVh31iQbYtA1jSXWhn7lQc1yKV+V7HAbLJF8hqsr6Y9HX83KaIi5R++
	/t2yVgcIk5Cr1tMk3Ud3ZKVTOHyspN2Es0s3Ah/EB1yFlFbOcdRA3NjHHGzATkxyEnKLBXaRRJxt9
	Qsy3TkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiywf-0000000FaV5-1I9K;
	Fri, 14 Feb 2025 16:53:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyqT-0000000FZCO-17Gm;
	Fri, 14 Feb 2025 16:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739551635;
	bh=SrFZdZudr7RArsBjh8BhpE0G7d7aPvrz97c6D+4TCUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7wEv5iIWcQpuhRifPwkGwnbfl8wruNabVEmDdQCoHSuC0KvnNTVygl8AsOq87wK3
	 8hyfaGFgzXMsvmZ577HHmNYrbijTecCApgQQOpXXQimv6jj3AoIr/96B5z96iJMKDB
	 cDjpFuaZVOUeW04qX1kvFnRCUPLIUwHPUn81rL+BPgIiM8CHJh2aTRI0rxjD1V3iH8
	 XndAyODRyDpOUzJV6z+xTm81SYnkI/Mt/fWcGoQrwipNdXnsVImh3iKluUIzWdZz5g
	 zr2RjG5XhixXpMmvxf9AZfgODjfH3OG6zRBoO+H3YVz6/VoV2TXbPdSYcBhAQKoTsD
	 mlBZs7rx9R7Nw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D4C717E0B59;
	Fri, 14 Feb 2025 17:47:12 +0100 (CET)
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
Subject: [PATCH RESEND v6 2/3] arm64: dts: rockchip: Add HDMI0 audio output for rk3588 SoC
Date: Fri, 14 Feb 2025 11:44:01 -0500
Message-ID: <20250214164528.534278-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214164528.534278-1-detlev.casanova@collabora.com>
References: <20250214164528.534278-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084717_446522_050E6AB2 
X-CRM114-Status: GOOD (  11.97  )
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

Use the simple-audio-card driver with the hdmi0 QP node as CODEC and
the i2s5 device as CPU.

The simple-audio-card,mclk-fs value is set to 128 as it is done in
the downstream driver.

The #sound-dai-cells value is set to 0 in the hdmi0 node so that it can be
used as an audio codec node.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger Haikou
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72..f9f888dedd8f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -382,6 +382,22 @@ scmi_reset: protocol@16 {
 		};
 	};
 
+	hdmi0_sound: hdmi0-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,name = "hdmi0";
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi0>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s5_8ch>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_partition0>;
@@ -1394,6 +1410,7 @@ hdmi0: hdmi@fde80000 {
 		reset-names = "ref", "hdp";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo-grf = <&vo1_grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf96EL1fdLyOPgckgwexr7VHAXtwv685XpN6hfJsmNc=; b=XmoQkIXEJjLZ/S6egFQePxA6lA
	6KRAa8D0K4oUUNN0o22jnSYO9RYCbFLbKW4/BeE6q5Vr5DXnnmLBQg9PqcMoRY4UNorT84mzFA57f
	Ljr2nNIJPLAkh7TS7bqPRpUK/iGc03oH3G/wh9GU69bOfaSzWQ30MDuhNsFPMiupAKMIyaRn3S1DO
	r8bXYja9nUowmifwxjm+WzoRaHnJPryZy6gUoCHpX4bM4tVkzJYtW2S8Sj4wKiBSz7rAEJdXwqPt0
	AjsOQSg8MoDcKWF/ycxUFWYfsHmDnPEC0AGuOscLxikLAqL536AzoeQOtJvGmds7Alwb4hLy/JOM/
	QLF5Bk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9DF-0000000CEQl-1sa3;
	Thu, 19 Jun 2025 06:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8wE-0000000CB16-08m4;
	Thu, 19 Jun 2025 06:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Pf96EL1fdLyOPgckgwexr7VHAXtwv685XpN6hfJsmNc=; b=cLkV0VYfWGSrwS7F7wSP2bXndy
	60iaEmt49bztX4gf33dDI45OiPE/RUr27KijdRZJzSwGifVt1eBUmqxjYhRLYdBvHM8n3rrSZaNnE
	YZK65ZZ91pC/EI34ly1EmIZIm46aVE1DuHSemtJGQsTSwWuBTOTFJsuD6uwllKxfpXvBPMyyYkY1x
	vAHD8UvPc8Ez6SqLi729AUkCqJLb4or0sNQwEuAXNyAIWgXesJAP11Q2nFL26nWla6m9Ooh7AhcSi
	qzrgGX/bL960IBRhMlHVdjijUVO23/o4at1Sd6ii00rUfMSDEqwGdunDUvJLTupiUJ07wsd8Nnkv9
	esONAOTQ==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8w9-00000004Met-0mkG;
	Thu, 19 Jun 2025 06:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pf
	96EL1fdLyOPgckgwexr7VHAXtwv685XpN6hfJsmNc=; b=g8UoNtzRLhdPbP0aPI
	xo9nLiCkjwm4QB3s3AtOGzaGU2D2zIBs39Qen6UYg1GHUbgCThhknbeq0VoSHNY5
	hBIdZEI5v+IcMBSjFydl4kRBmRrBR91duBC34xirmqASAPk9tIO+HdCmDFzCjsv3
	8chNXe6Pl8vfjHpX4r8u1/FB8=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S8;
	Thu, 19 Jun 2025 14:39:15 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 6/9] arm64: dts: rockchip: Add DP0 for rk3588
Date: Thu, 19 Jun 2025 14:38:52 +0800
Message-ID: <20250619063900.700491-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD312OGsFNoUtqyAQ--.3973S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyxJryUuw43JrWfGry5CFg_yoW8XFW5p3
	ZrCrZ3WrW8uF12q39xKw1ktrZ5Aan5CFZYkrnrK340kF1Sqr9rKryfKrnxA34qqr47XwsF
	vFs3try8KFsrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwvtZUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBZxXmhTrfVbHAABs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073949_871186_D5B4D5CC 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The DP0 is compliant with the DisplayPort Specification
Version 1.4, and share the USBDP combo PHY0 with USB 3.1
HOST0 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 51f11b9c414aa..4a54389c89d75 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1536,6 +1536,36 @@ dsi1_out: port@1 {
 		};
 	};
 
+	dp0: dp@fde50000 {
+		compatible = "rockchip,rk3588-dp";
+		reg = <0x0 0xfde50000 0x0 0x4000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16M_0>,
+			 <&cru CLK_DP0>, <&cru MCLK_I2S4_8CH_TX>,
+			 <&cru MCLK_SPDIF2_DP0>;
+		clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+		assigned-clocks = <&cru CLK_AUX16M_0>;
+		assigned-clock-rates = <16000000>;
+		resets = <&cru SRST_DP0>;
+		phys = <&usbdp_phy0 PHY_TYPE_DP>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp0_in: port@0 {
+				reg = <0>;
+			};
+
+			dp0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi0: hdmi@fde80000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfde80000 0x0 0x20000>;
-- 
2.43.0



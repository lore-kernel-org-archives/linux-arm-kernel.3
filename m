Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F175C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBV6ToEvFzFYTkchra4EnDlC5ZIrrRmPOc2GoHsMswg=; b=4jN00Ywc7WZMaa0pWeZny1m4zf
	XQxxzII7Px9L/WTZi00YuYOnWaZfbW/yWaFqYb1ZjlPS2xHO2AxifitbsRgFaK0eDgP8rP8twEjWH
	6zp4YnUYicZ9vJR8PzK/m/CGS3/fEbUeAE4DwPzROfVYn/7kBv9RQo7thi91KVSZ4NhT66BfXzVLn
	rEaMOAE63CMbIyT9Cynf34tp4FJk67tUW0xzn5//Z2Wc/ppSdKfw/Yfd4C/+oFAQJe7xbxkYSo4EA
	TOYKmCVxUnWl2Vg3nycx58ieEZf49Mumlh65hNor3o8T8w7LI7AQbGASZ5mnaEDJBdGhWwRanf5Vy
	7DyH9hCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSR5-00000006iBm-0687;
	Tue, 17 Jun 2025 09:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI3-00000006gxZ-33eu;
	Tue, 17 Jun 2025 09:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=DBV6ToEvFzFYTkchra4EnDlC5ZIrrRmPOc2GoHsMswg=; b=Fg41GchyuoDVoh63b7Tz7bGX/J
	5+YXHwgX5+oWJwwo+DuWVNNtbDvYM+L2dPsZtNRHLsbWAFAyKNmQSQgheg90gPWbx1nhFqQXQ+9UI
	Edn/BiYxMseG8CrFD5ZqBgpR7n0se9fU0AJ7nUQHtInn79ueVW+e38NtSjkTYJLLeUVF3Or+T75Xs
	GMiCTTTRSnjdYOUsYnepiHLH4b+ikdzGq5Dje7uUMJrYo1Lc1gTo0fadh3wgo6LqdyAu/r6rePIVL
	96O85TIsgRfVrTuZJqn23z78jIIXP4Lk1913oSl4l0W6fTqsFwRf3e9PmrZqJLnvEGCNLH26v4vWS
	yiuuBusw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI0-00000003kjn-3zHs;
	Tue, 17 Jun 2025 09:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 730C35C63F5;
	Tue, 17 Jun 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EA76C16AAE;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=SseOVKGpd8b5VDsqaBskNVXohkDASV2r56JlAC/rmKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nUSla1OinD9g1WMOSlNR3qY5wrV3mRJx1Vq1Pgy60sDgy0TEa4XNyI1dR0xwM1jH/
	 DhMzme7LX+4g4CbuzFHXx9qJ84MEiDvI1asszYfAXvY9dv67q98d8KeZq1AH2Xe/kh
	 3QbuduN/PxW1WJvBGV4W709RsC9YPzTAXwg3ah0YYTndGSMtodKV6w75/3t4XDRkax
	 olWNHSpKbkLYPNTzJQL+3aBLNDOI80zjWts5RNQC5uo0F4QrloxNmSIPZe4iOR1jFd
	 I/a1oDX53yFlHabVbTQTutCR4xiaTWxZ9ZgJrYnTfRNcajyR//YvoahZditFvxSnLa
	 ++J4ctkkr8xRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400DC71136;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:46 +0200
Subject: [PATCH 5/5] arm64: dts: rockchip: add mipi csi-2 dphy nodes to
 rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-5-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=1867;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=qrX7R9Yf+higl2wbSf3x1h05wV3AtHIap5SggDm1ypA=;
 b=c84nks+JEIFvKM2PQXYe5Sigfe8rKm+GsUo6dxEijt2RPl2ZO4XAEDjgHV/Lapw/2TX710uRl
 gb9OUZeBuxgCbK95HJRW0PI8pg2A3oRvDAL8d5h81ksM11iGvCrd4Gi
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_100733_395818_0F9B40BE 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba55..6a4ee0247fcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -621,6 +621,16 @@ php_grf: syscon@fd5b0000 {
 		reg = <0x0 0xfd5b0000 0x0 0x1000>;
 	};
 
+	csidphy0_grf: syscon@fd5b4000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b4000 0x0 0x1000>;
+	};
+
+	csidphy1_grf: syscon@fd5b5000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b5000 0x0 0x1000>;
+	};
+
 	pipe_phy0_grf: syscon@fd5bc000 {
 		compatible = "rockchip,rk3588-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfd5bc000 0x0 0x100>;
@@ -3052,6 +3062,27 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
 		#phy-cells = <1>;
+	};
+
+	csi_dphy0: phy@fedc0000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc0000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY0>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
+		rockchip,grf = <&csidphy0_grf>;
+		status = "disabled";
+	};
+
+	csi_dphy1: phy@fedc8000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc8000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY1>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_CSIPHY1>, <&cru SRST_P_CSIPHY1>;
+		rockchip,grf = <&csidphy1_grf>;
 		status = "disabled";
 	};
 

-- 
2.39.5




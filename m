Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B28C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXGz2WRYkb5YR3U/LDov8OvZiUYlL4TD2HwVbGHyw/0=; b=uaswHHjC4bdidv+k3upq5VXsi3
	LDDqeVBR6UFU6nm+cD90jA/zL7y0hJ3Bh+QtyyCai6c2xEyLhqEjZ6oVCdFLH+JhZcW7Dny2z7gG4
	xMMvYNJXsXEX4LxqYa+Np0xnIasQ0OPAj1KfOwmUEu3B6quPBuE53wx5DhSDmmfWrcI8ie65s7Goc
	2DUjBBvmbPLZ/PGWtcJ/lfJ0iGtqNxZVxsQdH4a5/nvTJZ1MC6Uhu/n+PloDNBs9e+m4psC6GcWKi
	4SjY1/2NVNBk8YYAnn7HQJSjYZw3P1s3jYo9WvzPxqzObGIGU1lb6pMst3bPyKF1sFVIGdZS2DOmT
	EWUwbGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVX3T-0000000GvbC-01He;
	Sat, 28 Jun 2025 15:01:23 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWs0-0000000Gu1c-46QZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:49:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXGz2WRYkb5YR3U/LDov8OvZiUYlL4TD2HwVbGHyw/0=;
	b=lM4DZ4KnoLlPPUaEu6usoxkV86zoUCnUScVx4Ekwfvf6GaaywSlu+IaZCE5OQvzkLhdz+T
	u25AI1cJxl6MhWgITj+BYHK5S8uJOkI2m/e75+YSKD4aY+Dxluj6tOusqg53Iy17drQD5y
	2HVXfhBHPwmOn2QmUOt1+tgh3urKoyJOuYvuDvSWgwjCppUP8YvvwNyP7DTAxU1QJoAu1Q
	Q7f7IfThfVXlFMn23s2WvcbUKLuu5uexiB4ejWJcbwZIs/j8+HgEHQVbosXkj1XeGmtogK
	4EP7oat5zIIDj41oHqKLcQBfw1PKHKM/Y990e8Vzuerr8WVgVtFONp855gIo/Q==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 05/10] arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
Date: Sat, 28 Jun 2025 16:32:39 +0200
Message-ID: <20250628144915.839338-6-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_074933_162669_B169B9EB 
X-CRM114-Status: UNSURE (   9.40  )
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

The only thing actually added here is a single endpoint on edp_out,
which is already defined in rk3399-base.dtsi, so it's simpler to just
reference that phandle, which allows the removal of several properties.

This fixes the following DTB validation warnings:

  graph node has single child node 'endpoint@0',
  #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 15 ++++-----------
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts    | 15 ++++-----------
 .../dts/rockchip/rk3399-sapphire-excavator.dts   | 16 ++++------------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index a9ea4b0daa04..9d07353df52c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -250,18 +250,11 @@ &edp {
 	 */
 	assigned-clocks = <&cru PCLK_EDP>;
 	assigned-clock-rates = <24000000>;
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 5473070823cb..5a8551d9ffe4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -404,18 +404,11 @@ &edp {
 	pinctrl-names = "default";
 	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index fdaa8472b7a7..a4ceafe6dd7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -142,21 +142,13 @@ sdio_pwrseq: sdio-pwrseq {
 
 &edp {
 	status = "okay";
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
-
 &i2c1 {
 	i2c-scl-rising-time-ns = <300>;
 	i2c-scl-falling-time-ns = <15>;
-- 
2.50.0



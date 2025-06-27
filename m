Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXGz2WRYkb5YR3U/LDov8OvZiUYlL4TD2HwVbGHyw/0=; b=3XJ/208KW+2vjPX0EY2xxna5gd
	b5+mBgJd47mOK2IJ87Tj1K6hvjWFNVDCJHUszEL4MADR3axGTXkkNcsH6KeJkqxtTSlNsb4gryAjO
	jVYzTNMlCC4vsqrXQtoNexrxrFagAS4d4p7ujfCEzLWWj0NY9PAbuS9gVkLlyH6q3GbPfobTX/Fn5
	3oDQSi30Im7xs7GuiqfcdAewdPb66LeLnSFw4rEtQuI4Tg+SJ3g6vYKjh9Yz1okmdWnMWj0FJ6Dfs
	lJ5zcHmrOocCS/XMgOTnlPiC+WzKGVAdHHRFo9tKlwqgOYj+R7vxCcM15FITuE+Qyja7Rc9EPAknR
	vHLZOZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBVo-0000000FCdj-1D4E;
	Fri, 27 Jun 2025 16:01:12 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAz6-0000000F6Bj-0Hh5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:27:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXGz2WRYkb5YR3U/LDov8OvZiUYlL4TD2HwVbGHyw/0=;
	b=WYjWtLAPsa84qr8TLl6/a43FKtMQF6EIt+yJ+P885vsWhhGvC9TE/HgprmqAW2o5kG0CsT
	4YA51B72OjN0XBiMP0uf3On45PEABr9dajocOrUXKVOvjAD45a4eCjVaiw9KONIFB8ew+a
	unEF/rBNw4RuRHJlD5SB72R4Gt62FJr4n60QYykIwbt+Bwne//5qJONKquT6c0UWtCQ1Yg
	6pYXn0sLgGlHRJd+X4as4HbAc6k6EKME+80LHeGiuwxmSe4pF2BZQmKi2vnOnaC0UDYodB
	NrCQUMFUa98FSk7pOyO9HA2aT+7SdDX88HD7NgTEBdCTgsjV0XvD7rvw2n6eVQ==
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
Subject: [PATCH 5/8] arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
Date: Fri, 27 Jun 2025 17:16:24 +0200
Message-ID: <20250627152645.740981-6-didi.debian@cknow.org>
In-Reply-To: <20250627152645.740981-1-didi.debian@cknow.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082724_250003_626A1FBF 
X-CRM114-Status: UNSURE (   9.41  )
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



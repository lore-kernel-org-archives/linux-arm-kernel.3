Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634C8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUQXXG/OoNFeiPmrkrtXeBIv4jnpdr/nIXR1GTpXOjU=; b=z12VS5c0dafUATzTqlcrM0kigx
	YiMR+JPJWoKbIcYIN+MjoHqGYc4HJuze3EoAgCUmQyZA6pKTjnrH0js1a26lNJq/WxqeASkRIrOFS
	IbTr1PdoXXcBihrxdVMHJ+j3mmcRGtMkEYVYp8v5meT78E033Z68/KoJWY1L3Npma22DwHCubYDb/
	tpWPw0jkNNkc+myLC8F1hJYiUCB3T2dIo4ZKcq7fxX7H/Otbmxp57vJIJk4Sin6Hcwj6iSawsIjmy
	HiEhZhXkgfiJ2v9Jw2vF21hYggnUtHbmw38TUUYiC0FxDXcPHRV4gEJoLp13xOhEMvff625g85RN1
	vX7Z4xuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAKF-00000004jVf-472y;
	Mon, 15 Sep 2025 14:37:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAKC-00000004jRr-2quJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62DF043E52;
	Mon, 15 Sep 2025 14:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625ACC4CEF1;
	Mon, 15 Sep 2025 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947020;
	bh=LaVVBqstrujneGbAzHLz7nrkIsdxKDKzrualI52ZIIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVs88B5yPRlclUwE4sdDfug96OsJwa/zEnVNdGpbhF5zYb68Ql2WhaTZABRcwSHKv
	 Zk9BU8nb9qRPHabu3/j47DThmakS/S1dxGaGrU+z/vwUqtlC506/ScQu9O75IblX4Y
	 7+QwCb3VH72OdO5JpBd2MiIcBLSTsYUVJRekL7Qd6HKC0I8nXzaV+To1d3giw6uJDt
	 dwTyz8u2kCoCaTSd3wQW79C42tsz1//NRN0ldFgfHqYDDHbHZM4Oa4IsVcwaBYVSGB
	 i0OSM9QX0sOFzq0Dlv8gaocWM8Sb7DYeMyINVOjTFakLd3sEEv/9LPSixot9k2QaMp
	 RwvKVaVQ2Sffw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: add GPU node
Date: Mon, 15 Sep 2025 16:34:40 +0200
Message-Id: <20250915143440.2362812-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915143440.2362812-1-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073700_746585_B39E74BD 
X-CRM114-Status: GOOD (  10.46  )
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

The J722S features a BXS-4 GPU. Add the node for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index d0cfd6821b18..d02f7fba327b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1232,6 +1232,17 @@ dsi0: dsi@30500000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;
-- 
2.39.5



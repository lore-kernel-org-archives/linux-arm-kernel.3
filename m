Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F06E6F08E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHTEIrlF/J5gLnuxeviWqwuo/78cmkpt/QaiQiwPmks=; b=syDR7J3xEShOItgrpe5RdO6qzS
	AnucgQY5XwPZMvzBsfboSYYLoD5hkTReuetwDG9cdglIwGQKzWNhoFEAsuQLdPn9XROAnt08lbSC7
	hibU2lzbe1W6DDc8H/IKWgydtlLJJnzm6P2yLIIfoTatO6sZ0SkFagojWRgRppgHhFAEi+E4e1E2F
	OtrKdmMfKRPGH8GaRzRo6TEnvGdXWYrVdGyL1ignjXk0i6s9oWvxyvJJmxZ0js67nNIA1C//Z1pJB
	lCYarrr3Ft5xGha8f2xEXlhvDzJbNl1cP5qCLxGiQdVya1BdZqrjEL3iGUcplRmGzPcFn4Pmx649v
	2m8wvqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nz-0000000FV5m-1YLk;
	Tue, 23 Dec 2025 12:47:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nx-0000000FV57-48QI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AEEB6013A;
	Tue, 23 Dec 2025 12:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788F3C116C6;
	Tue, 23 Dec 2025 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494077;
	bh=WXvLUt0Z4RKCNcS99dOC/TE9RwivHFDhbm9iqtxU6lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVkaDxA3FQ+242CPw9Nk3qyl6ju3owT7uVtIWKZwdNSeXEe1CYIUzK3BXk7U9MjrK
	 arUl9yXvURxfDeMoY6R/WsHSxOYqELoBj17bIGOXZeSGff2VY+2CTG113VuoHY7fym
	 0LIMDdgSvqGgwClsQuLb1ho//8eqrIx8j5lhMRRbUHYwfQSyuTySKvoNrQj9Sox85H
	 NcdcUg+HUED3thRKNCHinPVr5USJNFMA2xTb5BNkvIlBOftbMxzTpX9L/lK6hFSWZk
	 /A4gE99eQoL2W2a0HnZkhTo9db4WLu/U7MM1WaG1sasiE/9qFX1MGFS8DxM5oFUnFq
	 rU0meQQEZrisg==
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
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: ti: add GPU node
Date: Tue, 23 Dec 2025 13:47:15 +0100
Message-ID: <20251223124729.2482877-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 3cf7c2b3ce2d..a55e5108e7b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1110,6 +1110,17 @@ dphy0: phy@30110000 {
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
2.47.3



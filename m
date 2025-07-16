Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07039C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb3z+qEn9UACfDtS0crFvvXwNk6qsZYs9TxFM8Z+2Qc=; b=m2v5TzedpwHlzoD96HCheTOWQO
	sQYVkkcdaLGDql2eqY3J2uUZ0QUhcgITR8nWwFgmiPzwxWHF1xSiUe46zONIBtAuGCAJfXoBDW9NJ
	CJiUy+QmpBDKLGYdo3XkB4ilYuO2378zkagt65+HJlCreI2swjEyYF49N1DY5VKw8Th3vBcb16HcH
	76p+o8nEl5zTiReDlLsoe8sNXT2L9DIl6h92gWsra+8B88Jnl+Ru++3smcCuEVDfn3l3NEp1iGvgd
	EB/n09tuB6vDUctZpDg/6aGgrIkDbmHALFrceqB9t5xr/1hQt47hQO50GHEEdDEIPzXqAj04vhUf2
	p52qfcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2di-00000007qfW-3Bec;
	Wed, 16 Jul 2025 13:57:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2U3-00000007pf9-3Auc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F3DE450D3;
	Wed, 16 Jul 2025 13:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C0EC4CEF6;
	Wed, 16 Jul 2025 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752673663;
	bh=rdQDdI9JouSQXlopIgj0zTq8D4QW2KHFO3f9GHrlvrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/hiXrDMKTQO05nvgVSvUQAgzWP8ULEvvHhKJo+3ZDWK0YCUhDi/uoyNF+ngznSZ/
	 DcSEndLqgj70AVgNsiThGVM7FCWx8X4Eyay593WZUaf2YwXapEOr3p9acKsE+yWyVs
	 uX7ItNEO35RyrxwTE5tKmEo5gLqLQSr+ErY4FQIl+iGrfsOnG/acyciI2AP297H3Uy
	 xv0o1luCOglbDmxs5OBcpTQN5o9FEH+s01kTHYjYjV827XkWBvc+AMiqXVZDix8lAp
	 FgpDyfB85TffhRocGdU1pS3T4+GPacOwLmAWspoJZT9cP/9NPGO3o0fhI94mmTj/Bu
	 IbyM+UqBVYxwQ==
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
	Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 3/3] arm64: dts: ti: add GPU node
Date: Wed, 16 Jul 2025 15:47:17 +0200
Message-Id: <20250716134717.4085567-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064743_814895_DE80EB8D 
X-CRM114-Status: GOOD (  10.15  )
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
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 17c0949ac1d7..8f3d39d8004b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1229,6 +1229,19 @@ dsi0: dsi@30500000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 237 3>;
+		assigned-clock-rates = <800000000>;
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838E1CF8552
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0oHAXpgpHKqeUcvLWwVmNk9pBZmBZrMbOsgfGv/KYS4=; b=l9MuOR/W/UWVmIMRczs6PMrew7
	Vq+5FGc0YAbFriBvFJH5BmtiSoXHj0Fw8KOSXGEzcBYEoUX+RxiYi47zMqOTVwbA6rHC7UW6DGb4J
	+vhehYZcHPj/psJr/0GFvyikEh5HjJJaDOCgPi+MDTB6uhgI6ScrV2y61UQogkKIl2dCFhIWpVp0s
	g5AAZWESDr6i2RpRxO+jZPs9OukKBH7QVle63aDpY8JzwtP+DnlaKS0w9n6Bsfc2Tq2yHHU0xhlHv
	qsjAs4In52vZh7dnCRJ/WRrbZ5QinF+LmIBdUc0XMdb9SGA+AVkkeWxSVn/hr6f5+0Ecm9cxd7y7+
	DrjEnpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzc1-00000006K8u-1Axy;
	Thu, 20 Nov 2025 08:01:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzby-00000006K8m-0fmx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 08:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0164760149;
	Thu, 20 Nov 2025 08:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F30C4CEF1;
	Thu, 20 Nov 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763625708;
	bh=IbvTlEPSWrI8xGR6mXzq9RgMTipCj2oW/eR0lae9YdM=;
	h=From:To:Cc:Subject:Date:From;
	b=Bs0FekNPHGzqlwyYQheG2gdsdBW+bSbvQODePqzZUx09+Yg0eUR+WQYx3vrf6BBw6
	 plN6O5bCZI7aoUmOZOKHnKij4CK8fr6FVdsvqgIEXm0PHAag1F2Wg+DjkatdaC6ddL
	 eTRSZ7HUgmDPq6Ak1fXSIcGSzkBBe7XdGPftKh2yK3hBeHIzqQow3UCe2ApHv3TN6w
	 WnMPbaKr8Wce0ccjLbtMlSPeMU626R+Zju8+IVXxjuwqNTzCqiadnzIfaoPEODIHES
	 I40BV1LaOoP6gM/2J4UE14LET5d0lFjg99MWNbxUeltliBbPocTZ/fAFkpsVemPNV9
	 ekFY56iJIAWXw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: sa67: add build time dtb for overlays
Date: Thu, 20 Nov 2025 09:01:22 +0100
Message-ID: <20251120080138.2397851-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Since commit d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to
a base .dtb") kbuild will throw a warning for any stray overlays. Add a
new .dtb which will only be build if CONFIG_OF_ALL_DTBS is enabled.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8a2f0530e7cc..333edfc335fa 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -231,6 +231,8 @@ k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-sdcard.dtbo
 k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
+k3-am67a-kontron-sa67-base-gpios-dtbs := \
+	k3-am67a-kontron-sa67-base.dtb k3-am67a-kontron-sa67-gpios.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -285,6 +287,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-evm-pcie0-ep.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
+	k3-am67a-kontron-sa67-base-gpios.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
-- 
2.47.3



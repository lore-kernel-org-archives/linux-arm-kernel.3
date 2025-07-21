Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7096EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xdRpUkb59hPYj3kEu7Gas8PW1qqllLhl/3sruAzKY0=; b=k/RyjH9TWiV3p+Pi3OWkc6fbSY
	7bsejPwYUEfD2cGkkiZBgvinNKCGruSV95Trt8P/O7DoawDkMd0FKZLRjyDQFgCZhdv5N5Rwx+k+M
	K1D3XjcoomVEaXMd7EJKfuvuvAwWyrKrXFIDJOV2IDMIzWfxI8cAGN9899h4Sh1d3dNa2YIP1+ptr
	Zp4hTH9ODOHPHTXxayQXZB/1gQD1WA/wQYCTU4aaIt3C/NjDR3yDwENZQPPtiMC7AEIjm3LfAgZo1
	d93KpTcYYPjhfGUcIcyaTpceEY7tIhQoVDNRtJNxVk6HzMVzgXuxkjeM3QdMjpyZNcU1MfN4Dw6Nk
	Sz9L+yzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgaB-0000000G1kr-1Cti;
	Mon, 21 Jul 2025 02:48:51 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1L4-0yGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:22 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp03b1c7394fab565de9141858b1868864b9~UJDccB64h2083520835epoutp03T
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024614epoutp03b1c7394fab565de9141858b1868864b9~UJDccB64h2083520835epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=9xdRpUkb59hPYj3kEu7Gas8PW1qqllLhl/3sruAzKY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uu7zrEBIXaZS6VosTDdaWJ7UmNC/AyqwRHjNI2THW88dRjMzjMbizFwUyfQ/ANcgq
	 8HrEI87IJ3sMaSEQhTkoC7OS+2DrPD20zXjKcipZAaKKsGgAG83yGF9cR/tnaMlPf8
	 DDhBS33SfEw2a5iQ/oV0297x3MjcZDLTCj6oH/vc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p2178701927789dbdba7b20ded87e037ba~UJDbrOeBY2376923769epcas2p2b;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC82fq3z6B9m4; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974~UJDaAki2L2776827768epcas2p3r;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip297a1d6768ee8f430d3cbb41409f3f62b~UJDZ8EDVK1443514435epsmtip2E;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 2/9] arm64: dts: exynosautov920: add abox_generic dt node
Date: Mon, 21 Jul 2025 11:30:45 +0900
Message-Id: <20250721023052.3586000-3-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p37ecbc204ea695d97f6477c04712a9974@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_718490_FB38F22D 
X-CRM114-Status: GOOD (  15.84  )
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

Add device tree node for the abox_generic platform driver to enable
its registration as a platform device. This node does not represent
direct hardware resources but is necessary for driver initialization
and platform device binding.

Properties added in the device tree node:

- samsung,num-pcm-playback (uint32):
  Maximum number of supported PCM playback devices.
  Here, PCM playback devices refer to ALSA PCM devices.

- samsung,num-pcm-capture (uint32):
  Maximum number of supported PCM capture devices.
  Here, PCM capture devices refer to ALSA PCM devices.

- samsung,num-i2s-dummy-backend (uint32):
  Maximum number of supported I2S dummy backend devices.

The node is declared disabled by default in the main device tree source,
and enabled via board-specific DTS overlays by setting status = "okay".

This device tree binding document will be added under
Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml

to describe the node properties and usage.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..a870c0b6847f 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -86,3 +86,7 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <38400000>;
 };
+
+&abox_generic {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..4f086a7a79c8 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1126,6 +1126,16 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	abox_generic: abox_generic {
+		compatible = "samsung,abox_generic";
+		samsung,num-pcm-playback = <32>;
+		samsung,num-pcm-capture = <32>;
+		samsung,num-i2s-dummy-backend = <5>;
+		status = "disabled";
+		#address-cells = <2>;
+		#size-cells = <1>;
+	};
 };
 
 #include "exynosautov920-pinctrl.dtsi"
-- 
2.25.1



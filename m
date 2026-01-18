Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B2CA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqe4PbllTfgw4Q02xodLd6RTh+/U7Ogr9KsLmiZ0FFI=; b=KalVX6hKR0icWqySRZV2mIJLFq
	qclPuBKkAvqOMU2JAkVejCLiIRRsOay2qoLu+Xyif8Ihh7ncQBqm4224MfqVyzU47g6TqFFW3ZIdX
	FEG6sfFEZsmSb8We0Yid1pWpXLORe4CoyKOT2KopwaLjgjWUN56J3ou/c8BADXPDPqmqGHiGqmlXk
	aCd/nbV90vZyjOk/ibXUWFd4qSAX2FlAvbE7E8KcSJKFQOED646APNHvPY/BnWeXtjFE4hWIckhxh
	djmR7fmduKPzk/VWxakRVHAIEYPz2o/Hm+lmrZ7gn+m9+vpx40zDxX9DY7qS1clP2JLBMyJrLoO+a
	mpEbKgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBe-000000009NM-43WL;
	Sun, 18 Jan 2026 13:51:26 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBZ-000000009Kz-0Yk5;
	Sun, 18 Jan 2026 13:51:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dvFP013d5z9vGs;
	Sun, 18 Jan 2026 14:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqe4PbllTfgw4Q02xodLd6RTh+/U7Ogr9KsLmiZ0FFI=;
	b=PNF1NTZ9+Au46jOTwJC8vnbxGzoLbvXUdnCzTu2EgplkC51Tu4spYzOGBj0cvJU+fXKUtY
	XdF7EOoywC3g12Cge1EpDzFUv7MN5E3s1mXtlEoAy+RLYo9rneovEGtGH8XS/XUfdrKhnj
	rqNlIJcO4Iq5YJgCLJ/Yvaq31qrOWoxiaFJhum+DaHl3dLDp5JqDkYcuuGJi9PHtuu2N5Y
	GrWICyzgVZjc3LRDKMV3TxeNBGsGGOylNS/uHWGte47kwHDIR5CSb87Fa4IvtL9XSb9dY4
	XBOekkkz/LcubB6fk2rX8IH+bxuXXIJc/eygAke8GNrxxo7tHF3v2/j1vou7wA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqe4PbllTfgw4Q02xodLd6RTh+/U7Ogr9KsLmiZ0FFI=;
	b=grU0bNMjrbqClxoNJEiG03GKVw33SL+2zbBEpZgjRnlag/DPsUSWPZ7V3gi+eisRbxxfX8
	5fiS++l7ha/FLVsv5fT7wBytkDmfG37RKjsO0ZXkw/ieg1mCgfyVafmXxd0hnNnnUmIVTt
	oB9CFUs2bWduNwjlEVAqYcUbWOEkC9/WDDtu1dr9wLNU/eruTMhXF2RfbeqlSQImClllVl
	egu0RjT800o4YUNuVQQESRshOQIxGgxa1mAiskDWVIb72Vw2ZWoo7Wz4TxhGrNUhAm2dDo
	LiP3iPj/HyyKYUCv39MsEw//cp7Sxoo9P9Bd1G/gqdzuA+74zb4ps9qb0cy2Cg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:49 +0100
Message-ID: <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a7e0bc5619c45772485
X-MBO-RS-META: ibmwn9r77op8gd43ajeduq89keftzdx8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055121_379089_5ACF42CA 
X-CRM114-Status: UNSURE (   9.81  )
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

Add nodes which describe the root ports in the PCIe controller DT nodes.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 477cf37ab2434..fa702f87de6d0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2826,6 +2826,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec1: pcie@ee800000 {
@@ -2855,6 +2865,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec0_ep: pcie-ep@fe000000 {
-- 
2.51.0



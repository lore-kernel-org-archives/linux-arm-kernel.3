Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2FCCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGnEjjbaS1OmPNQ8V5HQyZUVH5+J/3jA4HeWoaYuixw=; b=NZmE+YXJkfTj1Hn9aYKpn6ql0Z
	eBIOoxUHLCumOd4p+KUcOTDeycSZbiZXN9q9ugH++GulMqWroffdY2pNyt5TSc2PGb0g8WIbLJvJt
	grMuqd5BYCVwdqM4ZeqroFN3t2OtcnOLTsdSUy7TV01bCG2PSiYEKbukqva1y1fgFhxX3M7icbU1A
	7ZYdgPU4J5PjZXMD1VkbGZFKshAS1lUxk+k9YS2GLKKWmkSJlEtYbIP+ovgaY2dr1bRP1Derk7ZBf
	rSo2NcUjseE53HoAHm8I9l/Q6mzoyd9QuMNUH6q5AutKHAHBeZsxCzzCzUzHF9N4rn3a9wVcNYaqc
	TW5aabhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYn-00000002Oua-2PgT;
	Fri, 05 Sep 2025 14:37:05 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuU8E-00000001DIu-2faN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:57:29 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250905105715epoutp01d749acdae539d21a4bff2ed16316040f~iXbTZ-Hnt2761827618epoutp01b
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 10:57:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250905105715epoutp01d749acdae539d21a4bff2ed16316040f~iXbTZ-Hnt2761827618epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069836;
	bh=lGnEjjbaS1OmPNQ8V5HQyZUVH5+J/3jA4HeWoaYuixw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zaby/7yiaFcQrKx54lHPtwy2b1avPMjshfxTOgPuSP3xI77v9frni0pNLIsSsZ/1Z
	 RPKLKuFAb3jJ3WQ5GRFU2hlQmQ3rpFfxdNJ9fTrImlIR6g7fxDWF+qlddMua0iAFtw
	 76zqHRQLTMRwKcuT4nugaJZKl2q4S5U4bccy5GCE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250905105715epcas5p3525197234eca0bff4fb9264d60431b2c~iXbTFLUet0553305533epcas5p33;
	Fri,  5 Sep 2025 10:57:15 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cJCwV4gwGz6B9m9; Fri,  5 Sep
	2025 10:57:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250905105714epcas5p4bb26e232702a9dff37e87dfd07da3946~iXbRtr0H72481624816epcas5p4E;
	Fri,  5 Sep 2025 10:57:14 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105712epsmtip2945c1e7aa059913f7664206cbb887168~iXbQHHdeh0831308313epsmtip2U;
	Fri,  5 Sep 2025 10:57:12 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v3 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Fri,  5 Sep 2025 16:35:54 +0530
Message-Id: <20250905110554.2212304-4-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105714epcas5p4bb26e232702a9dff37e87dfd07da3946
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105714epcas5p4bb26e232702a9dff37e87dfd07da3946
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
	<CGME20250905105714epcas5p4bb26e232702a9dff37e87dfd07da3946@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035726_991267_D7F9215A 
X-CRM114-Status: GOOD (  14.82  )
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

Add DT node for on-chip RTC for ExynosAutov9

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index de2c1de51a76..5f5167571f7a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -106,6 +106,10 @@ &pwm {
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &serial_0 {
 	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 66628cb32776..afa6b258153c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -1633,6 +1633,16 @@ pwm: pwm@103f0000 {
 			clock-names = "timers";
 			status = "disabled";
 		};
+
+		rtc: rtc@10540000 {
+			compatible = "samsung,exynosautov9-rtc";
+			reg = <0x10540000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.34.1



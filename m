Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F30C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQQif8BnhaNVq6Q/a8Q3DYVnyJXRWSFrD2QEhPIZrBw=; b=IKRbspXAGVJeDAMqy4TD8ARM5x
	0e7vUsP2Wlkym4Qpco0K7NfeDrYgIv/K3Ax85fucS6+sKYHutgSqOfmSGMV999SSqrfFr1B0g4YjK
	rTiwPx99jl/ibpy404j4jHvuBcE4behV47OgU37iJ69AO7HD3JEMRi/sh/rT0DXHgKfJYp89xVkJR
	O1VI8Jxg0APmtghuLVtapmE6W7KX6AdKf5aITITa22kVBJMvQGo4Zz7ttR9DqtFCmZs+rESwxvanC
	dRCbYFJDbAn0wMvYlT2wdtiSy2SnWzsb4+X7ihQJwUW247pRv1OpqRT9G9TXGWU2N8rgvh0DpnXu0
	5LWR5mIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ644-000000058dl-1qIj;
	Tue, 08 Jul 2025 11:00:44 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5l8-000000055Zi-3iH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:41:13 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250708104107epoutp01ee445b322fb6f4a4b84e06d4e41adcae~QQJXqb8NK2785027850epoutp01I
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 10:41:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250708104107epoutp01ee445b322fb6f4a4b84e06d4e41adcae~QQJXqb8NK2785027850epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751971267;
	bh=yQQif8BnhaNVq6Q/a8Q3DYVnyJXRWSFrD2QEhPIZrBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLUU/57INvp0UdSWXgD8QlTtEdLD0TjLUPu8JbI9rizCHBq1n9I+dMkDfYpEgs/6F
	 ed7kAc/QMOUaYKYpQfuDDq+Ht+fiERdfqceW3FsLmrTP2Im6g19MirmSEm6S6fhGKO
	 y2gHSmvP0weVl2q9SCHbqnSJW8ua2TUTPxNTTHM4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250708104106epcas5p4f80114851e1609d1f2f7ceb0c1fa7212~QQJWK9yyp3037230372epcas5p4b;
	Tue,  8 Jul 2025 10:41:06 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bbyM41ZZqz6B9m4; Tue,  8 Jul
	2025 10:41:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250708103243epcas5p2d8fd5bf02e64e104eca3def802813230~QQCCNA-B31542215422epcas5p2D;
	Tue,  8 Jul 2025 10:32:43 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103240epsmtip125db38a216aac73a68a1e95d29162d5e~QQB-mXXWQ2131121311epsmtip1o;
	Tue,  8 Jul 2025 10:32:40 +0000 (GMT)
From: Vivek Yadav <vivek.2311@samsung.com>
To: pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	mark.rutland@arm.com, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, linux-fsd@tesla.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vivek
	Yadav <vivek.2311@samsung.com>
Subject: [PATCH 5/6] arm64: dts: fsd: Add PPMU support for MFC block of FSD
 SoC
Date: Tue,  8 Jul 2025 16:02:07 +0530
Message-ID: <20250708103208.79444-6-vivek.2311@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708103208.79444-1-vivek.2311@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708103243epcas5p2d8fd5bf02e64e104eca3def802813230
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250708103243epcas5p2d8fd5bf02e64e104eca3def802813230
References: <20250708103208.79444-1-vivek.2311@samsung.com>
	<CGME20250708103243epcas5p2d8fd5bf02e64e104eca3def802813230@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034111_240033_758052B3 
X-CRM114-Status: GOOD (  16.67  )
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

Add device tree node for PPMU instances in MFC block and
enable the same for Tesla FSD platform.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  8 ++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 8d7794642900..f543c7dad7cc 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -110,3 +110,11 @@ &serial_0 {
 &ufs {
 	status = "okay";
 };
+
+&ppmu0_mfc {
+	status = "okay";
+};
+
+&ppmu1_mfc {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..7b6e7d81be10 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -970,6 +970,26 @@ timer@10040000 {
 			clock-names = "fin_pll", "mct";
 		};
 
+		ppmu0_mfc: ppmu@12840000 {
+			compatible = "samsung,ppmu-v2";
+			reg = <0x0 0x12840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_mfc MFC_PPMU_MFCD0_IPCLKPORT_ACLK>,
+				 <&clock_mfc MFC_PPMU_MFCD0_IPCLKPORT_PCLK>;
+			clock-names = "aclk", "pclk";
+		};
+
+		ppmu1_mfc: ppmu@12850000 {
+			compatible = "samsung,ppmu-v2";
+			reg = <0x0 0x12850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_mfc MFC_PPMU_MFCD1_IPCLKPORT_ACLK>,
+				 <&clock_mfc MFC_PPMU_MFCD1_IPCLKPORT_PCLK>;
+			clock-names = "aclk", "pclk";
+		};
+
 		mfc: mfc@12880000 {
 			compatible = "tesla,fsd-mfc";
 			reg = <0x0 0x12880000 0x0 0x10000>;
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 05:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmqMtJNrFtzSEf/7j5AmJKS9QXgfr+PbsuXopig7LdI=; b=Cq9VJWnqmYU9lj+YKn9q/o8yx5
	4rAWI8qjBj28YHq3I/NMBrFfWlWgEUK4WElq+TOadIuBmj1pOTlmVXBlJriqwikcFuyZbE5OlbHXP
	biKFt/HAWUDP9Y+yNBzne3RbXKbghtfazhUjsSkyTkeeCQBeWBzXsewo5rQqERnZbF+RFFZcGqk9l
	35UrQrL6SRNisuOY8lzWTQuP5i/bg20BfTkaYYzVjtLQXxfdupS5QVEW+IPAZz5nVo/VW0xfNJgsh
	gkC8k7cH3SD9iKY/VL1xmNfLtiEzdibgAjFNNfp9i3mnMesubcevI5oMDF0zcbORQ361UGgA83bFG
	yOtGfMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Un-00000002p6C-1Mek;
	Mon, 15 Sep 2025 05:11:21 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Ui-00000002p3N-2dt0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 05:11:20 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250915051108epoutp033f6fb88411ee2a8101092e63f6d3dd7a~lXJ88DSJx2593625936epoutp03t
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 05:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250915051108epoutp033f6fb88411ee2a8101092e63f6d3dd7a~lXJ88DSJx2593625936epoutp03t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757913068;
	bh=qmqMtJNrFtzSEf/7j5AmJKS9QXgfr+PbsuXopig7LdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiZkmvwe8V7Z02jiyiP6KDXZImnEjRU6RlgmLFElerxuTKKzowFtPjq7+0EdojUN2
	 j4DNah1pgjbVytIIOVtQV//RaomPVraUFG+iZ4Jqe+zhrEQx1Ch5ix+62JIV5TWYTd
	 abhAc7BS7+Mi2WJnju5LO9j8fcfNgdzl10sJjBVc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250915051107epcas2p3a1ed106ddcd5760e4396e66b59d975af~lXJ8JG-xt0284402844epcas2p3U;
	Mon, 15 Sep 2025 05:11:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQCmW0kVNz6B9mB; Mon, 15 Sep
	2025 05:11:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61~lXJ674Us-0246002460epcas2p3m;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915051106epsmtip11720c0cdef36e4498c987188846be9e2~lXJ63Fhuv0849808498epsmtip1A;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
From: "myunggeun.ji" <myunggeun.ji@samsung.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>, kiisung lee
	<kiisung.lee@samsung.com>, "myunggeun.ji" <myunggeun.ji@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynosautov920: Add DT node for sysMMU
Date: Mon, 15 Sep 2025 14:13:20 +0900
Message-ID: <20250915051320.3378957-3-myunggeun.ji@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61
References: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
	<CGME20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_221117_156321_54088FD2 
X-CRM114-Status: GOOD (  12.48  )
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

System Memory Management Unit(SysMMU) for dpuf also called iommu.
This sysmmu is version 9.0.
DPUF has 3 dma blk, each channel is mapped to one iommu.

Signed-off-by: myunggeun.ji <myunggeun.ji@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..ec3dc77b46bf 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1494,6 +1494,27 @@ cmu_cpucl2: clock-controller@1ee00000 {
 				      "switch",
 				      "cluster";
 		};
+
+		sysmmu_dpuf0: sysmmu@18040000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18040000 0x10000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpuf1: sysmmu@18440000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18440000 0x10000>;
+			interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpuf2: sysmmu@18840000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18840000 0x10000>;
+			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
 	};
 
 	timer {
-- 
2.50.1



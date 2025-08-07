Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BACC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioc6BaEAneSnl+Cdv2fwifMYhZKSVyPMsPMvf293bv4=; b=UznalsECZ9msbBvx+fCQKBIBQZ
	ZjrVE1fwSj2nnmuoabzlbxGYi+ilBGFlnyH0z3qfi/I3YxHYYvUSNmgOnzIBCpZ6UjQxmwzmHR+yQ
	EvNx7sLxMZoof3NpqFiDWcyso6ZqFt9nZpTuOXinpGw0BHYaKUaxo0mwu2v/CUhmekaj8etCfnzTV
	dTwzEg1dFo8tFaOQn3z4CpRFgZz7fPSeZZ+xlG1az4uk1y5/Hed35zaSoKoqlawCUjcU/f+S+E2jB
	hrIGx0sVLVCqbhuTQkBWnRq/qf0EwddMmBCGit9aV1+m6wrdfL/YEWiTSgUC3d5EMB++yBur7FkkJ
	xjvFNRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyI5-00000000Ij6-3tSx;
	Thu, 07 Aug 2025 10:56:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyD7-00000000HpQ-24Fu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:51:04 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105052epoutp0435bfdea272b8a2f7e979d7c027bee0a0~ZdocT1sqq0205702057epoutp04R
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105052epoutp0435bfdea272b8a2f7e979d7c027bee0a0~ZdocT1sqq0205702057epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563852;
	bh=ioc6BaEAneSnl+Cdv2fwifMYhZKSVyPMsPMvf293bv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LP/OfGQxcXE2D4Qns7gmK8vdu7x64LFH1trgS4uByFWqnsBt7oUCjaX30kJ4YgcCk
	 8eX376fABstAVms/EpvoED2P6OHWA/GLWpHshmRDYhJbZ9BMEGF4TUDwPWhh2mrZRX
	 51ILpTWyZ8tC0N83ZZ8p/eRXuXnjIyGgNXgRQ+Pc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807105051epcas5p42b0c95f525547338291284002c134f6c~Zdob1frPR3070930709epcas5p4q;
	Thu,  7 Aug 2025 10:50:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8V5RdKz6B9m4; Thu,  7 Aug
	2025 10:50:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba~ZXjPWFEUQ0696906969epcas5p3B;
	Thu,  7 Aug 2025 03:25:06 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032504epsmtip2ff987802e05ceff0bc5f5af8cdfaa31e~ZXjNXG3TE1491114911epsmtip2V;
	Thu,  7 Aug 2025 03:25:04 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 01/10] ARM: dts: samsung: exynos3250: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:40 +0530
Message-ID: <20250807032449.92770-2-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035101_683264_4E1E51E0 
X-CRM114-Status: GOOD (  13.42  )
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

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250.dtsi b/arch/arm/boot/dts/samsung/exynos3250.dtsi
index b6c3826a9424..1fd99c4ccca8 100644
--- a/arch/arm/boot/dts/samsung/exynos3250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos3250.dtsi
@@ -657,7 +657,7 @@ gpu: gpu@13000000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,exynos3250-mfc", "samsung,mfc-v7";
+			compatible = "samsung,exynos3250-mfc", "samsung,exynos5420-mfc";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "mfc", "sclk_mfc";
-- 
2.49.0



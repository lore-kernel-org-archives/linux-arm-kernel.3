Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE5CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPtZ58ERtJV4rrW7KCBL7kaZgXIToED8nobTPIsau4A=; b=hbfcZV3Qlev+fJ+IFB3aeIfRjE
	0t1lDNBCBlzfoT7J6RhlGBq67eVXoS+PW8y/Zms3nd3jLo++8C5saguzw4yq95Mcl4VmEtRfBwWgB
	uZ8Vb9GBieDe8bDgUITKJq0CMZXagi/yf2IAxhYeg2rPkI9aYhBAKmZs6ga01Lq7Y0UVDPKunVVE2
	90PRTlpBNpaD5YjxjaqzDQzpB0/tWqKkX0LPNG/za3MQla4CMjCgg95BvuB6bEXKHbxHMQQFmo/+8
	A4XYb4p4kjC/dW8chqxBcQ5SHuINEO5f0dGPkIOJ3ZUteLCZv/ODUTXXhOAa5P4g7dAqMcT75W7at
	mByosIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyKY-00000000J3v-0Dh0;
	Thu, 07 Aug 2025 10:58:42 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyDA-00000000Hq5-1U6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:51:06 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807105057epoutp02b6842cd5f8914c9163f9ef9629ef845a~Zdog9b-st1624516245epoutp02W
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:50:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807105057epoutp02b6842cd5f8914c9163f9ef9629ef845a~Zdog9b-st1624516245epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563857;
	bh=FPtZ58ERtJV4rrW7KCBL7kaZgXIToED8nobTPIsau4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rutD1znqXFvYB3upaZIMHVGrGPz7Txifv/kuVrGap8cCnILqNnEC9/aZApT1fdEfy
	 fpHBAsz7sTOnilCbmGGAwDVlbCBUTn9PqOP5cdKvSNJahxKdREDSsIiRQjWeA2mNTt
	 4Ap49P9iDm90egatHf4tx3vONoFJ3rWAsehjWCbY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807105056epcas5p4af44a3b26818f504c0226fa780910a28~ZdogSbunP0998009980epcas5p4q;
	Thu,  7 Aug 2025 10:50:56 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8b4fl9z6B9m4; Thu,  7 Aug
	2025 10:50:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80~ZXjRgDILX0818708187epcas5p4d;
	Thu,  7 Aug 2025 03:25:08 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032506epsmtip218d2a9395a8da0b379396b6dc7d53467~ZXjPivwkQ1697916979epsmtip2V;
	Thu,  7 Aug 2025 03:25:06 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:41 +0530
Message-ID: <20250807032449.92770-3-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035104_541172_080A3793 
X-CRM114-Status: GOOD (  13.87  )
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
 arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index ed47d0ce04e1..a2f15fbe98cb 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,mfc-v5";
+			compatible = "samsung,exynos4-mfc";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_mfc>;
-- 
2.49.0



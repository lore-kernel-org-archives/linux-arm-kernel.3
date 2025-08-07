Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4K00fqUKSMf1320Zsxlq3La5Bqwytr3BaKcuXPCcBU=; b=HorUyDCzinjlP4RTzZD3ZTmgWG
	IBs1z5AeF5aOMNZ6nBs/PcYQOhKT7tNc8eeX8qKgHUn5+odMYQG8MWPyR6l2byqUvqY5lsSmvuAIq
	nSJAUVhFDWHpLK0qCaf7N18VP8USnWn1zOVWNe7WjEafAXzgEjnIhPHeqOkV801rFmHZVdeVj9kbf
	SMGAKeg/k/RkoCg7jMZ9AOZ1DykhoCeTmWv6+G4r+LhkPvG15F7LrR0leUc5rAq0OaN/wC5bSmul+
	s+y1lnmWEgGwq+gJ2MXTD7f1zKCDUnDy5ui15uW16EggmB4HJwf3GVSedqsGTWaoguEJK3JTpkYho
	SBSiUjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyPS-00000000K5a-0A2V;
	Thu, 07 Aug 2025 11:03:46 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyDK-00000000Huz-3vSK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:51:16 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807105112epoutp03fa389ff6f30f4a43249fb5dd846f99f3~ZdovZRy3H0649606496epoutp03k
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:51:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807105112epoutp03fa389ff6f30f4a43249fb5dd846f99f3~ZdovZRy3H0649606496epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563872;
	bh=x4K00fqUKSMf1320Zsxlq3La5Bqwytr3BaKcuXPCcBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+2WVpSCa86pG8hkxebYCpwnKUEQYiMKb38RV/oZ1reabXRlnUrzQhXLAPAttFiEX
	 9hnRAUVmELK4Egy+0XkvQcVnI7SVoqkdtULqWXru+PTivSfVSqlk3GEsu0/kYRYJuA
	 S1mYC5EGosAzq6NcxGRSnE+Nwacyr6prGT+fb99g=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105112epcas5p1e82eefc1a9bf77cae9c44eff3067544e~Zdou9mp1Y0067900679epcas5p1G;
	Thu,  7 Aug 2025 10:51:12 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8v36C8z6B9m5; Thu,  7 Aug
	2025 10:51:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032513epcas5p224dc2883dff3610770140af0f93354cf~ZXjV440Ou0047300473epcas5p2V;
	Thu,  7 Aug 2025 03:25:13 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032511epsmtip27f6d1df53d9a5dc8ec815551528afc37~ZXjT65V3n1491114911epsmtip2X;
	Thu,  7 Aug 2025 03:25:11 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 04/10] ARM: dts: samsung: exynos5420: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:43 +0530
Message-ID: <20250807032449.92770-5-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032513epcas5p224dc2883dff3610770140af0f93354cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032513epcas5p224dc2883dff3610770140af0f93354cf
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032513epcas5p224dc2883dff3610770140af0f93354cf@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035115_128876_A45C8E8C 
X-CRM114-Status: GOOD (  13.49  )
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
 arch/arm/boot/dts/samsung/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5420.dtsi b/arch/arm/boot/dts/samsung/exynos5420.dtsi
index 196c6d04675a..31738350b522 100644
--- a/arch/arm/boot/dts/samsung/exynos5420.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5420.dtsi
@@ -299,7 +299,7 @@ clock_audss: audss-clock-controller@3810000 {
 		};
 
 		mfc: codec@11000000 {
-			compatible = "samsung,mfc-v7";
+			compatible = "samsung,exynos5420-mfc";
 			reg = <0x11000000 0x10000>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_MFC>;
-- 
2.49.0



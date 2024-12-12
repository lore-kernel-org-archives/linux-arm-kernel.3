Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D84E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=18tjd2ktEzJYa4dH82gKDc5oU6OSnSI0zl/xqkXqmVc=; b=t09kfyut+SEbFn8xaK2OkJx+zU
	10tjMDjMSqtv/Ba4MVOCuLbPBKItlHJgcVi0GrrMh4pT3yVl7WofEATwWqGajX9AfIjfeGj2cBu9t
	y/5papNJJatBg0Z+qcDuH9Le1rWBLHbdFbcSiMGBepZENSvRLuiqtQo+Lkh7fUSIc6yFkdYRqgLsS
	HDlFWlueUN+8XGcuRXCCpahqNoPSJnO+DCCnFVxP+hyqvlhMhPKoyd1/yHqCgAChv67U8C8CJ+qxO
	mEuj9h+UNAtKNPOSw44dHLATdKu6FrdwsZtn7Il3HSegOaaAcJJ+Oi/07UGm/KsoTGAxNgTWMHHLl
	lXEA5LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhr2-00000000IgJ-47xp;
	Thu, 12 Dec 2024 11:59:40 +0000
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhpv-00000000ITV-1Mqd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:58:35 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241212115819epoutp0470f6463729861c05c668f011f1b316e6~QbBZE9Al12394123941epoutp04N
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 11:58:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241212115819epoutp0470f6463729861c05c668f011f1b316e6~QbBZE9Al12394123941epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734004699;
	bh=18tjd2ktEzJYa4dH82gKDc5oU6OSnSI0zl/xqkXqmVc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hymluluvocD1YLWPrrXkBwuG/2z1ltWUjTC13ImRMFbVIYPNmTgG0iY9mMMbr3Pqt
	 4JHEvDV2J3bhk5RErZP3/L9sJuev64K6xD1pMMBdedR/LvJ/n6RWZ+8mQdJJZC+20C
	 B6BtDIdAJMNNCGaJJS4WH6RMCaI6rG87FkWz4/Js=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241212115818epcas5p240624ef4524b5d60c11e21d69d1d6ba0~QbBYdfkN_3230132301epcas5p2S;
	Thu, 12 Dec 2024 11:58:18 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Y89w808wqz4x9Ps; Thu, 12 Dec
	2024 11:58:16 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.1D.19933.7DFCA576; Thu, 12 Dec 2024 20:58:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3~QbBVXmNp42730227302epcas5p2y;
	Thu, 12 Dec 2024 11:58:15 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241212115815epsmtrp21d8fd2d891ade87b352b3d22ff21b372~QbBVW3Wgv3179531795epsmtrp2M;
	Thu, 12 Dec 2024 11:58:15 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-25-675acfd7ad71
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	50.53.18949.7DFCA576; Thu, 12 Dec 2024 20:58:15 +0900 (KST)
Received: from INBRO002811.samsungds.net (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241212115814epsmtip2d9d9e373a3c13c47b871fba95f50445d~QbBUEv6eB2581925819epsmtip2n;
	Thu, 12 Dec 2024 11:58:13 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
	rosa.pila@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Subject: [PATCH v2] arm64: dts: exynosautov920: Add DMA nodes
Date: Thu, 12 Dec 2024 17:27:05 +0530
Message-ID: <20241212115709.1724-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmpu7181HpBv9mW1k8mLeNzWL+kXOs
	FtduLGS3eDnrHpvFpsfXWC1mnN/HZPF/zw52iy8/HzA7cHhsWtXJ5rF5Sb1H35ZVjB6fN8kF
	sERl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAXaGk
	UJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpM
	yM74f3Mmc8EniYq1e3kaGNeIdDFyckgImEi8/DmHqYuRi0NIYDejxJwLr6CcT4wS7f+7WSGc
	b4wSM552ssC0tO9byAaR2MsocXHqPnYI5zujxN5d7xlBqtgE1CVm3jgC1iEikCExZ+sjVhCb
	WaBWYsnPj2A1wgK2Ev2TnrOB2CwCqhK7Hn8Eq+cVsJR4vfI3I8Q2TYm1e/cwQcQFJU7OfMIC
	MUdeonnrbGaQxRICp9glpv++C3Wei8SFlilMELawxKvjW9ghbCmJz+/2skHYPhKTj34DWsAB
	ZGdI3FkLDQx7idULzrCChJmB9q7fpQ+xik+i9/cTJohqXomONiGIalWJU42XoQZKS9xbco0V
	wvaQuLvuHlhcSCBWYu20pawTGOVmIXlgFpIHZiEsW8DIvIpRMrWgODc9tdi0wCgvtRwelcn5
	uZsYwclPy2sH48MHH/QOMTJxMB5ilOBgVhLhvWEfmS7Em5JYWZValB9fVJqTWnyI0RQYqhOZ
	pUST84HpN68k3tDE0sDEzMzMxNLYzFBJnPd169wUIYH0xJLU7NTUgtQimD4mDk6pBibNg/I3
	Xm49OHnWPGYNtS1nw5j2HpIT7mzyTHmroHdu9THmeGGTaRe7Nn3iujJvIeMPPo/YFSEfDrsd
	k3l82E5yO7/OMy/XnY9vcU5umeiwhkNPzOmAk5wzg/uVvyfNywOrL33eweDz9fwlrTyBIw1b
	Syrr2zkOc2ernjuVEMW9Ji7n20P+nZ27GZqMLN33fbl/7urmj3urIp+9mWgwVTLyyssA4/bI
	k1fm3H3S+ne1lOrLUk+tMHcrkeLjh8ITvA5KsdgdYT2wfads4u2Fm9t6ZtZd/Ju0xrChu6Zx
	yyTLX5wq5/ZZHd3fZ/HzhHSr0o1snvDG9ftVPuxvTfe5cexayN6zz0tFfi/a/yRz8ml1JZbi
	jERDLeai4kQA8QVF1AcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvO7181HpBjN6RC0ezNvGZjH/yDlW
	i2s3FrJbvJx1j81i0+NrrBYzzu9jsvi/Zwe7xZefD5gdODw2repk89i8pN6jb8sqRo/Pm+QC
	WKK4bFJSczLLUov07RK4Mv7fnMlc8EmiYu1engbGNSJdjJwcEgImEu37FrJ1MXJxCAnsZpR4
	s3sjE0RCWuL1rC5GCFtYYuW/5+wQRV8ZJeZ9agUrYhNQl5h54wgLiC0ikCPx4kwTE0gRs0Aj
	o8SO+R1gRcICthL9k56zgdgsAqoSux5/BGvgFbCUeL3yN9QGTYm1e/cwQcQFJU7OfAJWwywg
	L9G8dTbzBEa+WUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECA5SLa0d
	jHtWfdA7xMjEwXiIUYKDWUmE94Z9ZLoQb0piZVVqUX58UWlOavEhRmkOFiVx3m+ve1OEBNIT
	S1KzU1MLUotgskwcnFINTCIVPLwyaxxElsv0rpI5w+a9cMq/j2z+jTc+uPZfPfD/xiT+52aP
	5HIXCLAVxZ4sXnrMdLJ4B9tK522/rjiFaAo+iVp80vuVtLpMe3xE2HHF7zrMk1exP0iPmDA3
	+MLKlqVW2jE3lbMnrttR1Jyz7NxUx+6uX9dFU5ZaLM+4Ve0Vp9ndqR1fWftSsFNLUFCIO0Hk
	HmPR+kMi7tq3I4r72accuHareYr1wa8zz85azrH91/PH5nPOTjx8bo8uk27+i6wMU6mZPTF8
	UmnnrPJWKW2LPKX9aGa1QmdlpvvB09zPzOZoisbP2HHgi3T73tzHyj/1ZRJFPJKmv3MSn5kc
	kqQsdepyzu8lf+fZKFQGKrEUZyQaajEXFScCAEO++sHBAgAA
X-CMS-MailID: 20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3
References: <CGME20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_035832_022869_B5EA58C3 
X-CRM114-Status: GOOD (  13.44  )
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

ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
(SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
Add the required dt nodes for the same.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Changes in v2:
- Fixed review comments from Krzysztof and Tudor as below,
- Fixed typo s/adds/add, s/node/nodes.
- Changed DMA base addresses to lowercase hex.
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20241204122335.1578-1-faraz.ata@samsung.com/
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..dd984dc2bdcd 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -193,6 +193,69 @@ gic: interrupt-controller@10400000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spdma0: dma-controller@10180000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x10180000 0x1000>;
+			interrupts = <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		spdma1: dma-controller@10190000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x10190000 0x1000>;
+			interrupts = <GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma0: dma-controller@101a0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101a0000 0x1000>;
+			interrupts = <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma1: dma-controller@101b0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101b0000 0x1000>;
+			interrupts = <GIC_SPI 915 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma2: dma-controller@101c0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101c0000 0x1000>;
+			interrupts = <GIC_SPI 914 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma3: dma-controller@101d0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101d0000 0x1000>;
+			interrupts = <GIC_SPI 913 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
+		pdma4: dma-controller@101e0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x101e0000 0x1000>;
+			interrupts = <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+
 		cmu_peric0: clock-controller@10800000 {
 			compatible = "samsung,exynosautov920-cmu-peric0";
 			reg = <0x10800000 0x8000>;
-- 
2.34.1



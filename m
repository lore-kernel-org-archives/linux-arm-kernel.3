Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIIh+RNwzrD2SWtoiNYwjSlCZ+91/tIwejowRxgZB/0=; b=pU33y35n0xKSsTgX79h3HuhVQ1
	oURFqiD06VcZX3CempiSlaKlyh/Ax7O+y4jvcZMsMH8Y0RcgSrGmjCVB5zzWOQDu+ofy2NWIE+6dL
	BEP6njLIXXEwYUH2lizzKXMtWYZpwA41nA9mzAH/QcVrg97SVNupfYqFVaIhwSjHi8E5sIlWrSppe
	FDsmnybYIOSeSmMcK+xSQuIt5R9mcO5r55xOwMPhgdsnVFa4Sb1mIDe0eOwQJk8AK0lEVcy1P8P/0
	Crvjk8snhh/G+7VMWaEbGNNF4Obi1diMv+myr9ErHqALFPmItKUskTi57s3W/4N41wK1wwMxBDM49
	8sQTgo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uns1y-00000006WFV-0NFy;
	Mon, 18 Aug 2025 05:03:38 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdX-00000006Ti3-0tEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:38:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818043821epoutp0359e5cf7439711f48259cf72ba64889ca~cwpVcy4Ka0975209752epoutp03B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:38:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818043821epoutp0359e5cf7439711f48259cf72ba64889ca~cwpVcy4Ka0975209752epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491901;
	bh=pIIh+RNwzrD2SWtoiNYwjSlCZ+91/tIwejowRxgZB/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cp2HdVw6FMh5MWfVuvUL1/lvwlfLFBpiAtH5gBgbnAodyIdlpOmoxkzMkFIbn8MYs
	 XpzPxgHwABp88QJG/B1uoXkltKGRmUyZbOYWm7UT8z91zNuuOOgjdPd6cDE7LkJE71
	 zbGvTAB5pX9oXczOpagLqStumF/ntjKf3rSUiUOk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043820epcas5p485bd22b98432d4e3bab33109e3307f58~cwpUyFQIE3042630426epcas5p4u;
	Mon, 18 Aug 2025 04:38:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50Mb5Lmhz6B9m9; Mon, 18 Aug
	2025 04:38:19 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141057epcas5p21ca33641e42164886dc1bf404237876d~bp4Ihcefq0720407204epcas5p2a;
	Thu, 14 Aug 2025 14:10:57 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141053epsmtip2b31baf764fde081c646d3e1c84b1b4d6~bp4EsmoYH1850318503epsmtip2S;
	Thu, 14 Aug 2025 14:10:52 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Thu, 14 Aug 2025 19:39:42 +0530
Message-ID: <20250814140943.22531-12-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_213823_407139_DEEAA24A 
X-CRM114-Status: GOOD (  10.71  )
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

Enable CSIS DMA driver support for FSD based platforms.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..7f7e1fadb74f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -878,6 +878,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
+CONFIG_VIDEO_FSD_CSIS=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SUN6I_CSI=m
-- 
2.49.0



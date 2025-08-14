Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC91CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IifKKYa4gU4DS2kIv1xGxa91TOJORg9sXPh7k3X+Zd4=; b=x/B+PstVRcPgo30ARDGfQQhVhq
	OpFPb6lQnsAyUXw/yP4yvOpAA/NPTjlG0Dj1zHjNY0eftlwgIS3ear0lX2NGTg72rVYTcxJ7oBxhu
	xFgO9zEW+PPM60lp8ZqS3HNJm6H9KRBRZucmza7qrJyIk6c/KyeZ+uAQ7lPmOPuuIF+HzmBlxLofl
	9xgxnU20M9B6ZKLP+eN7nUWguEpCsFNOlKL//Q1c/REkF4nrDMOFgSNrbpll/b9jQQWbjWG1HgmHH
	NoF50dP8Q1ED3qupJ5INWRF1gCPjTKxM0h6QX4QIapmWKsBRUnYziqQYarenal5ZTXsRW5oWOOwCu
	0U8LVFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrzR-00000006W5I-1KSK;
	Mon, 18 Aug 2025 05:01:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdM-00000006TgD-1Vd4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:38:13 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818043809epoutp03187504a966680cb84de9509635df5e37~cwpJ-IgJ30819408194epoutp03f
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:38:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818043809epoutp03187504a966680cb84de9509635df5e37~cwpJ-IgJ30819408194epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491889;
	bh=IifKKYa4gU4DS2kIv1xGxa91TOJORg9sXPh7k3X+Zd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTRPU8c7IwOWygdwfPN2QRljUUDzobd0cTYoFsJLvGBXX1a1Q1SXQuyG2811o3bOz
	 7mk6lP7R9c2x+kW5ZkmSDWUVovpmZdiGVxmI2w0hHfSxqdJ1m170Ap3f7Xo3B4Mq3Z
	 bPNfV7hb+VgF2OMzBiMWz5s71bg7WvTA+2T6E8a8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043808epcas5p47b007bc5c807d3f0d8e7b9dd0b97225a~cwpJXkvPk3042630426epcas5p4O;
	Mon, 18 Aug 2025 04:38:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50MM3tQPz2SSKj; Mon, 18 Aug
	2025 04:38:07 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98~bp35wJTYF0487304873epcas5p2c;
	Thu, 14 Aug 2025 14:10:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141037epsmtip267eb5a4015bde3d72cab2ddf1cea5ede~bp316uv121850318503epsmtip2O;
	Thu, 14 Aug 2025 14:10:37 +0000 (GMT)
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
Subject: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all vc
 regs
Date: Thu, 14 Aug 2025 19:39:39 +0530
Message-ID: <20250814140943.22531-9-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_213812_713428_78B9DBAF 
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

Extend support to dump all 4 virtual channel register.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 4f6c417fdf58..c1653a738854 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -876,11 +876,26 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
 		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
 		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(1), "ISP_CONFIG_CH1" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(2), "ISP_CONFIG_CH2" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(3), "ISP_CONFIG_CH3" },
 		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_ISP_RESOL_CH(1), "ISP_RESOL_CH1" },
+		{ MIPI_CSIS_ISP_RESOL_CH(2), "ISP_RESOL_CH2" },
+		{ MIPI_CSIS_ISP_RESOL_CH(3), "ISP_RESOL_CH3" },
 		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(1), "SDW_CONFIG_CH1" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(2), "SDW_CONFIG_CH2" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(3), "SDW_CONFIG_CH3" },
 		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
+		{ MIPI_CSIS_SDW_RESOL_CH(1), "SDW_RESOL_CH1" },
+		{ MIPI_CSIS_SDW_RESOL_CH(2), "SDW_RESOL_CH2" },
+		{ MIPI_CSIS_SDW_RESOL_CH(3), "SDW_RESOL_CH3" },
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(1), "FRAME_COUNTER_CH1" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(2), "FRAME_COUNTER_CH2" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(3), "FRAME_COUNTER_CH3" },
 	};
 
 	unsigned int i;
-- 
2.49.0



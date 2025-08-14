Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMD85M6SrGm/2rhkRdAIrQRhH8rce/UofwihefSNyxk=; b=aRhCsVX2Vhs3HENVUQwAMzpbR2
	bJFb/YIQ8nuneXhKtdaodeSi8GwmC83NsHxRV3gl91EhZgChCglJ010YYxkQrjPGB3oO8jy+iRnDM
	R1Q9GZ56Fe7FbZoJtGN3yt+MooCAa75H0rvYYAoNNm2TpBX26ufXQNgONwDlUdVbHz90tO5xNWEY5
	S27P6UoXvlUnabf4CqQX4rPVFrbppo1NZtssGaV+bgX1NgRUZYL4PxzXIHu7iqYg465EnNhUd3IlK
	pWX/WaAFhzNF1IvdyNNZ2DRmhFt5m4WeGaiS5vXOYxvpl6nusKGH9FwnrE7j3voUP1f3RIx/atAVZ
	N9OG62jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrrq-00000006VIk-0IZr;
	Mon, 18 Aug 2025 04:53:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdD-00000006TeD-1Kff
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yMD85M6SrGm/2rhkRdAIrQRhH8rce/UofwihefSNyxk=; b=q6Ls9O6HH7Unh5kP8NYk2Rm6Yy
	F61J269pq4wJz3K0THBJWPkYuWx/tQfDq36LO5LYVLX8N4ukjTua++ajf4nW+PZuvA+Ob9s9jQO3H
	34iaNN3WJKckk4Icmc7DhXlz2HAO1u7KlqCcs2zjvC28EjICXIDJ+iuw3muIBITzejc3WAzdu9Hic
	bmSJjgMsLOG+tyZj2dbgOnxOzUot3njg7D2X+PMZ5dKUrmU3si5T0TTD0ERt4B+sxkyckSEML75DC
	nscFdlY9oZ9QSbZCDyxk3OW/1CiRS4FEcwKuGFjK9vAFfHS3Pou7CYea5mGRteiY892Bm5g8Kb1rc
	LRG57rNw==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrd9-0000000HF1j-2Iaq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:38:02 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250818043756epoutp01c7dd7c9013d21520ad24f94785b87889~cwo_NTtXU0358403584epoutp01k
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250818043756epoutp01c7dd7c9013d21520ad24f94785b87889~cwo_NTtXU0358403584epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491876;
	bh=yMD85M6SrGm/2rhkRdAIrQRhH8rce/UofwihefSNyxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssXxs/bPbVgfkD6gEWoluum7Wm125gYJKcqS9WSADn2UKMvPzXZxb7NivZClnNdaO
	 jB5U7omdbCBbkXOn2/d0vOAlE4QmcRa7Ut/eY7DWdJbtODtcJdN2VqmJUSV6gua5pi
	 2IdHEjbtb/0BWjhklN7SDfrmZdK6A28MwVDtzJ3U=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250818043752epcas5p10735c8345c19b690c1386b2c738b3d02~cwo6Z-A5X2576525765epcas5p1S;
	Mon, 18 Aug 2025 04:37:52 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50M338Hgz2SSKZ; Mon, 18 Aug
	2025 04:37:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2~bp3rTNoxZ0487304873epcas5p20;
	Thu, 14 Aug 2025 14:10:25 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141021epsmtip2fc5a1f0b0511a018a32f4c76fb4e853e~bp3neAIzV1817818178epsmtip2m;
	Thu, 14 Aug 2025 14:10:21 +0000 (GMT)
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
Subject: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to mipi_csis_info
 structure
Date: Thu, 14 Aug 2025 19:39:36 +0530
Message-ID: <20250814140943.22531-6-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053800_482717_C80A0197 
X-CRM114-Status: GOOD (  17.88  )
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

clock names in NXP SoC's is different from the FSD SoC. Inorder to
extend this driver to use for FSD SoC. Move the clock names to
mipi_csis_info structure.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..4afa75734f05 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -267,6 +267,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
 
+#define MIPI_CSIS_MAX_CLOCKS	4
+
 enum mipi_csis_clk {
 	MIPI_CSIS_CLK_PCLK,
 	MIPI_CSIS_CLK_WRAP,
@@ -274,13 +276,6 @@ enum mipi_csis_clk {
 	MIPI_CSIS_CLK_AXI,
 };
 
-static const char * const mipi_csis_clk_id[] = {
-	"pclk",
-	"wrap",
-	"phy",
-	"axi",
-};
-
 enum mipi_csis_version {
 	MIPI_CSIS_V3_3,
 	MIPI_CSIS_V3_6_3,
@@ -289,6 +284,7 @@ enum mipi_csis_version {
 struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
+	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
 };
 
 struct mipi_csis_device {
@@ -697,7 +693,7 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 		return -ENOMEM;
 
 	for (i = 0; i < csis->info->num_clocks; i++)
-		csis->clks[i].id = mipi_csis_clk_id[i];
+		csis->clks[i].id = csis->info->clk_names[i];
 
 	ret = devm_clk_bulk_get(csis->dev, csis->info->num_clocks,
 				csis->clks);
@@ -1539,12 +1535,14 @@ static const struct of_device_id mipi_csis_of_match[] = {
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
+			.clk_names = {"pclk", "wrap", "phy"},
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_6_3,
 			.num_clocks = 4,
+			.clk_names = {"pclk", "wrap", "phy", "axi"},
 		},
 	},
 	{ /* sentinel */ },
-- 
2.49.0



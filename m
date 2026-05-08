Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB588CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 03:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reRkRqjYAqOrfzwvULLnluxWm4AO8m1gbsvG2J8HOkQ=; b=HXnNqQSSRRLt+TChjeasFQuJUC
	GMG6xR1nMfa/Qy7QVO9ahV0FxV0xu415UJ7MQUg/Qw3iRX+8jJgn2TaXQ/dhazqnEUr93dnH2Bpb0
	21O3gO1zAJb8Sfr3EYidju0D6T6MFdeXyK+Yw/brZ10SDXEJWjmmGj5S+QPqM14gca0FJ6osiNhK6
	grQc67/Rr3+aXhYrW5M1qTCIiZiytbJ6e+3K2QHi9Wku6mdFPqWKNdQLL2O2mAKtp4SvXTCLd2dzG
	WB/NyJl0jqM383h8QWmH3oNjGdVPGNLEoN+N8ID3Gokquqd1BIOqhOh1SlRGvWgT28fNjoQDslVrV
	z6m4MlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLBhK-00000005Pvg-44ms;
	Fri, 08 May 2026 03:16:18 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLBhH-00000005Pu1-3Y1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 03:16:17 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2ADFB1A1292;
	Fri,  8 May 2026 05:16:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E5BE91A11A8;
	Fri,  8 May 2026 05:16:11 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BD79B1800093;
	Fri,  8 May 2026 11:16:09 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: daniel.baluta@oss.nxp.com
Cc: Frank.Li@nxp.com,
	Jiafei.Pan@nxp.com,
	andersson@kernel.org,
	daniel.baluta@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2] remoteproc: imx_rproc: Use device node name as processor name
Date: Fri,  8 May 2026 11:18:32 +0800
Message-Id: <20260508031832.27451-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_201616_018667_B17A8917 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

As currently there are maybe multiple remote processors, so change from
using fixed name to using device node name as remote processor name in
order to make them can be distinguished by through of name in sys
filesystem.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Fixes sine v1:
* Update patch subject to aligin prefix name with existing patches

 drivers/remoteproc/imx_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e8d239bef5c9..38713f6f1c50 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	unsigned long cpus_bits;
 	int ret;
 
-	/* set some other name then imx */
-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
 				 NULL, sizeof(*priv));
 	if (!rproc)
 		return -ENOMEM;
-- 
2.43.0



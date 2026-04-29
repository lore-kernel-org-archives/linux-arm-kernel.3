Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D1FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCh6t87gIAljLeXon63K+JxY/BWZUmYH1v43AgfZDdM=; b=ybwHZAoRuM78XFJsOLFomOL2Zu
	HiNxFRmHfaeOekQTHxxP6wRB8w5Fx1fspODThRDZw+skcxcMn5bQkpdCifjyvklQX6qgtX0izDxIm
	YNABUkGDB0RCyDJyK2uhXjEzNpqK/F/6JCUFbqHdTI953W3Pg4gnpQz0YsZQ/0V3eLg8KGwjv7hbr
	KsrpiyLkD1/HWf1+9jwGo2YWfPMk+qbpOSuWysAPW+1W8Oica3ijr6Ix45g87qrPNV1ChV3lqi2sc
	2qWeYPgqZAE1tVY71wjp11SVYAMtnjh2uZJRYBzydvsHyQSTj5Tf8osIFCDYr1zmJee44jnLjUsaj
	OCVH+FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHu-00000002pcp-0f1i;
	Wed, 29 Apr 2026 03:08:34 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHo-00000002pZa-1NSY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:08:29 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DF53A201A26;
	Wed, 29 Apr 2026 05:08:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A721E201A1E;
	Wed, 29 Apr 2026 05:08:26 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 618B01800083;
	Wed, 29 Apr 2026 11:08:24 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 5/5] remoteproc: imx: use device node name as processor name
Date: Wed, 29 Apr 2026 11:10:47 +0800
Message-Id: <20260429031047.30893-6-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200828_494226_B461A09C 
X-CRM114-Status: GOOD (  10.84  )
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
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e8d239bef5c9..17026e390e88 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1357,7 +1357,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	int ret;
 
 	/* set some other name then imx */
-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
 				 NULL, sizeof(*priv));
 	if (!rproc)
 		return -ENOMEM;
-- 
2.43.0



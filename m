Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E360CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 03:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reRkRqjYAqOrfzwvULLnluxWm4AO8m1gbsvG2J8HOkQ=; b=h0G9bGx1oK5hYt9+v2CDx/Q/Hj
	8egsgKlp6LwaT3gM6NeCIY6d0oMA6K7+7SZFIQ36tFnT/qirAoCF71x/sWegHElfTCZ5/3ZUUF67O
	fagfN7OhEfJ30jTF151mn3FJqLa1nn7elX3Np0INy7kIBQh4MJf4ND+k0IerCAgrhJiDhxEhAuvN9
	ek0UNFSaMLVn119BzODbJ7TSptDhyE2giU77fyld/B+tdGZ0Ui6g41Anby9/0ixx6xDf2j99hAilS
	tykgotmtu3I0vI0ujBGJW1S1CLwWAv/TBax/lsUPpo7BnuG3teY/1Dkk0AUdLiifA0TBBPX5oW6uD
	nocN5VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLBiv-00000005QGX-2zpZ;
	Fri, 08 May 2026 03:17:57 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLBis-00000005QFS-41K9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 03:17:56 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D23012012E3;
	Fri,  8 May 2026 05:17:52 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8810A203365;
	Fri,  8 May 2026 05:17:52 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 78A6A1800091;
	Fri,  8 May 2026 11:17:50 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: daniel.baluta@nxp.com
Cc: Frank.Li@nxp.com,
	Jiafei.Pan@nxp.com,
	andersson@kernel.org,
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
Date: Fri,  8 May 2026 11:20:16 +0800
Message-Id: <20260508032016.27716-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_201755_134283_1F040968 
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



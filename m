Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ACBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yYQIk/NMbKZJ6bJXWqGiAoDPS3oay8xb2DbobhpEAk0=; b=pD+sHd/7VIdadY5KovlHTeYaH/
	6HXGTuSO2FQrA9cQ2lOomyLF9YDrFn4CfIQ/KbuKvqJeTDkxvKK/sV/h2NHTjmeOQqt8ZWfMiRx/K
	dmCKjlsR+khxTXaRiJFeFAfdnnRFQ6SLBrThN7+UAjl76x7+BwNn/dhEbUJweXKtloBa2gb4DVX4W
	HSRy6tGrqSNpqjuUs+Fem81T5BLCqqGYqZPOxLBnUrZiT2HNsdIVrY728B55gRGmWTSxJJUtAL+mj
	tVINvOr5qxW8lprgzU3nVE32nelvBiNHwM5zW3k2DQKDebuGz1RMjoyM3XG2cLpBOzIuHq/tAo6W6
	5LbiTKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSCr-00000000PLK-45Sd;
	Thu, 13 Aug 2026 09:58:37 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSCo-00000000PIU-1xPW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:58:36 +0000
X-UUID: 84bd6f4496fd11f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e079411a-550d-409c-bcf4-64c53f5ff9ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:000ab75f5e504c7f9b91d086a590c14a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84bd6f4496fd11f1aa26b74ffac11d73-20260813
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1411366014; Thu, 13 Aug 2026 17:58:22 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] firmware: imx: dsp: fix mailbox channel leak on kasprintf failure
Date: Thu, 13 Aug 2026 17:58:18 +0800
Message-Id: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_025834_825411_D068C7AF 
X-CRM114-Status: UNSURE (   8.87  )
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

If kasprintf() fails while setting up mailbox channels, already
requested channels from earlier iterations were never freed. Route
the failure through the existing cleanup path.

Fixes: ffbf23d50353 ("firmware: imx: Add DSP IPC protocol interface")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/firmware/imx/imx-dsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..7e3f45ddf0c1 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -99,8 +99,10 @@ static int imx_dsp_setup_channels(struct imx_dsp_ipc *dsp_ipc)
 		else
 			chan_name = kasprintf(GFP_KERNEL, "rxdb%d", i - 2);
 
-		if (!chan_name)
-			return -ENOMEM;
+		if (!chan_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		dsp_chan = &dsp_ipc->chans[i];
 		dsp_chan->name = chan_name;
-- 
2.25.1


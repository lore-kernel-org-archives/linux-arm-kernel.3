Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FAED7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47CdDctxRQB/vaCPOxPfxcy++Ca9MmaFslwiTKAmdrU=; b=D7mRWlgW56yXf+dErJvGQA3e77
	X59AiTSAPM6hOuN7dPAg1hycMmQYzhuRHdswRBwX+h+tTj/+A+Giq4Q1hrxRwCUxHpHkrASO53gKF
	R11v+4w22i35cGKolYHd9NKA2oJxYxI+giRkP31V/gRn62H8YvbFsJX1tpDc9mzshzVi+DSHHyX3J
	M/DE8OHc6aNNhDcreEONR/Mn+wHrzjHaXFjYnXiMjgnRLpK9jbcxpEZ/st9nmpYzQ/2+xjXNiJFCM
	9zWtarN/M9drGj6eDNvsg/MxnQ27Q8CX9wuD07JYbkqVFakouzAUG+Sn7tKUQfX1jW/OUtTAY1ACN
	qkzIxj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4it-00000005vPs-3xmE;
	Mon, 02 Dec 2024 11:36:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Vw-00000005sIg-10nO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:22:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UI-ED; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-001Ht0-00;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-2C;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 02 Dec 2024 12:22:30 +0100
Subject: [PATCH v2 2/4] nvmem: imx-ocotp-ele: fix reading from non zero
 offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-2-3c021a97eb5d@pengutronix.de>
References: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
In-Reply-To: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=1630;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=13U0y1DundmGRi1xvon55DH1ztxxWp3gT5PczadoflU=;
 b=Aa2jpkZtQUeqa7jmm+aHcdZF/SSMt2EEoIoiHBLUGFZVDzWDKp3Vwr5I1vVqnIhaB7v+q40LY
 EgGwKihcNr9CFEt2D3C+NDZsbtklxiFYhfvbcamWaivc/F6D8NempLF
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_032252_280039_50B164B1 
X-CRM114-Status: GOOD (  14.65  )
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

In imx_ocotp_reg_read() the offset comes in as bytes and not as words.
This means we have to divide offset by 4 to get to the correct word
offset.

Also the incoming offset might not be word aligned. In order to read
from the OCOTP the driver aligns down the previous word boundary and
reads from there. This means we have to skip this alignment offset from
the temporary buffer when copying the data to the output buffer.

Fixes: 22e9e6fcfb504 ("nvmem: imx: support i.MX93 OCOTP")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable <stable@kernel.org>
---
 drivers/nvmem/imx-ocotp-ele.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 2e186b7d3b040..b2d21a5f77bc1 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -71,12 +71,14 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	u32 *buf;
 	void *p;
 	int i;
+	u8 skipbytes;
 
 	if (offset + bytes > priv->data->size)
 		bytes = priv->data->size - offset;
 
-	index = offset;
-	num_bytes = round_up(bytes, 4);
+	index = offset >> 2;
+	skipbytes = offset - (index << 2);
+	num_bytes = round_up(bytes + skipbytes, 4);
 	count = num_bytes >> 2;
 
 	p = kzalloc(num_bytes, GFP_KERNEL);
@@ -100,7 +102,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 			*buf++ = readl_relaxed(reg + (i << 2));
 	}
 
-	memcpy(val, (u8 *)p, bytes);
+	memcpy(val, ((u8 *)p) + skipbytes, bytes);
 
 	mutex_unlock(&priv->lock);
 

-- 
2.39.5



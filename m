Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CF7D2E01E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wsWSHLYE28HVQqJacj5qmusf7o29dYVK12TB99/4GU=; b=voTnpZ8TQ15uHDX4AyrQ2tsMQN
	NcoWkqTk0ZyR14JSbo67cX1NjOpKQCkAXk9NGbtw7G7dfDWn2PPPqhhCwe8svqE9Wsv79nRfy8CPH
	f59sMazLfXOfMorjMwJhKfAaDI4pZ3/4cB0Pl3xqV4+p/tA+eqYSENMKrht9rfDurYRisZ8RY9lgI
	/EClm2PDDlsUG0KVTutha+pD9pW41wrvzPSatjz8sXmZa+FPeBcgJLlKmih421Vb+ZJqiFHAHtY7j
	KZAzy9VAxJ3NW/pMuo0vPbebYcJc78YrxKdC0MWoMpfjk7RM731OZ/k9zxJl76LOQWDp0McvH6AyE
	N/Kkt+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WiJ-0000000DYp4-1KzK;
	Wed, 23 Oct 2024 08:27:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WU4-0000000DVxb-2fUE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:12:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTv-0004YQ-3C; Wed, 23 Oct 2024 10:12:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-0010Hi-1W;
	Wed, 23 Oct 2024 10:12:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-00FrPY-1K;
	Wed, 23 Oct 2024 10:12:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Oct 2024 10:12:28 +0200
Subject: [PATCH 1/4] nvmem: imx-ocotp-ele: simplify read beyond device
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-imx-ele-ocotp-fixes-v1-1-4adc00ce288f@pengutronix.de>
References: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
In-Reply-To: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729671158; l=938;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=TcTBNj7+iYOpxE3v9b4DJqZG6L5zlKG1LkB0qWPMVnM=;
 b=ZUec58O0Z2WMBmVreT/O9n4WGnFhNX4RcR81wyRt8p73ZbJqxufTkPLPL17TFzk9T9zeHpBLT
 wvXATQ7a4QJBdIDkCLmh/nU7OXvzM6jspOa5lHL2fA7UN7oPvN/KaRX
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_011248_840450_4BBC08EA 
X-CRM114-Status: GOOD (  13.05  )
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

Do the read beyond device check on function entry in bytes instead of
32bit words which is easier to follow.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 1ba4944976987..2e186b7d3b040 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -72,13 +72,13 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	void *p;
 	int i;
 
+	if (offset + bytes > priv->data->size)
+		bytes = priv->data->size - offset;
+
 	index = offset;
 	num_bytes = round_up(bytes, 4);
 	count = num_bytes >> 2;
 
-	if (count > ((priv->data->size >> 2) - index))
-		count = (priv->data->size >> 2) - index;
-
 	p = kzalloc(num_bytes, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;

-- 
2.39.5



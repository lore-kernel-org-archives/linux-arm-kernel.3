Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A7CD7830D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFcULvaTRSIVU4OrsVetXuBE0xHY6aiWfJVoJi5EFAY=; b=dc9CKo/ztqD6vPpG5pHZMm4UW6
	AiWBVx8kkaiQ348pvTWLzyQ0dnIB8FT10wCDclFbJTPt5+9TZyRgdWC1ejAC203ZOyQ1FcAdDyyQ9
	7EODKAswCtcY4FSl8UlSOLniKuxQKT6ESSNbuQ0dyq9+3fXPedswQnX+OOgmqiCgp8JbDYhtcogtB
	RqazPvGIL4uv1wCGOqp3YHkaP/vpguje7BCPVnrrPWZlQHT6m00YZyHMvxKzVcvxYXl1DGAFuBePb
	NH7aQoivfIFdIPCDg1/SJ5ruHK8UvX4e/bJ9v5sAQdZHn6Hz0y4DWJyv2j0Radjoj8orL0bWttlGv
	ih/ToAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4g1-00000005ugY-0K12;
	Mon, 02 Dec 2024 11:33:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Vg-00000005sEx-1QVF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:22:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UH-EB; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vc-001Hsx-3A;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-2A;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 02 Dec 2024 12:22:29 +0100
Subject: [PATCH v2 1/4] nvmem: imx-ocotp-ele: simplify read beyond device
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-1-3c021a97eb5d@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=1029;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=P8t38gZgVtQGfHlRwL+12Evj7x6PEBaDv2Q4YuWoIQI=;
 b=DasEWzoF6ivaUdopeZSea2AgkEgyHZjhfiWd2ODse1tTTQJ7TQrl90n+TxlMZQthwA7kUTQ61
 U/nxZmnN4mTAxLnoI8gz77cuGsFHOvvn+MW/dYwxfs+4R52WGpO/4Ca
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_032236_382285_B2994C5F 
X-CRM114-Status: GOOD (  13.36  )
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

Fixes: 22e9e6fcfb504 ("nvmem: imx: support i.MX93 OCOTP")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable <stable@kernel.org>
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



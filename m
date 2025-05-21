Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB579C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQO4jco3qDDu6aUbyz3fLT71Hl1dviYtO5U7MzI5ak8=; b=FluxikhKeC8/lzzz12HDja1gTl
	9WwrztwTvK4k5NiF0uItgmMqQAeDSqdnUIOGpNfk5SrkttDylB3DL3rNptQ74ktUHz3RiUytF9EhI
	OdymeDYd9jzOVvgi3Z29Gb+KN+WgrGJQ9U635cYYC/fSgG9AjXNscsedw1HloEVZ79eSIiTgISkzZ
	0gbR+ZMQrGkNC25GdOYKXCjwf3TznoVuP8VPeUJf5Oyy59N76L4NBfPDkeV99FBVsl3xT3LwLmqJl
	vhc0LON0BzN9R9fycHphkWvD8WVt7n5VfwwcNqI6/cp9xjU+JNBYN91StN6w86wB76/pJbNEGrZ1U
	lgxbkshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpR7-0000000GkgL-1WoJ;
	Wed, 21 May 2025 19:49:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpEG-0000000GjC0-3tCW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 19:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7566A4F2ED;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F7AEC4CEEA;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=8a8vQY24kpOTOSPqYHfBqqeVHZ2y0yNa9wTnorDnezo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPixCLITPfzRV8uPt7V2t9f6V9qhU2M2YG+Mc3CWFguXc0Bsj5xok3L0UCMq1cGo2
	 pckvkX7/20Y2Rp6+Puhb3XO/dEycnFDSJZ7Dal9HBGiSiTxXRUG5HeNudBYfqZ3/tI
	 xC0P+19Hw8KHRkanrGaae7ppIcicQmWcXJXrSBWj6Kjmi1RXn3VasF0F0X2ws6JCd8
	 HncP052XNRzgj5hVZkv4RnxyW77O0aNh9vwb0cKbfjRD95kTiUlnVNf3XusS/lAgT0
	 ZgdAFy4gZKP0veZCXJ3aXtatqDDDtdDj/GHoRQehc9He44+8XifXZLO1rB5dNiYI4N
	 pBE2JhRXoDQVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0533C54E65;
	Wed, 21 May 2025 19:35:50 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 21 May 2025 21:34:24 +0200
Subject: [PATCH v3 1/5] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-imx214_ccs_pll-v3-1-bfb4a2b53d14@apitzsch.eu>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
In-Reply-To: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=1201;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=JSOcAgvTpyrSY1gtujk/NN7HrGG2Tbe4hfXbnAXabfw=;
 b=cTQcAJeyjcHdCIB0CKYBFarIoEIQzEvH4tse6dqUe0Kr4oM9poMtr0ShJH2LQBm/nX4vg6mQZ
 dUqisuK/dOPApTwt5EGLeYXIPjbI1DoU/UFdNy0b08rFtHEn1K/PyiT
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_123553_120248_0B7F373B 
X-CRM114-Status: UNSURE (   9.97  )
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: André Apitzsch <git@apitzsch.eu>

Reorder imx214_parse_fwnode call to reduce goto paths in upcoming
patches.

No functional change intended.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index dd7bc45523d8b5fcb3ec95728a6d32c4fddede72..0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1261,10 +1261,6 @@ static int imx214_probe(struct i2c_client *client)
 	struct imx214 *imx214;
 	int ret;
 
-	ret = imx214_parse_fwnode(dev);
-	if (ret)
-		return ret;
-
 	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
 	if (!imx214)
 		return -ENOMEM;
@@ -1295,6 +1291,10 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
 				     "failed to initialize CCI\n");
 
+	ret = imx214_parse_fwnode(dev);
+	if (ret)
+		return ret;
+
 	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
 	imx214->sd.internal_ops = &imx214_internal_ops;
 

-- 
2.49.0




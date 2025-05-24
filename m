Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925FC54F32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzlB37810ZJacDY9GvCQaZCwBjrr9/2JnigCTOD1xbo=; b=ToJQVY8FNi38PAQljeBadr7yvZ
	lN4ZP4+qvKAUolMaU0qCE0FYbCp3qtyFlde54ehmfdQSUI1/sxZMFncu3ADbq9OM9uzf8X0WknD0V
	eLsUbPkWcxYziwqFQUKwHEJTufOmYfvS+a6CPTxLLYOXoFnGX2epdAva9v0AccoGabJ3kFmVzIUm6
	UvEak0+D6Bf4kwLhDMwy/oCR8mnsnRm8i5EfMwJ+5HfQ0shaF98ouDdr3NoAO4MkF+ul01HQhlNdV
	8YGaekLJeAGXIQ2KowvVsO0jfJJR9KOklMtLT+HMtDjeqcOm5PNOyUmYvi6P3XUqp3mIXevumTz2p
	l7YMa3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIl6T-00000005fXO-1IBM;
	Sat, 24 May 2025 09:23:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIkxo-00000005eT9-2sdv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 09:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 624E64AB80;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F22C4CEEA;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078082;
	bh=cjlpAvK2D/evWZrNVoSJSSs2Yj0EmEPUJrm7XWmZpOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AUxkzM9nO07/U6LlXdNWRXcyuhAJqUivj/N8TZttVbOXYoKkWlAamtWTAn2vwOHA7
	 Q9frDo8NrhwcCOoA4byStKb81HXr0y1jGJ+I3KvUADYgu9/ndz6Yg6CWCkP/akf5J9
	 oZVF1EWN7eEb5kbcg81NmopWQ1TcNUvQkQ9zB0uKo5zyCFzqKZ1SEyNBvEryiYFi3K
	 tX8o2mGKIf3RizOVWqVQ6hvTBPzkTaDAZaicWLORYCjZZW+3fkYC9uu5fsjH7aicQJ
	 4IDnMytCCt7/n2sp5x05eNMNLlECduOOIgaFGRAUxSsOSZwB+2l/eyurjVtoUghz1K
	 Yu1nR4nCka2yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD68C54E71;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:36 +0200
Subject: [PATCH v4 1/5] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-1-f7dc22e5255b@apitzsch.eu>
References: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
In-Reply-To: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=1268;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=75ElzgjAcPhkZmWR4bGwvMi9n8FDD5pHtp9QDNKGMck=;
 b=jYVZzwVgKN7KIEpkHSdsj/Gnm8CF3uEDjKWpT99zKlW/OFQGFDJCioQLjPyHrFU3MRhFbm3CJ
 iTWP76dLmNnBHXgGPDdMRIPkh1Ef0QWU1h4kO2lYQIzPjuMRIr9rcYn
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_021444_781064_30797BE2 
X-CRM114-Status: UNSURE (   9.10  )
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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




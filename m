Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1887FC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+E0OKV7+4N+mALTdURBOfSZdYFYictzdTPZI7EUT2/k=; b=HJvndJxF4dS2LMoA0xAeTWVMi/
	le95vcCQ3EIE2acEc3kUY+nkWnqhl4chH5wvxR7FE157vab0UExAHNnKZE8akittzfTBEHXMlHGUL
	Vb2++9RypDjRQDCNnxJgV3T3FiXOl/NIq8uw/eUwF366SuoiiZYPnJ/SyNbqru/8fjEl4DOmE2i9p
	HHsL2kLo0tzxgu9D2Ul8zHVhcTRUJV3AD1bO2HSTf3qEJej5kgaGPSoEGpoBz+p19UcK1cqqPcc5/
	XgTB7poJikbZJV+MyMEs5Zlzl6LmC8Xxw+x5UewDKa4US3cCJ4j5k4yiGsvB4JryExyJNA1nVCmGj
	yuaINjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSumX-0000000HJun-0Jro;
	Sat, 21 Jun 2025 09:45:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSufs-0000000HJ9L-1lIM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 09:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 304F9A4D6D9;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5742C4CEEF;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=mMp2I93d5y9Pxfnd7gceLhOyED1ngQU2FPgBSXb3zEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ta0GWAdtYm/ep18ZcabBDsW1r9gjzdI/s8zUlgnnyW8AqO7SWE2MjLNgk1bd9oefm
	 kKAo5/hgCbzmEBW9JKCfKQFlcA0H6/8irdxPUazQIaurjH9LfUIg9dcYjm1T4idlvJ
	 LUrbUlu8Bo6lrgqZ4dksuxCi49n9uEkPRGTGF8ZooFPh2ukZuvDGIotxbOWzmCd9rN
	 zkgMsHP/6VkvOv6lE0Lik9qT3qnqu6/ERLqKkuI5XDy5Oxah/LGduD4eUsLASDrkzM
	 o5yjTQctcVhbt0ghFZBVYUlliIsFKvEKTzs7BDQnIM1SnrLJiiCcjgqzWqt6U9U1PW
	 17IxuPkHDJxzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4025C71157;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:25 +0200
Subject: [PATCH RESEND v4 1/5] media: i2c: imx214: Reorder
 imx214_parse_fwnode call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-1-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=1268;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ntHoZrzdn+wyAlRgU4WqQYfnIyIwLCluoNpZKfDKzr4=;
 b=WnIKyFErIOOENyE1vtsezAjFCgV4kcGnsmFsnzKid3TlAeD4yyo4uBZ1WV3JI9EYdN3sYNfuW
 FkZ2LRefSy/CMJDELtyq/0knO061v2IefJSVmW6vvoHPEtnev79x85L
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_023812_585214_9B57F147 
X-CRM114-Status: UNSURE (   9.05  )
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
2.50.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F11C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PFkFma3Kf4fkNBVwmjW48fUoa5QXXZ5iJyQiOEnDI8=; b=IEALi/esN6+oy+mUN92hfVSbX9
	XxeipePtbKDg8xqwwr24idQeS0QGuhEGHy055Ay85GhmPfBmkF/ZTrZ4vk7WLCZ+o8yihF6/Zfvb6
	os7Zct0oFt8ynpHml8HB9YTFjeGs38j07Z8ZT+fwpF+SUGtVpYLM4Y3cpMacDuXiQ0MUb4dbmCW1w
	zXiW6M7wwDxhZ8uy006AgjLiUgVQuhZqcXyX+ezMaD/gzHPl4gJSPaQZBlc3d3syskyFg9Vr9GGe/
	4Y2lnlmUe2AfBGpfitiXqi8DCjCSBISxSQvs2VbEtE0U32U/JT6lecnUXgKq39DunXRpCfVOXIkq3
	yTK8uDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpGR-0000000GjWY-23sh;
	Wed, 21 May 2025 19:38:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpEG-0000000GjC3-3oHA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 19:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0360662A16;
	Wed, 21 May 2025 19:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42BD1C4CEFA;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=rl9GZqdLGBfjBJ296zN0oZFwK2zvx5a8miUiRaAwWLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HXjUXzLmPZK8JxZv2rMAiyQMypnvz30SOWaF5Le6MSIj0SaMX1eXUlAwi6XVMMbDr
	 /9o7RnnsdygXgNbIrerqIWF1oXtn+9OaMhes8HqGbzKGCRyBlPPP1nDBqLkmEF62+o
	 AI+o5suaagx4IDgxqYXEqzpVDMQp2gAAN6wEP+IDuhTdM7IoUT1NftMlQBUMyWnH1S
	 tfa4W/5+n+X7zGt9wMTcL9eD2sNmUJUud6aHRgFx019iGspx67lrR0y/ybu3+28oDJ
	 2DJcqVoY5+Cw/lu4eUvpTYpw6aBEsQzjHnGFW62Huf8OJdB/ilu8EV6eFlrvw+EC7H
	 zsi+hsvUAkHHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37109C54F2E;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 21 May 2025 21:34:28 +0200
Subject: [PATCH v3 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=1194;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=81a5knJurFPeQFihfZmv0dfoKheJNZM//Pf1vhwjDog=;
 b=u047Jl0beOhUD9XDWfSja6SNCQ6YB0IeZ8wgFG7Akslb+UIKriMBQ9i130y9Wed440+cMBspz
 QG7lRqWCUyCDV3miprXvcQ6wRM8n0Z/7cCMw+Mji4SqHPK7t5ohzqKG
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
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

Instead rely on the rate set on the clock (using assigned-clock-rates
etc.)

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 19b494c08ece9894de67a4ee34c6f8e6e2708e41..264e897ec6e8e3d2fcd9d58db82090c7dd85d526 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -32,7 +32,6 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
-#define IMX214_DEFAULT_CLK_FREQ	24000000
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
@@ -1402,11 +1401,6 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = imx214_get_regulators(dev, imx214);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
2.49.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2553FCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5kIp6AK84MEo9GlzF/Be95zArasU2AChgod6QlX+xlg=; b=4DxU00TbCBFB9IiuxtmBrdEAfb
	6Aif2nrcnEg14lKjqhEyUDRlNYcN/Gy0TYVzpKi7i/6L8yf8UfyMnqwsfoqEXAKwjvJpzvpEEygkS
	UycpyzdymKBn7PIewjy0E7g5jnjsIlj+WDZmWyI6x4LkbBKWHk+aKkdZRge4qCTwlOeEC5ZnqudMG
	TAvjsPshZ6Lo2KQrFwrZV4BouRL2Mhup1SB3FTanPOncTC1EgKJpYtymSGlSLlkmDvZxzfL2MgoGi
	kozvOLr05FI/ZyK9KyPLZ9/wclC5e/9sQxuPTxPRCnhAw24epiHKUNfZqugGIZ7gJDz3j0lGmgU7U
	X6OqaHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeZp-0000000BoVh-3Mn4;
	Fri, 02 Oct 2026 14:49:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeZm-0000000BoVY-435M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:49:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC3D60A8D;
	Fri,  2 Oct 2026 14:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7331F000FF;
	Fri,  2 Oct 2026 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790952569;
	bh=5kIp6AK84MEo9GlzF/Be95zArasU2AChgod6QlX+xlg=;
	h=From:To:Cc:Subject:Date;
	b=Xto4jLfJvUFRd1Cfb57Dyt861cC2741yPwg1ytnac1QHmnW8OXzRVdAD6pishXAaf
	 xfbQFtDw7fLA+G87oLwR9cHo1jjKo0iAyh75iQcFTKuclouv3DUcDEtkIkGHhgh5W6
	 cNlvGBlOYPQCcQBhY+npkTJMYusA5Nwe+MxKxJYjdb0U2IM/y46wGHcFkV8SIEwEgT
	 MqO6IsfyPiCcxNeRcLkNRCGunBnE6UehwY/5lD1t3X1xR2pSvXWXa8tovf58BLMtmU
	 eGsl6+3ygGN2hr0DTs+rWWdE34sKc5dC2ZNIVtKpW9KTK6JoYZsc1MXSbnaTE/Q28n
	 h+avyIg2yvPDA==
From: Thorsten Blum <blum@kernel.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>,
	Linus Walleij <linusw@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: stm32 - use devm_platform_ioremap_resource() in stm32_rng_probe()
Date: Fri,  2 Oct 2026 16:48:38 +0200
Message-ID: <20261002144839.51627-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003; i=blum@kernel.org; h=from:subject; bh=2Iwh1YBp293wVOzp50snGvj+P98VSbsE/9m4UEmQTXI=; b=kA0DAAoWXqtxINjMdS4ByyZiAGq/xEejLZNBJ+SYr8+Ib0WyLcbJIkc4wUBkp/z3YfDJ30Ckt 4h1BAAWCgAdFiEE4Jr4mE11fHmyNFi5XqtxINjMdS4FAmq/xEcACgkQXqtxINjMdS4NCQD/bqnL tAU6U/IwSMVUcOr1/pua2Tlaa6fBpL+OPSm505YA/jiPDnXJcEll3KolODLI3efPvXG7ALDcIcy Fb3EPxYII
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

The resource pointer is unused - use devm_platform_ioremap_resource()
and remove the unnecessary local variable.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/char/hw_random/stm32-rng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index f5bfe54c01dc..8468a4a24d48 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -528,14 +528,13 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = ofdev->dev.of_node;
 	struct stm32_rng_private *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->base = devm_platform_get_and_ioremap_resource(ofdev, 0, &res);
+	priv->base = devm_platform_ioremap_resource(ofdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 


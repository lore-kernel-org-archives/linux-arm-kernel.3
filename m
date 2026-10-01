Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A1CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaEMQ5X2bx5FhW9iOXMM3Gs1pceUqUDrW0W/Yi+E1tk=; b=dAYJKo5WY/u6L0pvW1ZbM92Q0r
	gj2RGjK62jylZJQ4pqglwWEeh8ay1s34W2494T0DJgdJttZNwejtbMRwvYcZ5508P4VEr64VQwffT
	1dGGb6GQFydkU2t7xDnd5cFpYkYKT1O/V9y2SPpqC0KRW7gBpAf3cRrZun7/6+VwrUEN8UQPjml+1
	+kn4yW0OUgKm9jOeHhUfTPs1gjhJDl4HRoCiKYDppGCCI/mXw+Ljxxg2bkirF/QbgKO0N5PKQIEVW
	DBtE3ku5An0kjfzXhF32iEAltcsEJxkUkGZlZDAZSXaXrE5MLDGr6skSSK6z0XLtdoxXf2RXrjZBK
	50zLhPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNxt-0000000ACSj-2vvW;
	Thu, 01 Oct 2026 21:05:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNxr-0000000ACSb-3RoT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:05:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8A95601FE;
	Thu,  1 Oct 2026 21:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB3A1F000FF;
	Thu,  1 Oct 2026 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790888714;
	bh=MaEMQ5X2bx5FhW9iOXMM3Gs1pceUqUDrW0W/Yi+E1tk=;
	h=From:To:Cc:Subject:Date;
	b=mjgu9TMbC00b5ykkzAq9efosTt5Zeec4nGpNGxqj5k6mXxAHZuEOMmlBfZshTTdE0
	 VUDOeTiCgspL1FcOekGab8a0+mb3GjxDsP2Ye8AIOfs5NJoiDR8KqZA427fA0gCQkk
	 aZQHr/uBsZ7uqFwWvOZAm5vuF2zmxC9rH3ZPhGyPc4Jz9aqURp4/Z2Tew5GG2wQvW1
	 uszgajNmWMXgqanOXWwlYAhFO+KT0WSQ9GUGh/0vmUeeipVTaOGNIDkieHyOHRxmO7
	 lyBfWCdmCIwAcZlFNpXP2Cf1CbaF44Z5yqVMNrjNMwQxAjlthzdKy/EDYC2Ak72vk5
	 NSvmih+dN5c0A==
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
Subject: [PATCH] hwrng: stm32 - use swap() in stm32_rng_probe()
Date: Thu,  1 Oct 2026 23:04:48 +0200
Message-ID: <20261001210450.37467-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=blum@kernel.org; h=from:subject; bh=Nz0LSI3aZYawMQnKQbqCra0lDUN5qofWzsmAg68O8io=; b=kA0DAAoWXqtxINjMdS4ByyZiAGq+yvKireINrPyi0y0O4zRoXZkaH6bDL64tXpx61Rlyk51U5 oh1BAAWCgAdFiEE4Jr4mE11fHmyNFi5XqtxINjMdS4FAmq+yvIACgkQXqtxINjMdS4AOwEA0uqR pwNEUqQcXK7n595liNdI+iJmFG5r9X9nX142apMA/0SKwEZZqEmSEn9+VduY/fA6+u8SXdxR1FQ RPibC7doD
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

Use swap() to simplify stm32_rng_probe().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/char/hw_random/stm32-rng.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index d3fc910f674a..b13361dcad12 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -569,18 +569,11 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 		return dev_err_probe(dev, -EINVAL, "Failed to get clocks: %d\n", ret);
 
 	if (priv->data->nb_clock == 2) {
-		const char *id = priv->clk_bulk[1].id;
-		struct clk *clk = priv->clk_bulk[1].clk;
-
 		if (!priv->clk_bulk[0].id || !priv->clk_bulk[1].id)
 			return dev_err_probe(dev, -EINVAL, "Missing clock name\n");
 
-		if (strcmp(priv->clk_bulk[0].id, "core")) {
-			priv->clk_bulk[1].id = priv->clk_bulk[0].id;
-			priv->clk_bulk[1].clk = priv->clk_bulk[0].clk;
-			priv->clk_bulk[0].id = id;
-			priv->clk_bulk[0].clk = clk;
-		}
+		if (strcmp(priv->clk_bulk[0].id, "core"))
+			swap(priv->clk_bulk[0], priv->clk_bulk[1]);
 	}
 
 	pm_runtime_set_autosuspend_delay(dev, 100);


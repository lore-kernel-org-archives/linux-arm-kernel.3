Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1B1D10384
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZPc992HumAaAtsxARviGJSyO4l7EJBsmn/kCGFgnes=; b=3W2rLUycIWGTTAuKNAPAcKaRRd
	53YZzeEvla9KcLbt8mvyqM0XmgslObEmvTB/znsnlybpKH7w/y473MbdUW6XueIVmzZfg9fvsQs3J
	7C2G1EFcogtGziOSuSt0uOAttM+fAXyF21NJmH2pzp4g0apcwaaE5H04jTNYscy3lqtB8ZzM0vHq6
	k2qYzPYsq2ZfryHM0lpZiQzuQ0mWK7+mUE4bqqt3lV2vgKr+yxj5YcaWFiEYtantnOmtCSjCLO08Y
	UyFIRcrEQaovUGipb70VilZArHDh0VEqbSAJ8Y46e3xnt0I1r99l4DYACasOhGH4Ld1QCnQBptQIz
	TzA9tLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9dO-0000000ETaM-0F9d;
	Wed, 26 Nov 2025 07:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9dL-0000000ETa2-42kt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9C3460169;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E35C113D0;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764140890;
	bh=Da6NAj4w3l/HOWxmh1R0GzL6Mu+qL67wXcnQ+g/a0Fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qR6CsCBpN360yEKVRUpbWBOBxL0pwARl93hC5mXUgF1TT2GHUWqDDYJPjcYtWm9a8
	 QLdacWsnDtI+meVMDglLe/MPSmUoEchUqFRDtjqYvTmgDs2+UJyKJp/EgNyqRlWcE+
	 6ywnf8NiYfeyKLvunf4gdWHDLvvK9t5gOmx1m9xj3M0jCHs0U1sf7vuWgHE53/JHNH
	 wVUgKoB0JK7BKKBNT+n8cRpfvGZS8wUcaOf8dS9vkRz/MvlJy0oCsQ+vLAnYXMdC+5
	 4bKYfFXipllQG6Cs4F/pNJ3ZA1QvVx/ZzOsFeIOtBSd+FJpdWFgSTnQ6HpzA5Ygowc
	 qI0QpozcT7NYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFA2D10384;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Wed, 26 Nov 2025 08:08:09 +0100
Subject: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764140889; l=974;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=6yowbDUcruSfT+pB3Hc8Rr8mGdRNN9tkk1YhS+Cu13k=;
 b=fi8KOrh8x9MJfniLee28k496XKjc9mUk+IoZmDHr0DpuL04GI71pXFWvmFsY/KGQjSwyFbnxq
 E+ffkN+R57RDfwfb6dh9Wr/mo9+on+eini+nsUKg/RpJ9EDd3k1D+Tu
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
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
Reply-To: jeanmichel.hautbois@yoseli.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Change devm_clk_get() to devm_clk_get_optional() to support platforms
where the RNG clock is always enabled and not exposed via the clock
framework (such as ColdFire MCF54418).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/char/hw_random/imx-rngc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 241664a9b5d9..d6a847e48339 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (IS_ERR(rngc->base))
 		return PTR_ERR(rngc->base);
 
-	rngc->clk = devm_clk_get(&pdev->dev, NULL);
+	rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(rngc->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
 

-- 
2.39.5




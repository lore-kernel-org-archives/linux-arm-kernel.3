Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88485CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSnUGGsqliXZtVPf5Iq/8Ik1fxyeA3/3zV4qlHUuLAA=; b=mFteJWPgRtvmLoz3FAkt66xg9k
	NXa8DM5G0/1mcp/NjB4fXTJPJrV7KIEQGaK2aarAG/6dxLCXS8Lt/KMX79wRdGaRr44BLzC8RUWv+
	MpBX6jGvQsFlpcH5M195OgqZeNBU+k/OWDy7ir33HIcRT+e+0+9STka2huup82rGAoX1WAPA5hfjJ
	xgLjLinQ5+1N5DxbaOpH3gbuevDb/fhwoHqh4aT2mYgb2jzJPWHvHA20HX6XcSg3CUT2QwcnIhzt+
	P9zbseAXeMrWBvvGZ8LF16nYS2k8fAETj1V0+9gvYuhSejam6JsX0pqzqKcZHx6a/mQ7L01n8hsjF
	05pGPWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO8k-0000000AFXy-2YBX;
	Thu, 01 Oct 2026 21:16:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO8k-0000000AFXe-0jzj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:16:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEBC940C0D;
	Thu,  1 Oct 2026 21:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7621F000FF;
	Thu,  1 Oct 2026 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889389;
	bh=zSnUGGsqliXZtVPf5Iq/8Ik1fxyeA3/3zV4qlHUuLAA=;
	h=From:To:Cc:Subject:Date;
	b=acxTcB7s+ZX69fXTAmC7+mtGdOYqretKx/g2Jj52GrMbffhHEmyNsLISJIJMEiK8W
	 Ehxa2Pi3+gyWg5o+D2nmLQv8LxgtSa918yU197Nt17tUgWzO5/8WxyTgtOfnGred3s
	 TYM9Vy7qww2oGoOJ6LMEnWChlcc//pdKxFJfxV+BN6uFyisbUb8xLgmQBMqV1iGEI5
	 aK+POpb4zU3iEJ7UBfnNTPGnLjwfdlhajpH98HZNA7V6rCDTyYs8/E1rRB5Sz2Fg7d
	 ++shZcNveIURBsXc23XhuuehtecAH0nVLLi9seRKGU4EwyELx547W5MZhRGzOE3Ptp
	 eJdNnJ7R8ZUsQ==
From: Thorsten Blum <blum@kernel.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Can Peng <pengcan@kylinos.cn>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: stm32 - reuse clock rate in stm32_rng_clock_freq_restrain()
Date: Thu,  1 Oct 2026 23:16:10 +0200
Message-ID: <20261001211612.38124-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=blum@kernel.org; h=from:subject; bh=I6yVwfx+zM9opQQWnAvcPhamuhdJnFuPIZhE011Wj+M=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn7zs6Ruv6M4+2dqdlyR2ezVlv/uKxsnV8jcIztl96eq T0L37/92VHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATyfBmZLih+/AMH3tkjfef YOmny4ojis8q7LDfwaQj+sV9gaTf+0kM/8t9NnOw1TVXP1WR/mvHs6KmftnMhlmnL16SMn06vfj pJwYA
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

Reuse clock_rate and avoid calling clk_get_rate() again. Remove the
extra space before the colon while at it.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/char/hw_random/stm32-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index d3fc910f674a..319944d92b82 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -277,7 +277,7 @@ static uint stm32_rng_clock_freq_restrain(struct hwrng *rng)
 	while ((clock_rate >> clock_div) > priv->data->max_clock_rate)
 		clock_div++;
 
-	pr_debug("RNG clk rate : %lu\n", clk_get_rate(priv->clk_bulk[0].clk) >> clock_div);
+	pr_debug("RNG clk rate: %lu\n", clock_rate >> clock_div);
 
 	return clock_div;
 }


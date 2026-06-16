Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FF3CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 01:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIBaY0k9zVGIJP/SSLcXb42bXbADd5fwDXzr8mujOWA=; b=kq1OEzBRqOanD5gBQCiWTf6qHp
	A+WNXZJcJloScpqgwDdQiFNsknVIKr86qwKCRYjvJQ3XJbgBOO1tzOwJZzXdnqfDO07AZqDDBZy4s
	7UFTc+Xij4bl+2T3zrqiS9guU3lmV50Q7CDLflkjhEFZlSdtBb7d+jJwRsMCas0G07J1tltxxPzvb
	Y/Oy11dKDbH4R1lDSVPZSaGJnH0EfQHWZMPBn4HuHaWvqLfsArTajznEM0N40GhzzGKM9ZfDEkQa8
	NI79pVDt2ecWpTYoqFh8lIRqArQ9W5btpdRafVNYpTzpDPnR6gV3fTylarsKM+THqf55+OPyQc6lw
	ZN3sQyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZILt-0000000F3RK-0cK2;
	Tue, 16 Jun 2026 01:12:29 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZILq-0000000F3Qy-3uyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:12:28 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Jun 2026 10:12:26 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 095CB2091480;
	Tue, 16 Jun 2026 10:12:26 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Jun 2026 10:12:25 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 5D3FD15FF;
	Tue, 16 Jun 2026 10:12:25 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	stable@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v2] spi: uniphier: Fix completion initialization order before devm_request_irq()
Date: Tue, 16 Jun 2026 10:12:23 +0900
Message-Id: <20260616011223.201357-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_181227_090292_17471D5D 
X-CRM114-Status: GOOD (  13.72  )
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

The driver calls devm_request_irq() before initializing the completion
used by the interrupt handler. Because the interrupt may occur immediately
after devm_request_irq(), the handler may execute before init_completion().

This may result in calling complete() on an uninitialized completion,
causing undefined behavior. This has been observed with KASAN.

Fix this by initializing the completion before registering the IRQ.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
Fixes: 5ba155a4d4cc ("spi: add SPI controller driver for UniPhier SoC")
Cc: stable@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
Changes in v2:
- Rebase onto latest, no functional changes

drivers/spi/spi-uniphier.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
index cc20fd11f03f..86fce9a571da 100644
--- a/drivers/spi/spi-uniphier.c
+++ b/drivers/spi/spi-uniphier.c
@@ -656,6 +656,8 @@ static int uniphier_spi_probe(struct platform_device *pdev)
 	priv->host = host;
 	priv->is_save_param = false;
 
+	init_completion(&priv->xfer_done);
+
 	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -679,8 +681,6 @@ static int uniphier_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	init_completion(&priv->xfer_done);
-
 	clk_rate = clk_get_rate(priv->clk);
 
 	host->max_speed_hz = DIV_ROUND_UP(clk_rate, SSI_MIN_CLK_DIVIDER);
-- 
2.34.1



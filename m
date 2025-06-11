Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5072C678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gwVNrrOgCt6c3A4bMp8fc6oQmlOLAuhVcwN8WtT7rI=; b=QiKv8T2HVB7cMHkX85faLlqniE
	aELQMKaPGTCl3j0ZcFU6brZR9/SkJlQs1Zyq+fi1nLGTtxf4GO2ihxuICaYL213blPgSvG0c1+3yx
	RWdN/InCkGko4K9eS77WQj+q4uitL7HYoCGdA8Eq46UzKkNKKBPYZKfKpos9bYltElWlw0Yp0AqhZ
	ki9XRx/LFAnyAAWtEBX82PIgSTvV65w05P0EV2CQpaUf482uUKEGcDVMldTZLEmJTyy6E7cL8tvch
	Rsb4/ykWvrbuNrsRArUxAT3xJYYm9P9U/MjcLqmBBmB1WcmsIAPLLQczEONPyIQlWXv1QK5+a0x2h
	C4AfuMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnV-0000000ADva-0pkV;
	Wed, 11 Jun 2025 14:51:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwI-00000009e2L-0WOq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9535F4A60C;
	Wed, 11 Jun 2025 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E828CC4CEF1;
	Wed, 11 Jun 2025 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638652;
	bh=XY1bFw2WKrjGrjUMr6K7T7hPamKz4LzK9z8ZINQUPZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYa7JADiz4vkuaVd9vaqDCAVjdCcDvLZc9z811fTBpqSRN9W4IorsCBqtY95TTXrA
	 t6e5T/AAoGoIjasNBY+R6YtdQGNIOFqzemBuzp8FxLGYcsnlU0qo1iUp5KuyWWlILl
	 0C3kpXeBUP1d7hrW8olblffTXajjEBvINLpAs5Y6N1FC7dNPmy4xJA0PFPUHwjpUxW
	 4QfTSK4r8/kCqB7LGQyCNugNqAhetxWdxOoXiQJsh8KJQZ7gEX3t4N42Kypvndi8MO
	 VsJ4FbtBLIxmzpCu4EmOEJsj4oaZhjW/BJso/ykP+zBMlbewthc3wVTmEd3rdXG67X
	 Ircrxk63TlvYA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] iio: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:37 +0200
Message-ID: <20250611104348.192092-9-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034414_185946_C2450B64 
X-CRM114-Status: GOOD (  12.90  )
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org

---
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/iio/adc/stm32-adc-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index bd3458965bff..58b5838227aa 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -407,7 +407,6 @@ static const struct irq_domain_ops stm32_adc_domain_ops = {
 static int stm32_adc_irq_probe(struct platform_device *pdev,
 			       struct stm32_adc_priv *priv)
 {
-	struct device_node *np = pdev->dev.of_node;
 	unsigned int i;
 
 	/*
@@ -421,10 +420,8 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 			return priv->irq[i];
 	}
 
-	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
-						STM32_ADC_MAX_ADCS, 0,
-						&stm32_adc_domain_ops,
-						priv);
+	priv->domain = irq_domain_create_simple(dev_fwnode(&pdev->dev), STM32_ADC_MAX_ADCS, 0,
+						&stm32_adc_domain_ops, priv);
 	if (!priv->domain) {
 		dev_err(&pdev->dev, "Failed to add irq domain\n");
 		return -ENOMEM;
-- 
2.49.0



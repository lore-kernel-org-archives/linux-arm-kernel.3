Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C38C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aH2ITVV0Ozp4vm8mjMwn2/awV1fzWs+W0IUU0R8TCrs=; b=Ugcsg6OqLI19F3Oruh83DKiq7F
	s2fjvKMSHQwYsyOr/mugxG3hdVeIEIxctMvWhp3IQTmKn47BgX2hkr5ENAnJu7VW202r/LXHdHZwm
	AWTn5/p/6+oMBquTU1o/TA2AvflTqtF3ZdzI90eZlXcr0f2Rh7QIx2DKHWcj2iHnwpEMRIfhvwTHd
	cb4kIN6/mt3FLiwYDC7F5kB04Y2u4mbpTXVTQ3Q4AojhBSo6cMCHeVFIMGHl4ypiQCGZDmtG+NeyB
	GfpeGS8Yj8c+/JVfNO2GZhZnfdYDVaaW/F5R9E6kpGYYJCDNd2woDvvMg/1TsSxo0GJKior2wsiIR
	ksQOiVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPejU-0000000CtkD-3Zy0;
	Thu, 12 Jun 2025 10:00:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdZx-0000000ChFZ-2VZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3338629E5;
	Thu, 12 Jun 2025 08:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBD7C4CEEA;
	Thu, 12 Jun 2025 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749717992;
	bh=q0g9wx98hCczaJZlZXB6wU/lJ/vXX/yhrFUxNtdecsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4ZzDTOMm61NFYpYB6+z5Vmibr2Z49kYL5cd8k0KqQ9JDUgYQJ7u65OkKMa2YJmj+
	 RPyeZZITd3zBmzM5lCW6MPM37/+Co2LHZu8ZOQBDsKWZJ1cBGWvTODCTID8f47ClCI
	 uDn52wkmG3saFUpQHqqZoL1gnPRS9cHERulCDL2l6XXQc7Vt4xMtXV2/t8+xRM0GjJ
	 am1cgbSW5d+ZyONNkmDqrQZ1FYgqFX4ykE/wyyINs5Xarw1eo/6l2TWTOqWHn4yEn8
	 y75TsIAs7+Gw80rAirMqqOLOFsVWk9x9QaHjJK2Q9BuOVeQBBlABD6+MMKic2QppPR
	 W7v8KBZH8S7WA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: jic23@kernel.org
Cc: tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
Date: Thu, 12 Jun 2025 10:46:27 +0200
Message-ID: <20250612084627.217341-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
[v2]
* fix subject
* wrap to 80 chars

Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/iio/adc/stm32-adc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index bd3458965bff..dea166c53369 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -407,7 +407,6 @@ static const struct irq_domain_ops stm32_adc_domain_ops = {
 static int stm32_adc_irq_probe(struct platform_device *pdev,
 			       struct stm32_adc_priv *priv)
 {
-	struct device_node *np = pdev->dev.of_node;
 	unsigned int i;
 
 	/*
@@ -421,7 +420,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 			return priv->irq[i];
 	}
 
-	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
+	priv->domain = irq_domain_create_simple(dev_fwnode(&pdev->dev),
 						STM32_ADC_MAX_ADCS, 0,
 						&stm32_adc_domain_ops,
 						priv);
-- 
2.49.0



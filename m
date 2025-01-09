Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b1S07P6ipyyaF68kZ8ct/N/eoH77nJy71KA8cOifmO8=; b=kkjc80J7cHNYpQlcmhyJ4KqMDn
	0q2EFQRj+YH0cd9/EeVbMEorHK78mFA/LKnIKEJdm2Z+/6tCcGe1O9czo+VL5UMwsMUI5ZMxxzzZx
	5EkXrFK9D9w2K6m2VTdeKM6j8a2DYXhrZU0qnbS7GMZag3WHNlaBay5k6/4wK+FOmt7niPqiEv+Gc
	RhbK8BCQBM6y3aMkuqKTgqJhk0riAr/6eFy6pMl2reydPUGndtWpoWbX4kxlF9f8M90KQGjPQQKh+
	57r1QjL4wpWeQjrMLI25tFPhpWXbdZYUrdKlhxM6U56l5y3PnBHUHFeHlycD5+lWwtpTGlA+Ms83c
	dmN8O2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxF7-0000000CyJC-2br2;
	Thu, 09 Jan 2025 18:26:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxDu-0000000CyCt-2ux2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32C7B5C5CCC;
	Thu,  9 Jan 2025 18:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C514C4CED2;
	Thu,  9 Jan 2025 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736447137;
	bh=jJYLqX1Wvzo50KTj3seMVu0AOOohiMA4zPktn26hf9k=;
	h=From:To:Cc:Subject:Date:From;
	b=a8kj6GN5ah6Hv3gjYu1tvtcReuujhZfGlMSBObitDYHC8gfHsvGi/yQkBJ9MXohgE
	 p/+5qpU5zP/dIfd3cyq9CUr5gFlAJIxdglh7t2VJrJh6RaKT+HXyE9oxr52xnU3TCc
	 QWqQNPznHsPTFHiQiB9isVnxuRVQcjNCXFjA2Oyh2XumqP1B5VK1A7HKLIsLUznGvZ
	 YONUf5mG2zwf2i6oDh6RFE9DjfiKR/iuCkqB3yfiH1m/BYuFr9b9PRIYHvCnBYDRXl
	 yBn+29hzva82f9CFRA/CtSk/RSeGyeL9bfGO9Sh5nl5hoZwXLiXccaW+FTXnXjrsi4
	 Yo1jPThexw+yA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: stm32: Drop unnecessary DT property presence check
Date: Thu,  9 Jan 2025 12:23:25 -0600
Message-ID: <20250109182325.3973684-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_102539_488545_380A69B4 
X-CRM114-Status: GOOD (  10.65  )
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

There's no reason to check for regulator supply property presence before
calling devm_regulator_get_optional() as that will return -ENODEV if
the supply is not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
The diff context doesn't show it, but the next line returns on error 
other than -ENODEV.

 drivers/iio/adc/stm32-adc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 2201ee9987ae..0914148d1a22 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -615,8 +615,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 	}
 
 	/* Booster can be used to supply analog switches (optional) */
-	if (priv->cfg->has_syscfg & HAS_VBOOSTER &&
-	    of_property_read_bool(np, "booster-supply")) {
+	if (priv->cfg->has_syscfg & HAS_VBOOSTER) {
 		priv->booster = devm_regulator_get_optional(dev, "booster");
 		if (IS_ERR(priv->booster)) {
 			ret = PTR_ERR(priv->booster);
@@ -628,8 +627,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 	}
 
 	/* Vdd can be used to supply analog switches (optional) */
-	if (priv->cfg->has_syscfg & HAS_ANASWVDD &&
-	    of_property_read_bool(np, "vdd-supply")) {
+	if (priv->cfg->has_syscfg & HAS_ANASWVDD) {
 		priv->vdd = devm_regulator_get_optional(dev, "vdd");
 		if (IS_ERR(priv->vdd)) {
 			ret = PTR_ERR(priv->vdd);
-- 
2.45.2



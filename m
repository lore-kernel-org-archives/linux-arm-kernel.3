Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17790CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qkIx8q1CfZPS2O/VG2jjN8ujjCBCEKLsuaA9oPqWhZ0=; b=iDRZtfrsAeB0Iq+ZdOcwQqE8iX
	bWCb5qzEzo+IOsg2Fwc6rkNqHwyqvEoRpYWt8a/Ud6wrLt7jQi8ngbQrbwi1CeRh9jhTuYbPFClMa
	umNUBMMoH6Mgf8/RyghAlEN2itkIscXdZxOViX+oHCJQ4Z0fTSIIXBYDY+EvBrgGsJTbxY8b5nEzX
	66fZdKN2TKnVhPDueamCh1TdUC74f58gxutCGA52SSQXvNwaFwO30mhpBDjTXpvb5OfvZfkRRlYvv
	dsweiG7zriQa9T+zJFp2Zyu6A2hRfvI2Q6OKX+OCF+nGCsLL+UbNHfLhfuf8m0Z37c+Phkr7XqwuJ
	QqKGyrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9nG-0000000Bcvb-3PgS;
	Fri, 12 Jun 2026 21:52:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9nF-0000000BcvQ-4ATC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:52:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD082400F8;
	Fri, 12 Jun 2026 21:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8038E1F000E9;
	Fri, 12 Jun 2026 21:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301121;
	bh=qkIx8q1CfZPS2O/VG2jjN8ujjCBCEKLsuaA9oPqWhZ0=;
	h=From:To:Cc:Subject:Date;
	b=COHQ8nn+uwEmeREHJbwM+ltA/GmYxv8zojZJDDH0O/FMsq3kOQyUyg8/pB2S2psgE
	 P6rdCYfomyFhWZyc4cVVAe1stYBHUUflYgm/MN+n9zc3I+IPpzeC/DgoOtnT4dtdv5
	 JVBLM9mFZBHZfa4xp9QoSDst0mg8yorOCHpcSr2EgzsT2C5/lDuKTjCQaW3RmJ0XVx
	 js5T56CwI4iS4eilAKlTzsop6BJwF6iAfk/xk5ANSqY5x3UFUT8DMIcUGHiT/kffd2
	 eNS6AgSaNlucRPT4BINvUY0PRbGYU03r41WKqASzYsoqd/59uqiIhcYUnZ1j8UhxpF
	 /Xl4r2Xxgd0RA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: stm32-dfsdm: Treat flags as booleans
Date: Fri, 12 Jun 2026 16:51:50 -0500
Message-ID: <20260612215151.1886851-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

The "st,adc-alt-channel" and "st,filter0-sync" properties are
documented as boolean flags. The legacy parser read them as integer
cells, unlike the child-node parser which already checks only for
presence.

Use presence and boolean helpers so both parsers follow the binding and
the property type checker no longer reports the flags.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 9664b9bd75d4..00f05e167afc 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -660,11 +660,8 @@ static int stm32_dfsdm_channel_parse_of(struct stm32_dfsdm *dfsdm,
 	}
 	df_ch->src = val;
 
-	ret = of_property_read_u32_index(indio_dev->dev.of_node,
-					 "st,adc-alt-channel", chan_idx,
-					 &df_ch->alt_si);
-	if (ret < 0)
-		df_ch->alt_si = 0;
+	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,
+					    "st,adc-alt-channel");
 
 	return 0;
 }
@@ -1815,9 +1812,8 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
 
 	adc->dfsdm->fl_list[adc->fl_id].ford = val;
 
-	ret = of_property_read_u32(dev->of_node, "st,filter0-sync", &val);
-	if (!ret)
-		adc->dfsdm->fl_list[adc->fl_id].sync_mode = val;
+	adc->dfsdm->fl_list[adc->fl_id].sync_mode =
+		of_property_read_bool(dev->of_node, "st,filter0-sync");
 
 	adc->dev_data = dev_data;
 	ret = dev_data->init(dev, iio);
-- 
2.53.0



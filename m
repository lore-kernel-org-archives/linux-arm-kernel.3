Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79EBC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=; b=SfSCKWs3sCY2LyGneyWnRwdbig
	X2XvNEQOtkTAvx2gikqZ2zLCwQl+LzzxGh9pSd96RHI0p8yE7BNE7jEWakHa9s9xFPcG8qY4NDC4Q
	+Q1uK6O2EuUujkegkD7fZuZXyg3ZMVnxVGvGgyODd2NE2m3axSy84vbN4bxBapIdzzIhdiMsHB9hC
	P3gnhc8HO4JAQwkrn0NcKoc+agdISmpxjr7DFojl/LqD7FVM6WzB0bd5aIIDHqhkLGLtPttUrrNPK
	2fCRL2cN9EF+mRC+m9fvfe+M6bB5LNiRRotj+uwlpsZlgFULw1KjIauF9hco/Agb87pkXZxvFPUh7
	QhdWLWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5v-00000001Pik-3Zi6;
	Thu, 09 Jul 2026 08:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5t-00000001Pfp-1oYy;
	Thu, 09 Jul 2026 08:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C767643F83;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4578C2BCF4;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783585612;
	bh=Cc2E8akdH+G5Ofl/remAcjKjYApuWhW2x/f3uTajPuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YNbV1veO7EUA+5IxYAX+xfO3cP/9RbSB46gB8lslzzu86q4S5fygqcC5gT1pRbKo7
	 Q9Ob5hedHskFnGAHYSZ9OxW+a0mUHz9kzbjVnr7dank87ovzDmTnE4IpGryoxB2KXZ
	 YSFYADA1U7y8hDWf80RV87uEsVtJYmXHc7n02thsqyVnAzgissaXrVyiimTE9RYJzb
	 XOAd4tRgYnFpQaZbjILWY2PKinlOoNRTbCFatBmsyG09gj/KwvlUdxBaXbpz/4aC0X
	 R8lzXJ0V4MoItjA7wRab4TGXJ0ogU+Ff1QdCQun8+bIXsJDESNuIBn7EbQEdaOu/gG
	 LslAqdWpD9M9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB8C44507;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 09 Jul 2026 08:26:49 +0000
Subject: [PATCH 2/3] reset: amlogic: Add A9 AO reset controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-a9-reset-v1-2-fd7cf039b853@amlogic.com>
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
In-Reply-To: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783585609; l=1414;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=patSBH/uW6tkb/H97P+dDOJPShFdk5yhMtjXp5whRlQ=;
 b=Wr7Qnot0A9kH8SFK8eAdVVE1BLLzUYjbyQMygeJ0+Mtyg7GsbDeYVajtNUYGCghvp8wcPI5Uc
 kpvQ9xiZvC4CMtPPUY7zXfrAYsOdt9tcGtuqgcpZZcZ6z8/UK12bswT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/reset/amlogic/reset-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index c303e8590dd6..5e8afbceaf23 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -49,6 +49,14 @@ static const struct meson_reset_param t7_param = {
 	.level_low_reset = true,
 };
 
+static const struct meson_reset_param a9_ao_param = {
+	.reset_ops	= &meson_reset_ops,
+	.reset_num      = 32,
+	.reset_offset	= 0x0,
+	.level_offset   = 0x4,
+	.level_low_reset = true,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -57,6 +65,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
+	 { .compatible = "amlogic,a9-ao-reset",      .data = &a9_ao_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.52.0




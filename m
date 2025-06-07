Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCE2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K4AOJpiDZwth/4svRgP/2cJFuZGORRyHjzQxI5qtzo0=; b=kaKx6RIvTnL6NzJBSVlwQghY5V
	uBeX1lfIlQXe+M+SP416It/IUMWiFWCQuQnamXNTBEStBg5gsWb7IqKScRe2VnqAdimyPQRpnxDbM
	0ONrbawn2TCOKiTtEmPsKREMH2OYJ2XCOheEKcrf4JJlb/unSukpN/HhdVDbQjxDnViMcI+UD38vN
	DBZ+1RKjPptZTEqscL7E7INmCQ5zvdXExvuUBfEU6/t/Qqfnssd/DTZjGAe2IQVxpgLqQ+DjrQT1w
	e6E4U/mgmGQZj32NfMpq+M1n8XyRVpXpE+el+EEj1huuUZlNsqtGc/aoKpeD7+J1SEVZQZb+vWXpf
	CYINdmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNu7I-00000001jrS-39nB;
	Sat, 07 Jun 2025 14:01:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNu2C-00000001jWf-1zfx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 13:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF79E43797;
	Sat,  7 Jun 2025 13:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EFEC4CEE4;
	Sat,  7 Jun 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304591;
	bh=2gPXD5yjmhI4B3pKH5Tr2d9zGU/Zymv5lSEf8kaV5AE=;
	h=From:To:Cc:Subject:Date:From;
	b=PYczttIGX2Dtvj8t5QlBdf+DbvRTjUxRu9FmWiv5kh2Cvyb35IT8fUivey6ieSadg
	 N0DSZuE6ZLKFCModOp2dBfHTi/kDyM3sGLkEB7O8otZ36IEtkhblHEvsmrKnrfWgRI
	 wNwJsCrLUl/JKESMqS7morRlwqXII023XU8rh7DpOxQmJMvAG2ACSzRXTqMeyzZ/sL
	 EC9mgsafFqv5jUYjXBxjjJFmIHsqTNnJ20bgk8Om7b+axNXIckrFwO62s+vkLBAgVs
	 eBiSRw0q+eYLh6MdGkUhOVepRA/XAdapdrQdPH8bbLpH2UWdstgBi0QMYmhWpTEMzg
	 i0UZRBeM51mgA==
Received: by wens.tw (Postfix, from userid 1000)
	id C656B5FD0C; Sat,  7 Jun 2025 21:56:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] iio: adc: axp20x_adc: Add missing sentinel to AXP717 ADC channel maps
Date: Sat,  7 Jun 2025 21:56:27 +0800
Message-Id: <20250607135627.2086850-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_065632_537259_46E7977C 
X-CRM114-Status: GOOD (  10.09  )
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

From: Chen-Yu Tsai <wens@csie.org>

The AXP717 ADC channel maps is missing a sentinel entry at the end. This
causes a KASAN warning.

Add the missing sentinel entry.

Fixes: 5ba0cb92584b ("iio: adc: axp20x_adc: add support for AXP717 ADC")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/iio/adc/axp20x_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
index 71584ffd3632..1b49325ec1ce 100644
--- a/drivers/iio/adc/axp20x_adc.c
+++ b/drivers/iio/adc/axp20x_adc.c
@@ -187,6 +187,7 @@ static struct iio_map axp717_maps[] = {
 		.consumer_channel = "batt_chrg_i",
 		.adc_channel_label = "batt_chrg_i",
 	},
+	{ }
 };
 
 /*
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579ECC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6nibRdhuL2j27qs0nOM5Kl2XsO5WK/xzvx2wHrcxyLc=; b=4GxAwjJBhkzGss2gtm5GyTlbh8
	zVuL2+Uafa6UDGEwOZuOiipKzmXM8SwIsv82Fa2L42JawpF14TJxchnBz04EiruLl1C/SjxgjN8Ay
	ZNUM8IzgKm5O0PEbylFXcA9+sB26MvHT3uAAk33T8EW81ElxIyU//34kMv9qIjDaf/jvnBK4EAB0+
	SWXLJ8n+MbwrRlQn44bZv2NO6Pwn1El2wwe0+Xu1U8eP8zIT2AT6sA7zO8l679JIwRezsnybqXH2i
	z1ywqmFgTjEdOXDnjr08OtEFmxMwa99tdEBrI7yjckEmSB8zGF9w/xfSJMoTXggE/AQXLGXfmqZYa
	EqbrPiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMUs-0000000BwjU-2OvU;
	Thu, 03 Jul 2025 16:09:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKfG-0000000BcDW-3lil;
	Thu, 03 Jul 2025 14:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551909;
	bh=qNbhqJeNbhpXv1o7b2f0VNuXEeUdtZei3EuXHU8wbYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=R0L2jmeCjUngw0SFHUg0wwmWulgTkrFrxcdEncCutPv1i3/RPMT8zWCNkNNKBuvJG
	 MdS4h6KXRPdfkdeTY5la2J9B06iuyf+P1NNTGClZomMHumPJpPovZmpsIbSd9Jut5a
	 z9TfarWMf0DSx6yV4eU69w9Jxt/3k2yynOg1/WU+urfzm0hbCTqk4v1ZL+GGxP7hLQ
	 GiL1FIUYEQOUkgJE550cvzks1+uvodw8Ml5KdALXURNkxH3OtFOZWM8jR5nuBWmG3c
	 QTFqUrtvsBEnzY2NEwt3rYI/ck2DBWD8n6s/0Nb0s2OqUHpmxAUPvVHDkEs8QIBG4e
	 2gnb9GfBSvzaQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C06917E0676;
	Thu,  3 Jul 2025 16:11:48 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/6] iio: Add support for MT6363/6373 Auxiliary ADC
Date: Thu,  3 Jul 2025 16:11:40 +0200
Message-ID: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071151_088459_D096BBFF 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Changes in v2:
 - Added error checks to all regmap r/w operations
 - Moved adc_vref addition to different commit
 - Various other fixes

This series adds support for the Auxiliary ADC IP found on the new
MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.

AngeloGioacchino Del Regno (6):
  dt-bindings: iio: adc: mt6359: Add MT6363 PMIC AuxADC
  dt-bindings: iio: adc: mt6359: Add MT6373 PMIC AuxADC
  iio: adc: mt6359: Add ready register index and mask to channel data
  iio: adc: mt6359: Move reference voltage to platform data
  iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
  iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC

 .../iio/adc/mediatek,mt6359-auxadc.yaml       |   2 +
 drivers/iio/adc/mt6359-auxadc.c               | 440 +++++++++++++++---
 .../iio/adc/mediatek,mt6363-auxadc.h          |  24 +
 .../iio/adc/mediatek,mt6373-auxadc.h          |  19 +
 4 files changed, 416 insertions(+), 69 deletions(-)
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h

-- 
2.49.0



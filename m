Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BAC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TBrPYPANJ5pafxonmIx1u9yXyF1lM127wAKipCfXUTA=; b=T1wLXx36MwjaplJGM7JOHhamnh
	h1wcfMs20f+yQ2mPbyab0rEW4EjTHbPb0u/CthPzB6QwXbZ2Z3EiujzBtxrKyz3u1qnlFWwzHLAjl
	J7vHdzZFH1Wqu17yf4DzCBs84TxfEONor5E/X3VcctUPYaiuIkVciMFG0UiNxpb/78KgJXpPSmufH
	yQJn0gC6qqamDwLyJDCm0qrY4cB5areBCZgdQrWlpNfJYyA3XI6oaDCdEDhSmuEoRjAWoSSuUC0UY
	Pr3pUqLzPbfdI6jG3qDwlgudq+ZenUo5vRuvDAi6f0kjCmuZSD08b5y0aykdM55zORiNJVwKFkkUF
	VWcc37ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThKg-00000002tHZ-1vlA;
	Mon, 23 Jun 2025 13:35:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqk-00000002acq-0YHe;
	Mon, 23 Jun 2025 12:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680032;
	bh=vqC7/dRRuxXVceTiV50u4w8iI0r3/QlUaKmPz+SGA8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=p7C/I3vr2J3F3BOlwxg1ReMlMIP9LHJ6TB/fgQvphplPRizhTXKZDJtcP2Mwzcmf3
	 h9M3+4IrjTZxRdz4nVhhYEAKACsUEqPWkfNvKEwi0bmbTh1KgEwyZR9scW5Mqiw7ZH
	 7N098cIHQkV4UDetR2Z+YtYRJFNc97QZ7dB+bPm1ME6vNMf9IX30b1nv3E2nKrW9rn
	 3GodcVlcpNxmn4UD3GFhsq70OUDN50JyXi4xqdLLlJjh0R0gz3K6BtpCkn6DO/5yga
	 I9iFYvNPPPJDTyKktmr45wjDANsIvHYaygX48fIAj/Kk2p7PG60C6CHi8qWk8qIFHn
	 I/VwwdipEFaXw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CACA417E0342;
	Mon, 23 Jun 2025 14:00:31 +0200 (CEST)
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
Subject: [PATCH v1 0/5] iio: Add support for MT6363/6373 Auxiliary ADC
Date: Mon, 23 Jun 2025 14:00:23 +0200
Message-ID: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050034_343528_9AA23A97 
X-CRM114-Status: UNSURE (   8.89  )
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

This series adds support for the Auxiliary ADC IP found on the new
MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.

AngeloGioacchino Del Regno (5):
  dt-bindings: iio: adc: mt6359: Add bindings for MT6363 PMIC AuxADC
  dt-bindings: iio: adc: mt6359: Add bindings for MT6373 PMIC AuxADC
  iio: adc: mt6359: Add ready register index and mask to channel data
  iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
  iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC

 .../iio/adc/mediatek,mt6359-auxadc.yaml       |   2 +
 drivers/iio/adc/mt6359-auxadc.c               | 401 ++++++++++++++----
 .../iio/adc/mediatek,mt6363-auxadc.h          |  24 ++
 .../iio/adc/mediatek,mt6373-auxadc.h          |  19 +
 4 files changed, 374 insertions(+), 72 deletions(-)
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h

-- 
2.49.0



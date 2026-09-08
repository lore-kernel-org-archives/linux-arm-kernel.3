Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA64C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=; b=lBA0gKKe5Gq9ZemAersT6TTS1H
	bdi2fLKNd40e6xfvGmmbWawWO5eZk2b04+5KED+DfjOY5NnDMt8vRyEmlnixZ2aKHXb35XhwV2nY5
	YKP0g70n3k7xpul617FxhGZ5FnBTM4q4M0gQWptqPARvjJlaXb9OcSP+m3kaMzprvtkLwWXvmvjRX
	nkSK/BhwchVudDgcGMhOJPqU6QuwME8n6TGwMy2rVzIs+XGEHNTg76Qanh+Ulb7aZfVqXegNJ21iX
	SwB7xZJ4S6ZkOj0uiJe2vgZ2ULmisz8kR/qaA2NavuixqrPlJ/6q0Zi5aGmda5FDl34YJ4JY12Euk
	VjgTNFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlE-00000008V6z-1h5E;
	Tue, 08 Sep 2026 09:05:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlC-00000008V5v-0xRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:04:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4858303de5dso5400073f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858296; x=1789463096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=KkzF63N2fNoOi55ymDrHIg3ur7SCroT0/GKk0c9az5L3IA1qUds6PdwVct9WyBuW81
         QjEAdnGc3SyUsluEAaJ+W/iypnkGyBF1ZgSjP2EBz2AmXluRd8/n5riSOxPJcIkNqhyY
         MBUU/rTEdIWH8wM5E4xwPa6cvY+pQx0m/OProSIVkTTXrXYpLr5odQhYCwdINgbmvQJc
         FGtBd6QXU6085zJpj+NPniI3sLRcUryCibLZ20wq1KZ17ad0KnfKORFppH4JuUeyKht/
         DyC06NpaYdll2k4YPeF501OOPCOo/TehD/5s+7egtjRDvzOPR0145yMUbD9g8pm3JM+o
         nhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858296; x=1789463096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=nNNbYZ2o6tGAoWJLUxfhNvb9UjubQi6bbNsBNHbZhmyyGWA7ekdEnw+Fiea4OUyCLc
         LksVAdXOAZU39VRGcQSLxNluPzzEtp7sWOzdxpxWCAVVszjHWp4KeShdtepZLXEHSHMI
         SNTvXHui+KzmkPy+iVnjv4loyc669AGjtWnKGzah+q9lQppn6nrRTjYl5n11SaR2yBkQ
         8PR/Y8ZH9sXBvcwyhnJ8Y8ZnursnO3k6qtpe4GBAoUEEG2eCoLfRXclMZc4Y3F+uW+A6
         l6SxZEcAiy6BrVR/QixHrHmogvvb+u3ezYYArJ0d4j20j2A1ISQjT18cZKAH/xULEvON
         Us5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvcfuzHsm0xduudeRn6ZallHnHv+pPlCR1TgP+K+8giz+bNaeqmFmG9DaFn7LbSDxQgY8pCfq3Cf5MFrUWOOYb@lists.infradead.org
X-Gm-Message-State: AFuF++n+k+4Hr+SLuvyVocjSqMNm5oqD9GmpXQdX+DXeyJwkFOVxw2u+
	o0N6CjnjbZGfCcCm1sAJOR/L1HWLwU0T03uPcSbZu+xIK/LPy4oRcguK
X-Gm-Gg: AYBFou1z9gUmrMuac2RfaQlC1HAQ8H7RpMwxZ5ldFeP2uwU9vbCC162tULAJGRvFHCY
	Le/vL3E60jOy0dsy2qFQ6Pb2PSmWmPvpa7t0RGtko4z5Cu3bHiBrrfAlfnyoSFHjjsNGiUeNimg
	UFnodaCE3IZdoPGKBszFL3iuW8fDCZG5EDFy96RbCjuYbsxn4YPWDjOUyJEKrqk+oV1z8OcjcP3
	44tcns9dDwj05qla7jZDDaY95RVGXOyNWlDo6VFn3i9jOy/fHHb6lk2tdLr2dyfTON0dVy499O6
	slYXtZxHxAvRvJQ/z6ssv0DLgku72CkRbHUNjSwrYjTPZt1VrlyqiKiSqiuFEipzkHX0rkPhsn7
	F7qmCZFQSekMiYyai3ibodpeCJufGTh2ZTfzF+B6E8ttqSnu9v90I25GNM5iT3r1Q5Zq8Xf5MmY
	q0K2Z89+wOs7Quf8YLkgWCK1/msk0Fo5FzRNenb/lKSC7ey013F3vQDoStWaQRaG4q7nj8nlbDI
	p7WsTnX9KRq1r3vqmrdJz9CNfpQ2eshum2Lt05TEzHmeJQ0ynIR
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a33b with SMTP id ffacd0b85a97d-4858c16a5b3mr26273747f8f.48.1788858295822;
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:42 +0200
Message-ID: <20260908090448.3332-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020458_285709_A676B0FF 
X-CRM114-Status: GOOD (  18.20  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v6:
- Fix PCM probe allocation logic
- Split driver patch to dedicated PCM/ETDM patch and machine driver
Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (5):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE driver for Airoha AN7581
  ASoC: airoha: Add machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1439 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0



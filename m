Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC1DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=; b=aOgpUR4yHB6RQgH7tgecD81iNU
	ArHtow/klCNNOGitFx/bJBMimsOiPHq0RSp0WRdhJyascLlDa/kF+w81F0abVfveyfSOH+YEA/UQQ
	FaqJoQj1XhTUy6mZKH/rpaoEBCsr7BYS1x97LJmGu999jWvIWGGUssJpqNViMxZdzue9BNx4HKLif
	YYlQAZsQzKTRhOE3ZAaKDkSPDZ4NuEMYq7YVt3Q7sT3J6XN7vx9AgyAPB87bK3wY0eO6XSLUjmfdI
	WJf6scJ7+0F9HhsSdL7ElTEPAjSgaEbG8xnIfsXOuSEB9xzJRX0nRnnaUM2v7CMhtQzBC1MUUgjWk
	tXa3npLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqm-00000006899-0itw;
	Thu, 28 May 2026 17:48:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqi-00000006876-42WW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:48:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso74346095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990531; x=1780595331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=d0cjBfMo1W7aDk4PnByCMbqH2YTAa2AckFLkHwuFU8QjVcaspwd1f3ZvPIxuPCy9K+
         uGsibCFfPRihP/bNsqYRRcFvp4ZSvPX/WqAfjCZPQlLCuutS9727CHQ1ZL40/b/44PnE
         xZTE0t8rs9JTvQ4XQWwaMoiEiaMtCUPWmTjTZ1pGfmpHOAu+PRmrbc4Tra/otjnrWz6W
         qJw7IlgGLg0fT4G4KWQx8z9kZ7vU03Pf6QuWEkr+Bnjr/g9BDN7DOsI9QqJm1cqm/oZp
         xF1H87MGhzm/4N5bowxvooh/XvqxQoRNKzckg9It0BKTlXWtKT389CJNbWxxEGMbN2gJ
         ECQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990531; x=1780595331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=tHc9Vn6I51yV8AuCY3FgZuGhK0IKDaM9+in3QiQ7W5V6AvUNbmOR8Bi0e2Au2EgLX1
         uNfgV65OrITJ0auZEq/vAvIASkZn6Tcu06Rfyh2hUtE5c2nyHjk0/9R8ygxMxspp+Jc1
         GqfeFi/m0lJ+X4XJHPxDph6OuakK69+jJSCUEmCb7tDQLRCuMCY1ZRyeVt8FLWcBh7Fe
         OxI7VyYWbgPzwIM7uOUITbh9hVkiQKfy1IGDYkhqpRvpudzP01by570GkiewOrvgFRnp
         KrPFAY1aNaZu6IwfODyuuiQyw9q9WyRH/x42JMGUnhEprdZjMCr1LicV84HYbTTFn/qI
         TMrA==
X-Forwarded-Encrypted: i=1; AFNElJ/XGAvxq2FesGr6K7WSbWukjbmJAaGXVljkjCPhF2jK+hZwnF0ylKt8YMWSCdo0REOBjQ/hGcpZ6l57OKWpDKNm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7MwqUzk5gAjNIhh0BmyC7q7Ulpa6XRmJkN++ZFe7KWne9h76f
	MKqZbDqY10HXWWIEVwK3xKwWGn/vP1SGBTzVzm8T/9P6RzazOapL4oQL
X-Gm-Gg: Acq92OGE8JPNG1hiyKsMsm9nlf3txVqrtGbZJ2iG/IYbtyuvJOmdLjke4NZminbN9yx
	rb/bY8F8RrtifOpIx+tlFXq/pZbTcvyzfzqUUrByOqhCDmpE/lY8G/TRhotf2l1Z1Eu/h2Z92/T
	fROjEsADvw5QlXA2H+K0712s5jQfoKFSfAMBLf4gkj/7ES139AzponL/C+8pSlUDRcjyqY1Wh8C
	FA5KieXFwog+1geHA+EsmHxNZis6SLMrPSW5tvEdXBhtUbovlX8RpTmGE1huA6gn/ydn0frnD7m
	93RKJESESXCpAbdN+wgli/d5Z57ksmthWB2XgcAJiqoz2a01+04HoeBd0ZcfKKJYk+j6KOtSstI
	mKMeRxdyyeDy8xsEQC8OO8tnLXwm7loVkhMx5/TO+MdsERZ0zXQZPLk3AjdBTh+Y60VeXx+M3TU
	k/Up3HEJcL5ZlmBXXqCB3A5j3Bl5J9u1N4/olChyAtiTTGRn+ZG2pzjmY0arOk0vRlLufJEdfRs
	MAPS1lUa8Gq84CR6Q==
X-Received: by 2002:a05:600c:1f8b:b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490686997b7mr266156675e9.6.1779990530436;
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] ASoC: Add support for Airoha AN7581
Date: Thu, 28 May 2026 19:48:28 +0200
Message-ID: <20260528174840.28644-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104853_011870_B91548AA 
X-CRM114-Status: GOOD (  16.70  )
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

Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  48 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 453 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 156 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1467 insertions(+), 6 deletions(-)
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



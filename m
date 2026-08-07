Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5946C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=; b=d8xNxtmY/yHub5BMWMC+/Bv9gJ
	IRFm4gV5rF58YYxbqx4k/kJtLdJmC5ICKpDuthbU771lUqE9wZw9wxvc8lYSvopUOAB/hZxAjhW/V
	dvuGKDFu4hHgw8WsYq8cX5BbG8qytmYSzuNXhGMAsIyJQYTIOIg7DQBukHj0QsNAAmdJ4Y8SnRUzh
	KNyLw+RemvdMukOAnmLCFXp2rPbFUopjpv1AA9BBLiJdea7bn4+ud0vST8lznNrc0tes+mENv3j2T
	RtkKf10B4JG4sn++MfK6EzTfuLqTAyBmzSmDspvrDww9gUOGB+RpzW8Tc93XcGOjHpltRjqekA5k/
	cPwmVmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt3-00000008hHs-2VoM;
	Fri, 07 Aug 2026 20:09:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt0-00000008hGW-3me4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30852505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133384; x=1786738184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=QQSL2GSBAv8P1zXXz+kI8WySV1V4mIRjcaqPdkjjZBw4BJeb4WtdwymLkJ9CpBSvzN
         X5U6pdH1hBu1sNcwDZJ/H/OCDGOX2HfAJFTvUP0xZYBh1ZBvTpbN44gXqo5P0at0xk+F
         /KERnNS1s5U5vWs+kIC3uaDctjb9ULtccMneCrDLNEIByMQmzvIhD6N34ZyZbBk9IT6k
         y/547I+gRDGHTl0EUBxoecJifonA2hePP0gakdHzeJcze6A/xZyGhaC8H9Ysgdad/v41
         Y2REb4IeaeUryZPYMs550evTcsYRrWonV4goZhWqb2zPsZs3LITTC8DAW/Ieu0d1GGFh
         EcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133384; x=1786738184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=d2MjkCXoXj+toVlyisGVbHB8IJDJsKkxLbLvXG4mT8dWZHGXYM0cZyfzVC3+M7L/iu
         jY/0q/dWwv+Ll261InQw0mpGekOLAcS8Gp3T2CRemExb8Rf4h+vyFDy7kkeCpRTsi6bk
         sc//kW+Mf9w0XO5xVnGDBD7F0K8CGHYp+Qpx0ZOAbxTpUKOJv3mgJQu6J8qwah+6jk6w
         KzKTtf+qY81HzazZp2xw97xS9V3KL2NqGQEf60CllGsEyBzuD5+Fg+0u5jRINUWJKHDi
         2Vl4y8iKPWy7jgloUGpLabWNfB2dfS/weL9pj1FkhIUGEbmeFYt6xgNK2T91iCDgbsTw
         QOtQ==
X-Forwarded-Encrypted: i=1; AHgh+RocuQCxNJh/EVdUCfJd93JWTFBh2bktK1dk+KE5Xbidy3dtWTej0aSgUF69AzbjAzi2R1NmUYKdY2da7nPJ6ykg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsr6FnVazyOmXCL8ARsOH6b0CqKyW5r8tE6FbZcCuH/cNzBWGM
	SFiIq9cPfXuEZ3HAXRdI6usiFzCaNedt8KpLg3j8qo9PMqaEzY+bDaeE
X-Gm-Gg: AR+sD10NgwmWImABf5tvtuvtV8uffyAJJebUixnjvp7ly+vP5gPrs0hI5sPSWmG3JU1
	6fGwES5Ju/aKyK+3krBFoIgZStZXy7XzlpL5vmB2Q/QXF7nvTcTsriye2R+Tu3/z6hNxob653Oa
	MpJyDIQHteUTbM4wN9aCt7Cx+MotxQNOpInhIsE99gk0beK7s9Dhj1MmE/FXZkBMm1jyJh7hm5a
	qrpSH5epSmwCxTilrMhuy7EcfSX+CoSOrIkpV0oy+dfptxss/ccwnd/Krc8dxjoKvQzDJVAQ22I
	fUlAToHRt5cC0UJAq5ojdVG9Fgm4a08vKQnS1WgDUREEXomY67KeIj1gneipvY7caDy9fQFWT+W
	ep03dBSNkNbizvKwc6nc9gTEhQSNVjraA7JyQE+4oGk+A96khv+fbLxF2+I6iEWb/xFMmPiF9Wy
	6lpkUzowafNrb8UYYbDAkaKrz4YknEwJkfMHdWyveysoGWv1neqEii1huGO6ZFAdcDwtDdB5EJr
	/bo6pWzXFjiusbOP+ypDnceN7lnXWxTPl1x2WkcO2aDimowF7+N6Q==
X-Received: by 2002:a05:600c:b95:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-4996199186fmr27697705e9.15.1786133384176;
        Fri, 07 Aug 2026 13:09:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:43 -0700 (PDT)
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
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/4] ASoC: Add support for Airoha AN7581
Date: Fri,  7 Aug 2026 22:09:30 +0200
Message-ID: <20260807200936.201827-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130946_950272_4BD53BA2 
X-CRM114-Status: GOOD (  17.00  )
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

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 517 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1441 insertions(+), 6 deletions(-)
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



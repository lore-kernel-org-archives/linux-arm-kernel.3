Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600EC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=; b=zaGXlTnocJ2OiNLsHKobRNQvfQ
	aFwOE1WA86cYkGwbP9vHuqK4ys8j2MzL7I0p0Z67w2AQqp5uxSkoAKr6UHvqItKOnMSiQZCwbKV8h
	XRPvt/l/jC12YFIko0SUdZUdxIjWMY6QhnFCx6RYsLcgAEP0fku6MgFOwdbgOdswlZorYcgbW1rWx
	6IhNf4kONFC6WtrO6VaLuQEm19r0nRKkCmm6J0eG1ubQ7krqDWeK92GLufIvRtMw5zUay2bjYXAk+
	wg0UdH/YcLrMzy4T89cmx0aL4ox/RNrHGUUKur6Bi2EBhXRjDGZAhz0U5tfrhGY5OA8YNHO+QYLu9
	M1e0ANEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlI-00000008LAK-2GMa;
	Wed, 16 Sep 2026 05:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlG-00000008L9M-0ndI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=; b=Z28R1N1LMCkXdh6He39GMzp8lc
	cXvknvBVmSXYW6eRxbWWBMR64r+BHeHCPd7ivsoVNUHbLd1RoxJ2C3nn51AyMUrKiJcuPanxk/ihS
	hK/aE7Q6h6p2lKQsq5m0M2p1ngHq02PKnF1J1vVhT4Kw8D040WPiVgZujo2NpQKTv7QmKcqUC6Qn0
	2f05CbEePld4V9YzI50AFAipliQGLy3sALNWra/e0pZ+3kxq6lTOX3vJYkwobGoss5IAdkUFM2CIz
	54B/YhzjpfeOUA1KDyjVLLHtZ94tlHxAWsRbUWkeILX44Br9oCIyGn8zDxMaKKp0EfXc1OtOcZWpv
	jy1cTjEA==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hl9-00000007UH7-3orZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:00:44 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d20963so289300b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534837; x=1790139637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=YnBN2OrlH8aRelc7fTmiBUdYtuSwOBrobnTjt/N16yzse/UyUBP9Zee6/XwLbPBp+V
         jEADoKA+dwHDHBs4kL1xRobvSJ9xjjqbkMNclBmXr0XhT9ylqDJo/pT5vBq9JRQ6pZGr
         lpoTyQExz1pcUVO2Ad5H6kQ0rkcvh/4T1K57pajY8XXgSbQAQVRgQOcRH5/o2YDRAOLD
         f/cGoFy9erEnDg+eCrmCzZApLSWzYzTHQ20f95aVTiEIzOU9/U6EaT1/PViehKEq06Fh
         H+6zPNMwGlcNLyth/dJl/YIO0iZHMHB76sdlVo0GZ8tzDcdAaTFVj5vWMKc0Se+VqSqy
         8kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534837; x=1790139637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=nG3wAeWBcCQCDmpCuNxPiB6pUweeKP0kAkMAEGgtLxg2gQfNOuVcD9Pykihq3BL7Ln
         Bl7KURh0RFomoEwkJ7bpTV0dZ8/aBRzXQ/LRS9TEyRqM5QryODE0FFio4RsKmRCF1Dp1
         eMqa0BoLyvVMMoQ4e3fY9GI92N2QmMBgbVo21zIhfGQ1BIUUGRePE9RIoalZrOV8fUMp
         tiYOrO8dQkAQ1poTKRfwTx8WxNlHIHLQNcArS3ynsHFgA55JJTNor4kRp7Zm+Hou1zDb
         +QOC68jaGSakZjdEk94DrshbfwZaWH5QtG4YHSY2YMHiCSnCTR6R477QuDzgho4bx5mD
         9tpg==
X-Forwarded-Encrypted: i=1; AKwUvBzlXTUa//5HkSzynU032rO0pKJE+iyY2xy7qLkgvcaYwz7PpAdrABRdkw+LcP3k9Qti3yicZVOb9XPHfyFB0Wdx@lists.infradead.org
X-Gm-Message-State: AFuF++m5hJjHnoo+NX1AsKf/AD+1umJQPsBqZbIAfErS/ikhqXpB+qUs
	Mt9hqu/VLaErWN0FDOPZ4Sp+SNTKDkOx7NCtRCJhlc0hNOKw72yS9IUV
X-Gm-Gg: AYBFou27OBQT0YMqEsCOB1IZIpZuFW3Cm8Nk6CyxrcR/qxG2Yqph4toumKdb4Sujko4
	79X1UaOFHvFlikbl+4tBGj6pv4jMO74+qhrXoPgLWXo/LrBuv7GPzd2jheXIV5uwk2f2HdL/Gvw
	AAKe1OsIFdyksfeJ7H/JFEggkOq7Ae9J56WImrNXEWVxRgzcVilGg2mNpkse5Vuxgw9O49ARnPU
	d5oDmKf6+Mkph9QydSCgQpPCyzwiJtuzXMR0lcVoesE27pORJyAGYSm6TK8uYWY0N7snc0Nglqj
	TiytHr3lEYQHNQ/PJBh6HrsMTmUFgJ8HbxEpqoXMUHYpZMgOWXSA5C3QKEvPKtzF1wiTECJ+V3R
	gjCSatsmbfmm+bFUEpEq0bRUs/8i7cFYKmZok2wbdGG6cDOz3A0XMA6EvKZXJXGYEeXxVkiNag8
	uI5oVDJhhgeedyYXmMgmqAXKY3HXejh0G8ViKmzDj2BM5vwoYVscxnAsBWLY0or81NaExH1Cyrt
	wmkMnvtOQmLmTsuA9dK8g/0vRoJDAMVditetVfOXUVrwZHaS9P8mxt1jTBDDPo4qwHVRrYdJVjJ
	xeWWlVgfW6lXHOZL
X-Received: by 2002:a05:6300:6697:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd5f44a0camr3248100637.9.1789534836913;
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
Date: Wed, 16 Sep 2026 12:00:07 +0700
Message-ID: <20260916050020.14575-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060042_692874_E64BF6C4 
X-CRM114-Status: GOOD (  12.12  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

In v2, there was discussion about checking the return value of 
regmap_update_bits(). While opinions differed, the existing driver already 
checks it in mt8189_afe_enable_top_cg(), which is used by 
mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.

Therefore, I keep these checks and add the corresponding error paths for 
consistency.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks, 
   making the separate patch for missing regmap unnecessary.
 - Do not pre-initialize ret; set ret = 0 in the default case throughout 
   the series.

Best regards,
Phuc

bui duc phuc (12):
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
 4 files changed, 154 insertions(+), 62 deletions(-)

-- 
2.43.0



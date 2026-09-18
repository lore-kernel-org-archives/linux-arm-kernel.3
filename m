Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A21DC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=; b=dd/FJTyHbiGiSu2pIqOXhWd0XY
	BEw6jozhP8bXGLL9w/4EVYI/jOhNfiJZU68yPq9fZLKzDrRS7FjnXdczKWEn/iWxKpsDFvGMIIqdH
	85/L8xF7iOLRUkibLwt3YFNIK7yJ/9ZVRZ5T8D2Mrl/VUAVxmcyBUtfP/2l69TN9DApLNC9Bjo8ve
	39AGjmvL+qUxf5an608aK5D45MtpZaUhpfNSE0HjaJ/g3P/G+axHofVoy+azKXVbR4DHLsN3UYFMQ
	Zu4k00N2O1fw/pv8CYKqz3Oea6lC3Rjrg+LVwYmk1tG430YZcBECa+pYwO4KeEKzaEsjxZVKCb5oo
	ROzwoAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoa-0000000EaJE-47Hc;
	Fri, 18 Sep 2026 13:39:45 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YoY-0000000EaIJ-1ZmZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:44 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso573076a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738781; x=1790343581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Iqd3V920jLsuEnMksCQoNZqxEdKw92as8yQVHTk2dbUrF3fpBCK+nDtEswbiWw1ITB
         nRiMSQFB/yu65jISw4CcYaPTxzQ+yV/BSeyh4TQeDEs/7pEBc7ycagU2PLnugfRfujZy
         4Hu2NcK2DZGzUY75XsdMhf6fJzeZzXFtpGeq77OUwjDr8MDyACl89VNjmkFcCPiIisSe
         VMA7+jcHvZnDdDvHFy2zvG8H8O8Kg2YWOHO8JC1wQ4XnXQsiJkdGb+FW6hbgQ9doF7Ly
         pImLPVBDrT07cfnMr6DG2HqD1ZC88dt9yqMXXb4LAjQ3PUEd9vuhHa4JrJNP9ByTHu1R
         dCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738781; x=1790343581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Ua23eJk3wS02RtMuhFCGF4xAJXaR6aSm5wK2utEE5+oHvfN2KKFuyMkP7olbFDbi0q
         W5BsVy/nMdJXopNefO+wrKjJW4PSKOEC6tjwMeceAG/hoiu331sbqnOSoLShKBJG9Ljs
         zLJDGeG55ZmQQMIHlCqSCYKSVIh+D/G/3DBfehqr8Pv/ECI+zksXCiqZqaY+TxMa7yPF
         HPnqV4N3CYg4tXi5xUN3Zrz9ktvDBW5Mr5gxxPODwj873MWd1u+S8pkBI5qWWtbZlHEV
         kDt5ceyrGahGp3tjxoXw2ea3ZDJnDiiG8BP3ijRJt26Ua/ioGMaaGiR4c9Yk3uKHDoFV
         CyUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJjHWrJ1JuAiuciTGZN3ASIV46i7XJ0VXW9GFOHkLZ0AB9ruMnykC09aTUD6HLAA79/xEnBSey/zSnW8kNrwhz@lists.infradead.org
X-Gm-Message-State: AFuF++kc/mJAt7FJswc6mElspMAV+BfN7vDReyKRDqyOKTda+T37AUSH
	sa6n4YuqP8cVWFGAHNfxu/FeBNXm+pNWW2cJo7Pwrjlc7psFm8JOCFSu
X-Gm-Gg: AYBFou32C/J/+GHcDwD7GvVOR/mmNP1iw+O278ytSyRpf4d9cR3aFHr8l8CVOAiWtiL
	T3Qxvo1r0XvO7fnvR6iAvhvBrwj7s+zsc/R81eKWbHY+oPVtljLTyIJAOTKwl9CTCznvZ6eHZtp
	bS/pwW2c8wReSfDdEzTL2B4axce+GwHh9X83WfuenGlof856lRsZebKcKrJJplW5KCc7RrxTxr/
	BkCLn1m5nvTS4K/PBZjzstg36CZEUUQP/JaQ567inZ1mwjmNJMKVBNayLclxPvwZ/ELFoB7ENc6
	PcHgfffhtKV4YMOjcWr3zsOk0fllx1GS/r1/R3BLCSwzJemt/5lynqzNGQD70Dg22jMkmvhIxn8
	ZLRfZpk7EirWcl2ukAIX7t4kVtcq+SRavQxbXJbEhQWA7a2QjIg5dP836D930FLz9OukQvRroFR
	RGALkZSnfQjUEOl6vOJKQLSV+TM/etqWDyDAywOud47gDgBOQ+KeSu8ksjBeJCm6FnOfYM3DJBU
	1LWgzAarNL6cZX9K9lXD2q/WpnvLspXlu+egBae2mmTplTD6xH7dnbClgWeK63w0ynqD9KkCxR/
	JL4K/Se8SSpIBg==
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr10232434a91.7.1789738781094;
        Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/15] ASoC: mediatek: mt8192: Improve error handling
Date: Fri, 18 Sep 2026 20:38:56 +0700
Message-ID: <20260918133912.133799-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063942_413432_8AFA0B30 
X-CRM114-Status: UNSURE (   9.42  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series addresses part of the error handling in the MT8192 driver.

It propagates errors from clock operations, GPIO requests, and DAPM event
handlers, and uses dev_err_probe() for cleaner probe logic.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (15):
  ASoC: mediatek: mt8192: fix APLL mux error handling
  ASoC: mediatek: mt8192: fix AFE clock error handling
  ASoC: mediatek: mt8192: fix error handling in APLL enable functions
  ASoC: mediatek: mt8192: fix MCK clock error handling
  ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
  ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
  ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
  ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
  ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
  ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime
    resume
  ASoC: mediatek: mt8192: Remove redundant error message
  ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in
    ADDA DAI
  ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event
    handlers
  ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event
    handlers
  ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF
    calibration

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    | 163 +++++++++++-------
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  94 +++++-----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  12 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   |  44 +++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    |  20 ++-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  18 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  37 ++--
 7 files changed, 240 insertions(+), 148 deletions(-)

-- 
2.43.0



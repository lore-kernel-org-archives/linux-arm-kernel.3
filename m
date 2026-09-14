Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F71AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=; b=zudNSNVvALJFWWc8wplbNtLfB/
	sZqCRzecQA5ChrWuBAHDLLm/P2rBhC5MMaPdsp2YUj2N6JEoKDPi87XYFALhZpzDV/BWS/MriTq2K
	DavOUr7RwTx+rROauKnqXmKN0QOXpTLTzH6kme47sIIkaIxuGXp/zy5vkc/VekyGs+nUF2F7pjDVR
	3EYZ0gZg+vQjoMsOqFY2HWHmpWp99AegoaDhY7rZeK4Hh2FkMA/RARsr5M1mKnKDu01KkQpFM6zGc
	5lJWKbW40Sid1n/EXyzh7Dvph9M20gbWCcpksokg1Ec7ivrJrodrbV1Wc85EEgaXZOhMoOJkUdzaL
	qEvuWV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617c-00000002Y4x-3e68;
	Mon, 14 Sep 2026 07:29:00 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617Z-00000002Y47-2U12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:28:59 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1173991a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370936; x=1789975736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=P2KNDiaAe9zqlY4VSIMpWRvvbVZ0lJpxjRaon8jaGdv/Uz2NNiGpp5arjzmmtLgLgS
         IuAVay4PBtQoMpoDvQubpgVnr8rcEPXlnQvyEGzGwy/Zv0bPpZzNxmJzPPFUyaRWB1D9
         ovU5vNWKrwnyfKj9KpBcUQczoCcKLMCX/NGHNac9L94yhcspMq2xXosH/ChRqWy5jp6g
         Bd310mkz5jXxbFTYCFzyjSKCd3vMRi35UeyuMkpjnaRWku6ZHISJehgmQvuoSHhqnZBS
         rrQlcsED3Ou3lqRFS6HcehapAj/fzYtw5VEjEolvKU1aOixl34hg1XnnCMWJzpC4JWfX
         y2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370936; x=1789975736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=ZhCiBVzGE3YV0oEQ9phiUg9uFftsipB/PHGYO9b/zLmMmoRCWNiN6xAIqsLxhfWFXd
         HoXz7FJDqviQlgtHX2ZVW5YnkjWDO+uojqPhlO2NbCwuV1vZPlFHxcVEFLZMrtGwiNjD
         dopezCAVhZhtKdDEYbnY0XBv00SR2F5s2SD5+KA4i073a2VB4sDp52j9H8jolLM3XHAE
         RNjew2t4ZU2gF2I6yDzcix8RhH6yOyvvwUIdUeIuheIRgXYxPLu4xZTI9qQmFTyDQ8tF
         7YK6q7ymxuLwhQrqK/TQzjSlN1UF1GxBXIWfdXY978VzJHuzlL2U/lGB5CwW0mSd3CfL
         OUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrzN1TxigJDLGsZhRvRO/RFqcvbutOTw2KRXQLQX+csCXQkDr0vVvnvRMHOzBFQ4ry9h2IYf8hN/rhunj5qpoA@lists.infradead.org
X-Gm-Message-State: AFuF++l83tRQwdxz51ds96RU1b48G/q6Mk0xGH0PT0XOkTPtmeVTrl9M
	gJmXR9BNqPULJclZM1XtpwCUAHdDONtUFAohMHkzyxKp3WDhCkrQcoau
X-Gm-Gg: AYBFou0aVKvifMbcDU/PTnWETjHyLFFpD3WiJm11lyHzQ7OpDl/PsyqkZEAfF4bocgl
	hSMLCSjWFI/15p1yuS20Vl0TMgctX4Rk9wFj2p9TYMRqoeQ4Ld0oSslJ7Z+aEI2c+3zgXvTCx0D
	OM6jm1/0vBurgW534XJeV4V+CyhxC6bVq0nmFJfvEmOy7qCzZgWll99a1wwrJ3x7ZmzvE8ROSc4
	fmq4fzL1AUwxOJ/huGuLL6jVvxJGQ5bQE3YjIkSuqecZwPNRVxF3XiVBGsQCuEkVUxQ0dyXyIRA
	BuMWtnerIbkg0yRBKYpVPNqoaeruyGMliYc/FPogXBs9iLlzIB5+fczjBBbrUIevNf5P79k7LIj
	ZxE26Z0oXldA4NITxBHPU/MsE9UHfyGY4m8ipTdh+lnamt5xBNX+J+GCEQc9O7JMSWuVVhENmk0
	aCgJU4sdmixJD23UwpytBKnLfHoOytMVSkVtzgzABcIASp5EK7JsobB/OFeI+AyymS+lTCEp0iC
	16ZtmavocJ4ykzIvkma4B/fMAA+Q7cSh5tLIaG/GIfYPhFZiFQrCVs+4V6J39CDWmLvDwXGOE30
	m2NeCaaZXm1ZazY=
X-Received: by 2002:a17:90b:1d4e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39debfaef5cmr2973318a91.9.1789370936217;
        Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:28:55 -0700 (PDT)
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
Subject: [PATCH v2 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Mon, 14 Sep 2026 14:28:29 +0700
Message-ID: <20260914072842.24420-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002857_624004_8E2D4B4D 
X-CRM114-Status: UNSURE (   8.30  )
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

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
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

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6840C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=; b=kOynYZXOvU2DW6ii62KB+ZFYys
	MCfAoI5c8VyJN/ve2prb9QsyzYthe+XzqypsSZYaSzD11xVd6uDJsyL3ctZ2Lwqn8CyhDZS6xyGc2
	nJmQOgkrgiyA0Evl7tSWh64Ryx+oWi7zBZSx2tGsGQZitoD9C54CvOEy91iaBED//53tp0XpziC9T
	WrVtsA/ZTEx0K2zXN+ECzXrHegWZC8XptMCe8UKLiLNRaB4b1zAZCuTpxGmak7L3eqQmsGswysOPd
	L3fgYnYiQ0iPCqzIJfjoduKmlgEY+RECc6C3DNAxIZJ5b7AqX12ud4F0qZiDAo5P2tx3YNrWPyC9M
	WDHDg3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4b-00000006kEw-2rZn;
	Mon, 07 Sep 2026 12:03:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4Y-00000006kE2-1I45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso34416605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782617; x=1789387417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=aU/jbznuKfEhWN8MQKi822KFabZUmnIYVBwMmCb1GgKWBy+kdR8WReaO2387+lGnpG
         eDQkfmKFiuoCJtLhl8pKS54wz7Q9qfFnwQRyw+4NtvUXsVndpxHStR5sysjliCSxO1+b
         OAGevMvG+5R5Pm48/SiwMjMop7wK9VmH2Rev8CcJlAm+29bBm0J0asYDWP9DlF/4lCsH
         yqlYKYO4tbVp2cx02Fws3wodbs5qX+sZtIKeyPBpfQQNCxjSaqdCWhZ7vDTk2o1i3YEr
         HY5/otuxgG161L0BOFWPvVzlU49Eb4wTh0JjEp6Cprp6g9sMWXUoVy2bE3DGRS+h0i2l
         9DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782617; x=1789387417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=Wwxlz/YvhwMnkRwti+sAW6a/P3fxbdFH2UN4VSPnAEd8VKbWxHpNtnqK0XlQqPSW9W
         9qp6h7j5d6AwQCAWG/Y9XdsQTbEWZMxf1OrIC9edjuuqPyT8JTZ5x2rgXuouEeFAbCzg
         uW633rHWEkI0PYbjpKRJfdz9Ep5O9cNBmkEHawLXPCr6krk4i25Tc+WtKN5Snmnqe0yr
         fNl8dEM3GCuyDduOv5DMFXt1TbHnTtgA+1bp1Hs7+S2y7KdPgRkEKJT3x2zkWV4ztLvM
         tkhqIP3K9jzKKSEXfLbG4D4DgP6JiAgVVCVtHULPUryi0txc8GvfqT02nw3DKnhV6Fug
         YpRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZYqHC1i6thPrgbOYLD5pHWn5LsuPb4qaavGIVZDUfLz1Mod1NvPuVUqOf4cmPtUJ7lz3r02Ks1e0AOq0RNkKM@lists.infradead.org
X-Gm-Message-State: AFuF++k0JMI7SDZ1/A99AaWJBBiAEQgC5Adg9ydzPa/fNVUWwbLdE408
	9aGpZRFArA2/eizfKkpk5MFD6RgHSP/JrjMk+gai8jjpRY4/R5m0aV6f
X-Gm-Gg: AYBFou3+j+uUWD2fTc3ksqDnrnzobIB8cYJBHpnxfj7v2qlT90ksbqXW5EW0jFH2Wbu
	fmOEa4kBZKC9lMjeeoV1gMW2b2hYwaZ+LKLLPOeRbRduNNLrqwAVkeckH59Mf5iRH4zoB1dzglj
	f/K1dMI31COw5tYFFynQOP43Rimz2vMW0UtCeXjL0IXn1Z1NEEN46bM8bUIkqTxQGTYWplsSWfJ
	0mLQYTsl2oqY/9a83w4KGhV19aqVbvwBCEa7bQFT7MH97TVpLRmVFWdyLXQAeXv0clruOltTi4w
	7HXR59X3piGUwRRhtY3swv94M4QYPhY96+H0Ju197My2klWNS9Kp9gHFOSJpLcppzcu8vUnZ7/E
	MBpUpj+HJ1x5aHTNlyYHwmGEZa29YkIiS1DAA6Qc1pi06qx1svdKQyoz1EZRWw4HLEgcEnb0QKU
	QU2UWavrkqnaPIdCO6a1hxvKtjbJD4OpNlr5TNDQluu6uS2PTcqklbzW07jqpu7lHeTNVZhvexE
	PGyZu4oybZ3AHpcHIwUNx2lMTxWLWUBFhPALL2OcoS2GiyV8vH2GDrUYH3EV4Ddmn3FCNeEPGqa
	wNI6
X-Received: by 2002:a17:903:19d0:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2db126346b3mr282743715ad.19.1788782616991;
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
Date: Mon,  7 Sep 2026 19:03:03 +0700
Message-ID: <20260907120310.135693-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050338_340176_2448F762 
X-CRM114-Status: UNSURE (   8.17  )
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

This series improves error handling in several parts of the MT8188 AFE
driver.
Propagate errors from clock, regmap, and runtime resume operations,
remove redundant probe error messages, and fix clock cleanup on
registration failure.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (7):
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error
    messages
  ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register

 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 115 +++++++++++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  34 ++++--
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  12 +-
 3 files changed, 113 insertions(+), 48 deletions(-)

-- 
2.43.0



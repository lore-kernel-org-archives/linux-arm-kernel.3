Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CDBC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=; b=o+89ZTEb7FCLSgMUuVoU8XGVyU
	CH1Std+PoHLdqgWpBykj+drJyqo6ii761YxD1leRhUpFEq6LfGZTR5OK0K41b+OMKrRS8oCj5o+dV
	FZqoLR++liZdze8Z2uwiWeRyQdvkkUPJP9/fyP8OlLzW6AkSgiGeHkOQw5jnXaa1cecDFr4ZyomkM
	mL7ctzz+UuKDplIfYVBU0svDo41d8Wm1M6bOa+GXjwOV7SpVir/aykRw83BQ5GgJ2UXsr+4DdMN+3
	9O5utQF8Y1478Wcu+tcv93Ugd5ICMXR88hyeVHH1ee9cffSDKHIAVqoGnCE1lL95BLjYwTdNicbTd
	BpwWHrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsH-0000000Cd4G-0i87;
	Fri, 25 Sep 2026 04:49:29 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsD-0000000Cd3R-41aJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:49:27 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb751so268887a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311764; x=1790916564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=BE+0rOqjV/NYwoBuRH+UvJ6pgUBke2yW8E73FytsdRc1hNlVMbNzEtX1mxcZ7R5sHB
         nHGiUl6RRpbMD6X6Pv9hmzkfYk2/SN9PY/IBED7FdiEFiS9bFYXEZkh2BbBZvtld+Ao3
         9nCS8QTzO35L9KHcfqgot5Ywfz60kD06TSUjMDGuz/bnoJYgqA8eCmj7Mq/fpjbhrd6c
         bl4p3JrmJdkpqOH+1dYQ0OGy+dQfdNDgEQCzm6TJPWjsHs8PzwxXDTcS1emxbV0ZixMC
         gkpdf1YzsTaLmTzWtjYx95n4NrY23tDgNWiStFiAh35+BRzfEsMCsCdptiVu3Dlm95kw
         AywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311764; x=1790916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=BL1Nb4lRu4kePtcWh84yW9vp8LsShnBvyIoMXism6XyZMaD56NjTO2rVEJlwDBVQpy
         TnRNyBjB8XQPbZWkPGd67joVNHQ8T9WxcqN54jFMoPC8Xy1DazjNj0d5vHijoE6419Nz
         EJKkbWgg2Xr6NKsHrkUKlC2+KloTwB00tRho+WKHenw+Ns87854m3k5ZJ8zguC/WF8d/
         7UhJn91oqSVO4HIqxCbGt6/vnKapR1iZYYsIxAag24ud0ItYYvwmxOQA4+WSUispFP4q
         JfSW2XOOl8mjo+6tcMFAgGeDRuetre7k65Nix3RnEkPoEcvy7Zp3F5XL+mmTBDJGUmOq
         RsKg==
X-Forwarded-Encrypted: i=1; AKwUvBxu+uO9I2f7VQFDxaW60JZ+KV+xohfJZl2Vof2ynyOGFpGVZgIK0WUy2eop8HP7So1sTPUIX+sRsp3wPGx+8YLD@lists.infradead.org
X-Gm-Message-State: AFuF++kxNutPiQvyXi5uKSRJAQx41/vlU+XXO8WRFwXnmBGBCdUDShUB
	piAXj+lt5TJ6A411Ikr0K7LurP5VlqM2MU9UZMehx5ml9bjVssiLbvdd
X-Gm-Gg: AYBFou1wyuGOc7E40CtsnjFbFjcEU5lhHfSiyzUO/X8FGry4eDAve+3BPnRBgKhegxZ
	8phNpPD9rJYYoDp9nKq2s0tP8WdRlW1JHirIhKPsOEXV9xrNDOUB3OsiojxMxUDeGRn4TKouPer
	1wDbUsNhZwCdyBrNrySKePOJDmmvtaL8jlhXYLkrR6fxHUVKc6PSA0wBHkZ0AGRFWyl1J+I/YlJ
	No1OH2Tpeesc0oYu+p647eyPTrwUTML4jgh06Bb2U3akg5yJ6x+wHSPL2DD0ERxEzyqzKLFpYII
	9KcoLPaZv2ohS1oL9a4MCgAbniYI8t/IuTKu9rPXoH1KHb4mlpC2oj50lzLqUIRfiiC/4fRFTfl
	foG2FIdarZ8GzELw3eYsDNpZWrHATdH/M/XZXFYB4/ZoWWEKz752//oWDtKN2XD/P+MxIlHweXN
	ESdlxkdy8JNYZr4htPv0rtdVHjyfv6FJTuVDWr6BxFtFIGSGgV9DRWHUi00D7ImocS5NMeVcFgp
	XXyQAkpUZ5qR/Pw1fHst6ld4EVTRb5dc4qrgdgKSVG46jluYbKtd5Hq9l8ZEfx9T9GxAW2bylJJ
	rKX8TLAT+b64eA==
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr4416407a91.30.1790311764283;
        Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Fri, 25 Sep 2026 11:48:54 +0700
Message-ID: <20260925044908.450775-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_214925_995311_15F60B4E 
X-CRM114-Status: UNSURE (   7.53  )
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

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 69 ++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 98 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |  3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 99 +++++++++++++++------
 4 files changed, 196 insertions(+), 73 deletions(-)

-- 
2.43.0



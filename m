Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED89BCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=; b=RBx9bZH/kRxrcnvVJU6+yugesg
	CBXx8XV09cC5++UbDX/vShX2mcx0MQ1hy/HOx8Gb5a5RftwKjge4bQxt8f2b2wcMTq1h7nnMDVb9j
	xXo00Q8SoxIv/Pma5YlVMula0bvPtkycaXQZcWbLhy9YiYPCKBk4HzZAbfSOo15co3v0OwmsRgOh3
	nPzgGhprxdvisLRd1B4bNor337lrvsL2e12lpBXQdZdcDVDiyrCMh6FoPVs0WlDFJ1CfNP83aKuWQ
	eId5hVSR0xJdJCV9yA0uPuNgkAlNjcKkpK7ef7GZukDGp6cCrJubxfvkcr+5pGDjGwdtaEzM3QKLB
	tPbTdDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9b-0000000FJVF-2qd8;
	Wed, 14 Oct 2026 11:28:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9Z-0000000FJUS-1grw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3459595a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977292; x=1792582092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=hXhIB66zDiAc75+AL5GJSCmTKgeOcXLO8EEeyVHOUkrIXTAvSxNX6HjlNiA7+3JJfv
         ANQ41y4vrxiaW8mzvqJZMHRYZDx46XArXH7vVPEc6KIckSqTzqbTwR4WPPrurrJPeFOi
         tOEShJAbjMeK1dw8y/dsitgvEHPOAjZ7upAX4v7uxPz1hSTXE3c45yNGcQvVErRewjAp
         HryK78xer61LXE76LphuD+SQWeCUAFPiPqxNod+huSXjEZ/h9Y/G3xyUeYAsYOjL8HNv
         ydU6MsnH22eiicSKJyerERn951OvI16CvbXblajqeq4ifM4ZawyBW/yTwThLqYnshQUq
         hw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977292; x=1792582092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=WcA0n+oJ8I/VgtPCknTZfuJe5Yh/z8XbfT5ODfrMOgOfOfWpweSsvukokShXcR+hvr
         IBi0aIwGt+TsotBklJOrwdvUsiDp+rDNj4CYZmKd4gR4ghbbfidiUs6Bd9m42Mhb4A18
         fM59+az9dpjo9jLv/+IZxVJDAnoMQvKaCEEcalICAdT3mCEA5zwHJetY0n6fGSLIq7B7
         Wa/wDUV1bIzbHlTrhIwQu7OCtgkY2vhFDG7eJxNv5cCUFw6g8JEJM2Cr+TEWMwpuv/fI
         RxvBYSKtKf+dhWHkSSMWENomtO9CB7uoEeAkh8KpEpKvPljHf1qbukp/qqRjUX6RurkA
         9pbg==
X-Forwarded-Encrypted: i=1; AKwUvBy+HPEXCcLpiyHyZcNTNJptlHpvge+9lUYXAM9VoDn0ry7kOs/+wuoSCj68fbuOKEXue3niv0zPZj2Uv0YWLYwo@lists.infradead.org
X-Gm-Message-State: AFq9FYK6KJX/hZj1WFIPb1YrzSOwvr0pXx84dqEg2nnx+WSPYzmzWN9R
	9zZt9xQiZI/3opoCG1gqbXyp0ExZNTf7uzJtm5zyyIul8KPrFf+McWtX
X-Gm-Gg: AYBFou3ngwa1X5GUevCZXZiDF/OZ2s+D2PINr9gUn/7qweF2EbVg1TkN6D0XkBz6UAA
	p+t3J9LuoMCOJztQ21rH0KEprbgmA8Fs7TUallmJT79ijxR0iaU2+jIMlxEqGEQ/AaTHkamFAQu
	/6mUifwUzoyw2jWTLDzCu/g28Y4gh0egUAmPfMG38ChQFTJVNNRYjF8UGrMthvy2BprzncYqRDS
	MgSJIK/ThxCHxzZB4VtbvV4v+lxKtrxGh6Ng4RHbFDAqEHS6QhwWpRMFT4O856FUC3Oai6y4x4y
	MxNU2I7TrBhZySemqyfi5dffVVVdU5KLRUVY46iplanAnoO7th3fLKPJVGuK1MXsB/rEP5k/IJ2
	xXBBmamGuencnuo6Smh1Nf6KTZlvlOb1m7YJP7E509c15ZH9WNPZg9hXS6rIErY+uims4NLwa7i
	ARL/wmd+xdXanfk16rshVtUta7FO2hyij79jpIsTjE/7J0dXThG803afXGkSL967uYv5H7ps+8H
	ZAQDzBHLlEzGmWW4c7ErR4kaD7QHRZHWJXO9QUT60TgRJz3NiNIjmfvoKPqcfAlnrp6QwD4f8Dz
	BU5t9Pnxaq9WCQ==
X-Received: by 2002:a17:90b:2644:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ac860e1b6emr237850a91.41.1791977291371;
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 00/16] ASoC: mediatek: mt8195: Fix clock error handling
Date: Wed, 14 Oct 2026 18:27:35 +0700
Message-ID: <20261014112752.683032-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042813_493896_FBBB9369 
X-CRM114-Status: UNSURE (   9.07  )
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

Link v1:
https://lore.kernel.org/all/20260925044908.450775-1-phucduc.bui@gmail.com/
Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Link v2:
https://lore.kernel.org/all/20261005110257.50145-1-phucduc.bui@gmail.com/
Changes in v3:
 -  Add Ajay Kumar Nandam's Reviewed-by tag.
 -  Add error handling in mt8195_afe_enable_main_clock().
 -  Add error handling in mt8195_afe_fe_trigger().
 -  Update the commit message for the DAPM error handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (16):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix main clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  86 +++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 111 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++-----
 4 files changed, 221 insertions(+), 78 deletions(-)

-- 
2.43.0



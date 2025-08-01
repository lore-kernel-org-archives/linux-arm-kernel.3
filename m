Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52446C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OXzHZvZFg/7OiUCWnuamIDUXt4QwG2aw48t2rlvoPE=; b=uLUIks5OFuX90vmMcbfEfTThou
	KPyxfzPZjhmgn1h7JEMKXNh7IxBpqVs6qnJwal7MPwiQX+lXeOjmUYRFd/GsLUGSKWyeI3TQV1ZbS
	scwZc8wmB09XmlQmOebfbhxe5w0kswtPTbVVUHPcVGmV0YtdGCVGnmC9Gb/RaPxviEYlcwZQL82PY
	QUlPM8wzrNsmKZPASN2NmvnyTIx8SJ8cwuzHQusf6slfJ5vzWM5VpR6ICM6r1E87c9Pc0O1D3bh+p
	QaNNpY6AK9OE1aJGbpDVtef3IYKFUZEOKne26Uogf0fnPfO2eNJx4cyMJLoKyjSfP0vkPl+xGCbHy
	z7ySiH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlx4-00000005Ls4-3Je9;
	Fri, 01 Aug 2025 09:21:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhluT-00000005LUe-2JRa;
	Fri, 01 Aug 2025 09:18:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-456108bf94bso3732255e9.0;
        Fri, 01 Aug 2025 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754039919; x=1754644719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OXzHZvZFg/7OiUCWnuamIDUXt4QwG2aw48t2rlvoPE=;
        b=ZeU26NWuy+euS//2gyy/FRSgEbIvKrZ7pO9xQbj6Gokhzv7bB19fM7FUzEZmR66pWF
         55ck+9YZeb/M3aZgJZ+0X4dCQit8uPT/MTjbsYhWMWr5TgQ3oXjLf3Ay7ji3SqHH+oKi
         KvP6k30sFwPlu7ZFmEZNs2Hq5uOMi9rOv6NXpymbmL1c2kDdFTIzlxQb0FzH13rycKce
         hjz0dLtHJfFOIpgGnzRiv6/3pWfRHmjFgcrv2iLrxyKmt1Pg2/SmAqO3ZCquxdSNNSv5
         kdqlsluGQL4BYrRHTw+Qf6Hu6RuY5WkcFzHkMrJqwLIlX4o7xP7JvY9ctWou3KZYE2zn
         BbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039919; x=1754644719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OXzHZvZFg/7OiUCWnuamIDUXt4QwG2aw48t2rlvoPE=;
        b=GFlgg5gFKkZ0u/5qxqDKwmsE0paqiwmzI+E7ryw9RVmqbKUSFs+nkxi+5G+XdB/N2X
         W5sCdnUfqEYKKNLHaXKSoLMExOwjxGCgGf42MeLkYj7z9HURLjEmpz6hlwI/TP+mAnPQ
         94s/8FTtVBi+4fPrd08Tu2Y7Ox5pCEdulAn9IKJXuebZFg25IutGe8S8mmyQFZyWuYb0
         GqmN/30FaFPvjSP44GWf8ThpOQNn3yiFR5RztcNWR6dThbU4k2Gd2XtPFfUUSJK7AtT9
         9VBvNA6kvhahGV3ol4x2reXJZ4wWPkaZWNHqxlRa6KCmeAL2wZSu+RHLf1QZIxNG9cqY
         DnYA==
X-Forwarded-Encrypted: i=1; AJvYcCWXQJ/KNNxopLTh7yN6vv+m8nXiJMk1NnDe97yPCtkj6jZIphAXBmlZBVXWgnlq72yZYvNvx0kVM8exN8Dq1hF7@lists.infradead.org, AJvYcCXzDPhyyB2YP9eNSQZz/cOSRwQ02lrxQzxwudDBApLPTveOCTeQMvcFmVafjTjNhgBlVsfcXBotaXO1FeXjonc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuwpzAYNMYc16U3PUgrl6K9waWM+g9wG915VhxcmGpqFPGhlpP
	EHqcsIfyY5idjjAIqV5KwFOyhd8l3nvF36aXbuOVlewxiPOGEaXyCFyP
X-Gm-Gg: ASbGnct9+g2PuqpTbeA7TiDT4JI7266fGrtcfMrYjwe/IuWtkOU0iAd1zvx68qCQpeX
	3wrMhowk7lctyt+sxd3k7IxQQ6i31pbPqOtpilpmLWhUouPgC16C//fwBIKT/g8W+gE4UnHtzg3
	tLRuNzsPnMArb8RzuVxoRaMGVWhwFh5nd0adck40g580MadVOl3w9Bp5khwQBQyik04vDIvEdmt
	zV1cfXow8VbsR4SuxCz7dSNY63CdoTy2ftJefyC6fkudg0g0ni0Zmzxsk+s4xlsBl8QWOYIe8EB
	5V8mR+DU34l+naUO78800EMbIu5cTSrF9XZMunYboZS1DWqcNCBcxhUye3DslyC/kn/gFPvE7RM
	B/uYj3WkFY2Q+ln9zkCZ1Ogqq+7U2fuUdRGKKDfACHr7Q4GuAQ7sEPWgylvpmr2/Htvi8gjmlDE
	qaaA==
X-Google-Smtp-Source: AGHT+IEe0pNPbigzu96UgzYklOvX77/sciOzq5+IAwimo0FIOMEER5bpY4XblUXQDZ+bRyR0eBRXQw==
X-Received: by 2002:a05:600c:528a:b0:458:7005:2ac3 with SMTP id 5b1f17b1804b1-458a5858a2emr47023755e9.21.1754039919355;
        Fri, 01 Aug 2025 02:18:39 -0700 (PDT)
Received: from Ansuel-XPS24 (host-80-181-255-224.pool80181.interbusiness.it. [80.181.255.224])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458953787a8sm95789065e9.14.2025.08.01.02.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:18:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	parkeryang <Parker.Yang@mediatek.com>,
	YR Yang <yr.yang@mediatek.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Fei Shao <fshao@chromium.org>,
	Julien Massot <julien.massot@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC RESEND PATCH 0/2] ASoC: airoha: Add initial driver AN7581
Date: Fri,  1 Aug 2025 11:18:07 +0200
Message-ID: <20250801091812.4866-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_021841_592134_99C20978 
X-CRM114-Status: GOOD (  12.88  )
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

This is an initial series to add the Sound system for Airoha AN7581.

It's based mainly on the Mediatek AFE system with some bigger
changes for additional Codec (that will be submitted later)

A small cleanup to make it possible to use the Mediatek AFE
header and API without having to use complex redirection to
reach the local header.

Posting as RFC to make sure these rework changes are happly
accepted.

Christian Marangi (2):
  ASoC: mediatek: move some header to global include
  ASoC: airoha: Add AFE driver for Airoha AN7581

 .../sound/mediatek}/mtk-afe-fe-dai.h          |   0
 .../sound/mediatek}/mtk-afe-platform-driver.h |   0
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   2 +
 sound/soc/airoha/an7581/Makefile              |   7 +
 sound/soc/airoha/an7581/an7581-afe-common.h   |  35 ++
 sound/soc/airoha/an7581/an7581-afe-pcm.c      | 455 ++++++++++++++++++
 sound/soc/airoha/an7581/an7581-reg.h          |  29 ++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   4 +-
 .../mediatek/common/mtk-afe-platform-driver.c |   2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |   4 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |   2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |   4 +-
 .../soc/mediatek/mt8186/mt8186-misc-control.c |   4 +-
 .../mediatek/mt8186/mt8186-mt6366-common.c    |   2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     |   2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |   2 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |   4 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |   2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |   2 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c    |   4 +-
 29 files changed, 571 insertions(+), 32 deletions(-)
 rename {sound/soc/mediatek/common => include/sound/mediatek}/mtk-afe-fe-dai.h (100%)
 rename {sound/soc/mediatek/common => include/sound/mediatek}/mtk-afe-platform-driver.h (100%)
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581/Makefile
 create mode 100644 sound/soc/airoha/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/airoha/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/airoha/an7581/an7581-reg.h

-- 
2.50.0



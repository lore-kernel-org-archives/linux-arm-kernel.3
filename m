Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9B5C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=; b=w8RJ8uK1EZZpwU1fMo7tQm73Ea
	O4uDtI/VenpoSv5RJAba4F24d+wPQUgc8R44DPqJv8ySdWen0nWv91THomvFtzHCdHgKpYoQmMGW/
	Rb56DMO8fWxjXwMG2kCt+hS5+YnKkpNysh/tXmICKGGfoZThSbSLx2sJD8bh8dimrAOIiyD5hnjso
	9CJbJI+XY/QrWR9yEZc+cd0MU352KvdtYmVGusBLmzMkKiGX2nVlGkr/klfFIE3cmD7ZBl+/qnmQf
	ohTXqnOWlSTxH08alntHTongVVwMhNXRKB4ugkohOV7xtcvfNe73p7OMybhOqtx94zf4ZJeBa/A9D
	rPoxlCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTv-0000000HJcF-0l8R;
	Mon, 03 Aug 2026 14:17:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTs-0000000HJb4-0eYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc61541f8cso47447895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766647; x=1786371447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=;
        b=sDJsMLLKqKeIgZXthZXVJj4qZxXKZeyfIs8BZS7lCqikbWyOfys6G9oeP6DammD+n0
         Zde/hZRYvEnyOJ1AxYWsYLLzmoCZg4AYe3WmBrqz2AgXmF22ro7bo7cLwBDr37twIi2n
         MLlzysL3vbxDwQP6pKtJpT7+a6xFcwaxkLnxj44i87HQVsL21NyR/CaHZAoPAaoFc0uu
         6Qf4nSAYNkVzpvqUA0AyDxKGDnrjMGwSz18MeSfB7RzYzCXY8IFqznVWT/Sq3it35rvL
         GJGITnfpr8o+bBhOQqSDVNQp7LloF449LtJ2WDUFt6ddRTFrNtFri/MTitpxbnjPPREL
         Eraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766647; x=1786371447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=;
        b=tRt258I+0tZw0npb8Dw+hPixUykPSnuMY2KQP/MbJzDAGqbc9D3RLI3VGMbznaEFHL
         IJJYl5dtb4sEm+cXOnLoNACCLQEt3JfO2Czyi9sTnMGBManwkjF8O/Ah0S826MRMOJJ9
         2rIwTWPQLd67GhiGAvH5kmmU4kQr+HETe4UjGmj4hrp7884faQwyYfvv0FXCcAG37EJ1
         HSt4VnYkxX0cSePf9jjtXvxI3CjALDD8RfDdsL5reS5ZIMZNKO8cNLGiApjw5H9Z5vhf
         DS5BGXklN8N3PUitYWm47nZda4BnJWcZHpdQsB8Kf1cQaOEmW64oeQAs8BpGs+PBDYNl
         UVlw==
X-Forwarded-Encrypted: i=1; AHgh+RqM7YbH4CthEBEzc5g6s0Cd1ZiXI7rWGxiBa1pSspZSYZqfsY47Ai09cOEXXscC4sRh1V31YjgTZ/+MFeIhig5L@lists.infradead.org
X-Gm-Message-State: AOJu0YzwLsdtiwB1nFUS09ICHSvQg5TBskHsPpN3h7an+4gCRKSgrnU1
	i18F0Ez3SsOEbnwn3Z8eiXyI3lnNXGIfCBoGa4ftEG+KH+/wPMkPwocG
X-Gm-Gg: AR+sD123i6QIR4N1/4X8HWBf+WHaR5Siyvo125qaw2sG82W8ywht1w+lSol0LOUXHf9
	1FZRk42HazygKOHFffaW1pmbHaL/+AwGxgBEdh8jTPf4juZUjwgBGaQj1BGgjzCGJzhTrfZHNT3
	ufzNTRCy5buL4d3Cx4wXzO02pwe6MlMp+l1ycjC2ChSV8O8spi1SGYMCe/5w6VMdKoYVtGhKUtQ
	d/SyFc9cYJndfQLGa5iVTJs8Uj/3G9fqaG0Ql6yIsDjS7tueNKTmJr++A3ya96fbhWh0RSimfp3
	a2Ain4txzx4yuQuWl95KL0Ml31qp5vJesBo8B+MY4Pd2HjKSR3VglzdLLkT7voOl3LNz1gKgXEC
	g53PRHMCEVBh1Ik3bb751NkYEkyHtl9rbRpyH3QB1GZS5qSZ6RrCO424Y0eTUAY1UtFXcxRbCnY
	6rexvPcbUWN3qpnPAt0Fw1JyhoFf8Hndu+ZxGptndYpm3l+5tQmFolyajueRTVkvk/QW4jy5aBJ
	OCqYIBNAk+qUoi26d/h
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr7249914a91.4.1785766646430;
        Mon, 03 Aug 2026 07:17:26 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:26 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 00/32] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Mon,  3 Aug 2026 23:16:27 +0900
Message-ID: <20260803141659.559129-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071728_190153_0C53F7DE 
X-CRM114-Status: GOOD (  11.62  )
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

This series migrates most MediaTek clock drivers to the common
probe/remove helpers provided by the MTK clock framework.

Key changes:
- Fix memory leaks on module removal caused by missing
  platform_set_drvdata() calls (patches 1-6).
- Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
- Add missing support for cpumux, PLL, pllfh, and sub-device
  auto-population to the common helpers (patches 9-12).
- Convert all compatible clock drivers to use struct mtk_clk_desc
  and mtk_clk_simple_probe/remove (patches 13-32).

The memory leak and MODULE_DEVICE_TABLE() fixes are split from the
migration patches to allow backporting to stable.

Drivers not converted:
- MT6765 apmixedsys: requires direct register init.
- MT6795 apmixedsys: uses mtk_clk_register_ref2usb_tx().
- MT7629 eth/sgmiisys: uses a hacked probe sequence (multi-instance
  sgmii gates).
- MT8173 apmixedsys: uses mtk_clk_register_ref2usb_tx() and custom
  divider registration.
- MT8188/MT8195 topckgen: call devm_clk_hw_register_mux() and register
  a notifier.
- MT8196 vlpckgen: requires direct register init.
- MT8365 apmixedsys: uses devm_clk_hw_register_gate().

Patches 1-6 are based on
"[PATCH v2 0/6] clk: mediatek: fix memory leak on module removal"
(In addition fixed a compilation error in mt8173-infracfg)
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open@gmail.com/

Patch 9 is based on
"[PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers"
https://lore.kernel.org/lkml/20260304181024.738391-1-akkun11.open@gmail.com/

Akari Tsuyukusa (32):
  clk: mediatek: mt2712: fix memory leak on module removal
  clk: mediatek: mt6795: fix memory leak on module removal
  clk: mediatek: mt7622: fix memory leak on module removal
  clk: mediatek: mt8135: fix memory leak on module removal
  clk: mediatek: mt8173: fix memory leak on module removal
  clk: mediatek: mt8192: fix memory leak on module removal
  clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: Add cpumux support to common probe/remove helpers
  clk: mediatek: Add PLL support to common probe/remove helpers
  clk: mediatek: Add auto-population of sub-devices support in simple
    probe
  clk: mediatek: Add pllfh support to common probe/remove helpers
  clk: mediatek: mt2701: Switch to common probe/remove helpers
  clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6779: Switch to common probe/remove helpers
  clk: mediatek: mt6795: Switch to common probe/remove helpers
  clk: mediatek: mt6797: Switch to common probe/remove helpers
  clk: mediatek: mt7622: Switch to common probe/remove helpers
  clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt8183: Switch to common probe/remove helpers
  clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8192: Switch to common probe/remove helpers
  clk: mediatek: mt8195: Switch to common probe/remove helpers
  clk: mediatek: mt8196: Switch to common probe/remove helpers
  clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove
    helpers

 drivers/clk/mediatek/Kconfig                 |  34 +--
 drivers/clk/mediatek/clk-mt2701-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt2701.c            | 233 +++++--------------
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-imgsys.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-vdecsys.c    |   1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c    |   1 +
 drivers/clk/mediatek/clk-mt6779.c            | 124 ++--------
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt6795-pericfg.c    |  71 +-----
 drivers/clk/mediatek/clk-mt6797.c            | 140 ++---------
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt7622-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt7622-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt7981-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7988-apmixed.c    |  40 +---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  50 +---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   |  98 ++------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt8183-audio.c      |  26 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  59 +----
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  67 ++----
 drivers/clk/mediatek/clk-mt8192-aud.c        |  26 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  49 +---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  96 +++-----
 drivers/clk/mediatek/clk-mt8196-mfg.c        |  84 ++-----
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  42 +---
 drivers/clk/mediatek/clk-mtk.c               |  76 +++++-
 drivers/clk/mediatek/clk-mtk.h               |  12 +
 38 files changed, 472 insertions(+), 1596 deletions(-)

-- 
2.55.0



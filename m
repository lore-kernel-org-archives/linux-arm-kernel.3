Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DE4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=; b=YLgBkzqf14ZNV9SxO8DkqdOjyo
	GDSULnLA9w1YWer6WWPwNO2wR9Qem9o4vuUe9YJ6Yn1ibZcEVi9/kFBuNc/qzR3dZopy6e3SV7V/V
	LNebQ8Z/B2EcD4ORCKE7tPXnpz18kAxvdSUmEEvEYuaEpJI+fY6XKkjadp7a4CYaA81Yy8bRE/sjR
	O/O/t5shdmkesrXTFHtx+298YGtcs3mj94ja5e8rJ8OxMQ6ofT6DImrCGsDRRDg2IKXbQ6WTu2ctr
	VwxRllQS9yGqBBFuigBwGnBhpjYzKJmPW1JR5Bm4p+j6B52/Yyzj0D/Uh3UI3DdAOF5kiycn3AOiC
	lWb8zrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA7-0000000FJob-47VE;
	Wed, 14 Oct 2026 11:28:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA2-0000000FJjM-1wmb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso2014685a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977322; x=1792582122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=VxWol8coAhVMrD6LHHo4PuBfStLSh90f4BBCLOadUAyIvokLjfDwI+5ZOg5DLO0250
         p3xQxd/6qUhHMihpkguly11/lbWl3HXHas531Z8YaJLu9DXXQcx6z0QJwjyxGPyUwGVZ
         yOPsUONoM8o3uWvSmfNjfm7f0HH3f2Y3TAjOY4avKWqn/OY1TP348fgxpjOyrpHQcXp+
         dS/7ICGzxq5Tr1xD56X+Tmjf5NXwsyIAF2t8+bNp8BuJ3BkpwLeU1bBudiH62PeQSW2b
         S0M1c/ll5L2KDfqp34lSrFXTiMMEoV3emvCtX/lO7EXKi6qR7OzUyeX2TTrZPHtOQ3+W
         1j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977322; x=1792582122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=qdyD1MWQc0p+FcpH+H1WdKhD5aGU3nRs8N7+fUi6nXynqLINf2+4Hx8GZZGdo2St8r
         1e8ctue3yYzywe8QerijYQKKdFNtKsYs19QqPJQwODs2IcjORVGSggCjU2yGyOuVkeGJ
         WxIKLFmTz8kEuGY7bIuSsKcfneijJ1NgpdPgBQSd3VtXgklIIhGYkjguFXOAkpe/kqAq
         wZVBI4Nc41SJuCBXcQMc93FI9VMqlF9s67emva5DkL5Jaa2UDkRBwxX8HUk3l2H0LwnU
         hp2JasV1m0SB/bSa3ZuyNPWmb/hVYpyNISqQK7UR2xrPd7Ap6ftV6qMG8cWVP7RfrCmc
         7GVA==
X-Forwarded-Encrypted: i=1; AKwUvBwxqIy2s5yq42N0n2rR/lw2+5dggzKU9uPGhR4q+5M737nqjk+LAX66Ka7A1V2BmLF3DooDUWoFlkFVEd/gWeY/@lists.infradead.org
X-Gm-Message-State: AFq9FYITFkhcilkIg2z9UcnWYQqOTjaWYbzDQ2iNQ11mOSIHV86YzTGn
	1iHUqeLCadtSgXMTkFsmoRKq49p27acW1dLs03dpoNHIh9rjMYUkbSbw
X-Gm-Gg: AYBFou1Z9wcg7FmZOBn4hiBx4OCjuFpbMKAZMa2kSOkRZsG6ybRTpdojzFTiYOGYlBw
	bArxsCCNnENem8AvS3GqPB1hybxA6EXqGMmmMoyfXjuk8lMwHB2lwWP4OUd8k+vSQsBCntBCdVM
	hDrUy6ypfSBXW9uHQamn3gyYSFjtvlIaXRpckZdV1uJdz2z5P4VhuX3hGBFjw6pboFvbUHEMnDX
	vwYOvIwl/NUnDIolneBty/heuvdHHUn1zJ0R5m8WtGCgTJyH3oPfo5UwhAxiIgeOb8ZVyt+TxqQ
	vcJd2jsEsvAfxoj/XLvRdRSdTIkRWcAv/ioFFBcyAUP1rEP3SPI6CGb8vT8RqvxUeXxxtDg1IdY
	5sv/wJRqTmE7j0koRCaniiBI4r4ckHcFJgQb9FM9MvnAZ5eWaW8GzicyE+yKYpZSIP49VGyhtAV
	GGjSEK4Ss1DM1itIVOt30MIO9fJgWo90QdjirV5BMiEmy4EvycaMGC4nA0kqMrXLnO6g9gPw+b3
	7VzlsKG4L6V6xiJN282aFFIIiIcFaS8wUty1lYo85NvqlKuvv5K9LJRdLpYFOmS6cNIiTQjCqGb
	kgj9VYukcL7vrQ==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr13118979a91.12.1791977321825;
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
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
Subject: [PATCH v3 05/16] ASoC: mediatek: mt8195: Fix main clock error handling
Date: Wed, 14 Oct 2026 18:27:40 +0700
Message-ID: <20261014112752.683032-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042842_511927_0F560088 
X-CRM114-Status: GOOD (  12.20  )
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

Check the return values of clock enable functions and propagate
errors to the caller.

Disable previously enabled clocks on failure to match the
main clock disable sequence.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 03d2c4fd1f85..44cddc2b1564 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -716,14 +716,31 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
+	if (ret)
+		goto err_disable_afe_on;
+
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	if (ret)
+		goto err_disable_apll1_tuner;
 
 	return 0;
+
+err_disable_apll1_tuner:
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL1);
+err_disable_afe_on:
+	mt8195_afe_disable_afe_on(afe);
+	mt8195_afe_disable_timing_sys(afe);
+
+	return ret;
 }
 
 int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
-- 
2.43.0



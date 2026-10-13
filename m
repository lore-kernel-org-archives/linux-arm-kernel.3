Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9D4CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=; b=g4LgkSdcKreMYTfihBnlk1wITE
	XuiE+nkWJujHItkfZ/HQSqbyDtznIlkWEhFqQACF62corCj0BAXfKD4MpcRIETSCXCfVrfgZxhbLt
	T+CWIG3Gq9pfLGGrBGAivpkIOYtOXm6M2H5EJFvsmvfV9wt/Rztq6msrd76FW0iynBE9nJP4+TS2C
	l2qSIR+ldcYWE8FG/y3xt6sY/7OUOQqAxeeI/0vQarx5uNmKtYiSFQtZFB+F+uHsmDGZByCpZKP+W
	tKiz7VdJMuTFv1wyn2lSZrCjqzkb+1Atd8DIolTEZFUt2wt1npgnbC6igxyCm8qIcmncmqbOr8nm3
	d0a6Yfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHC-0000000DGSX-2WGL;
	Tue, 13 Oct 2026 15:18:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGz-0000000DGEo-2JKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso2247688a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904716; x=1792509516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=F7WMJl3CksCan+iKDU7Rv4ofcFietQfZYqpWHEGcdU1dqXK1V2TWgTQluhO5tNjI5D
         F5DGpRXkj37HjRQcNBpnPTqrR+5BeWIIOaROjrkkdKFubILxk6bKXZxpGflJGMBav2fJ
         8SxjBIq/f5iCfrL/qjktsVGmJYbtT9NbskbrVPFoDR4i5U3TlimnmF/IxjSou2dIeoFX
         d+KO3NthGaDvkhYrGaX/oLKbtOdTdk531QoEe1PvjAI+tMkfrlvkfiJZEH8DTaEPOJDB
         /dfETI0S8LaVaqJkL7Q5Y6ASDW/AEeZNi20meJFakQkgfA5f1ro7Yv5oCnlDKv2LCTU/
         qsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904716; x=1792509516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=J8k9Z44Z9CiX9VIEteI0D9TaxgzErf6JowWkLfAafBZdrfIYLiBcdsNuxjC/nTqI3k
         FBIyMU9PuSPYrYsTGekZ/w3XmaaGfvO/1SFgl1tj7Mw6n8t2vv2JU42zMkaP/VveO9lc
         8gXEXqYhUpbnwROMuaoPGd84Q0/aiugjQn4hKEqg8QU5ID+5878H3/NAx+nI7BWSxviG
         NxO4G6d6B4CFY+rNNvwrM9Z5JcJcrwGw3QJ6fVPHA4ukb9bj9UF4qboiIcu5KebGFJ1z
         qAn7PwHrA8NECv69ZzNw4deuBlflelfJ6ft2B0S5cy4Rsw4fS9JBrQLwYygipgRHNV/0
         oQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBxHjZLX6wGyeLOgitPl0UJTFeLuCYzvFZdtawkgDsbOR+tyJ3+pT6gn+Pyo9FZHVs1Z39k5ubxpNycvxgpN2fbj@lists.infradead.org
X-Gm-Message-State: AFq9FYJyxpeq+ApCl+v8w8Cxo26i2z4XuHvL0h81kTjQyDM4xVa9s23b
	xWaXnM5uN2iIfc636ePY1SMcTlE85/gWpvuIohWtWWV1o8qEKktL7J0f
X-Gm-Gg: AYBFou0CR0tpHwRtfa+5DVObBs/WZFtXPdTsto32qNbS1E5scK54fw4bCkj9+NH2+37
	zEqj5sdaYXpe/Ucv7Q+TaSiYoOqoSrM5h7mBKFrmppBsI/gpaYvaaFZ/SgozY/sB7FopVSFXqia
	YE0yBiIPUVV5wY7IOfuXMDYkGs0lHgOZyLwiK6KgMhRsPmqElon57bDpW7xyTyxrLV+AIw3w3OF
	MuQjS8DjEQQzWsmY9zN8zUzzAon4tSocvcltyouS6FaPkfcwFe6QSQ330H1JV6i2S8sviLYqKob
	UHpVv+1yVcfQmg1RX8sK14SdPbZP5Zt1tdUyOK6PmKiDP3WtsCAvCypRXnmK0gVsFoQX7777Win
	HFJ2ZQyWT1vD4rYwKSArOfSrlbi/8ljiDh+lX2j6ZmmB98pIG1gIIXnJ/7KG9eA5gYC1EfMSfyv
	gzhhnRKC4ZVlNDAK8ftmls8MFMB5zx5uw8LiehJn3NVZK8rO8BMKpTrvyWNidoD9yea4qg2mcJ1
	84l3xm0nLdZA0tn+CVzXSi7M2JgfXUVAMx9WNs=
X-Received: by 2002:a17:90b:4fd2:b0:3a0:b800:50a4 with SMTP id 98e67ed59e1d1-3ab36956d82mr9294604a91.3.1791904716462;
        Tue, 13 Oct 2026 08:18:36 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:35 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 07/35] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:06 +0900
Message-ID: <20261013151734.3177690-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081837_663789_FF4511DC 
X-CRM114-Status: GOOD (  14.76  )
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

Add MODULE_DEVICE_TABLE() to the MT6735 clock drivers (imgsys, mfgcfg)
to export the Device Tree matching tables. This is required so that the
clock drivers can be automatically loaded when built as modules.

Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Removed wrong mentions of vdecsys, vencsys from the commit message.
---
 drivers/clk/mediatek/clk-mt6735-imgsys.c | 1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediatek/clk-mt6735-imgsys.c
index c564f8f72432..813241d526cf 100644
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[] = {
 	{ .compatible = "mediatek,mt6735-imgsys", .data = &imgsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);
 
 static struct platform_driver clk_mt6735_imgsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
index 1f5aedddf209..8a18ee244a4d 100644
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[] = {
 	{ .compatible = "mediatek,mt6735-mfgcfg", .data = &mfgcfg_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);
 
 static struct platform_driver clk_mt6735_mfgcfg = {
 	.probe = mtk_clk_simple_probe,
-- 
2.56.0



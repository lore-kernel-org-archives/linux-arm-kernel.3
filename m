Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E53C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=; b=3odqQeGZ4UNX1THA+NFCEkIQm0
	1wj2puIDsc3QF/l85eEIz//D+h7bwK+1DyEXTkKGLMHx+4nso3yOevjz/73mpmvBV+nvLh/AtoXlQ
	t5RQ2pjubY0QJ1kwaOHR/0fE3WUNd4mR/bre4kTLD+qsQlzSjYNs5V18y20pt9aKHv6BULCyOgcF+
	uL7vzDtD48Xn4eKZGxivnVE+anuv5u7lrDFdvRQv1qELX60L6lG3pWLk6SmJnjWXQJWW6YT7daZaQ
	gofyhmVYv1D5P/GzZCr0CG/KIu/fd5vrGtxxjVoMjyf9D0PE8eGWSLzcbETX3+oydlgAag0GKJZG2
	vsi9vlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp4-0000000EajE-2nga;
	Fri, 18 Sep 2026 13:40:14 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yox-0000000EabU-1faF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:08 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so480304a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738806; x=1790343606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=In+jtLuDkyBaEzkW5NrZlE+0rczPoBFNeyFE4A1CJ/Gi3/01Jct6w/Otc11r9X5O5V
         aAhalfHIDMaoq8BaHZQ7+Kl9j0LgfKsUjt9WwbgRMOddJ0QfEHTvgtl3C2D+Yx65C2jk
         7VOrZXiBTjNSPmrm/oVI+r95C+y1wNYJn58EKlzydufdtTshmAYIo1Ib59Scv21qXWiA
         vA39El3Pet7TrAF/gfrZdXUW1/cv50DYrEJPcQn61mBLkID2oPqxq4i6n/qeRb6oBvAH
         4HWSiu3bCk+nsCy9g8zvM1oXMCFGywebxdNJ2RTgBkTC+VzxfmmjQOzOfGFF1RHLCL1/
         hZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738806; x=1790343606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=lOBGmWILUZeDR4z9nTkRJ9iwXqV+stZ4GS1GiVsKolKnLoLTY3cOzrL9SH+2ecB7sI
         zBGYytZrCVUFqxL22d1hNO6VzbagI1RUpZBLBZQbgwY2julGY6E77ylVwPheU3uiC7ti
         aV6Q+MlG/SLWmMXVsfga3Wf3dCWDN9c11EBezKRP2d+sHx6piyx9pM1hdN9M3mK8tKae
         h8aA/xYO6C+9RRj/QBA9hM71HNoCiNapvxCqzt63ObC80qgG+bjs7z6mQFuqyV6GIZ0z
         7si11OxPRZwXDIhNOmjmnALFLlmspNkZCY4kQRskGQb2Beup5clSef931dgmMqtsSPG2
         Ucjw==
X-Forwarded-Encrypted: i=1; AKwUvByygj5wKuSSk0bSbax11RxleZVZgZs0vOfCvs2y/P71Db0VVvU8VA8Kns9OnRLj7oRcGAg05HlRWpx5rA3WHQHU@lists.infradead.org
X-Gm-Message-State: AFuF++kbmUVXhHTdfzceBGhLUmDn/6bHHcry5IwoBMKLxTOOky7lPQG+
	oX+XuYQM2O7hVeuHxl95HyGfwBtrDpzPtt0KJhUqkYa/LEd/s4X2sXj6
X-Gm-Gg: AYBFou24XEnv6sR33DT/DnBLyMgfM8P3GjW2cMrBFTBomhoaXtnIMdXQHXojk8IqRPW
	Kc+DaJstZt83dOBUFi1x719+cReP8nAyNWghjaSWYMArRtVSDXbsKjFNW0izPabNZm26XqgyBsU
	w81gsn2U+hAxQwOl/Z0sdleQ2IeH/F9ip4H2DqlSmk2mbGj9+7+Wi86nReoHGoQDIil2tHPC0ZU
	oGCLrqUYAg65Y2izL6mB2ISeAH5t5qQnNJSUIFcdabed4Wgv6BLW7v4FsmVlhAC5OFzY1EXuAHQ
	OiVY4UogkXxs5REiOIzaOdwogr+1vXgfOcbveEZL8qUkf89vbtYr7VriztI4W0RV2r2+B43yAl5
	3Ag1bANOv75FGFnnIfzKU5nKL+ZMx5G0C3ojvSUMmB3PhgKMOvmLL+UdsG1EPjkK7qO5cYd7VDW
	qMbVX0Lv/8E9gG/JSwRGZ+Gw2pQfzA1OIPIk+jcSHuqgu8zSsFNLxlRXl3p/kex6uC1nJQvzJur
	ub25UnK2pHVcqdhIZOGD64FmPySmjfvRewB4hDrUhYtkHw+y2eypPg4HbWv9/ayw+1HW245ZsSQ
	TQlLcZFF7Jyyuw==
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr6408347a91.28.1789738806339;
        Fri, 18 Sep 2026 06:40:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:05 -0700 (PDT)
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
Subject: [PATCH 05/15] ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
Date: Fri, 18 Sep 2026 20:39:01 +0700
Message-ID: <20260918133912.133799-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064007_435337_C90B47FB 
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

Switch from devm_clk_get() to devm_clk_get_optional() when requesting
clocks, as optional clocks automatically return NULL when not present
instead of requiring manual check and NULL assignment.

Additionally, handle clock errors properly using dev_err_probe() to
propagate error codes (such as -EPROBE_DEFER) on failure instead of
just printing a warning and continuing with NULL pointers.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 77f596cab92d..9b9a3465ddb5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -672,13 +672,10 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 		return -ENOMEM;
 
 	for (i = 0; i < CLK_NUM; i++) {
-		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_warn(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				 __func__,
-				 aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		afe_priv->clk[i] = devm_clk_get_optional(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0



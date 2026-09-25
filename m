Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92253C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=; b=vpDOlrU/LRwEgOp7MM31vlQv1s
	zz+t5gHBY32CAqUD7uyQhCQJce7ZELFUT9uhSydYuU0a7L6rJ8aa6xy2ctCX3XCw8BB7WOGLsGhGb
	5gACw/3exCbRwtGKCydhYsQUDJe7Qcrgh80Kzc7KDoqSOEN9qJlDLNuVJ6gUWnEHdkZMHAHnroXij
	Bh6UE3tl9a9ySpeQ/Yvhn1P/bM9eOZ3RtyjTAxnVRV0Ru0HYE0QwJUQZuLuPfWj2hLETrW9D0Y8Gc
	++d1lq7Z6T34roeWg6RZwyx3Dm/Rd43tU2axig124Yqx8GeDRWPEPCfC2cEXZgU3d8yT9LhLs+lvj
	pJR2DV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xuH-0000000CeS0-0w0v;
	Fri, 25 Sep 2026 04:51:33 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xth-0000000Cdyk-1Oml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:58 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso297251a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311857; x=1790916657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=m3BllfD1xr5dWecMUjWZ/wH0r46XJ3XzJsuVJy23GKqIIfg+jwx43f0w8JThBxQJd2
         oRRqAF+WcgWqOfwGx77wI6YH9rsEKwSyeKx1SqS9HKnyHGje/RvVJy9J8/b2BkKtkyQR
         J6WXd7vc0IIgJo+ZWna5Dxp6nqo8110pchM+2lXkXPtwhqFpP3ofCSWX4YGAejfc+R75
         2XcRfDXZ3LrgJ4x7Ose8TipwAaxAKQvwLRVxN1ytKhS7NnSWIXKzjk4F7UhjTOxzByxZ
         8OQbkgylEEGugQK9TMX5L6Sn46MpfEtJVmmBF8nMwN4DU6bDTDvEUxDE3VhBO5OdfwUP
         EH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311857; x=1790916657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=TW5kyzNLF4K2P1M1ccirS/gpOS9GA0jX5jweVFYXpr9lhJZs3p1q/Vkq3DUc+8rVfY
         rCgAsmPf/unJHesJPHhl8nmYvUF1fdeXWXLxXvrxd5i2gqAbgQSxVnM6Ijuwgai01BFG
         Yz3MhkUxMAoBONyUM2BxM/SnXXd44QXu82VAOofD6zf+6kJaDGOQrYHbIfNKALQV6DuG
         NN0ZAuJS3MeWfgEd9L+RTbxv2+5CT1+WqrECZB9U7ziATJz74s5y27PBG26lPz33N4E0
         AjvJk8lesMIUgpRiF2R57L8Wi5Ge/ZDZ1JmjXor9sJ6pXbl6kdB8SR7Xv/ZTmSilaCEQ
         mssw==
X-Forwarded-Encrypted: i=1; AKwUvBw5NrF3yZEF7yu3kM7DFi3/PKEqKrem1ncc0IXXmrK3nQmXCnW34LOzhrHYDNNDTX2wrTeXCfStZYls8n92aqC/@lists.infradead.org
X-Gm-Message-State: AFuF++nAEvmpaOC37NfT3cv7SwkQhx4UaRgDXcE2LforK3yAZz7rQ2Y0
	ZEoq2IX/gW/sL4PT0U47PMByqOyWZBABOsIVeF7D3PM8lNkY4jA8bMgX
X-Gm-Gg: AYBFou0sM3SNHcNoUbHtsiPhPm36n1tzU9icXPk3PFhl8VYUUTODxWjLkeKrXEqcod9
	VCLmXp62vPvHbF6JGJpIJM7dIr2rTL0NYHRx10Pfpr8AeUPLgtlqLRTN1Cucdvnm7cMTKmCrd3H
	mnzCBMfpcSrxe23zajRXAQltUfSeWXF1HzZH9itVocYkw0vT1WjJZTsWsfU6C7fzgmZgJ2lazsZ
	idlGe6EqDISfx6w5DJORrYhKD4Q8EjEhLa9zcHQGfkor7pUJX59zmU5yUAnkIA02eEeBBz5s049
	ixdbI96y8YpKP/htM8yhqNfb4UrmBaHRgiyqe+nssrovob/IKjzxn9c/rbt5Lxc3KhhzCdxcqcT
	CTJiz6mVXZcU32vM7+VM0eNjxY1pSfjS+UQAq5eQvIAxwDop06ax7jWu3hPnTEDadAh1J885XFz
	8EW7Rwb1iUZo2+JOLlyOabfXA7cEXlSTqZWE3XBByYXY8snqScBwFCOlhSRWJ1lJcu4BafrMeEF
	cBQlhzd6/009hg336EQLK7Slw5PWXUv/W/cQJVgsMsVjk2GPSsimsJ4tYNiGUDPepIV1bphoJSH
	utnzBUz9mFG+Bw==
X-Received: by 2002:a17:90a:d643:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-3a098db98a7mr4301609a91.35.1790311856643;
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
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
Subject: [PATCH 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Fri, 25 Sep 2026 11:49:08 +0700
Message-ID: <20260925044908.450775-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215057_399145_750935AC 
X-CRM114-Status: GOOD (  11.43  )
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

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E46C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=; b=fx9NdYpuDNdl+eudV54dQkgtpH
	JOo7VfZ2mvBO01xg+uiOCca+LxFoJKtD9YieQIYWBoWtMtOGsmEiUFtO6XQysgbSV9xLkf0bMn/l8
	tyYMEWs1MzN3y9QXFyWQ8CCmwIEZapeptGMW1l3xK9ofaAHiLGgdKZwFiH516eGJ7qFYweZA7r0xW
	6fV0X8us53Vb60I82r6//iue0YovjySrv4Fxvy5U3XX+ye59wUPLfgOGpQT5A7ZG2tQcRChA5k5wE
	XdPLdMO8S2lTuSBMVGvCBSRg9FoYX8xy/vNcMBBa9HA0Yt8JdKynTeUpO9cOj0Rhbj9c8yHAfrK4a
	/MYGBMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617s-00000002YGL-2cUZ;
	Mon, 14 Sep 2026 07:29:16 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617o-00000002YCw-1wd2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:13 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1828192a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370951; x=1789975751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=HN1APuJ1t2G3vgTADd7RLRI+zSNkGt4rjD4VtQI8CN7rfki3Xr8uVrwKW+nZlsTE19
         Q4u4grGmUTRS7WNAr9h5YY9sR/XNonevLSMWm1ngeh9ANJ2ffXXnBuLKExjQ+JSdz8TH
         ggGk4S6xJ4sVXjzDBO1ApSxqRwZaTRk87Pw7qeBQS+Uwa525Uz0aEFqsbTiCGpaqji8e
         B9nrNvjtrtN2Rx6iK1EyHNocvjmgDzJY4YwKM6qg9aTLNAAXp4besY975y6jIP6+Ojqy
         sG5ZdlAYAEcmqi22tUw670QcyHpZx1ktCv5W1oIgkZ0V0BNP9opxcIhfthXgcgvwX3mX
         K+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370951; x=1789975751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=NgqHToNfbFpPrsnikM5dnXqDPvVrRhEUHCPKtYbyKVnN759XTVwu8Td/POKX6RA5dh
         cf497mHA8XFfxiJXMQkmSAtqcRH//FwtOn4IzClI8QW/n8R6GqYKHhbt5dFcX25xJ0Fb
         gdMdwtTYVgdcrn5wJ0OmcV2gxzr0uVb7NV9o+mdU9l36YO3YTGpN9ApiGjXewLTi0Xly
         1Tu+m/ftM2pKmngjVQ+ZpfTaNjv7zyDvln9GFJlAeXLGUAmIb/3dQXgH6fu0fU8DQrU7
         qGKvlc3mbDHQ4QaobqB1VEFP8M8e4Jx1x80nCEmzPDfr+5HvkOoGNSYpgsm9VBcco+WN
         Qv7w==
X-Forwarded-Encrypted: i=1; AKwUvBweSerxV0Pdoh4cz56WONQhl8Nof6xpPH8sb5tDEIGHh8X+uge0suEJy9Usy+hlNJZZihTPXgHGmZ0nOVsGjQh3@lists.infradead.org
X-Gm-Message-State: AFuF++nhrdiUTXnNibX0V1Tj8KjU3VPKpKnJapExUA35v+kUzdSaQVox
	uIyy913RtQwq0hORUTWYxFSUM+fVLF0NV0h7/+fB/5UJK9JAqlZDhe8L
X-Gm-Gg: AYBFou0X7goX86fz6CQGiYG85cv/7kgCahz5/LExQAZd/hTIqJM4CB1WxcrLeWHO9Ak
	YfpuwmWBHS8nTN87X/K734ZtJA7mCRgP6TQztWVaWR0NbgDVW0YhqBBebt+SYpOYj46OdBPVOTV
	aYK07fMqYGJdbZtNWkEta48AOukxOskOsdM4oNDEsuGxV7e5uLJ8m8FWdURimIS+r4oNzwS8nAL
	7jDmvUwc8zksScpceDtu/EpE4EK04Rd7Z25da+LU4uCQ1Dl4OaJRbPFBTykzfM/71bLH3fNjKX8
	BvmB93Qk/kFLdHkfyjb9BtNe+7pMGYxHRfLsR7DfWZEBc1bqLtnABRYhv0SNVbEI0m3u/ALhpvr
	bFUlj8TfD7++9+a4rgaBHK1Guqbf5jO8MEhkOVc9vUr61LOqx73G3sZJQv7OfF5JGH54P49w0tc
	itCoXD6ib/MDyi1/bKdrSORID3LJc5QgA+SpTeSGoHPVj469SXsSaELCj/JI85ff99aBBIZ+Onh
	q0cwvoKkkcmJZDYV5q9ybzE94XieU9sZR4DhmivMnTRD2CXlEF7ymL89HCuZXBFiAl3viEnhDJ6
	FYkUAp/dGHrsnHo=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3025082a91.12.1789370951458;
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
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
Subject: [PATCH v2 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Mon, 14 Sep 2026 14:28:32 +0700
Message-ID: <20260914072842.24420-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002912_525680_F4A23F9B 
X-CRM114-Status: GOOD (  12.53  )
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index aaf4f7921363..8f6241d47a65 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0



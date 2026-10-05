Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B45CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=; b=u5ZvpBgurZeh4axztOzoy7Oyd4
	cAtkOaAQJb3pWQIa/zUIKvyz6z1KgRfNKJpV0uM6b7yAPoS+J5URFyQ3y1X4L+bGb9oSxJBb7T1Yy
	BPOJA/z64YpSZWdPrwDpCeNNOifJyzE+U61Hx7umXDCatLOEmzUObFxLQe9BeItZB869NVehRXH8D
	JtpX4jTCqY9WtRFopISBUuu74HbIRWHNygSuYSYUkgKC+9bpQP+fjemI30Sf3X1fyLk7rTcCGnvdB
	szJAERTW8gsP2J3wv+75G51oOq0G2C5zkccqtIoEEojzKCOSmDEw1VodnxrWCD+eBQqwIrqoTd8Pi
	aT3/vheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUM-0000000GHgK-14mZ;
	Mon, 05 Oct 2026 11:04:10 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUG-0000000GHY9-045x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc758830601so1047888a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198243; x=1791803043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=cwqir8EryFVEKI5Qvy4OAo1dMkYDdc+HSvOhu048EPkzF2HxGwM9kp351MH9boKhmH
         DFQbX/xuhRCOk9ETMAg/jZnB+8X+TxiSovXEbjjsKp5YL96pOI3/Y7OFAa7J94c7RJKF
         5foZPHJq91pnriQN3k54BmP09Xj33buzfKQscqRBGxrlAToAmD/UOVfKzPASuI+/48vt
         MG5iNbURYMDlXKY4XNmlYzt6RtztLM8ZQwTVe7feoUjBRTDJUU3wuOAy59PiEUqpNMP5
         sxsZ2x/EMaeuzgPsPZVZcoRoR2qiLJ9yuTRPK3mDXFHnqtiikbk2ZSCwqzRGJ92HCg6j
         dhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198243; x=1791803043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=OSUUVHBUKI76+1uQCzIYgbicYsA2Tfxbdm9cEEz2NnFB003ffqgbCpKrEU67E+CKbV
         yBmllywyu5XOavi6MoxESSxeBXtQHjKNLs5A2pYUPSkZJ3QwFo2kUXPl98IA/jUaEJIm
         lfSBNH9ZRYc22tB/xyySbqK/e4U3nFFrCOJESWGGyVi8eH2xlwqPL2g8dTCr9VevaDz4
         nnnF5hkCBKRyWF07nkZNgMgkZxBRo8pmvKfUQEVHAsmIYILI4LbvrM2uY+4hLxGfrKOZ
         5QcfSIdu7Dc4TbfD/LuTZSelc7u0tnjAuITLdhg27tiseWHjdOxcHsTXiWxDKLfNDeJb
         9yvg==
X-Forwarded-Encrypted: i=1; AKwUvBwz2gBzto+oTtUqveIdeseUfxrZJ3WxBVfxaXI94sjMuzOAAjAJDdFhozUOMf34BvXaZGe51BWG4LNcWIt3tQ6L@lists.infradead.org
X-Gm-Message-State: AFuF++n53PC556JMbVGdl5K/ZVFRIdaao11rFNDdObHZdwO82DtX38oC
	H6XwSvSCuMclV7kXxYCGwV0+iFFVJ1QA70a0NDoIBvED+D0P05bTlWzI
X-Gm-Gg: AYBFou3nsCDBXODT5ycBbLgT6boZSJ+p77B90+aZC9TSMjZPJ1v5zfAURdhW1RF3k+B
	D/6ezXKNkAfoEDX/X7UGtwW+FJ07BQpK4lzQ9xB7FCMTTvnDDjwsvxYpQi3u7otNKbIkKXy+h0i
	Nlc+b/cvtMGVw1KIiSVilWHKL/LwHSyrAJ2mZtcEC/tYLZkC69Z+qCYIaKCKO7sKch6xEfMnW+d
	O0T0/dBAlIHX2qAS897Kx2HmoAcCROOBJp+x6fAAXkC7glQH2fj241QJBBLJi2M61luxqBuVM8z
	fiR076zXgtkvyab8drp2Vrlc9T8kBv+JyQdP9Py2Q8ctsDiQ1H6tPfz0Q75+7Z8zzVEcHNQRgER
	kAr8SWWrRINvmMSgPBbfsBj7g/50+zb+ZSbZeWkWG3iyfvsaxoJQfAsENMzdgXIjGduOS1sTZeZ
	T3xbzoWoklP8w9Q0QmPLn8DQmieG2XW93+rNqSXgFvDgogt2iPXfqlYefc+NpegPK9pPh6vDywt
	JnA+N/RlJfhS6MsRruPZ8Oue5kQsfxLp/NYYc/cqczNOa8wBZGUcc64W+qGAReKV79egHfMmGJ1
	QdRe1Oxr1kAC3A==
X-Received: by 2002:a05:6a21:648f:b0:3e0:b1b2:2ae9 with SMTP id adf61e73a8af0-3e0d6b33a61mr6751759637.47.1791198242991;
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
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
Subject: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Mon,  5 Oct 2026 18:02:53 +0700
Message-ID: <20261005110257.50145-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040404_165272_092997CA 
X-CRM114-Status: GOOD (  11.52  )
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0



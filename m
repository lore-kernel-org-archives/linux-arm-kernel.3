Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37976C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=; b=ziZQHgyrSXB0Lv73Ze4gfR0RR8
	IFu3e+V5Z/11l7k+Dmqb6oBYJr7PJwfNJdpLYYZMS1iT7scCvJMX7Wluc+jSd5yYuiXorOJ/dqqLt
	ZkAh0q5ZdpP5mmsjTO4983rtcehrjcnh9HSab9onwl7nuTTwOF8YB0BqfEvUoFtlwjdPMeKxwSBis
	EL46ARp1MKMs6HdplTKu9z5Xly2wCruh797btiygR9cVIrAluvEp3GUUAgfbdHlyr7yGYOYgcQCEH
	JtB0Hx41fPLI6zpKdZa6Dc2Zzk85zTbqRnrUwJGUY0IS/kqDz9O2XWqL4H9bTlLtaDJhFhPkFMmKL
	pm1iRT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMj-0000000EP2z-0BLu;
	Thu, 10 Sep 2026 12:58:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMd-0000000EOvq-3AY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5909838a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045131; x=1789649931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=D2X5hIkYjaBumMJcVI5sMTpYA6yFa9CoV7aZQZwM3WzqleRPwBStwy1HM8F90NcW5U
         7JNOsxvwsgbREiqnShObkjjtDIrG0jAJbYv0pM6KxcGP5+GU7jMnFFNzce2dI00JnLZ8
         Y2ieCmerxyUEJVokv/Tw3hKKDdamsLeFzrT5zJQ/lKbxshnDgwHTjrnWTFFAkTgcTbhK
         oJiZT4715lx2SyDpB+f6R5t3OFZCajEDio2ZQ3L7R6uJmzpJbGbtRUVg9ElDi8YOU+se
         ex2LkRqQ8+89fB7/X+5TrOoTq3fpv64bR7oep31IDQcv1jvYDKagD4CO2Pi6KfVet3J5
         l8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045131; x=1789649931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=byPyNqhDoqsqWWGMACHBXmepc/7blHURUUxPlgnWEnC3EIY6fvZzpjY5CyKhbUNoLM
         EUb6ZOZorCcsEtEwcY4jGOBdixKoDO5ajhk1Q9v0zmZrKVey9/VbqU61kFW5LJGwAnjt
         z/mbzuHh0QMVXHysW67MaLL2BnRX4pXMmLlxhoBvOe2XvpOnumCtUBhhhdsCPkXi0C8d
         YHCf8J1VG8KlW9mSY3HqqPVqHTFj62B9qmwgCV/uhLtAv17icmQteeduUMqUQbx+RXhL
         VX0EDSIHd4dqOXSXkzRN7kW7O6Z2Fmha/XknLWFlngQrqoGh51ORcGbqymtGtBg1yMYG
         0lTA==
X-Forwarded-Encrypted: i=1; AKwUvBzzdf4ILGA/e/jKG33XzPsi/alCedXDP127yGcoAvdFAAdt/HDWVQQn/7bN2VC+js2bVXaRwDhf3Btxcg3Xjc1x@lists.infradead.org
X-Gm-Message-State: AFuF++k3Mli7HWSref4ymcZ5s/XUOzlC/P6pNV8Q/SL+/Xowh6/GZDyJ
	73IGZQqA3tuU6fM6Th0LoeOLvRX/zdQPQMoCFroC4EztKjbMhuKNpwF5
X-Gm-Gg: AYBFou1JlXrKGFbI0SLyLqeOlryLILQ8X80gPZINCCF18YL6wzsD5L0Ne/MnNJJOkbq
	zvifRDqrd+DFk3no1jHCXj9qlrzVjP1dKVyxFUoWE96qq52SzuSN7bwxjkiW3sxaZ3h282mlvn0
	q5Fz+tShmuYhNGRJHBqNrtNvzUq3EydZ+F5BQdkb5qKDVxmV0R4arZQWTQJrZdwIx2Iwkx+7rtX
	jelRImpGEVoIpRYS71aj9H0t3REMqhm0PydppM+P9ZkxPhOdB7XC0o0UuXGw8Hac2thucTMmeAa
	rdbA+X8Id36zvvqLhyqLO+4LDEXcVHQvN2HWQFetbskeB70mVY15iqCrCIquw+hWdyPadZdgfhG
	Dz4vSo+bRe5oQF2rlDG63xNq22Q1T8tDCACxiN4+zt8MVSk/OfCRkEHQU3AxA7vf64g49R8RRYK
	v8CDsyRLCgWAT6B799hu2ohwbGfbfd25igv0KNbyAmMkHTlqGabs+wB6XsgSkSX/PsDaYVIHEcq
	bbEEqHn1+zuuzVgXwWFKYQR5eA7YDjgWuMepxz8wcBaLPzxS6Ij3g/LlQdksi/STekyiUldAxPm
	5LNI22pDBs8faD8=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60419743a91.25.1789045130914;
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
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
Subject: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Thu, 10 Sep 2026 19:57:40 +0700
Message-ID: <20260910125742.150902-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055851_794034_F3691D8B 
X-CRM114-Status: GOOD (  10.83  )
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

mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the I2S clock.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..ca7d786cdeff 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95166C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=; b=wZ7qyOcmn+x6f31wZPUtTtskvl
	aDhy8PdvkiRINiENWxn4YB0HNl9/3UZNjm8cvaEFJD7TqFZx2nOKQx6mhYpiuXJJYcQitiMWQrWKM
	PxHhGB5NJ+T7GilWLb0q19oE68GXr+vIkShmnKLg94vrXETPLuOqKSsoDg4F0cFv5nGwjvySn/F1l
	4KbB3h3g76DR5/m24V9v8KdRUu7jArjsSGfKsGNe/VSpz7h04BVuxaex+seHKY0cZhyJ4h5e5mpFY
	518bJ20I+o4t5f6JNkPAmxler3o5lnalHEyKtzbqznJxS8hcMaqEur1PWtLPfIJbV4hWWefVUe7YS
	jShNKvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618e-00000002ZAx-1G4G;
	Mon, 14 Sep 2026 07:30:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618V-00000002Z06-2Qht
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-381b831d535so5576711a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370995; x=1789975795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=Oxh5KtI15mHLfutWk+oNPhcTTufJHvtesnDO0zlXC1rKbCwg0EkOd4sxafniP7o+0+
         UWjjIgDVJyq7N6nke2PMlsbOPPatRhA7sQFreXyQOoEFBii0ca38IL0wRxweSD5XuWNm
         +0PT/0vZA7gi1Ragzm5qm1vCSuEmyy+Am51/ISbnFAjHzca5mllBy3lSgm3hm7Pdrn52
         unXrw612vEHUFbUc8Fxjole1UrGBlCDWZtR/07Qk3UHfHWFg1gv0DT+zWGeYpN31cFUd
         f4jCNG5sXSSMg1E1YHFypCy4T185Ed/HAtQMZeqKVND4Ip/2Xo2FkPQRkFYEtogaCWze
         bb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370995; x=1789975795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=WozhwkdMmNI5WYWV5ZwsmYQK3EOYsLYBdlxcCdktDH9qoXttnYGfKp22oeU04e9Wnr
         JqyT6F34jW0yvjVoTyq/SfRBg6PQj+o+QlWESSe+WauARkYxPveV72gvmHNW/FLt4SwO
         Dr65lKj+uMes0k1lzCvWMmKDb1H0/o45ieSIZKpxcHL3eOi9r57Wq0GUM73KKEkSzC8V
         weuQOJFVnRjkyAI4F2eMyR/0EXQGUUwK4QL+dWrJeQL/EZAzdJc6oI08GOzgK5S/Wby4
         mc9M/B0wCcfxSsSCKaBhW+8V33pzcN3i3LEoDaak+BuVq4nH5bLRbzGw/CAcHlkhVQLI
         tFCg==
X-Forwarded-Encrypted: i=1; AKwUvByiHNRdPQgGV5wYIBhvstj4DVReQbtTUSPYtowP5VKuf1fJLeFKg+O4wTwvriSrmvE7bbnAgIkNrqAQO/X5N/zr@lists.infradead.org
X-Gm-Message-State: AFuF++mFumGQWAHigIOLA3TO3zH/ncSEQO/jm2zSRqPdt0LJFlU1eouQ
	Z9a9ZiltvB/nJKdH0AfZNBkpg4BqZ11MEauCpi3G0C9m9xFPDqZodBBd
X-Gm-Gg: AYBFou1bBzOvwc4LvkACE8xpSgkTw1vMm63s8Up5zbM4Bz/NBbsRZrRASEt0NTrxnbD
	/fZt7gsQrD8lwPzjp/7WiM+SM8LlKbfiXYY5DrhJc3f/wYBjjV6XMYLBK6ZUMpRG71T8GR+jgfX
	0EPEyOkB2O0nhtmbeXyQ7vnqZw/Uvh3Y3WiMh5BgjvwN5tQuTMA3mSv2CI4XdNAApn0rXDNiXeT
	Fa3V5Rs7GA+d7KnPeKbuZbwjYOhlkcS2cl53VMG8UuIC1CO27LPpvl/Un2aHcNfJL8eJgkBX3yI
	yTQqWn7MQViXsDHSBEh/bz+wxFsy6Wm6jGGLyDdvx6xK/lWFcMr/T3iMxFcf3z4e8gV1UHMuPLn
	pRMmopkxmD7f1O5PheV7qG+GuxO5j05hlvlu0u70f2Wxzbu4d4gEvJxIR/+rAk5PNJA2DVcowWP
	K18q8XKkEvB7HJ0cHZbQLm/HYL7E8bQa6zTdY2TqLe1WZirkdakIatEKIGEUP+xFwdnpsEWl780
	v5LNilW0SZ4LBnyv174GPtE88TI/wEqYHmY7Fkb25qAXkw5Yjyy7dUk/ZB58K+HgkqzhGeSrmHS
	XXJbftYl/M8t9vomuiXG8F2AZg==
X-Received: by 2002:a17:90b:3884:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39debf6ce65mr3151063a91.2.1789370994682;
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
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
Subject: [PATCH v2 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Mon, 14 Sep 2026 14:28:42 +0700
Message-ID: <20260914072842.24420-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002955_634276_27AF663C 
X-CRM114-Status: GOOD (  10.74  )
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0



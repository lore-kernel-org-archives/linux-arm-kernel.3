Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B6C88E67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=zNnHIKsL502H99PqvIVO596kFW
	tOI0tOmlciKYaYo88/MJ2YNqRxQZ6wePq4roel0ICp2H03EJX+OJsB2SY6f6YVBxCm4UMhnAbEf75
	Wua/Mh9feM/C6jRcgd03Y9keozZh7VOoUI8VAkU3pw54WGovdTjPWD6x+AFmyhG26eiatwdM0JFaj
	CVMNMqI68DWl1uf6GO2VOnkiGfAP3VtmssX1k1lhYt8mSZXNsNd8zvnIu4uE9p4wZtTLrObj+IdIS
	TB/KFNBFRsBi4TbCNQ+Ed1z/CI0N40/VQ5faMMRN6sIiuYvXRAX//eGkEZ5R3XzViSQxVu1euW46w
	uz9J9CDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618L-00000002Ykf-03HV;
	Mon, 14 Sep 2026 07:29:45 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618D-00000002Yc8-1XB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:38 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d8fb334ddcso17862465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370977; x=1789975777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=cFwhUGUMhxcFkL6IzS1u6kFnzKakF6bzAUW40zg0h5pprMaABRR/cf2WDKn9cM+BxH
         6O6FJFzgT+J6gLAlsk/i4pfVvFGHhTnb3gg9exJYEnicdIteiS7WVx7S5Rmm/O8RGtID
         GegSxDg0AYDGS3BjWR5GhPTas5I9UutNIfUSxfhTa1Iqit4kG7f9EP6m2c7JgVLZWbwj
         LKc0aWflXpKmFMczbRkorgXjYDLmbKDG1u2w9aRTOdZahmeUAtvxLJ75q5mhD2gLb0q/
         Ggv5hoivw8fVSgIcqVj1btrsgEIN7PTZ0GUcmA+VcPzFLaX9ugRbOS/6Zhpt+GrSnUnP
         S82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370977; x=1789975777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=PpYezTEOBM0LvlQQdfLcF7PtJXuQiFdsRCyaCTBxm5s5TNuFFdsTfnLBihl/YtuQE6
         9h7KoDp4H30CSQLuPuqxOh17Far9MXazQV3ymQ6CIs9+QBy5HA2L9zaIICUHQJGNpfaG
         0SBwFU1TcDl7MBkjIEow98vH+biSsuvSIloxX9/0Bwx7Ayqmq1KE17ER57T/VY/gQD9V
         IGPih70wq3zBKqOb5XaABdd8A0B0Was3/Z2Jo4nuouQWWNzEp3lfqJjNlTAoByjh0eyL
         faUQpjrIFwgkWb+lOZbGnvMJNtvMjtopBJeRqu/gGi8GtZP7vX842l+cbid9JDtnORv2
         hSng==
X-Forwarded-Encrypted: i=1; AKwUvBxZDCo48k36TzZ2AwXtyyqPdNc8Vu3aFxaptKqAe19FwzaK8mloGOhL9h/IrOG6kf/U5dTiz3GxF5eLtUxoE1tW@lists.infradead.org
X-Gm-Message-State: AFuF++lAdYoEnoU3MpwiE3HciQV79eNjLvTmwrBBWmLYzJdM7gI6ajMP
	gvabXkZ8eBzMC6w1UGc2cArQLnjj8z+qahUTdslQIlx8tipQvlpE6RnU
X-Gm-Gg: AYBFou2yjE7BLeU9i8NsuyjnBW4Pbz4Q34/ytU01HUft/uMRHBmuK+xD4Sel8TwttvB
	haIDwO8as4K/KQtXCqeIVsZPUTCHxKQvtuhlfcx+NsGBiLNlyilH+n9TALxNbBV92zkpSVFiMhz
	x9HNoJyXl3CylPglunG3htYi9tB9TmoqomQIK4FEkzQTC7gW/X+WkiuahNjo/7mmcjvjBT2R49s
	jZ1ckDca+d6JvOc9/tbBBkQSIlfoLlP7BRQMGxfv4BQm+phJy9lBFNH3gEooG4EOLzM2xNGMOHh
	+3QGbVUcLiDt/SxT52rGJPLFMWYLiesSkNx8wBzOiNinNXCpd5Um4tYqQsXuAMEDkBRzlvceXLG
	v1UNAmmpbfaKXT/eMKMi6w5b++THbP0yXeSumqfpwRI+ChnZTolSwrUHmpFHZvnLvSigK2Li5NN
	Vl6loQ5PeO7lclJPAmrLILY+2fQJsf5WXm/EDoJZ2IZVaXz9/LEIG6JjiRagOt6Tsp2NoRYTDUd
	uxEzwlxx7T64VBjF4aa9lwHEHW0OPKRn5WFZedWtMiU8rUuEkVhFRzbCWzVg3K1v9dhwCGlHEF2
	bJjFwM66q4xF6Og=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3027132a91.12.1789370976645;
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
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
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Mon, 14 Sep 2026 14:28:38 +0700
Message-ID: <20260914072842.24420-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002937_436729_E78DA265 
X-CRM114-Status: GOOD (  12.34  )
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

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0



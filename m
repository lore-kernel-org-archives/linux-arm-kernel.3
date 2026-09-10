Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E91C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=NAlAc0kEcchmxVtrFHWHy1dbB4
	JhuFcBeqgW//1vohDBTLwljT7bkgHe83tpvC9f48POJRtnlJko2di6oMozvglPlYqVYH+RfIh0NpG
	dzd2HBCEBNS8OAz8EB95i3prakKQs8P1SFl1elUGTa0ur5H62r6/c91HXg+gx1kS3biDvcHa3euoa
	Owtim4d0Reef0Dm4XTyZyFo6MLMEnbjKYCx3SlN/wW0Dj5ej5HbEAUGvoIxrfI0h9+JqVQ2QWXxKV
	5OkDpPQ7dbMLj/DbnJmYskUpBzFKXSxO9h+EwnjJSTQhClmRC/tGcOtqgZQFEzCJI6RQd6elEostn
	Dw+lIEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMb-0000000EOtO-2bxt;
	Thu, 10 Sep 2026 12:58:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMa-0000000EOs2-1Nl3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=DTq8hhhH6aY05HvnIt56Pw73gK
	w9AALgvkbXJ7lIB65mXIEPI0RYB8hhiDmgDKJH+hhfrLexuQLnG/ioNr8J0HCiEE8NExmaGyRyJ4A
	T3yWW5lkM/GTK9VGqjHpQ0Anp28rzfLWlMWciQdUHIj8MTfymRYXGNh5fGR0aJXsjn/ArEeyZ3hkk
	KJe/xsSnKHm6s/6HguUONMIV7ncfcefQT723kfoPTQb0fmQpImbuKJGUz5WOgB3P91doGdNXow/OM
	lzVIc1uFO7iXr5GdHXY2GYRH6R8pSSKRD7FyCsAX3bDSxTQGeRinx42r2wy22l7c0Fcki5BTMqQtg
	zrpywT3g==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMV-00000002V37-4AYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d560775ca2so49990385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045122; x=1789649922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=e96/x30bWCgspKWjVLzj/r6aE1K3GMsziUUOtKi+Gc9isKTJhPxQgCQTEpRuCoohSn
         3Yw3GMdotDUa3SQJNydxlNACZrWf6B7rv2TFLWNTOOioT2sD+HlHrtShVyKl2Lk1jIHu
         PgIWP9fFVqqnNZ1oBw3cSQ/05tZuWg9foL/iUx9b/UfiVlpf+3RpYD0H4LDcB3aTlsuy
         4D2akGRankpdZINwtaH5bjpDtjaFOzSyq9mI/I07FA7yrvnAYMurYtc/p8nrodbNQA9g
         F/oD/1rvmXLjSjTnnQEmrOwgVjpERDYNEoQxEdCfAT2+lWF2S2Bv5HjJ2Qj1Sy0t1GIH
         xUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045122; x=1789649922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=dqBm/6Fv3r51QJTo7sWhORTkbCETLlJ/YruR0qV0xTl3fkG7WI5i0agqWNkDAkhuql
         6BsI2996YLdHqb6H09icyYxfEe9GZ9BA11w9bdWr4aFyJNeCIvYeeKNRcEvKnbeQrJf+
         5nmb4Wu+ghLKHDZYwCiKthaivc//MNPzhkrBJZQ/zUHAAXjk0qFimKgjqyXZTFihVwEE
         PLKtl17Kux897oIja0jSDdm0rZdp9ghoCoSXlqeAgmKFXRRBkg1fmBo7cqnrT+uvOlYz
         4uWmqH678K0LENbl4mbgDvFtATysyvn4KyWpJiaLEn4wZPTkA71bycWyokkNFG+ba6WS
         1pXw==
X-Forwarded-Encrypted: i=1; AKwUvBwkjT7QhAAsQxz8mwAQr1XhOB7iZ/FcrmeRRNgjdIq3iCVMVyqOpt1oLQp4oeS8azdKymXdRvp9qIq+Vmc7geB6@lists.infradead.org
X-Gm-Message-State: AFuF++mCVcv5F1t8UQgUnhLO44kuiaMOayT/FLhQYgiJwTBh/l1OXcLH
	RudO0ZN/rrcwX7jUoFBVkZw+zJtSVljrwZHxYsBNwxeQKJsJIFW0dQFf
X-Gm-Gg: AYBFou1F09FKAbeFjWtiGm+rkaYqM56pbON/s+de+hPWKKmLgHhYyr7jGTnt99GMLFw
	iQ8wRVMP/AkI//pala0RYHbYmc38T4a1vfkfL0HGRRXhel8+NXmoEcyGHxTSgE9q+FMVOSLZeSH
	1MVfhn6LuPQOjhhUj94mdebsVmlz0b2BWUpMyIGg2S/XWWhRw01b3rQpj27jO2+b13mhmSt99yl
	wc0LD5fq9YK9qzJ7pdqMAU68uhWhm0cCp9LmN9mACnX2k3HTguZEFtiLqo5WC3bUltp/4eN7uLG
	S/2o4Mw+PHjI9BhOogKL0V86f5aa/tWw7HmHAFWw7Wb2Ywk3oDvQNNs/bXt3Jt+8yUCWdV44XPB
	59KCd7JPfbulP72tlAnYM0rQGsjXqMw2TmGlfgycYgOkRwAqU6d7K6Kb2WNCEGcDUdf/ZUvx2s5
	Bv01+1xWB8/C+jaPqGCOWftpN/1V8vO/LPWyJ4lH2RhoBr6OqHgGmcINBQbNhhzvaWKYCUrz1UJ
	islwtoIHOS9nsvCneMyrcyhNbRWc1vd5iXYBMy9VruM+/AsxStL6LDJiy3BcxiL7qHJcKofbcHZ
	K7PMbLtC17lyBit9jJdT1MGYGQ==
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr61915384a91.8.1789045121712;
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
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
Subject: [PATCH 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Thu, 10 Sep 2026 19:57:38 +0700
Message-ID: <20260910125742.150902-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135844_126051_6514A4E1 
X-CRM114-Status: GOOD (  12.25  )
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



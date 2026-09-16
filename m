Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF18C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=; b=CXJuA96mF4rdhyuOGFz44l2/Fk
	macJrbDfp5r3yLX4Gm8lLKTexU0XF4AVCJjLnHXi6cdKrgsw2mkBpsyz8S/5guAQ0kSSR1ph7X2gP
	M/O8YMQ1k11DPtWKst0a2jVDnKBVd87abd77VVRISmY7rjNc5edRwMlgO2wYe7GDpZL4v5suGHa1t
	fEhuVB36XY33X+N+NnobFL9Xr8/O+ZNOgUYZGpEmtaF9H6De1m5D8SuBYFMMPb6dEVo7juOBt0Wsb
	RsEtmz5OQ/3bD6CueyQGM3Cpx4B2opzbS/5UILvnWBpLJJwB7QCB+5auAYhihfQeKeDzTngWKMJIO
	MpveLJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hnm-00000008MSc-1mRM;
	Wed, 16 Sep 2026 05:03:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hng-00000008MRb-0qUw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=; b=ag3L33WWm4LPrMldTm5DhM88gq
	hisGAWTqjFgXO/76DrfudOrAy/5TrzGQTqqUbC7t/PjrUL0MeaNKHorqYE7exYLESsdnZDlJsy/+L
	4EZMsMeVVJ1OO178Ab5ERkvqHth4Ot0DGO4xe35XnG2YT7sjBCT8FH/OX6iW35N+8AThBczvbX6Xh
	8AKC615lbdlCak5AE/tF8w5soZ3KaK/yTai3en2a5fa5t/zYCcJEy3QxO0CRF8pIfk1gWDahq+YCR
	wVzUhRc4dDs3wo/uACArXrW4TS9f076zFnPOy8MpnqOnndOz2E6kfdZ1AKWhmpnoelyME0khKTzFS
	iyi3PvvA==;
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hmB-00000007UNZ-2Knp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:03:14 +0000
Received: by mail-pz2-x28.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so495515a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534901; x=1790139701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=dhHct5a05ZJlXMbotd3fzvOb82n7FarnZSQ0Q/3DKwMWs8MhOGE+HpILbKAPeEnkVG
         tGg9zPYf8T+F2mmY4hftLI0P/1kwU2PFC63NbMZS0KrLJ7YjptvoIqv1LPz38vzYKX2X
         v+mE2kgFe53ktVLj1qMpcADrQ67bCTGnSXXkWAaSwhKIfMDseva+h1/A0R7oNuUPXvL0
         AL5/zRxG5hPzDoD0u3dHIHLN0jZnCa0YA5lmbTLPqGUhrpOT2WJ5MXTJixSyOfq3zUw+
         cOE5sJiGpT4Eu0gse7+zjSQ+vMoOCHkM0UQDcvHaZD6kheumKHUVStmthHe+ZnKqTeNR
         o4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534901; x=1790139701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=uTzud/W1dQHasH878REM5aKfmUeaBMDgaHgfyzUQyMAVdj0prb2taluJ3WmPY5rCBD
         ZHzy/qFmwKEQEiDJSF2C1UrkGU1ry3SjRdrs9LHK2zDapNAZQarTicLtwEHrH7PUT25P
         4iow+Ozw9XHYR+7SCzeMm7z/pipMmbKW3aazn7WMcWi80swxD91lurIw97aay1jaPcog
         ZSg88gsJDpIThXhPsrrQzCThJoAhmNQJzCcubieDFteQyCkIcsqTZaueKeaUunO1RukH
         UHHMzbaNTIL28JIvxsH1wKMpi2OTrTnIXkS3WUMX+qVGtTqtbNPntCtJC7hiX18ND4an
         VQGw==
X-Forwarded-Encrypted: i=1; AKwUvBwiV9dMBY1kpPG0z9V5MzexhyXBTzeRVSPYjuRepm6w62olbKoFp0vQUqu2u0fZV7/G888MEw1jxDnf7uT2a6Kt@lists.infradead.org
X-Gm-Message-State: AFuF++nGNRH1Ts1MgIoKeI6UsEJiV9SsFE3QXMxERTwqWpA8DV2u4yzg
	aD+4PkwoXYyB/hUzMqpiqZeMj12HwBVmn4PJSXFEeT6HA1fkNQDwqtl5
X-Gm-Gg: AYBFou2qW3D5EtT1kaoiUKpG1J6y5WxQBESoWQ1AazLU4CXuoW9ovW6weu1ZS3/myMk
	HDT3ly1/AfDkXcGPnz/gqZDjPBMky1v9T0azf26GRJivYvP/LIEoKINW5H/dXVacxWh/IArASFc
	jglP75/4OiVr1Md1mPlF1ouKTxTNS0TnlmPg3Mtd7xS5402KLsp9NJ6UNUUeOodnzTE0gD+qOnH
	Vq/KzJcXll/mZ6UCU3Zj7u7Lwo4PCZNtKBuZsjl6VfjsgmWFVDuQ1phmuEjlHzG8lcMvue2SpoB
	wFN6r1v6qcUVjvAIpa5fq2Yrv+AvnoQEjfvaUEJ6Aew2y8Ndv0OZd4igmIB9WsSK32bY2yxiu9T
	l/JMs4g41hrklEQ2VQvH9w7OrPgnUaST1HbJAROrxxN241/WLa5rdhPUdY5RwGRqKhNVauBGHiT
	Om+lL97ZxYBLUtRe/Th8LgM0AwPEtbS1OA8Yd+uDw8to+NJiheMyj6fMVbVY/xpcyMcKABwd/bf
	eLlrauLk2mgrHsBrEuYlTPa3wZMi7+bXjvi+RLkVydPh1lzOP0wjSwQRUMEU7GMgpPAJOy77R3/
	glq23sOTQpLaSKk=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr2929083637.2.1789534900789;
        Tue, 15 Sep 2026 22:01:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:39 -0700 (PDT)
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
Subject: [PATCH v3 12/12] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Wed, 16 Sep 2026 12:00:19 +0700
Message-ID: <20260916050020.14575-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060154_864370_235C329E 
X-CRM114-Status: GOOD (  10.87  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 9aebd0320614..e113c52fe06a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -383,6 +383,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0



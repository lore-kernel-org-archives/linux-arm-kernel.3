Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D65C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=; b=hOhrCPHCM5utyy25/TgQRpK1je
	0E4Wirlb0DYB6K3QTGMaOnKc3j6A1X8U4ECn8GhzEJ2Wzvgy0lo9dCoUyjjAqCzhpgiY8E37Yj2Dk
	eD0X3zC819lio1UDRe5hEUqu8sM4zpuy8ToKLWCJyniveCU9+uf514vS9scCrY4zVJeYmyHz+MYvH
	yzJn83WWO9Nr0QIrDKwUwvofgwlBDHx/Zb8B4rie6pZtVEmVVYxpgJ8BEEZo+MQJtR235NCz3SKlW
	WLX5KaKxteOtqkPN3VgdzObLT4FGOF5bU38b53kLui35rHlCWFUi3YNckITVVZjZpxwcuUvKXndd+
	7QmmtG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlp-00000008LSV-2EYl;
	Wed, 16 Sep 2026 05:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlk-00000008LLN-1CGk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=; b=ks991j01SY12zgohe3iTPZ1uiK
	56ceSNXGsBCgURhS7vg45+/zyZiO08QPqJalbKR8/tJgYNTWb09xlOiitGiYNDQjU4wGr7s1indiZ
	/7jOvQK1Ebh0RIMQRGCeEsKY3L4dTffO2VMvrgPaHnQTQqaDcHgQXRAUTQTdsl8PszPUFvLGTvdi4
	+vUpEA029DskJc7iRf9/nh5nZ6vdruvPB5oHFn6Q1j8OeWSaFUk7/yQTOswcxY2OtzMm0fM1z04kB
	QU0ZzBUkJlwiSZkiWQuT+x245G9mFZXVyDVXd/vURwQOl79x9j38P+aZC6uImJMH5Bm0ZZT+l8npb
	X+MnbEoA==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlg-00000007UKw-3Cee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:15 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so227933a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534871; x=1790139671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=NI3ou/ap4qRQH+RDYKaoq1DjGFaHYXRn9oeSu4x6U/9l8Y3iOBE5ErOR5wPFuUaqfs
         KP3E6m/FhqyUFMsOf16D076CHHS24wnvTq1Oq46ZT2kPhvPyOgx2cWH8hj5B97VbA3b7
         fkD1zvK4I4xLQ3ZpfAxj8fReCIaaBAeGqxviflEobCjIiUeYQeyFjgbt/tsy76L3dAWr
         R3gYzUKFtgPPCLXm3co9zH/xa1AGuVqCcVcGULO8nn9QkYDQrWn7erTtrGBtoPxJSaT/
         7jR45DIgFyHdUGUX/fEbR55/w+wdi18c3gqbxQ1Ji1Tw/AyigLTmBE0kJEnpQgtyRar9
         1lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534871; x=1790139671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=IFyj8vNyKlZzrVxrGONf+u4pNkFhIVRR5wmqcdpPeBjS/nQxZjv9BNaGS9/xdoZKih
         NAdKASCYn2w8snSqALaXO82D+Voc1t3/E1dT+HPDOTNGUxmbuyAhI3wwvGcW0jpzcUR1
         MDeLhITGcr7eXftgwNIifl8jg8pqdtdC+zKpE/2lTanFI2Yn9lSq7i1cohSByIk/oe42
         U2bSXr1NzKd2viwgQfLWye4HU1oDek9RV8A89x0HqZW364xDVS/ANDA2e6KUWBDl7TUZ
         1VR+V91GzKq8eqezppGRWqJmJmCrxokbqdf+kOcrzvZmYTUscDCrDeCDhUlhkOWeGouX
         lD4g==
X-Forwarded-Encrypted: i=1; AKwUvBzPJScjQyF/AebmoujNIY6FdrrLOF0D4Bt8Y93Bp8y7KrD5lm8oPd0Elj4RPAcghbkRqaH2Z35kYUi7gFlNJWS0@lists.infradead.org
X-Gm-Message-State: AFuF++kgnCD1GrAnnUyFZ+cQ9Hw4XXOt7aJTubc41x+XGMILloIDt4gI
	Y3ZlgxrLpgUTTrKxOHZb1hofT9Ohy81d2DPRgAtNRheRv2pCeTD0qJPl
X-Gm-Gg: AYBFou2ZeCFTdegpueNa7rOUxO+gWcteOP8B4SrqPwS95ehhVxAn6+eUtTfK5os7wkC
	yFAQ157u0ca6Wq8fdsWm6gBTgWM6Uh6QS06PaarJU8/WN4i0mvW34oFNR5XEvFGNi82hy/6+v0l
	UNDqZu9Lqyils6gFpfVm+wggXjKRTSJB8nW2NzCBuf0Y8BfLyoBI1PIT7F3xB4yzPolUos/sZi7
	pcJ5KrewFdnB7Wtxao2kXfj07qqecMCLlSK7N/PkR/mJlMa3foFUFqtQT34MyPb4LrLveQ42kS7
	T4J+DMKtrvMWABqSFwJMQT81oo27Vnpg5YUFdh9ubhOb9+1wHpzqK2z1uIh4o7scMm8e4wgYjGf
	z9Huka1ifAsLd5poucz6x6YGSmDwA+MXSJZUWW9SKglQBs2+Ppwfpk4jCbv0gLQTYMryoPjqlMV
	i2pQMeOI4/me/4fZZMfMYW9pI01LICadS6sfjCtn2iD+V78VFaoT2XXaYZJI/VwMrqaYjsDw6Ms
	azU4qgoHvACc+zPX2kodQY5ZnHo18hd7gwoBrSb+r95TqPanXx6b/tbqRgkE4P/CAI2fuSK4e1g
	DIViScsw9bqBQvI=
X-Received: by 2002:a05:6a20:4307:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3dd5f7b07ebmr2753489637.27.1789534870897;
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
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
Subject: [PATCH v3 06/12] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Wed, 16 Sep 2026 12:00:13 +0700
Message-ID: <20260916050020.14575-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060113_561183_FBC49ED7 
X-CRM114-Status: GOOD (  13.35  )
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..39cc2804ad4c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2332,20 +2332,40 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_set_cache_only;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_clear_26m_req;
 
 	return 0;
+
+err_clear_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0



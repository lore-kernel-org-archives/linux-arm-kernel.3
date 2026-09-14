Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33526C88E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=; b=osWwZmKW3/pmv3sX1WJ+LAkU7y
	LKxc9kkhmAQWOsMWdCOyDm3FPWxW476RDOa1aDLXT7aVnVspGErBrotNghlxXXRt2nu64skS9zpv/
	9DzLt7WYneeNTFsnDur9c7s5iDgYERz/T/sbxwTLHpjXS/qBo11kpFg3t6fINAC4k4iM+5m/Xm2ZP
	kSXLFKVUJVwswNClaX439BDcKzgdGKvYxQAjM2U/Q52D4eeK3Cl2InoH2TyIsG9iuan1Rn4n+MOfk
	cuaC6yKLrukybkG+3N8oVWVPTorrdqxKG16I4b92rNAFCaHJEZaT6R+OijItCu/fzIlEBiwt1uYaz
	cIRUH35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618K-00000002YkJ-2WRS;
	Mon, 14 Sep 2026 07:29:44 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6189-00000002YXD-0HAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:34 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1174349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370972; x=1789975772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=X77zCsbLwhoamD5JEVFMp6W6HlNZ6ndf5K7tL5wa1d7MG8yNhm4dQVO822gICle2Rx
         WPjAkhf+qKrzMnetlx49YCwokWXJMGdT+ENJB6gWggko8Es07t0aBxGk14gHiRz5uw+Z
         VtnFlbeq+WjftO6By/BdzfKfpl00HDE3vrJpq/TLJT5nD09azGC/uylszIM63qN/HHC2
         aWaOhCoKg6UIRMtZVWV0+IyzY/LDHZPKFyUrsvkPiZswKexhAjk8bMfc82NKMBmVKFAo
         Lic1wVfxleZWjmZz+4Tr5sLEn4z1gQUplEUZhsafSUbVOshs0yRDOdUFkORNm0GPItpB
         L+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370972; x=1789975772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=k5BKhlKwOgpiA0qDgDPySWyGZJGTtCOW7TxfTRIrUBrPVpEvISrgRWxDBL/gDPb9Em
         YNanNWjKWvvOsM9pY94JZV+xWS8Ji7wNHC3neFsm2nOL4Mdhaj9b6A/uqqTQglzqy5rE
         wJAFpX1hsAzlnII4A3yiKmgBmApx6yAztlYLLAx8QyylO/5wfJlCo0cSOHSbCNMG2sMi
         DSuaiHT0t7UWVsvR8QssoT5fbms+7C/8i1KNvA4E1JROX6U/ge7g87pWYNiTZU/yZzrY
         MEnlhV8FjL2mW0xgN/WiFleINAffuaP9/dyjwEe0i6UIDmcYVaDmxmskA1+8OtwG2kv/
         Oq+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNPclZgQp9Z4KQBFwBu8cG+VOZ3N4DNX6ElwMSyiAhps2TEuEiUof9DUaUoY+WLGukGnq1KyLVPRQVj7/zkKLW@lists.infradead.org
X-Gm-Message-State: AFuF++k5y32srYY0eMFhv6rIDfBuxC5FvA1KABZ2qtrzOjE0bWLCVOsw
	bLqyWv2R2iSh9/6i2QGoZdqKo2TcIRZO5ipWT+KYRADRK/Z+AmSUA8Ey
X-Gm-Gg: AYBFou3u4MMXMFTQZy+oc4uaIrUgYVThNAB96CM+WfeXjIoaCJ9v/v/3O64hsuJ/ulC
	oEEeVDHIbOFCP8DyA9mv9y1ATn/Km1MO3hR75asUy3sqgona3PYp2jdQjkhHAMK2WRILVFb2UKP
	oj8EdonGUT53faf7sLEJgbuLHCYOzHZIQ8ohxK2GXKwAYvJpnc1mL8NTmZSbvX5Vi7mlWkD3QCm
	EVc4AozwmO1V1hsgEg9a2oj6fTDlyS7kHEIWSkjVMElXKKWEeJpt4JH0EUDT8g1h/zRU7BxS4QT
	GQ9TOSiXEtmPSndKgA/aepxvEgJimjMK1d624HqBWOjAIInUcmQmUIYajOeSPLSVCIurT65an9X
	zfzglUoF4gMPF4nEBRY04XoK2GnpoFyKN8cisTYdkSBRUqi5jMZKmn4Li+zDtm5IXVolCrqyQEy
	XKzWzQkKlvNnyyDzltcGstSkLz9LKwcAnY4ccfvXpkgjKy4U+p2BA/PTt9IashDIhF54Vo60wA8
	cZlXSkiwuHN596UevKjvSGwanpqnLC6Y9aof6Hb72ngfZhqb2Xd/isGHMNZBwaXsRxYGzLSZyO+
	prNNR40A42t1/YQITeKKKOQcUg==
X-Received: by 2002:a17:90a:1189:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39df06469efmr944725a91.15.1789370972413;
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
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
Subject: [PATCH v2 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Mon, 14 Sep 2026 14:28:37 +0700
Message-ID: <20260914072842.24420-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002933_159184_1253BFAE 
X-CRM114-Status: GOOD (  13.46  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 67fa40afdefa..981e660981e3 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2488,13 +2488,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2528,13 +2527,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2603,10 +2602,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0



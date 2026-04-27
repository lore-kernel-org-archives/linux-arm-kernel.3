Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5B1FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=; b=SH/sH3Z5Jx5EfIQKsGqZbggI8i
	SUnLaMbH0PUlnT5mWUW1ZKXfnWX9Df1db94BJzveNtv8V7PCeTtq/EMgdJ0L/0HB4rwWawKhOL3h/
	VdwyvlkmKVGgm/JiCvl4bniwVUelCwYwF5V3E+a4Alwgx6H93+cWlCSnrx6yin6SasIzVuQZhPin+
	aJA0zpao09hd+50cbxDhteGJMmOWF7O92pBn8wKesfu7PuyLaAeVE4+wPDbBe4Rr5HUucWTGoTtTQ
	aoVIK0m68GGDO5lw6q5L8jKO/qh0ojjZqElyOkGgAeY1864CCE/Zkn2eSpSeX53FRVs1OH/QyjUCs
	p8bdKX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCuA-0000000G7AV-341T;
	Mon, 27 Apr 2026 03:45:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtw-0000000G71p-0WHD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so82454155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261491; x=1777866291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=nzDnDgRvn5ioFMdDf0ZP8jsI07dmlrM4kzIKO9/jDAqc3OezfJ3nl8Eut3DG3hSf2/
         Dhep9oTrdXXs9e3cC27INOPnh4Xg9wxNIDQycqXiwi5z4mrGz33UcSmYnHjK27qVoC7m
         uu8Be9ojwlFxkkg5J1Yl//im2+63lrwI4O3/pQAJ3arLwRg7FC0IMypFBRRzlVN9gk1E
         kEvVz+zaSE0dh8WucsneSMk8WwUm/DyzwPPjC/iIvsk50NLnLbX3mwb8G7w7AHn+C+oY
         eycYubTNQH805Y9nDvEEsaDfkfEUInwTrX0RXO9v3IDivjD4CakXxk21MuEhynlpUp4i
         Kytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261491; x=1777866291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=PCCeiGu75S7sxCR3gkcUhuqGXTYbC8xth2OupYXo6srI6Euo4kZHnizCoEFJKuIyq4
         SW/KZWkAfFSjLdZ5MKOCV/z/fZr3kL5UBWTGhWhxpx/1k8JpknWPdZ+pYZsELUy37ZFV
         8U5v/QZGo+E5L3S4SAWv/lLU8oi49VlCKhyf9mnkAYkbHHa4SE3JhDGA7xJvGGuNKEGB
         bwRkhj/kMuMrpALeDl1BUCElk4nqqKtpoVFNHKQjjohdi0GOFOTdyVCsLOpZoyJWIebA
         Y/9tc3WIMHa9Tu9jO1Yr9Tf6yOxN4Xl8BZG2DTv6CQjoYtpwjNcWxEsskNcWOIW5cKxf
         TuyA==
X-Forwarded-Encrypted: i=1; AFNElJ+VQI8Dnrz1/wlRx5f/AJ8qSzAuxDh5mDW5G7J2oHY4wkTZRrPqILu96KSTVyE7sqYYf38/9A9ZE89E+1z6iRwF@lists.infradead.org
X-Gm-Message-State: AOJu0YxCEhT1MipadZaggq0N3C171il2W93xhz5FuVe6wcaGe6jbiUsL
	hgvwBxhfoMkUvnxq+SbUYwAPRB5LIejyqCGZp/kAOEqBTUK8ooVRWSYL
X-Gm-Gg: AeBDietCROi/e974AMcsZWu86X5nOZIekJl7lGrSueflvwGA+7Ji8IdCeAy3S/Rh9mR
	L1S4MSZieczD8A2xQ1S6DVdmygOj2VVYktoDmMhTQL/GUUzNM0bsss80+90r/l9ozvccxwrv1KJ
	d68V+w4GKxl2PulIgB2I+3tJ9ukhNHkjuVfLpoCAadZv1UrUeM4FIRt2rqLPkn+3NhOnUuSH6nl
	ueziwiM2ag7/XN4eitdGLekVtykgz5HHHNVs3ahCtVNih357yln6h0dmtMKYusa5ILAAxX4CqR9
	9vhOdQ5fL1o6TkUYvfY4o0te0GX0J1pvDQKgz/YRqIxLe9AOJuGUAjRb1KELt8kFaDzt0ct/098
	7SfUjH06qZnp+yG2u5PCgpdLuiWbVO4B3mofzFejGVpVJYC1Ynv3j/dt+d7RxIwbIP5dYYbCv9a
	eVBYXF4g75TTdoixZLDVbbaonFGzQnlz2ib6FHhcGnntda0w5dQdz5Wp5O1FT06/kpnhOeCqESp
	zocNzkYgyqB5kZ5QfwIkusuZQ==
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr428464165ad.27.1777261491168;
        Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Date: Sun, 26 Apr 2026 20:44:27 -0700
Message-ID: <20260427034427.881389-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204452_165243_C86CC1E6 
X-CRM114-Status: GOOD (  13.90  )
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

mt76_get_of_data_from_mtd has been replaced by
mt76_get_of_data_from_nvmem in all usages.

Remove it to prevent people from using the deprecated
mediatek,mtd-eeprom binding.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 3 files changed, 92 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index afdb73661866..092804323d81 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 	return 0;
 }
 
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
-{
-#ifdef CONFIG_MTD
-	struct device_node *np = dev->dev->of_node;
-	struct mtd_info *mtd;
-	const __be32 *list;
-	const char *part;
-	phandle phandle;
-	size_t retlen;
-	int size;
-	int ret;
-
-	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
-	if (!list)
-		return -ENOENT;
-
-	phandle = be32_to_cpup(list++);
-	if (!phandle)
-		return -ENOENT;
-
-	np = of_find_node_by_phandle(phandle);
-	if (!np)
-		return -EINVAL;
-
-	part = of_get_property(np, "label", NULL);
-	if (!part)
-		part = np->name;
-
-	mtd = get_mtd_device_nm(part);
-	if (IS_ERR(mtd)) {
-		ret =  PTR_ERR(mtd);
-		goto out_put_node;
-	}
-
-	if (size <= sizeof(*list)) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	offset += be32_to_cpup(list);
-	ret = mtd_read(mtd, offset, len, &retlen, eep);
-	put_mtd_device(mtd);
-	if (mtd_is_bitflip(ret))
-		ret = 0;
-	if (ret) {
-		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
-			part, ret);
-		goto out_put_node;
-	}
-
-	if (retlen < len) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
-		u8 *data = (u8 *)eep;
-		int i;
-
-		/* convert eeprom data in Little Endian */
-		for (i = 0; i < round_down(len, 2); i += 2)
-			put_unaligned_le16(get_unaligned_be16(&data[i]),
-					   &data[i]);
-	}
-
-#ifdef CONFIG_NL80211_TESTMODE
-	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
-	if (!dev->test_mtd.name) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
-	dev->test_mtd.offset = offset;
-#endif
-
-out_put_node:
-	of_node_put(np);
-	return ret;
-#else
-	return -ENOENT;
-#endif
-}
-EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
-
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len)
 {
@@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_data_from_mtd(dev, eep, 0, len);
-	if (!ret)
-		return 0;
-
 	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..f447ecac664d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 int mt76_eeprom_override(struct mt76_phy *phy);
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..c24e1276700b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
-	if (!ret)
-		return ret;
-
 	ret = mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", size);
 	if (!ret)
 		return ret;
-- 
2.54.0



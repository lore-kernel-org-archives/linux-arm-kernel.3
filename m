Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF4C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=; b=TRgfUzffLH4gBBAWVR8pGLuAbr
	C7zcc7UUUtnFgLKVtxFuq4tUX8qzqAxJ74OnYABF4zs0E+XNZRVVA6s6bHX+9jZ8+fh+56+fXbGpq
	XRqgOOCqhullnoi6zgjl5TO540n/82qf2tly5pljwylpv8iR7IUokcopxQw6cCrTo/FSyH/eV8Qnu
	zQvY7QzZkx2RjO7l1Dht7+77KnxvcRwA2FMTU5eZGmd5h373rdXDi+3yCZi0IUtIMGMgVVZ+X6l2p
	Rlf2i1msuyqPkttVsQnJpyo7cTmTUgD5TInJnTQORh+i5ZI4uX/2nAT5bXmswEp0qylXB4OCSvRAi
	hqgyerZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR04-0000000B1VW-0m6E;
	Wed, 22 Jul 2026 07:04:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR01-0000000B1Ub-1W2S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:04:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so9830861a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784703852; x=1785308652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=;
        b=CstAp+3gqi8Bo4n/XHTOczUreVYtE9xEvaGUhw/oK033C9p97Ty2r5qPLYsmvyFerH
         5muaQ7l7BcsWjt6PNtyjXBGzzWhtfy35DUe8z0b4+DM0GY/jgDUn0PSp+z7d0a/RqzJk
         8uanW0EVHUR2CLoRAsloiAzU5J6mzWmw6P8XPtK3nOuhd1iUgJKsQBj61u2TtkHMqglR
         1dT/ieziWYEI6Nwr/kFVGUgHjLEPHK/uS5iGHsrT3YVXiGes+AITLPJ/NHEQwZIsQ2w2
         t8luuuMYNMmJuwX2FbeI2XJA8pMFw5sM9EcRDQOWTuhGYFln+Je+O7TzHmVLOarTdwBN
         S9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703852; x=1785308652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=;
        b=d5ACYjiIA7fvCmG4MIzJchu0SqrfW9s8Tv8JBOuAcsxtcoE4GN/aA0+tlGmIO0SfGm
         oZY9Xs6j1kSEqO5kBjXSdBP2eetYio2DXgAeht38Lbz7cWGfAYM1+Wv9Lfscwz4wjRyX
         citUXW5QgdwukBl3eVpFeZCUC3fi0vpCEbX1nl3FnqBsJ9KtK/Bm8gm8lnVa46QvcsP+
         chn8oXfVFCLKNUwSXH1JRvK/IU9fWr/+CRy5armZqD8i6SQNYnHyURNsa0KBKqP1koRb
         tNQ7aJ5a3LuGfbLpTnk4O1jVLabkfo2USShbtBVE/QVekwmOMNVSd+mavZQlRh+nWTky
         eLng==
X-Forwarded-Encrypted: i=1; AHgh+RrFQpYLzdcyup5f59TTjTTUo8mFvMMg8iLiKt1ImWNuT9VB1eV34hJBdP1hMWkL16jl4t9hgcKcY2q+jmkrjXkC@lists.infradead.org
X-Gm-Message-State: AOJu0YymzZwhkbpCZRwM7mDIhHegAaGHM9Z7tNS2G5v+Qx5poznuOV7Z
	QXZIkUBvH0qbU0nBVFCobs8VSb4gPo4VwOEjKGO+TPHZTXG1H+6Z44hB
X-Gm-Gg: AR+sD13auJ96qonrB53uFln0foiWlCdWgCD2lMvVyG7ALZCQ8wIxl8kDy4OLKJu7g28
	3Pso53dXCXygNAA9+7j0ctjr3/iFl9Ic8Z1JQWffoLOYXPUK2hKryc9tAUJNIQ7TRDzWZc8ix7b
	MPFvtVMdTB75xLVtBm5vCMmBxpwZTvm6OvussCux0bBDcHB4Da4GgkZM9GVOnRcFSVrAiXKu+R0
	vBwgnJyuzBEP2rBIYhg+Tzpmx7nWodx+p1O6B7VBLe4r965gfobTbaZgC1k9JMziGFtjUBrpASs
	/q3diN7Dy0cn3dG5x9TYLwdcRtsrAjm9jndohRJAStXg06p0H9SCoI4NRMBzw6H/BB+u10ghA8p
	o5YLoikow0buYCFn/60I+Zav7yQ5AYPFK9SrhEk6PSVXkX3giUFJovkuOq+mLinL4pDrw8j9+Ma
	riJ4KdAz7M00419Mt4AJEI4HoRWd5MQDLV3e9tY7pAcho1FrAxFeFqDjNvylfa5qK/pvzuczwmP
	GswOOxo9JTT09qquIBxVuY=
X-Received: by 2002:a17:90b:2e90:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38e4b43c408mr21798100a91.8.1784703851941;
        Wed, 22 Jul 2026 00:04:11 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm3203259c88.10.2026.07.22.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 00:04:11 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: validate CLC firmware records
Date: Wed, 22 Jul 2026 12:49:02 +0545
Message-ID: <20260722070402.45328-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_000413_405139_80877D58 
X-CRM114-Status: GOOD (  16.25  )
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

The CLC region is supplied by firmware, but the loader trusts the region
count and each record length. A malformed image can make the region table
pointer precede the firmware buffer, make the record loop fail to advance,
or index phy->clc past its end. Validate the table and record bounds
before dereferencing or copying.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 32 ++++++++++++++-----
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544ff20..76e30bf4ce0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -803,8 +803,9 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct mt792x_phy *phy = &dev->phy;
 	const struct firmware *fw;
+	size_t clc_len, fw_data_len, len, offset = 0;
 	u8 *clc_base = NULL, hw_encap = 0;
-	int ret, i, len, offset = 0;
+	int ret, i;
 
 	dev->phy.clc_chan_conf = 0xff;
 	dev->regd_user = false;
@@ -829,13 +830,21 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
+	if (hdr->n_region > (fw->size - sizeof(*hdr)) / sizeof(*region)) {
+		dev_err(mdev->dev, "Invalid firmware region table\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	fw_data_len = fw->size - sizeof(*hdr) -
+		      hdr->n_region * sizeof(*region);
+
 	for (i = 0; i < hdr->n_region; i++) {
 		region = (const void *)((const u8 *)hdr -
 					(hdr->n_region - i) * sizeof(*region));
 		len = le32_to_cpu(region->len);
 
 		/* check if we have valid buffer size */
-		if (offset + len > fw->size) {
+		if (len > fw_data_len - offset) {
 			dev_err(mdev->dev, "Invalid firmware region\n");
 			ret = -EINVAL;
 			goto out;
@@ -852,11 +861,19 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	if (!clc_base)
 		goto out;
 
-	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
-		clc = (const struct mt7925_clc *)(clc_base + offset);
+	for (offset = 0; offset < len; offset += clc_len) {
+		if (len - offset < sizeof(*clc)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-		if (clc->idx >= ARRAY_SIZE(phy->clc))
-			break;
+		clc = (const struct mt7925_clc *)(clc_base + offset);
+		clc_len = le32_to_cpu(clc->len);
+		if (clc_len < sizeof(*clc) || clc_len > len - offset ||
+		    clc->idx >= ARRAY_SIZE(phy->clc)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
@@ -869,8 +886,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 			continue;
 
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
-						  le32_to_cpu(clc->len),
-						  GFP_KERNEL);
+						  clc_len, GFP_KERNEL);
 
 		if (!phy->clc[clc->idx]) {
 			ret = -ENOMEM;
-- 
2.51.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C40CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=; b=zLtd016GSdb/LB8wTbVuyQeivA
	ksRu0upiqNao6hZsRSrxS9vFgsleUxNB1IlFpIguGd7jjn5lykKSRdhx97q6YyIkaelDUsQKqCK07
	0tcC8kYDeqsZg+zfhjs8JbDh4f4XSMB28I/KUN+fOYE4g5STYRvmoNK1HGQtk0DO1ryTpZJ2kW5/v
	95xOLuaWVWAcLAzP04qrx2tSxMqDRWDvb6voGI+H+idbWuqsnjJnDGY12SORXgYzGCImzIg7WgEXR
	llpBBlgCjmsfPBwPCtMenH8DXSCgZL7aE9iJ3aep+4Qtbf6Dhjf9cOM5NKjhIlZARzMu0XJ3R4nVn
	sh+S8E6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYth-00000001taf-1e1Z;
	Fri, 16 Oct 2026 03:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtU-00000001t6G-085F
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=; b=LQBtX++dLq9tMQcMReW+BHNgKq
	aYuFQr010uI/stYtUzmkylmjlVL79ln2OcUfvEiZy3xedCW6asjgUDRu8OAfRuIerM1SOv8PHDdXq
	/6q/Uf3Hz6xKXv80s/wnHobkI1AtM1zwDM3L/E/oUBY6wO6pWg7w92z30lW1Wo105N2W3XdIkh2qZ
	zp2Dl28pAg1VcxbBrC8nhl45uPR4xKnRvUiN1JevYB7xc0Voa4i5cOvjmcdlQiO2FEfzwWd6+/IMZ
	Wgr4czozJkwRCnY6PcKVUTHXSoUbRoDwX53mrMclHKxcvxwhRYeovZxwqJGaTMwAGtaxO8RXQcsf3
	aGtCjI3w==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtH-0000000149z-3fMQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:57 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7f432ac553fso6251159a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122354; x=1792727154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=;
        b=KcebGqxRuKx6YPqOM6gCCtb1Hz4AR3l1g4q0Qx9g+pISMPJzQ24sUEr/x2mMM42otW
         RyeIZubkehAuJdJDO4vGzpNFc+aMNi5V8KISvlKeDVmVcC8Uqf4HI1NCX6ICNpPvA/Pe
         pIUVI45AXwg0c2PFWVt6weCY01+5MUNBjV4MdDGLl6JJV4x+EuvRzgXqitz9DeHU6ntg
         H9q3U2C1Yyr/4nSpV21dZz48aN6afArVxwM8N+nQv7BoUgHD/MofWZ2w9dRSO7PlAkgu
         JFJBWPBf7Ar+3eAVWNvhhLCcmuYfZewWaccM7RRicYAkRasdXUDbvg0KMlMNkbJ5nGMR
         RqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122354; x=1792727154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=;
        b=zC00fGCFJQe3namM8PubiWpiWGByPbhF5pfSCDGCO/H2MgTu1BCuCjDltnlrL0dVF5
         0zo6ZYrc64uJdfDOKLFclL8ZtN4Ll/Fp8hZJp3zwFZc86KAvlVwxuzDR75ThkLRwAsUb
         WLBZfxAdYy8Rq+AXWWJNbGB4pc5bqXcsfKrV1p4qst0P6LgjEAETkEzlOI8g3qtZh68P
         gf2+m+D5B6ZgbKpJAfXXjlRlSP5wSpcJfrOKpifrIPArgx59z3pqjOoQUp217FZJKlWp
         HwMPZFoZgg7lDcxV5FpaZcXTrwePkUVrdQ/6i6kPH5dlDvsjs7kcLJbSlU9tYjWkqa3j
         dVFg==
X-Forwarded-Encrypted: i=1; AKwUvBzK6sqER7d6OBVZTE6IByGWlbS5+c6aF3MqFkiltrcxpRTHDqsYBftO1u4/rNphXkMZaefaL6v2H97JHsH7OAK8@lists.infradead.org
X-Gm-Message-State: AFq9FYI9scKn+HUVJ3fs5TBndmifBVYgmchKOadFiraopRMVy8wovx47
	apV2xSF0jLLsg0UWR5KeoKc350P+XiznF3GOsDOBIDnre252ma0WgYes
X-Gm-Gg: AYBFou3C4CnDRQBHB/Bo2csnfp0yLYSTbYCAWCpVv2TmdOiTUzORNUIUl1FYCQJgxHH
	x43mjjFZYez9Qf4UJclDrCZDW7MOR09iKA3oa3btlk53ZLT7wm816u96EyGtgNMnRqy9j5SqPKh
	cOvUGXXRSp9ICM8b9IkbiWJJgjtM7h9MypwhFWxD2cIt56orVUBwq5CiqExGICtM4C5hqZcZT82
	Apb16RQfausQiUNzwJFCl3OpGAgjBrq8eQh8ntM5vDI6w0wVMVQzEKkflEko6ALlsQxIPzd97L9
	Z+yf0StnVrF/qFqyHnQ9ScoVgsZsdNr2bQSdz7ivIBKu1lHHtVXh7P9TwHIppVsOE8njf2QUpEi
	WXINRYN+UXhSspb4aMwEzsbiHnR6HrHiVUCQ8vIVJ/9vCH6BxmABm+ishtBjwJjHVsKE/3oV9SP
	SfGlIDwsp4mb5e/VbMFoBf5J2echwJ1tVczThySV3l2UeZr7bqKiCxDQvNOpQHgtho7qJemguP7
	ovuiCnjrpehv0IeXCJXIZ0oiA0pPII281YqAm5pbBzIq1W8PiniLvSxkWnT8bIU545e6nVh58uJ
	CGL3428sZpiKcpR/7u7dq+tfUZb1KqLih7Ws8el+r7hzOsKvY+VlcW3gzVVLxdxR8zRuYg0skbD
	Odc1o1fkgUDfEciv9k5fNsfPLKcLWJyWc
X-Received: by 2002:a05:6830:4c0a:b0:80a:b8da:2792 with SMTP id 46e09a7af769-83094e783camr22214084a34.6.1792122354047;
        Thu, 15 Oct 2026 20:45:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:30 -0600
Subject: [PATCH v8 15/17] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-15-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_044556_187767_3F376612 
X-CRM114-Status: GOOD (  22.31  )
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 2a9fe89b1ba5..56594bb41193 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1025,35 +1025,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1425,7 +1450,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1454,7 +1479,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1475,10 +1500,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1588,7 +1610,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1855,7 +1877,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1863,7 +1885,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0



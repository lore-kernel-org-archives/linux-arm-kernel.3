Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEDBC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=; b=IHQbUQ5rFvvQmyMvZmH/Qd7Xsb
	OcuA1y8njwr2QoZCCgrAT0GjLHkcS7jgAb91OBW2pRd39bt8Pfxvk5NbeVmyJGshinOmXLPCEhlXO
	CvC4hCGC/s6EnA0XJCM0/X9E2Vh7Asb4GOmytSoKQdSW4/I4O8X6J6Irl05iSdfREyap5haOymWmo
	oyxYmNHYytNeGpy4LDl7n8HZQa4Mg59ATw1TAfC+6Ddiv2tWtieKEo4665jHYGr5dm2VbVFx7HW6W
	R47AEF/BNtOnCbHnvBKwphV9I4QRy137Es1WutWJTNg2bqyxVhAEGgrgn3kGyOhSwFZILJyPmLQG8
	IX5XLEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fQG-31Y5;
	Mon, 14 Sep 2026 21:10:01 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw6-00000004fN7-2v8i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:00 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-7f4f0c89e34so1834156a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420198; x=1790024998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=L22SgSPvQ7XR8oNDTE+kRM00iIF5xYGufjjku5/MXgr4ImvjRNUJ994GP6LFLDXy1Y
         +461ZGXb7jE9ZBqS2MS+fsHUKJhw00nSRvy5uBvZEHWcTJXhxLj8yXuUjLtHQM9u1NcX
         Sc47DauE3qLjLAtjJCKIq8qh2oVU6WG+w3Y2p4Dfrt4asRPQoQOSVGSbumlXGSR55MUn
         Me+CSYwLeY90xQIWaZM47sZmMwcpzGxNvQxzf9XUwftO1pnFxU8cY9djQaeomB3Y7Fzl
         bvTN3J3JW0tJgqGa1AMpN1oiUjQbL1IoBX0n/voEw2EAnSANGrprvX1o8nsOEacIsJ4c
         W0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420198; x=1790024998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=Up8wQheTtgqP7fRmcjjazDauRk5jGIYHRSc+Ky/QYqmuJgUroYhVqhE/stwRXpj6Om
         0IIl5BFY30+8Lsh5u2gm59BUN4saUtle50QztF6XjIXVGvK8oiZnnfEcLSPXGRNv9/B5
         9B6DZtcHjaNZiCOKEQQwcAaXEMtJ4yg23asWlGg/tRLW7AfFcCPtcacXqXFUfnt6FjhO
         7CgQz2VbKglzGiOPnVyYeRYruZDX2myNU5bnC8BHnjG0mU0tQDDN5gBJBZ+TzcFHLzMH
         HuUmx60ZP0jWOZvcwLC53qMgnDFy2a+EeNh1hg18yLvC0hDiCDcO8QPh5+gGeo7RZWyQ
         8VzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1JPzs4MRq3xZMeurQPHy+CcHrMMhYquUafc+pQpdciAl+SlnMm11KOw5mW0kXgRF0nEOEsNMYrHnL1Y5fCwO7@lists.infradead.org
X-Gm-Message-State: AFuF++mCGfwtD3t1vpyfGsP9nghAau6yYp86Mw6ErkWmyJs6Rvgm5vbm
	LlMKkhOG8y7KKvAs+X2rJz+R9W2f/mqNFo1hQZzHkFj3JnPGZhCmUY+Q
X-Gm-Gg: AYBFou2kjDSlfEl7qF3xE6RBrdaKfB5vR2gr0Ab11Rcm5VphruVXtSQA89g97vpMBk9
	c3Q/VLnfOvQAPOMWXWlweKXW0ULZ0m/fD00lFdmP0BRj/c/nZR3H6EWskBz7XN1kuk9/JlRn5XZ
	rD8zwOuCeQqJod2uXpgnT9osAcSY3XMYoqgFlZB2siOkwKKr24Y2nPy5oU35GDqx9ZNNjy4gA+L
	KuawHMfrHjvfzR4gPZ7LlmhTcgn7NHhOChkQWrKPk82G0UFIjUbmUziSgIojBV+YZTJWifJ0+5O
	0sFZ6YXoEOfIwmBio5ixW3dGdk5+DQqk+Ok07kQNInmK+9ISXRQgA5EBMkBY9pJElldJCyRUh5L
	JcmqPWbpDyQVgwvVgU2hbkUKuQnH9X7mWrsZ8FcYxRSOJkpL+GuDalnoi9TpfXiE8jfM59u17yD
	3rfjmIjnLWeNGbCehNOpoOVa7daf7jgU6YLehz0o9IEV05TYgSbR8zpQZjpDpZyYxZULcs/79Ii
	y5xpj8r+/loelKpGqGnrYD6AShVJdrj0xkx0aNztw8TQzacv1An3u/uSQwUC41XEe9tjfuaBn4I
	BvwKuRQc5YK9VqE1T4//Y67MF92w0JPr/O8hEiNcqMdvLJoCPtbHdcuRZI4SE0wV6PbZHVTy5Y7
	aiPnG1nZcBbThYXyxDaKPPlH9HXwj
X-Received: by 2002:a05:6820:98e:b0:6c1:c628:b0bf with SMTP id 006d021491bc7-6c53f44bc19mr2434309eaf.13.1789420197732;
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:48 -0600
Subject: [PATCH v6 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-2-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140958_807293_3AD1BAEA 
X-CRM114-Status: GOOD (  14.35  )
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0



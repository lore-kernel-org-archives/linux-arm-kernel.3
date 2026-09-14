Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941CDC88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=; b=4uXbkzVNpyW4scPdvwSaAHBD+N
	B8L2lWLRRYjd3qRDKfU1bQQUO1hJPuxq2WpsOGKlk2Rb3/klEFTKIN1Iy4zKU/c+MugnWAEL+i9DO
	JMue6ZboJh/PFFsjKNsqLeXYNwtmwwWc/60rnoYbj0dHX0oLg4hUyS0c6NFSjNgqw01hYYA46Ib8v
	NC0l4JKKbTPOSP4LoTVkpk9Mm84J7Qq8vdYCXTCV9pImo9Tt9xpFwmK73NCUNNca63dAFjjRjVtbH
	Rt1+ci5kr5OEDCHWcn4fzG598PMFw1tRp3WYbOWrcR5RAYDagqU1DNvCwXNWfib6bcfx17eUV/POr
	EFsjyweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwg-00000004g9a-3CQ1;
	Mon, 14 Sep 2026 21:10:34 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwP-00000004fj3-3bHc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:20 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae739df5so718601eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420217; x=1790025017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=FYX2b9hmOmVLOvDQvBDOus0V+shVcjtA+tFHoH3dmOO4y0SDXUyICOLfdwNDo85p7J
         BT8i0vZpdFy27QuVUztplT2wiVc7R9wbo7ln6LlpP1/sLNPr+QbHZvOt2jt3GMmYkUa8
         +s4gOFVHGi32PAjAYTD5f/Rv6gnu+nNrwkkmYYjAKhVrtxi33UxlB7NrIiXhsJFF/KFj
         EHZPpjbBZ4XNhdcVAxPdRhb9th2YoL/Y7W7gn+X6X0nvYUQJ6ok/THNE+sUtzPADUudi
         d3jo+A6YZBnhfhCAg6CIQM9kwANLIGK7hZ+rgxtoWukKSZWiZ71SI1+ydut1LywUmZK2
         6uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420217; x=1790025017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=rXvWr1ZurVn4fDH1MyF51XFi4cK11bMuh87q9yISOUOMMHqm7qgKCzNEahnmOkee2N
         UEGElv4SFtvIWqJ/Df2z90Scwc44Wjv2dEexERP7dZvmA5OlP+dvYDmgIkY/aI7gGjL6
         o5qd/NyBZDzuvWrE8T400B4tAh9tKbi4LApMM2726tK/KWsFfgLqvPgSCd3AwDOJquHw
         AJQOa4N/BaXnw1EJ58Aq/HM5rfOZ0FGXnAOmV9vxFO2EqikADCZ4FDc8afQnPPwq0nGe
         ArLgbjCA0F1u1awnnqIKj9tHL1mJIOEo5LbGfrQnbA4ta2HOgYsoeE/FmIEnqamrq+jU
         Fnzg==
X-Forwarded-Encrypted: i=1; AKwUvByDnohAJgGzF3MbXafMzyPZoCK4DvqPOIYGHFUJfiOMc54aKYKCfuwlEZhJEvimofTwM+STlbh6qdvIk33eyKU0@lists.infradead.org
X-Gm-Message-State: AFuF++la2iAS37Rg20SF0pkdIFyOIDBHBwqzhptGKiUwzbGu1r3NMp/t
	6Vr30DsN8wr43WxdKYR3E5zEgaBMKrlo5h9iN7o2KoO0rTeZKO/Wxuu3
X-Gm-Gg: AYBFou0kbdYqT+leOawGJMyOV+w58ZRHZa3/ZcgF72Pj750govdaFkkKpYYf1jCGYfw
	65z0F1XO1hwp02IcaLXaXNyEcwW/c8229GWZgY6cVL08oa5/sO7TUWYZ+ubbpYwyRCRCFmoXeku
	Oebc3WkXBYho+QmfwTpIEFoD3JWuw0SOqxPwr/d4jsypBIyDGtYEAdfEOh0YcZcWjr+hvsvIO/2
	s4U/jp5j1PxmFEFMiNv0+gwaL2FrkDkIU85/4f1Yr+MFktMEkr8vW6x7ITsn1Ai5l2TT/ACQXrT
	2AjzQxp55p5F8UxU9wPNv4WSP0IdZU3UTfGJj7ADGNWD8YR9Gnyc0f007b1QfTVKyy4witNPyTg
	SY3UN9NQl+rblyEZQMgoV01d+1xEgT5ANjOP9FLEsEETS9Plk05YKPn01QKj8VfxAEG5amQAVVN
	Yd8Lqb+BzUW2sXsfbwlnFFkeIchtcCCR3mExBD0dvIqgNLedhO+8wLgUbmePr2Xco8UuVmS79bW
	xi+ayX+GBMAdj2I5PeN1Uk8yCTmm2QsOESzxKFYmkj/QG2zLHF0AeNXxRc7FqUDwXxvQZcQ7SXc
	wtqYucxUqEcewAJ1NeaTYTux6wFiKtPLcM4eqelnRaDXy2KchE3D2Y8a4+17aMm71JTe7on6VDj
	/V4alxfccUq1m4D44dWEqvU+4gRjj
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6c639498c9bmr552266eaf.22.1789420217054;
        Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:02 -0600
Subject: [PATCH v6 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-16-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141017_987883_62350645 
X-CRM114-Status: GOOD (  11.28  )
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f3234d2831ea..773ba55ecc07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1808,8 +1808,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1858,8 +1856,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1888,8 +1884,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1930,8 +1924,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1955,8 +1947,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -2000,8 +1990,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0



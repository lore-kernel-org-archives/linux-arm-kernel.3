Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450BBC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=; b=u9z7p9edAyrVGE238hYZlB96jt
	nIGI0bomuo67Z8EUCYhOncyZ+A6lpaLuWD1cNQLSy3Y5t1TaGppRA4yOdJ7iSrgaZg5Q6YHWU4UZI
	v/1M+v48WVmxN/h5Xl9cCWwvAXrBrx6ywxxDsNuEA3zevg30foIokM+Bb1Sp0Fa9scOEfcIyvRCmw
	OgrITzSnF0BmwSxfViGxUblOYXQkcDatCavPtOpAJJChObwAJfY6eZJKTzhc8MHFPtv3qHsDxq/wS
	7YFiTFfA22EXJ/eWMpQU6tXLNdaOyoQeOMbMDUIXbmNJ5veu8UlHUUAiKrCuFFqqVr/DA5Q/gJSn8
	FUXlwY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTH-00000001MmT-3aZk;
	Sun, 13 Sep 2026 04:05:39 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSx-00000001MFR-0pHo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:21 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-46f415ce6deso1178461fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272318; x=1789877118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=hcVN53PFvG3/avzDX6kvBgqj3PvsQ5a6rmQiyra2dm1p1jnBNF0fIf0xVUSQAkRwpD
         7pYerR7tpQdqeqtlWQ++mkSOBZJrQwOAMkwOJHThJuaWiGL8KjeA0KM2iLwJydj1nQqk
         PGWpcFKRYfg8hhDqN4fmGCQhiVCMoLqSpz6hZTdczacGokSl8eX2SNMMkoq71fPnJsa+
         nleF5tO3tvfsdLeZCUZloL1fZEBhfrOuSN4aN2Fsu+KWMxSUcU8f/htiqG/eyslbr4Rc
         mH1qT+eT54IqA6wUCFS65jsDIk2ZhFLDgcToxo406hyEFdylUN+rDGhSPl2YpSKWRQSa
         w+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272318; x=1789877118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=FY5Ad4jOm295hw5zgls2igyfxiAfGKp/gQZ9oZhx9OwvU0VwpUHAOaQJG1bWyMI586
         U5VvaPeD8nCV0WSI99c9w+QujmE8OJjALR8z/JrUYAfp1eUufBQiGErPc7e+GAtgvmm+
         x50p2IOFa6Ypn0JNLPprtk2c/rndWkM7YdQm4M5II+3ad4sb0JZdsQK1fRFbDv9cUdyg
         ZjefyFAB0iBjKRvApG42ZjjIvhw/E9/YpeX4OA6GYpBOfzOkvXu6eULJixAW5Rfs9+Tg
         Fcmxs7EChNPkyKZ1CcBDzxuRTMbxxMCfm38MgnZjZFpGFIFWiB2gsihkMc84QSfvttw8
         XHrw==
X-Forwarded-Encrypted: i=1; AKwUvBwN2vghN/hApiQc96NHbzgvqBmOBKRE74xf7U09jQQ6T8Ytlbgpsh5Cjre19aUnj9xvqOdl9Ly42sHks0wuxYFA@lists.infradead.org
X-Gm-Message-State: AFuF++lvnwobTf0nXJjAGElk0J5Fn4gqmGgd0FmcZLbK/M0HSAK4Zij/
	+G6/cMxW8W8+O8u8ujveCA4HLjBJSDmvH5eR37zWKPGGoHa3A7Bzmw4ECjHH9Q==
X-Gm-Gg: AYBFou2Gnj9Tr7xP2H0he61M9hxJqegW7QajKY3mF67iNj6SaWv5/UgP5k73OsdvQTz
	pvfzcHAZFYjRFL9GSmnHLpeaV0wYSp6tfMhm6DWQzIX8FOxkH/O2sfvExrsk2V90rRxHDJ3KsLU
	DAlGbyjiy0V3EFn/J91OjQGDOsVe25balls0lIC1QTl4ewh2DI1mQeG6aeIG188Ng4GtVy9+mZc
	Qjl+pJ06KRRQQ1pGaK9ilK5Fr2daFsm8sMLY9zjmyPQpfsSNeEXU/ltTixlD9m4bvEa+W1/47ul
	IAahm7jURfi9B7PFY3l3VlNrwMal5ZyT/7XqEM+4OPHfYq4yvfR2CORvjdocNlGbVTN4L9qkEjx
	wEnYLLyoP04ZmQFofeUACPy6cFe6T9ITsxV4UvIash6BG8ZMzFyNmjzIwTnvI4L2e6HFNYjRc4u
	N/tnZ5URhpOUnlvWb3X/mhYlFcVRQNnbk/+VebQP63OJPhMEM9UZJBckYSHTFiZS1UUAA5YneAw
	NKs5Xu6J8A3FJLWu27EZvy5GAUh8MTkCwQqARCTdNWsw/3d4H8IZckDgbQni+45f2Fmzn+ArcNK
	0tBdHnBpJp6k8dD2099vgXAN3eZZ/9mqJskILfVNdArCnJDlDNXjgyxaBFlSsFhd9h5nvWz/Zk9
	Ud2Xdux1OVaDIZjq0hC0s2QgUmWnxA4O5kjxSQrC7
X-Received: by 2002:a05:6870:8306:b0:469:fb51:b351 with SMTP id 586e51a60fabf-47de8fd0c3fmr7839424fac.17.1789272317809;
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:58 -0600
Subject: [PATCH v4 07/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-7-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210519_278408_50C06B72 
X-CRM114-Status: GOOD (  14.04  )
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0



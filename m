Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C544C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=; b=F64hSsQAFRb69e76uWkLnYDLln
	eJ2twGn9HWyRq5S+CFU8GsBn3jYj+KIWJA5SJURJbPOi2AX4YbaheeBGp4e9se9KBf/6jhNp2Dd/F
	LcChtjn8/R1HwoNOwsi3D9DbptoN7diwGi+ZaDFq2Z1RQNpztuMJcnAlAAqGBTfCtaUO/oiD48rwv
	k58haWNGOzqv1aROAptZk4HlJFRcoQfnz7IyT72aGHmAheCcnunlitjzbsINhV8rKid1bnBGRt0X4
	XUc7oS4zm9S0XGCihkGHSmjBtbo4h78fYa/WNvEEdOUCP8JaUOHlk1MXuwKLNBIqmpMp+/R2Fp7Mn
	UqtoiBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxx-00000002E8u-1imq;
	Mon, 14 Sep 2026 03:02:45 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxH-00000002D16-15L5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:11 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7fccba9c675so2923027a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354922; x=1789959722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=fcLV3LksTLm+4GtSJBy8guqXlcSx0KFNOJrN4jReldME+4oZK8DMhgdLOpFPN5EJQK
         8/Yg0vwpWeLsk0bxl8nh9fKa/61p1/wJcr640Y5EmSQeoP5owRvaKBy5uWeC+paM43gj
         OsUl509plnk7gmeV5EFsBnk1A/SMQt+9SYEbVOEfE6DPCCFm5rDC6inCxMcHVDM75Z1Z
         XttNcJTe+l+a3WIDULOX6oZs8AUkyc7o7pBK++tQ8UYggoTOZvIk8/B6y8blkb8xKG8R
         AyHHWXJN7KUjahVO9H18xNTE3nK1F13Z0uPOXf9WDOetoS5IF0uKRWEghfu5ZrBR5mdc
         vWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354922; x=1789959722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=UtD/B4A1wpNEUxADEPWUvD6s3P6TY7CrGWMMs35OtHIZNDi5hT8nppa+hZlM5L8tjG
         pVMTg54hid7EPrm/OWCFrY5h0P24HMPnzvScRErX5K1h+LSxD5HPAblvv3HFVJwNoFAn
         1mYlkD4KnNkG3Iy7xcWERSjv6z4198Fq6D0uTwJGySS9jT+BOggc+SP1wwPq/SR3QAwT
         G7H1QgCGOxjOaTQNnOFze/M3NTtkw9YIJQbxS58ggYazhSK7gRj7+5HAbEvzliXv4XnS
         OJH7T3Qf8nf4UunGVxitQU24mC7J0g7Nj5IC1hgRVfY5631XJ5J8EmP5nn+QjK8kVJn9
         d+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBx/beOEdliIZiaeVwO7XXPTREzllbzVfQy7nksvEM9k1Hh/DAk03Bm0oxzB38I+5/tWeed4q+7p0pUbnqSDfW/A@lists.infradead.org
X-Gm-Message-State: AFuF++kco+cSDHGMODrzJa7wWp0ubkLg8Fu/Sas9YBQPMQUlWE/mBPPI
	t1FdDEAiDBRGpdZEX0vLs564/ngIjzfKoILrh5YABeT9kniUtsvnnoi/
X-Gm-Gg: AYBFou3+EA9E2Ch3mPiL4EO/7tojgNvrhpfCE0xgltzcaDpwpyZGGkPsGCyYrhrS4+p
	57bijBXcC2G/5BBhGNLsXsVRXSHK/OhhRoiBHU3NbsfvQ5DEuMyUzNdYywlOzucdFANFOHhR+cg
	WmaBKPfAY+gI3fuTyccARB3Dvi1JJy7gRUFw4ZWndrYY1XXrqInpOi54Ziwip2SQJs27e2+kptF
	g7qsKKG7boYHSLxMZaRXQhyn3tk99HA4UWH8FNhwjk9KHiXRtrKT3caXUa4rppzwf+Mc3VOshE1
	mWtzKCx+djHKPU2aXnavDBX4TRnHDPCSe+RXsnoJT93fHVeYHl14qZXsytUJYE0ZNCSxz8hwNhV
	i3O7HqGYt1jqu/850s3mrY9ZyHRJpWrZWotrNxGUtj5qR+Veq6z76xCzhIG9xSgE3qc9B6KfkCA
	L/y8bo7X4pfuKn7gsv12nJ4+KefDciXPl+nkBX2yNenwVeLoCbKxDNHleRHx9OXgpegWcuZIcWP
	8t3ID38t2XqIRwEmFI0dKIP5CJvO9T7sG5SbbNt3WBPqWnrRbWcWBs8pt2i2pAX1EvYSJdGcQcs
	LHymCQDAo3wd2zDmLVJUuUc8jxIoSIXQ93qmqVLXp391xE78kgrxOwO/TcaFC1Bu+RmEzOkfqRO
	8NZbrsX4uwQEYIgncvlMojusgUJ6fQQ==
X-Received: by 2002:a05:6830:6d2a:b0:7de:9b99:a8ee with SMTP id 46e09a7af769-80719632b97mr1941438a34.9.1789354922030;
        Sun, 13 Sep 2026 20:02:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:22 -0600
Subject: [PATCH v5 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-16-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200205_576050_F530AE93 
X-CRM114-Status: GOOD (  11.05  )
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
index b7ac8d7b0301..4103337f6a07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1794,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1844,8 +1842,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1874,8 +1870,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1916,8 +1910,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1941,8 +1933,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1986,8 +1976,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB9FCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=; b=nEfoIyUWR/HAfk6u3/DQm//10K
	5UR0zlHasBCnlK6JF8bR3tVnaekhav63HSag0B3cTxFZ/8bqlWw/JXGzNPnc3faRGGdO3e3HDDwP5
	9XCr9c38lharbTNEF1t+heqataE0MN4JNoSH7TeGxkY/FDT679QKmFHr20amIWpemP9KogZCCYHNJ
	AH9UdkUtLx98TWOOIxEBoZyqeOM+0x4YdZDdtnUNv5uyaRIjovCotyqv9iXj0bZXyhtkngOueFikE
	thnP+Zl6SrJImkAnLmvMVIBZVqW4n/ShqpNOC4ZnmtTfTXIdUJSsxYm+3sGt+NsxzXxkTwFSlml8L
	crkKsJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt2-00000001sMB-2fqH;
	Fri, 16 Oct 2026 03:45:40 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsy-00000001sFM-00Rp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:37 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-824e6e6ed71so2262268a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122335; x=1792727135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=S8ioQkd2yyDYqwcphvWNcyFQnamhWUQPgmK8KheP8+wGIND/KrFtBZl1UVM4Fmz8Tu
         K6OV8Gw5iFvvN/qXuPjafe2cLTPvsFOyMvARPuDrCiLYVBb6ZQVKNPDwBFFwzedBfeoE
         yMoMyvFFQ8Oy1FFyzLQdZ51LwV7IMv57VqjebBgH0aamysKBmOBrQlH94+1+4/pJh63H
         ovwjWsR9EZVVUMFc0NkvadcEgd5ocyQX80Jyk6D6Y6b5U4g0lBO9ovvulmXFsQityP2Q
         gF5yXOBFSVOtHyeXRIYGPc0O0/HqqaECuUhJJ72dq7azAhQ2oeQzV1CsHW8q2F8H6mks
         EVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122335; x=1792727135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=mYC7rkFF5ogM0lxYoUqLRbhrNsaBOI7/NQgRI78UNvoSqcSWDQegq1YAMBpd2Twyu6
         IKkl03CwqiuyX815/z7hL9w86xASh6n0VRNraQTYgcz3vHQEfGlB4zJ5FXE11iE3nTqT
         MtpplHNM+WN+Bx5f56USpfRPSwxTps1nVR/IF+rneaTyWN1qpr2hQVG/i4NE7OtYAYVg
         /iptmvOYsp+g9sEHh7RQVV56qLOyuX0WeU1o+3yzIAr5RLGnPkIkXhHvFn1XtnkknRCi
         sbgCg2byrZTkwly1BwrVP8CURFxDsqYAedqDQxGocX4wY3ljwixxBUiDagl29r50L6qS
         cuhw==
X-Forwarded-Encrypted: i=1; AKwUvBw4VIWlOdrTT9mk4fgbxOAWLeCifJUD474zMfsB0vz74Kmaa9Jzs2GC/vhnYW+N8mO+mcdijvi/onsko3Kxxfgc@lists.infradead.org
X-Gm-Message-State: AFq9FYKQUtijDoUipC/igzIKKYBO2dHEk2+K22hf9+kFXfRjX/ihOCkL
	lIWdvxzZ3cG5cLByhV/UDq+xh0m73UfytdDHtZ2Er0xAci1yUoT6vt/c
X-Gm-Gg: AYBFou0Wf7FUiLRwKwOv8H+uhsH0z5jJnEX+ValZWuDvalvysFbL9EYQWrRCGylTZ1q
	KO0yW17LM7F9dtkfNKpHm4DVtHtvvgQrvwnzF5Ht1zLrxaAytutK0oPrJLiIYyKCGz/bYEWs9U5
	lbqWDlBYICdSa4OgXSsxlLceOMB+GfcyhvFb8oXpY8yjakjvyxldvg6dDZBmPFMCJzb1961zHGK
	a2Kot/abyJzRN+0+k2i4nwSkUZ25AjTE9BxbdW1U0hPZOHXYlfbZ5f4TijQkA5AwTXvznyk6lF6
	B1mpjuzUo8P2eTB1sYXVelmtlFuhc4oipvNUsilTNJvWeerEuqda8BGxU+6dNS6PEImYKKAJE9c
	w2Wmkh5nArpDK0YddtyWvl0JWjKhofcs4E0AOwyemf5uNrYZ1+V83PFZN+l2x0Xv7SjAEvmg172
	JVKVnz5HzhOkWyOHXy6naePmzJFoAX18g+JwCarrJitBo7QuewtYKpNCHEfW6ib7p34IPifnN9A
	klwKj8ptBpTIWsaQsAYy2K83j/AzHIX+yj6K0BoCpjj0fmciB2fEBNTCKtiiuSl21dtQLyIc+67
	e/SqtTLuDRisOR5WQrpU+ryp/pMyKyuTIw4XPd2pc+wAD6U7cO8r0RsU+3+mPegCFWrRU2D2Nsi
	I2hAE6chVz9kM8HWqPREv9Q==
X-Received: by 2002:a05:6830:4394:b0:81b:9d18:75e with SMTP id 46e09a7af769-83090e15541mr22707196a34.4.1792122334840;
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:20 -0600
Subject: [PATCH v8 05/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-5-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_204536_073802_9D160565 
X-CRM114-Status: GOOD (  16.43  )
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

A page program has three stages: send the setup command and address,
transfer the data with ECC, then send PAGEPROG to commit it and check
the NAND status. The PIO page/subpage and DMA page writers ignore the
return from nand_prog_page_begin_op(). A FIFO or command-completion
timeout can therefore be followed by data transfers and PAGEPROG, with a
later success hiding the original setup failure.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.
Keep the successful setup/transfer/confirm sequence unchanged; this
patch does not add a new controller-reset or NAND-abort policy.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f7ddd4116bf4..d71b980ababb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1602,11 +1602,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1621,14 +1623,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1642,11 +1647,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1662,10 +1669,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1706,7 +1716,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0



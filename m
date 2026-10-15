Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000DDCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=; b=YKVBHYgY9qQth3dCBreoRigsLt
	JRs2mn15fx33IIaGfg3SSuufQPmh06HUtvL4lo3TH2SNkUzCZBGDoJTku3rch7YHqhQDVAXWixKJe
	zZX5riKDXJrdw3KaSkWrmO3xBtnzA2vVoopT7QyEe44wq3PoHq5oDC58tm0tbD9qrU/+Qu+5vcNUB
	4OM8B3LJ+hzC17sYiy6XvBUh3eBRPPnFDzIbmJXoWkEqAocGetjjLH7Mb62R4KAls1DXSU/nM5a7E
	GJLJ3BKI7La0aeyS5XIWCUGfklqvrWPc5jMCnRqlJAoxMCJyY0Jpnsw77nKKSqcL2L49n/Z5sFQfi
	Z6TTax/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMY-0000000GYJs-0uW5;
	Thu, 15 Oct 2026 01:34:30 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMP-0000000GYAR-17Mo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:22 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de1ca1b05aso3114157eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028060; x=1792632860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=I3dITw7JlOKPEvjpMuOtPmHdAVe9NSh8ZJqXmW/Tye3i6lVQiEwJECrjHdHJyYN7vo
         vSTCzqzwD53kKRJNtMwdEXzQcyw4JrK55pDTQrxfAN99r6S3JgXdVFFSr06TQyicHad7
         DkBFoLeT7WzG5LNB6FQOq2r3xvcv2y8f20Gy+Kb5l/XYOTagQUPy/NP+WNPY2EdBw1Ej
         sDstfy5YmzbhjrmlRhcMPIcms20B4xby780lYhO/upEgTOTYxoY0gUSiYsYVY+9cUIDA
         WA/BisLhA8aG8t4hsDtGVR6DkNiyt2i4RJ/L8FidOjfcykCiq7MnGGbu24y/NhUkuAeh
         FH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028060; x=1792632860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=K+1QAvLKYavZLbIObRJasIEIvbMCk8nYOAMr0U2FYqno2xh3IvpwrufQswgcTPPWVs
         KZTGX7UJRjvtJFRCXmbZaPwd0eHg6cKjjfti5CHxCmdIVR51ajVci6K0kOp8AB064X9d
         PLR+HNvVO4fadobmcAXi44C0X3uqDB5eNlOg2gcqAPHRRuqpjzbYCgW/p7aJa+E/1Vgn
         klHcTwxHj11yLvIwmPZRROOMzrnTC+/kA0vyz6/KqMkq3koxT/t+EFDelRXWO9pc2Wzw
         W01mOstBYNR1DitmPo+m7AHjzl2GDBBcWNd9GgM0bxbgXffxWD4bELePXpdK2wUL2lj9
         HQJA==
X-Forwarded-Encrypted: i=1; AKwUvBxPOXwa2IGkdLlYYIyJYqX0/d67+9xQ8wsvHNQVWwn977pbY3woS7cyEBWE+aofvOPtA1ELr6YlISaRZ/J21N0h@lists.infradead.org
X-Gm-Message-State: AFq9FYIl99xDnhs8M5VWAoCmDZC3lHtSVLRnzTuhTSoBVEP7Z4ZFxL+3
	TjiWxzzO2ko9ScBAKvrp9XjCcQ6q3FL1CKpSTKK5fliOxQsnvgcP5XmX
X-Gm-Gg: AYBFou3krBby2ISEFljed8RFEU/JMq8FXXHQqJVGqmvAsZatb9mNoYZ4yYClue4rSSp
	awFVEDfIHmgb4ZyWyNJKP5u5m2YV+scoFZjhmgndXp7kQ0COQwETMldXpdzB+qHCZO0EeWYH3dA
	OjVHTgLWY3QWx+RXEZhL8g6JDmLYdyujaTthTd6O0ahrAG2djEjUiAKeX/cXdPdNRvZBKhHg2Wk
	qCfOR1jmpKvbyI8ESSp9HzGXVls/twwcuIPLFKTXXrS78hYt1szkre4JgZij10YSX8fqEO212Wt
	EwT45PWv7Y9uuDE2/ErimrSV7TMTlB+pT3G5YyVzw3y2rYgh7vc9coZJ5NkHxO/ruZ3XYdmzlbV
	WAKwJIfQULbv7gxn1Mgx0aTkM6VXgrQeyzrqUPCPPw/nxBcXn5L3IU7WCzpOyRizDrpHyMS6aCf
	d/E/mwb9TWaRef5XVKn2zq9DP3VrsXo3iNVdJTWQ1s+tEIRK/oBGsuRROMNQEtezM7QNVYoMzWN
	30lrgnZheQWftdsLWRgY4Ol/K+RNseN50y7ivnQDxbrE+h4X3GzDzNragTFtO3PLBF8t6Hn7l6+
	Jik46NmgBeAAyFeJHshA0Z22qM480g2d0i3A8r7gkIvLYV0ao37vvv5QL78vawfkj8L3v4FMaB4
	Un8UR3bpczp1MP3JgvQYA
X-Received: by 2002:a05:6820:4d07:b0:6cd:3fdc:6001 with SMTP id 006d021491bc7-6ef115523a1mr12486639eaf.82.1792028059992;
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:52 -0600
Subject: [PATCH v7 05/16] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-5-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261014_183421_330858_F61E4DA5 
X-CRM114-Status: GOOD (  16.51  )
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
index bc38330c0e36..57df88099206 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1595,11 +1595,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1614,14 +1616,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1635,11 +1640,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1655,10 +1662,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1699,7 +1709,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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



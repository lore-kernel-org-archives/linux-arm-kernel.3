Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0716BC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=; b=UpEWmQK8VJmzLvL5We/RUHTg2o
	QHAMF8EvR1X97RKoESpvmrrhsirw+OhsuI57Gd8ZlVbbSUkX1zXoyB74SEVNntFxFcjsedH0dQwmd
	y2SUFWooxcK3U05GIXnChSctQG2bcudgfLhFcqPzrat8Zge5Dtf8u8HLb3qv47jidMCEq8+9R3oa3
	lmUnUfJHYD1+44hOCgYRJgZmhEGJU8snGfnmFG1EKIC+pvEe0LcFVPmUftIcOVd9FqTtKFpydNDFT
	Kypgm21FRP8QYSx21iYwEx6Y60GuZ+4Jhh4Vq7rR9uYzF7/BHDhG0VityIuNQ05fT8LS7zq02EmSY
	LDGal31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSy-00000001MKW-34tP;
	Sun, 13 Sep 2026 04:05:20 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSs-00000001MD4-0DVv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:15 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7ffa69b7462so2515878a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272313; x=1789877113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=muwkfe0Sw1kpsJizu/2t90qPIya8IYwrQXNxDEasX0oB5f3e4KvmyB33rUXNNqNckl
         fb8ZRQv0wVDXrR2vVXjuQ2mWxKLh/qChUZo9fqNZbmQeKdtCrbt3T7y5dFtX0L3bLlgY
         +IraGPLCwxqmDaCFrK5U7y0jA3Qrs+kls6FRvZkl9gz1nyrESETL4F+9jn96j/rEfinl
         nCQVAPJg2R8jyhzQiMvGcnja9PNVbZlc7x2rPBhCiqfgp6/eoI6bavrlnNhsPWxHr6r+
         drliCDNz9/Rq6rCtG8O2rCaj+TYkdMo0opyEeVLJZggvX2X+g79EeocXVub5pXPTReqR
         y/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272313; x=1789877113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=GK/3IK2+7gYqR97sBzarD6wY3rEyOxqTDcIGL/43O3SwXPmou0NKOyWQ4VZl44TFW8
         ZtP4EgJ6vs7/BDatmbopSrrqdrzfxSXVxSccfVe+i2S1iIjRPBnXF8gP8jgzQzYLeRmV
         vuhJZIJlV3E06xfDBrRAkZZQ8M2J6d8p4O0JJV79lFqF0fO58O7/ekpxO1y7RF+jwF5m
         wJN3lN3bX9eADCTj0cU8h5FADvt59Sr2oCQXd6Eqy5+tpcCHxSO8PV3gFBz0wLjDSQFs
         IIZKE9lKoN/cUq8D6x09kEqoGffubS63X2UcE4YTtrob+kOpURIiFJhH401e7f5JpdaY
         3tog==
X-Forwarded-Encrypted: i=1; AKwUvBz5cKNd0Xe364EDEQisg/By2POKWMiJbMix/0v6xFNDusBi3eCUIdnfOWTrm8RORk6uJV4sMmbhLzK11SRfOTuE@lists.infradead.org
X-Gm-Message-State: AFuF++mo4lmoWvBfRhhtbnu8B8aTGAtT4DFdnPdn5XdxkugMJpcJ2oWx
	wChksOvYXp2mqJl0JD1sJAj8FtCuMQXs9WRI8JIexDfEFA/caTtn4MMo3FUmxQ==
X-Gm-Gg: AYBFou2ZfpkffiRRMkxbwsSt28JLkkv/jW9amh1og9fQZegaFXWkL+bOHLnh7qVzPhs
	4rUvBvB+BrjTMIvPTZnG/KF/87KrBNVFsGwAyuOf8VhReyir95CM8EW8KkECLKQDyCFCOqpprMO
	/ka4bIysUPx4heWS7gdr5390rlhdWY7a5JVmqb53P4do+MvwMC44LK90Mf0YPcZFKM0w7iJGtN7
	KQui4yryfrHXZdp8CRx4uTGbmATIe4mZbjzc1b7Y/WSjt7tWr7S3KpBMIVQYvjFwfV1yufz24k2
	HwDH/7yytZxkPjRl5U52qBGlvyQ8VA4dP0XiouuEEftFZcqsgla3GALOXknadLFPUwRzusNGZXw
	Jp8s630LOq8J18yYRR3LJrGlIM9rIhp4stBsWkpp1ouXWl1j0qVMMd9JQKqj/xVdflL61whwXFW
	SR9lvg3+1KjBvW9C5lcNdbC9nygcM/1lFoJGV4/BVXFzK53Or93SAOlmh03ymbkB9yoSPI4Iln3
	vsIFxsN+JtV1AaDW/8Huc+EbyvqydCsxz7/uwopzPK8Dh9W6m6D+02cLGcsGqnlxoRyMzz19jFj
	uxqqjhvSexqwpL2fi/xHhha71Isykm0FzsQnRegLE21z4A0RpkwjSpNCyEc68PRDRH1R0TjJSE+
	NuqB/fRWHWneBPgcE7i84K+wKTDMO4w==
X-Received: by 2002:a05:6870:6111:b0:475:e235:902 with SMTP id 586e51a60fabf-47dea515f36mr7446958fac.32.1789272312951;
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:55 -0600
Subject: [PATCH v4 04/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-4-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210514_121384_49A8EF85 
X-CRM114-Status: GOOD (  14.61  )
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

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
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



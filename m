Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1170C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=; b=O3GyyUDSjMtrWipV/WiAyqWcZF
	xzv+YYIp22sXD+dHCPeUcxfK49eYOevO+NcobewEQlp73gvGswt4kVas8WjUEYWzRQDzOx/wiAFJ3
	Ei44xAOwzd77bqfHjaZSJl7dtBnoHLhtHZQC9j20CAjQzhXzDlYzWiL00KLn8jD/pzeyKYk3odJZk
	xFoBhwon1l9cWCAnDCy0tup4GKobVEHAGo4ktmqgZ84NR0on/pDSQhTKJiWlsoMQ6Hax3jfvVPFB3
	nKnqD8G4nj511SK5nCCuhE/ksu/nkFnfO+cslpdgFRFc8DIbzg/n1WXMhZzD0bd0PjoRk9GU2nWDg
	ejO3DipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx8-00000002Cn0-1TlA;
	Mon, 14 Sep 2026 03:01:54 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwx-00000002CbW-2jOR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:44 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso1244048a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354903; x=1789959703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=rzLD+wC/g45qc56lTzuMSHjAszIpreftCqAepoeJVjiIvCV9A4TIXDfGa0//cN697k
         CEv4MMTzewZCLS8eQYYTwAAkgi7Eh7yinN7IvadIKHfeg+ZccGVnb1cTOsf2Rkz2qTOD
         KV5H38riKbWGuwbEx1oEPI3xTfoRm36GknYemknyo/OvfmQ3RAsbym1vlQWHdSC/NLAF
         HYFiAQIHh1zBmSejtFvIfMvj0zX+FpsJbQkOWSGL0BreGsgiJRsrqoJwJkTsRgoEX/tm
         MHXxzwaIdPbV70hFb8aZR1usJWl2zk3sgelmp9IBfWBJm4Iu/yqnxszidpcY/gXSfrYH
         R0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354903; x=1789959703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=N2undqdB3iAw4A1+sytdrO1WYi3JdmwvFxyVACqVZBYHNQAQatD3ZccTFod4FOPFZG
         qDnJKCVDxlbV7q+kNBWpHLiJHr2Mn6sgcetnr6fmbM9JsTy64ZF9MUJGaKnJYF9rlDqD
         gIUMUmThHOFqxEM2jtEmmgF8H2zmmx5blpucwYbtVVhir4YrHHGFF/8tszVv5zqkDmXP
         FpTWmDmebKZfVKJiLlKEkqYFM0y7n4o9fMw/xHyCsUtYeaAkZGwCP76XkyK2vJhnrTIk
         c/GxJ76gg8wbzRSHYZsJThw+gGOCaHlidxauAa+6YzNpVYk8PSnLGAvzuRMY0yTbnZl+
         oQ0g==
X-Forwarded-Encrypted: i=1; AKwUvBwUDGZkMu3wqFSygB9AQoVFuossENUH4pb/pnpoBOihfiod9j04dwSVcMR3srNt/NTklp1r4Gy4evJ4/KibYPAC@lists.infradead.org
X-Gm-Message-State: AFuF++nqxMCLSG3XsAe7+3BaSc1Yk39jmpxeTf23mS+9z2PrnB2QWmdg
	wnnkgCTQ+Iln68Zk1EBOtxKLwJpI0H8nAVmNkaAV+FWvilf7S30u7hOQ
X-Gm-Gg: AYBFou0+fx4uI7uhkhkjkKcRKEaJLccFUhAiEi9eKI7x7hgH+JNkSQuirlO7RbVLuyo
	VxPiYrEq6psPOE5PzjsITe9JDgz9hr8bEsT8hcYwDxW3Fvmm/vo5FE0EiRSRuGn8a/73Yw5X7Y0
	1UOCYZs/gyRrBqyyFDxouD2BkynvYWe8MDsMK7kcjGTcGrRgJyOEJHuF9kzFVdl3PLtV7GjRNez
	zmKu8VCr8GVr73u1u3EynJYzTqBiqQUEtnRkXO4OpYn53ApE1iyWwx0x4KROnRy8rRNWsMNrkjP
	gujYETmFPU+tQmI43oJS3+5kN4qEcV9qnvcSOs2qXe8byiU/W89WpmBrMjc34mhnkFhABDqNnfg
	ZlwVgqIq38V3Rri3go/OGm6EcoukU3efkyTjDl+Bhiq5UGB2uBZ50jIuWYoF4z7yNwFE+jKwBN6
	wKEz9VfFtXHNy+RVGvojoQhTvp6FKk+M4az2JRry3Kbv6M+VyH2H0i+RLT4AMmdu76AAOabc6oQ
	YxKbaFiX4l2ZjjMsDzhqaGazCfxkcBpFcoqguvf4BThkaXQvOMDETgt0YjXyLNMXmID5jnFxp9o
	KS+GmMp4S/GrmV0zjOQHG8XvUx6yVjwVLLUMmPgFoVSZYT9JORzIJbDbaAdJ7N/W9teRTG8eXpW
	jUx4hZhb+HLwPuLYclhkH/5WrExWVKA==
X-Received: by 2002:a05:6830:3894:b0:805:9f8b:bef8 with SMTP id 46e09a7af769-8089974baa0mr554382a34.14.1789354902809;
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:10 -0600
Subject: [PATCH v5 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-4-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200143_762822_CB873503 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: stable@vger.kernel.org
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



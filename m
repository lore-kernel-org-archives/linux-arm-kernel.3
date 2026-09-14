Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03572C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=; b=1yHsUedavx2BVwN83Gx65y9W1s
	YFnCTsU7THqMMAN2l1unYLkOfAT5Hj2Ca3+JoCHKRMzTzNC/DkVgETv8cuota6KAJ9LHSavP67aGU
	knfHr+51IpvPwGQaNyDEo11KMoivf+jdIa7eAUixSS7khezjMdydcySD7TTIILrw3i2zNtAnk1zDE
	UlfRSKa0EWs/qMHBGfHQhBCwLq1uxA40c+dBA3w6BQIhT5TzsJxjJ6Zn1DcRuXFY735uKZnXUgGjm
	0TdSIiTgzpRSCWixCcVO3j4enuGbgisbONRho9+sJGJKKdC74UipBkALkcJhGyBNc88zpg3fy6SvM
	T2GpjVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004ftn-0cn5;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fOu-2DqU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:03 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae7089c0so1335183eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420200; x=1790025000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=n5JxAO65mOogjYwbvcpmNv4xwSdU/gQIauHAs2bCm8mkHyiu2myD24TY269x05cxnJ
         Ib5JuOQp3hIs0hkx5w+rIXy0m+9BkMkcuG97+HrriaoNsxI3xo4nNKv/TT5r5CVIj0Ah
         p3CuWT2B+qnUiNIHT+GHh1Dtnh4G1Mr4UUJjgvTllLV1JbrNnMnBLjdGbp1kBb5FUXNN
         kF51lwxSbzKaczvKVkpFtF8B5lr1re2FCsU2yX3iGdT97Hc8a3cE3jIVNoYebZpQsksJ
         sX78PYb/B5Zx3dBIRk1u1aGtKYXawSlPXtUPpdAW9cV/3/azvJ+y/EeoWDY596uSUm12
         9R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420200; x=1790025000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=DNOhpxCbnz01ZJRo7dlEr0XIM2MnTQH+iDN1Nr0zf1QNZkfoJMpwu6pwHIWsRtQHoW
         5+7F2t/181YB9JoR3LzjeN8o1ktWA3+9WrKaFxShG56mBJWwz4MNj+Q3Viz2qn7whz3R
         R5QbZnsq4U6rvW+zNZphHRmJkFJmmWNJyddCsH2K3qHezwEuDOtnxGZENMFpCcaUrq3M
         CmAxppfLAC2ZABZVIp+IJsvyOUsOCm/KHOpN8Q5Vte08lETanUv/bSemK31g4fRhdjh2
         u+QQ3Mr1gIMZym47to4NCfccnj7CrJerhYFx2a4Y4pGX19BiVQ2E1XSl8Il+nDlvlXrY
         ZTww==
X-Forwarded-Encrypted: i=1; AKwUvBxSYStcBIwM8Kz9E9RXCbS26NrnxuQZXwb9HCylDBFS8jobZCjxFc5Gqy8+uksRNbZ1ztFf/59uKI5skgKIOSCf@lists.infradead.org
X-Gm-Message-State: AFuF++lggNxVreFDk3BdToE87brS2ekuUibo9QPrYo5Mj9zhkLAS3Ln2
	yefLFbBffkHkUuto3TGEKlBlPQhNZBnWHVSEc3u+gzwKzJzmjKN/GYS1
X-Gm-Gg: AYBFou3XDHpGSRz19j6ugpb4FB0DK/ZftRwRGdOSJqMoShcb5EotocujsV3L41iuYf2
	zeysX1az1xf6ZR6z12PdAjQfx4qV+tdsKlaWnRfE8x3uYIqmr7MrlM9XMqIglYcbz78aIL/M9qM
	wcwNvry2+W7V+0TOh1N0hXayvmU192JVyTMmqf9lV9qaaFd71DZrYshXMH+Wfhq0FCCl76WQWSx
	R18W/XAcfXNMdZKLzCv+lCwnJAy9pLOwdMfD+vayqF/tdiaV/Wbyywjv1fIvPEbagXfP3eYDT8m
	qp6y8WEmVCEMJmIK65FHW15Km/XvQvO30ln1GbKDhxYIoAu2adpkNAFxmo5SOEykNNGAGcc8aO2
	RJnavQs4ZRV8xtQHoOAwoPoaFqvAde133D2TuPl8DIOC46RsfJm87aXtAgAMmwZSDjmkRHuny8v
	DmMvX2WCzKta6u2BCeESIouvrg8SewIyZs24cdLy7Ko2WpmROMTFR6KvAm2L2FrKoWLM08ih5Ve
	3MY6y3XL+vsU9QIG0ymAHpId6Lji8ygShm8eWutpEn7V3YrTAU5tLrZzfxJqki+gMlNxlZyVch6
	Lel44O48YFrMzLyywixbCOYTUFWb48YyX1fSrdoKrXyf3DofQCiggjBmOHNG7UidNMyxzsRnqP/
	H8MX6dsj/NQh/lJsJKAm5di12oXye
X-Received: by 2002:a05:6820:217:b0:6aa:ed21:6c95 with SMTP id 006d021491bc7-6c53c6f60abmr2434425eaf.0.1789420200643;
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:50 -0600
Subject: [PATCH v6 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-4-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141001_621219_D2AD2E39 
X-CRM114-Status: GOOD (  14.65  )
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



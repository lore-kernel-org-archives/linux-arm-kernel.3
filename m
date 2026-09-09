Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E4C79FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=; b=kNOLvltrt2QLYxTHcjqAGw+2WY
	8gZZuXlgbkGFqRa8l8QQIMzhdRndzpaJmYYE+9BjVCsq6dOO9OiWPMAw0hFIsfp0iC8g6KQXpUtNa
	9ulYY8Vd6dqE4QB4ltfEAinK+QJC9u12Ni0wLkt0Zq3zcuYGy8njNsMo/12vxoxAlFNn5EiSd3LuY
	sM5frh9sHMIXBQddN6LKp9h5J8qZhCMutYlyXzNonQ8/xOksgQOtuIeTXVQcdIndXUHkSBaSTgnww
	JJRPINNd5FlQuuRczSEh/GtTMKz+Xjh6vaUfv8rBMRlwm4XnMQgEBu9uTBvJFxk1/A6sD12Lug0B3
	AonBLsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhx-0000000B6Qw-3zLV;
	Wed, 09 Sep 2026 08:31:05 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhp-0000000B6If-3G0e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:30:59 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae716890so448702eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942656; x=1789547456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=IWOyBc6GSyf8vB7r2N8kGy2H5URKWRA/6ZWx8W8UVsVYhQvSwF5e8+yAWdk24ngZRz
         f15Z2LiDBoQmy9q4LLPoCvnDBx2BaFk/N2o7y6ZOPGvsg6SZEHQ6k7wQrA0S2cWdGmzN
         Ds9cdNrqukEFEhU1A6YOlyX53eAwwjNUmtTQXjd+anchnr9Mu7vcoF9gl10j9y4MZIp7
         yajyV1QJRCAHVO8FfMjdfke1r51PdeKCcdSw90I3e4sadLvh3xK0K4ODUD63+H9f7PYU
         3iNTOLmHH7FijxZg5MLgcLtYHgzrbUgkLCjr2neao20HaqSJKxBgsWOhxzsS00QqFhSV
         T6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942656; x=1789547456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=ojcF/p4kN+je6m/IwutxSzwmJwnBBlNOUKrs3qCFMVjv164ypLiOgGu8cPi7wKTLG9
         3OR7GplAlLZEqXQZW3dTV/7Z8vZqIOA8+ydZxlU/n6b7xZUtw77ZZoPcrBfaGhi43QM2
         EiEoMATwun3ozc+OgHjkAslVrii2YnvW+aPFKmuVkzYImuS0ylcL3t9eXcwBVsVoXkQ5
         Qs0aXSubDrkiaEfQuZ7+4Ssz5Ast5TzhT43HR4CtVayh+bQpby+B7QMzslhnoyFtXkWP
         8oQXXd3hF922W8uK24oNYuOS6zp2ir5eVRv96lfIZYCrON7SyLkiol8yFnRr09YKXmuI
         bV9w==
X-Forwarded-Encrypted: i=1; AKwUvByga96FN8ysr1Pso4OnXjsJsEZvPFPMOYsZLTlrQE/ZK89FO5k+t8M+a+rcBVh/KKokg0ahH8FGUpn1JimfMxFN@lists.infradead.org
X-Gm-Message-State: AFuF++kUzzECzqxO9rC22pG9o+gYv6rbjdxNpBhgghEQoTRtlAL/66bl
	2Ra135CdKzENNF0140LCdFej+YHd+OhOWXf8vIRDs9J7q9ZDJDyvkvtv
X-Gm-Gg: AYBFou15xHVJyWWeJ2mdDFoEefnu0+8OlE9u0XW07tjwy04efWy++27xNB+19BIVnu5
	Mi/FWnuxiuiQZYeOhyghBErQkd3GEs/ZL81YGQtReVxqD0I/ezMnv8QQJTI+3t+EMHBcRnEETcy
	K+sr5gUITQSJnCC6kL2nrDfGe9HFEESSOAN25UdY0yDHE7p6rdz75eAMNphARYk8OQkrSqWmrQo
	pT6kTvXgsZcTR+NC8d9QWrhdtS8X+D+824vdNLcNF9zf7TM4Sajn0Gmd7b3AeWZuodOYEKT+gs5
	Hbot6M9bW6Rm3N4WzOiqKd7ETBWXVYrXB7qmPOjFuXeVPj+YxcNISGLGefH99v3fmcBVqQ7HVxg
	0mA0fpJch80JtGE30QmYp4exADP4gkibboBtFb7hsihlNpwJCK7Y7/e0IQ49zS4uecHmtgTc3hJ
	Py6SSxoE0uetrsYhhqnPmPTBrOXCyRi0MjmvsKEznq6iEtaNAWbE39rcRHw3uNHAqRCMhTvDajC
	RpwZsYLkEIb+HrMNFcukKCmalL6AgkFUu2IB6lc5ApunX3ReIrNj93oH8EKKb9pRnhRZJnTVYwK
	pI/sROlyKX/uHp9qFN6/hIUe70hyMd1crrZ+NxVTe8ofFnENomFq07z2syxABgPxZ6Xwgu2Emyl
	fZgIG0es8AstPkRD3sJKs3MON2S+N+Vd+Vlipsec=
X-Received: by 2002:a05:6820:61a:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6bdca848f71mr4429570eaf.14.1788942656520;
        Wed, 09 Sep 2026 01:30:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:36 -0600
Subject: [PATCH v3 03/15] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-3-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013057_884886_F5423E02 
X-CRM114-Status: GOOD (  14.71  )
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
index 5190b39aec5a..af8ba2d9f7a0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1598,11 +1598,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1617,14 +1619,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1638,11 +1643,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1658,10 +1665,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1700,7 +1710,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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



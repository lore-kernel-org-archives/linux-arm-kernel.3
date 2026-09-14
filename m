Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961EDC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=; b=jkGy7CZPzIYWXoxyvrlSLzGO1k
	MjNUSYbgKWkaN0lexaivj6Kqg8/MULfEJ5XzW8rEZPybvb8PBjAYUTn7bpoOyP+aTOsWJC8qMZ++Y
	6KNjPKk4jo107bTA4e8V0zMo7yv9JzZ5SGEsCqRH22sykqSFZet6Jo7RFnHA24OBK4hppzxHcu94w
	fMA/LrpYvH/+w8HAZuzGrWCuO+Xx6ELmi1YZnwoyPiJjC5P8iua23pBt+WaztxoDq5PLXDY+Ti3sN
	CW5wLXJQmv7+q/1g2sd+phC/VgMCgyPADRyUsZGzwLlBqsqLmkHKruYNab4kBeHXJcu8oedB2HmQ9
	r7ulazBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxB-00000002CuE-490b;
	Mon, 14 Sep 2026 03:01:58 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx2-00000002Cgz-3rnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:50 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-8050801d337so1103213a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354908; x=1789959708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=fco/ZO54RgOqUk87aSoMCHiQ1+H6DFyTO6F194MKtiDNHwETDKg2ekMlg2J505QZWL
         jMvUd4SG299eeR4usA8HZbOZqoeLt3rSrPMO8gCebxoZVqxfKqrYVx2MVnyM0syBebwv
         LWWkzIzcWHxPiSgpSEYJWiEGeATnJZHSplMuTFdoORpP/86EUflRhO4tgnaMa17LheNY
         8FPA09ioTqFhexCSYFpa1KyY56NaPL7nLcykchTvNzrdHkEO/G1qNIaOd5zBNOEBaOAb
         gOvJX4zDYTwrlUEn3jL4crF0jIHCsQe9ClOloSLhWws/5pgkmZSplVGteTDkxDMgZXY6
         OwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354908; x=1789959708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=bCKxy0/w3g1c6TcmTLeL1oMrA1SdsbtkRHzWPngavmx9yJMuytbpn/lV7oHeFx2Bj6
         4VY6n7RwaL9AvnYZtsQm3Wc8BVi7Rg4i3NLUuFfZDtXd8pKpj0lVDuyyedgYpfoyGLFq
         YBs6r0mBKlGoMcKcND87nOkspKLVNYVZHWdK7taitl+AUaa5+nNLX/1H+4c7WqIOKnE5
         3yoRVPEGVRKKZeQzJqONUdVpVI/6pbrZdCIc9WMbJBYUinKGgblzRvElEuQShX3Z8CXQ
         tvZcwxpXkecTArjDL98d/N3dLvuSsZbIbMSBcAUgvBBFwrLY0nKUiZUWeX7St8Csdq+7
         0rUA==
X-Forwarded-Encrypted: i=1; AKwUvBwU1MGERzOChlPf+u49AVIAzftRavghlzm2kEd2ZCUHNboZREsijlkLpOlMjYFGOKKeIsNVYbTRSElEJPidktZY@lists.infradead.org
X-Gm-Message-State: AFuF++kyQMu8cBSopQXUtdIOdU9qDovb7WqgtWu/8tMTakGsYceAXv8o
	+ymML6rEDC6sOg0qW1TQJ3uj7cSeIFOrj0yZhIlqJ0pQGSFkLz+QHhig
X-Gm-Gg: AYBFou2QneI7VDmmduJ/cxfnNU5aWz9Ne5vc1dxx/VSu1m2KRpFEFUEpmjVsgpAMMr2
	7Bhwm9SQIjB2ckUj80fpvxYbY5lMpA+NNxFZ39kG9rQ4D4KLqlZyQhppOEG2kFRlBquVLk6abGH
	SQWr+/77iHcOtn/CMaUCw0N9JHoUzVZmLai/Iv6TZGgEyo+bMcSTj9QJJ7yZxeIrIwCwXCIAlmL
	2rbxA4eFPtd49zy3qRqz4SzNT9ftszFtoNEv5UzYVkDv4Xx54UjH56o/l1/J78kmb2FoL+/fIbE
	taiQg9CJ1PFJRhKMWKiffUiBlqKrFeTsC05O1hGpslkRWFzrf/B9DgbcmCjN+QJ1OjbQalsgFY4
	nuszNmz19MihA3M/pqABvkfmy3bDhZMsH/kF7tmQG5LQ9z22c6F4SlKzi2JT7cBi0ajuJlEu8Sm
	+C59v66cXMGHNWT+T75Qj4W3zUUJkCljOaWHFE+Z52aUXdt/0dQ93VOgt4KloTmZObmEEfsHXYA
	gqdemp/Peyw6SLq2pFvCJEqaga5A2j5Ja5mW9suTVxJ1MY4vBHbqUouCe5gLbnQqb/FpLZC7Z5Q
	dKJ64MBD17uoU688Dvg0qpAI2k+PaRk7TBfrbOKJTY8TgIkKnkQseM+15QujA8hOSITCrvhJxyf
	pLx017sr2XHCLLvREfXSKeTEfDp7GWQ==
X-Received: by 2002:a05:6830:4c18:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-80897c868f2mr541126a34.8.1789354908010;
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:13 -0600
Subject: [PATCH v5 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-7-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200148_997397_FE561AE4 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: stable@vger.kernel.org
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



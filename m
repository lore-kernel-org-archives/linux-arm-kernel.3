Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A2C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=; b=dGRjVS+t4J84fQPiA9fICy5tup
	KJ0lpZjCZF/vim3A+J4dYylz2+bAkb7EVMegGnoLC6YFRitNUBCyqoRNr+c1cP2eDuI4gCOYO1zOo
	2fyLvCW8gztQ/Ls65fA2p20sXWL0t1IT2e6lr4ttAGj/r59IhrcNFP8vyvzQweCxFIVnDh4OC7/H1
	mcEZRZqtK5rMkR3LKEKHmHhzhZMZIvfwptUhku+ksUGd8m7ccAVHNRMv2+BmzRgcxWUsyPQOy6xIc
	Q2hRo2U3y9eiX7sIexitQolEISJ1dZCcDgwmaaR4eN0Oq1ayYuJkM/HSGJBwFQtkzumD8TTWRuDaE
	jfEd3eHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bU9-00000001Nxm-3AQA;
	Sun, 13 Sep 2026 04:06:33 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT5-00000001MTx-1nuP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:30 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4765ce0573eso1370184fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272326; x=1789877126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=d4sUDyhTAsiLWloRjIeuuIzfsVEWTkAUOsbN+8kU+ssoOgQ7acc9OVWXYKnK8sKeRx
         c8SGSiQRjX6O8BqJBwbXU4o4DiPH12ttG57MeZJoIYlOMFpfAJTOtCoh/LBx682wH0iL
         X2prvS+MghINNSQPhujWWAADGNB31rNvacfHtNKkRYChM4tNGUw9yhQ6QGssCqhLFjzq
         nzBN1fSDw4wSLwatw/u2VF2VnK3aZeG2txkvvNYawzTwCazzbIkBB6gyKOaEx2eVJRi9
         G+2pzds8O+OUgvChNDZ0DxpmpcoH/asW7FXVNt9oP9XHEBgV9mTULAMNCfvkQ0tz9aBC
         Ql/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272326; x=1789877126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=MzQEJ0rjVtbWzKQco++RnqPxaLglhRouuwXoNjx/zgP7Bf9N5RQ1lkUOo/Au/j1yDY
         fOkLC0hcazy92sYwTRfhQtaZ8cupknuAnOkbyjxmPhAqA4skWehRANdaytxZQ1ytzvTj
         RsAzi63pjFbvNCEQP8GApop3sah89AYs+nnGyUQj+GGGiaLk3HsfQTU2y+/2mrNu/cnE
         p+am0D0MsYFx+0JQ1vPekHGXK2t8pTwYKO7hc19zKuknpes8ISDQnU2FP2F4qu8X0b53
         RFUfUTCEDjkbCJmQBHE4/BT/cDE5xwdE5pfaQ4POOzoHsXTVOZrXSYj5DLF7F5faHjhx
         t7OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhhmslzsyxgNaWmPFQyyMrWXNIsXHcH9C63g7EBTZ0W4fltKzUFAAeQaNDiXuRGCUP9ovIHHEipdwPcledQ/Gr@lists.infradead.org
X-Gm-Message-State: AFuF++mobNZseMEoyF3VImjLeHFbfBbcrl90FKJGnLH2ma7LrG9MnrHU
	TA2Ii6M1xI7ka1USZMRrq5w57qixsimLpizrBaL3VDLbFR0LEfkjlVamBx0hpA==
X-Gm-Gg: AYBFou2pxuNogAo6i+OdEgQkrv+B4vQkemlJGmmSnn7HCdJUZ5S0HW8cw+DrTs4DNK7
	vg5Kg6tdlAbpp/oNAEwBTypdfUP9qIOTY7kZLnBjYfOkErIJIdYRnef2AubMbRUJ/0bhtx8hTM1
	J+oFXRjnA2MWqjXPRwBLp0v4kvhgQXsi2dQOScgAj263xo4pWuLI82e/9ZDtC+VQR1AroOnmgng
	fn7QXDZ8yHNLMpgztpTYnVKWJf80HgOpytXq08MBi1ZmnS1wTGz4UMOrqN4u+GPUYehQ+FQ4e93
	Z1emCNRPaB38wsHYaVsdKBuHaUVB/UORDXRnSvFQ9qQ+d0SMRG7qbSrC/hdvmEmzY8oLCwo4qw6
	8qlpa7MYpfCVu1R/ACif7khCM7HAP9fr/25/21fXmLjQRZQtsL2XCfpKlevmnZwnsn3aG2C3Myf
	5lmxpRNC4GMmt9aZkXWSgIsSI2afoXf3D2p00tw2E6L9yoOMKAgzjebYaAocJl8okqFL3eZT+/R
	1qcP1L7/ynduS6OAxnt0z9n/Ijqa3/5ngqzmbCTUmva1yqbb9S438s3J+Woy3gSGH/iNMBQJVsx
	Yf16kam9NOYdaSO0jYlyUQBZsFxwN0V1Aw8gP1gYdzueOhjXVGh1VnwdM3UZJ6tFiE6xLi4evmN
	KApM+oIZX7IgyZBnVUnEONFnFV2BeNg==
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id 586e51a60fabf-47deb6b21a2mr8028318fac.37.1789272326342;
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:04 -0600
Subject: [PATCH v4 13/17] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-13-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210527_876853_2641C8CD 
X-CRM114-Status: GOOD (  17.56  )
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 97a4b4470dad..5fba3c111a4b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1424,15 +1424,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1443,10 +1456,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0



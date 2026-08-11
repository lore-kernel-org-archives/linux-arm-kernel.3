Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E029C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=; b=qjFgdRBbOSKy4hLZgFlTQCOkj3
	nIIBCZx/DnENG69RbVsXP25NfHoOn0/eeVF1q4/oBjmDDwdOnQEpV+0RV44WIZTqvX1s20VsNZ9/A
	y63qAPxexIWjptnNObQ+6KpmLs1w1xltl1FSPOZOB8oKrGSJ6LSGVI92WbHfM9mO/UkZaVQjXN3ia
	7otam15Hvw7D1XIcqjY+3TWhS8iR2jYs2KpKJ18dAhAAURN8TA0IggvvGY6bZjxFan270B1tsZ1mY
	xTi49VGpnD0qFVAz05sqGl5zllZSIRg9ep4e3x9Kqa6GspCZ8jMW3cl9WsVNsXjJ9SsESTK0GOram
	F+TTEM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ2-0000000DMTJ-1ubG;
	Tue, 11 Aug 2026 06:02:16 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYz-0000000DMRQ-1I4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:14 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6b04c0b9159so1506534eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428132; x=1787032932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=qkAlnc0FG3Yf1QKzDi/vWEW3heA5HL5C3ddhrv8w5MwTdSrO1G5DmjsK0tDmzZTln3
         XM7PNRweCn1lB6sd04ami/S+3f0kJYTOez0Hh8Ov4zu9iPIyeCN6bbIQnFjfbkNNaigz
         4z6x2dvy8So/VpjuLW+nlbuWRakyhaxyfBCxjMtrs2UkI7fT+t8ajVCx59WjQAuq81Jr
         c7Ago9kQb3J5q5bls+9hRdHi7pZKtoLtaPfxG4tKFRWcqfrLsBIrFC0OA6ctT6Ch6ym/
         gA+5lFFGSnMyjcIcZyGvMA+5fPUUoX+0kONpKqq2d8si3DfZ5nV+0mUQHehZSGk1rcHl
         WHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428132; x=1787032932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=MnLn7eGlEiAJtM2fq8RUBJcYEV0w7IejiTDOSsZ/cTTUVebOKcaXw150rdnxJDd8Rv
         U6R0zAhY+8sLYA2FnjKRz8MbYqEryvdw+8GJ07QCAFjHQ+hvfOrZYth/z11qvLp7hso4
         PdkNl/8r9fudoLVLDi34UfID3uMiI+/VOAWaGUqnUSoy4BqWDPxeEsJHgc1CbzDN7yDc
         9uuSXHdSS1B69j+hE+aI/yJJlSIeaoBBrOCn9vKg4ElWyM/WcZUfzxS3gJFUIOp9CWiG
         g05+rVtMnIli+eL0dIjzinops6+06gkl4sXLhlde0qKlPCV8fwgl11WS9ZvKdpgYLnBx
         W0gw==
X-Forwarded-Encrypted: i=1; AHgh+RrtQ5NxL2K/HZa4EkExZoAx4TDacByIlf/Hj9RZxzf67S2iTrGNat+T996zpOYBPRmr6Q918mgMYiDbtwbABYp0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk78e17hp+/in1JjxSjgJc15XN5x6VgsAxs4xgCjtBWmX7VIdj
	ef42z4rbc7sFWO5uJYyFvRflreb2wCKBrO5sLWLb7Q4CjtJQQaRRk9A1
X-Gm-Gg: AR+sD11CoyDnLHmP6/sLNg9smZ+lxTawkT2E8z8kZDj87YTUS1G0jZ+Ry8Gx3/wY2Ue
	Y2nbu5FATao6Lw3FdmZG2nldfuK+jHSP9SKQtrJGXhjjFjGfFLPvlWlmKhqyScidWl1WaIWLzV3
	4gekG9U+TZLM6xknvr4/fUXX3StbLEzHRLSiuXJFYwrsoLlI4YLYwH61VyPkAEPowk00pKWtl7f
	MMdoTc2S/gHRP1q+sFEunFz+P3oilWZ+w1twp0pLbuR6AgVGdZZMiu0enzyTLCREdozPtcrqUM5
	IB2410YR6nISHk9lNA/sb4SmxM6SphrM/1zL7WLZ8aTBnfbNd0HpbpczwTyBlTAjzB3Dt9e7vjP
	0mZZOYOxiCZwyHLYUW0EEdRYt5DwwDMjf3C0MhXyxFL5PB2zBHEavh5rSnBTNNF1hg5OGvK05f1
	Tu7OO4PN1sTK4gHjLvhGYmDh3qCmpZb56s/Q8a/AgzASSwA+2N7aIV/cWcHhFfBmN00pd+3bFzM
	khkIBGsWTQLE6nxqEiSxE58Btyno/jUbPfh5+BW7Vf/ssTKIL3HzFhI/NWcGwtIrRjEHSJes6RL
	u+8I6nOb3TGvc05LoMzOolU6zdcdVtdhiV1oQFrjSmJWsRRxLOlGiDSwt+X+c53WjSPOb4Lw3Rh
	wBwVLgTWxfErCB4Ml
X-Received: by 2002:a05:6820:826:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b0a31724c1mr316204eaf.13.1786428132448;
        Mon, 10 Aug 2026 23:02:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:00 -0600
Subject: [PATCH 2/3] mtd: rawnand: sunxi: reserve a full user-data word for
 BBM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-2-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230213_378755_2B24720A 
X-CRM114-Status: GOOD (  19.21  )
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

H6/H616 protected user-data lengths are encoded in four-byte units,
but ECC maximization reserves only the two bad block marker bytes. A
strength leaving fewer than four bytes therefore selects a zero-byte
first user-data section.

The OOB layout then subtracts the two marker bytes from that unsigned
zero length, and the controller has no protected user-data word in which
to store the marker.

Reserve one complete user-data word while maximizing ECC, reject
configurations which produce no ECC sectors or a shorter first section,
and make the OOB iterator bounds-safe.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 108161fe10cb..01a0d0fa7b62 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1991,7 +1991,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+	unsigned int user_data_sz;
 
 	/*
 	 * The controller does not provide access to OOB bytes
@@ -2000,6 +2000,8 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
+	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
 	 * only have user_data_sz - 2 bytes available in the first user data
@@ -2007,7 +2009,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	 */
 	if (section == 0) {
 		oobregion->offset = 2;
-		oobregion->length = user_data_sz - 2;
+		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
 
 		return 0;
 	}
@@ -2041,6 +2043,9 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	int remaining_bytes = oobsize - (ecc_bytes * nsectors);
 	int i, step;
 
+	if (nsectors <= 0)
+		return -EINVAL;
+
 	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
 						   GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
@@ -2056,6 +2061,8 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 		if (sunxi_nand->user_data_bytes[step] == 0)
 			break;
 	}
+	if (sunxi_nand->user_data_bytes[0] < USER_DATA_SZ)
+		return -EINVAL;
 
 	return 0;
 }
@@ -2103,10 +2110,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 			bytes -= total_user_data_sz;
 		} else {
 			/*
-			 * remove at least the BBM size before computing the
-			 * max ECC
+			 * User-data lengths are encoded in four-byte units. Reserve
+			 * the first word because it contains the two BBM bytes.
 			 */
-			bytes -= 2;
+			bytes -= USER_DATA_SZ;
 		}
 
 		/*

-- 
2.53.0



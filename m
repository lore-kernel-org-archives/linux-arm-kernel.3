Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87294C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=; b=X1aQ5niQIyfOZUd3j87T+YyWJ1
	UKWNHhnyL2H3Q6hTlmGmtq0EwKY/NOVKUpL3d0BK6XRMjO1rinjQDihVPzXSK5YWPhBifVV+TEFrv
	uiwkeQ4whvLAxrAUXQKLze3aiXFY5si534NgnAcLIVLTMC8NIBCtMmOCjRmVx6cmBOw3NW4qq7lmS
	YiT0sS8iiMU39l25UOR1w8bR9otJoRE1AKWgiENO9V7n8BKQnEXyqC4qAyEPgyJQAxonHUvwXSsFi
	3yha2BZfCnZzLSHJTS/6btPFls12PIgfsdEF7TriXC1u8QvyOi4xte9A/kkNG/f55o9YZqBqNzg5U
	lh/cW78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E4M-00000004iBv-1fs7;
	Mon, 14 Sep 2026 21:18:30 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E4H-00000004iBD-1wQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:18:28 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb76c9df1so32827311cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420704; x=1790025504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=QPOOk4RXbPppIyopPnG/GtON6FB0gJuZVy9Q4DdsakHkdbDL4B/h1nlaZPvJk8t1n0
         wskQgvNncDdGJqvwaWbFzkWdFM90nuZ+yVcLbbdGEKfRHG10bcO2FDq30LVHCn6dOPab
         cGus0Wb8sIe6KdHt7zcQ4kFFxZiNXkKAG38pOArqs2s0EIbVOEF259rLtkEhRzV9cEli
         6vNpFVkhAtbz6MLhCJKPzBexnelVEYfUf5gYqQ0daWk42MOVlSm2yz4qV3kf4T8JDLBz
         Z6Gk4w01FErhZRNsjYZuspYmgw7ZHlpiCGRYRbJR8IWVIM8pYFVgWrasuECBbcspIRgP
         NeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420704; x=1790025504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=uFUCMwDAe/ta9WQfXwAJ3ZO2bkVtiXOaf35Ljh5FhBhAoNGJueZzeh86LLlMIGqcoX
         q2iJshwyrNYY32WH/7cQt/f28xoLMmgIGebPP+EUa1f43V4UvGK509RcSAdb0HD5iL1p
         RyKkTsfWtOTyIKEwGH6OvjyzvTh7C7NWgA6laM0sti/+rqrm4fep59e5vJ0vbSUsm6Uy
         X5O/NZZ49yThL7AgrVs43APAAXr2LbkQn1c8UOoRuUlAcSRJj+unDGzPyhzUxrXPw3JK
         IYVg6wLAV1yDwp5W3P/fMO3JvN1V5c6Fxx3YBOI6RFHq0Mg9zDMaTNrAmg5fPrv9W2Be
         nCmA==
X-Forwarded-Encrypted: i=1; AKwUvBwFSBc9XcVjn9Uc1qV5hWKsdFnCzbA4moQJbQd6A0AzBDCPY0gAasrMeLbRLY2o9ZDuvNS9bk8UNB9J2H4f4T3B@lists.infradead.org
X-Gm-Message-State: AFuF++mAN3nZq4g+F5awn9iltT00SzGELGGiH1/PgyajpVRN90gvr6D4
	dsHXWQ/KPTzMugU7L35mtxkCHcjQdDCr9DcTrBLbGaxmL0qkM37L3sVI+ov8sA==
X-Gm-Gg: AYBFou2BQ+OwxZEKa6qpotXKJefaTGrybNovLEUDPyYvzrylWOd2wW/j9NIwZFkpYNx
	3qN9KmgRmvNcW2IUl4TOU5Axozw+4TctzUWIg0guEe4RO32qJjMsa9duT42rEkBz7oK6ioWev2v
	o9mx8HZiC1btZKMD3Tp+dcO3ZNtU0+IoAc6/SIA/PejJQbvXtEcEOvPXBfjWhpI3U0GRHiJJ62S
	QENM5Dl1WxTil8vRmS3Ni//QEUaDT+EiZgHr2ADJ2rjJMraLXuZW40DGJE0QjoDb3ENsaSDxXy0
	eX3GG+yksjaCRkWTiFcCsNEaAs41FsfdZJwyyVA7c7fX47bY/+447Y2YMbGdIS63jHlx2+ZK0Z/
	4p9RlASTbUagzcQnSosFpnxPwjOhWNd0lIv5LkWnqXW+8UN0ww+YiW6QQjhkgji/n2F2SyQZOC6
	cEljwJ+YVa4oWo1EyZD2NwSb6afhnhg3/sFFZFIf03WFKjG5TYsKynk7047fzDZ88R7Bltu4yJp
	mDSZv0+nhYkLk29rR8EHGnsmTZh/OGaQN0sZ/84DrFw2tQ18Y7EvKMKsDyH3dXq0QgE1uuVLwrk
	9vYEjlvuNQxJUafV5VqTdH79FUqF7Bqlvw+3Q+32KJuZ2m766qoot9jD6FM5QsFDh5hlCfa+GBJ
	SOIxvbwh6qNVaudRaiJQ41x1ZTfY9
X-Received: by 2002:a05:6820:8c5:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6c53ba3546bmr2248641eaf.0.1789420215927;
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:01 -0600
Subject: [PATCH v6 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-15-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141825_520275_29A64E0A 
X-CRM114-Status: GOOD (  17.57  )
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
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8b0d0620e1d9..f3234d2831ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1435,14 +1435,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
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
@@ -1453,10 +1467,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0



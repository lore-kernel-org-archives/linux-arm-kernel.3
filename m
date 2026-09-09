Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB4AC79FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=; b=38cNVLotbLUVY8eD1t6bOJRKrs
	PrqR0Cheih62U7iAUxFGzbOPSPRWVCpmw0zupcMGnUUhZLnKxqkMjp8b8tMCi5HkJD96q7y4BEmlc
	LS4PkyNR2BRxEqjfuc+9/V9ok0erprAdtkgxmnFGRZ/rLCcxyWbZeRB2CdajHCHSpadve+FM5tNM2
	Xk78rKCcKzDmi9vdy6W8l61WBxkgFG0mxBYtCkU39aAYIj9Z3/hc9eHf5DW/8y676N5dOG9DXAUrV
	dD0QVkhtizzWXVtfgepm1LRFLHTL82HI3mmP+CfWWNmhl2cgzeFNQYBzjYZ/0hBCGvfcU21vgMT7J
	O5EULO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Diz-0000000B7Pg-49nV;
	Wed, 09 Sep 2026 08:32:10 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di7-0000000B6Ux-2ZMC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:21 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f6617c7536so2429318a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942669; x=1789547469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=HvvWv6jktPafDuKFpvE3/Y8IgVBHD1946bSwqoJ0LKm6P3+bR+W5uuKimV7DbMbAn8
         vDkq/T/ANGvq5fQuk9LvzFMDszLOE39ds9oOkUDjA/WyTEhYYjZ6USwhjSCU7hlUJXvX
         GNUTXmMEy/HcNkWzbC0q3GskpqIbOWxgqjToo5ko69Wk7SEWUWNAJQSP8Ec3ZzcttQiu
         5opgcyPA7dohbBv/QxWuZkjVU/I5V4EAcwjV3LihuvbnEl6jRttuwPz8qrHjAGa/cSmC
         6JQQGyvIiIOrdOukvy81eHltTDxtS0/0D/B9lcvdpvBafIeFHIDrZWm1NUd5NZxIlRxZ
         HLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942669; x=1789547469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=ccRBIGMhide+fNW41+ZpcRN7+aMrNBuVH7QIuZ0Q/gYIHFGNhIs6iepKPepDBrRhC2
         4qDctN0SH0E31fWOzoTFxAC8LfIGGXgbpFFpY6whrtLI0KOhq6BPj/u7kanfkfy07dTc
         rlm263fPvpcmqhgAqXx1CfXIzceTSM36A2CxSl57Jg8J4rGTIYqlHHtfadNWnwGQJklC
         Vk2+sZGqKF0CmMCcEzBeNKT9G7tE49ViOMGPFxoDEalugl4hMsUtwuRFulP9yPENHMVx
         0D9OZK/mb9SGWIBYJiZ4cFPgqFRPrsXifHzuVkh4DzCwJ5QFJbf7GXsCzpJR7I4qWMdG
         SQMw==
X-Forwarded-Encrypted: i=1; AKwUvBweuWOmBp3H6GO33MlujN6sY8cxzHA6JOQOP4FN0PZiK9OK7pgQGze3Zev8V5TqlEhmeP2VbEKyAc83VhIvH2XF@lists.infradead.org
X-Gm-Message-State: AFuF++nQZ/LKySJuoOqt192sVIqHaTWzQlGQt5WOHP8mh2yD64FA1cGb
	Hy9rNnGVN6Rjwr6G6W6eJmlCj6cNDECbvnfWClGikUrTstQlCJbWBi0c
X-Gm-Gg: AYBFou1YtqQYN3rPZdxv6YMDsjQYMWcAnMhncfVUzynICtb/9JECrW+oipG4wIf6SwM
	GJ5OIORc30ULPRLmEXdpZgTPuGVYMXB6RiQnbIDXUxhGciENc3vZd++KOGc0gwg4qeCJrNAohsW
	93HkKeWPZV6ggxQBUyK4QpFPuHyhgwPgi1BH+hD70fZhuxQYjX50JA6lB6SOBQMnLjLDjf1iKhQ
	dvONDinHTyqroo0yFbf2SA7XjHFKKRgvEx/AnZgn9WfEvG3IjMsG6ZkddxI7PZwQzwsPoD4mF5+
	fSToPv0ijHjsxN9Mak4lVWlwWwtUw+/cx2R8vnWsP/PaZNQlStmmqlO9zCeuvhRHuGy9gOMpjZQ
	Oj8uwGaP9SWGMRHvWTBNqu56ylYgk+Mhx1uVqgHquIRFbnoqHBwL/Ec879PKsnSEEhuqy0I0ntj
	byQoEmv9UGEk4wY69qxlD4k9I8A36odcl15Ge71/dqHs519blS4apDOW8HhePsT2P21t47gEKmb
	oKHC3ZOololz1G0C2eaXiDRWndqSxndpsx6uHqTYDI2KwDLY0MTg3l3J50OVkXhL6Vkza3tBGEt
	NaYpXz7LJwRnZ2rbj29WmkMZcuSVpkvAKG1sanZ8qg95UVISq6aK5GjDhQQxpeAyvAOYvydVXrr
	5JqhKEzuNlZ+PSLf0E7i6st3kqIyP
X-Received: by 2002:a4a:e909:0:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-6b6fcfd90e3mr19776294eaf.24.1788942668737;
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:44 -0600
Subject: [PATCH v3 11/15] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013120_354963_4D06C3BD 
X-CRM114-Status: GOOD (  20.75  )
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

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 75515ad276e7..6e54d3a92219 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2348,8 +2351,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2365,6 +2374,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2425,6 +2440,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2495,12 +2514,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0



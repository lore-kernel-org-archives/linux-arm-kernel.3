Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5DCC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=; b=UW0oDDVWfWNplsnkpw9/9+Dt5b
	jB4cZabT99B6pYKmzN0chw5L0Y829VTytcxOtvMJCECGe7yiSL4/AnX+7XAFZr5zNPUT/AcLQ5NwO
	7/HekwIEjm+skS9QPMAySC4MSb3QP6V5G/Fi1orvjhECEBHp6B1aKSkefm2NOdDPbMY6vOz3we8nr
	Zw8qud+v8v+uuYmuPXlYhG8H7nuA/2KYnqDQ/pGmUzv+Vzr7IwH44tPNC/X6fOsepj4FErVDYaN5s
	/PT/8ghJ6QwTMI48X3FoXtzC2Gs0EvHEQu5rBMbxnBHEN9PS0q7IG7/lxOP5a9S85hTWiAf8O3pUZ
	6AvSeULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwy-00000002Ccu-44hg;
	Mon, 14 Sep 2026 03:01:44 +0000
Received: from mail-oo2-x26.google.com ([2607:f8b0:4864:31::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwu-00000002CZX-41gN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:42 +0000
Received: by mail-oo2-x26.google.com with SMTP id 46e09a7af769-80032c08611so1420299a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354900; x=1789959700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=lFF1bIsb6OtcVrkCZ98pYcpTZqDhCm61LeY2hWCV4EQUsZowWmMVK3uVnDrHmupY1v
         iOqGrkvoghO4YW+EBR3S9x7YtJJW+GaVE3Hk2/yVuNAeXTwmqx+S9UJpLLBBJ7MC6Zqq
         TjhcFYh6NLcfpLqKiCc1rJJYpfphU0Rd6gZ9cO6Ng+X6SKtiJLMjG2Zybm8gwfY6unTa
         hB2TyfHwY1pF2ExZiQmfR/TAGojIUJbS+olCBeJb0fomSNPdewa6suOZc1ywqvPdYX44
         6itvUvwBuvnFCNZcIdkUx/ne/+5GwIWsGMMQIFKDZbRbqS6MXCnLLKF8RJ9rTbxY7x0H
         H9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354900; x=1789959700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=XVvrTlUrqRjGCSlhS0C8lk445rJd8MyKwF6hHdooOGNaOFmzAe2j3AjzzrrHReMbgL
         6R63xxRJNolVyXcZ402uT/ubPsNPMdalWwGW6vG6hANY+nhu/EouvbOEAFQBt2SNNk/v
         yWt1JZv2Bu6iewiWFRE4vClxDLCeO7zp6EdiDLlaAWciPCI1Hkw+fKT0K1FWpmKtgQVZ
         JZARhVqNnZBUAuKu+JnzKjugYJR0x7gD+0wEsv+EVyEmbeXPeWWBaSl/LFkdKX94ccwl
         HII2uJhE0A1HqmUXX/iJQaGV14vZMEQWErIaOJ5DbYfDKpvCML1Soi1hxbIfdBteGcXZ
         Xj/Q==
X-Forwarded-Encrypted: i=1; AKwUvByl3/0qdy6kMykklvM61z8j5Mi3xFSG/e70Ra31c7Yi9ojDEiplmAItF4XvVf3iH+U7A18YUC7Lu9OcAkjZqk04@lists.infradead.org
X-Gm-Message-State: AFuF++kXHCHs6na0R3w/SjLv8OJ6Stxh6m/F5kXeAaPhBHy9qeDXaw8H
	3McgqwJYQgsQcWxHCmL61NmH3/QgkMjebInPGUs8Azeh0KJOfK0yBN18
X-Gm-Gg: AYBFou18eG5RW5h85/N/YPwbs4Fq752z7kK8RDpgfSWqQB6BD5w+nP9AR1VpRV/WxVh
	pK/f0rz4vIPcTngoO+oLoXFrF3M+dI8iy1IdAItrFoM7dQIiYJM5YwYmM8YHrNk/AAIScKx4f+I
	mpcjVFretQmYavSphbun7LEtspqIwrslC7dYvE5Z6EbZ3BT4CDlWw/yTkQOMQzhYt+BmF30XFTA
	gOAFL9KAESO6S08d4lela78Mecr21PTWMpAzv38xOcKh7HCY1dws28Yaj3DXU+DMA/4Y2zdq+HX
	wwiChRrqLbM9sD4wJ0mPdaL9rXs3pSgSpKVnwcTSkdzpyokuM9T/Yoh3646/EHTjaNlZgTE/Ja3
	e61m4VWjJWEM/2+Qsa7Y7ELW/LWZvyIpbIV8bf1THjOFHnpQgdlzi24DMED/tDE+ttW2V4VB+Qk
	XwDAiFsMPEXitHQN24JFUxXQ2iWDuNzRDgLEg+4dKOZtf/3q4xoSFxDN3Mo2VBLQES23qPmqk7f
	KRfzkXz+/32KQctD+MrSFK2EZVSJNekD+mdlkjxrN+VXl6nbsOXsyuFPZHTBOl/cd1ugLYpG8Fz
	oFQtEG9s0OvBqDtQTYallxwWVgoJijTGm2ds3JrKnfrQqfCnBBXAxI8NSsVLo5CGS1Eq65KXZ8a
	4wwB5sRS8OJ28HpeZY4R0qAxjf8fv4lM=
X-Received: by 2002:a05:6830:3892:b0:7f8:4ac8:bd2a with SMTP id 46e09a7af769-80899a529a4mr493322a34.12.1789354899758;
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:08 -0600
Subject: [PATCH v5 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-2-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200141_017374_FC9CADC8 
X-CRM114-Status: GOOD (  14.21  )
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0



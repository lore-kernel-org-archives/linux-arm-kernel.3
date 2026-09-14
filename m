Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940A2C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=; b=Dh7POVQVeySWmEmJvhjTbuKvWd
	s2Dq55eYahuecobdyZHpN8esJNiOAqhrOnxrgUaAzhuYS8bEcrwATuj4aIGCWwNMHgksvUHOcF6G8
	gYPlbPWntVLs6h0ArJ1fp9uPBvSBOrGU3ExjcA80bkEVcnsZwKnyGavOkxQRiLJk7AVoTepQ0y0UZ
	APtQW138s15eCpAK+9OnT8Hw+Ajpj3E0K7u730zYhn+RNJK8DiT8/oQJWWfGdrc+rQzs9lq/Ah8Ty
	+cRCRHMw4YAYyzm73p0Tjk9BRhsM1paAtlTfuimWZQhcbEezruJcyXicAFtrx27pvQlLT5ykWNgN0
	c55hnNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004fw4-42YD;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oo2-x11.google.com ([2607:f8b0:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwF-00000004fVr-0jEG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:08 +0000
Received: by mail-oo2-x11.google.com with SMTP id 006d021491bc7-6b1ae7089c0so1335219eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420206; x=1790025006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=PonbDODBIZzFBqlorqomsowdVZ3gnrOthYyixAVpa9qUuzjkFyENWGIyBl5tldhfIn
         Q2ob/ICs3P1pZN7LDnRqgBYhaLRj+JDamPSzliKSTrGozYb2ZV12Z/v6DDgGgFyKRt8E
         qLQRIIwcosYeh8q5ldz84V4YIkbwYfaaf9aFYJY9Z6FN+V37U+Cb7abv0364Z8xujOgo
         9iuDWoll2/VYjC3q1MTuuSyNhX5PYDCsZB/P41mJPAIckWN999rP0oBH0nXJIrVCa/zd
         2cdtupdR0f/UnTXrvCdzUjvg7oG444m2MTAqtMX56Da6jA2Uh5No1YtcWkojepAM3HaN
         aZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420206; x=1790025006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Qb9nTIT7gTOu7r3X9RtZ4C0by96POYvd+8DkGo5mfQC3PIpZQB20fKMfbtZXIiLyTT
         DXKfxkzTc2+ds/rT+u2IDExC3Nwqp5WJ8lgq8H9S2I+jIlZWRfTrMbTKQjuq3KB5Sz7r
         vNSRM3/rt12lephojmoIeQ0xREtU3oPQPByUbzTSmgW3C8eJ0NLIMNsnC1+dkVbahcim
         lVhWlkpc1XCTbeSQbtvI8t1Pqw8vH6evyzDtQHgBs3hywEt6D+TXz6ysq/va/Sds+q4G
         BcvhYYQbzHMt5WlYA9QNXcDX9vXkg9SnwHphIzGQp1FJ0ld4JRP2jeN7E6yHkmuOIX37
         +Ybg==
X-Forwarded-Encrypted: i=1; AKwUvBxydYDUBVM9fM1sajcl5yCmEFi9n/2L9J7FAbROtZMu0az9vaaKtaW2xtnNerl5AApt5W4xHiycONWME4rEqgMO@lists.infradead.org
X-Gm-Message-State: AFuF++nEudfEtsbgVHdRHCU/mwQooT6SsovmwMc6cbkKKsYhw4trwDQ7
	vaNh2EFma09hWghcdoiDms6E2XwfKieHGf7wW+V3mXGb2aBH0ioT9L0z
X-Gm-Gg: AYBFou3G4DwS2rDswKpVtvLzCGLRAun166PuP4Ske1yxbk/KkRBUmxovduss0bfPLbK
	wLBoSzuyvIY+UZ6k8ZQujy2bgppJ8Q/ymuWEp9I+9ky6sPNpItc3RvhW2/mtZMYZDBsSKYX4UwZ
	JJE3KmJC91yZOlLJf8+Tr98FoDmmjIb7pkmXyNwkbaybflildjmCaiWdPyk4Ns8R7SKHNE/g13M
	5e9kmBrkMkyuzfVDmgUYDb+lidmFC9HlHFPNWg0GkG5ZLMsBOuMdmNougnhCOD57NWtI8sltPbr
	7+z/WYArpNe7IawNhE6kJsoNGfxfC0uS100VTLDMBcBAfnVxcjfjJpKsvT6XMt7tYKyarYFYBUC
	qj6DRf17d7ii7/fmA3lXmtpbSwzDzXfKtu7Ph7YkESTIWtp/xennm3NLQQl2EcrMs/H0cQ49ymf
	nH3cxVP7ENBnjHCtxygAq5ky3h/uK+3dUH08CdRVEVPRr9QFfO3brlN+wl6FqNikhkyWSnQNL1+
	XCmnxryiRzm6agpR6xAaFzpimJKQRzdxR/qM41eYh/Hgqc416/zuv5YJ2+IUIH+DUnrYkTXabC1
	jm2e8aHn/BnjH8UZ6R8Okh7/yv9521QNWJk+Sr3MV88JhuRC5CIgfFYsr0aXwfFnUDuA3QgshyK
	RkBKI6c/CvlrLly4OIGpAhImz5PBK
X-Received: by 2002:a05:6820:c85:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6c541457fa1mr2615579eaf.38.1789420206238;
        Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:54 -0600
Subject: [PATCH v6 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-8-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141007_258750_979A3E72 
X-CRM114-Status: GOOD (  16.59  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0



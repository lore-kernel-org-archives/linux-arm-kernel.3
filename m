Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D6C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=; b=m2lj2n2SU1wv7jsdDiQH8/+hf6
	hGwtdnIsBVSDumrmPpQ35iwhtk+xbjYS1I6Z96g7UU3gjm4FQGxLN3pr4td/9koMxbPv1qwxQZSgB
	pw72upW9Jer44RKGxFWpj3MLuaft/ICkFmkrdOh/xndgo0yXKXHCEjP44gjfSniL6DOsXE3govxLI
	9KbJ+Q5mm3QNGHXSlfXZJqSbu1SPpgnK/cpkRRT6gDPPY8D2BVcA0k+Tagi83eFcyNQlb+WPFwr2l
	A0kFfFfZnZLsmDDgra1zJREu1KgntWEOCZorj5tr/v6W6IFkDUFjNA+ydjdj/q5WZB7JdBje5PBmO
	/egkxEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Din-0000000B75U-1G5L;
	Wed, 09 Sep 2026 08:31:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di9-0000000B6Xu-2l1d
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=; b=rE7/UpuJJV2qiBPMT9Fw6b/ovP
	jHMIoOrNFFNvB6+miQddVkWEdkrEIzs0jupBYdeV7BcUMK0kIVI/Gyu6adGoLatxerF4PemgAYyVm
	9toYGo5w/tK/cTDTQhfxuzrl7xDcPc5JnfBImdrftgPYAnv0T0ilpwc93M/CVbmZG+u3qPWu9trnL
	21FuTxV5g7McMrLTkyxao7rgJIk3qWTxnR+jH2SXt/ihuBE0cgJdUV8jot6nh6miyrbpz03OB7SSq
	L0sp51FhxmQddBpjCAzUgIZNUKnbUANXGWJ6tLuuceeh0ayBZtzQzrZZUzdaQP5D5o1gS0pFp2Xh3
	Syx1Qo6g==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di5-00000000un0-3ihH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:15 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e9ecd7216cso4756853a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942670; x=1789547470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=b6f69Fp0nzzx3RZ9ISxg6PyCdqh0G6TMJffVLePp8H3QE2Y779zsEzfNpcjOnG1vav
         qsRND1C0VHBDNRxHyrImNOdqJCFrGjnb1uNcEwEB4J8DYOHF1gis9GCnh7OWpjsJF7LQ
         s0SuUcodXxUakcdxlDxuyF5Iw55zHARY9qwXpYMVw6eBY5fGY8qkcmcxIJAB/V2ZYVd1
         xWgkdt1jplOPehhD1k6feMrseyNIzxeaqUDhB2NhwNps5fcIfTP8YFnho6Q9JLo2tgXW
         9WY5cyinzC89MHfze7IhqL/22bbzfuKaykfucuGyoQlzYKl7okwfFWGSeHc1mEUm5tdN
         8V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942670; x=1789547470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=rrVJ+KujNZBL4gciEL2EVkvD97WTOMHVcbcRj4Y6bczu+dhprgE/zEozSPF/U3AGhm
         TnAMrKH1E4gf/B9J0+CZzQEiVzMCg4DsRgFbETNKu5kF5g8zKHu/vgR/0Taq+JcghxC4
         G6tbe4DeQthB0UvCsTzkqmIbY7TSnPOJ4nyX4MpSwN167ryup28uKJOXu0P7cJeFO1OA
         KBgOxfxWhs5ISLmimPdx9PW8285XW5YO1HRsUMxB2OPl3XgNUal9HS5iKc58JgMkTj4o
         TBROK4qlSRH4bficH7EX6nmq0GPJ1iGFihnm9JSXcFf/Zbhd/dOiR3jm0Du1HijMWEIC
         BB1w==
X-Forwarded-Encrypted: i=1; AKwUvBzcKnKKQ1htjjtkt8LTCyk+g8cQHr24C3W3EZVXmHJZWVfZ5fjKydGMN1eBaW+xCvF+StiVqNDra2SRfuMqAjKB@lists.infradead.org
X-Gm-Message-State: AFuF++lDGghQjAi1qXX9EAVlej09WJwjPNt6EvLKxoi/EmEUgm5EXZvU
	fDcTv6kF41tlDDdAYs3LnmvhfC+VhnA2c50mUYbpL3WLRU4qeBfzwbSG
X-Gm-Gg: AYBFou08J+qDF0JamnjLS9gDD2g+H3gUDPswLUOScVs7Qr2/ElHuA3FkjXQ3l+Rsghx
	WzXoY7qFB9HCw5UJMTCkAqoRKtWzvFr7C3VKKwlUThhGn1FkPS/Nr8YxzxjBEjT93SRlTULJWFw
	yZi0Oxp/lleHBDB2HK9WiSN/9JplSpbNtW044FYMkw6vAb20HlgArS4pqEdTE3JlqWEgHouL2oe
	XLzAcbHX7PFYlUERERHVB1v3isDNKW7f0hxbUUHFs5c9IjXRA+0wtSR1m81Rbk/7AP4mKnWCgw6
	pqtR4xGigic1pV9qWCa4Z8/JvWfOiZUXArKfJckoCXU3cigNVj+btMBIedwEodGd+wFBCMwbAB7
	PKS/Tq6FsHiI4TBn2n/T4iqrfA2lWLq8ZVEcHjagSpgIskpRLunPvSmzXlHJVxz6kFbyge147u5
	XSjdjiUJ3FwgLlA8WQj6tFMioOEeFFDrYn/pjKBBBKLqMA8DHnvzKHUc2lB+OWNx2SRw5PGiiyQ
	aaIjadB+2l53kxer/RL2Lv4uVAcXwfo8gNc5rg5aq24VrT5PmHhYfPG8WOaJKYzwmSVuChBh4Z0
	PYd1jCbacaSOEclgNBOseOAMk3YfuaVoKhaMwln30yEOxefpONgGdZAeGqu7C67lzpNh8jCA6Vg
	fmDVnbM0DWG0Vb7hIIYOrawNV8SoOyw==
X-Received: by 2002:a05:6820:1891:b0:6be:731b:5544 with SMTP id 006d021491bc7-6be731b5b5amr683141eaf.37.1788942670338;
        Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:45 -0600
Subject: [PATCH v3 12/15] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-12-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093114_322242_7991D907 
X-CRM114-Status: GOOD (  17.70  )
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
index 6e54d3a92219..bbfed22640c8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1412,15 +1412,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
@@ -1431,10 +1444,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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



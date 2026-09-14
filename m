Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31F3C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=; b=UElRtCL0exp/wPQhTy42ZLM68J
	3UoQoXQEJRGBC5QG1IF+6yeG01lmv9dQLPc1LsGj5VwIsLwUMjmj8OvRyGgR6UFO/RBeEURC4beZ/
	XDgNnttDiYcHDwf18AC2VI5EdAG3chAIJP/Fu9jW2IoPp5ZFo+eWPoXbw2qWIZ9MN3Hb8T+mZO36N
	qvV8cehEtOC8Ib/DPBXtI+0tv27Y9Qi2GZO9q8A9wLNQWmz4kMKBIOyWASlppjZB1WseKMpjgWdwB
	f5WMB57DzratwqPfZODfjqmxlK65SUEWEbKpyVgx/cnhGToqXtM/O2I3iIU6AGk8rnrm6Z6hgkLyL
	6HL8Ix+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004fux-2cPs;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwD-00000004fU3-3rgH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:07 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c2c08ff3f8so1663970b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420205; x=1790025005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=rPWr7QtRUfMJRFDgV05ttTIJzcqi1cfJKEyDY+K39giRtbJeMNAUyzaclmau7y/RKH
         CrugQz123y3eVBw5JaVcsmQ4X3IksrEcErykqPhDCNavDkMHmY67QjGcWuAD+0sD2+sm
         2YLpSYEHJsR/WS6oMXwWDUTrZK7YfwxtkMuLJQXbk+regq/2IXLYq3qAhyRb7I7BHugz
         SdeKC7tHaqeUQjUiX+6Vie0DPbP5kDNq6fG8h5Ee8v8Y/JJvGMlXw1n4iZxq3c7VvGdo
         a/QTVn39YLVhDOuxuxYxKhwfdOp6sBLOzNj6jTFur5Lt1W+XMqLRXEuI1TKyeGtl3Qw+
         o0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420205; x=1790025005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=H2ZYSDkEjlXWj6dQFgWDYIRFH4SVrqpoASCXZrAq9gNsGHi/suKVxkVV1W5M7Xqd2p
         vA1u5m1kvdobuGKUiYA+p2vaJ8V+LGa/XaApTZ78imTJGjEDo6PjeosK76h0dKnuGP1z
         DqnNrcxcUhgg/QwuG8XjbHKdskhBCz2lHzZ4yrPF3wrFC+6Pc/N5eYIAefo6YYWTNXhp
         x+bOlPjHt0sYm2BPs66RaGIsfXbqqB9FZYNg+WN1C7iJmlFIvajaevyNJgrnXIPvE9Ee
         jVA4ktm5r5fXCJLCW9IBqPnrnDbSm7x02kRzPScn1USxBO0Ngwqwh6u3fHouSbdAqDxW
         nHIA==
X-Forwarded-Encrypted: i=1; AKwUvBwsRhJgdl8WzAQMIWBFujSfrAdlIKS40VZWK/4Esl04IzIeJH8bMyKte+p4hx4ObFovNrTjB5xSScyA9bTvLsua@lists.infradead.org
X-Gm-Message-State: AFuF++mHT8hlSao2WMibGJvFHRZddLHd59dOsbcdsJRZEaBYqBMMHWnH
	pcYbWq0OfAUpJKlcw0rBiNdpDGRsFx6qWB55mjrkoVm9eQFIB4ft0ERr
X-Gm-Gg: AYBFou3RU/itJpthh/7h61sjZfbyZfaVRvuvYaMdwjO4xQGNqNX/h2AFYPQYqfvR2Zp
	Ef/Zy8CLLYuRA0P1Q/W7ZMpXVohWytOZ1ZH78wEwCjeQ2C3j3xxDumbXjdRSBy3kTXINFhYlfmZ
	NLTXTBuu0fPkZZ0T2NhGdSRdSoDbuKDwZ6KBOQ/hGfl88fIpe04gtsttsiDWBxPiBUPtafmBUMl
	TeqHauxoJdag9CWTpSuCj/6LotHuZyWQ/glenLg7nPoIDZc1qRAPRVCzSxFEnzBGPIrUNAZo2gk
	a6ivRBcGeLMpfdF0TbKI4KfFyD9adVxxxQpurXSMONrYMoHHD/jueKhKSRBaPV0REHfR8So6Xzq
	p3de/m5Qmi08aspT9d7TPsgiLojerGE/uE0b+b6bhOnPE1g2fqDuMTO9f5K1QoWalN8qvDDXLmu
	sS9AKuE8VMC6OPq9LeI9yKw7I/JnH9m5PctqBnINo8DlHK91Hx7B4fM60KuhAukM8B7mzrWN0FR
	Z3ULh6v/iuPyRVqOCSab1lSS4N7iZbGLYVsZPMMzjKtTXBBYo3uyQXitJt0r65z9ufONTd9EVx5
	pJxEp+KQ1foU68v08618H+Z/kONFcimP5pzmy5JjazYdprxc8kPEJsirYnngyoQyjA8Ivr0pWC5
	5UO+lIyf0Quy1jVO5SY6M6Qy4PXYo
X-Received: by 2002:a05:6820:1626:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-6c540b66d8bmr2665520eaf.26.1789420204843;
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:53 -0600
Subject: [PATCH v6 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-7-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141005_978738_EF0DF058 
X-CRM114-Status: GOOD (  14.18  )
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



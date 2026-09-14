Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B898C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=; b=d5YDlx77IfgrC8PSLXjSLhwH/V
	UjvpOqcjvFFXSZDNUecFCoC6+U7Msj3pzI8gZrlXBaeI7O5qskrKOYdvAv2BDljudBtJuImv/tdaY
	iNSIH6PglfNHAyY0rI1Xr6gtS5Nn+1IIAUUqc5Ge/PI55esk5ZMdl0N5xUxkSp4pkRD6h8TqQ1BIv
	bPuTn7w9c0TAinENd9n7Wm04guEsmewnLd5WLWjAYkY0unWuTysFTnuOH3/z/PJZTwvIYSCvn7e8J
	aRUMKS3a8CGd6bcTRIFawG2hb/qukecsBRHWSQ4hD995izUmdW5OUzYgvZm+OFD2VWUkJUVm+xmei
	w7hxEI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004fuB-1B1Y;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwB-00000004fRP-1Ot9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:05 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-805c194bc92so2105288a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420202; x=1790025002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=q4h7CZ9Mi9iZUUcXIFGIAOEBYDqJkdx8RgQSYNr4TDuXn/D+GxP6jKSx0MOQ535hbr
         z1YJh3tGc33BiNke42uhXgdrf0NvqD3fkHNLCqzy8KpBbo5yAaL3Um1cgN/npS31R1eA
         LmSuT2zZ9xE5Mbdbs8wEnjmbHvDhHhAzR6EBDetAR1v8tZTqnbXb7Yc08ScLgyxudyKY
         HSz1pnLUd2kIRVLbWW+oiTZNHFYIPCyEDbgTQcx1mGP10ynqj171VYt2q4lj7Sz1onK6
         gbLyB5CmlbLJGmFxtxpsPrjOFPUKAVd+zal/7CqNP09iwAD63SG7rIHiOFoR8eDlk+zz
         VAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420202; x=1790025002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=oPKm8HJMFdXVngSldY/MvnTFaepQerxhcX8HV+hQHHBrmcLX3QibkUSkat0gFtUBhr
         KJww89DVbLgjNw7b1y2SAAM9z8Q1i5k5YhMTXnLoYxQj/LsVq4tVA/0L2iOPeEpijTIY
         FFzTa1tSz0kKwfXEE4hzFRskmaytt8/pfrb6cxltMDPQx4uYwXb6FZv5fceF7C2j9y0q
         NCmebb7O/qpX5pBA4DyEts0zlFMMYUaTvnrGl+5LQYl1E1Sn135/2U7zEqv9v84ZXjV+
         8f0oMJrr5FDYLkcmKrEBxAHbpQDm2F6lzk8rp5EuwdTpgWgBB3VLmPDvmhUIqKT1maTH
         BHtA==
X-Forwarded-Encrypted: i=1; AKwUvBzt2v2qjRh1lvgvBR1Ju7iHbk7j5x9nRZ2gZEoSKaxNUy1TAoR/EpGXyj+2U1T528ACZdJsK0koibbFDPHbtp0Y@lists.infradead.org
X-Gm-Message-State: AFuF++k1IRy8zWFbV7izxJQA5PySTn4LKpwy9dY286wTqS4tYIq0P2lJ
	iHYKqSsNLfEv9uCb8hVKrkLJt2zZ93Bw1XDaKgoz4zI1ZguzZ/gYECqgcV2WBg==
X-Gm-Gg: AYBFou2gqXooLRIqk/DvEa5UDCNOdzXZhybcu0cZlh76VZ49rqCdxQpXpm/MBIM6OTY
	sZAMRPldqqUb2FYrRN16JYst2NBzH/LQqeM1+eEFs6hvnCHQmNcpaWS1WNLE3uLpX6gnWWMGJu9
	Zn/+m6xbn2CeTizjnr6NYEvAJb3mbMrxOWmUOZ8cvtIqZzZF13+uIgxfBTSx0wCpVEnyeALalOr
	oJgN7+CIuJYN1yrGJC+rf3qOG8OTr47abRoEPWbExiL2DeywSxgcEE75G6OPb2r/JAR+n5IV7zn
	h7pyvGo6zKEv/HFBvr7J0x5gRU8YD5kyvwbiZu3+KtbFMPpKwnRqlRHAzYBb2iUYjMZgvmnx2W8
	ZoPajmnv3JH2k41QeFBQ+z9iasPua1f7u4RBiMjEu+cf6es+zkzanwncrTzRwIFNNpezua/f1Dw
	sC6VXge9lbiWOng0J34chpRRFdZLE5ekbNxbT9kNiROn1Iq4HhyB33mjOjDjcor03OQLL7ezW/L
	lBAaKThmRheF6VH7x/CsS0urd1s6sd2yH74j1JBOuJtOFuhRffaezORTBijy/E0BEf+zZ44R+50
	uRysCj61qoYXVJbSnjoMlBw7oFrjfdH6nxC9zcdmHpcwAkOCswo6XMj6zSGD4/4/WE9m4Jc6i26
	abD0HDwenZLOivriPPUZ9Znq+7FmwvQ==
X-Received: by 2002:a05:6820:80c7:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c53fb6bf40mr4489299eaf.15.1789420202250;
        Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:51 -0600
Subject: [PATCH v6 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-5-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141003_409998_E698784E 
X-CRM114-Status: GOOD (  14.50  )
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0



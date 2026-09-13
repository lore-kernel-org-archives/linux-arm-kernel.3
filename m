Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC167C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=; b=kaSMz3cpWFnPG0bCvKoZhRwN60
	9VrLtVLd9G5fnMRpUG8FsYa9Cz1khueEjbCh2cILW69myI5ZI2nB8gOdzhldysb3eJvVMKXTs0SKa
	VfS6pvgwFbEI0dqXHEhdj4/81a6sMx8CzSVmbzqmXmSB8Xi4rT9C/aB1macoGigmXK1l2k6wQaZ0X
	U7Gwaeo9lmJAExafCqrZwoC2X9J23epOOrgqptptR+Y+KbwFOM6EcXzuWQ1fCcDyWpCc4ew4BzgPc
	1O/Rp7cSmJhw82dFIyZPsAqxl/lXerA3HT7MWtKjhho/gyQYYKmgMzy58LBG23OzplEqu3hvXjLwp
	DvITGUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTC-00000001Mfw-1iAe;
	Sun, 13 Sep 2026 04:05:34 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSt-00000001MEK-4B1I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:19 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-495b27007d0so2155707b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272315; x=1789877115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=TimLfmeaTdHUXgsymS0HqmAvI/1fa9yAm/7FsBwahs8wJvTh9bZkVHyliG+VtVlTAN
         bEiNvmI/Q1AI3vmnFmqxdZB+VuG+I5vQae7LrX/NkeZhXMqNoQgbeCDEjDHxp/+FEWgk
         z4Bh5xebAAVzEf0E/esXMpe2WiRQ+xiHtQm5YWwCy9LMWEaMXdeF/RtPFt/do4fOD7vo
         rlG8PGgJLe1RpjQbZG1zEsdqTM4eji+QA1c3Ie+SyuqHPYt/ZRxHdRRLjwWApIMPf00H
         Lv0Exu5Jvtrla7x0qntvoKdWnTcM5YWVdjOhiMVqygDSOSnP2xr012vChFRQTx5EcQCi
         ctTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272315; x=1789877115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=WSqQ0h4/Yt+9f8YrDAjHY/7UJ2IK7PKmEvTX+p3Zir4yMzvX5fM7ppdJ9tEujimqfS
         Ut+nTfubJ7Gv+Qm8YtXF0TVTAT8VNlZddGid2I9Vd8QVNfers6Ohg3PTWwpP+zYLJrLW
         l06jKrdZ3vaDseguDpxD4+fft6WpHk4BAJEWjYVytjmUjF3hE2EonRomAYttHjqwY6i2
         P7sPncXtnDpZs/7v05aCMLlKD5bQT0PeieH5L8VS/htiSfagrY64koCXEOUGitSgkKoH
         eZ+j1mpZzOELWref2LuWgPzboIuexvxJp2UWBt1pmrjlQ31VeYukkhiPetC7xNqV5VFr
         Ah0g==
X-Forwarded-Encrypted: i=1; AKwUvBxPJvoveKpHRqJ7zUJYZHzMzlweTGxJr442vjrHj0oXwWyPdjrQQUM/aPh56q9QBNsJBJHHkqbWo9++zHwXhYBu@lists.infradead.org
X-Gm-Message-State: AFuF++kJ9Qn03kytlh5KL9TFZbjCBsheAgiP0nn+csCZI6KqifiJ34eh
	uS5r/RCkHOm6DdNnLm9HOcExtLOydj8029O7Kw/MnvDq6Zd7ysv0Sk0B3BkNgQ==
X-Gm-Gg: AYBFou0pLZBZ/8W3+AMGLm34zDpRZmL0+0aZTYwiWeAjzaYB4VI2OahjZwXA4D922Mp
	NDXItY5L1fYeQci6jEK2i5fA2PAAojBtUstmHZfKVtg9zGmWabhsB3Q4Qbwnxrbwt9mtbkdf6gh
	L7WfPPrSp3HPi0vf6V0+Vyh6Ab5HQyoDjOgOibNG18VJHzFW+ywBcDqWXm7+UNyysELJwjo0i4S
	2Lv6FISu86By5S/5Z5M1VpqfDCiS7nHgiJJJRReujcfRhSoHi3fsjs8/of+6SZBLvRchlBMyGOb
	Yn4JKnw6h9pp67nbkZubPWFfyHTdQtw+23AAw7W3Mi8fFBZwDOBh6Tjgy+HjMFk6aUIfJTyyfRk
	P6J8DI0Pyl2bS2P8palqspwa5b+qtoa/hgMr1ZpOJatFgVn/LMPjHJXFxHK+u3F949tq1YZvSSl
	43FeWNEdHaP8P4XLreBRsvX+MrvLB3Gru+QGuHaX9mUQafx7M6AwDA2HdQ+wHU4xVujGqIjSg+p
	OWzCyC9SKAZ14pB9yJgrojV1b+CImQYVMNe3HhaLG5i6hISACIjrcdOjILCxxGoAP0/seW1vH4g
	q/d62R4uPdNTpGxCk6/7SPz8iyS3g4DmbuQuxy9Mi6/G5t+KWY7oLUeGWqV9l5m3eg51EsuNb2/
	l+DpK6vUO9bovC8KmskDcUJ99pUFPDA==
X-Received: by 2002:a05:6808:d4c:b0:4b9:e5fa:8907 with SMTP id 5614622812f47-4c31b4c5e8amr7737916b6e.26.1789272314888;
        Sat, 12 Sep 2026 21:05:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:56 -0600
Subject: [PATCH v4 05/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-5-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210518_394896_C922BFD0 
X-CRM114-Status: GOOD (  14.54  )
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



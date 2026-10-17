Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC0FCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=; b=V7eQsz9sshA4+AMOp/fUs8Wi1/
	m6fXNHK+bDakCZY6qn5NPVdYUg1cqVb+pR5iCRCXeF1TlzafdUYIokc/ZcoyMBZZgVrqpfHKQf5K9
	fKl1As+7xoYDBDUHgf9bV4WrpD1slLYU/e5luplrCRYQJk1LyYy7NRiGwTEU6NUecRwO+zTG85DCY
	OuDCut7BfqPGhUa/7JJL+XQEI2YyuJ/4Zeu9Xwxlr9zVB8PRyvx7McWhEIUcvEKJxHdDbMn3rb/9o
	7FQwGS3LsgmYrzMbn7+Q5ng8YQbu3PFsE7o4kseGJEU0qS0Byb8j4hu+KES/ibExVS3sD0R+ZUcY3
	P36Jy+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMp-000000059cF-309g;
	Sat, 17 Oct 2026 19:46:55 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMM-0000000591Z-2gEP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:34 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-824e6e6ed71so598891a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266386; x=1792871186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=b+t2DqXiN1mE4VyTXApsDxUTTuL8wTcCZJS2YWxEvFmnQwruon4giVroKPOGF/QM2a
         TAzNxM6WCsW7hAX9ImfdCO9p9n7tVD8WRn/1Nh//auY9RVhgNNDQvRWQFRrankLNCWVb
         +kLbWSR6SL8kKIt/2557z2/iewiBHws3KA+2eHeaos6ww7S+J5T5pSkJQ/ZtWRPrRYlV
         Ep269obGlw7ReuU/1GDuGH0O1CDea4FdYjy/sXm4O0r787u2luom6LWdFum9ZRjJC8U5
         VjtHwdo/enaFMMOQE7P/I8qkBp6986y+lo4Ak8YeF+ggAQ4LK7VKfm2iNgTW5Hq4ijkk
         CYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266386; x=1792871186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=JLJu24S/xQtFCrbRPxPfyMyJCzgNq6W3oofhO0YpG08bQyQoXFc71NPw7xGPKEruIZ
         1xo4Sh/BwI5DaCj4O4DpvyX55wsyCAmymhO3EgQyM/i03gvzUL/SHQ0FCOhrOtEcRAeV
         zhOyqBZh1Tx51m3yjRDk7jywqR2ANf+AYgjLUsjaB17kPSAFWzCgV4CfhMpbkiZ6v2J6
         suISTVIR6tsLKIbDOHiUTZE4bdDZJJqIuCZaHc2TWeFauUrFVExxXrqUViNkprv/2W3j
         CpXq0Qr/7KEcrYz65js7k485VJAnABWO7eqEwvR52QkxPD+6fr8NvOA4lRJlKwjjx+QV
         rXKA==
X-Forwarded-Encrypted: i=1; AKwUvByI6MzAzuZk3PexRV9H9XxVnoRPmahd3Ve2IrnRanv2EPz1gl3DylbVMmCm3W/eWKWj7BANWi9XYx41Yn6o02YF@lists.infradead.org
X-Gm-Message-State: AFq9FYIaeTc7JTF58gIa/Ud+GXr77DYv2vYdhEao8SuHufj6Xy912xsk
	HVn6crA03R0MN+c0qFny6isBacuhZp1oU9yt7mKQiRaldDkalYemeXr+
X-Gm-Gg: AYBFou2YNM11qlUFUdb1Xj+qh/fTNvQIKr7W1p9p2kbZjkqLqq6JjE9+ZtOQRtI9gMC
	VD+muryoqFnM2pwfIzlixBTJHyY/nnCYyNqUrvWCADSnaajY/Qb0WItWKgwM0jK8sEz0CnlxAbG
	Biw8PnJHp8bCBUy9OKiMB4iFG8pHCW6BFLBb1kgUJ/gFxdEfIxPgwZEnDbpZUklZxUv9RIRnPfF
	fH/VAwyYl8qM3/ONdcedfAk137t4cxVpPqTafLZOJpjLTYDKahQ8pBxh3qBzIK11iB2NMlXUXEL
	b3evOAP3vwJgyOZQPqfJw4U4uo+0bXymIS6md9Dp9sqcG9pdEVt3F92dst2oWKgSvntKutz4eoh
	7OhOoFPUS2i6MXR+X9jMZR7IuEMRvDQRKEtXBxMhQGQNMR9y5XfL8Csdnn7JddxRIeWcUgdHQx0
	mwV4ZHuPImx9/7EXbVQcp5XxrC66MQLDpe9g6Ef/cpisCtuz9O86Sf9xXIHFOjj1nUUHIhSCXX3
	ximOM/OTb2p1shwjFCUyL2OmxKbZbFXrbzok1NeBucumM3chxN/9ZDTRzUNsA0EZyWLRcl0ackK
	d1Fg5WseJz3NvBYcS8e3XDbh2cT+CihlxxNgUNWZNhElNmgarjysCeGqI231Hl9c0i0yYkM6tKj
	4OCqVI/eCPB3rmogsA2RWvwUjqpGB/txU
X-Received: by 2002:a05:6808:5392:b0:4c0:12f3:6007 with SMTP id 5614622812f47-53cc22e2b13mr2397740b6e.4.1792266385605;
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:03 -0600
Subject: [PATCH v9 08/18] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-8-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124631_992696_0BAD5220 
X-CRM114-Status: GOOD (  14.32  )
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

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 22cc8998d49c..82af3ccad885 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1231,8 +1231,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0



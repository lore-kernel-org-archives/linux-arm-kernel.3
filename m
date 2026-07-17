Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142FFC44523
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=; b=0+MAOYio4sVZ5m
	NIXwYa+ynuSCd5W/K57yNlBJP6r529J1Ks0Fi6e7kcWnec5lkw/Zqf5ihEKCh2ylsdillO60U+Q7J
	c2FVjAfn6ENQ4xABsnGNt4i4jSICIyWlmpzzfYrAy+HqiYesT2Yk6mreHz+0tinDy3FE3ThDndEs0
	B4hmtodQ59Okpz41d7kTJbBuViCPn2NnIoKucAnsfAELdSnaouH4c2sJTd1d7baGNUeBwxJq5efRb
	M2qoV8reH5H5gv6DRfY/HIDU0eqhYN+WrHgJhqx4+egyB5lyJr/cgV8MJh7bS4LqYlTqa75rXSWsL
	N42Ml18X68x+RmX42fWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSC-00000002tdg-41jD;
	Fri, 17 Jul 2026 17:34:28 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSA-00000002tcq-1KkX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:27 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7eb6573bd52so4249109a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309665; x=1784914465; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=dtw8gPeHYzSD1Mu9EtzTq9QkFEg60p53SlW1YS9FrlXST+SDdHhpQ8pBrGwKRYBV9P
         290J71xaWkxMtlOVDocw9M6K4GkI6q8FVvqz9fGiE2is1GDXiczyWnvLmHgz69AbhYqu
         Jn/ET3IJavj5JZu2yIdTMWGdZMouwPn9Dm9XiwHHC5Q2cHYsCUIElT0gNnSQGa5HTWqM
         ibrJ5sn+SOj462befEP1yV0NFTjYcYeucKpb1QtWmehNpiKP9soACadf1B6JJp7sQJb/
         QtYAOpBEG8nFAUSIPqRACVVT+HNjE+foBa6FZgfzjAzX2uKnbAowq04sw0hSKANiSyhI
         KAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309665; x=1784914465;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=NEsp4FS2dX3qnVRwBuXfJKogfy37QkmXcz00YUApOlxJoYnQS+OlwrEW9egaHT2Z6V
         qg31WS3Xi1P7zwQ8qL9fysIzn5DFBVTrjS3DNB7T19pA9fClCK8AKg9uVK6WpWsplYHQ
         mb+bK5OFgH0iyecHNrbgQQxm2dlbJUexyHcp5wOjItsQKcIkMU8DM1uFaxUhV9M4u1Pl
         VzoNZR/UyfEhfjIVBebGnOOewKyIVP4Ah+8S7smVo/KR2ZuuIMwDfoNjAYZH1+a7Rs7R
         DcnmGtWsmH6ofOxBKrhgghcnC2iNoghz8+lgln3k4a8U0BIXqI/WnuxnOe9GU2CTDptH
         yY4w==
X-Forwarded-Encrypted: i=1; AHgh+RpfoEpoWn5V7FunbQrzho2sx4D6pKpU/L8ANO8Sy/9GO+ZFbkNSflA47+dLP75sw/0S0apsxbf6DRF0NG6ysP2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1PESEi+lcvW21/6nbBhTofsSyRSmKuRVGZbZ65nRQqleDBsLX
	vhScSfYz1kjDn3Hre19beGiFKfMMQDDbVSscxdNUDuTded1hVf0MqQ2D
X-Gm-Gg: AfdE7clL3Sz3cRIfe0TW2pc12JuTv8CieIPuFuqKUbuLV4rNoWRtPdMtDYJt47+7v1W
	X+2OoKfZ3cjF5HimlSq+r8imwnSBEtDg4K+2E09ioBgqTtNGxvUXO0r5L/iwg2+fiHJFh4f9KSN
	CJ20earmPOZ3ehLWtfVPh04L5kP8kveXt/R7uTG4N6zXwqiiPlXavVZw7LIiPUWsCFYvoR5KmI8
	sC3BrODdWcMOEmh2/T3kIqzu8nnrRQTnl3QRnNpBQdoVNQs9BtiLtRBKgJlstmT+f5S8k5al86H
	TzHCKq23wFljpSP0wbgDZI0Xtj0dOqJ36pmk9+RyON4H9vJ3ZVIBiIUcAC3mcgOcvZcJpIwC2hE
	CK3ZjHi3G6jHFbdsJA5Oeabf49DLZCPNJ+80so2meaurvtKnSmrALWkX9G/svPPOJl3gsOKbesi
	62PHUV0Hyja6ypUEJtuQWjj9y0WizIND6FDwVS1qKUObyN4/q7JBfIZvGOS+E/h1u9eh2KL3I62
	B4YelJAbVDboSKcIMM3vMw+acrgYRGP6497cEbJNecaDYpvsHyW0Q==
X-Received: by 2002:a05:6830:2e02:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7ed9aa576f9mr2021902a34.1.1784309665179;
        Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 17 Jul 2026 11:33:56 -0600
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvIAWael+Zeyhs5lmYDaaOgTx3
 40bXDicl3M3UCpMCtdmg0JfVn6Libs0MExJRkLO5uBa59vQBdTlMXM1yMooSTJO3tZ5rDyzjIo
 h9snF2DsfMljnU+jJ6+/jdv+7RV401DMM+34AvMI2ZIUAAAA=
X-Change-ID: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_103426_372622_E31FE616 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

The sunxi NAND timing solver currently applies the original A10 NDFC
timing characteristics to every supported controller. The H6/H616 NDFC
uses two internal cycles for several setup and hold intervals and has
different delay-field encodings, so the resulting clock and timing
register values do not match the hardware.

Prepare for per-controller timing data in two behaviorally focused
patches, then add and select the H616 characteristics in the final fix.
Legacy controllers retain their existing setup-cycle behavior and delay
encodings.

Tested on an H616 board with Toshiba TC58NVG1S3H NAND.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split legacy timing setup from the H616 fix  (suggested by Miquel)
  - Move tADL/tWHR encodings to a separate patch  (suggested by Miquel)
  - Keep the timing lookup helper unchanged  (suggested by Miquel)
  - Drop the minimum-period helper  (suggested by Miquel)
  - Align H616 timing-data and capability names  (suggested by Miquel)
  - Add Cc: stable to all three patches  (suggested by Miquel)

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: 6f5156d7a31a8c3b0f34af4675c9299c8f877cbe
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



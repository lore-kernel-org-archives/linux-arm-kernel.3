Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95400CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/I6vtnwODMSXojEn3r4VzFo/02YMNNrJvs59YYPsvk=; b=DoIp/tis2n3MGYwuP/t0DbNv9J
	yX6Eq8zoCbjFIN6TdqoVdKhPMccrO8JS2AlD4sIHfczceLKIwJ6QcsJX6oErvoZ5dqTofcvX0Hnl3
	6+oJ6UocQfCfYQKcWYiABZqBxbYomeDV7KZvkzy9Q3atz336IM9GOxY7ppMzLRzcDtjNBtWnGpHrK
	UycCzAucBcaLV46ZXtEi8rAsDyA41Blm1xQ4O52pLLGGert29BPf8emlb6rjUUBEUnq9rOwvxit7s
	d5xdd9QnkLv4kymyxSGR1n+kXZtxljmWrpaA7PYBmQ+rGwhF0At03htI9H8SK1mhUNyjqBMBW7Sr6
	Zp0bj0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVbt-00000009Aky-0Xsp;
	Sun, 31 May 2026 02:09:05 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVbq-00000009Akd-3br4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 02:09:04 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8cce87d7995so24170116d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780193341; x=1780798141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/I6vtnwODMSXojEn3r4VzFo/02YMNNrJvs59YYPsvk=;
        b=VWRgSRRgjbfXz2uVXEYXbh2EnUS3Mi+yldAgAzI2KlA+2Q+FJ/fNFfTIaR/nTsbVbe
         LBv8IWfzA8wnhom4EcHO9+4qLSoUSW4K7aF8mXoO3GXcjGYPVsHUUxExheBddv7aLC5k
         bRT5SumkCzaZl1WuBsvYoeEzEL2re16GSOtFQMHwxomPBYONhIP/uEfTgobU4kKAh3yz
         cJHY6jBHz17IptVrBabZCbSI3wDZPo1yJqLIAcMcokVfPeK02nvrApiQ13Rcmd/KNEyB
         Q47RByjcz0aB3CWqrOL1e2gbxqTXqHaXsmY2t2eEEwRiTY/zKMhfP57kVmvYXeg7gOIu
         Vulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780193341; x=1780798141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/I6vtnwODMSXojEn3r4VzFo/02YMNNrJvs59YYPsvk=;
        b=eOGPmTqW+RzmzFNXqd74YnfcOL4ED/xTDnPiDhEssjcdlnfVLcHLeVNmUUU1GLsR55
         Jk8EWQHWiZLvWEgtOyeltAbXVoXCewE5A/8Oaw0YvbZeEUZ02Gn/BeEBeZtu7P3OdDO7
         L4hBnnJSQR4Hqevgr3h7gEHTbblB9kf8Kr7p7WSy6BXmNo1lIGYcK5/gnDOtFg67UQB5
         jIeP0CsM6REbIuWeKUofTY+wVpcSBGbQ0YLR5U3xJS0e/RCMrIOi2Qp1Z5t19yA/jDhQ
         s6iSFNICRjnjJNm4eR5acksWJ91bxA0b5+mD4KsNB6s+/ThlFhBzWg6WYBb9lqiiOAzR
         xvcw==
X-Forwarded-Encrypted: i=1; AFNElJ9yvu4q+lh4YKrFa/0ba2HNBrQk4enYrFj2qLssg2lSXEWVPFDm2x5IlFB1ojsmPl5lmpqo8bqlz/y8RA7xBMj7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy591JG7V4ygUrfdpYpiQMBTlaJKF3kw/byyYbkuemivHun5RKf
	7mobtqN6vAvLtM5ybDNUVf50c6ZhbbvBmJ0KOmwZJy5rSdNpZ8gVxxvx
X-Gm-Gg: Acq92OFsuia8XmnzkKKW//Ku8QdqI82I5NNdA3kzr/cugM19mOLEOUh9AJPUUslEdhz
	L7yWmj2ov8AclA5S36ERixlTZEg5F+D7gArFnzZfkFFQqtx8elr+KbbozAWG1dX07u7B7zlrXxz
	aWKY5GCcRY/NGPL784fHEzFRjQ4xfKApdHyD74g6girk3sTXk29VVgeqpbJGI3X54PgQ0PBVINO
	5+eQ6IgZZP9p299tWqHbns6FDgD/rDgZrRJoiFAAWSTBoS90pOPHO3vx1TKDr4dGiu4sytGJtJB
	DyR7R7DblLWKFG2tERxQQCz3s0E7bC6luwxcaNrVdf+oTMZYH8TMFNjL451CkXid3YEJ1jKd0A/
	yL96e0/H2+qtG0ICzJnbTe/w+jAHGrEBO7TCStFnkcfAK9QCYmumK303ypvutdMAZ3GclwpgkV2
	378mUxTI6FvVU0zR4xwmcQOxdu2tTGxFO2xXrOddh8WWZ3iYnyldtPvcd/MgngwnASE16Q7lUjl
	hf2m4gbM9VUUIIfbH6tuBmZewif2E470v/Jqq3hzwct2g==
X-Received: by 2002:a05:6214:2605:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-8ccefb44f63mr92094936d6.16.1780193341380;
        Sat, 30 May 2026 19:09:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea042229sm57814566d6.5.2026.05.30.19.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 19:09:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
Date: Sat, 30 May 2026 19:08:43 -0700
Message-ID: <20260531020843.594892-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_190902_910783_706FEFFF 
X-CRM114-Status: GOOD (  15.18  )
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

Convert the separately-offset phy_chans pointer to a C99 flexible array
member at the end of struct d40_base, and switch the allocation to
struct_size(). The log_chans and memcpy_chans slots continue to live
in the same allocation immediately after phy_chans, indexed via
base->log_chans. This removes the hand-rolled pointer fixup that
recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).

The ALIGN(sizeof(struct d40_base), 4) requirement is met implicitly by the
C compiler when using a flexible array member. With struct d40_chan
phy_chans[] as the last member, the C standard guarantees
sizeof(struct d40_base) includes trailing padding to satisfy the alignment
of the flexible array element type (struct d40_chan). Since struct d40_chan
contains members like spinlock_t, pointers, and struct dma_chan — all with
alignment ≥ 4 — the compiler ensures sizeof(struct d40_base) is already a
multiple of _Alignof(struct d40_chan) >= 4. The struct_size() macro then
computes sizeof(struct d40_base) + sizeof(struct d40_chan) * num_phy_chans,
so phy_chans[0] lands at a properly aligned offset without needing the manual
ALIGN.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add min() calls
 v2: added ALIGN description
 drivers/dma/ste_dma40.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9b803c0aec25..0d9ffa3e2663 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -602,7 +602,6 @@ struct d40_base {
 	struct dma_device		  dma_both;
 	struct dma_device		  dma_slave;
 	struct dma_device		  dma_memcpy;
-	struct d40_chan			 *phy_chans;
 	struct d40_chan			 *log_chans;
 	struct d40_chan			**lookup_log_chans;
 	struct d40_chan			**lookup_phy_chans;
@@ -621,6 +620,7 @@ struct d40_base {
 	u32				 *regs_interrupt;
 	u16				  gcc_pwr_off_mask;
 	struct d40_gen_dmac		  gen_dmac;
+	struct d40_chan			 phy_chans[];
 };

 static struct device *chan2dev(struct d40_chan *d40c)
@@ -3128,6 +3128,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	struct clk *clk;
 	void __iomem *virtbase;
 	struct d40_base *base;
+	size_t alloc_size;
 	int num_log_chans;
 	int num_phy_chans;
 	int num_memcpy_chans;
@@ -3185,22 +3186,24 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	else
 		num_phy_chans = 4 * (readl(virtbase + D40_DREG_ICFG) & 0x7) + 4;

+	num_phy_chans = min(num_phy_chans, STEDMA40_MAX_PHYS);
+
 	/* The number of channels used for memcpy */
 	if (plat_data->num_of_memcpy_chans)
 		num_memcpy_chans = plat_data->num_of_memcpy_chans;
 	else
 		num_memcpy_chans = ARRAY_SIZE(dma40_memcpy_channels);

+	num_memcpy_chans = min(num_memcpy_chans, D40_MEMCPY_MAX_CHANS);
 	num_log_chans = num_phy_chans * D40_MAX_LOG_CHAN_PER_PHY;

 	dev_info(dev,
 		 "hardware rev: %d with %d physical and %d logical channels\n",
 		 rev, num_phy_chans, num_log_chans);

-	base = devm_kzalloc(dev,
-		ALIGN(sizeof(struct d40_base), 4) +
-		(num_phy_chans + num_log_chans + num_memcpy_chans) *
-		sizeof(struct d40_chan), GFP_KERNEL);
+	alloc_size = struct_size(base, phy_chans, num_phy_chans);
+	alloc_size += sizeof(*base->log_chans) * (num_log_chans + num_memcpy_chans);
+	base = devm_kzalloc(dev, alloc_size, GFP_KERNEL);

 	if (!base)
 		return -ENOMEM;
@@ -3213,7 +3216,6 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	base->virtbase = virtbase;
 	base->plat_data = plat_data;
 	base->dev = dev;
-	base->phy_chans = ((void *)base) + ALIGN(sizeof(struct d40_base), 4);
 	base->log_chans = &base->phy_chans[num_phy_chans];

 	if (base->plat_data->num_of_phy_chans == 14) {
--
2.54.0



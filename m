Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D651CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rioPEJ0KzynPgjr6B78MS6b4e5+yQGAXGZOz4iEo+eY=; b=gG48Gsa+e4D+GJho9yhgppu+wR
	aRkAkIzhnvkqx01Zbupe9cYq4ZL3LJDbx0LjGOGXZV46odgieNjUY5KeLNZ82CYFCUPAnMEGgxJLF
	NmuxdN4l851kCmbe2DQACyxwaCElYPr58tikdfx1fLhucYlrMaCHXX34otGpUam2QCNazsB/Y7ALy
	8XJ9+l5u7LEVbLfxH+1tx7zc5vCe91qwgSk6jiL8ya/0fmvytXO27w70UTNq5LRIr+J6e3xRKR/15
	2F8DwV5JTAH28onCNh/syCxjhboUlY//vXiQiRzvQrl/IzvBCkyvxQrakO9oec8+NivLsgFH3kfKz
	xBe5wUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKuq-00000004itd-0wOB;
	Wed, 27 May 2026 20:31:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKun-00000004itF-0i9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 20:31:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba4a1a0325so82300245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913904; x=1780518704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rioPEJ0KzynPgjr6B78MS6b4e5+yQGAXGZOz4iEo+eY=;
        b=DDSHPrU8U7aHbY7fUu4rRESgvJ8OqcAEPNvTBTyc5u0qeIdZ+sm8Y2/hfptx6e61Ht
         3l4+H3aWEgOfi+tQIVW8ox99gXLau7Ju3NHF63ymDKgHMyCjklg0mJx1wCUO9/B7kYwQ
         3lIARKVYZJPy499SUEIhV1QmI+/MALgAjcIbfSWrJuhGdKc+p1BV/QMNEpjX+OMACZBn
         fIXFy6C+rOE7NiXqsIoPtJ4UT0IAxJQAgjL7uXGo+qHiQ9aJgYbSmecp17VUzQCizVJE
         7IGqD5C4Z2qdUTpsX4uUVLBQJIOdlNr/jkxDv1aXRGxj3NXmFynOkgLnkVhbSNKjZzKw
         5icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913904; x=1780518704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rioPEJ0KzynPgjr6B78MS6b4e5+yQGAXGZOz4iEo+eY=;
        b=c2buvV2OZZlaKNHZ0PgueCJ6gyGbH7DZGafRX7KdQiDQ06toAlPyGq4J6QQeHA0Kef
         kPNLnTwAxR/hOGGYI51jZw5vRiKM3buoyBkvT4X43ZnUoCkrLE2o8Gb5bxC9pspKXP4N
         w1AW6Se5NwSiVUB8ZeJOuBp2I0cqXD9l9jc4wt2/9sO3hXJ/O1RZcVd/dswiI+S46zcD
         qvV9cWsyCYr9gNDo3JGqKUa4IeIcuGzwcxJ5N1D1KZXZDh+fur/7M+Vf8oAfvfx1PQh4
         AyvvWMXaMww6PSX4tXLbPOnX9SEvRGaGgwC22q6duWaH622ZS0M8/yAmfG4n3WVSGGKg
         FO0w==
X-Forwarded-Encrypted: i=1; AFNElJ9T4QJFbrVwSBciYOffaQKINlaPjAy8przSrGHGswZma88USanIfHQz+Wgk3TBi+4PhpHLMsHaGDkRRVCygoKOQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxH9jgoV9zQaCV5uGmByGMA9fQsF8fb4N0ftjrGNQs464iGXDMA
	bY1FDAO9iijvQLoPrNeV2By4n/SD8ZNCyVJwY7HXYt6BFcomcYLTBztW
X-Gm-Gg: Acq92OEn9WJI+FPfLYwrtHk/fU8FRfpywllBd6oPMdm0owHFMZVC4IvZChb0k48QnUw
	Squx8TyDOU5/jErwKlOehNhCGiqzAXaWrunHe/1LgDNywC081H4897rHC6sFnXTtcjO6RnUU/Y0
	ZIw9XM4ZfTUBJMc9Zcgg9I0FPbZyFlgZOBjqlElJy3MDt0hqDMoSk8ie8VEqeg23mCx70YTZYvW
	TsaeQvbPwbIGcjISIQrKbDjPEWIQhsuNL69Dli90LbshQ5OK7VvAnuRxyGK3vUsi4VhMS7nRoyX
	iln2wTlAedBQE+lpqNMjWGx+Iu6Vqm1KoO/gVyftNHQvUdwzuA5IVaaoZKoCTv0sXwLm5UC3mtv
	8hE2t+o0A9Q7mKbBs7V38dhy3HcpHbZViHS1z2c119YO3om16LOM2pK+X5CmEk6pPEpmaBZYU9X
	SOxWTfWTO7LehnnflBoEz07+51jmO62IySRqJPnKxmZ6oKjd4kRZFC/P8oeucKeh6JOY5lo30hg
	NIU+ZpjOCjn+fSh+DvBtN3NE+SZYccTz6FSKvbKOPVJ/w==
X-Received: by 2002:a17:902:e745:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2beb0631a29mr262237615ad.7.1779913904027;
        Wed, 27 May 2026 13:31:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b19f3sm218422455ad.18.2026.05.27.13.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:31:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
Date: Wed, 27 May 2026 13:31:26 -0700
Message-ID: <20260527203126.7053-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_133145_215898_DB7058F1 
X-CRM114-Status: GOOD (  14.08  )
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
 v2: added ALIGN description
 drivers/dma/ste_dma40.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9b803c0aec25..d3e3c4cd43f1 100644
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
@@ -3197,10 +3198,9 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
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
@@ -3213,7 +3213,6 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	base->virtbase = virtbase;
 	base->plat_data = plat_data;
 	base->dev = dev;
-	base->phy_chans = ((void *)base) + ALIGN(sizeof(struct d40_base), 4);
 	base->log_chans = &base->phy_chans[num_phy_chans];

 	if (base->plat_data->num_of_phy_chans == 14) {
--
2.54.0



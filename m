Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7FFD74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41Gw+CNEv8JCYmTFPHgaksUdYbCOdfOME9GmEPP9m4k=; b=I7m5y+ljgJWSCM
	m4YentAVJARg16S4zsn7yBBK+pkwFMY/xVhQ/MWUweWJr+dBU6nGeflCbjiyPBFxXTqIHU0pDQ4KO
	kORgyg+r1yD8DZ3NavuiW2jVJAFc6gUq0S2QZ2hY/McB3MpIsuxeIsnHYrzyW5TSCoMi+vo+urSYN
	PfcIreMhwGVZrBL+e7uRfojRw0Dj1e22oTyKdm5k/AAkXCQzvDZXI9Wn494siKqnS6akf9YPQSS1V
	lTtx9KWj/2jEap35AljrkXNUJPYFKX+Z7GSpTkcBWPHuhQ7J/s0Yd1zpsqWGN1yEbP7eoq2y/OYRf
	N2PGsY3nqT2Wgkt0BZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVFi-00000009mdb-1wop;
	Fri, 19 Dec 2025 07:50:18 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVFf-00000009mcv-2axh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 07:50:17 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7c6d13986f8so1252519a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 23:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130614; x=1766735414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41Gw+CNEv8JCYmTFPHgaksUdYbCOdfOME9GmEPP9m4k=;
        b=eLyEHg1+c7onhcwFAMOwvEtwQ5lHktSxD8sMRHKf0XolD55F61Eh2fQHy4Omz9sFKa
         xK2H8tnO7R8E/WsiWsAYs8TvgKMWIJQSBJUZFjZgNpM9KDU2vB7TJ0bPaTOWCBBxSUOb
         KtKQbfVGoLyZ/YTCFXj5QujclskbgXgwOtHPnG6C1RzWXsnq+VZrWSxYo5vgaWpO+5UK
         gaNnM000cjZsCVVgUYbxUdhZVEfz/WniM7O99Uery6rjp6elehLgeb25hjZJPfM+yO2W
         cgu/wi69Ueu1RG1myl2De4HN4eIgUoxxdjB2ijB1ksfuaKQEcpvhbylmEa8+b7aVbImc
         G3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130614; x=1766735414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41Gw+CNEv8JCYmTFPHgaksUdYbCOdfOME9GmEPP9m4k=;
        b=oR5BJN1pgHHmrt375rNn/7lGw491e00N6PajRkscWaHt5MWvoqTTmzvpAaBg6jrE++
         R6lVhrnm72kgjs/yMGmuLeQtM5fZx1uMMUQyEJsa4fJ/DAjdCSxliFQTggTkTj7lgLJK
         RLbaFxRSp0ayPLrkt6Ftutxu9BZmhMhUBz/R4pjxRZAjV11vvMigsArxianIE+lPPw5S
         TgNiXJRQxNxe9v0GQ+iOIMHPsDqI1urgQEyprSi3Z2bMui0NdywdVId68zSeZjekO5eT
         vY95s5LWfRzz+dvl5DSNzP0jVfA0vb6w2vz2eb1jBwBk1rE1tJJdtq9RQ1KUaKeCZD0h
         E4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR5mZasBybFlpyrGuUtmhZn3kX3JD0vuOwAb3AqTjoVZur3np0BPcE/tjQsQ1Su9iNhp+0sVQZGRdAqcT5HWW5@lists.infradead.org
X-Gm-Message-State: AOJu0YyuvArumZ201zcDc1LEXgDSH12/XHAlj48F4RUrdT4mfZtfjgZ9
	uxMM5xJX5w6qHzR1W1olYQJAYGvS86v5DmiCfCyaL6uCRTdF4IWb0UVKY9Tn5g==
X-Gm-Gg: AY/fxX6BP9eZ5QiW3VbZKXEYKwOa75llK3Grm8pED9CQ/zLa5B/DoVbvGHtMASBBfHY
	oZBxOnoFP2jaXrqf8tBUgsPjd4eedXmzl0PsMp2S4HK9qAAhgDpjcVf3bVH4vXICRAgY/0SB+R/
	3IjYYOknriN0mgB6lUe6jXHPGDXRykgBk0YFBV45KSSo+hL4c/SqEXRBuCSFbcf4Pnib7A7c+KK
	BFpFThd3sThG9YfgkORPg8Xi7MD7mHsIj8eUcLF72REWkHzyjFhFRk9N0WTSgJrxeD9c+xB5bl3
	MBd8vTn7DTJevxys0NsqYyyZ7gwPxUbQGTIU7rtq4dG7Zffz9qDmQ4BMUMYRhC/hIza27aoGzOX
	M+cymGvaDvXullrg5HwbxHJk6bI0n+nbNqj3+f+p7yMQNXA5PNspwKbzrmEcgdeKs9IsGkmWVo0
	N5QSvvMlK1XaTr1S9soih41nxKjU0/dW8=
X-Google-Smtp-Source: AGHT+IG3BJRPOOEZ0WvlC5Z+hTnZkugL77JSmHKLal4jtBj7IefF9CMWnN7OGgSRa9VvlcJ7gNULnA==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a2cab4335fmr41005055ad.22.1766124302656;
        Thu, 18 Dec 2025 22:05:02 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm10810765ad.20.2025.12.18.22.04.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 22:05:01 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 0/6] dma-mapping: arm64: support batched cache sync
Date: Fri, 19 Dec 2025 14:04:52 +0800
Message-Id: <20251219060452.85288-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_235015_663396_6F5A6905 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

For reasons unclear, the cover letter was omitted from the
initial posting, despite Gmail indicating it was sent. This
is a resend. Apologies for the noise.

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

I also ran this patch set on an RK3588 Rock5B+ board and
observed that millions of DMA sync operations were batched.

diff with RFC:
 * Dropped lots of #ifdef/#else/#endif according to Catalin and Marek,
  thanks!
 * Also add iova link/unlink batches, which is marked as RFC as i lack
   hardware. This is suggested by Marek, thanks!

RFC link:
 https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/

Barry Song (6):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  arm64: Provide arch_sync_dma_ batched helpers
  dma-mapping: Allow batched DMA sync operations if supported by the
    arch
  dma-iommu: Allow DMA sync batching for IOVA link/unlink

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/assembler.h  | 79 +++++++++++++++++++-------
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/mm/cache.S               | 58 +++++++++++++++----
 arch/arm64/mm/dma-mapping.c         | 24 ++++++++
 drivers/iommu/dma-iommu.c           | 12 +++-
 include/linux/dma-map-ops.h         | 22 ++++++++
 kernel/dma/Kconfig                  |  3 +
 kernel/dma/direct.c                 | 28 +++++++---
 kernel/dma/direct.h                 | 86 +++++++++++++++++++++++++----
 10 files changed, 262 insertions(+), 53 deletions(-)

-- 
2.39.3 (Apple Git-146)



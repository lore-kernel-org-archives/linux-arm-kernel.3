Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361ADCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fgNes+rqtOn5I2bD84BLzzymTajy8GTlzB0Zxoozedc=; b=Ii1+47RDywObPx
	iiU9XDq5e5sn1M4RruKZ+taaf7XHaUQmLmruo0k/iyXleCgcM2uWtznlhFtUJoXeFSmLl477mAcv2
	837esG1R2zzE+wl1t/uo/DPMxgHewaDPhn4X2whl5T2/W+UGXpwixb6b4eRUTDiikepoU5ORMZb4C
	iBHjl+kZNFYxL02C5qHWgBjA7HMqpsehN7MzbgRZ1ZWsvRIlFu8LlpMZMClwxd5QOJlQFBwWU62sC
	B8u1FnslNvOE59/kTfQ8Dzy2M87X7cot5YIODz5nS6Ftep3PIJBhLNOIa8VhFYkM7JR5ty35xrQox
	yqvVqxQCdnvcYlmlHCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyY-0000000GysR-0hSM;
	Wed, 29 Oct 2025 02:31:50 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyU-0000000Gys1-3Icj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:31:48 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so3034957a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705105; x=1762309905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fgNes+rqtOn5I2bD84BLzzymTajy8GTlzB0Zxoozedc=;
        b=Ehmei7jD7MWw8ayrfLZ0M4eLCAgYJpBz3/3LITgcH+zDnSMB5KI0+4DVqxGgoSgXyC
         9CyIi9y4qyGE8TofoXYYDsadvZbP4jFriamZNR75Qn1yT4bBfBYKxQ+TfQQvlcc9gTwr
         86GMlBzcPhplG+Pj8yRE4cTkVaNcNHG1MPd45RgvWoAcrsyHlB+KvCJnnM8+pLmZtJoP
         Hp+t1piIBlf9Q5IH1JqEDCQnfSo4aa3gyhtALSL4BvEbD3D33H/SYd1Q5bM9VzVQjZNR
         ync3Or8ZB08bIo4KkMnbbmoB+3VCb/lBbu78OFPeHyZy7eirYP6NG8WnkOjexeUHxis5
         VLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705105; x=1762309905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgNes+rqtOn5I2bD84BLzzymTajy8GTlzB0Zxoozedc=;
        b=ExDtLs4iTyGEZTNitltule9fMgerEz2DBuz+iLr0dhU/ygoi+7WyM1YkYLiWGQUhMz
         6qGzU2AZk8KEW3DuLbIa5NqIh5M77m5IHIx25W9lE5lPqlDGKo6jF9QBBv6ThPAhGv1t
         wVvOBaPq0pF3EJMtn6VyWUmEDIzEbFblSSM31kJz8k6agL2OpTUvlIuktVfIm3gY1vX5
         Dkidkyj9qQISRAHuWHVgJ/EIkhny/416NaSxBDyy3Anca7hSBX++vmTfl/WTBgQIeyF/
         LxyNnVg4llylP1HeY3r0wqg0l0QqeX5DqHhgzSt/lEAxD+65Sf20lLJg6S92BaN1T2qe
         hT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVpVyQ12ngaZHRLT4LIwnYULg0biZvw1B2DwnbrRfG585BvVKl9y/rfSVbg1XjuL0hVBXdBzoLomAEu7Jg0trv7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GWnWr4/l+WwJX1h3Q1YFW3ckuliy/CA/UKKphQol3yew+6g6
	qZbv06/OtIF+zikhz/dp6pT8yOZr6oC/DqXgxaxmnVMXhK/sDi5nUqTb
X-Gm-Gg: ASbGncvlGNXzDVlDiWcuBVvQ+tLMytrGDAESyTXCRa1mE6yrCmzXvwcDxm4FZhP9a64
	LB7S3pF4Vz8rUwpgWjWyhez0CNAO3Dww9qb+WlW5NgiXQGnKIQZOsLlN5ETiAaQ/sZ8ePRV9Tgj
	rU7vTqGqM3LA5F1JXtf9CBZqFgPMt3iOwLC1E5EgcfLA6z/aNAXoVqiJvEzlDmo3EepcZ5jQYJs
	e6JKnx+73bJmpjehgYgXX4U9yz1UPeyOkq6JsGOcKwaqu0N52dibtxGhINSBUaR5Z1TKJhVhqbv
	lzqC4GlFTtVBLO0VKN2Wg3U8HaMjsbq1UFnpH8uUVt+wmd7XWZFvevO1UMmwh1RBnBn3naxp5WT
	rIhec/Lx52jNFvkgVzZT1/aQdXrJ9Qnh1vhIlqkYoFTNGQfQGTJ/enzpw3ocek2qhtYFE7ui6Ib
	aA+zPxUqglpnXJIFs7QBEyFqwem2hxUh8bh8GkLzP3Lbk2a7uYDMPwFsoRBxFq84oQRziO
X-Google-Smtp-Source: AGHT+IFLYcFzOLyMWt1s97dTAlOlW5cqBgpRGPsdw/0wrh7IMH63MrfiPstec7cpC1SUbgQjmoUXXA==
X-Received: by 2002:a17:90b:1c8a:b0:330:797a:f504 with SMTP id 98e67ed59e1d1-3403a15d128mr1207767a91.3.1761705105142;
        Tue, 28 Oct 2025 19:31:45 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.31.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:31:44 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 0/5] dma-mapping: arm64: support batched cache sync
Date: Wed, 29 Oct 2025 10:31:10 +0800
Message-Id: <20251029023115.22809-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193146_865470_9F84675D 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's initial results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

Barry Song (5):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  arm64: Provide arch_sync_dma_ batched helpers
  dma-mapping: Allow batched DMA sync operations if supported by the
    arch

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/assembler.h  | 79 +++++++++++++++++++-------
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/mm/cache.S               | 58 +++++++++++++++----
 arch/arm64/mm/dma-mapping.c         | 24 ++++++++
 include/linux/dma-map-ops.h         |  8 +++
 kernel/dma/Kconfig                  |  3 +
 kernel/dma/direct.c                 | 53 ++++++++++++++++--
 kernel/dma/direct.h                 | 86 +++++++++++++++++++++++++----
 9 files changed, 267 insertions(+), 47 deletions(-)

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev

-- 
2.39.3 (Apple Git-146)



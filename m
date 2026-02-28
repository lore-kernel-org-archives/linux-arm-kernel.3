Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE8FD0040
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b6WpdJ1Uj/mNRIGGoUCingnccNT1bUYjuIwJgJ29my4=; b=U9IRPYDy6ka2TU
	Mt8a9gYXGODdocEegcPwwELXH6ZXuMG7QO1kQzKffbHhG+cEgvwCAcbTZNCHFMVilR/DHcn7SFf1D
	MUwYuqLMItARZYxPr/VkIn47G+t4SogPJYUD+CEbf2oKQumGolnpYRELIB9G8KHp8bLWqFUnxuntx
	Pd9dl4va5tK0ScSaeA/NaRU1sNTaaL7FJVXSKyNamGEpyQmWfaSemsnqLpvZ702f7bMHTDxn+iDYo
	7BwHaQBKoHoKLZMsp1AS9de1mf9w1IpQDi+yKnK7xmLZyiWj+3Xq3y7C3gOtKbO3fcvu2LHmiQFqu
	Qf5dWvugbz/uHEo6+7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSYi-0000000AJup-3w7W;
	Sat, 28 Feb 2026 22:13:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSYg-0000000AJu4-3PkK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:13:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ab39b111b9so16007025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772316790; x=1772921590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6WpdJ1Uj/mNRIGGoUCingnccNT1bUYjuIwJgJ29my4=;
        b=Q8h3sxz7LeH38pOmVXRRFD54ms24nOpgrURGhPLywJSJYnGnDKtR/LGw2iJg5voH92
         ev+ETRWtOiWOi6aQRWPQI1wDOBxyqOJeDfv4kylw1JvjYAT8IGRNDdp1uFUBxqmwmI6A
         rm1v3pg1Vs36/BHzGBgT0heWX+mIRWHXBMvreebyD5wAp0TrW87PVnLPlXZ+kGvaTW2n
         K5JvWuMcdYJqaqiOV7IBQaBtlmL2JUKur/81KpckwaZtBzrlzF8oQhgXniAI2lnrUhQr
         h4eH0QIJ1JNo1/GeHtac4jzXgzQPR7Rp2c9KVwot54NChG4dKQtY9J/68TuWWQS5Z8uA
         kn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772316790; x=1772921590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6WpdJ1Uj/mNRIGGoUCingnccNT1bUYjuIwJgJ29my4=;
        b=Yv+GZsAds0fEO/Jqx8N+qM39lPMdHlK08ii8OvluWGeTLLcPPjdCjxbk8j1K68SBTl
         4HUKZtNLOyz37FJONUeO0T28eU1BFun1xWDBKXAx92TViDsOBd/eR/3OT/VDPuX5Wy2L
         qG1e9dXm3afS7z7KqxEKzxYQA48DGZxPqABvSlgmcm2aU6dc4UejasTkCQMTEKrn5aHT
         R+U+DSgzHxTcXw/SB5dIKE4imO1AiPZEj1XU5lUzCBkox1a/lRh/8bca6C5iJZF7HFDx
         YRd1db75Vv+FuEiXXPtJ+Q/WSkcQG+isz6NrIpHIAMmcTkGiIiYExkYiraz9VTCQzA4e
         JBSA==
X-Forwarded-Encrypted: i=1; AJvYcCVJO/vSQRlph/3jYPgmicnhMMWPGBqxvEjn9jyozW9lGZQaSTRvuiDq/hLREj9qbo+ACtcw2RylsstsE8oP6fzp@lists.infradead.org
X-Gm-Message-State: AOJu0YyXFm7P35uBiiY/DlODsGbBkA6/iWIZqO9Mb0wK+rqEXpe1YB6h
	EGdJqfabbF76z6ZeucO5lswNwKLVcghhtXWRTV6bphH2U4sp5aWtaFhB7zRkiRsf
X-Gm-Gg: ATEYQzxa3fjv0UTRafJFqyZYrXNTUmDtyfISqME2B/e03ExM8PY4i7WVVzly7jbnO9J
	xnIe8ZwnfpaVzII9OgZUmq+34aao1SITo2QjKUWMAqX7QPWo4oMLJft8V5CckkMCSVKsn5jshOP
	jkKCeMc4WLbIC4HxvaTiz4/6KcpZC2uX1eOTVYwCBQxa2JxaF7vGfMBxXXuCOp/PG7lh/2RVb6T
	DPgasmor/f+RwSG3TFKDRwhtnenhWEAaB8WdxvJDLurPiUZHoHiQkmRuYLc86u0eIck/7jdOUoe
	EID5eEZkWMAU6qbA8MPyQIcboJcSmPnKpp8hkIm6f7vKZNcB+f+Dg596v2AUo1V+MhBdY8GFxTv
	FTrVZ5QfbatH0/UV3WfQAGI4GuvYIFBh7aqIlpOVbFfBx3oEe5g8TrfB3xAYahI1eA+qZqozTvn
	0rYyCy07TiUJJx416Qb7bg6wOLkv+v6CpouSFS
X-Received: by 2002:a17:902:e88a:b0:2a9:649:6f5 with SMTP id d9443c01a7336-2ae2e3e5abcmr80828365ad.12.1772316789684;
        Sat, 28 Feb 2026 14:13:09 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae489c3626sm2927925ad.8.2026.02.28.14.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Feb 2026 14:13:09 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] arm64: Provide dcache_inval_poc_nosync helper
Date: Sun,  1 Mar 2026 06:12:58 +0800
Message-Id: <20260228221258.59918-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_141310_857165_242CA5AA 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_inval_poc_nosync does not wait for the data cache invalidation to
complete. Later, we defer the synchronization so we can wait for all SG
entries together.

Cc: Leon Romanovsky <leon@kernel.org>
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
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9b6d0a62cf3d..382b4ac3734d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 4a7c7e03785d..ab75c050f559 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -132,17 +132,7 @@ alternative_else_nop_endif
 	ret
 SYM_FUNC_END(dcache_clean_pou)
 
-/*
- *	dcache_inval_poc(start, end)
- *
- * 	Ensure that any D-cache lines for the interval [start, end)
- * 	are invalidated. Any partial lines at the ends of the interval are
- *	also cleaned to PoC to prevent data loss.
- *
- *	- start   - kernel start address of region
- *	- end     - kernel end address of region
- */
-SYM_FUNC_START(__pi_dcache_inval_poc)
+.macro __dcache_inval_poc_nosync
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
 	tst	x1, x3				// end cache line aligned?
@@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+.endm
+
+/*
+ *	dcache_inval_poc(start, end)
+ *
+ * 	Ensure that any D-cache lines for the interval [start, end)
+ * 	are invalidated. Any partial lines at the ends of the interval are
+ *	also cleaned to PoC to prevent data loss.
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc)
+	__dcache_inval_poc_nosync
 	dsb	sy
 	ret
 SYM_FUNC_END(__pi_dcache_inval_poc)
 SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
 
+/*
+ *	dcache_inval_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end)
+ * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
+ *	sy is issued later
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
+	__dcache_inval_poc_nosync
+	ret
+SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
+SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
+
 /*
  *	dcache_clean_poc(start, end)
  *
-- 
2.39.3 (Apple Git-146)



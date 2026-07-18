Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82081C44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=; b=HsT/5AqdihIIadMH38v6YqLN1B
	4OeVjJ+9Ysoe4CRUhAkhcEiUz+gjfffsvMyj/zNuhDDU28Dj/s+xOhU65eGvMjYRPOn5bFLDTXcsc
	UNcfdqmMdtt4r+X/wq8Op3+aMhASpDhI9bdPz+pdNHUt4suPW48dw02WtwzBy6/yPc9M5xymqPYsA
	DDCFJQGubHI83Z65TcpD2IWBEVnr7hMmRq/v/so+FMcxkq8YW/1ADECctXW9HiwlHO5urI4CatkPN
	CQeUjMy6qLm/nbJuiJMcxytgKyHy8kNzj1pfWttdikqOpcKVBcwf9JEe5JRe0utubWAoPhnbOZPZ4
	4jpETMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1nG-00000003yc9-16XG;
	Sat, 18 Jul 2026 09:57:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1nD-00000003ybM-2dnP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:57:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7a269ca1so17989225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784368631; x=1784973431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=nOWkeBmW9US6+JUwRp3KU+zOy1gVbawUTJ/jVgr1DH2AH/rZEaZMOw2BDvrQJSPMH7
         HTXAMlH430EV4Mxe+ZsYr3zgnC/Lt9N3VIBbKGS21PhMDV1N6uAdpNz9WDjge4/2v6Ci
         llz2493b3j5WoUBHN4ewYrurFAwt//W4Kuk4eo7RnMEwbe3N8fJsEwWucG9nDHeyM+1y
         EGm7P64UGI3XGzAhKrU14byYsYGzyv2OmbVzVKLJtjqBx2aD/KGH3KzodPh4OVr1HD1N
         YhEa7sSXa1OZv3zC10U8bWHK7SmFpj7hqnhkF+S6GSV5CJvHKD/jXJ5yNMjZeRLMBsF8
         dwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784368631; x=1784973431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=rx9+5eKKQNHrfCU09Om1h9wmcihZmBaZtlcSvFpqHS6+sOmhl6McRhrWJz6QvfC2Ih
         mSgjVFi4YmGT9enDBSs4xs2E0OdoH8rBmlnAnE5ylWt+Mmgxtp5Xojs+m0sHYoW0iVwT
         hjM5yDTJdpF3Sj7HObvo6M9PihPgfsFgE1UN52Y2zrSTJoN942H+s0nkirDVnCnQlnBc
         8a1bcER8YllOrEVUpaDxy6ZJi53QhBU+cvEH45G2kj7qv5djqcklhWi4TrG01yLWtXXV
         WP+WQYsj8lHy8uznfy9t3utQsu3+YiOngMoii7mHPMI7B3T6aMMPtHK7aQKER3Tgk6yP
         0GPw==
X-Forwarded-Encrypted: i=1; AHgh+RpO2MRIC/CXwB14bAxsvxJzMwhY5zhSz3qJLMBhtfnE0CWIm1bMzC95FmwSRoCaKKfKhKUrR9Bzv0lLdr8pYbtM@lists.infradead.org
X-Gm-Message-State: AOJu0YzAAVUSVuzkdAGpzkyevmQbPduUlLi2M1sMtD3wGjXuc2nBM+ip
	eLRNdwiEgFJf8qpOLyQf/ynidbpuJN4DsimFkjyMBMskt6UYaj+dg3rE
X-Gm-Gg: AfdE7ckQXiDC1u+AUazsulHNZEr0x6zfDHOUq11TViHhfurg4+uP01WMUI2gE8KmxQE
	Xbv8GInP2an2rQ/++tZ8fdLPz3RHTOoCTD3giVbnhI1pUCJKcc3GzAQ+y1Hq7IZzRJgAWABN50Z
	yOIF/SebX+ZwF9vogaZED7wXab8LTDWE6JwxPSzuiLcSLQCmh+8zwZgLV29PS0hJSILbtrvGm0x
	tM7sCZmgGmqdFfvH9R3Y7VMz9PW5jmXeJsmRReADMqyp4Jlqff5XftwXCF6Yn5XYY1tRmP+qPIm
	igcYpyb6Adm/CsC0yKmSJQUJ7Ieh877yw2H0de6mxWqXqV65fI401wz9zOtixzrCl5HjW+HXp1C
	jT+C2NYvjsHzOtuaiuVRNWU280J6H9iSmSOrJ3t2VK58Jphi/rtTyEFn8Tuh2qCGptIJiLhAPJi
	zypa9V6x269MQoz7ObCkEtHPGp90eGS2l75iJB8x45wVNa
X-Received: by 2002:a05:6a20:9397:b0:3b4:7aae:1eed with SMTP id adf61e73a8af0-3c3ad91f768mr4682057637.4.1784368630603;
        Sat, 18 Jul 2026 02:57:10 -0700 (PDT)
Received: from debian.lan ([240e:391:eb4:a240::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm2417248b3a.30.2026.07.18.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:57:10 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v4 2/3] arm64/mm: add set_direct_map_ro_noflush()
Date: Sat, 18 Jul 2026 17:56:46 +0800
Message-ID: <20260718095647.182592-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
References: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_025711_671735_CD9B7476 
X-CRM114-Status: GOOD (  12.89  )
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

Implement set_direct_map_ro_noflush() for arm64 with update_range_prot() on
the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
existing can_set_direct_map() guard and leave TLB invalidation to the
caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..7083260303c3 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..c51236b61651 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return set_memory_valid(addr, nr, valid);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	if (!can_set_direct_map())
+		return 0;
+
+	return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_pages,
+				 __pgprot(PTE_RDONLY),
+				 __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
-- 
2.47.3



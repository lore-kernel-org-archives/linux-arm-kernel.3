Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CED5CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q9Iy1NRZrQdiv+3iSOUUb7XMLeE6HcnU1eSibV26qpo=; b=EKU2ChEuQW3cN5Xj4sWLV76+4S
	uTDo5gksTXz4+l/3n2JUz4DZ7iqtxh1gQaFayerBHjLaxVFDZ96xGUFY6YQ2QjWzF0QZkNTh6wSA1
	4B2MbeVShX7agGC1BYJ+ESHHnot3Zd8n0oIaeM2DxI7Z+QYGWEXMsT9TBTNs0Rnc70IACcLjo/yBg
	Yqm3ukaBnsWuJogF8OX/EEReqFOgxOusJjmsxqdLgTAPEGbegSPmZYIcDGJiJdn2dAZsW72RZuUec
	aVwDsdUhPEc/fXm+dVdcO99ORLWiuJ0VYt3RjWrQiN/bSvJKzyg+wK5LnwL6crcFimNd+lpGlpwe9
	7iIWwmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJe0-000000040gU-2t04;
	Sun, 21 Jun 2026 14:59:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJdy-000000040fp-1QFv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 14:59:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so2099848a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053969; x=1782658769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Iy1NRZrQdiv+3iSOUUb7XMLeE6HcnU1eSibV26qpo=;
        b=CXg67tffKdFqaGjef7gZPcn5nal10rdC3XJs5v8GFM55BwkdGor8V/7gEfjypMqhIj
         ajS0srat8p46Hg6gO7cK16/rdm1cb/yppmhUds5KvPFOkbT7q3JJ+uW/9odkVwenQhP+
         7rJcIvxgH5xxRl8Gk/jotToxUU7h0VMrDR1LHTE0EXg/CMguBwH4PNoy1XF0qQyM+K+X
         m09Ii6H/aYOJkA8S8BxNjqMqenrYKuAcXZn9az4bd6uagVGe8x3OQm+gEi27wZQeTtd3
         2jWmWJ97zvz3IdxcLZibXErB/gJJPxkOel4F7pwY/u/nyiQyXOO0x7qVPV+jh3Olz75w
         PrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053969; x=1782658769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9Iy1NRZrQdiv+3iSOUUb7XMLeE6HcnU1eSibV26qpo=;
        b=iYstq/cLnu0KMkHrKAwY9ZE6vx8sA0W0EitqByD5IPjaiNeLBHQ3bleVJJZuAUfowk
         ovr0qkB24weKXAmCvPPDfi9ymkMFxQHagijFGqBBpuqAzCWbXBSQanPTlgqzaN+/DbPg
         3wbHUNzLjVf9tEn8IpX1LRT2oUXOU/4bqD5canTrEqInrSbEseCxuJ/1dZJCGd8shhGN
         mj6GL+SDF6rYnKAP3OXBiBRJrmrfADXaCs6Y5z7UBPSh/iC0/D4rzhRJpWghTcrYMVKf
         e6aS3rEEx2VuxIdCxlsAhiamg/uI0CvByft4Xo1SM58sTfkEHYQqSpt+u2tqX4BDvJkm
         uNOw==
X-Forwarded-Encrypted: i=1; AHgh+RrNv1kOevh++RKEJU1asOoWeg+empF8yk5L11cerh0ZOX1G6xrkBsBt0FMtj7dgqlXxltHMmAJrj8qOwiC5AK/c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlzy1i0RMSimFDBf1fM3HJkOVFOKzspNDu5HnyFTo/X7mOrFXy
	pLjiyFJ3oufdq7C41cwbGZOy3bzMXnQ7ICOSIf92B9rqjOoXWACfeI+Z
X-Gm-Gg: AfdE7clgZMpWZtOr2qWIJe96wwSruw6CRdha2bOnDd1E4foklb0PQdMVJoKtuJGQPPq
	2rawSdAawOGTZt/6fbcAg9194g5/3zipBnG7M0rDfYEiItj/WKKKCH2316iT+0V1HGTXFDmYGFc
	qIgdCMmhDO+E8/HYs9o3c8nJDO+tjPXhOwVf9kVjj0KrGZITuFcoKjdNr9FhVzqTKADzhLO+KBH
	Rfdzf4bkvlz9tISXxKekqjP8J1pKauHbgHZl9Zp17EvfzUOrrY5Un/ZubgDZ/9Y2gQc8/FAXFFp
	H0Yj5gewKtZe2VtzFzRgfUEnLnoHmD3m5YAi0TvskOVZhQY17m2pEDEjK9OW4BwhoQ5QO1yukGW
	cc9eBIM5b6tdjWiVYADnZCOpoVWkcCSJlriRa7JCACg23tmR5E498BBYVgA39h8qLhx6/8HVLzq
	eEeUGTd5ZxR8n+Izgz4Q==
X-Received: by 2002:a17:90b:1807:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-37d1ea12264mr9696809a91.24.1782053968739;
        Sun, 21 Jun 2026 07:59:28 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:28 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 0/6] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Sun, 21 Jun 2026 23:59:10 +0900
Message-ID: <20260621145919.1453-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_075930_419580_D5867776 
X-CRM114-Status: GOOD (  10.96  )
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

The memblock API guarantees that for_each_mem_range() and
for_each_mem_pfn_range() never return an invalid range, meaning start is
always less than end.

Several memblock callers still have unnecessary invalid range checks in
their loop bodies, so remove them.

Patches 1-4 cover for_each_mem_range() callers. memblock never stores a
zero-size region, so the range it returns always has start < end. Some
callers apply __va() or __phys_to_virt() before comparing, but these keep
start < end too, so the check is unreachable.

Patches 5-6 cover for_each_mem_pfn_range() callers. __next_mem_pfn_range()
skips any region that contains no whole page, so it only ever returns
start_pfn < end_pfn and the check is unnecessary.

For reference, commit 36ca7f4be809 ("arm64: mm: Remove bogus stop
condition from map_mem() loop") did a similar cleanup in arm64 map_mem().

All these checks are in different trees, so I split the change into one
patch per arch/subsystem. The patches are independent and can be applied
separately.

Sang-Heon Jeon (6):
  arm64: mm: remove unreachable invalid range check in
    kasan_init_shadow()
  LoongArch: remove unreachable invalid range check in kasan_init()
  riscv: remove unreachable invalid range check in
    create_linear_mapping_page_table()
  riscv: remove unreachable invalid range check in kasan_init()
  mm: remove unnecessary empty range check in
    early_calculate_totalpages()
  mm/hugetlb: remove unnecessary empty range check in
    hugetlb_bootmem_set_nodes()

 arch/arm64/mm/kasan_init.c     | 3 ---
 arch/loongarch/mm/kasan_init.c | 3 ---
 arch/riscv/mm/init.c           | 2 --
 arch/riscv/mm/kasan_init.c     | 3 ---
 mm/hugetlb.c                   | 3 +--
 mm/mm_init.c                   | 3 +--
 6 files changed, 2 insertions(+), 15 deletions(-)

-- 
2.43.0



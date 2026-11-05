Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59753606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ANpNMp4S;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EQsr1ssG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=; b=ANpNMp4SSTwx54dH1Jfc40JdJ1
	3FFJv+2tdVjDQdsAMGmlrCk9Zqq07x/czZWZSd/TS4xwsYC3JsbhaTVGMwFa+kWEnYGbQk8pnaCXQ
	4Xr0b8AYllt5/fxQuqbOYo8UGxt029G1/K6q8+JFBHr8/qDaRmo7jg2Nh33fvLNtHa+txnDMIZ8ZJ
	FPRjQSNqfY2kcItlyVLc2sk2UOTj/LLLCf8HltogLcc8OD+/AcjObxeJRcJgeQP3mzgQqlmHX40Ee
	plWCPW5UidzuYKC72ptH6EASmORBigpFSgH/dBmW1JQrIAfsfcLOVmHOjfTgyYP3nDFSZhF8EQRgL
	KFts3RaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiI-00000007v6d-16WJ;
	Thu, 05 Nov 2026 06:12:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiE-00000007v4o-15aS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:41 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso700602a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 22:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859154; x=1794463954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=EQsr1ssGqelRhA7S9v5/D3QFDDUP3QfJSHjJYU/PwvexBtwMQQN0gxBKDw1cYO7hIk
         XbhrhU5N+eMndo8mktlq4BPQTJFNsKvqi6N7O+W012taPuec/kW9fUTJI4k9CuuNaQxd
         pSJSSyim9uvMk+JvJbIItIpRJns7bQTRiIceZvyJVMtob616nvxt20gVOJTmBrOf9yeG
         ktHfFk1OFgeUZhcTtAis3tq3Hf2FVFbvd0lDFV7OEWK0xXujNIs5gNrG3FmKR8Ydg7hE
         I2OGjt7BwmfxZyKETw7g5f3lvQ0oytuQ1x5Ta7e2zDhVC6D4X+C5xMX3m6TtKjRmXTDY
         /XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859154; x=1794463954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=KyU1InKW1Mo+tTRWe8lSswSNk3wetm1VA8hQWn6JyytQjsZUTliw1Grsbf6zyJnSzn
         TNHckRsCWqgLYvK+asVWW6oeW734NGBX4fxxpC7tyJQQFyU6Oc5jmGy7FT2hPwPWluJF
         pKYc2aVPEKghrA+o1nEF6jXC0HbTQ3JoKQ1tBXy8SnK+A9SKgq4iMtB61TRBPuByj+Cn
         6l8ET7WavvMXtwaSfaQmfMK9QPKJTck5IuEn1wVkcd/Dp8zBy4iBkFWu4SfY5/uDmtZj
         6F2PxWb6mlayWpA24vULlOV7OjJcL23BWJrb5HuT6u11ak830nyDD51WWd4pggTI4a3g
         zpMg==
X-Forwarded-Encrypted: i=1; AKwUvBxr9cnIUBKZaZHauyiGP0diqk2ARSEnZajAtKxXoFDR03UhUdNjCTU9l1Ye10p0dck5bCdbEhM1BLyhTwsD6mtK@lists.infradead.org
X-Gm-Message-State: APuU4Z9nDk5JAubMWlFMsE/MkF7bIRF/0Wu8zp3Z/nKmjvY02c+WDgF/
	6ekZI9jqK7IHIqjK1nRf9xgpXK99Poxr0UwT6GnG7IbJH2/SJFs+9bclFWLZkW/nLw0=
X-Gm-Gg: AYBFou0s/1wrwo5mgZXsBXZ9kEB5SICj4x/mALwPGkGSsYHWVL2/T9xjGsWoz9NSNG9
	nhbAOldWjLKXRW4qiaWRXzrgQVHz6ojQDjW34/ZsCj3pyRa0O8vdqxd6ZRHtqRJFN925uopY1m/
	jYVclGL6TseNx2Zyfvetdt6vEXvENWu/3cQpN9mcflgDn2e3B59A9MuH9E/lcJPeQR3bS8X0Uz5
	hQOj+NoJxeiW/s2yciamE09W9kELtohiKzMmDRE6pCv/aU7xSXNNcRXv/Z2RP2kXESfeWQjGQET
	ccVxUYWtNmYExq7jBZWsphuoBHe/aWkU7KEPBvyJOz+cr+ZODYbnQD3YnZoq8MtmCuIgG+JCtlr
	jBiY096uloBjQ6ueBU4Tg7BmZIjhrrICvTb9YP1DRys1nGsUX2ajzz+NTKofSOkGBYmx+44uh5r
	3//2vV5/OmWpwX9OkHfoiCBEsZf1MQZ0tGTpfNhri7zvjqGkcA43O2cYmvYP2N3qliwZ24mdlUS
	fK0CiF+o8/DacsF75zhpJZ6/lZOirPuwHjBQQmaCiGv9fnu3NVHSN1ILWQBJhdmYpyGDWH8JTtR
	Lavh93QiglqseM5ZdeKfE+ZUv6KB3+ubLn4ySgNmoWcp+U9r9Sp3PrAJZugHDxgjWg==
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr15532805a91.30.1793859153687;
        Wed, 04 Nov 2026 22:12:33 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:32 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Thu,  5 Nov 2026 14:12:12 +0800
Message-ID: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221238_682890_803D74EE 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: simplifying the device DAX vmemmap
optimization plumbing.

After device DAX was converted to section-based vmemmap optimization,
whether a mapping can be optimized is carried in mem_section, and the
architecture-specific population path can handle any remaining fallback.
The code still retains the DAX-specific vmemmap_can_optimize() helper, a
PowerPC override, and @pgmap arguments threaded through lower-level
vmemmap population and memory-removal interfaces. These duplicate the
section-order policy and keep otherwise generic paths coupled to
dev_pagemap.

This series removes that obsolete plumbing by consolidating the
optimization policy around memory-section metadata and simplifying the
generic and architecture-specific population paths. This also eliminates
dependencies that are no longer needed once the optimization state is
carried by the memory section.

This leaves the section compound order as the single source of truth for
vmemmap optimization and decouples the generic sparse-vmemmap and
memory-hotplug paths from device DAX.

This is another smaller step toward the broader HVO generalization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v2:
- Rebase onto mm-new at dba8aba0a9a0
- Add section_vmemmap_optimization_disable() and use it for PowerPC,
  LoongArch, and altmap fallbacks.
- Add a LoongArch patch that keeps device DAX vmemmap optimization
  disabled while leaving HugeTLB HVO unchanged.
- Ignore section compound orders that cannot be optimized.
- Add direct vmemmap-optimization.h includes for architecture users.

v1: https://lore.kernel.org/20261030140720.1256062-1-songmuchun@bytedance.com/

Muchun Song (5):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  loongarch/mm: disable device DAX vmemmap optimization
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 +-
 arch/loongarch/mm/init.c                   |  7 +--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 +++------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +-
 arch/riscv/mm/init.c                       |  5 +-
 arch/s390/mm/init.c                        |  5 +-
 arch/x86/mm/init_64.c                      |  5 +-
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +---------------
 include/linux/vmemmap-optimization.h       | 56 +++++++++++++++++-----
 mm/memory_hotplug.c                        | 16 +++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 29 ++++++-----
 mm/sparse.c                                |  6 +--
 mm/sparse.h                                |  5 --
 17 files changed, 97 insertions(+), 136 deletions(-)


base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.54.0



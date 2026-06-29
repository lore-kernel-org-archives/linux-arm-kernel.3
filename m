Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F121C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=; b=2EnDL2NPBfrHP3LGJ249/B3jYn
	TDzpEkwKTg2l4/yeiJfBmKItdS50Ycqyq4SWHTmQYiPqSxkbF6R6biy/+KZjJBs+aRQ5skFMUILWl
	JPfDoyeYA5tDw5tDHMMLlh+EYjONAdK2nKP+tdjGg1j4SYZUrfEyD6AEMIbRv9LsbQkdQ3VEyawRL
	199J0EJ3Hn2GwbdEiv7NpqGJxwls1cpc7/Dl2O/wlpuyJ7fnJAhIHZgZyJZtfY2ivnLiZTmRQhAZz
	jNo0QLJOQhWGAPw0OwlIzOzI6cCb8EJk8vNN50hRGoKl7LHKlDkgTr9GHb24yKutFUJWdlWEjMlN5
	Rpp7HP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEza-0000000FE55-26FE;
	Mon, 29 Jun 2026 16:37:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzY-0000000FE4N-2HUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:37:53 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84794e800f4so393220b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751071; x=1783355871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=Vct/HXmJNygBir/JepxBAXm8Ei6WoOD/mWThqGnizaQ9xoDYN/HrFhqKFLJIKOi2uB
         gJVop+q9BVL9ptWWPV04XqtYXc3LlAbQNGoFAPKDaD08lsCgHCfNXSMOfrpsJSfa138k
         flo28sZ5A52kl7f/xTMNVKWnJVn9XuG0xCLir7iy+WvkLBYz2UcwSkUfyx+VF8U6sOJS
         xkrsrQ3ZDyg1DXZNu/fzEjrd6gMh2WK0QRStzpcBLdB5n58KwACVi1cHVAm2JX/JlR2z
         KeqTMgstllYWS62r74iGuGrH6LMmnOcEAjjZv2Yx93hX7FrFSIYEEee6DLKNcRHEueC7
         rDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751071; x=1783355871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=N7IHzzrjVIyoaFAfYyvAsUXLazaXpGO870pO4AH57oILZN/KVjO5Uip3H3hNcnDiSF
         384ce/4y4C/CLXSQTcGn24P6GFyRvsRD+uv14uxbX0exhxhsdduUAW9SG5y+yx87k9mK
         YfZTxRmtx58uNY3l7RS6Dfqy4J0iOfJrmZS0TxhqDHDe9Nz73a1p8OPx/W6rauvTOgrZ
         KB/1x3u266ey/t9aPqscySAzStVVfLKJt1NMCAH0V1YeNiyHrSmblMWidtoDAiHD4moQ
         tPbzCrwfKGYf+MKPyrHuA+Gq80zkKe40FhjSiJHVjAJwBLQhLUZDUxuGbjkEPsL2z4NE
         UPaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bzkDpRWGE2YLn7b6++TUQFfc7y5O3011kMN1h8DV7v6zxe/VFHZ/y358ltepuabzLxEwMfHt6lQlvco0rMGGq@lists.infradead.org
X-Gm-Message-State: AOJu0YygESqRcbuv46R9/PPbqL494oti8ID2vfwpn8WlHzfE/5h0dD65
	8wsocERnjC5fKnbi10+bxwdtf5rY7fajCGlheZ9FVP0PGB4z8L1jBujr
X-Gm-Gg: AfdE7ckXfBPcPzBO1bgLp/5K5n6XsmxglyzlfQPNx5JH1i5VsYd66ddGU4VG3zTY190
	nUok51zkoD0zS4AgOeHK7D5Ho+crpp5xuZyceBm5e+SSFolfpXSpT0AUgCyRcVPn/luSmf38ooA
	nFXd/nbmhklNLQozH4Vt+B7wVi4qLNCARNV3qgJwAfvybYuXfJ57kdYe1eg0BWuOrskPSwu14at
	8YRb3c+9Oi1lqyrtKgGHaGs4ysGzK9lWpitxKjTWtu4XrEXXnoS6FsgQpQHNQOvc24fdmjWV/J4
	d29FnsDEP0Uvz/ZrxdsirmFka3+rzkTSuhh+wrl4lfz1qJPnkiwXTbi369rRImKk4k3n2SphPou
	+8YSQThcXzEAaTm3hUfcDti/reRNb05PBgprJQhJmaXEt3HSsf7oBlGJzvjAbLpdqYuMMMN5Eq3
	G9lIvZwCU=
X-Received: by 2002:a05:6a00:92a5:b0:847:8337:64e4 with SMTP id d2e1a72fcca58-8479f1f553amr205069b3a.30.1782751071179;
        Mon, 29 Jun 2026 09:37:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:37:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Nicholas Piggin <npiggin@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v2 0/8] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Tue, 30 Jun 2026 01:37:28 +0900
Message-ID: <20260629163736.1606688-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093752_615229_475781BD 
X-CRM114-Status: GOOD (  12.97  )
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

Patches 1-6 cover for_each_mem_range() callers. memblock never stores a
zero-size region, so the range it returns always has start < end. Some
callers apply __va() or __phys_to_virt() before comparing, but these keep
start < end too, so the check is unreachable.

Patches 7-8 cover for_each_mem_pfn_range() callers. __next_mem_pfn_range()
skips any region that contains no whole page, so it only ever returns
start_pfn < end_pfn and the check is unnecessary.

For reference, commit 36ca7f4be809 ("arm64: mm: Remove bogus stop
condition from map_mem() loop") did a similar cleanup in arm64 map_mem().

All these checks are in different trees, so I split the change into one
patch per arch/subsystem. The patches are independent and can be applied
separately.

---
Changes from v1 [1]
- Add review-by, tested-by tags from v1
- Add missing simliar patches(5,6) to patch series
- Change base to rppt/for-next

[1] https://lore.kernel.org/all/20260621145919.1453-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (8):
  arm64: mm: remove unreachable invalid range check in
    kasan_init_shadow()
  LoongArch: remove unreachable invalid range check in kasan_init()
  riscv: remove unreachable invalid range check in
    create_linear_mapping_page_table()
  riscv: remove unreachable invalid range check in kasan_init()
  ARM: remove unreachable invalid range check in kasan_init()
  powerpc64/kasan: Remove unreachable invalid range check in
    kasan_init_phys_region()
  mm: remove unnecessary empty range check in
    early_calculate_totalpages()
  mm/hugetlb: remove unnecessary empty range check in
    hugetlb_bootmem_set_nodes()

 arch/arm/mm/kasan_init.c               | 6 ------
 arch/arm64/mm/kasan_init.c             | 3 ---
 arch/loongarch/mm/kasan_init.c         | 3 ---
 arch/powerpc/mm/kasan/init_book3e_64.c | 3 ---
 arch/powerpc/mm/kasan/init_book3s_64.c | 3 ---
 arch/riscv/mm/init.c                   | 2 --
 arch/riscv/mm/kasan_init.c             | 3 ---
 mm/hugetlb.c                           | 3 +--
 mm/mm_init.c                           | 3 +--
 9 files changed, 2 insertions(+), 27 deletions(-)

-- 
2.43.0



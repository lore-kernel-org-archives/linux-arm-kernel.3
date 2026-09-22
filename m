Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CBBC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7mc5rE1gQW0RRDNm86nGn4GcNeBbnQk6KAZPcwbRqI=; b=oq6k4JasFcN6ZK
	qHfWk+c1b5juHYX9ptigr66HK/9Y3ozipYLeumrCIo4y48u4Pfy+06JqqPdwVNK1Fkl0JpZXEJrhz
	Li1P6gYuhdWTpLt4CLj86WPBgABPNZAw9tIBhNlvhhEbWwxyxQob6t/0zpZPH38Rda9k8tBtjx0Sk
	XDNd80xOEN69E6l/F8ZjBNng4m69iBwoyPyB/T2m7BEfJuBfxNuk33+NHVHQbdDrAqzLaxUynr6oH
	Vg7BSDQZve4G4GSvsm/8XJAzX3ULhtiuJptaVXykZIk6wxxaIrkVxvcZOjZ48qZSBFjkLj1eMrWbx
	h8fsvh1FjM7xUoHI05Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94MS-00000006Cuc-3pEA;
	Tue, 22 Sep 2026 17:32:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94MQ-00000006Ctj-1gaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:32:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 882C71576;
	Tue, 22 Sep 2026 10:32:46 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8B23F86C;
	Tue, 22 Sep 2026 10:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098370; bh=+Su2l1Ft0WBIXjZQ/cFjqH8CISUnq3bv3Vk6lON45EY=;
	h=From:Subject:Date:To:Cc:From;
	b=CLvRHaG0VyM0revKNsxvp8O1elOZLQpJ6DZ/UqshepIIeiFSTz9Cvbo1Bi1RsOx1U
	 8EaiMzAhvfYdAUN/o0PB9bBvwOXciKqWtNyWKjdw8/ifa495+DcTdpxoDTKvE9pwHx
	 DnO9RWv/nE2LTlquxhGKLaA4/gNOjwqqlKJzSX7Q=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 0/6] arm64: distinguish HW PTE pointers from SW PTE
 value pointers
Date: Tue, 22 Sep 2026 18:31:55 +0100
Message-Id: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIy7smoC/0WP0W7DIAxFfyXieUwGFgx92n9M1QSOWXlI00IWb
 ary76N02t58Lesc35uoXDJXcRhuovCWa17OLeinQdApnD9Y5qlloUFb8ErJy8rwHsosk4o4JSS
 IoxLt/FI45a+Oejs+cuHrZyOuj6WYudbQiU3QeVp3ntyMBDlahOgoehj9azM80zLfwTFUlm2e8
 3oYOEwIQAERyGllMSSjrdaUXLSOfHJIhpDE/YVTrutSvnu5TfUffnu8/PfYVHPHOJporWHj7Z/
 7uO/7D/xl6R8hAQAA
X-Change-ID: 20260911-pte0_arm-f1b7df7c0b51
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103254_520301_6B0E7DC1 
X-CRM114-Status: GOOD (  14.06  )
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

Hi,

The generic series introduces hw_pte_t for HW PTEs, while SW PTE values
use pte_t. This series enables the distinct type on arm64 so the
compiler can distinguish HW PTE pointers (hw_pte_t *) from SW PTE value
pointers (pte_t *).

The conversion updates HW PTE pointers and accessors, including atomic
updates, fixmap, and early page-table construction, before selecting
ARCH_HAS_HW_PTE_T. Higher-level entry types remain out of scope, and
shared helpers retain explicit casts.

The linked generic series is a prerequisite. Its cover contains the
Coccinelle script used for most pointer conversions; the remaining sites
were converted by hand.

Testing:
Testing was performed with and without the series on both x86_64 and
arm64. KUnit and the MM kselftests produced matching before-and-after
results problems or regressions. Fastpath performance testing was also
completed on arm64. No regression was found.

Link: https://lore.kernel.org/all/20260922-pte0-v3-0-5670b8cb9059@arm.com  
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes in v2:
- Move hw_pte_val() to the generic series and drop an unrelated comment
  change from the atomic-access patch.
- Use raw PTE values instead of generic HW/SW conversion helpers.
- Drop a comment and add testing resutls in the cover letter
- Add Reviewed-by tags.
- Link to v1: https://patch.msgid.link/20260914-pte0_arm-v1-0-bb53b663e396@arm.com

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: Alexander Potapenko <glider@google.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: usama.anjum@arm.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: kasan-dev@googlegroups.com

---
Muhammad Usama Anjum (6):
      arm64: use hw_pte_t for HW PTE pointers
      arm64: use hw_pte_val for HW PTE atomics
      arm64: use hw_pte_val for HW PTE loads and stores
      arm64: use hw_pte_t for fixmap HW PTEs
      arm64: use HW PTE accessors in early map_range()
      arm64: enable a distinct type for HW PTEs

 arch/arm64/Kconfig                |   1 +
 arch/arm64/include/asm/hugetlb.h  |  19 ++++----
 arch/arm64/include/asm/pgalloc.h  |   2 +-
 arch/arm64/include/asm/pgtable.h  | 157 ++++++++++++++++++++++++++++++++++------------------------------
 arch/arm64/include/asm/vmalloc.h  |   2 +-
 arch/arm64/kernel/efi.c           |   3 +-
 arch/arm64/kernel/pi/map_kernel.c |   4 +-
 arch/arm64/kernel/pi/map_range.c  |  20 +++++----
 arch/arm64/kernel/pi/pi.h         |   3 +-
 arch/arm64/mm/contpte.c           |  49 ++++++++++----------
 arch/arm64/mm/fault.c             |   7 +--
 arch/arm64/mm/fixmap.c            |   8 ++--
 arch/arm64/mm/hugetlbpage.c       |  48 ++++++++++----------
 arch/arm64/mm/kasan_init.c        |   4 +-
 arch/arm64/mm/mmu.c               |  46 +++++++++++--------
 arch/arm64/mm/pageattr.c          |   4 +-
 arch/arm64/mm/trans_pgd.c         |   4 +-
 17 files changed, 207 insertions(+), 174 deletions(-)
---
base-commit: ead700ca770c82167af32622cf8b68c9f87c3c7c
change-id: 20260911-pte0_arm-f1b7df7c0b51
prerequisite-message-id: 20260922-pte0-v3-0-5670b8cb9059@arm.com
prerequisite-patch-id: 0114fcc6ab0dbb739b5bb6fc0fe6b1c8f1fa37a1
prerequisite-patch-id: 09fcf65970074620dd3a9cce6850b901beb01db8
prerequisite-patch-id: 9b2fdab97c99effabb85526fa7f141c933b3aa23
prerequisite-patch-id: 1aa309a26d98a1e93a54742705a03567ee93be71
prerequisite-patch-id: ebe32f52c95ad0542982f0b37798d209595e25e1
prerequisite-patch-id: 22950028c3d2060de8acd3fe4a73d755b18215e3
prerequisite-patch-id: a60d249f52d092524176851b2570d7245bb24434
prerequisite-patch-id: 81ebd1378e25d40a1771b53973abcc4defa87535
prerequisite-patch-id: d982f2b00c5eddb2459f69008a73e4f4ae4d8299

Best regards,
--  
Usama



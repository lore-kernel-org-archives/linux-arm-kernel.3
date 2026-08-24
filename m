Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A599C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r8ZiiYT+9qVzSyjIbRiqcRyxSZUtJgeMflUyVARDCFk=; b=FDBMu5ZGqv9SeafyS7NJO9X81c
	4dfefihYvyRx+G5AWrDDqC1kXbvblZ1t3QCIg3e8W0TLhGDEbVHe5/R2CIdpOYHA7pSldoVsOT9QH
	rl121IgG13ix0l72JRPmiOsgez0E7AyB6txSPHDwup/BP95kBn2f1cCHnI8ycbtmIyotgQ2pRiea2
	cZfRN6MXrEf02/39yOCAsFRSYEkubMFWUv2iX64HANM1GM893FQjCIR4nVnBNgbAMzhM+aXu3rxu8
	K2h72C2M41ilWW7vwSOxmMQM6JLhbQ/Il0XdvfOXtdjmu/7432XX2BDdJOu6ac5Q2cm4lfyOgArTF
	EV/06+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBH-0000000H09z-2zhV;
	Mon, 24 Aug 2026 16:05:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBE-0000000H08z-2CFG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:05:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492D816F2;
	Mon, 24 Aug 2026 09:05:43 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD55E3F85F;
	Mon, 24 Aug 2026 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587547; bh=1MvPs/PV2tLB4HDsvTjKWixuWNV1rCXGW/G3quH+LLs=;
	h=From:To:Cc:Subject:Date:From;
	b=vw1mzenUY8gK8nUmmAxeKjb9a86TCQ0iVEQWg8R7B4POGuzbglchYJbzDSfmmTfv0
	 gXGiOcK9oIuGSjJ3XjCUH6YEhOp7EgFCD0Z04j3UVhXsw8NB6vnhAHCoq6Him6v4/4
	 emWSAony0re2jPv4WqmCIZPzZeU8g/k+ttOmssaA=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	bpf@vger.kernel.org (open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - CORE)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 0/7] arm64: Batch PSTATE.TCO handling in kernel nofault loops
Date: Mon, 24 Aug 2026 17:04:45 +0100
Message-ID: <20260824160523.3907021-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090548_697397_4C84BE2E 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

With Hardware Tag-Based KASAN in asynchronous or asymmetric mode, kernel
nofault loops currently set and clear PSTATE.TCO around every access.

Introduce bare nofault accessors, batching hooks, and an internal scope
guard. Convert maccess page-fault cleanup to scoped form. Skip
page-fault setup for zero-sized kernel nofault copies and zero-length
BPF string operations. Then use bare primitives in the maccess and BPF
loops. For non-empty operations, this reduces the code-derived dynamic
MSR TCO execution count from 2N to 2. Two-string BPF comparisons fall
from 4N to 2.

The BPF changes and an earlier maccess implementation with explicit
cleanup were tested with QEMU arm64 using Hardware Tag-Based KASAN in
synchronous, asynchronous, and asymmetric modes. All nine arm64 MTE
kselftests passed in each mode, as did the 138 focused BPF string_kfuncs
and varlen subtests. The focused BPF tests also passed with the default
non-MTE arm64 CPU model. Both final maccess scoped-guard patches were
arm64 cross-built. Runtime tests have not been rerun after that
conversion.

Muhammad Usama Anjum (7):
  arm64: uaccess: Add batched kernel nofault accessors
  uaccess: Add scope guard for bare kernel nofault regions
  maccess: Skip setup for zero-sized kernel nofault copies
  maccess: Use a scoped guard for page faults
  maccess: Batch TCO handling in kernel nofault loops
  bpf: Skip setup for zero-length string kfunc operations
  bpf: Batch TCO handling in string kfuncs

 arch/arm64/include/asm/uaccess.h | 71 ++++++++++++++++++++++++--------
 include/linux/uaccess.h          | 20 +++++++++
 kernel/bpf/helpers.c             | 41 ++++++++++++------
 mm/maccess.c                     | 68 ++++++++++++++++--------------
 4 files changed, 139 insertions(+), 61 deletions(-)

-- 
2.47.3



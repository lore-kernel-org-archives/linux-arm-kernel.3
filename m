Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0C3D74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gi4BPC4AMeAfrncqfJZ6M8Gr4YN2FYW/OAnF93oRW0=; b=BT6A3FRBIHmKzFN4EjFpbINVff
	gOg+g5hlhQYxf3Djq9CkqKGS8kkFBv7uKZFWxtJLZ4mEqyi6tQNd0z3+ecdQVhxAlremhtDHF7mm4
	XebwT8f9s9MLBKbRwi3Jo8I/aTPyq8kMrOKcV7JPz6UmkgcoICDDKhp8GO/UUQgVW+maifyE7tIVU
	+tcZs25SFC9RzAry6Kz9XFKnzs5bB4Sr5pROG1SDNEET/9jqrRRycDikH8g1d+uABrVE87C1o+i8K
	sRhAQFUaeoAJU5iWtmZgdjmcqOIJi5lLwEnsDfNkmOV6Zluzq22nEhEPIHho9SZOICwOxA/NKsJVQ
	Qj19mGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsi-0000000CC04-3mXd;
	Mon, 26 Jan 2026 09:27:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsg-0000000CBz6-11v1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so46393935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419651; x=1770024451; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3gi4BPC4AMeAfrncqfJZ6M8Gr4YN2FYW/OAnF93oRW0=;
        b=HrI5yN0EVmrnKpoYi54pxelTVz8hDoAyvPsHnqSKd36VL+lqY2liWqxec2lbvXfpfq
         /tIXIKYC+Fuud7UsVdqY7Km+sbquc4oPEDAniCeQG4LnBEfdvUwcr1WsDEwfYUuD3uJW
         gisW87MpZ1iaocKKv8IXVLxC34yb4NUBIOr3g/FsEgCuNHmFjbW2CSr8N8YzQNNqNt5N
         ZB5MGrFx+BJxjsofhJTGhrD6B7M3cDEUCGgLBlnErM0fBsVNQJsLn/B67G1nFSSw1OG9
         OC88ne3cktzqnFVKGT1QI5KC3jU8F7847auilJuFenYLU7FGW/7Td0/NACgaFhv7PeeM
         2gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419651; x=1770024451;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gi4BPC4AMeAfrncqfJZ6M8Gr4YN2FYW/OAnF93oRW0=;
        b=NxIi9UxOUpzb0fj1SNDP1e2EB0VwmDDBWC+nZ5pKMN4jseY7Rh10QzvgpUJjQZIyeo
         wEcABS3p3f7h0Bmk+w7vUYtYCruCaTzrTrqzjv1LsnInh2RHPawchqn2FMO4zRv3/+Jp
         8q0KRXh4o2NeYLFpot723ifjyeBIhAmlkYKv0flfF1/1iNS++8hYIH9uz2fvf4dE3z6U
         KS+AVhTFCOBa2E5whp9m4Dr39AGwkHS2llOLe/xgNhfUa5breCHZROPso7QcKsY2nyEy
         pfXL9+resb2eY6kNfpMUytLYHrCZw8wk+1NHyMJnlMzZ0KWz6H8/uiIGuUed8Eq3LulP
         U3+A==
X-Gm-Message-State: AOJu0Yzbyu2YrO6gwU7ofU8cYVMhecl25ygbT6j3hq3ehY227i0NCiAB
	4oqhmHZPFPSm5zRR3OU9d9F3TTsLB9jl2p85+mES9kqC2s/n3EjiTZdk2DkbtbIYqjlA3rtHGQ=
	=
X-Received: from wmoz10.prod.google.com ([2002:a05:600c:78a:b0:480:1b84:b6e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1547:b0:47a:8088:439c
 with SMTP id 5b1f17b1804b1-4805d065d80mr73660365e9.35.1769419651572; Mon, 26
 Jan 2026 01:27:31 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:31 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=ardb@kernel.org;
 h=from:subject; bh=Ap4lsZMuDyOofvFMFnMiKyoC8iLDVYVQLkvGkqS0gAs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2L1g8uuyjPcXXdKLDtvWNxdXvd3cX/T5e9hlHXnGp
 cnx0i4dpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIz1zMyXN71+kra89XKJlwn
 dySpiXpz9G/71b8wq1aAdWLh/i9SDIwMM4N9XS/+NZ+w98KVaLHGO3ssbt78cfLZhCOHXrya8u/ 2HyYA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-12-ardb+git@google.com>
Subject: [PATCH v2 00/10] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012734_300141_007C4E5F 
X-CRM114-Status: GOOD (  12.65  )
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

From: Ard Biesheuvel <ardb@kernel.org>

One of the reasons the lack of randomization of the linear map on arm64
is considered problematic is the fact that bootloaders adhering to the
original arm64 boot protocol may place the kernel at the base of DRAM,
and therefore at the base of the non-randomized linear map. This puts a
writable alias of the kernel's data and bss regions at a predictable
location, removing the need for an attacker to guess where KASLR mapped
the kernel.

Let's unmap this linear, writable alias entirely, so that knowing the
location of the linear alias does not give write access to the kernel's
data and bss regions.

Changes since v1:
- Put zero page patch at the start of the series
- Tweak __map_memblock() API to respect existing table and contiguous
  mappings, so that the logic to map the kernel alias can be simplified
- Stop abusing the MEMBLOCK_NOMAP flag to initially omit the kernel
  linear alias from the linear map
- Some additional cleanup patches
- Use proper API [set_memory_valid()] to (un)map the linear alias of
  data/bss.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (10):
  arm64: Move the zero page to rodata
  arm64: Move fixmap page tables to end of kernel image
  arm64: mm: Permit contiguous descriptors to be rewritten
  arm64: mm: Preserve existing table mappings when mapping DRAM
  arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
  arm64: mm: Remove bogus stop condition from map_mem() loop
  arm64: mm: Drop redundant pgd_t* argument from map_mem()
  arm64: mm: Don't abuse memblock NOMAP to check for overlaps
  arm64: mm: Map the kernel data/bss read-only in the linear map
  arm64: mm: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/pgtable.h  |   4 +
 arch/arm64/include/asm/sections.h |   1 +
 arch/arm64/kernel/vmlinux.lds.S   |   6 ++
 arch/arm64/mm/fixmap.c            |   7 +-
 arch/arm64/mm/mmu.c               | 111 +++++++++++++-------
 5 files changed, 87 insertions(+), 42 deletions(-)


base-commit: f8261772d6a032f18aacd4d1a18bca5bd4e4a368
-- 
2.52.0.457.g6b5491de43-goog



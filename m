Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20958C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JyUPYL2OrXSKt8rHjiCQrmfpBKq5z8MLwljG9M1Hes8=; b=12HYVw0przuPPeWgLSYdZx+8B3
	IZ1NjH3kScWiLso0fl+gytg0R7uUP09o5jfmTwRb2iYWT5PwELDYQF48+XxtaNdS/wOVXUbHCjeqM
	2N9bWa1ABw3uyRo/KQkcMl/qrVt9g+pqenn5IeVGPC/ArK8WWeyBhnqIP1VUqGqhWWep4LB/qk7lL
	ElFrnji5lyHTDi/n6yaPJl8tw12fclNBB/iNuTd9ddjKcEV9N/6n7iIDL0OJoKrfDVuF+06DcBtn3
	PVNty3MjrcmjXKtXL+vZPOaNK3wAcewmj/rGM6x4vN93V2iLR+zDBHle5UEZ2bOsLmj0dQpkfLLfm
	9eeYd1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjF-00000009xNQ-1vVT;
	Thu, 30 Jul 2026 09:07:01 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjD-00000009xMw-0Fav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:07:00 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-849f2f32facso140051b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402418; x=1786007218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyUPYL2OrXSKt8rHjiCQrmfpBKq5z8MLwljG9M1Hes8=;
        b=n/Y/k1CvBAccbQzls6d4SOydLTHkjYAs7PeUTS7AiS4RxdWeBS8ASiOxmsgedJgVvE
         3rObN2W0MhCd4j+LLQ1IiW1MUtxzhiT93pIxMjwYzsZSzEbVGYuOMvd+VAMhQ33xrcvc
         R41YXZbnC3YWZd/2aK5r8WbpzTsT52co/wPqeG26azP+4xiOdagMv7ziaPBDyHBjhDao
         C6yoNobM3gE7S6oxbP/iXsoSEGDcfiPL9iJwQYWZ7gYMV8xCP3XEdBP5jIau/kI/kSGw
         Sqa4w+4ywfmmEByCKOZOxzR6OI02qLQb4s6PGo2nznkhoNMHGqem1+kkNCPQjR/voF2I
         XmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402418; x=1786007218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyUPYL2OrXSKt8rHjiCQrmfpBKq5z8MLwljG9M1Hes8=;
        b=ZQMAYih3EPztsoQErBNwrxYVgPcWhav7jGf4vhz20ecoGZKs52g16ybHicmjC82nkD
         xh8kzcunIRaQuuwYtOkJVaC9MhvYdz7UZvq3dEq9PnDRqa2u2RL0QS5YvP/5bQmdRz7n
         MiVHpSdQvDlWcGYIyJYi8U9NYse9FcODPTG0uXYryfkNCsbGbji1aojTr3rfTwjS6DEh
         s+MmScS4P1cOrkJG7rrhVHzIFkdg5mu7WfLH0hN9Y3vU7hOlefpt6nPyEr2+wfQhcDu9
         a/t6FqIY2O3nfTkvBlu2J+JqTkkhOk+LvsNRvYqKwNWxpDePn4yMUVArX8Wh4lKFOOLn
         aJHg==
X-Forwarded-Encrypted: i=1; AHgh+RrncPGvqU8w+AmesAsZyyDZaCZ3ieQTeO7DlKmJWp+o5GK5wQ2Q+2Szm+2yJsNtIMD7dko1jGhuEvrLyIHfPXnG@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSoMZPg0P2SYtyz50r2uLbtNyTWeuVYcbvhKdyTc2zsA8F7SL
	fUL4Uud4WIfeb1ffSdiQSwVNoLdFfZ7ynRZK2XTSVaqM30N7P9qxI5XS
X-Gm-Gg: AR+sD13MNp8aBcSF60qhTK5g3r9wcSzC2dsdkV5+8VUBLyORxOPgP85kk5TKSvze6HR
	teHE+IDJzcI8HC1Y/crcdrJqdE2L+qOgjAZlsAHy/ZRkwfuNw6Qc8S+YPYUSVhgjb1v2wray2bS
	Wu++TaNrZQ8CCpaC+V7bplD+6+HxFKcETLH8WPGHlvWZRAbeetWgirczIFnaJ/VhRobPRIddGsf
	i4O+5/sezZD6IZ4PIr7h55Iqaw9s9XWaoYw3Wc0qOQRywowmQDGWq3g+WiFH8q3K1RYnzoxTDDB
	mT/b2BF6qLqFB0tF90IEL7dCYnRM0bbo5bp2IS6T2SzVQ+hBcamerZl06nsGP55PgQnD5ygGXnP
	0NkU18w8rYrlhsALQisQZSsLvgwROVEunnJHP2H0/b0mUexHdRlseFi56tcLzC2KVm4Bx1T/Tfm
	sbVqa7Y63vfb550JtgzBCaKZoCrLQr82kTnIFDorqs+zXk+dTE5LELZL3jrDbIVlM71IjoQgExF
	x3I1tbvVX1teGyiNO44dplEaneVltlAUPp6ZfHTG1wG/zhArnsC
X-Received: by 2002:a05:6a21:3997:b0:3c6:7648:5ab0 with SMTP id adf61e73a8af0-3c9003cc78cmr2258784637.0.1785402417981;
        Thu, 30 Jul 2026 02:06:57 -0700 (PDT)
Received: from debian.lan ([155.117.85.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba447107sm1902510a12.21.2026.07.30.02.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:06:57 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v6 0/3] mm: make persistent huge zero folio read-only
Date: Thu, 30 Jul 2026 17:06:44 +0800
Message-ID: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_020659_111516_EF8237B8 
X-CRM114-Status: GOOD (  11.54  )
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

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out[1], kernel bugs have ended
up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the folio read-only in the direct map
turns such writes into faults instead of silent zero-page corruption.

This series adds set_direct_map_ro_noflush() so mm code can make a
direct-map range read-only, then uses it for the persistent huge zero
folio. The helper is direct-map specific, takes an address-based range as
discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
the caller.

The folio is allocated and zeroed through the writable direct map before
thp_shrinker_init() changes its permissions. thp_shrinker_init() is called
from hugepage_init(), which is registered as a subsys_initcall and runs
after SMP initialization. Writable TLB entries may therefore already be
cached when the page-table permissions change. Patch 1 flushes the exact
direct-map range immediately after the noflush page-table update. Keeping
the flush at the call site preserves the helper's explicit noflush contract
and follows existing direct-map helper users such as secretmem and
hibernation.

GFP_TRANSHUGE can allocate from high memory on 32-bit systems. Since a
highmem folio has no permanent direct-map mapping, patch 1 skips both the
permission change and TLB flush in that case.

Patches 2 and 3 add arm64 and x86 implementations.

Link: https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/ [1]
Link: https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/ [2]
Link: https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/ [3]

v5 -> v6:
- Patch #01: Skip the direct-map permission change and TLB flush for
  highmem folios, which have no permanent direct-map mapping.
Link: https://lore.kernel.org/all/20260727143426.1077133-1-xueyuan.chen21@gmail.com/

RFC v4 -> v5:
- Drop the RFC tag.
- No code changes.
Link: https://lore.kernel.org/all/20260718095647.182592-1-xueyuan.chen21@gmail.com/

RFC v3 -> RFC v4:
- Patch #01: Flush the direct-map range after changing it read-only, since
  the folio was cleared through writable mappings after SMP initialization
  (per Usama, thanks!).
- Patch #01: Keep the flush in the caller to preserve the
  set_direct_map_ro_noflush() contract and make the flushed range explicit.
- Patch #01: Clarify the noflush API contract and the reason stale writable
  translations must be invalidated.
Link: https://lore.kernel.org/linux-mm/20260706130440.9295-1-xueyuan.chen21@gmail.com/

RFC v2 -> RFC v3:
- Patch #01: Replace arch_make_pages_readonly() with
  set_direct_map_ro_noflush() in the existing set_direct_map* family
  (per Mike and David, thanks!).
- Patch #01: Use a direct-map address and number of pages, and document the
  direct-map-only and no-TLB-flush semantics (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for
  set_direct_map_ro_noflush().
Link: https://lore.kernel.org/linux-mm/20260609143801.7917-1-xueyuan.chen21@gmail.com/

RFC v1 -> RFC v2:
- Patch #01: Drop the READONLY_HUGE_ZERO_FOLIO Kconfig option
  (per Dave, thanks!).
- Patch #01: Replace the huge-zero-folio-specific hook with a generic
  page-range hook (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for the new
  hook.
Link: https://lore.kernel.org/linux-mm/20260527035607.14919-1-xueyuan.chen21@gmail.com/

Xueyuan Chen (3):
  mm: make persistent huge zero folio read-only
  arm64/mm: add set_direct_map_ro_noflush()
  x86/mm: add set_direct_map_ro_noflush()

 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 arch/x86/include/asm/set_memory.h   |  2 ++
 arch/x86/mm/pat/set_memory.c        | 15 +++++++++++++++
 include/linux/set_memory.h          | 29 +++++++++++++++++++++++++++++
 mm/huge_memory.c                    | 20 +++++++++++++++++++-
 6 files changed, 77 insertions(+), 1 deletion(-)

-- 
2.47.3


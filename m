Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A48C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XHtCFulTi7QuN+vcsXlI37N2cwZV1gauKNkUTz4LeTU=; b=XKhFwElo2u2Fbq7Xv3lx3w5eOa
	juu2r5J9oDp7jvnQgFqh5QO9IANhWQ1MvKph/MvSJe0du6gaPzOsKPLO6kjWZZImhDzOdTWCHSq5C
	yzHO9Z0CLtkdTTzlLFBOxYX4eoJRujVR/K4UgVQIQ5kU6gLk7ROXFMnVnHuqseZ0NUp8Pg8o7quhI
	I2tnIpcKvBRrhZZICUnVWK08RrC/3sbEDGZf+FiGBRRRVKgDCBCKd+Hg6sAxnsQApgk+whyHejAal
	L4qbSelidkKMduJptqxSS8XDoRSppTmtXMFgD1DsosykmhFPGKoihpF63Dd9SgrfXQfpSGGEWnDe+
	5LsPti1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1n3-00000003yYQ-00uw;
	Sat, 18 Jul 2026 09:57:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1n0-00000003yY0-2KcT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:56:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so818009a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784368617; x=1784973417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHtCFulTi7QuN+vcsXlI37N2cwZV1gauKNkUTz4LeTU=;
        b=sKjh8nU4FEksfxJF8aiUOupWTyGEG8NUrbA4KdFCgtl20C5G42Ibf6IubW0tsrcwkr
         o5rBM0b7TxVGdoPXcH8sP9lJOly/rsIBd77UYFhBnNFpM0EKGxf8U4jn9qlGSTLCv8Fw
         YHux3Nd1IghnM3tskgZMgEaVJjTwMLQ35ZBnmtOmR8eM1816UADCm7nXX5a9FCqsrh8X
         1hwjPwe4EnYW24PtoDFOgUmgybwlK0KmOopxdpEgG9ALso5rNCbqaMZE9yeCKiI5+MYA
         D5mwgD5wkI1xdMV/GubnUFY8VmORdgZWxEbWSAKaY3bxEDl4Z2Xz2hbHofAdoZYK+FhI
         ICCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784368617; x=1784973417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHtCFulTi7QuN+vcsXlI37N2cwZV1gauKNkUTz4LeTU=;
        b=fzJKV2yDwYcqKlINwh13IYt+MKf4Z5g6faahszVNiYFZv0wigYrHRKcRx3AgGq5ahg
         DwLBudGXkMI3ZCflK/b+CHZ/t7r1/EKb6lNh2d4APttUOJrKLweA6qfyIkQWWqYPSd+P
         np7PMMRx8l1JctZ/uUkRT4b2QHBAsA5nnay+5TNdkqYFAK8ODGaK5A1UxKGh1oZ8YYXL
         7vRck01l7bwr2Ebl9tkoZRSQTccxgo3nuHC3eS+GWdXQmKZjEia2fTnFjrEy+22TOxeK
         dPtp4XzJsL2A8eSixi3mY0xfIzXd128Et5vvpJpNqhzKooy8PYIWQh0L0rc9+6ncdiVa
         ygeg==
X-Forwarded-Encrypted: i=1; AHgh+RpsAmjWy31QVao2CJzOCBUouUmxSXhPRCtp8GTPvsvlfDLWueV3aPsbQTEwmgsrHp67wVEiJTrPRvlK2pRHt8OZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZA8evXLynRBs237ivbxNM9tAbYa1ilMFV4l71Ei1gLmR6hFqI
	qZvnL1ynEHehU255tUsmDgcw9DAPppMMjXjuXPqVWX4qws2JuzPUJeYo
X-Gm-Gg: AfdE7cnwwGYlD0LuC4RL+OirSvdd58DKoCRb9ykOwnnLmxiTcRxIrGWnzPcOfdGPYgO
	KnI/YxikrL9508lZBjzPlE59PLZZRrsAVFnGQTufzbmVbRHTa5oU2d4Ban7l8Y+F230VgWCloOe
	TfZ5cEzccvwvUhtqncwhcCDpoVXZBXk50NvnGzVKXtkt64VHLEYm6xZLS8HhVeG5T6XVz2/mn3D
	15AV4tmT+fQcqt/pG41tjgAKf9Ug8XmXtd11qrPXChDDFMrK50cCquik7JvRtaUEt0KhXy0YI5Q
	kNPyN7G+Q+w3VkffB16OtBmpcPe8hXykZdvx33J+fQVGXqb9MEq6GpleXzHMmlhDazxsQh+OeiZ
	TYykJRJnJAzOTE4HTxxtny9LXgUQMOFyknieH//uS7/yIlCz04EgEoND/o5n2xaYB++/pw9dw/C
	l/dJmGFPDzuSOAU8/yuhhlP7UAiX+65ove1IPvOTFtOVwL
X-Received: by 2002:a05:6a00:80e6:b0:842:5a15:6fa6 with SMTP id d2e1a72fcca58-84c294b7ad8mr3410940b3a.3.1784368616755;
        Sat, 18 Jul 2026 02:56:56 -0700 (PDT)
Received: from debian.lan ([240e:391:eb4:a240::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm2417248b3a.30.2026.07.18.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:56:56 -0700 (PDT)
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
Subject: [RFC PATCH v4 0/3] make persistent huge zero folio read-only
Date: Sat, 18 Jul 2026 17:56:44 +0800
Message-ID: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_025658_600756_37B45E77 
X-CRM114-Status: GOOD (  11.23  )
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
cached when the page-table permissions change. v4 flushes the exact
direct-map range immediately after the noflush page-table update. Keeping
the flush at the call site preserves the helper's explicit noflush contract
and follows existing direct-map helper users such as secretmem and
hibernation.

Patches 2 and 3 add arm64 and x86 implementations.

[1]: https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2]: https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/
[3]: https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

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
 mm/huge_memory.c                    | 16 +++++++++++++++-
 6 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.47.3


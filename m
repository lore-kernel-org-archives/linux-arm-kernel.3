Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A1FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WFJH0ESiWBm+RbvdI7K60WSeg5h8yrXuENGkm3xh5c=; b=oMIGcbEO8NrWp0f3+4tvjH+Fxf
	C96bZn2eQKPQJJ6caxCkOaaXFw9bh3hHmh1w9cQNFF3c80Mq3Q/gKC6yU2ZSBBFlwEYDVG/jHDHRj
	meEI3oUxCsB2Bn+GN9kx+YRRROv88okUuBryltBJ3PZS+baXqWaCrIxd4wMmAVgnQyGaanwO9N8lt
	kuyNMKREEuc08nLmfTm40cmyMB9hPiHApfMmtVT239AEuWOzuc+A9YlJnNOC4f+/s5+1l/T4iSZvn
	BTIC8R4z4Nd28VZhbmDIww4xValTiIhMH4JOQgWubTQIZ6DADsQ14aRqkYVxb6wKLWE7md+rF+rnF
	m7ia/nFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QFu-0000000CT0f-04B2;
	Tue, 01 Sep 2026 15:18:34 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QFr-0000000CSzy-2op7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:18:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-85457d780adso282438b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275910; x=1788880710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WFJH0ESiWBm+RbvdI7K60WSeg5h8yrXuENGkm3xh5c=;
        b=cAtOREJwIL+TjO9qEFa7C4bSv00Ppg9xgwpvy2dITq41PQTlZi//7mdxjLxp7tu+CF
         PAYaw/Ud5vjLDPmrHJRlzQReyNMKAAgxClfCduqi9hPfe4XwHNsI1a+G7WZI0Hy5/yLM
         sxDF4k03son1a4Fyzyt0o40YcmvpSyDOiG5yDB6oFlMmZwXAFJRrc4SukHlQZncdJOuq
         EY31pNEltC5fDUJoTPEigAU5Wx3JAHlctrf4yW0ZjJPzk6IBnhG3OMTojf0rPI8j9OVL
         1U+t8DU8OFWSo9Rx1uetszei7yh8+wvmoGO9hZfY7kHaCr3TbrB+bpYZKtMrgGubgvis
         kyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275910; x=1788880710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WFJH0ESiWBm+RbvdI7K60WSeg5h8yrXuENGkm3xh5c=;
        b=ecqzRSqiYUY+4UV+96DnVtc9sAh4TY/W0I22WRojHibqM36T2crBMtuyeHWyzsw7hp
         2jdHO3PooPBHwAaKmJMThhzJucHPPCWwS+6+PmRuNdnZ51G1yJA0c4acBdKSPSxe+wIn
         BEM1RoG9AdUJVqiIatqL+x2uhejfQ7iMbonYEI61QpXn8sF5vhjBp4InUm0dlPqZ3tsR
         ipFJf2ytkpXDHSahk1PDXTYsXOh7SLcOdSIb3ZnrXZLeycJOUa7rp/GocszyaOOeLR45
         pCGbb9p4bEnvYwBf2+8j7hXlDGLGJMUjI7uY/zz52rK/p7fdxiwY4ywfkd0oNK+CzIa0
         ooNw==
X-Forwarded-Encrypted: i=1; AHgh+RovjoksHxrnUVdiDy3ALKFMJ/KUa+8R+RZ+s+kutNKRBc/2AWdAywWig7dBf4UKJGNOtHvJ7T51QFmYNpyBH62F@lists.infradead.org
X-Gm-Message-State: AFuF++mRoVMqCRENOuJxkUHRw1SiIhJkMPJzD1cbkSPDCM9Cbjo+kPov
	u7BmPDhLPiW2XOfow3sU8On75Yq2AM/9Rdcp3aOBbIY644TYHPxOOKO4
X-Gm-Gg: AR+sD10zK38OMuw6+shDhMKzkGn6XfzaLCCRvkPcwxnbFGt2V8bk8exwjRubwSQ7Bte
	Wpjn/YizAezgbcFh6c02WQ+rLjh5ZG7lp9u+L5G8EcAJ7jVCJNu3H9NN6dtFQPLQ1zBeixhbRcY
	hEiJyXMwjGxKdrQGkaieUfhCwGZX0RSMCaUZvrpSz/syIZSqk9e71h+eOxtx4k5owHq3FvgzOei
	hdzv3O39BGsMOrw5pwMyjxhpTJhAOgjeImmjQ8qPUyzgdoGeGRFK5VaOFS95WkFU+eJeHhzjmK1
	Pv3zBYtGDiR5uqC10uP+FcnBUFj/0e3c/L4QZkZa5vq985aqnWHUuS5CYB+ig8NWWl/t3+vBgIQ
	ZBzstKjgHTY7e/0evCaqGntVdc6SckSdPaGKaU3UFaWuZaWUkz3Xc5YxSl9FpA0l0X1modDTvHx
	zh1ceQlpcIX41tsf1sDB3aEm6Evdghe/QJt9QMjzd450mq4OBnKNxJepUvgpKnZKkaQPwfVqpsD
	IrjoFpBA+t5iFmjB6hwxg7V1w==
X-Received: by 2002:a05:6a00:4a07:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-85625c2c844mr22271937b3a.0.1788275909909;
        Tue, 01 Sep 2026 08:18:29 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:27 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] mm: make persistent huge zero folio read-only
Date: Tue,  1 Sep 2026 23:18:15 +0800
Message-ID: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_081831_715601_ABF981BC 
X-CRM114-Status: GOOD (  11.21  )
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

The persistent huge zero folio is shared globally and must remain zero
after initialization. As Jann Horn pointed out [1], kernel bugs can write
to pages that are intended to be read-only, including in security-sensitive
paths. Protecting the folio's direct-map mapping turns such writes into
faults instead of silently corrupting the shared zero page.

This series makes that protection available to MM code and applies it to
the persistent huge zero folio. It is best-effort: arm64 and x86 protect
the permanent direct-map mapping, while highmem folios and architectures
without support retain the existing behavior.

The interface remains page-based to match the existing direct-map helpers.
The wider address-based conversion discussed in [2] can be handled
separately. Permission changes and TLB invalidation stay together in the
architecture code, avoiding a noflush interface that is easy to misuse.

Patches 2 and 3 add arm64 and x86 support. The approach follows the
huge-zero-folio discussion in [3].

Link: https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/ [1]
Link: https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/ [2]
Link: https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/ [3]

v6 -> v7:
- Rebase onto the latest mm-unstable and adapt to huge_zero_init()
  (per David).
- Switch to a page-based interface and move TLB flushing into the
  architecture implementations (per Will, Dave and David).
- https://lore.kernel.org/r/20260730090647.2401252-1-xueyuan.chen21@gmail.com/

v5 -> v6:
- Patch #01: Skip the direct-map permission change and TLB flush for
  highmem folios, which have no permanent direct-map mapping.
- https://lore.kernel.org/all/20260727143426.1077133-1-xueyuan.chen21@gmail.com/

RFC v4 -> v5:
- Drop the RFC tag.
- No code changes.
- https://lore.kernel.org/all/20260718095647.182592-1-xueyuan.chen21@gmail.com/

RFC v3 -> RFC v4:
- Patch #01: Flush the direct-map range after changing it read-only, since
  the folio was cleared through writable mappings after SMP initialization
  (per Usama, thanks!).
- Patch #01: Keep the flush in the caller to preserve the
  set_direct_map_ro_noflush() contract and make the flushed range explicit.
- Patch #01: Clarify the noflush API contract and the reason stale writable
  translations must be invalidated.
- https://lore.kernel.org/linux-mm/20260706130440.9295-1-xueyuan.chen21@gmail.com/

RFC v2 -> RFC v3:
- Patch #01: Replace arch_make_pages_readonly() with
  set_direct_map_ro_noflush() in the existing set_direct_map* family
  (per Mike and David, thanks!).
- Patch #01: Use a direct-map address and number of pages, and document the
  direct-map-only and no-TLB-flush semantics (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for
  set_direct_map_ro_noflush().
- https://lore.kernel.org/linux-mm/20260609143801.7917-1-xueyuan.chen21@gmail.com/

RFC v1 -> RFC v2:
- Patch #01: Drop the READONLY_HUGE_ZERO_FOLIO Kconfig option
  (per Dave, thanks!).
- Patch #01: Replace the huge-zero-folio-specific hook with a generic
  page-range hook (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for the new
  hook.
- https://lore.kernel.org/linux-mm/20260527035607.14919-1-xueyuan.chen21@gmail.com/

Xueyuan Chen (3):
  mm: make persistent huge zero folio read-only
  arm64/mm: add set_direct_map_ro()
  x86/mm: add set_direct_map_ro()

 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 12 ++++++++++++
 arch/x86/include/asm/set_memory.h   |  2 ++
 arch/x86/mm/pat/set_memory.c        | 10 ++++++++++
 include/linux/set_memory.h          | 17 +++++++++++++++++
 mm/huge_memory.c                    | 13 ++++++++++---
 6 files changed, 53 insertions(+), 3 deletions(-)


base-commit: 88297631d4d42f6004cb39c0ba3da7d2d10a616f
-- 
2.47.3


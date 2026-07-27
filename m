Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84897C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8jVxeCFazqwknGlFRRbIYSIHmRn7jbRySRKJMOZEfOc=; b=Mk+9MToY4czaN7fmWIeRf77QEU
	2pAWXm8tLlp+uZpeQ/oKa1iI6jpehL1AVmXDRofb9HX+K+I5TXR07DJ6WcwxymAeay8vOfyVR0CNI
	IAQdxIVQq6c1KLePmZLOTLgjGAO5s0YvJNXFV/Jmzo+/jzPU4DIpP/p8MTODTfEPanls857fA9JlE
	WGRVPXvjpTk6juJCylcAYPBlQ8vFRY8uzZNJ5qN3rB1ysxrS4IDvjGNpwvF8sgthUyhZLQZvMgkHG
	WyjbnUz6wqvgovZ0g9M5lB+IolN3YVKsF99gwlukUjpC2966IXmgF2S7pTKmBvOCUSk2c4pXj9481
	w+spU1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMPx-000000030UR-1rtB;
	Mon, 27 Jul 2026 14:34:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMPo-000000030SW-0XuQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:34:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cc7a269ca1so5925725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162887; x=1785767687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jVxeCFazqwknGlFRRbIYSIHmRn7jbRySRKJMOZEfOc=;
        b=jgtK1B0Jtcyx1vL4wBQIr17FS7fRvchSXuS5tB9399114cOBd5fe3saI4e3rOaS1JE
         pFrenf4gnS6JrfOkdAm+Izfsy5hm2FHqyqYCs/y3TTxwM1dB6o2mN1huPuzUYyeHjwBw
         5vEh2i7SEoglequNfGjcm4YwNJKQuZwIrPQXTrv6SXbNLLQ0DUqMvuxjtGQlYasgaMsX
         6+nukyeC/vDuK+W8JbvtWUAXdkpktEbiVlREWOj7vKs+WBpmmMb/QCG5bZiqJcaoc9Fq
         RPGFEDkpSyDfDtRJIpfHLsi36fKl7uw1OZ6CwjPHK7l2tFEoJt6fbBy46zEgloGRo0zo
         nB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162887; x=1785767687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jVxeCFazqwknGlFRRbIYSIHmRn7jbRySRKJMOZEfOc=;
        b=FoQbjMfPeBFjAK8EBItRedibvW2pNKEuaviKng6sjDRgLheyDIX/RfN/l8BXbxjhA5
         qcD/G+gIpTqyS5Rn8xIblYscHt/dwMzC4j0xZltEBxScfGIacs5URstIrSfZYvyT4jgJ
         Ek+uS+3trwgbsY4jbcRoY/I1q22kYaDdpopuzcQx+/FoVY9wDE1oM82w4b2/e0uaO0xJ
         1+Eq1uWylr7xW6iYFl5g6DjMyD8IPl7xnFcPJUp2FSP8Yu5XX2FfCFhfypppfC++3CMU
         B+CbAp5bfXC8on1PdFjH16+KDHjfRDCf0KCarkAFNmr8mQmXuHttMDWYrCHBwjSEvNhJ
         HXFw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8TlYQRTXJYTXtaWXxj3a/2+WFta53PAQsiwWfIRHAA9XgraTHT9BxLwAg2zXH/wr4UrCaSch3G7m+O9qjySVl@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWy28NUmCkoMn6/3R1fQJmcRWoKzW08ctb+vAQ8zM3o2SGnNX
	7pvcZCgukS1T8aE4psS6TdVi8wtArzfLD7n9EFUz1Mt0ra86GfBJwR42
X-Gm-Gg: AR+sD13HXD6dQQX8pXVgMHSs6Biku3t8jBfvMxko+uB0FfenE/wN+SoRan72WNPAivd
	WcC3wDCpxoB57IC1CpL2tn8ehOy6cev0Rt8DxrZINQg/YTbzhwh0SEiL4gdSX1Kk1pTffPcxuEf
	VEePvQ4MIXf7VA9svxVWt1rauUBL2HHLet7xNvtrUaF3xEO3f3pm6CZTucZWBGE+Egb+G9ZpSei
	QRX4nxK50zwz3lv1lpLQGwsOK8nPo6hH7ibrPLAGPYP/Uuvxbp/crRA3tdnxEEsHVCLlmWejpEi
	mrBkWz8dE/arwDWwua0++K40dnrNozjFP1W1BtX1U7CUYX+abQmyEyZqXsnPbpXXuoKdBe2+4u7
	is+d7t2fcteFHOJwKjKxqt7bTT7FCYTr9uIO52kJ7zNeUIza412vo2x7V1liUFkgQtVZ5YMiU4J
	0ssEEYcXaAAtj7B7tjuGlS2YmV0GpG1mnrek2t/7SE1EO8MKle+Fudvajz0T/GUGU5sqHssdhVF
	J4=
X-Received: by 2002:a17:902:e948:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2d00b42a776mr4692505ad.1.1785162886755;
        Mon, 27 Jul 2026 07:34:46 -0700 (PDT)
Received: from debian.lan ([141.11.42.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d5297sm36877485ad.56.2026.07.27.07.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:34:46 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org
Subject: [PATCH v5 0/3] mm: make persistent huge zero folio read-only
Date: Mon, 27 Jul 2026 22:34:23 +0800
Message-ID: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073448_176570_4425A5C4 
X-CRM114-Status: GOOD (  10.83  )
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

This is the first non-RFC posting of the series. The direct-map helper
interface and its TLB invalidation contract have stabilized through the
RFC discussion, and the series is now intended for regular review and
possible merging.

Patches 2 and 3 add arm64 and x86 implementations.

Link: https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/ [1]
Link: https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/ [2]
Link: https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/ [3]

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
 mm/huge_memory.c                    | 16 +++++++++++++++-
 6 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.47.3


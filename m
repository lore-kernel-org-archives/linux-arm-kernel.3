Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92974C44509
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2GJhcciwaP4fHjsRT6KM4zWTWsLGZ2JTjerBFR60HQ=; b=pgtuLtMnjXsaaqBHK5G1ETWrDJ
	Tzn6U1VS0QUohM7Y/H2TLxa+41NGiosQsl66h0xNkT6GWIiLUAyaaOAP8HcTjeSTA3b+c915iM6fW
	HLR3qil1u43BiAUfO74NgO05RCRjR6cLaTjonDBS+Y6BqeakHYalZKcB2mwYuReDDHG8eM4ta2oqv
	LGbCy5fxmQJb29S1X1U/qg7YjnoCvEK6sLdSqqGUwv+EjCq0SSqgbzaVFcmEI9T2n/RKsFC7A7usR
	bfgwjBcjzfSd89k7Mt6cWGA0ERRZ/UQ6uY4Z9hoZRAQk8LzvSeAqOK3Knv5Eg4vxQo5PZ6Qu4dxX5
	4Sg7TT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhr-0000000GCsv-0Trg;
	Wed, 08 Jul 2026 03:12:15 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhS-0000000GCHG-0tav
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-8482b95574dso287971b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480309; x=1784085109; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2GJhcciwaP4fHjsRT6KM4zWTWsLGZ2JTjerBFR60HQ=;
        b=lkRJpqftFdMnC6IjGVQ5qHFGNTuNPM4lwXHZm0d0oet5XIcKWtXU2AaWmEw57eAg+T
         uO/+zfqyFhC0ip3XG9OTx2oAscZ4baz3Gkb/6v19/X8y34sVhd+rXmT4mlInq0LP5thE
         wxWMDNVtAP80dI+T4/gT1FJheApAoyM+UAd/HDOkRK9yxI+0RC51zSprJTmuJSZRXnF9
         2DI3YkTVRsF/uYMRgvGBLIBZWZtzAOQMY/KRRJ6hMdu/14tTpR0IlJscXFG4MkkED/2y
         3DanBoHZnrNbS2tQ6WUOqnvtFgWCR1XSRfrxQLAc7qkZ3gTEhK+VJ3/z2a8vRKSvJxJB
         7FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480309; x=1784085109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2GJhcciwaP4fHjsRT6KM4zWTWsLGZ2JTjerBFR60HQ=;
        b=fV3zsf7b2c+kFxVra9TMqSB+lgx/n0rxVRfyq6Ox9HeY9qA9q8j6h2ywu31STDRYSs
         dEpQlMPs19fTalpIcse7ogyFJCSgs3IzCp5s7TKqOdOw2dSP+QCugel8y4h02GNkaFV4
         xYhK2W5pBYlVFX9Rn33FgybB8/54+DVRNmD98Q4yuYOwVg6durUHT759hYhXs6+vxmWu
         n8ZWigRxWqS4mGpxQQg7b2nnU+3C65TrtRiXtau2VaINB9doxdZkbzP+ye7pM+lGdbJ1
         QY7GKyFql/26vwGt/6UlfKeKlAAZY4PSw3OCeA8paUngQOz+3y3NgDlAkf2dLl3gBDbt
         4bIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeMyGY50hY5EQx029VGwt1La26g1baM+WKODzp6TEuq0rkYXYheS97yhQT3WJKkYhcjjJ7p2JblVrbGDnyIEJT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzga3g/WOudSE6W3J+367JTmEzNBBKIAchhiK8Hqtpvx5REMHnR
	rtafsZ0e/nPjPe8fh7qTF8WnOF5LmIB6EwgaN92SV5PtDv/icm4kR+7dtvWsqCXdrTfbRqkZ5vF
	fGMA9LGzVFGi1PgH2S3f4Zg==
X-Received: from pfbjf15.prod.google.com ([2002:a05:6a00:6e4f:b0:848:42e4:9622])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:178c:b0:847:70cd:395a with SMTP id d2e1a72fcca58-84842fce3a2mr805556b3a.59.1783480308390;
 Tue, 07 Jul 2026 20:11:48 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:27 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-18-jthoughton@google.com>
Subject: [PATCH 17/18] arm64: Permit onlining of HVO-incompatible late CPUs if
 HVO is not in use
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201150_290254_E0BB0595 
X-CRM114-Status: GOOD (  17.39  )
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

First, HVO must have ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU so that
incompatible CPUs can be onlined if HVO is not in use. The
late_cpu_enable() callback is used to check if HVO is truly in use.

If the late CPU is incompatible with HVO and HVO is *not* in use, HVO
becomes permanently disabled.

If the late CPU is incompatible with HVO and HVO *is* in use, the CPU
is not onlined.

If the late CPU is compatible with HVO, there is no issue.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7e2c134f3b55..65bb3c7c9595 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -76,6 +76,7 @@
 #include <linux/kasan.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/hugetlb_vmemmap.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
@@ -2181,6 +2182,22 @@ static bool hvo_compatible(const struct arm64_cpu_capabilities *caps, int scope)
 	return supports_hw_af(scope);
 }
 
+static bool late_cpu_enable_hvo(const struct arm64_cpu_capabilities *__unused)
+{
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	if (cpu_has_hw_af())
+		return true;
+
+	/*
+	 * If the CPU does not support HW AF, we cannot online it if HVO is
+	 * currently in use.
+	 */
+	return hugetlb_vmemmap_optimization_try_disable();
+#else
+	return true;
+#endif
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -3079,8 +3096,11 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 	{
 		.desc = "HugeTLB Vmemmap Optimization Support",
 		.capability = ARM64_HVO_COMPATIBLE,
-		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.type = ARM64_CPUCAP_SCOPE_SYSTEM |
+			ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU |
+			ARM64_CPUCAP_PERMITTED_FOR_LATE_CPU,
 		.matches = hvo_compatible,
+		.late_cpu_enable = late_cpu_enable_hvo,
 	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
-- 
2.55.0.795.g602f6c329a-goog



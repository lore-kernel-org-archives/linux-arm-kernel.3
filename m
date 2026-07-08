Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B82C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NDGpn45MhaTYlhQFUuH7sBQd7vZ4HzbwwdEmS2fdAw=; b=zALZWPZDvH0+R9n81ALiaPUyAA
	GzlxCthalTYTb1qkzXEryF3evMxQtffqOVUGI+EGFl3H/CQOCEs7DZVc54HvX814n742Re5ILaKvC
	qRwk5PFcfDl26F8Dw3EMBrf5WMqy/DcIxHpbX5Zb9H81m982n0SbSoDr8ZtVwS1tVOJ7u8UxzShQ7
	KDj1GibQaYQVSifhk5PFdxr0pctfXQSQbQu/UGU8imx4j5eon4u/ORmYI+0HQJyJb3C+BJB9l7rmG
	k7A/AwWpNOLfJ04mkkjVL2cSY05QB092CknBgTOPgVhJk8lwLdf0dgmu76VLZAEJRaQVmHImlWGOI
	dVef6eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhr-0000000GCtm-2K3b;
	Wed, 08 Jul 2026 03:12:15 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhS-0000000GCHw-37ym
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2cc77a6943eso7051875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480309; x=1784085109; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NDGpn45MhaTYlhQFUuH7sBQd7vZ4HzbwwdEmS2fdAw=;
        b=smRykzpVoURWCJX97uBe18xy+TmfdmbiJeu9mnjkt7p1Q15zm4i/bi+WG32EszWW21
         fdVIwyTQ8NWYscwSoJLFBmezW1u07T+EvIlC/Jjk1pcgca19J90GqpaH1ULoyyy2Pklo
         IRFuBBxX+2x0QqtJ5yeUkcK/RbyA9JHFfxCb7DXarJkElk4kVQHZNHVOw4bJAqR8Fa3C
         9jZ/E2/+w4gsFOnPt+IVuQ01aaK+rzH5K3aR8ckS81ClSERIbUTqWduflzEnfc8dXaxI
         kzW6cFkbN/5Fn4BunfZUfpRojyC1Wa6CWTS2vjgrfbYLAfTmgausUQUKs01kkAdX0gP8
         x81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480309; x=1784085109;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NDGpn45MhaTYlhQFUuH7sBQd7vZ4HzbwwdEmS2fdAw=;
        b=od79N//B04wxDXhqbSrVTxkkji9TYhj7Nm+5PQ+qVhThz9AxJ0a5zndjN/qhYxptvg
         c0RTVu03x5HNMji2MrqPdGnfz0SwNrpOmBb4iguUJyLJ7raZDxliAr48gzE7AeHLZg/0
         D184RvVfxIvsIKZKX4/yIBLxtclLAvx2MsyHVTajev9Nel8ZfIrIcPAXWGVy3qBXiKl5
         siBuzeDP5sMqxYADNlUV0QWspttco30BYCTklvAUjIqVKbB0w2eBN6WfXlLmVahtnmau
         JIR0ol5JUC6yGLeBBLAtgW80AzVpNrSYdHIf1dS4W5LGgpGimI7U8mExxqaQUvlMOiQ6
         fZ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpF6AHKY0Nc0A5USgtuASmI9y1HvUIkop/u3KQDBjizlOI5xVs7JcI4LSoH4kAlxcn8dNyTUfKRznfUNzmvu2fB@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJXBvTCufvUYvuEc7vf4VYTWgbagaO4ZtAqpkyZEnZrU9qPHK
	d/ENiPXfepuevtzEmKV9V/luzYY9XpF05nDiCBRMGlcvLWFyX8IDbIvb2suA2adKhH+5bsHkHUA
	Uoj3mHqEf+4f8V7nqUWPGXw==
X-Received: from plwh17.prod.google.com ([2002:a17:902:f7d1:b0:2cc:ed0e:f302])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b48:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2ccea2a5ecamr7510755ad.4.1783480309200;
 Tue, 07 Jul 2026 20:11:49 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:28 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-19-jthoughton@google.com>
Subject: [PATCH 18/18] arm64: Remove user-selectable HVO Kconfig
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
X-CRM114-CacheID: sfid-20260707_201150_858466_30FCA3D5 
X-CRM114-Status: GOOD (  13.99  )
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

The Kconfig is not ideal; it is niche and difficult to understand for
users. The Kconfig was added to avoid the following regression: if HVO
is compiled in and all boot CPUs support it, any late CPUs that do not
will not be onlined.

The implementation now avoids this regression as long as HVO is not
actively in use. Therefore, drop the Kconfig.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cf4bd6bd7f11..2a59155f68dc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -259,7 +259,7 @@ config ARM64
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
 	select VMAP_STACK
-	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -1608,17 +1608,6 @@ config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
 
-config ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
-	bool "Enable support for HugeTLB Vmemmap Optimization (HVO)"
-	default n
-	depends on HUGETLB_PAGE && SPARSEMEM_VMEMMAP && ARM64_HW_AFDBM
-	help
-	  Enable support for HVO. When enabled, late-onlining of CPUs that do
-	  not support features required by HVO will not be onlined if all boot
-	  CPUs do have such support.
-
-	  If unsure, say N
-
 config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
-- 
2.55.0.795.g602f6c329a-goog



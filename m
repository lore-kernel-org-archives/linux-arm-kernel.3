Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ibpf6/Yw4Qk7w5nMnSeu5NqKAQPPT11UDasodOvdS4o=; b=DkO6kJ1WJSHLOh8kZqpv6C0ThN
	TmrUEEfW91dzIG6XDFKJQoC6WKINIX+myUd2d3246K/IY+FOWmUD/rA3rv4LOTHRT+pbH7hZke3fC
	NYvCyu+URNSy3pQ0X+hnYTCPkJxE1SnhkOsUS5dv10mDkogJs2DyhWRmbVr9zrj7JSmnrVTrS38JF
	ZeCBSTEkFgya4B6IcS0rYTSGO3NiqA1Qq7MhUr5EzzGFg0J/ZXnmSuM+MPTz8i9Hy6atECLhefnK/
	lrcsi73DpRBa7fedfbtrLPH2ie4E1/vWaF4MmNZjpSMIUzV2NWf/RPJxpMBPiaC2V1BF2mGopJU7Y
	MpI+O91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhP-0000000GCF4-3Oz4;
	Wed, 08 Jul 2026 03:11:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhH-0000000GC7c-2pGa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2cc6dd43737so7765115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480299; x=1784085099; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ibpf6/Yw4Qk7w5nMnSeu5NqKAQPPT11UDasodOvdS4o=;
        b=mprcBHKtMr6OblNrXe+IoOvdqXq9P4nS4Dw1vPNlnOdQ7z4deJf3zFpl41/Nc9wVyE
         yEjntcgvyT9V7dpTJhezhBrGyerqtGCaN2IjtxhxXM4SGH+qIENGtjCes878W05TK1rC
         LmAWCwolVYS5zQtO4ydSnZmlcrnYKd7I8k5tDbpS6LjAH0dY9spqsPj1ZvbxQIF2laCR
         0JIZOQmR3pEevMxtSjpPy3OyjVWeKVM7rYaexW63uApNz0LX/gV9RLO7iL9SBE9DLvgk
         0TjryG3BtfDUVhiK8NXK475NqaDIs+RPTlVfTnlT84o7QQsLqIm0JIM/qpTmTSC0k76s
         M2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480299; x=1784085099;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ibpf6/Yw4Qk7w5nMnSeu5NqKAQPPT11UDasodOvdS4o=;
        b=KHjJtpAAQnhq5XBe89FBOvYnW0sp1BoOtPcVfVHmG+qVB01Vh0TzfAtfWOEoKIfPSt
         YHNp4H4e6NSIXhwQrWQWhQKzuhZDIMUmhvaA9DAoIQYWjQGO0zdL/Px1MwntjFoufbd5
         OtQJ4VrDo6MEvKsaV5rFp1HvJJVNFPHNviGmDwasRzDWEf4uu5d94KLdSPH0a2/ceK3m
         Ku/HVnojGhk3eqOOHL+ta87ptE08b0h/NgILgf8U5EXRyh/d4/LhxJkOpIj3nTiRyVQO
         wCtc9l9+PhhPNlzWjIOTkh8jNuEHF2MmZyqaqUb2JEqQ5u+qxVIMpDs/mnfh5AH60BqS
         vdEg==
X-Forwarded-Encrypted: i=1; AHgh+Roem1NecVgoXF+pTC/wacQnOho0cF1leVq7870Ob6qewMSL0Vrlojg26UxDzEm034hopdaLi6YvzDOz6CxQGp+a@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc2ENmBDQoLm+fDeVajBK/eKI2eRCofh5oKZvjBY8re79I0xjL
	JTQYUn5ZvJtHOK7gZVW1tJffz7gYqeyIr61phmFiBRIWWYMZzFN2cFkLx7DToJepdUYKBc0QChq
	Yya0JVzsiSzjXeesG2FHK4g==
X-Received: from pllg11.prod.google.com ([2002:a17:902:740b:b0:2cc:e845:dd38])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:fdab:b0:2ca:d666:df72 with SMTP id d9443c01a7336-2ccea39be30mr7195965ad.21.1783480298875;
 Tue, 07 Jul 2026 20:11:38 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:16 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-7-jthoughton@google.com>
Subject: [PATCH 06/18] arm64: Rename cpu_has_hw_af to system_has_hw_af
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
X-CRM114-CacheID: sfid-20260707_201139_730718_8639F332 
X-CRM114-Status: GOOD (  15.86  )
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

In a follow-up patch, a new system feature will need to check for the
presence of HW AF on each CPU individually.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/cpufeature.h | 26 ++++++++++++++++++++------
 arch/arm64/include/asm/pgtable.h    |  4 ++--
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db..e818ad1b56e2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -910,22 +910,36 @@ static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
 }
 
 /* Check whether hardware update of the Access flag is supported */
-static inline bool cpu_has_hw_af(void)
+static inline bool supports_hw_af(int scope)
 {
 	u64 mmfr1;
 
 	if (!IS_ENABLED(CONFIG_ARM64_HW_AFDBM))
 		return false;
 
-	/*
-	 * Use cached version to avoid emulated msr operation on KVM
-	 * guests.
-	 */
-	mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
+	if (scope == SCOPE_SYSTEM) {
+		/*
+		 * Use cached version to avoid emulated msr operation on KVM
+		 * guests.
+		 */
+		mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
+	} else {
+		mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
+	}
 	return cpuid_feature_extract_unsigned_field(mmfr1,
 						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
 }
 
+static inline bool system_has_hw_af(void)
+{
+	return supports_hw_af(SCOPE_SYSTEM);
+}
+
+static inline bool cpu_has_hw_af(void)
+{
+	return supports_hw_af(SCOPE_LOCAL_CPU);
+}
+
 static inline bool cpu_has_pan(void)
 {
 	u64 mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 27689c62bd25..5f21d3a738ee 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1598,7 +1598,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
  * page after fork() + CoW for pfn mappings. We don't always have a
  * hardware-managed access flag on arm64.
  */
-#define arch_has_hw_pte_young		cpu_has_hw_af
+#define arch_has_hw_pte_young		system_has_hw_af
 
 #ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
 #define arch_has_hw_nonleaf_pmd_young	system_supports_haft
@@ -1608,7 +1608,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
  * Experimentally, it's cheap to set the access flag in hardware and we
  * benefit from prefaulting mappings as 'old' to start with.
  */
-#define arch_wants_old_prefaulted_pte	cpu_has_hw_af
+#define arch_wants_old_prefaulted_pte	system_has_hw_af
 
 /*
  * Request exec memory is read into pagecache in at least 64K folios. This size
-- 
2.55.0.795.g602f6c329a-goog



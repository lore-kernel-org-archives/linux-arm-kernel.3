Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD95CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgJgaArgO+LTLU+v+0vmnZUyY2L/xXa/jijIgJz7koY=; b=T9t/IqrAh5iU4Zio9+kRrESllP
	lSaROjfvuNg3OSsVA5hIwQ55a27LJNGMDk155CuE/Lz3p+BgRgIr7CDy6zZz2Tz6WHoOo1aNefXUY
	/+sr/dbwJWpe83sYJagm0hwSrZ2H5looYDC8R7YYQ/UT8iTyLuaUYhddGIZv0GzaRYJrUBdO0eWCR
	VkiEWR7nfcjuPOnrcnXmgQPY0KlybFcaQP6pmyoFkj9fjVZZ6nKVxwuLPyW0oy7f4vht3h9kjhEsx
	26JEaFiR/YciPzsn37UG8VX9Llmdd85prca7gkh31SOBHnUe5wL4X4EDSbA/0PNNnu1cUj0RpbSs8
	fFKRIDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVg-0000000CnJC-1OCq;
	Sat, 03 Oct 2026 00:21:52 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVZ-0000000Cn80-1au7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so181245a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986905; x=1791591705; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgJgaArgO+LTLU+v+0vmnZUyY2L/xXa/jijIgJz7koY=;
        b=IrxRdoAksTnHAC8oyEbPDaXnd1aqj63DriLmm70wRcrbNgEwFffUXsB793BEh7PJY8
         2Nen0KraJmGfkrfMjEPVsp2TMtnbElanYGQ8usXqLFyE3iOFMz89TvDXy4pxGUhet09b
         2UAl87/48pgv0TpT3LhNIcpWkQIYZv6mtPOfcUHOlJ2LkTUxnNTiJVed0L2Lh2Qwsr+W
         btYvTpCFOAKvvqeXRMwbuyyUcepBsGE9hNISZzHSkIAMPnBo7HJJPAk15CHhL7tQtHxm
         6VJgmGnVyf1efq2yKZGUVUYINxIE3ajtunxk6onYOu9p6ktya7qI2QBo3oxabTLb0mY7
         pLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986905; x=1791591705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgJgaArgO+LTLU+v+0vmnZUyY2L/xXa/jijIgJz7koY=;
        b=biuS6mLRVrb6eHUzSfdcb3S+jp6q4ucp9NAu2nKkP/HmuEBepBzuPD+riCnL40WJI9
         k+11llJq8P6AUON7nALChrUL3hgiwNdCyj+rm6GbvrV7TjIMAjSY/nPJePujl3AzvYBF
         /wZouJyX1EDOKL7EqqaLc9tcPNnQOdT/VOQ47AtCwoJWsp3dEYPSiFjnLymcGjNCYkq8
         usbdmI53SxN2BLeEJc3kRTQ5VEqPlJRv6hGFABm5UmqropGnQbhbkaOYdURhnsoNPDba
         vTIHjSKVsT1msOBwf1aLC7+2FUQ+qxVqKhURBiapXqrPLzOaqcHKyGYjKZOqp9KRA/6F
         syeg==
X-Forwarded-Encrypted: i=1; AKwUvBzRC0u5OPjTXtSQ4SSCmNFTRUuSlU03v1gwI/ha49C5tmZpcgcdpF6QlTHYhxdv7gfJAZ1KRd6U/qCquueHZC6h@lists.infradead.org
X-Gm-Message-State: AFuF++l377qrlRrtiG7YUEzCBkh1TiNNCsnOYO0NIAwETRxJNeKeyLZ/
	/JVJ9ihw6CjiUD3Ui9TTxIuZIxnH334XvUaaVwn8sEdZnRqHR9nS2sqW5mX6Q7Pn1n6Ayqn14k5
	sqa0o7yH/th26EawBchBy1A==
X-Received: from pghs8.prod.google.com ([2002:a63:e808:0:b0:cca:5338:9514])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cfa8:b0:3de:4662:16f3 with SMTP id adf61e73a8af0-3e0d6b4a29bmr858218637.50.1790986904231;
 Fri, 02 Oct 2026 17:21:44 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:14 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-12-jthoughton@google.com>
Subject: [PATCH v2 11/20] arm64: Add bbm_through_af capability
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172145_443088_C0F3A0AC 
X-CRM114-Status: GOOD (  18.90  )
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

HVO requires BBM Level 3 for the block -> table transitions when
optimizing the vmemmap, and it requires hardware AF management to avoid
taking page faults on the !AF translation that is installed as part of
the RW table -> RO + new OA table transitions.

Call this requirement "BBM through AF"; i.e., all CPUs support BBM-less,
in-place TTD updates. Model this as a system feature, as all CPUs must
support it for the kernel to use it.

It may seem odd to check for HVO support directly in bbm_through_af().
If this weren't done, any system with mismatched HW AF will no longer be
able to start late CPUs that are missing HW AF if all early CPUs have HW
AF (and BBML3).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4f04ad82ea34..fbededd7b748 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -878,6 +878,11 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_bbm_through_af(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBM_THROUGH_AF);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa..448d4ef085de 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -76,6 +76,7 @@
 #include <linux/kasan.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/hugetlb.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
@@ -2193,6 +2194,25 @@ static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
 	return cpu_supports_bbml3();
 }
 
+static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/*
+	 * BBM-through-AF is only needed for HVO. If HVO is not in use, don't
+	 * penalize systems with mismatched support.
+	 */
+	if (!hugetlb_vmemmap_optimize_enabled()) {
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT));
+		return false;
+	}
+
+	/*
+	 * We need BBML3 to support Block -> Table transitions without taking
+	 * faults, and we need HW AF support to support changing the OA without
+	 * taking faults.
+	 */
+	return cpu_supports_bbml3() && cpu_has_hw_af();
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -3102,6 +3122,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_bbml3,
 	},
+	{
+		.desc = "BBM-less TTD updates via Access Flag",
+		.capability = ARM64_HAS_BBM_THROUGH_AF,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_bbm_through_af,
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cf..25a84aa8a363 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -15,6 +15,7 @@ HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
 HAS_BBML3
+HAS_BBM_THROUGH_AF
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.56.0.rc1.315.gc6ed9934b7-goog



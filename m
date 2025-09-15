Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587BFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=; b=vA3jw3ocnm8QuWkixPD5tJm2Ne
	M4cOnsl4Eim1tRhNnmms9LNPbIRZgf1caTdz1pxZiMpPbCL/3z5CcalC4BnC3G9eUCL/S9F+oBbOv
	tq/Ir1ph63YxsB0UazmzvraW4CTwCRpZwVq+9ptKzUxGGbvv03U4ziw6IWyUF8C8K/6lmwwH7U8hk
	XbppoV8nxvtyo1Csy4YQ8B47gLqmXjARDQRTs7/iREuC19BH1VLrJPy6In+LmX+UqxI0mhPN2+8ic
	lEVqcUoGKIzhm0LFjrqgomrsnfM8ibQiDTKLrnOPRB/wsHxHwlfy9uyAC4y+RXJnMgpee4edZ88dV
	WB04uX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9ar-00000004Sd1-2Hvb;
	Mon, 15 Sep 2025 13:50:09 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9ao-00000004Sap-3o9t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:50:08 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-82946485d12so110688785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757944205; x=1758549005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=;
        b=ARaUAG8JH7URuDkyYC5H10FHVWzF57tT/3lrZ41mnKv6Nr8+5g3FOV4vMy8ixbIeyE
         rffiUl0rjYsBCs15nowz7a9kdL7HlvWyF1EtEvhXJoRvasK0b6mJjrTbgibklrpyw8lA
         I2czzvY3dAV0i2QMJDuK3SXrgguzEmytDDtJz94t3uAOALk4qAd763U/UUjo20sqPdNL
         XUDjavAo2XINoBboyt/Nma2w9iaMvQpq2hF2kQGqoVTpE6jBBzj7M/6v1Q7Df0iA1g6/
         CYv8EW27bb59iIWFf6Gjob8XWwMUSptH/xw9uWXNnwHXzeTCoMjf92rOP71O59ul+hpP
         jQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757944205; x=1758549005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=;
        b=DcpsIjPTIVqbheMWxd4t0nDbiY0rys6NQbIu9i4fl8+K36VMV8UPMUIJpCLZiP0HE2
         ljHvCptRnW4JhMM3kc5qw7RKW1j3GGE5U4KUlzzwyyDyS8ErC85PjHcn/JO6svER1B9X
         angB0Em7A/AJOcvT2GL2Ga0xPEIxYzLKQiuQdBH8b2vPZEDdAhdl2YN8rHcKaW8eQSoV
         ybk4JLI2VqANi2Ke213zYGySZpK0SvMhlUFHDvniGwpivn+qDwgx39GoG5znyFP+N8ez
         F451Ur1AncCFYncYc7Ft5hAcJXaDnnp3QHN2prlR+6zQCAl3aVEMJTvYv5BY8Qvw1bWQ
         X8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWk/HirbtXj7nNycRJTsK9VBBZ6x3WxV3OWniWm47x6tG4qlcaBWX0b48g89Nd7B0IhXfTii4ltuJyWuQ3vNb0Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxmfCpHdQfOMX0r3af3kLrouc2oBRUzkqEY8o+yLcK79UD1EDcU
	mju2NJaNRVuPpLoQjgKieNSA9CsGpHQeZyDA40+aEkClV3m+6LktXOH/
X-Gm-Gg: ASbGncuOB77ZBDRyUMp+AEAum/XBfwAR4fVsqLGwLmStBkuXwT5r6S6t9FAAV1NDFgR
	WGJSgu6yQ0hQhgJkXtquOAZlAo6c4jXj9mr9/ScPrnKFtfgsS4xvUKR6iQvHE5inI94eN2BKX2w
	fRcXQE6MNOfaO6gHNutkdQ/x9p2TMp5oqMkDVuhgqBZs1nWeYPbwldq8HrC6zsjO1SqCPQ1mNIx
	pIHGHjU/E3PkGYr54y765nDWO3u1tnb4vVGgqwaF4S4WhQ1Ri75Yz6yS5IVAQlw3g3YON+jkFKc
	SeVYe02adcpw+SSSOOygTEeea9Vhj46Ywc1vseTYd9wulQYQwt05mpby/yhjHOFgfjv98SomgF6
	ZyfsRpYV5jcnF5DP3nfVy
X-Google-Smtp-Source: AGHT+IG8T1D2VcobDSUfxZF55EW9JKFw5MqOt+0GKdF65CJsD1ElHprtWEh3DqhVRm63lx6N1nim4Q==
X-Received: by 2002:a05:620a:a493:b0:826:ef9:3346 with SMTP id af79cd13be357-8260ef93386mr1046185685a.18.1757944204974;
        Mon, 15 Sep 2025 06:50:04 -0700 (PDT)
Received: from cachyos-x8664 ([185.221.23.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-82a0d349ca3sm167578685a.64.2025.09.15.06.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 06:50:04 -0700 (PDT)
From: Jia Qingtong <jiaqingtong97@gmail.com>
X-Google-Original-From: Jia Qingtong
To: oliver.upton@linux.dev,
	maz@kernel.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	cohuck@redhat.com,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jiaqingtong@huawei.com,
	jiaqingtong97@gmail.com,
	yuzenghui@huawei.com,
	jiangkunkun@huawei.com
Subject: [RFC RESEND PATCH] arm64: Rename is_midr_in_range_list and add is_midr_subset_of_range_list
Date: Mon, 15 Sep 2025 21:49:29 +0800
Message-ID: <20250915134932.8137-1-jiaqingtong@huawei.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_065006_965962_10F8B556 
X-CRM114-Status: GOOD (  20.15  )
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

From: Jia Qingtong <jiaqingtong@huawei.com>

Regarding the is_midr_in_range_list function, from the early discussions
during submission [1][2], we know:
1. The VMM must ensure the correctness of the target impl CPU set.
2. For errata-related fixes, if any target impl CPU is affected,
then all CPUs are considered affected.

However, in commit e403e8538359 ("arm64: errata: Assume that unknown CPUs
_are_ vulnerable to Spectre BHB")
and commit d4647f0a2ad7 ("arm64: Rewrite Spectre-v2 mitigation code"),
the functions is_spectre_bhb_safe and
spectre_v2_get_cpu_hw_mitigation_state use is_midr_in_range_list
to determine whether the current chip is not affected by the issue
(rather than, as we might expect, whether it is affected by the erratum).

Therefore, for the arg ranges of is_midr_in_range_list being tested,
as long as there is one MIDR present in the target impl CPUs,
the current VM (and the target impl CPUs) are considered not affected by
the issue.

This seems somewhat contrary to the original idea, since the VMM does not
know whether KVM implements positive or negative logic.

Hence, we may need to rename is_midr_in_range_list to
is_any_midr_in_range_listto explicitly mean "if any target impl CPU is
in range_list" and additionally introduce is_midr_subset_of_range_list
for someone like is_spectre_bhb_safe to use.

This patch just show is_midr_subset_of_range_list and it's example usage.

[1] https://lore.kernel.org/kvmarm/86cyftty9q.wl-maz@kernel.org/
[2] https://lore.kernel.org/kvmarm/ZyG3FiUiyOi4t3rQ@linux.dev/

Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
Signed-off-by: Jia Qingtong <jiaqingtong@huawei.com>
---
 arch/arm64/include/asm/cputype.h |  1 +
 arch/arm64/kernel/cpu_errata.c   | 41 +++++++++++++++++++++++++++++++-
 arch/arm64/kernel/proton-pack.c  |  4 ++--
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787..1339a2e37104 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -304,6 +304,7 @@ struct target_impl_cpu {
 
 bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
 bool is_midr_in_range_list(struct midr_range const *ranges);
+bool is_midr_subset_of_range_list(struct midr_range const *ranges);
 
 static inline u64 __attribute_const__ read_cpuid_mpidr(void)
 {
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f..30cc91f875d9 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -53,6 +53,45 @@ bool is_midr_in_range_list(struct midr_range const *ranges)
 }
 EXPORT_SYMBOL_GPL(is_midr_in_range_list);
 
+bool is_midr_subset_of_range_list(struct midr_range const *ranges)
+{
+	int i;
+	unsigned long midr;
+	struct midr_range const *range_ptr;
+
+	if (!target_impl_cpu_num) {
+		midr = read_cpuid_id();
+		range_ptr = ranges;
+		while (range_ptr->model) {
+			if (midr_is_cpu_model_range(midr, range_ptr->model,
+					range_ptr->rv_min, range_ptr->rv_max))
+				break;
+			range_ptr++;
+		}
+		return range_ptr->model != 0;
+	}
+
+	for (i = 0; i < target_impl_cpu_num; i++) {
+		bool found = false;
+
+		midr = target_impl_cpus[i].midr;
+		range_ptr = ranges;
+
+		while (range_ptr->model) {
+			if (midr_is_cpu_model_range(midr, range_ptr->model,
+					range_ptr->rv_min, range_ptr->rv_max)) {
+				found = true;
+				break;
+			}
+			range_ptr++;
+		}
+		if (!found)
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(is_midr_subset_of_range_list);
+
 static bool __maybe_unused
 __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
 			 u32 midr, u32 revidr)
@@ -276,7 +315,7 @@ static bool has_impdef_pmuv3(const struct arm64_cpu_capabilities *entry, int sco
 	if (pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
 		return false;
 
-	return is_midr_in_range_list(impdef_pmuv3_cpus);
+	return is_midr_subset_of_range_list(impdef_pmuv3_cpus);
 }
 
 static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *__unused)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc81..ce3660625743 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -172,7 +172,7 @@ static enum mitigation_state spectre_v2_get_cpu_hw_mitigation_state(void)
 		return SPECTRE_UNAFFECTED;
 
 	/* Alternatively, we have a list of unaffected CPUs */
-	if (is_midr_in_range_list(spectre_v2_safe_list))
+	if (is_midr_subset_of_range_list(spectre_v2_safe_list))
 		return SPECTRE_UNAFFECTED;
 
 	return SPECTRE_VULNERABLE;
@@ -864,7 +864,7 @@ static bool is_spectre_bhb_safe(int scope)
 	if (scope != SCOPE_LOCAL_CPU)
 		return all_safe;
 
-	if (is_midr_in_range_list(spectre_bhb_safe_list))
+	if (is_midr_subset_of_range_list(spectre_bhb_safe_list))
 		return true;
 
 	all_safe = false;

base-commit: d69eb204c255c35abd9e8cb621484e8074c75eaa
-- 
2.51.0



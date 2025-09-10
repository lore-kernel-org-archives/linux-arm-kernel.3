Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86CDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=; b=w4u+/K8oFZrzzjbcakcUIRO15R
	8Skz79DRp8ZoSCMH7MgQnqSqbblLfNk/uCHpRGwR+XPQXErGbRTe9PQfBdZ63fbVPfmH5TUyW/vJy
	Jebuh/sXBfaJWe5wcZ9OiB2Fs/CWsOh5fRjAVLCPI1sqtL7E+Xg3cJ8V/+nu3/xt6MtpUUykVJQkl
	BV8NCl6iwne10P3oKxbOb75K934rzfZGkDzZpZ3gZOvlpv1KXxSd/g/ucgcT77r2LgUNJ2tOgi+sX
	fxpEg/mMQw1C8VEl0p62pcZPtJM9tNIy9eHNzJx5IRHON4pH4MXt8Zt/ZhKKN1PIXA72dY3RviC6Z
	KULAyX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLq6-0000000EivI-3KCw;
	Wed, 10 Sep 2025 14:30:26 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLq4-0000000EiuB-1Ztp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:30:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4b5f3e06ba9so8914031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757514623; x=1758119423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=;
        b=M6Bv5gR0UKd2/MP0StSg+tFikyoDDCFCeMYnPwWt3kOsxYyk8GJYyELV6lJk91vGoE
         KpMZT/My2Fo2wB+HObHKMpNXmGsbHHBO+QAPNanxtGlOHs4/dK/iFtHg2mB0GS07WuNi
         xSsMUhCBuG3pOSav9UtmDO2NUssg+x0HQcD5UwObzIvF01uZ7wg3b1l2a7RRDhpJ0C8y
         yp6CS88r7D4fNRFL/Im3couvFx9TarSxksewnTeU/+pcaPyJtv6EExI746b4ZI0rsmhb
         m8zMfGwoA62sUJkVxJtF3EmkO2MgBdBxwZ6DbzayZkl00jL/Hy6BosEniOk3PHdDFDNg
         9Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757514623; x=1758119423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTLchl8AB1FHcg0issnijieflGh4JJHnQc0EA5X3mh0=;
        b=AJeU0Um9HiXyWwp/snGBnoU8NZ9HwDYEZ1lDBPcgEqZbr23MFgGQmQN7V8uYL9ZwWP
         16B5teVCShtc6pnYcIOt8l9vpWCJ3r11DlZbshDxEyxMBCW8GWmSiYCjWEDrgE5GmcDN
         TyUVbuu4dx3DNLCJiDgyx3ozVCDIXRhoACPPXKeintSnwCQjlbEfMQnOu3oQwKH6T3zr
         GLx8LN8e+mi2AGga1Fk6GSJyDBq0PX7Y4JPA2xQ/s1p+5Wm2q1f9WlhXGRt6Jzfzq+et
         o66CfvJAoQGSXY9baaLD8j7kPww9yfiqtIjJzJoQ4cZ+dEzvptjr304cq1WCne7wPYml
         gSWg==
X-Forwarded-Encrypted: i=1; AJvYcCU715977ULty0tf40iFGyu0thG5ZeEKTpE+6BOxaPva7Q2W6BHOVfM6oMsp+SNYmVOFo47MvyXrDhCMwChUz2vU@lists.infradead.org
X-Gm-Message-State: AOJu0YwOSLjaTjPayyhY6cYRLggickzHLU0r8z7YA5Wp7Qd7BrBdo0d3
	+IFpzeSgGAmzqDGpEA1vuC4NZA814Onc0oYYJNpuIlZHO7ssS0SlotSutttiskwKJQE=
X-Gm-Gg: ASbGncvEP0+XOwtFpEPIp7jMZaURcXmPSxiUVBdMW0EKEPJkBmxHTBPS0f2hfPNf/qO
	NX9xeCSpmsUZqy78/Mh8X6LCTAnUlvX2p5dlEz+poSrJY9Xp6MSVRH8RJAUMBMIXYwNGC8KgrJr
	S4GxYvUfxHqy1/dS/TKrMAJvPZXb+Gi9ru++hJShZJUKOPEU3Dw1KZDsI64QvptWVhwDJWr6fBG
	hvAQoZoURPrwrjDIGzmdWnT6nLvMKVYmH347O5TEpcpVI7G95hiToYOpMXjflBSDJJDK9OZGJKh
	fMEis2nIlxEfUKsD2QwwhfTw6XtIHLoH2dW5p+hHTCE/7UhTdcSJoilButeIQFzIRS6CeQ9F0HQ
	m6YU0/lLBDw==
X-Google-Smtp-Source: AGHT+IH6dF/4Z7lZACkYC4X0s+vHgUZ6CkxTAB8Ym4mXmmNDe4jZIhgMRE+po30gyIKIXaZt/hNWfA==
X-Received: by 2002:ac8:5ad6:0:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b5f8382cb8mr202114071cf.6.1757514622407;
        Wed, 10 Sep 2025 07:30:22 -0700 (PDT)
Received: from cachyos-x8664 ([185.221.23.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61ba6edbesm25578641cf.4.2025.09.10.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:30:21 -0700 (PDT)
From: Jia Qingtong <jiaqingtong97@gmail.com>
X-Google-Original-From: Jia Qingtong
To: oliver.upton@linux.dev,
	maz@kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	jiaqingtong@huawei.com,
	jiaqingtong97@gmail.com,
	yuzenghui@huawei.com,
	jiangkunkun@huawei.com
Subject: [RFC PATCH] arm64: Rename is_midr_in_range_list and add is_midr_subset_of_range_list
Date: Wed, 10 Sep 2025 22:29:43 +0800
Message-ID: <20250910142948.221722-1-jiaqingtong@huawei.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_073024_429647_28827634 
X-CRM114-Status: GOOD (  20.84  )
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



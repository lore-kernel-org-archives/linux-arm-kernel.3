Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DB0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p90yRqRNkEpbXqQjLiETs/gtDf1cDQsPml2IReoU9ZE=; b=OssS3x2YjhXQ3/H0Gln8NCpc1o
	frwgNuKcSQusKe+pDpUN5jANyQvxommGF/raWpLDteWaG/t8sdm7NnEN32wMCYKXNZqfBmASphTUb
	+0ePKOpPGOPxDrJrNxf0AUG1cjUFKltqgdGqYn00/FmQwKXHeDZT02L92XG3UpvvgAdLlBnddDUMf
	FsD5+CdjYzrRY8dpWUwbFe8tVyW6w7K3DApoVWfJpy81K2UPrF3imVxRV7eH50UTxUvKBM++qkdp3
	/RZux+DUF3WNEVeFMtCK/hSBQiDbcukDjPJQxpgcq16lTxzBWfioTq8X0NpBYkl7qBzGMn1nPrZYH
	2i6GGtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3BlV-000000050vR-0sLr;
	Sun, 06 Sep 2026 12:14:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3BlS-000000050uw-3Tri
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 12:14:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso38659745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788696864; x=1789301664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p90yRqRNkEpbXqQjLiETs/gtDf1cDQsPml2IReoU9ZE=;
        b=nd+Q7EInRyl5rIoiV8X7djDticMiQe+CPo+cjtVCEsZPdJh2ikmQ8Z5rz1xLbCxA5E
         wfIpUw5j4nztOnZsgYgP2AyroSlf5/TezW34go3peht+s9OPYq5ApizlG7p3ijOlAzov
         bbOVH0TE+wSvAkDk4isxTpWkli+uO6EhdHx8XsHDu01masY/LpLU/rg+3AfkksBfJL94
         zKmbHGKH5qQQZMLraqKQe39U4SLX8Rp9TiIvjBsJNt/pKLh9sYMS7UZwCiuJ9dWejQIJ
         tu8TZOQU8EGQXJByhGz22c8Vwrim73xHw3aqWBq8lg3MsmiR+FG+mV7fdvBnuditR+HA
         vqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788696864; x=1789301664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p90yRqRNkEpbXqQjLiETs/gtDf1cDQsPml2IReoU9ZE=;
        b=SYHR1jCpKHx9loFbhmHr6axh5CM3p66PmXi2fD8glhRw4aEvk5Y+5c3bwyqQGno8vD
         dxSTpxOX5dmOFRG1x+DcvIFP6nVu+rW7rlKn1c+OBdu95dH5sz1GSyWB8Y+85wq7haCz
         M0ms0J6tBtu3XygCpcoGbveE3ID48BwcF7yCA+xb8mZvqwKzFA2bPfIAHuZZnxUhySQU
         G9aDYx3bhiXNlWtNx9Dd7RYNBKFMGGWON56KuBJwQZ4qx9AIhPdT1vcDri5xFoDp9CoM
         xNUgy4MH8r4iX1cSsJ1VoEB9iDAjGLF1Ke5zWPSRxN2bGKAmUmT6ny7j8h6bT+iAQM2v
         RGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8otEwppABT0jRG6PY75U6Ln8q5fn1BaKqccvSO1pAetffqO/AtOAaZhGSY69L/GvHmErQxtZFNnYFgdKwlRGM@lists.infradead.org
X-Gm-Message-State: AFuF++lquuy0CjF/v0vqIS8/aj72RfBGfLfVh7UjSEZtudyPWIHl7X9V
	BYmoGGk0jWYIlUJMp4OtLQYSGOs+mCsC6VurkgKIBAp1PlKPLwrSvUh4
X-Gm-Gg: AYBFou0ZpOpVU/KGYpTtVpwc9fq8bDG5EDGeA33FzbwYrV1WEbHWDNvR6+712nyYYpC
	eA9/g7OPyn2D4FJK2vR86z1wqkh+JrXTrWzdARL1srLaAT3A92OlnOqqCxrClR7wiqBab3B92EX
	WIPwHRuRMq565DfhoWGXk2hU12heuTwJMS2veUBMJJjU3ZhRJHU18CvJR0hWqgx6Q0d+DKJwGuu
	ypAN8bwGKicb4OCmu2LQ5yJ3WsMy30FOZgbVnKLAdIq+DQ/K8sOmdaDcz5rNJftmJstz3/RYj1P
	aQq8sxV3A3j6SOcNuIOyshtJYFAmZcdUiI63sPe7ql/wsKmldEp9tbg2f6I1L3t3EMXbI86QvPm
	UYoPeVWE+wy7ekug4dWloaoov6qkh5CkOfAhAXR+YMtjZ1wzYZaTkOhEtSl1Eah0n637LM48+PX
	DyLmV/LlXEnYUeOBiiwpnNKbuojhlLqg4gMJCkSAx5p63R2NVLDz2OFDP+neO5J0WNl4ek1sgU2
	zOItUnVU0kqTgGjUDy6Nt7kg4pSixvFzLa8D08LVDueetlEyh080NboY1g=
X-Received: by 2002:a05:600c:474c:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49cf8227619mr155692535e9.5.1788696864253;
        Sun, 06 Sep 2026 05:14:24 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm137917565e9.13.2026.09.06.05.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:14:23 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Khushit Shah <khushit.shah@nutanix.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: errata: match the target implementation CPU's own MIDR
Date: Sun,  6 Sep 2026 13:14:16 +0100
Message-ID: <20260906121421.60575-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_051426_912173_74036B56 
X-CRM114-Status: GOOD (  12.56  )
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

__is_affected_midr_range() is handed the MIDR and REVIDR of one target
implementation CPU, but tests the erratum's range with is_midr_in_range(),
which re-scans all of target_impl_cpus[] and ignores the @midr argument.
The range test is thus constant across the per-CPU loop in
is_affected_midr_range() and only answers "is any target CPU in range".

Since just the fixed_revs REVIDR check uses the iteration's own registers,
an out-of-range target CPU can decide whether a MIDR_FIXED() exemption
applies. A VM then enables a workaround whose only in-range CPU is fixed
silicon, e.g. erratum 2658417 on a Cortex-A510 r1p1 with REVIDR_EL1[25]
set.

Factor the range test into __is_midr_in_range(), which takes an explicit
MIDR, and use it in __is_affected_midr_range().

Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 arch/arm64/kernel/cpu_errata.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index b33dccfafaf8..8ec47d89b45b 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -28,18 +28,21 @@ bool cpu_errata_set_target_impl(u64 num, void *impl_cpus)
 	return true;
 }
 
+static inline bool __is_midr_in_range(u32 midr, struct midr_range const *range)
+{
+	return midr_is_cpu_model_range(midr, range->model,
+				       range->rv_min, range->rv_max);
+}
+
 static inline bool is_midr_in_range(struct midr_range const *range)
 {
 	int i;
 
 	if (!target_impl_cpu_num)
-		return midr_is_cpu_model_range(read_cpuid_id(), range->model,
-					       range->rv_min, range->rv_max);
+		return __is_midr_in_range(read_cpuid_id(), range);
 
 	for (i = 0; i < target_impl_cpu_num; i++) {
-		if (midr_is_cpu_model_range(target_impl_cpus[i].midr,
-					    range->model,
-					    range->rv_min, range->rv_max))
+		if (__is_midr_in_range(target_impl_cpus[i].midr, range))
 			return true;
 	}
 	return false;
@@ -59,7 +62,7 @@ __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
 			 u32 midr, u32 revidr)
 {
 	const struct arm64_midr_revidr *fix;
-	if (!is_midr_in_range(&entry->midr_range))
+	if (!__is_midr_in_range(midr, &entry->midr_range))
 		return false;
 
 	midr &= MIDR_REVISION_MASK | MIDR_VARIANT_MASK;
-- 
2.55.0



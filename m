Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD51C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQOlA8B/24340sHjzOUl6iozs7o5QB8r29Tt5BMqrOU=; b=JGCVQAEo0J5fg4K2cnuZ8UgOlz
	o6HCGoGp8lcZB7Fto2uafN4dnOuvNcwu55qL+PAGwbDAbuu3Cc0gyBQYkbqPqC9VR4yyg7ZLHs9ZG
	m/YsDwT8VFHljcE2rBGO0NniYGmpw9kvnl0uB1SmC+Aid/OEQW4T9wLA63JLd2aeXb9bFuYvwPbp2
	/WZ5edFSj3vDYtfn5pozFqSCr1Pq0mdq4Ms5Zy2Dg+g/Xaj5TVHzepdjAvUKhPZFolfM05hCUAcTe
	IynvU/Jnu473L/gZvLC0N8Oy7lvihpnD3/xVGHxHYVRZ2Z2JStbIff0lR4aZZaBu0sAh/HDxnVxlw
	Ok+OV0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGX-0000000Bjyp-0DiK;
	Thu, 24 Sep 2026 17:29:49 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGQ-0000000BjrX-1dvx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:43 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4b28dbf4197so203587b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270979; x=1790875779; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQOlA8B/24340sHjzOUl6iozs7o5QB8r29Tt5BMqrOU=;
        b=jGmJu2j8A027ltAktxEo2hqR15nJSEps/hjFHQfqwx3kCjteuqnfdOTLoxAZwWIerx
         Zxr9u/GkCiGVYBOxQmN2bLmSpcLzk/LghCFN9yl3VBXyCt5j5ywQZDaAk+a4gqKknMfD
         mSXhSdW+gOyG7c18/zSfJpOIWh5iDf1oZJ+ESxf5IvKeofJteN0lysoEbm+lxkR1HPCg
         41UmbrdF2hrCSSb1z0Lg/VbMPLzafnDjtKliLyrtX8PK+s+cscE5BzLpM3/iCTvj9C2J
         1V2rrm31N6E2CqswPJbxQwfQLAIAugv+X1XIYv33/SmGjPNQzjne4cZqUSxWnW6lzZqA
         fmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270979; x=1790875779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQOlA8B/24340sHjzOUl6iozs7o5QB8r29Tt5BMqrOU=;
        b=A534FGZ12Cyns0rQ8jw6cPCIkQaaHDqlvjZg+VKJ3ab64mB2qwjY2amgZdugB2KTEI
         m6YWCRvoB1iAqP7/CYx+EF4mCIAGv6skx1okSnJjzdfT7a7UtvYHso0BrM2FbIRi69lO
         R+NCK2roxbkfpqP1+0uNcZK5O5hd+7AVTtvovSpmQehaPwAtU1yHA3MHC0i7AldpirIu
         TBUEoPufGnDnHE0f8neTCUoqXZmYVhv4agI1oTy1xzCVNfrmTyodDwk8NOZsjm8PaObQ
         lR3/pjkp7QkqDBIlA6hXntxD8LFSwhTNnIXU4hVx58XHM4G8lctOMlePC+jST2TC0ffn
         1rmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn3KBRn9zOpES27zF/E5w1o9aFZWZadqRxgeJ0sZG0Sr+g/O8THtCo7uiBM2TLlRAyqxd+YO6FPOWveIOx1MOf@lists.infradead.org
X-Gm-Message-State: AFuF++nh7hn5pS4NiyuekSHpNh+/W4/R/25nV79H3gE9G25TmGcDZXKd
	m0/HDZ51gAWMOoKpxAE+6lCmNRnLSdtsb/0kR8L/ZdsPNukZ9XcMHhmt2Wjwp4fMzNXE+da5K7q
	og11oXPdMlqqkEIYBXqG6Rtnhxg==
X-Received: from ioeb22.prod.google.com ([2002:a05:6602:2756:b0:9c4:2037:88e2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:670f:b0:4d6:90d3:e18c with SMTP id 5614622812f47-4d72ea5ea92mr3060445b6e.53.1790270978999;
 Thu, 24 Sep 2026 10:29:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:12 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-7-coltonlewis@google.com>
Subject: [PATCH v9 06/22] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102942_518667_96D6356F 
X-CRM114-Status: GOOD (  15.18  )
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

When the PMU is partitioned, PMCCNTR_EL0 is reserved for the guest and
removed from cpuc->cntr_mask. Move the PMCCNTR_EL0 availability checks
(cpuc->cntr_mask and cpuc->used_mask) into armv8pmu_can_use_pmccntr()
and un-nest the 64-bit user-access fallback check in
armv8pmu_get_event_idx() so host CPU_CYCLES events fall back to
general-purpose event counters when PMCCNTR_EL0 is unavailable.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 49289e5993dd7..c15a34684137a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1015,6 +1015,10 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->avoid_pmccntr)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->cntr_mask) ||
+	    test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		return false;
+
 	return true;
 }
 
@@ -1027,14 +1031,15 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
-			return ARMV8_PMU_CYCLE_IDX;
-		else if (armv8pmu_event_is_64bit(event) &&
-			   armv8pmu_event_want_user_access(event) &&
-			   !armv8pmu_has_long_event(cpu_pmu))
-				return -EAGAIN;
+		set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask);
+		return ARMV8_PMU_CYCLE_IDX;
 	}
 
+	if (armv8pmu_event_is_64bit(event) &&
+	    armv8pmu_event_want_user_access(event) &&
+	    !armv8pmu_has_long_event(cpu_pmu))
+		return -EAGAIN;
+
 	/*
 	 * Always prefer to place a instruction counter into the instruction counter,
 	 * but don't expose the instruction counter to userspace access as userspace
-- 
2.56.0.rc1.310.g51773c2048-goog



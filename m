Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC3CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=; b=Il+gHQkYJMCOTrtL9kRKa5MvIk
	pU26BPaccVBDcV2xin42xL9zg1bnDE1VuOgyxIdfsAyQ6d4pGhnU0Y0YvoYffab6k+CyW1S2+Zlwn
	rJuAwFpceRs9ivAZwQiWgY/ouM30RhxY4JGz/uCrNTS+HJv0lUDwSMwjMFNxTgbKDHVl/hMfSL9Mt
	WIGzcfRQkehlrx+8BrzmPsYY8Jkb2DkS0quzsJtBZ5UHaOoVgzRt/5sw6xj70KrKt6BMu/WNdTbI+
	kk2ABSjfrJUmxO9bNWMI2jPxOtJlMfLr/TJe/7lhzgGMg0Qtmsos+TJlGyBhhNuOSRahqgV74E+Ai
	tXi0XnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z9-0000000BSNp-1OIg;
	Fri, 12 Jun 2026 19:29:19 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z6-0000000BSKS-3ENL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:17 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7e6f905ea78so2404499a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292555; x=1781897355; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=rWaJVe6l3ZtjahzftN1KvzvMCEWdgI3tTxG5Cgg0G3I5R2oec7VFlPn8os+Q+i67rG
         Y8RNfAHBJB4Y+3FOCdUEV+yTs0QxTWUnfGEpZwPxL5lZh4oh0rb2vuDQhJAiviX/DfTV
         Xj6f0oTUr4tXZoFCCaL+KIsWfV0vjydexgaVPEHCEwJzw/7dydBCWnkyyemWtydev/kX
         xRjG1RBTFfTdIppZ0E9vskX/oXrkxeZeKm0UoUDQE2m+BTazSVz1MG7RkUIo0EO1fEtR
         KgBHvy7YZlrcpgwqkDgSlUOtxBMn+mDoD5ch5BvA8XGcG5pSx21G4X4fORAoqtCXnV6Y
         B4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292555; x=1781897355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=PKewamff7QG/vwBa2JM+qf04sPD+6vUZOEou199OwNc6SgmpAqSuiETGKWGk6bhJVM
         lGdjPN4q0XNbRkujInZRWTAk28N9MnyzHQfVGs9gKWH6DrgKyXy34neUGH33ZdNGkndu
         H8Yo7WRtMriVOJpR6ib+/pSpeVyB+aBF/2Q5WFSWFgJB6TL5S8716CQW7aAxatRbCo5v
         ZfIEtjc9EU1b8L8587fEYhwpbkDBvHNAy1AWlOBfcVGqkFp/N8uN8EajnAYYazKD+o70
         FZTpXoCmNj/vBkz/aRpsjvkDohPOGpA6rG/oZ68qSsunQj+F+Vw/cVACb9xc022Yst3X
         snqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Tw9MRauVyJHKoCaJqtiEAUYqsIzuob0+LUVe6RkhaPwHT7TQSBjts8TSWH30PtLhtQP9895YgzpXYzEdRKoR5@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjMK8JZQ6OjCUS4m56Fnhk4OAOdGAuIhFe6E8XxtSgpO8Kr3y
	+doFRuVye7cfyvjal3IVjILVf4pSxi0asAfcqcHeNaxkbduVdDnxCkTedjH/GZh8XDrvt9p6NNV
	A0ANMfaqkU7PF82WMVP+uVcSNqQ==
X-Received: from ilbdw10-n1.prod.google.com ([2002:a05:6e02:410a:10b0:502:1132:3db9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1920:b0:479:e7c7:dc76 with SMTP id 5614622812f47-4872f4bc1a3mr2488426b6e.26.1781292554890;
 Fri, 12 Jun 2026 12:29:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:53 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-6-coltonlewis@google.com>
Subject: [PATCH 05/21] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122916_833136_FF1DFED2 
X-CRM114-Status: GOOD (  12.42  )
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

Check cntr_mask before using pmccntr to ensure it's available. With a
partitioned PMU, there may be instances where pmccntr is being used by
the guest and will be absent from cntr_mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1cceb1f614515..17bb1cfdc271c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1028,7 +1028,8 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		if (test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask) &&
+		    !test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
 			return ARMV8_PMU_CYCLE_IDX;
 		else if (armv8pmu_event_is_64bit(event) &&
 			   armv8pmu_event_want_user_access(event) &&
-- 
2.54.0.1136.gdb2ca164c4-goog



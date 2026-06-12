Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B63CD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVFHxuaku3ZzfsFio1NduM8zq/i0jn84Pu2i1DJARd0=; b=iWcIZapzDJpG96KXC16VeLSMKj
	9LnQF+37CSHOhVCDgGMkXvsj8XeniOC3dChCtjM/vHwzhQBHLA61Yfjg4DtHCWP/oiHU1SRAzhaDk
	9kfhq3IAUK8lXxZSX5BvAi0DqqLnuDupqii/aF+mav2BTnce8tKT0+szRy2GlPdganEtdzED4yUoT
	SQDVpiQdUh97YfoCjmSZaTY+K7ynNzongY8fHY/4f5srHhxgYDjPsIBpVVCwlPlPw/059t0VN3C78
	YtkqZozPBA47E3TQiuwy3P4PkUWBy+9LUyjWqJ6fEJgv5ECPhQ0oedmTJIXxaGJGWT+8qgS1weo0r
	CRUg3mQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZL-0000000BSaK-3HuN;
	Fri, 12 Jun 2026 19:29:31 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z7-0000000BSKn-3Rsr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:18 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-486d0cff483so3285508b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292556; x=1781897356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVFHxuaku3ZzfsFio1NduM8zq/i0jn84Pu2i1DJARd0=;
        b=FqjKyQ7iFh1u6EQor+Lb0dzXC/GN5ppg4RzYvLANq8+JKpAv27I07/tPhRlUeevg4W
         Al3CBbyWX067pvISTo3SjWNEkeoV8TsJ/82wVZVnPGfIEOgZN8EKErd8D5GS7Lbg43xy
         V9N9/ANuSZMrWI/G3+tbGtuqHQ1kt+MffkBd77gLxifTevzJaqfJOfOhZGr496YUWVfA
         QCQyBjcmGU2Ix/SdMuUnCdGg7aix98ICC5UqulUOhHeVqF9uNzFEalvonZWhBqSSpy76
         6qqmzA4q/39FtW7tmVj1jsSaUrBBFdYc8+wagn03O8mKCn8i9B1nryooxSj3bpCao87+
         IHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292556; x=1781897356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVFHxuaku3ZzfsFio1NduM8zq/i0jn84Pu2i1DJARd0=;
        b=DVafcV1c10MWOb7rJt9FPlyBFYlX01qku5veSFMm3AKoHqt5Zl5SRTd8owjLY2ovrI
         F+s9bwS19uGXfpCcZ4eXjKtNEqWVyOVqfIdM7TJOCEevcGhovRFy+qfyRKxLf1CWfm6E
         VBB1uZhdvO7WmG8BmSO6p9TjgFfVFwLtEHowm0i6EN/YiXsiKmvauelSWuEDQJnlYTGG
         dkyNgb3P2IO8vp9serkJRe+sDn284VxXUuKJbCLpoDclWv6UysT031WheoMWDb7e8PlE
         fTCvPgysrfWqzOoWAIT6SFZNYii+XK+Dx9EXZZXAJR94ySTJhGN8eGZJ4FgSwmIqrcYu
         9OmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RsEqA5tDfMvirf0Fl1KzORaZ1FGw3ZM0vTUHQebvSVN7BnTvFEhqrzvXcxk6FxUTjhQxjLjJsmKAS/byAE/hS@lists.infradead.org
X-Gm-Message-State: AOJu0YznFANT4N9y2M87Mn8YgSdwpndZJKcZg6MFy8TQgoVNsNSnlO8W
	xm4ukMXx9P0ctCfDNjerTSCcLXb6gobulH4AF0ee6/OHSN6v2NExWWcS7IikeOTUqvci9EksEa/
	piNjpUcPuMy8Z2Ns0UH+G2A56JQ==
X-Received: from ilnc8.prod.google.com ([2002:a92:dc88:0:b0:500:1d31:d513])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1250:b0:479:d779:3544 with SMTP id 5614622812f47-4872f2e1d0fmr2673319b6e.5.1781292555927;
 Fri, 12 Jun 2026 12:29:15 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:54 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-7-coltonlewis@google.com>
Subject: [PATCH 06/21] perf: arm_pmuv3: Allocate counter indices from high to low
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
X-CRM114-CacheID: sfid-20260612_122917_867585_3AF3F39B 
X-CRM114-Status: GOOD (  14.94  )
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

To minimize collisions between host and guest counters, allocate host
counters from high to low. How the pivot HPMN is defined to partition the counters gives the guest the low index counters.

Doing this with index math instead of defining a
for_each_set_bit_reverse macro is safe because cntr_mask is always a
dense range while the host is running.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 17bb1cfdc271c..d7a49dc0b0be6 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -953,10 +953,12 @@ static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc,
 {
 	int idx;
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
-		if (!test_and_set_bit(idx, cpuc->used_mask))
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
+		if (test_bit(idx, cpu_pmu->cntr_mask) &&
+		    !test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
+
 	return -EAGAIN;
 }
 
@@ -969,17 +971,22 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	 * Chaining requires two consecutive event counters, where
 	 * the lower idx must be even.
 	 */
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
 		if (!(idx & 0x1))
 			continue;
-		if (!test_and_set_bit(idx, cpuc->used_mask)) {
-			/* Check if the preceding even counter is available */
-			if (!test_and_set_bit(idx - 1, cpuc->used_mask))
-				return idx;
-			/* Release the Odd counter */
-			clear_bit(idx, cpuc->used_mask);
+
+		if (test_bit(idx, cpu_pmu->cntr_mask) &&
+		    test_bit(idx - 1, cpu_pmu->cntr_mask)) {
+			if (!test_and_set_bit(idx, cpuc->used_mask)) {
+				/* Check if the preceding even counter is available */
+				if (!test_and_set_bit(idx - 1, cpuc->used_mask))
+					return idx;
+				/* Release the Odd counter */
+				clear_bit(idx, cpuc->used_mask);
+			}
 		}
 	}
+
 	return -EAGAIN;
 }
 
-- 
2.54.0.1136.gdb2ca164c4-goog



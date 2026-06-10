Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBBFCD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NGdw5RJ6bJAu+NqY9JKZh9Q+XXOC2uDO6XCtjvqorw=; b=d3oQbRb1eSJp8Vi0yIoBd9Bd6l
	rQBsqXj8/TzVhzSx52aG8ruDfrkby9ZN6xP34CZo9wIC/L6mUS20sARqBu7wrXO6u4t7iJFX50n5q
	fYTlcSqjfy1TS2LBgU2o5QqvqBZyT6DNwR3bCa3qVHVClzT28g5qeswwlAbeW/Fd535vAu3ZRifxK
	0C6HsZqjBHs7hpZYq/+xFAkViCJ5//beBfUlgZ+yzPmh0UXhO+lPpppzfTZt8KCI7xJ1JZEpI0Pre
	lyFNedkIG7aF/EIMPzXKjjYgZ2jRhJVlFz17R2Ti9F1OhjmxyspCuDYN1/9jZG/DVj2BfBFMMxKRP
	UavXP1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ca-00000006ZT2-2y7s;
	Wed, 10 Jun 2026 00:53:52 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CX-00000006ZQ1-13hf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:50 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c85a298cd62so4015963a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052827; x=1781657627; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8NGdw5RJ6bJAu+NqY9JKZh9Q+XXOC2uDO6XCtjvqorw=;
        b=URldAeY7SbWaXxXVGJw7zIFuN6x2g9dGar8i5zYfY5WVs+6KYTyiaSv1MjnzLA11m8
         naWjUOt3YWESPkN0bIV8VILbzCGwzFYim/bnlIYeGaVYfN4903AtwfmJLJScuYbEIvv5
         vqclY8XK4LseBKOHPpRrrJaTShObd/cKpOAYXCrqjfAAvEXyeubl8/q1051flKtSum3f
         OffkEQgoCWA1fY2/mXN7NHgNSTl3XIpUyMmpYHNYivemsl1AmA6RrLDBLMXUhaQEZaYT
         /1s+/+TwFWkBb7Apjs5oszPOyu0MmZOq6k5kzLmLRwmfLUxX2UwcZkKHkQNNkIskMH1S
         XRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052827; x=1781657627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NGdw5RJ6bJAu+NqY9JKZh9Q+XXOC2uDO6XCtjvqorw=;
        b=fhi3G75eSewsTAv4wIulxDwfztnsa5EfHNXiiWzMmGTCMF+9oFEfwPwSt5kJ0IQIqu
         lIqZtB+KxL/KfIhj+rdevqb2HJSufvKvhYnoFJL0sCKvfmnpB7pum4V2LgCvzZWVwO/Y
         BiV8XxcjGeiRKBYlwZtIWVn/gb7VURL6sNfslLZqgTJZMv2CMiwafWI1zJKUi0OuIxqP
         JqmawMJkMH9jh2mXnPgL6K7k9QLTwqvOFpzRRg1gcHnUM6wgAwte36HdJmdrWttFxG40
         OR3EvEEq0iwRPm0Lpix9YXwAzbkzO13BmJT+sqVk+OmtqMJjvvVla2TJeehopNzYtRX9
         YrUg==
X-Forwarded-Encrypted: i=1; AFNElJ9DKVcHc6vXb6ZqDxnRbou8D8noHCEUHwaIEEbumIPt3A70id5vg9KtX4MJWYy9xMd1xMd5gzXnoLiTZ6BLXmPl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9DNATG9uVyS3a++HkyIqUUKBDs8g+Nx3IIwAT/W8s4vhxfM41
	Q94DMAierxwd1Q38YtJiOrku6Nr1wW1RBv6Z/26sLzy95PFTmdC5RbAmgCXE/rPp+GdGrFZFSu/
	FpETdVA==
X-Received: from pfbhk10.prod.google.com ([2002:a05:6a00:878a:b0:842:723a:7919])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2351:b0:842:569d:b105
 with SMTP id d2e1a72fcca58-842b0f8bd8bmr25284333b3a.34.1781052826595; Tue, 09
 Jun 2026 17:53:46 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:24 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-5-seanjc@google.com>
Subject: [PATCH v6 04/18] KVM: selftests: Add helper to generate random u64 in
 range [min,max]
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_175349_317073_4DD5231C 
X-CRM114-Status: GOOD (  10.47  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Josh Hilke <jrhilke@google.com>

Introduce kvm_random_u64_in_range(state, min, max). This function
returns a random u64 in the inclusive range of [min, max] using a struct
kvm_random_state.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/test_util.h  |  3 +++
 tools/testing/selftests/kvm/lib/test_util.c    | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 44c0104d60ac..d64c8a228207 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -134,6 +134,9 @@ static inline u64 kvm_random_u64(struct kvm_random_state *state)
 	return ((u64)kvm_random_u32(state) << 32) | kvm_random_u32(state);
 }
 
+u64 kvm_random_u64_in_range(struct kvm_random_state *state, u64 min,
+			    u64 max);
+
 enum vm_mem_backing_src_type {
 	VM_MEM_SRC_ANONYMOUS,
 	VM_MEM_SRC_ANONYMOUS_THP,
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index e98ca7ef439c..e208a57f190c 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -42,6 +42,24 @@ u32 kvm_random_u32(struct kvm_random_state *state)
 	return state->seed;
 }
 
+/* Returns a random u64 in the inclusive range [min, max] */
+u64 kvm_random_u64_in_range(struct kvm_random_state *state, u64 min,
+			    u64 max)
+{
+	u64 value;
+	u64 range;
+
+	TEST_ASSERT(min <= max, "PEBKAC, min = 0x%lx, max = 0x%lx", min, max);
+
+	value = kvm_random_u64(state);
+
+	range = max - min;
+	if (range == ULLONG_MAX)
+		return value;
+
+	return min + (value % (range + 1));
+}
+
 /*
  * Parses "[0-9]+[kmgt]?".
  */
-- 
2.54.0.1099.g489fc7bff1-goog



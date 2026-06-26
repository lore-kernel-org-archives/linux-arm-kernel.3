Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWc4GlXVIsd14e/yCg7QaIqalab335GasYtgDQrZMX8=; b=EZSqXNrAeU71X5HelySTI9fvk2
	CUp7D0vfcEXMFv60Uk24QVBzBK5aCBS3IY7xzyNaIupN32iEz//N1l/nqKf8rUYMeTa1R76AOeSxZ
	WH/lITCIgVsiryC2fybzl1t3tCW0QgUvY1BUDOoI2DfjM7C5Pc8pZ5SJefMymzZizsN5rj2l9ttVs
	Oshs69vDXWfI7L+aePRMmUDs1qpPW+FfF3tmTAObKwen+emyeDDNCf7QGCrm7fr1I/N3MYxtsOEZ0
	Awu+twoNlYMCuv/cuyIMFbxcYMfKAtqEVvfkIlG1lBGBRKx9HnVxP6RTc9d9QfCMzut/msDegDYT+
	D+QiCKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDX-0000000BuWH-0KKL;
	Fri, 26 Jun 2026 21:36:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDB-0000000BuHL-2NXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:46 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-845c605617dso1061012b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509744; x=1783114544; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pWc4GlXVIsd14e/yCg7QaIqalab335GasYtgDQrZMX8=;
        b=CikSFXuGwBl/n3FzsbPdTfkn1rkA0olkNNOfv7H4RS1DYyWUV59Bsn2N5cgxaX12Ht
         zO6dkGOi/BkuEpk1s671ndl71d9UkUumcYGhdCMJMlNELl6p5HSvhlzzVXH5Up87wS6q
         /IMSsMCnxBLpSoXARrOz+qVuZ+Vm3iTfXVhKr8SA0Pgo95abGfR+XpbLCNnL14fep8OH
         EdVJo6SEgmP6u+qFdvcgGr3cfR7i1LZvTa/wPgL918J0uvk/KV5j94J7qVqzzvM8kwA9
         wufUSnnbOAa0mF5iHIXfDT6UuPKGdgT8zl8tfjS0QzU3Y+D8b0IqAJ4Cuz4yrgrMVYdT
         gVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509744; x=1783114544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWc4GlXVIsd14e/yCg7QaIqalab335GasYtgDQrZMX8=;
        b=esYVERu/s0ldwlyNMa6dlVpxsFQYqOeOZMHHPylYIGB00T5Y643qYGPmRHi93YUabP
         WZ097xdA6+8tsOvpsvv89LkoYZdr9NUSn5BH6I26CuWezP04R49GiOwFG5tdYsLF7SUM
         QKzYg/XNqPxj6RYKfAW0aSDZa8FwNJfM29AHLCE3aFBsYmyXgjH+BO+iSPcWX5uBS9yL
         O3j3ft7lsoqbWhoxhXK5tKH8GMIOOMky/Zpq17OfT6GcEYyCupa1sX8CBg4b5vHXsB60
         FqR7hcrVPEjeCrBnKIEL7TFhvA9DkkV8OYDl2z7xzTgS4ELztrqiALaikdoI4BU/RsRI
         JMQw==
X-Forwarded-Encrypted: i=1; AHgh+Rry/jqz8/eP/Ke67+IlG32jeqGs0Qg3G66ApZDJiE4ypP8b/BSi1+otpxwvVkBVCYL/Y+VV0CKhvme24xhtkaP+@lists.infradead.org
X-Gm-Message-State: AOJu0YwzsHvRs+Byjg3TXCmJfAIyU62tabHvYGvOBPmvMsz2xjyhu+rh
	DVHAl7IfJXJTKvsY1k7zTvhTb1AogbCvbK2CO2738l6W7d0Anv+kfAJG1hhGZdI0gsIXWrVwIES
	C0D6Scw==
X-Received: from pfbmb6.prod.google.com ([2002:a05:6a00:7606:b0:842:723a:7919])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:189b:b0:83e:f228:b112
 with SMTP id d2e1a72fcca58-845b3b8e2ddmr9010923b3a.34.1782509743991; Fri, 26
 Jun 2026 14:35:43 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:19 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-7-seanjc@google.com>
Subject: [PATCH v8 06/20] KVM: selftests: Add helper to generate random u64 in
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
X-CRM114-CacheID: sfid-20260626_143545_608480_7F53FC6A 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
2.55.0.rc0.799.gd6f94ed593-goog



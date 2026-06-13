Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC389CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpDrln9aFOeZE+9RVMRnWEbd+STgPtUuso+t2WcSRjI=; b=BAjr26K0MJzxmsmA29ZujVbY0W
	nN+Fwf2D0B3yq0w8ZIemoXHMXpdC3fo9DZQWI/d4E9vtku4wd/bTPY1bWhGCYaKTs96Q3l208Pzxp
	fsjAMNHymjDKhd07ZnzorXyn7xYc6JraZDJ6PXMad9s6tphUfOSTNUD27+e3xuEVaNnt9AcfJr2m/
	CayMf0BFOaHbay3wXWvSQ3Rj16Y/cduVyeRaXjpn+YRTq5nA1GCcIEe79gEJzcvmC19TVquXOpB59
	qCszmdXMWp2U3ma2nus/xpw2R53/SwwxHxUmF5qe5ivXMcrr53cH/+WbfYvvBrkw+zzVxrXtyEdDd
	mhJIddkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7G-0000000Bnfb-1gHI;
	Sat, 13 Jun 2026 00:20:50 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC79-0000000BnZZ-1GkT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:44 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c0532a6588so13996615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310042; x=1781914842; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RpDrln9aFOeZE+9RVMRnWEbd+STgPtUuso+t2WcSRjI=;
        b=N1liG7/rlcAR5Tl2zZSdTpWdvLfQg65Kex+f9T8MOq3TCD8cCjcFolupScY7GwovPJ
         gE360opHimmJqgOmy79OU2wzDMyM2TlVOCgWlEKap6em0tYjuebLG4Z5JJgzKIJjZiRB
         eeYLJaJrE39lcG8ibgaSVtehmyrA/OKKhdISjWmsOaoCC6asQyKnffv9zuCMCCKSAlbD
         TWSejfNptqF1clePaMwaOU3qaMgBeIh80zaNt+mrwMEARTy8lW5l0hjgOkJ5PoKvTeZK
         pm9rF2Ow62LO33PtCkTBDW8iomHWvkZpLmrz/8JxMCAvvXUP3OG+gTxMKR46EsjUsSi6
         eDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310042; x=1781914842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpDrln9aFOeZE+9RVMRnWEbd+STgPtUuso+t2WcSRjI=;
        b=RCjQuzGGKIK/6jJGw2DAzxClPkRFgg85yTJvy52U8vcaLillAUbNnCWuOxUaA1wnqe
         OsvY5oG0MhFf0GJwemert+daNiN/jbZWvqkmTRiAEEgS70e1/uMfo0q81aT6pOXCs7W1
         pmwxSr9ag8KVAvJ9om0ikUw8siNXdFeTZgpd+qxUJnCcJpokm/+LJBx0bBaNVNS6b0V2
         ssCWvJajFzTP5XYRJ/Iyqy52HLTvo9cnCjSQlFeQ+hMGrn0ttaIIJKPBwgnsH3O+pVhO
         tgRgIRNgaj57PpRDQN3sQsQ+07J8Hc9rWjoaU22PliHXHQrYLdNn8hmm8mVrBr+U5xXI
         sRYw==
X-Forwarded-Encrypted: i=1; AFNElJ/9FuPDmqfa27nXZxRNhuJd85zQLY8LFcXjUTUVV8YH7Nwq9JQy7GKZP3VBEW206Za4JE/6wcsLF6K7GMHICvUB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JB8wju0MO37qw2LO1kZ403ZEBcMDTmpnUoW3jJU9O7521c3I
	J1GdZI59KGSuqQhFEIKm/gh5/tlcHUEOlhrq6Ihz/JAE2Z+vCaVo7f7KCxml7AVKNNmgikeqw2Y
	csPh4nQ==
X-Received: from plbkx8.prod.google.com ([2002:a17:902:f948:b0:2bd:106:8ad0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e881:b0:2c0:b932:866e
 with SMTP id d9443c01a7336-2c6642915famr18540805ad.27.1781310041864; Fri, 12
 Jun 2026 17:20:41 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:17 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-7-seanjc@google.com>
Subject: [PATCH v7 06/20] KVM: selftests: Add helper to generate random u64 in
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
X-CRM114-CacheID: sfid-20260612_172043_349259_BBCDBC2B 
X-CRM114-Status: GOOD (  10.00  )
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
2.54.0.1136.gdb2ca164c4-goog



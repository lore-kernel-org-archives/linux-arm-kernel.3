Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637CAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXtQgo0JIkUT7TODCNQx7pYKeIXv6hb0g8DOUP6P7to=; b=sKZ11GMJsbfB1WFY/xZpbVg1iG
	a6rlPSo3kL9fTkBr8+gL0S2rzV34TKO08veLAKk2Y0/TxXXM6NvRljWrSqsBs+kWuEg3GvI3fP18e
	np446IVs1g0yfyI0TFmGG0Ey4ILXTJ+hpO9dCPk6BFM4DNkTJgaYVCRnJnkpnlivsH1GxLWI92lGB
	ExVpLdDYLAYbbXmMU2i2yNS8cSFyYkADE77YV26Hg9++DYEaPvdGYalOyBJpWnlR838J5SzUuEi6y
	/KVheSq8J/q1ZCEm8eT3oYhgA0sHPYE9n3p7R5lEfn3VcsZnXB1d9cqcd6kS3B62gaNnroZLPgQ6J
	L3syTCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSTB-00000003Wrj-06EZ;
	Mon, 14 Jul 2025 23:20:25 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS94-00000003SRU-10ij
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:39 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-87595d00ca0so469821639f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533977; x=1753138777; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXtQgo0JIkUT7TODCNQx7pYKeIXv6hb0g8DOUP6P7to=;
        b=CzSi2R1aYYzx97LCe3wdyVppR3ZK52kPsg8EVOtwYQ7pDcw2oCw7R2b7Fw4Y16YCBd
         buCvRS7LSuCn6cvfqPCihYCvsC95PcS6ZNuPakGMWYA0WkHsn28qupm45AHYv6VsQd/y
         4tyiYQh4y/UsLl/h9OC+S62fwElON9/fMewwE7Hu48Mf427iP0r6k4xTPDoumjSBJ2Rz
         J3zEQqDdireMgBksNTQ0UDIpzuCsW+mPDXN5e9LhpZRi6EUvQzye2u7bws1j02q576eN
         Y+i4VyaiQaEkPuUabHH1rxBzsrGAdEJ6t68fM5Ekr+xR9BDr2aH52HdV+E3BrawAWZZH
         soEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533977; x=1753138777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXtQgo0JIkUT7TODCNQx7pYKeIXv6hb0g8DOUP6P7to=;
        b=mIwARoIRDRAjq3ZJL+IV0xt041GIS43BtJT/QX+NMUcjDsBluMyxTloIvjibFahs/O
         kDAy+xGqsheVCGNCzQODrG5zpwICAJjpfC/ezNkBImFS/KEuSAhEe0v0fCg1HCZBpMVC
         XP/pIU4nJdgiah71E9uQ4lKYnN7PfSipJlVfC7MV0IeAaP7uxC4BzIgk8H5GyPssfF6k
         dwhw/g8C5QO8zPKksLtpzuMXLaEXYMVS9Nztew9zI34Hgkf+OnWtz8fZEAUGbbtzf4IE
         cy78uk0xb/X2bcWyJRJMSfzCoGJcVt5YRGv5a2Oop090HjUJ0EIC3lE6I4nj9Fa7g42d
         QiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL1N284Xc1pOhm6ybkDAusRpMvPEUJTxhMP30GJk+orEo15EksxuHdvEI58IaEsDwqfSlJ5g0VoOGcHblfURKg@lists.infradead.org
X-Gm-Message-State: AOJu0YyqAabsiGt9TvLDgwOu4gRzup4uHi6Du4o2oGQYUZbzJf+9H8c0
	ByG3jO3Bq5pUAh1kTrO63DjvZanuYQJrgdWzSInuM0ZKTO4W/mPVO26hRQov7ZOZ+K/ZrYyAap6
	nobnHJitewU84tfxz+KluwlR2Xw==
X-Google-Smtp-Source: AGHT+IHBO0mASu578wHJOGcQpQ9A5EOTJJDI2Tsl6mLeD713vdCHw+Xsr7SE46k9aYTsouWFo/KzgvhsXQhtYGQfSw==
X-Received: from ioni15.prod.google.com ([2002:a5d:840f:0:b0:855:9384:bf3d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:380d:b0:85d:b054:6eb9 with SMTP id ca18e2360f4ac-87977ff3c65mr1759326739f.14.1752533977132;
 Mon, 14 Jul 2025 15:59:37 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:01 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-8-coltonlewis@google.com>
Subject: [PATCH v4 07/23] KVM: arm64: Account for partitioning in kvm_pmu_get_max_counters()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155938_284876_DB3BC27B 
X-CRM114-Status: GOOD (  13.86  )
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

Since cntr_mask is modified when the PMU is partitioned to remove some
bits and kvm_pmu_get_max_counters() uses that bitmask to determine how
many counters are on the system, make sure that function also counts
the counters that are no longer in the bitmask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 79b7ea037153..8a21ddc42f67 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -533,6 +533,7 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 counters;
 
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
@@ -545,7 +546,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	counters = bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+
+	if (kvm_pmu_is_partitioned(arm_pmu))
+		counters += arm_pmu->hpmn_max;
+
+	return counters;
 }
 
 static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
-- 
2.50.0.727.gbf7dc18ff4-goog



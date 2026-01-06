Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B0C47BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq1IjMSjoMKjdw0XAwlPesXU4TmV0d7vJwGMiICzk6g=; b=eLDhDQxg8Y1Bp7PZsaEInJTCSv
	8FwWzjTrmL4n2z9aaoh03PxAwYsiJ0Z1zfZSpK0Un30+h4DkQ6QmHRwxtuIgMVcM7LlzIWG/bNTWn
	/5ufsyzr12NTGOiLgKs29e6vGbUiUm+J+YBBacyB+sy83Fp+ZhYTtkyMcYG/F++zgsGUH53rnGbkG
	/qUrhgj2UMc7xCUNXOcCkFtZ61B0xBqV6OXEqf4CtUJCyq+uQHW8lldvqDteeYim1csV+BtsZrz7g
	4EsYe8BfJFt11hjqEAQweFCJZsG5JQG1zaYSfUlVfArZU4v4AHL4mx3UzZILjbxWx3Lpbz45oaLmA
	FLZrdczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Il-0000000Chzw-0uSJ;
	Tue, 06 Jan 2026 09:24:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Ii-0000000Chxx-2hrR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso5341035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691467; x=1768296267; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kq1IjMSjoMKjdw0XAwlPesXU4TmV0d7vJwGMiICzk6g=;
        b=equuKA3ygJ4nbdiSi2l7m63W27tOV0v8bh2BtSWPZQgEWcEdPgjp6/aNVJ9bq3f10w
         aYFI5u+5gpTRC+kpwwJnUiO6c84gven8DLRtOwfqiYy2KlcjBLj7jt1uTiHiMyi8OOIC
         Es/tn391zDhXv6iQpRHi5vEltFciJtJCuCdl0ZnAXBqqaC++Lutb6WJp5KDIQJ9bEmpI
         q2/S01Q6g9QxeJc248ivPrUimCakxMDaEcN3TTo5zQPhe6xIdQI5xnmWDYuF7y+dKYUK
         5fsynm763flLZ0TudiZVIxONgaIrsPpqJ6bINGDU2FPvTEwJnYGa9pM4vpZHLdVHiprK
         45Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691467; x=1768296267;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kq1IjMSjoMKjdw0XAwlPesXU4TmV0d7vJwGMiICzk6g=;
        b=Vj0KSr+WFViRCigMRqHWTBj4JGf8m/rnDr4g6ElUQy84hIUVbQ0wONwy+QrsVIxdya
         lzuKTGjqeRB4413ZNy1lD075ADiAWEV3I6xbYSGOYV5x50n0a0M+lWK8wPzaegEqECMm
         Iq7XnF+H8OIFc1vBb1p7NGa+KGze32+mY6sFDAZqE9VuBNY5F8djNaObyxWpz0QEC/su
         eiBmaoJlogDPJxohBezQ1q6dwtUlLFpwrwhbaJqXw+viqtAhqpsXk+HBptKCPZsldPH3
         KRXSuPbMHGnxy203u8oUN4xQ2RBWCZ82QddX67uAKgYpUTYoDc/Ork/IhGFLDtgIQtih
         ZxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWlfDfwEhzJRMztcOdO4HOxoQPJJtmbAxRg7kn86jqoVcmDr5s/erqmz3E3YosgkxQ8aSLEfs35la161pcucGa8@lists.infradead.org
X-Gm-Message-State: AOJu0YxXOpzOw9huyps0liv+SbSh9Z3HtxgIdUorwewFuzxJfwyHsfSu
	h+j4bmXf6KSKFftT+1jPHMc8SanGS151FlkSTkypLgnoiHgmTK0u3g56T6AcsPtSt4vMSq6pYZt
	fsw==
X-Google-Smtp-Source: AGHT+IHAvLyAn1VJG2+pLIU7Jm982X3rmXgnqbZGLYkM+N3EFPWYk9emuP+KfsGs4jFnJ/EzGlOPeeJ+Fg==
X-Received: from wmqo19.prod.google.com ([2002:a05:600c:4fd3:b0:47a:7586:4faa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3554:b0:46e:33b2:c8da
 with SMTP id 5b1f17b1804b1-47d7f09fac3mr25123345e9.32.1767691466959; Tue, 06
 Jan 2026 01:24:26 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:21 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-2-tabba@google.com>
Subject: [PATCH v3 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012428_708780_57D4D730 
X-CRM114-Status: GOOD (  11.31  )
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

KVM selftests map all guest code and data into the lower virtual address
range (0x0000...) managed by TTBR0_EL1. The upper range (0xFFFF...)
managed by TTBR1_EL1 is unused and uninitialized.

If a guest accesses the upper range, the MMU attempts a translation
table walk using uninitialized registers, leading to unpredictable
behavior.

Set `TCR_EL1.EPD1` to disable translation table walks for TTBR1_EL1,
ensuring that any access to the upper range generates an immediate
Translation Fault. Additionally, set `TCR_EL1.TBI1` (Top Byte Ignore) to
ensure that tagged pointers in the upper range also deterministically
trigger a Translation Fault via EPD1.

Define `TCR_EPD1_MASK`, `TCR_EPD1_SHIFT`, and `TCR_TBI1` in
`processor.h` to support this configuration. These are based on their
definitions in `arch/arm64/include/asm/pgtable-hwdef.h`.

Suggested-by: Will Deacon <will@kernel.org>
Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index ff928716574d..ac97a1c436fc 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -90,6 +90,9 @@
 #define TCR_TG0_64K		(UL(1) << TCR_TG0_SHIFT)
 #define TCR_TG0_16K		(UL(2) << TCR_TG0_SHIFT)
 
+#define TCR_EPD1_SHIFT		23
+#define TCR_EPD1_MASK		(UL(1) << TCR_EPD1_SHIFT)
+
 #define TCR_IPS_SHIFT		32
 #define TCR_IPS_MASK		(UL(7) << TCR_IPS_SHIFT)
 #define TCR_IPS_52_BITS	(UL(6) << TCR_IPS_SHIFT)
@@ -97,6 +100,7 @@
 #define TCR_IPS_40_BITS	(UL(2) << TCR_IPS_SHIFT)
 #define TCR_IPS_36_BITS	(UL(1) << TCR_IPS_SHIFT)
 
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_DS			(UL(1) << 59)
 
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index d46e4b13b92c..5b379da8cb90 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -384,6 +384,8 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	tcr_el1 |= TCR_IRGN0_WBWA | TCR_ORGN0_WBWA | TCR_SH0_INNER;
 	tcr_el1 |= TCR_T0SZ(vm->va_bits);
+	tcr_el1 |= TCR_TBI1;
+	tcr_el1 |= TCR_EPD1_MASK;
 	if (use_lpa2_pte_format(vm))
 		tcr_el1 |= TCR_DS;
 
-- 
2.52.0.351.gbe84eed79e-goog



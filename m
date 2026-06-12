Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B13CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bPxt/n97qTMkfypzesmceZlZb8m5faMbDtZZOrJQN8=; b=4NfkZeIGVq2dbNd7A9F0ryw8VO
	/HugTOQEkg0+YGfCVWqY5CD+YA7swxF5XQXzGxRlp0p9HT4RnkYioMWYpc/a+qf3K+mElTBxLcyUR
	0UFx4Vt/An78Qab67UOsDJnlfMHoS84G0h9hxaLUtFR0THdib5SxfJokKANrPbwmJiGqP5hTizjiS
	34NVqG/x8WH5m5kA6HvdxNjaHPTo/6DZGAdB+y9kn53/kZ9HCd2hb4Uu4INStcByrI2XZ7oDCDPED
	z21GcJJEZp1yPiNzBLoe4ecrNI5/5pFR6Hyo9N3RIbexdBtieg89LGJsCQj5N/eWZg8NYYu3GcT2b
	BaKwos7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Zq-0000000BTVh-0vIi;
	Fri, 12 Jun 2026 19:30:02 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZM-0000000BSb1-3dWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:34 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-486cc29e03bso2001371b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292571; x=1781897371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/bPxt/n97qTMkfypzesmceZlZb8m5faMbDtZZOrJQN8=;
        b=lISnY27ZCyKmAudp8Lvp4ijCFGTrCNhnsgOtuXmuFSvEi4IpsjEesXJTx2tyMUZHbo
         B+FJmNkjPdzGwiM5hOgH9ocK9EkE+5OC2qt2P1pk0ssYsIELrp0HNKxA/IF6hlX9SCmH
         gOd2+LE0lM8RERH8IbNxYoZ3yeJIwPfofDcv3bxKQT50YA7slde87Gn7e1YoMVDvwvRd
         xLU4/K5r0idbG00oPRp5FsnKIGqC9cdynm4uTRgpqM2JgbRPibL3ZJHpgD800bFnl5s0
         7KjTKh+u8uKTWLJ7F7nUgtvALsXIYCbrFTcGC+seOh+N4yYRyp27KEBzpKsO8HkN07AF
         a24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292571; x=1781897371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bPxt/n97qTMkfypzesmceZlZb8m5faMbDtZZOrJQN8=;
        b=Qz9lLADwrncHlFMeHkd77S0iGolKiCQ6acqn4wIZjzn7Av0fAaJ/8tcNoLHkI2NC1v
         kNoyH02deIRxvlUBHRLPEyS4kWMXOJyV7F6Z8gb7rWB7lsBwjutagwdmusdlazqQOxPV
         TxU8PvIh1lDDtYDYN5cS1Fqcum+ekTLeCHlwGDnl8bUL9DwYEKh3HfCQT08DR/wwGJX0
         R1C7wXtah3/jzXSNW3uuripQ5O9bB6AGu1Mt3LL25FuzNp0au251Gu/zRNzT/fYwR7wR
         7ZKeflFFyqj96H/i/N371YrlrPWhZrjAWasJw/WoQcJdC8tiyg/cK0zoi/9zzFJo5go1
         D5Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9XRW6hfvbUQ06OYFcpanWYVZn3F5cqnXIQqN+qEQPs65jclY962eUP2vHebLKxQ7SJ+uG2VPqIcLRXoqi87uJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0MF5Fcu00ZegKKVXAis3CYyg+6rH3U5D4OdlYnxSVcI9giYF
	evCifdn6Cav778bzm0jk/OuPk/ukFN8ZMzC9GVbrTJZ8ngKme5qciAd1k3fUUeTwEq0Er/Sr9MT
	fPAJ++rYCkzkUb9JKmlFy2WRrqA==
X-Received: from ilbdx1-n1.prod.google.com ([2002:a05:6e02:4201:10b0:4fa:1e84:4047])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1308:b0:482:4dbd:4fde with SMTP id 5614622812f47-48741a3b47dmr672091b6e.19.1781292571289;
 Fri, 12 Jun 2026 12:29:31 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:09 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-22-coltonlewis@google.com>
Subject: [PATCH 21/21] KVM: arm64: selftests: Relax testing for exceptions
 when partitioned
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
X-CRM114-CacheID: sfid-20260612_122932_938484_72DE5BCC 
X-CRM114-Status: GOOD (  16.48  )
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

Because the Partitioned PMU must lean heavily on underlying hardware
support, it can't guarantee an exception occurs when accessing an
invalid pmc index.

The ARM manual specifies that accessing PMEVCNTR<n>_EL0 where n is
greater than the number of counters on the system is constrained
unpredictable when FEAT_FGT is not implemented, and it is desired the
Partitioned PMU still work without FEAT_FGT.

Though KVM could enforce exceptions here since all PMU accesses
without FEAT_FGT are trapped, that creates further difficulties. For
one example, the manual also says that after writing a value to
PMSELR_EL0 greater than the number of counters on a system, direct
reads will return an unknown value, meaning KVM could not rely on the
hardware register to hold the correct value.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 9be6034335283..e8c3856df77b7 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -38,10 +38,14 @@ const char *pmu_impl_str[] = {
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
+};
+
+struct guest_context {
 	bool pmu_partitioned;
 };
 
 static struct vpmu_vm vpmu_vm;
+static struct guest_context guest_context;
 
 struct pmreg_sets {
 	u64 set_reg_id;
@@ -342,11 +346,16 @@ static void test_access_invalid_pmc_regs(struct pmc_accessor *acc, int pmc_idx)
 	/*
 	 * Reading/writing the event count/type registers should cause
 	 * an UNDEFINED exception.
+	 *
+	 * If the pmu is partitioned, we can't guarantee it because
+	 * hardware doesn't.
 	 */
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	if (!guest_context.pmu_partitioned) {
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	}
 	/*
 	 * The bit corresponding to the (unimplemented) counter in
 	 * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers should be RAZ.
@@ -459,7 +468,7 @@ static void create_vpmu_vm(void *guest_code, enum pmu_impl impl)
 		vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
 	if (!ret) {
 		vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &part_attr);
-		vpmu_vm.pmu_partitioned = partition;
+		guest_context.pmu_partitioned = partition;
 		pr_debug("Set PMU partitioning: %d\n", partition);
 	}
 
@@ -511,6 +520,7 @@ static void test_create_vpmu_vm_with_nr_counters(
 		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	sync_global_to_guest(vpmu_vm.vm, guest_context);
 }
 
 /*
-- 
2.54.0.1136.gdb2ca164c4-goog



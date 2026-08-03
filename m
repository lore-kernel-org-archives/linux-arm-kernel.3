Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D1EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dKMPkl7D6nRliBWUc2slY3eC0FUHsOIRlAVnvVpAh7Y=; b=f74sjwZY5LYYolP8mRu7SkRady
	Cpx9IX8DvqTw+xm5Z4W1yZzfN6l3U6GjzY3PWbYLtNc3bq0+qItHDOlKPvWUUmIgWd1LCSYWjOawN
	MuUKMbQJ3c+3X2LRzu0Ddc03CnzuZY1bZvthLxDDJrMbOH9nkxVZgWSbA2jkU/K/h4NSB3R/2My40
	BoBxtid8eV3jxqmhEcht06fMaVywpBnf1jRf3N8+BE4Fog+lw/hXVAwJNr17ELz6DLgVvCyDb8rMm
	I+VXZ+Bb6JI0nvTcqdhmKKYZ0zK8sxqlZzrB7D9MU+WZQsLv9/QOf8TINBhCX6soRoXLkXg75QZIY
	KtMCso+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwBF-00000000Bna-2kfw;
	Mon, 03 Aug 2026 17:10:25 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwBD-00000000Bms-0YgB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:10:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso5965324a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785777020; x=1786381820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKMPkl7D6nRliBWUc2slY3eC0FUHsOIRlAVnvVpAh7Y=;
        b=mOhUSJ68pGJZEt6n86skxeHAW6tc9Iv/JSAgcr8NDU8SDvMFS+pxj1Qr17hRxooYoL
         oxQ8JLETd8YCJc/U7sQV4SB4szoo3bT8QK+vRLCGa37vBGuq6iwOgTvSjCMjZgVnUXVc
         8HIt5JGAL7M13F3gdmGKK2WFKr74UHKlBxgD54H1IlhEJr4xjC2tBFWzkt1/K0bjzsUH
         weuD/tXcehnLZVKVgCcYtyI+qu52ijviCH6y1Rg0D7CD5pYh9rSltKU0WXr2AXKqpDI6
         2zn0sS0uGP07LQRt6u/lS67A6SN6ZJykTKdTDqSx9mUZCeoaLDRK9uIpn2dGkbVghM7V
         sJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777020; x=1786381820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKMPkl7D6nRliBWUc2slY3eC0FUHsOIRlAVnvVpAh7Y=;
        b=n1gqydNjDUYL+2lgthT6Y8p350Yp8GtrgAJC5i1Hohnfh/aqOB+PK82OvQIpgK3gwk
         KZ0/sImHAiNg9g7emcpxPBDAY5xJSMUdsXvIiEyNrJjz+qcJS7QPszUJcgqOCPC/5kbm
         qRAwjMZWdRNv+lMiM5Kgjr3hrw1xfF6uuFQKBQaHeDQrc54Qajme5skIDimuDk4Nan7L
         Ycjk8goDR/0xrQmRdDYF7vne+km1f5NDHUsVmo1PixDVbHkMR9p9tGGCUK0TMYXMC3fG
         zirgPk6h3auIU7TTLH2Jg9vfQ6AUSRSo7UleZQXWfxIbpVq4t25z+sqzwnrrzuSrjsQ6
         sJaQ==
X-Forwarded-Encrypted: i=1; AHgh+RptZM9L4GguvVhljDMUavu7sBYgnqpC0jlq2EPAs9sXeLVT+S/8McNykIoWG3LCnG/L4Oyvfj2vYYFOeO0SbxML@lists.infradead.org
X-Gm-Message-State: AOJu0YzEFH/bMNt9hn7JMaYOIU8Rc+cyf5G3WFCIefmNZzbnNexR0Yql
	MnIOmzQldQwoYfWV9+t+UueOAJC1Zjg6j3YtrlePrLcLX/RYsg+82qwk
X-Gm-Gg: AR+sD12+Iyo+tq2O3Lf+mOPRxYW/LMuUL6Yp1xS8xB8BOYlpT40TKADSjoLCyMxf8Cc
	6DFZ60Z5sicrDly8Fs1/b6xsGby7rOnwUu9zmzueTFI2Cv3C7rQTYsa5GLJCEdB/kr6gMAEQ3Ow
	79lp2F/OuyCarxAi+hkwqofvXJVLjCLWzvXGG2ghJYMA7RvBffBUZ9x1ZBg0KsmSNKso5DctRTz
	iSaONmk6mh2Ai5TJoSxWSWa78IBLORsm4F3az4YZZrnh0elFaRTJVxHhTRjHcML+JcfeZtHn70c
	q0ogTd7fxfgW0+bdRbw1N8mfq/DdOIqCOXgBPn3pejHIL65jt9TU01i0+N7qvpMIVDIMjNQ0Dq/
	eHByh/h5JKvdq444LH6Vz9nHWRIGuKhEydfVsg4JvxjzifePO7Qng4n0fCePB1oDXVTY3RGyVg9
	GTX1H+OfzMwudI6ytEbCQFJob6HhcO+EQ/ZriZkA9nibFWGXvByaC8H4D4p1Sn1+p4dEIQFBR9/
	L1iJnKFiiNdjw==
X-Received: by 2002:a05:6402:52cd:b0:6a0:a644:355e with SMTP id 4fb4d7f45d1cf-6a0a7c60f98mr9174702a12.2.1785777020112;
        Mon, 03 Aug 2026 10:10:20 -0700 (PDT)
Received: from hisam ([223.123.105.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c660f6fsm5767202a12.25.2026.08.03.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:10:18 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	shuah@kernel.org,
	aqibaf@amazon.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
Date: Mon,  3 Aug 2026 22:08:28 +0500
Message-ID: <20260803170825.925561-4-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_101023_250997_490FE83B 
X-CRM114-Status: GOOD (  14.20  )
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

KVM selftests use the non-standard ulong alias in several files. glibc
exposes the alias transitively through its headers, whereas musl does not,
causing musl builds to fail with ulong undeclared.

Use unsigned long directly instead of depending on a libc-specific typedef.
This also avoids adding a duplicate typedef to a shared tools header.

Reported-by: Aqib Faruqui <aqibaf@amazon.com>
Closes: https://lore.kernel.org/r/20250829142556.72577-10-aqibaf@amazon.com
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
Changes in v2:
- Replaced KVM selftest uses directly instead of adding a shared typedef.
- Dropped the tools/include/linux/types.h change.
- Added Reported-by and Closes tags.

Tested on x86_64 with:
- make -C tools/testing/selftests/kvm
- make -C tools/testing/selftests/kvm CC=musl-gcc

v1: https://lore.kernel.org/r/20260531144934.403888-3-hisamshar@gmail.com/

 .../testing/selftests/kvm/arm64/hypercalls.c  |  2 +-
 .../testing/selftests/kvm/memslot_perf_test.c |  2 +-
 tools/testing/selftests/kvm/steal_time.c      | 20 +++++++++----------
 tools/testing/selftests/kvm/x86/amx_test.c    |  2 +-
 tools/testing/selftests/kvm/x86/cpuid_test.c  |  2 +-
 .../testing/selftests/kvm/x86/hyperv_clock.c  |  2 +-
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  4 ++--
 .../selftests/kvm/x86/hyperv_svm_test.c       |  2 +-
 .../selftests/kvm/x86/set_boot_cpu_id.c       |  2 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  4 ++--
 .../testing/selftests/kvm/x86/tsc_msrs_test.c |  2 +-
 .../kvm/x86/vmx_nested_la57_state_test.c      |  2 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |  4 ++--
 13 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 5d96cdf382c4..90d22b2cb6cc 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -162,7 +162,7 @@ struct st_time {
 
 static void steal_time_init(struct kvm_vcpu *vcpu)
 {
-	u64 st_ipa = (ulong)ST_GPA_BASE;
+	u64 st_ipa = (unsigned long)ST_GPA_BASE;
 	unsigned int gpages;
 
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE);
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index 4d9ad6104a6e..8f26b1cee0cd 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -152,7 +152,7 @@ static void *vcpu_worker(void *__data)
 		case UCALL_SYNC:
 			TEST_ASSERT(uc.args[1] == 0,
 				"Unexpected sync ucall, got %lx",
-				(ulong)uc.args[1]);
+				(unsigned long)uc.args[1]);
 			sem_post(&vcpu_ready);
 			continue;
 		case UCALL_NONE:
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 19a97d6a3607..b8e78b430669 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -73,12 +73,12 @@ static void steal_time_init(struct kvm_vcpu *vcpu, u32 i)
 	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
 	sync_global_to_guest(vcpu->vm, st_gva[i]);
 
-	vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME, (ulong)st_gva[i] | KVM_MSR_ENABLED);
+	vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME, (unsigned long)st_gva[i] | KVM_MSR_ENABLED);
 }
 
 static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 {
-	struct kvm_steal_time *st = addr_gva2hva(vm, (ulong)st_gva[vcpu_idx]);
+	struct kvm_steal_time *st = addr_gva2hva(vm, (unsigned long)st_gva[vcpu_idx]);
 
 	ksft_print_msg("VCPU%d:\n", vcpu_idx);
 	ksft_print_msg("    steal:     %lld\n", st->steal);
@@ -102,7 +102,7 @@ static void check_steal_time_uapi(void)
 	vm = vm_create_with_one_vcpu(&vcpu, NULL);
 
 	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
-			    (ulong)ST_GPA_BASE | KVM_STEAL_RESERVED_MASK);
+			    (unsigned long)ST_GPA_BASE | KVM_STEAL_RESERVED_MASK);
 	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
 
 	kvm_vm_free(vm);
@@ -151,7 +151,7 @@ static void guest_code(int cpu)
 
 	status = smccc(PV_TIME_ST, 0);
 	GUEST_ASSERT_NE(status, -1);
-	GUEST_ASSERT_EQ(status, (ulong)st_gva[cpu]);
+	GUEST_ASSERT_EQ(status, (unsigned long)st_gva[cpu]);
 
 	st = (struct st_time *)status;
 	GUEST_SYNC(0);
@@ -190,13 +190,13 @@ static void steal_time_init(struct kvm_vcpu *vcpu, u32 i)
 	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
 	sync_global_to_guest(vm, st_gva[i]);
 
-	st_ipa = (ulong)st_gva[i];
+	st_ipa = (unsigned long)st_gva[i];
 	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
 }
 
 static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 {
-	struct st_time *st = addr_gva2hva(vm, (ulong)st_gva[vcpu_idx]);
+	struct st_time *st = addr_gva2hva(vm, (unsigned long)st_gva[vcpu_idx]);
 
 	ksft_print_msg("VCPU%d:\n", vcpu_idx);
 	ksft_print_msg("    rev:     %d\n", st->rev);
@@ -223,11 +223,11 @@ static void check_steal_time_uapi(void)
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, 1, 0);
 	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
 
-	st_ipa = (ulong)ST_GPA_BASE | 1;
+	st_ipa = (unsigned long)ST_GPA_BASE | 1;
 	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
 	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
 
-	st_ipa = (ulong)ST_GPA_BASE;
+	st_ipa = (unsigned long)ST_GPA_BASE;
 	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
 
 	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
@@ -318,7 +318,7 @@ static void steal_time_init(struct kvm_vcpu *vcpu, u32 i)
 
 static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 {
-	struct sta_struct *st = addr_gva2hva(vm, (ulong)st_gva[vcpu_idx]);
+	struct sta_struct *st = addr_gva2hva(vm, (unsigned long)st_gva[vcpu_idx]);
 	int i;
 
 	pr_info("VCPU%d:\n", vcpu_idx);
@@ -455,7 +455,7 @@ static void steal_time_init(struct kvm_vcpu *vcpu, u32 i)
 
 static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 {
-	struct kvm_steal_time *st = addr_gva2hva(vm, (ulong)st_gva[vcpu_idx]);
+	struct kvm_steal_time *st = addr_gva2hva(vm, (unsigned long)st_gva[vcpu_idx]);
 
 	ksft_print_msg("VCPU%d:\n", vcpu_idx);
 	ksft_print_msg("    steal:     %lld\n", st->steal);
diff --git a/tools/testing/selftests/kvm/x86/amx_test.c b/tools/testing/selftests/kvm/x86/amx_test.c
index 4e63da2b1889..66b6e442c41c 100644
--- a/tools/testing/selftests/kvm/x86/amx_test.c
+++ b/tools/testing/selftests/kvm/x86/amx_test.c
@@ -325,7 +325,7 @@ int main(int argc, char *argv[])
 				vcpu_regs_get(vcpu, &regs2);
 				TEST_ASSERT(!memcmp(&regs1, &regs2, sizeof(regs2)),
 					    "Unexpected register values after vcpu_load_state; rdi: %lx rsi: %lx",
-					    (ulong) regs2.rdi, (ulong) regs2.rsi);
+					    (unsigned long)regs2.rdi, (unsigned long)regs2.rsi);
 			}
 			break;
 		case UCALL_DONE:
diff --git a/tools/testing/selftests/kvm/x86/cpuid_test.c b/tools/testing/selftests/kvm/x86/cpuid_test.c
index ef0ddd240887..dcd99a0501ee 100644
--- a/tools/testing/selftests/kvm/x86/cpuid_test.c
+++ b/tools/testing/selftests/kvm/x86/cpuid_test.c
@@ -128,7 +128,7 @@ static void run_vcpu(struct kvm_vcpu *vcpu, int stage)
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage + 1,
 			    "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage + 1, (ulong)uc.args[1]);
+			    stage + 1, (unsigned long)uc.args[1]);
 		return;
 	case UCALL_DONE:
 		return;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_clock.c b/tools/testing/selftests/kvm/x86/hyperv_clock.c
index c083cea546dc..3dc9a9c2aa54 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_clock.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_clock.c
@@ -248,7 +248,7 @@ int main(void)
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage,
 			    "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage, (ulong)uc.args[1]);
+			    stage, (unsigned long)uc.args[1]);
 
 		/* Reset kvmclock triggering TSC page update */
 		if (stage == 7 || stage == 8 || stage == 10) {
diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index 1bda2cd3f739..6bca5afccef0 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -221,7 +221,7 @@ static struct kvm_vcpu *save_restore_vm(struct kvm_vm *vm,
 	vcpu_regs_get(vcpu, &regs2);
 	TEST_ASSERT(!memcmp(&regs1, &regs2, sizeof(regs2)),
 		    "Unexpected register values after vcpu_load_state; rdi: %lx rsi: %lx",
-		    (ulong) regs2.rdi, (ulong) regs2.rsi);
+		    (unsigned long)regs2.rdi, (unsigned long)regs2.rsi);
 	return vcpu;
 }
 
@@ -277,7 +277,7 @@ int main(int argc, char *argv[])
 		/* UCALL_SYNC is handled here.  */
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage, "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage, (ulong)uc.args[1]);
+			    stage, (unsigned long)uc.args[1]);
 
 		vcpu = save_restore_vm(vm, vcpu);
 
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index 1f74b0fa9b83..3a3dc31072e8 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -186,7 +186,7 @@ int main(int argc, char *argv[])
 		/* UCALL_SYNC is handled here.  */
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage, "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage, (ulong)uc.args[1]);
+			    stage, (unsigned long)uc.args[1]);
 
 	}
 
diff --git a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
index 8e3898646c69..909cd9e83fda 100644
--- a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
+++ b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
@@ -69,7 +69,7 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 			TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 					uc.args[1] == stage + 1,
 					"Stage %d: Unexpected register values vmexit, got %lx",
-					stage + 1, (ulong)uc.args[1]);
+					stage + 1, (unsigned long)uc.args[1]);
 			test_set_bsp_busy(vcpu, "while running vm");
 			break;
 		case UCALL_DONE:
diff --git a/tools/testing/selftests/kvm/x86/state_test.c b/tools/testing/selftests/kvm/x86/state_test.c
index 4a1056a6cb8d..e6f521a6e737 100644
--- a/tools/testing/selftests/kvm/x86/state_test.c
+++ b/tools/testing/selftests/kvm/x86/state_test.c
@@ -296,7 +296,7 @@ int main(int argc, char *argv[])
 		/* UCALL_SYNC is handled here.  */
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage, "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage, (ulong)uc.args[1]);
+			    stage, (unsigned long)uc.args[1]);
 
 		state = vcpu_save_state(vcpu);
 		memset(&regs1, 0, sizeof(regs1));
@@ -343,7 +343,7 @@ int main(int argc, char *argv[])
 		vcpu_regs_get(vcpu, &regs2);
 		TEST_ASSERT(!memcmp(&regs1, &regs2, sizeof(regs2)),
 			    "Unexpected register values after vcpu_load_state; rdi: %lx rsi: %lx",
-			    (ulong) regs2.rdi, (ulong) regs2.rsi);
+			    (unsigned long)regs2.rdi, (unsigned long)regs2.rsi);
 	}
 
 done:
diff --git a/tools/testing/selftests/kvm/x86/tsc_msrs_test.c b/tools/testing/selftests/kvm/x86/tsc_msrs_test.c
index 91583969a14f..55779773614b 100644
--- a/tools/testing/selftests/kvm/x86/tsc_msrs_test.c
+++ b/tools/testing/selftests/kvm/x86/tsc_msrs_test.c
@@ -78,7 +78,7 @@ static void run_vcpu(struct kvm_vcpu *vcpu, int stage)
 		else
 			ksft_test_result_fail(
 				"stage %d: Unexpected register values vmexit, got %lx",
-				stage + 1, (ulong)uc.args[1]);
+				stage + 1, (unsigned long)uc.args[1]);
 		return;
 	case UCALL_DONE:
 		ksft_test_result_pass("stage %d passed\n", stage + 1);
diff --git a/tools/testing/selftests/kvm/x86/vmx_nested_la57_state_test.c b/tools/testing/selftests/kvm/x86/vmx_nested_la57_state_test.c
index 75073efa926d..448721b54181 100644
--- a/tools/testing/selftests/kvm/x86/vmx_nested_la57_state_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_nested_la57_state_test.c
@@ -109,7 +109,7 @@ int main(int argc, char *argv[])
 		}
 
 		TEST_ASSERT(uc.args[1] == stage,
-			    "Expected stage %d, got stage %lu", stage, (ulong)uc.args[1]);
+			    "Expected stage %d, got stage %lu", stage, (unsigned long)uc.args[1]);
 		if (stage == 1) {
 			pr_info("L2 is active; performing save/restore.\n");
 			state = vcpu_save_state(vcpu);
diff --git a/tools/testing/selftests/kvm/x86/vmx_preemption_timer_test.c b/tools/testing/selftests/kvm/x86/vmx_preemption_timer_test.c
index eb8021c33cd4..72fbf1b70e9f 100644
--- a/tools/testing/selftests/kvm/x86/vmx_preemption_timer_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_preemption_timer_test.c
@@ -193,7 +193,7 @@ int main(int argc, char *argv[])
 		/* UCALL_SYNC is handled here.  */
 		TEST_ASSERT(!strcmp((const char *)uc.args[0], "hello") &&
 			    uc.args[1] == stage, "Stage %d: Unexpected register values vmexit, got %lx",
-			    stage, (ulong)uc.args[1]);
+			    stage, (unsigned long)uc.args[1]);
 		/*
 		 * If this stage 2 then we should verify the vmx pt expiry
 		 * is as expected.
@@ -234,7 +234,7 @@ int main(int argc, char *argv[])
 		vcpu_regs_get(vcpu, &regs2);
 		TEST_ASSERT(!memcmp(&regs1, &regs2, sizeof(regs2)),
 			    "Unexpected register values after vcpu_load_state; rdi: %lx rsi: %lx",
-			    (ulong) regs2.rdi, (ulong) regs2.rsi);
+			    (unsigned long)regs2.rdi, (unsigned long)regs2.rsi);
 	}
 
 done:
-- 
2.51.0


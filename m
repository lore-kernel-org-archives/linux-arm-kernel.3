Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1601C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoIoCgmeh5c18xI9Db8okKC8/2FYeOrfnJC4MrZ1yUY=; b=KPcR/0S83fKDBrUenzS8sY56Kb
	wpJN6P4YqkGPtQxgTY0rGY+vq/yArrp0+7/MYmi+tUoA4r148JtXjB7lpW/NCdzeBF9OWY5QSh27f
	raNJDZoF2KpiFhaFP5YxM6X3gdBB5XnMXayjL/h7JDXwoEoP+fHzVlc+GjqrWgYIrNZiwxCEb0VF3
	+Rzl6XoXqUepT3zniziV5PSZjuF1OIKSXQPFbHIB1eHdho8HvQZppE0mzPXwrNCqt8q7pmAMQ+0ih
	fc5J5YeUE6ikht2sw+r+6c4abVHf5NT0sQfzG2AjcKdsSoHO4VT0yjw07P6WTs1R9JwVRVkbmMT4X
	yNl6v7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDC-0000000BuIG-14pm;
	Fri, 26 Jun 2026 21:35:46 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdED8-0000000BuFi-0Yht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c9960cf96cso3831035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509741; x=1783114541; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eoIoCgmeh5c18xI9Db8okKC8/2FYeOrfnJC4MrZ1yUY=;
        b=IV4m7letWpION1vsr6WHmr125u7G61mQb+jqAk3l5F4PFREop/lT0ZAV8hD1/EKoVR
         WbC7uqPVwxu7rcRY4ww34pGe5F259X3A8e66J0d7MEKiRqc6Q+P2TnHXyTDWIhK4cowC
         CSfqOluOw96HnBE12ncbPqI8/UoLxr1ttmg/9zam6dtJyd8TWjA+FpKzzCY2UFqDEQFE
         ZFkJbDAGHtiLDObzCc8bM9xxRCA0i2+jdCIob5aa1aKph0vpbdvmI3FuWrO5PNSWTyb7
         DSfBkG/dL34pIMJHbbULMBoCwP6MnJP1rZE3B9F7i16bbBcqIPMveZepeGS2zqd1xO4e
         Pipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509741; x=1783114541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoIoCgmeh5c18xI9Db8okKC8/2FYeOrfnJC4MrZ1yUY=;
        b=EKeETHZ7vFAa2eQ11xnP308e6nKKgxzc2sX2vgoRQmca7VXKRSxrrjS0zXD6Mf8z8T
         loTsy9+bCQdJe8W88NkrxBpSWeEU4xjxdLgZ1rWbjGNXBZ4UwkXWku6fHEeR/TPOpOKE
         f/wKwGrqvH3rGXg8hSKa89w2hGY+Ilr4OEvaBbHGMj3f5/3x6+KY8miR8WEGd+eaLOmB
         7b/JQ0k3+vdHzDBqtcXNtaKavvBKXqNkPKLvqC6gjNrrVPTpjuNLEZQR/Z13Vea/oNjX
         +o4FuG+7qPUfD4HRxGN1GA06l4OLDGykOYXx2m0pLCGhcZFLKEy6UbgSAYrRxBYUZl6f
         fqoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLlkOwVtkVtcxIfpfhTWq/AUOtIL7yU7voAOIGNLZMEKIjh104POYpWvMLma827kK/UH83AtpeV/6KH29/5IWJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6pxvVyvMkBV/Q8nVPx3xyTHAGy8MOXPjG053p6ir2yr1wV9oN
	VRw4iwFkLwlsJYXrj1isOxpie3EbJVCjQ2Lb8ODhGNRTY1JgWQXHx2NE6ZfU4KPz6pI0IHYjF/P
	cLO9Bhg==
X-Received: from plhz4.prod.google.com ([2002:a17:902:d9c4:b0:2ba:2863:4c3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fda5:b0:2c9:b09c:5a1
 with SMTP id d9443c01a7336-2c9b09c06e6mr425215ad.46.1782509740407; Fri, 26
 Jun 2026 14:35:40 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:16 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-4-seanjc@google.com>
Subject: [PATCH v8 03/20] KVM: selftests: Rename guest_rng to kvm_rng
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
X-CRM114-CacheID: sfid-20260626_143542_184357_D05FE2B9 
X-CRM114-Status: GOOD (  18.01  )
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

Rename functions prefixed with 'guest_random_' to 'kvm_random_' and the
global random state variable 'guest_rng' to 'kvm_rng', as the pRNG isn't
strictly limited to guest code.  This will allow using the pRNG in host
code without creating confusing/misleading function calls.

No functional changes are intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c       |  4 ++--
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../testing/selftests/kvm/include/test_util.h | 22 +++++++++----------
 .../selftests/kvm/include/x86/kvm_util_arch.h |  4 ++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 20 ++++++++---------
 tools/testing/selftests/kvm/lib/memstress.c   |  8 +++----
 tools/testing/selftests/kvm/lib/test_util.c   |  6 ++---
 .../testing/selftests/kvm/x86/sev_dbg_test.c  |  2 +-
 8 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index ef779fa91827..7c5abe1ae9e0 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -311,7 +311,7 @@ int main(int argc, char *argv[])
 	int opt;
 
 	/* Override the seed to be deterministic by default. */
-	guest_random_seed = 1;
+	kvm_random_seed = 1;
 
 	dirty_log_manual_caps =
 		kvm_check_cap(KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
@@ -357,7 +357,7 @@ int main(int argc, char *argv[])
 			p.phys_offset = strtoull(optarg, NULL, 0);
 			break;
 		case 'r':
-			guest_random_seed = atoi_positive("Random seed", optarg);
+			kvm_random_seed = atoi_positive("Random seed", optarg);
 			break;
 		case 's':
 			p.backing_src = parse_backing_src_type(optarg);
diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 087e94a8a81a..e8419d7da1ea 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -121,7 +121,7 @@ static void guest_code(void)
 	while (true) {
 		while (!READ_ONCE(vcpu_stop)) {
 			addr = guest_test_virt_mem;
-			addr += (guest_random_u64(&guest_rng) % guest_num_pages)
+			addr += (kvm_random_u64(&kvm_rng) % guest_num_pages)
 				* guest_page_size;
 			addr = align_down(addr, host_page_size);
 
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index a56271c237ae..44c0104d60ac 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -108,30 +108,30 @@ struct timespec timespec_sub(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_elapsed(struct timespec start);
 struct timespec timespec_div(struct timespec ts, int divisor);
 
-struct guest_random_state {
+struct kvm_random_state {
 	u32 seed;
 };
 
-extern u32 guest_random_seed;
-extern struct guest_random_state guest_rng;
+extern u32 kvm_random_seed;
+extern struct kvm_random_state kvm_rng;
 
-struct guest_random_state new_guest_random_state(u32 seed);
-u32 guest_random_u32(struct guest_random_state *state);
+struct kvm_random_state new_kvm_random_state(u32 seed);
+u32 kvm_random_u32(struct kvm_random_state *state);
 
-static inline bool __guest_random_bool(struct guest_random_state *state,
+static inline bool __kvm_random_bool(struct kvm_random_state *state,
 				       u8 percent)
 {
-	return (guest_random_u32(state) % 100) < percent;
+	return (kvm_random_u32(state) % 100) < percent;
 }
 
-static inline bool guest_random_bool(struct guest_random_state *state)
+static inline bool kvm_random_bool(struct kvm_random_state *state)
 {
-	return __guest_random_bool(state, 50);
+	return __kvm_random_bool(state, 50);
 }
 
-static inline u64 guest_random_u64(struct guest_random_state *state)
+static inline u64 kvm_random_u64(struct kvm_random_state *state)
 {
-	return ((u64)guest_random_u32(state) << 32) | guest_random_u32(state);
+	return ((u64)kvm_random_u32(state) << 32) | kvm_random_u32(state);
 }
 
 enum vm_mem_backing_src_type {
diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index c33ab6e04171..6904dbda79f9 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -55,9 +55,9 @@ static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
 do {											\
 	const typeof(mem) val = (__val);						\
 											\
-	if (!is_forced_emulation_enabled || guest_random_bool(&guest_rng)) {		\
+	if (!is_forced_emulation_enabled || kvm_random_bool(&kvm_rng)) {		\
 		(mem) = val;								\
-	} else if (guest_random_bool(&guest_rng)) {					\
+	} else if (kvm_random_bool(&kvm_rng)) {					\
 		__asm__ __volatile__(KVM_FEP "mov %1, %0"				\
 				     : "+m" (mem)					\
 				     : "r" (val) : "memory");				\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 195f3fdae1e3..875030c22d07 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -20,9 +20,9 @@
 
 #define KVM_UTIL_MIN_PFN	2
 
-u32 guest_random_seed;
-struct guest_random_state guest_rng;
-static u32 last_guest_seed;
+u32 kvm_random_seed;
+struct kvm_random_state kvm_rng;
+static u32 last_kvm_seed;
 
 static size_t vcpu_mmap_sz(void);
 
@@ -515,12 +515,12 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	slot0 = memslot2region(vm, 0);
 	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
 
-	if (guest_random_seed != last_guest_seed) {
-		pr_info("Random seed: 0x%x\n", guest_random_seed);
-		last_guest_seed = guest_random_seed;
+	if (kvm_random_seed != last_kvm_seed) {
+		pr_info("Random seed: 0x%x\n", kvm_random_seed);
+		last_kvm_seed = kvm_random_seed;
 	}
-	guest_rng = new_guest_random_state(guest_random_seed);
-	sync_global_to_guest(vm, guest_rng);
+	kvm_rng = new_kvm_random_state(kvm_random_seed);
+	sync_global_to_guest(vm, kvm_rng);
 
 	kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
 
@@ -2279,8 +2279,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	sigaction(SIGILL, &sig_sa, NULL);
 	sigaction(SIGFPE, &sig_sa, NULL);
 
-	guest_random_seed = last_guest_seed = random();
-	pr_info("Random seed: 0x%x\n", guest_random_seed);
+	kvm_random_seed = last_kvm_seed = random();
+	pr_info("Random seed: 0x%x\n", kvm_random_seed);
 
 	kvm_selftest_arch_init();
 }
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index 6dcd15910a06..3599b75d97c9 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -48,14 +48,14 @@ void memstress_guest_code(u32 vcpu_idx)
 {
 	struct memstress_args *args = &memstress_args;
 	struct memstress_vcpu_args *vcpu_args = &args->vcpu_args[vcpu_idx];
-	struct guest_random_state rand_state;
+	struct kvm_random_state rand_state;
 	gva_t gva;
 	u64 pages;
 	u64 addr;
 	u64 page;
 	int i;
 
-	rand_state = new_guest_random_state(guest_random_seed + vcpu_idx);
+	rand_state = new_kvm_random_state(kvm_random_seed + vcpu_idx);
 
 	gva = vcpu_args->gva;
 	pages = vcpu_args->pages;
@@ -69,13 +69,13 @@ void memstress_guest_code(u32 vcpu_idx)
 
 		for (i = 0; i < pages; i++) {
 			if (args->random_access)
-				page = guest_random_u32(&rand_state) % pages;
+				page = kvm_random_u32(&rand_state) % pages;
 			else
 				page = i;
 
 			addr = gva + (page * args->guest_page_size);
 
-			if (__guest_random_bool(&rand_state, args->write_percent))
+			if (__kvm_random_bool(&rand_state, args->write_percent))
 				*(u64 *)addr = 0x0123456789ABCDEF;
 			else
 				READ_ONCE(*(u64 *)addr);
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index bab1bd2b775b..e98ca7ef439c 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -30,13 +30,13 @@ void __attribute__((used)) expect_sigbus_handler(int signum)
  * Park-Miller LCG using standard constants.
  */
 
-struct guest_random_state new_guest_random_state(u32 seed)
+struct kvm_random_state new_kvm_random_state(u32 seed)
 {
-	struct guest_random_state s = {.seed = seed};
+	struct kvm_random_state s = {.seed = seed};
 	return s;
 }
 
-u32 guest_random_u32(struct guest_random_state *state)
+u32 kvm_random_u32(struct kvm_random_state *state)
 {
 	state->seed = (u64)state->seed * 48271 % ((u32)(1 << 31) - 1);
 	return state->seed;
diff --git a/tools/testing/selftests/kvm/x86/sev_dbg_test.c b/tools/testing/selftests/kvm/x86/sev_dbg_test.c
index a9d8e4c059f9..eaa8201b937d 100644
--- a/tools/testing/selftests/kvm/x86/sev_dbg_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_dbg_test.c
@@ -34,7 +34,7 @@ static void validate_buffers(void)
 
 static void ____test_sev_dbg(struct kvm_vm *vm, int i, int j, int nr_bytes)
 {
-	u8 pattern = guest_random_u32(&guest_rng);
+	u8 pattern = kvm_random_u32(&kvm_rng);
 
 	if (i + nr_bytes > BUFFER_SIZE || j + nr_bytes > BUFFER_SIZE)
 		return;
-- 
2.55.0.rc0.799.gd6f94ed593-goog



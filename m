Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A78C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zdLl1CStt/w3jatHVQVxNNngXmh7u7s/kl0WhZ6jI6s=; b=EyUjpOLCtxMI3G
	5x9zM9/4Jl7JCk0JpMrpXa7o1T8Eb6O/bRwUZHXz/F8tZiAOx6KDlQWZCEgH1zIDgpYUHCEmvNTc1
	8dB3aoFeOWKj0vv8BrBNIsS2MOKUdn0P4DW8+wh0obr3BpOayeyY5xuS1xSGFscOpV1+KnwvAs7TV
	J5xxWzL3KkKY+VyLGhMjkqtAfn8A5fQRGsK0mHQe9MPwEqh0wB/Bucr40fpYFCn6q97kBYrTRL+hY
	YhMRv46L4TNn0s4jb81we/lbsFDiLZ4O/mC4xswq4z8Jsle9c/M8S21p8NwzbWDHbcU1UwQnfESma
	73qZpEz9GYuk25rD3R1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aK7-00000001VkJ-0AJh;
	Mon, 21 Sep 2026 09:28:33 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aK3-00000001Vhv-3Wke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zdLl1CStt/w3jatHVQVxNNngXmh7u7s/kl0WhZ6jI6s=;
	b=Px9FDAq9aHUPNZAcGIHD3M2+04zjMbPX2xcpooeX0uzL9Z9oiwpyOyQIyxi4AE
	w8zogl/TyayWrO2YvfaIrwCkntVNDA9chgzvw+UhJtXg3bOFUxIHwVlh0zFukwgI
	YoIuFMUs2G5/2kaVguiF9+1hnESu/+owNS73oE5Bgkhzc=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXRr2V+LBqZlMwAg--.3777S2;
	Mon, 21 Sep 2026 17:27:50 +0800 (CST)
Date: Mon, 21 Sep 2026 17:27:47 +0800
From: Hao Zhang <hao_zhang_kdev@163.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: selftests: Test arm64 stolen time after failed
 updates
Message-ID: <arD4k4RqkTetKtvi@192.168.1.215>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arD24ru13owcE1Ms@192.168.1.215>
X-CM-TRANSID: PSgvCgDXRr2V+LBqZlMwAg--.3777S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXryDtr43JryktF13uw43trb_yoWrGFy8pa
	92kF1jgr4UK3ZFkr1Syr1DZFs8Gw4kJr42qr97u34rArs8KFsxtrs7KFy0qF1xArZ3XFn3
	ZFWrKr9FgrWDXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUjjgUUUUU=
X-Originating-IP: [240e:380:920:8000:415e:fb59:2223:6c2e]
X-CM-SenderInfo: pkdrs65kdqwshngh4qqrwthudrp/xtbC3hYqHWqw+JZDYgAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_022828_236352_22B00766 
X-CRM114-Status: GOOD (  16.96  )
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

From: Hao Zhang <zhanghao1@kylinos.cn>

Use mprotect() to keep the stolen-time page readable while removing
write access.  This allows kvm_get_guest() to succeed and forces the
subsequent kvm_put_guest() to fail.

Accumulate vCPU run delay, trigger the failed update, restore write
access, and run the vCPU again.  Verify that the successful retry
includes the delay that could not be reported by the failed update.

Without the fix, KVM advances last_steal on the failed write and the
test observes that the accumulated delay is lost.

Signed-off-by: Hao Zhang <zhanghao1@kylinos.cn>
---
 tools/testing/selftests/kvm/steal_time.c | 58 +++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index bc3c62b72c58..fbdd55fa5ab6 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -8,6 +8,8 @@
 #include <time.h>
 #include <sched.h>
 #include <pthread.h>
+#include <sys/mman.h>
+#include <unistd.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
 #ifdef __riscv
@@ -162,6 +164,15 @@ static void guest_code(int cpu)
 
 	check_status(st);
 	WRITE_ONCE(guest_stolen_time[cpu], st->st_time);
+	if (!cpu) {
+		/*
+		 * Let userspace trigger a failed stolen-time update, then retry
+		 * the update after restoring write access.
+		 */
+		GUEST_SYNC(2);
+		GUEST_SYNC(3);
+		WRITE_ONCE(guest_stolen_time[cpu], st->st_time);
+	}
 	GUEST_DONE();
 }
 
@@ -469,9 +480,10 @@ static void check_steal_time_uapi(void)
 static void *do_steal_time(void *arg)
 {
 	struct timespec ts, stop;
+	unsigned long duration = arg ? *(unsigned long *)arg : MIN_RUN_DELAY_NS;
 
 	clock_gettime(CLOCK_MONOTONIC, &ts);
-	stop = timespec_add_ns(ts, MIN_RUN_DELAY_NS);
+	stop = timespec_add_ns(ts, duration);
 
 	while (1) {
 		clock_gettime(CLOCK_MONOTONIC, &ts);
@@ -500,6 +512,45 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 	}
 }
 
+#ifdef __aarch64__
+static void test_failed_stolen_time_update(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vm *vm = vcpu->vm;
+	struct st_time *st = addr_gva2hva(vm, ST_GPA_BASE);
+	unsigned long duration = 100 * 1000 * 1000UL;
+	u64 stolen_time = st->st_time;
+	long run_delay;
+	pthread_t thread;
+
+	/*
+	 * Keep the page readable so that kvm_get_guest() succeeds, but make
+	 * kvm_put_guest() fail when KVM attempts to update stolen time.
+	 */
+	TEST_ASSERT(!mprotect(st, getpagesize(), PROT_READ),
+		    "Failed to make stolen time page read-only");
+
+	run_delay = get_run_delay();
+	kvm_pthread_create(&thread, NULL, do_steal_time, &duration);
+	do
+		sched_yield();
+	while (get_run_delay() - run_delay < duration / 5);
+	kvm_pthread_join(thread, NULL);
+	run_delay = get_run_delay() - run_delay;
+
+	/* The update fails, but the guest must still be able to run. */
+	run_vcpu(vcpu);
+	TEST_ASSERT(st->st_time == stolen_time,
+		    "Stolen time changed on a read-only page");
+
+	TEST_ASSERT(!mprotect(st, getpagesize(), PROT_READ | PROT_WRITE),
+		    "Failed to restore stolen time page write access");
+	run_vcpu(vcpu);
+	TEST_ASSERT(st->st_time - stolen_time >= run_delay,
+		    "Lost stolen time after a failed update: expected >= %ld, got %lu",
+		    run_delay, (unsigned long)(st->st_time - stolen_time));
+}
+#endif
+
 int main(int ac, char **av)
 {
 	struct kvm_vcpu *vcpus[NR_VCPUS];
@@ -569,6 +620,11 @@ int main(int ac, char **av)
 			    "Expected stolen time >= %ld, got %ld",
 			    run_delay, stolen_time);
 
+#ifdef __aarch64__
+		if (!i)
+			test_failed_stolen_time_update(vcpus[i]);
+#endif
+
 		if (verbose) {
 			ksft_print_msg("VCPU%d: total-stolen-time=%ld test-stolen-time=%ld%s\n",
 				       i, guest_stolen_time[i], stolen_time,
-- 
2.15.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9656CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvbqHcICkknYa23vS53IIzBlXB8gIPFaVx5czPkQzuM=; b=nl/aHr7SXBcEARjSqGF+fbIGJ6
	m6K+kEAFA9Yaa+0x/dhkZXPQ71pn+uv9wHyYfs1PpIKANjd8SdOE9Sudqih+yGiD2JLG4fhY6EvdE
	E05c+J3K48CiQUgu0B6y4hAP6HAOKpwnCcfeg+o6en6X2F3JPZ9UMD/PAw5IPYxuZKfDcE+tSAdfv
	B7vyc6gSCxqEmeilh/4Tzrq5nzSrbC6SYNEcB0g2XKq/TuL14ovrdIRx4HBIBL8BqOJnzVidrwqlT
	o4Do6dfInejEiGxJndGEFffevvJ5ELNyKmoD/rkKNVRWRSamcvQFDElltJS+ljI84wk0OnKcFATKN
	faScUCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzr-0000000ClL2-1gmz;
	Tue, 01 Sep 2026 17:10:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzq-0000000ClJg-0uuz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:10:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00D5C43870;
	Tue,  1 Sep 2026 17:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68BC1F00ACA;
	Tue,  1 Sep 2026 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282605;
	bh=hvbqHcICkknYa23vS53IIzBlXB8gIPFaVx5czPkQzuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RDyWF4015QhkHk49lqGVk76m7TKYPTRJ2wknd5RLtp7RkRqsYQSCWJ/3cjyL3a5Of
	 dU8zweNQ5tq6TTGwO/afHVMC1c7Na6tRbE+TFSbLJ7h6gT7x1EWp+7jX3EUn1i6FYB
	 qR6VKwOLNe/ppToLt2mGe8oN5D2lpNnCqSu4UjqvLI082eKUAuoEDoyFt5G298cLXa
	 UrdrMi6d/uzdzKNF96MwA3KjVZzhjYBA4oUSGKndcqIW4j660NgNlMBYsZVdWKvSXs
	 +77G49CNEvnkabh5LwdmPC1WuUwk79ykLx/QuACcXWNd2lZoi4hrE17RCdRRsKM8aP
	 SPmN0NsCuQIHg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:51 +0100
Subject: [PATCH 11/11] kselftest/arm64: Run KVM guests from fp-stress
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-11-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8727; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uBEt48fkdIrhDTjaKvMKXF0+9Hsw4hMyzSvrjNvM2hk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbN4akSMGwELlkKeqlfq3eTOnGxRaNSEIYGN
 hSL7J4l9+2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGzQAKCRAk1otyXVSH
 0ExeB/9MfI9CctAFe7/OeJpYmCe8K+Tmqf3Zq+RXkJzgAGKleoXhkP6JmbY/Y6Kc7q63TJnLzdF
 WuZ7B1DfFoCgYarhTRLEhzbi0LN+x/aQQ0lo32JT5FmLT+q+U4QLWmabrRJVyYXM91+itrUuTJ6
 egodvY5Lkz9HXKU0RJPFIRctbVMYCGuXgH9E4hnTQmPfBzGgAffw2ErUk/NJSFT/Ekw0A5weGG1
 tmEFNkbk6go5G8KUZaaq3IC7bIzDrW/RkI8vYimwkxCEtlWKUecwBGJmysAcQquxe1SSa0eW+yQ
 TRrFcyGtKMocv+AoIPRRLMhwCQy0f+DAoYE7kNTsF4ihE4IG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Now that we have a VMM that integrates with fp-stress and the guest code to
run with it extend fp-stress to run KVM guests along with host test loads.
When we have access to KVM we start FPSIMD and SVE test loads in KVM on odd
numbered CPUs.  If nested virtualisation is supported half of those will be
run in guests with EL2 support.

Although the VMM supports protected guests we do not currently start any
since doing so taints the kernel, having this happen as standard is
likely to lead to confusion if other tests fail on a system with pKVM
enabled.

If any non-virtualisable SVE VLs are detected we will skip SVE, currently no
such systems are known to exist.  Should any be encountered the appropriate
enumeration code can be implemented.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 204 ++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index e96fe1ac1ad1..968983a5e39f 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -7,6 +7,7 @@
 #define _POSIX_C_SOURCE 199309L
 
 #include <errno.h>
+#include <fcntl.h>
 #include <getopt.h>
 #include <poll.h>
 #include <signal.h>
@@ -18,11 +19,13 @@
 #include <unistd.h>
 #include <sys/auxv.h>
 #include <sys/epoll.h>
+#include <sys/ioctl.h>
 #include <sys/prctl.h>
 #include <sys/types.h>
 #include <sys/uio.h>
 #include <sys/wait.h>
 #include <asm/hwcap.h>
+#include <linux/kvm.h>
 
 #include "kselftest.h"
 
@@ -46,6 +49,11 @@ static struct epoll_event *evs;
 static int tests;
 static int num_children;
 static bool terminate;
+static int sve_vl_count, sme_vl_count;
+static int sve_vls[MAX_VLS], sme_vls[MAX_VLS];
+static bool have_kvm;
+static bool have_kvm_el2;
+static bool have_kvm_sve;
 
 static int startup_pipe[2];
 
@@ -60,6 +68,14 @@ static int num_processors(void)
 	return nproc;
 }
 
+static char *kvm_el_arg(int cpu)
+{
+	if (have_kvm_el2 && ((cpu % 4) == 3))
+		return "--el2";
+	else
+		return "--el1";
+}
+
 static void child_start(struct child_data *child, char *const prog_args[])
 {
 	int ret, pipefd[2], i;
@@ -322,6 +338,21 @@ static void start_fpsimd(struct child_data *child, int cpu, int copy)
 	ksft_print_msg("Started %s\n", child->name);
 }
 
+static void start_fpsimd_kvm(struct child_data *child, int cpu, int copy)
+{
+	char *args[] = { "./fp-stress-vmm", kvm_el_arg(cpu),
+			 "./fpsimd-test-kvm.bin", NULL };
+	int ret;
+
+	ret = asprintf(&child->name, "FPSIMD-KVM-%d-%d", cpu, copy);
+	if (ret == -1)
+		ksft_exit_fail_msg("asprintf() failed\n");
+
+	child_start(child, args);
+
+	ksft_print_msg("Started %s\n", child->name);
+}
+
 static void start_kernel(struct child_data *child, int cpu, int copy)
 {
 	char *args[] = { "./kernel-test", NULL };
@@ -354,6 +385,26 @@ static void start_sve(struct child_data *child, int vl, int cpu)
 	ksft_print_msg("Started %s\n", child->name);
 }
 
+static void start_sve_kvm(struct child_data *child, int vl, int cpu)
+{
+	char *args[] = { "./fp-stress-vmm", "--sve", NULL, kvm_el_arg(cpu),
+			 "./sve-test-kvm.bin", NULL };
+	char vl_str[32];
+	int ret;
+
+	/* Our VLs are in bytes, fp-stress-vmm wants bits */
+	snprintf(vl_str, sizeof(vl_str), "%d", vl * 8);
+	args[2] = vl_str;
+
+	ret = asprintf(&child->name, "SVE-KVM-VL-%d-%d", vl, cpu);
+	if (ret == -1)
+		ksft_exit_fail_msg("asprintf() failed\n");
+
+	child_start(child, args);
+
+	ksft_print_msg("Started %s\n", child->name);
+}
+
 static void start_ssve(struct child_data *child, int vl, int cpu)
 {
 	char *args[] = { "./ssve-test", NULL };
@@ -404,6 +455,136 @@ static void start_zt(struct child_data *child, int cpu)
 	ksft_print_msg("Started %s\n", child->name);
 }
 
+static void kvm_put_vcpu(int vm_fd, int vcpu_fd)
+{
+	if (vcpu_fd >= 0)
+		close(vcpu_fd);
+	if (vm_fd >= 0)
+		close(vm_fd);
+}
+
+static bool kvm_get_vcpu(int kvm_fd, int feature, int *vm_fd, int *vcpu_fd)
+{
+	struct kvm_vcpu_init init;
+	int ret;
+
+	*vcpu_fd = -1;
+
+	*vm_fd = ioctl(kvm_fd, KVM_CREATE_VM, 0);
+	if (*vm_fd < 0) {
+		ksft_print_msg("KVM_CREATE_VM failed: %s (%d)\n",
+			       strerror(errno), errno);
+		return false;
+	}
+
+	*vcpu_fd = ioctl(*vm_fd, KVM_CREATE_VCPU, 0);
+	if (*vcpu_fd < 0) {
+		ksft_print_msg("KVM_CREATE_VCPU failed: %s (%d)\n",
+			       strerror(errno), errno);
+		goto err;
+	}
+
+	ret = ioctl(*vm_fd, KVM_ARM_PREFERRED_TARGET, &init);
+	if (ret) {
+		ksft_print_msg("KVM_ARM_PREFERRED_TARGET failed: %s (%d)\n",
+			       strerror(errno), errno);
+		goto err;
+	}
+
+	init.features[0] |= 1 << feature;
+	ret = ioctl(*vcpu_fd, KVM_ARM_VCPU_INIT, &init);
+	if (ret) {
+		ksft_print_msg("KVM_ARM_VCPU_INIT feature %d failed: %s (%d)\n",
+			       feature, strerror(errno), errno);
+		goto err;
+	}
+
+	return true;
+
+err:
+	kvm_put_vcpu(*vm_fd, *vcpu_fd);
+	return false;
+}
+
+static void probe_kvm_sve(int kvm_fd)
+{
+	__u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
+	struct kvm_one_reg reg = {
+		.id = KVM_REG_ARM64_SVE_VLS,
+		.addr = (__u64)vqs,
+	};
+	int vm_fd, vcpu_fd, i;
+	unsigned int vq;
+
+	if (!sve_vl_count)
+		return;
+
+	if (!ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE)) {
+		ksft_print_msg("No KVM SVE support\n");
+		return;
+	}
+
+	if (!kvm_get_vcpu(kvm_fd, KVM_ARM_VCPU_SVE, &vm_fd, &vcpu_fd))
+		return;
+
+	/*
+	 * The vector length set is readable without finalizing the vCPU,
+	 * we only want to look at it rather than run anything.
+	 */
+	if (ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg)) {
+		ksft_print_msg("Failed to read KVM SVE VLs: %s (%d)\n",
+			       strerror(errno), errno);
+		goto out;
+	}
+
+	have_kvm_sve = true;
+	for (i = 0; i < sve_vl_count; i++) {
+		vq = sve_vq_from_vl(sve_vls[i]);
+
+		if (!(vqs[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] &
+		      (1ULL << ((vq - KVM_ARM64_SVE_VQ_MIN) % 64)))) {
+			ksft_print_msg("KVM has no SVE VL %d\n", sve_vls[i]);
+			have_kvm_sve = false;
+		}
+	}
+
+out:
+	kvm_put_vcpu(vm_fd, vcpu_fd);
+}
+
+/*
+ * We don't act as a VMM for guests directly, this just enumerates what
+ * can be run with KVM.
+ */
+static void probe_kvm(void)
+{
+	int fd, ret;
+
+	fd = open("/dev/kvm", O_RDWR | O_CLOEXEC);
+	if (fd < 0) {
+		ksft_print_msg("Not using KVM, /dev/kvm: %s (%d)\n",
+			       strerror(errno), errno);
+		return;
+	}
+
+	ret = ioctl(fd, KVM_GET_API_VERSION, 0);
+	if (ret != KVM_API_VERSION) {
+		ksft_print_msg("Not using KVM, API version %d not %d\n",
+			       ret, KVM_API_VERSION);
+		close(fd);
+		return;
+	}
+
+	have_kvm = true;
+
+	if (ioctl(fd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2))
+		have_kvm_el2 = true;
+
+	probe_kvm_sve(fd);
+
+	close(fd);
+}
+
 static void probe_vls(int vls[], int *vl_count, int set_vl)
 {
 	unsigned int vq;
@@ -460,10 +641,8 @@ int main(int argc, char **argv)
 	int timeout = 10 * (1000 / SIGNAL_INTERVAL_MS);
 	int poll_interval = 5000;
 	int cpus, i, j, c;
-	int sve_vl_count, sme_vl_count;
 	bool all_children_started = false;
 	int seen_children;
-	int sve_vls[MAX_VLS], sme_vls[MAX_VLS];
 	bool have_sme2;
 	struct sigaction sa;
 
@@ -509,9 +688,15 @@ int main(int argc, char **argv)
 	ksft_print_header();
 	ksft_set_plan(tests);
 
+	probe_kvm();
+
 	ksft_print_msg("%d CPUs, %d SVE VLs, %d SME VLs, SME2 %s\n",
 		       cpus, sve_vl_count, sme_vl_count,
 		       have_sme2 ? "present" : "absent");
+	ksft_print_msg("KVM: %s, %s EL2, %s SVE\n",
+		       have_kvm ? "present" : "absent",
+		       have_kvm_el2 ? "with" : "without",
+		       have_kvm_sve ? "with" : "without");
 
 	if (timeout > 0)
 		ksft_print_msg("Will run for %d\n", timeout);
@@ -559,11 +744,20 @@ int main(int argc, char **argv)
 				   tests);
 
 	for (i = 0; i < cpus; i++) {
-		start_fpsimd(&children[num_children++], i, 0);
+		if (have_kvm && (i % 2))
+			start_fpsimd_kvm(&children[num_children++], i, 0);
+		else
+			start_fpsimd(&children[num_children++], i, 0);
 		start_kernel(&children[num_children++], i, 0);
 
-		for (j = 0; j < sve_vl_count; j++)
-			start_sve(&children[num_children++], sve_vls[j], i);
+		for (j = 0; j < sve_vl_count; j++) {
+			if (have_kvm_sve && (i % 2))
+				start_sve_kvm(&children[num_children++],
+					      sve_vls[j], i);
+			else
+				start_sve(&children[num_children++],
+					  sve_vls[j], i);
+		}
 
 		for (j = 0; j < sme_vl_count; j++) {
 			start_ssve(&children[num_children++], sme_vls[j], i);

-- 
2.47.3



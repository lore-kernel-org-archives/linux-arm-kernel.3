Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CE606EE81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k0kY/KQu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O87qkPIn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RB5srmqQd/maCSmRSA1W8+xOxrcg8sMZDczI7qN0heY=; b=k0kY/KQu0XLIZS
	x41auN7hzlaqGv5+kjinWNyxy/uJtIg5lgXBBM6XZuayJgj/ysXQQ3Gtx3bbzL3wiU2ASSgqDMpjM
	mq3IRrfrKXM12IyYmkd3aigHQqoVoClAzjkx3PK20vY/siBe4jruLl3t24twb7oSfzZ3v1ZVXpMQ+
	GTYro+VgV6wu9K7NrQj/UuTFWL23oNN5r/jXlwzQr46KPCu5Q0dkWX6IZtDhNwrbNYFb7aVwS7jiQ
	W0bDOGrmPk76FeeodY/O2lvIGduyRE50/CLM+VnozWMR5kAR6yfJDX0xrVoIDkRb6Ge/b0GO8i8Z3
	U5bZxsKrwI4cpvQHpmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEi-00000009EgL-1PoL;
	Thu, 05 Nov 2026 14:14:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEb-00000009EYd-1zKa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3651242B26;
	Thu,  5 Nov 2026 14:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046931F000C1;
	Thu,  5 Nov 2026 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888073;
	bh=RB5srmqQd/maCSmRSA1W8+xOxrcg8sMZDczI7qN0heY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O87qkPIn8j+07AORo+BBto5HZmVMR8e6dqqa129o81YNRYSCUR77U57HneYCOMYBG
	 P799f+HQ2VO0PbW3TH+k1Ucu4oBJv/wlzDoduL35X4m8Cwa6rIgUZ4r1pR03MILzoG
	 vh0LPcQ9Qjr8IdfpaHOSreq0yemKQGFFFlWf7sqALXdMBMGFah8G2jR5CKNq8Z+Ele
	 rSVPJGytfz1yJ1LQYPdXVx3NRoMPSj8gpOzSBcAa1zwTVx+MieAYd4iuovizt7yVJ5
	 0QF6/ZssampHVdaoB/RjHBh/n2IMuPQPTlqFPki0/LN4EsSYvY9SS4LiA7ZiqVB+BV
	 Woszev5vLk6LA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:24 +0000
Subject: [PATCH v2 11/11] kselftest/arm64: Run KVM guests from fp-stress
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-11-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8501; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eqKlyzC7JjMvXMwAjAlK7Lm3h58e6CmVt9VH+QWaong=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gv6Hw+bqd3sem/ezviwytdHX0/g0JfQOiugJLxsx
 bRHx8I3dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi/t4M/6vae1UklTcwpu32
 m55Yq7n4t5Pa21Wlh6Z+rv3y0ezoXSZGhhXTblw6VfbmuOy1yP7qe+l8Xv32+mHrP5tG3b1w9pl
 /NzcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that we have a VMM that integrates with fp-stress and the guest code to
run with it extend fp-stress to run KVM guests along with host test loads.
When we have access to KVM we start FPSIMD and SVE test loads in KVM on odd
numbered CPUs.  If nested virtualisation is supported half of those will be
run in guests with EL2 support.

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



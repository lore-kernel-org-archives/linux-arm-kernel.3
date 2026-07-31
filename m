Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9DC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hp708L//iArg9TjvY21pP5toBSAUeUQGGXgQT+srdHg=; b=Ph19/9xUVt/um+UCWLCXBFa8N4
	HIWAXvj1g3NUFJkh2xKIIrIfJhSCXm6WNJ7EykTkLuy9Lst9X5r96ahi5Dm6oRgoJsHUlq8KBRPE7
	sUrVznv3VmFxbKHvC1KmaAkAHpj0U7UOyRFccQKuw15nNWGp0Z/6Xza4bbkiOEpdT+L9v1blUQsjG
	lm4dkh/EOmEQ/27R+vPNCFBF7YKtK0dZlFZGC+TE99Lf2DhOMRw0osO50kzb8Kyf0COyOpRsjPX8W
	1UoSO0sf7Vy3CjcM4lM4ptbbt790ItnUT2IyydZqf7OfDvB5Ld5jLLTxAb4F/SpA6Fgi3i2/CGBtf
	fpG4wZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptMD-0000000DVVl-06E1;
	Fri, 31 Jul 2026 19:57:25 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLL-0000000DUxi-2OSR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:32 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-ca860baea9fso2990990a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527790; x=1786132590; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hp708L//iArg9TjvY21pP5toBSAUeUQGGXgQT+srdHg=;
        b=qxILrK/4JX+e2arWTLvETZdxEAtKgpF/H+dt8QbBnCwY7AG9zzVPt9LDCvMRd1tSat
         TZA20Jv4XTjW7H9J053/WfxWPIo7OP3IFDW/M1qcE0oEymYsIrFtNtzThdbRH8D6sA9S
         y2F84Lhp0V9ziRIpanFj695VAI1GHTYBO/CagAf1/3b5CapYhtNYTpL5PZCJY1IcZ2Pu
         0BD0cPRbcunkvXbl3Q8YLIHLBXAPumHKCBHU984HFobHAhg1ngkULMrj1hJosTXVr85b
         lk8cyDJUq3P0DPXLLwhoe60hsvythtfwomUWHi3Dlp/LsxbvtV8JI1J8/pEFpUqQFwbN
         D+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527790; x=1786132590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hp708L//iArg9TjvY21pP5toBSAUeUQGGXgQT+srdHg=;
        b=MOPf77I0rWPSTQdVl7zqjO7TKwT2rY1AoW3ejwlThA8Jk4951x6T+ZTzENfZ+8n2P+
         dKYdBCXOLvrp7rC9IxUI0QG0psDbn/FNii2dujEu/Rhd2mOwq9q2RTnMT9frNivTPF45
         6ejx4KUx0MN2eYffCrxJTGTNVLJnoeNa7260jf5onk1RkcJEfXTDQuYY/Sr2EpKyUGV0
         hgCbjL1h0y+Yx3d7rxxMi2UcJcN0+pWDItoV4WheIv2K/OgD427IeuN8qt2p6WOZ/RQE
         sgB5r42FmzLtmZ/m0Zew+oUP1cyw7mHKeRuPfBezhxldX8vHMkOcSSamfbL9HVTTzLRr
         zohQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp12Nu3bHBex8nI1YzSIPLm1BRFUZoDSssjP7e+/ppyXrN3hsgKUb/p1hQWuX32HAgVLpl57q0GR204vnTCLCDp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl1N2i7Lk+sahk3lWsD+LHtWsn+ZtpUam7Dl4qRCTtVfdY9q4H
	RtaaUc4BMWO0QAaF13GWrZ+ELE3bah03KrznZE7g0dq8TzbQMQpWNDkemB1fYTfdqj6nb+0vYQB
	E4nP1pw==
X-Received: from pgmh4.prod.google.com ([2002:a63:5744:0:b0:c92:dd1e:dc60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88ca:0:b0:847:893f:2d0c
 with SMTP id d2e1a72fcca58-84ee47e512dmr830032b3a.5.1785527790077; Fri, 31
 Jul 2026 12:56:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:12 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-13-seanjc@google.com>
Subject: [PATCH v3 12/12] KVM: selftests: Clean up global constants in
 hardware disable test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_125631_624472_105F21D2 
X-CRM114-Status: GOOD (  12.31  )
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

Rename the global constants in the hardware disable test to better
capture what they control, and open code the literal number of sleeping
tasks and iterations instead of using power-of-2 math to express values
that are 100% arbitrary.

Opportunistically tag the global semaphore with "static".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 72bac346bdd9..43a36ef3ead8 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -17,13 +17,13 @@
 #include "kvm_util.h"
 #include "ucall_common.h"
 
-#define VCPU_NUM 4
-#define SLEEPING_THREAD_NUM (1 << 4)
-#define FORK_NUM (1ULL << 9)
-#define DELAY_US_MAX 2000
+#define NR_VCPUS		4
+#define NR_SLEEPERS_PER_VCPU	16
+#define NR_ITERATIONS		512
+#define DELAY_US_MAX		2000
 
 static cpu_set_t threads_cpu_set;
-sem_t *sem;
+static sem_t *sem;
 
 static void guest_code(void)
 {
@@ -75,15 +75,15 @@ static void run_test(u32 run)
 	TEST_ASSERT_EQ(pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &threads_cpu_set), 0);
 #endif
 
-	vm = vm_create(VCPU_NUM);
+	vm = vm_create(NR_VCPUS);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
-	for (i = 0; i < VCPU_NUM; ++i) {
+	for (i = 0; i < NR_VCPUS; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		kvm_pthread_create(&thread, &attr, run_vcpu, vcpu);
 
-		for (j = 0; j < SLEEPING_THREAD_NUM; ++j)
+		for (j = 0; j < NR_SLEEPERS_PER_VCPU; ++j)
 			kvm_pthread_create(&thread, &attr, sleeping_thread, (void *)NULL);
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
@@ -132,7 +132,7 @@ int main(int argc, char **argv)
 
 	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
 
-	for (i = 0; i < VCPU_NUM && CPU_COUNT(&allowed_cpu_set); i++) {
+	for (i = 0; i < NR_VCPUS && CPU_COUNT(&allowed_cpu_set); i++) {
 		cpu = kvm_pick_random_cpu(&allowed_cpu_set);
 		CPU_CLR(cpu, &allowed_cpu_set);
 		CPU_SET(cpu, &threads_cpu_set);
@@ -141,7 +141,7 @@ int main(int argc, char **argv)
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-	for (i = 0; i < FORK_NUM; ++i) {
+	for (i = 0; i < NR_ITERATIONS; ++i) {
 		pid = fork();
 		TEST_ASSERT(pid >= 0, "%s: unable to fork", __func__);
 		if (pid == 0)
-- 
2.55.0.508.g3f0d502094-goog



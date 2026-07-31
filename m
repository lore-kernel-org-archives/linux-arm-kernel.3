Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA72C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWTFo4fs/kSU6lr4ZzfhIdwS/NOVkYn2PmTaiQ/QINI=; b=Zr61EZTHMrtjuCnwlJhuaz8t+1
	x5Gtf6XiL6FAdjqPu+UBWu7wwSTo83g/iGqE+6/6gouWtKKdM/OsFmDuEvRgwVOpB/SEj1/CyY4BJ
	nk7u9apWLEuDxTafCBW5Kk1N5IP8Gs6BuF/+Ounc2SpdE8Q5FOH4pgO24QHGuHnhNgVk0ODiBTfk/
	7VxhId5ewVZjDypld6Jx+oRuYsRmeu0q+YT7Gm/d+i7xeaQJYOwfPgoLBfLrRtjFwoqgY66/k8/yB
	iELLTIy+HYjDKqT6s3/anOgdcPQBusitbXxthYiOc4D8fAXN3XfWrC/WBghRYWj2rM5Au2tpcXiq3
	Dy+meayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUtE-1X1B;
	Fri, 31 Jul 2026 19:56:28 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLB-0000000DUq1-2zMd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:22 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso1679391a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527780; x=1786132580; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QWTFo4fs/kSU6lr4ZzfhIdwS/NOVkYn2PmTaiQ/QINI=;
        b=M73JbxA3LaMq2rjpQyKiUYWm/bRjJPzqQ2xbgjds1/EU6vKI9ss/vSiglJ+DUZFwkh
         clx2ToC3ZWaYiJyQ4Z5MJQIayPXdaykJl+VewZL2hXfvUl1CNVc6X5EweJpJBfdy8kAa
         mkT3Msvv8GD6CmFLnFLadm6aIV1OifVZtYDOB22LV0Xi3jWJZWWf0iy4zo1xKmg36DlF
         W404YGbbG3/WK8wcp/n88tEYb5QJT1OLWFj2RxwsV9ezI4zm+PYsI/sVoaKME2wVyyxW
         Xn06mOiomUz8gi7j3exusrnukRqTSXiOZUSNc/vlGE3ufel8jPt+0YGhisQrIKxzwv4g
         j0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527780; x=1786132580;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWTFo4fs/kSU6lr4ZzfhIdwS/NOVkYn2PmTaiQ/QINI=;
        b=I4bm4jgGJeNG4/5xs7LwEwM8e3y0dVolYeih9RIjAqG2olB8+ViYMFPXhglaHwvBw6
         GRVppPTv/CXS5CSGi0AQqo1GZ4t9ZWEs4n8S9aGyiZqVUcS+LVR76b5P7hnpMGAoCNIR
         ux4IOFiv9x2XAV3tfIWq8DtImQiGeNGuA145EAlKz62+CI6MIPmF4YHt/l9q2cYXFhmG
         CA+YK/S5oTcj1GxtpS37HRlMUFaZXkuu7CXJJ06mNlUs8WMO6O1PONrZUp0ghiBtCJdH
         PPTUdAoLOGgLZRwM5VfBLFDX3u5+GZozmV9DaoQrbVGZ3/xN8UGJUOX2C/YabaEogLo/
         zqvg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5VM/id0qqFHxdyNMQO7384jjBITAmbulr9oJr7TCIAHXKfIfUKxjOvuhf6+Gs7CJESdo34YKWwA5yON1q84Tu@lists.infradead.org
X-Gm-Message-State: AOJu0YxmmmwYUl8Txea8sWwa3PbGZ3b4Dl+iAlUa3+UPgKFnJofdXtBw
	dGa/v4zZ7uY2/A1uyNU3USa4v7AZd5dXsu/gQr5RtWqaUz1TLGi1ImtxVr0d5vPhaVfc8syq/pl
	7Xwg0iQ==
X-Received: from pgnp30.prod.google.com ([2002:a63:7f5e:0:b0:cbb:b782:6be1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:13aa:b0:847:1d73:f753
 with SMTP id d2e1a72fcca58-84ee48a4d18mr834507b3a.45.1785527779971; Fri, 31
 Jul 2026 12:56:19 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:03 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-4-seanjc@google.com>
Subject: [PATCH v3 03/12] KVM: selftests: Pre-set threads affinity in hardware
 disable test when possible
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
X-CRM114-CacheID: sfid-20260731_125621_755567_E4D2FA53 
X-CRM114-Status: GOOD (  11.13  )
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

When building against a libc that provides pthread_attr_setaffinity_np(),
pre-set the grandchildren threads CPU affinity in the hardware disable test
to further reduce the perceived latency of pthread_create().  On large NUMA
systems, this reduces the average runtime from ~10s to ~5s.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/hardware_disable_test.c  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index f088b4af3ccc..b4edeadfa3f4 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -36,7 +36,9 @@ static void *run_vcpu(void *arg)
 	struct kvm_vcpu *vcpu = arg;
 	struct kvm_run *run = vcpu->run;
 
+#ifndef _GNU_SOURCE
 	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+#endif
 
 	vcpu_run(vcpu);
 
@@ -50,7 +52,9 @@ static void *sleeping_thread(void *arg)
 {
 	int fd;
 
+#ifndef _GNU_SOURCE
 	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+#endif
 
 	while (true) {
 		fd = open("/dev/null", O_RDWR);
@@ -80,22 +84,28 @@ static inline void check_join(pthread_t thread, void **retval)
 static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
+	pthread_attr_t attr;
 	struct kvm_vm *vm;
 	pthread_t threads[VCPU_NUM];
 	pthread_t throw_away;
 	void *b;
 	u32 i, j;
 
+	TEST_ASSERT_EQ(pthread_attr_init(&attr), 0);
+#ifdef _GNU_SOURCE
+	TEST_ASSERT_EQ(pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &threads_cpu_set), 0);
+#endif
+
 	vm = vm_create(VCPU_NUM);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
 	for (i = 0; i < VCPU_NUM; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
-		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
+		check_create_thread(&threads[i], &attr, run_vcpu, vcpu);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
-			check_create_thread(&throw_away, NULL, sleeping_thread,
+			check_create_thread(&throw_away, &attr, sleeping_thread,
 					    (void *)NULL);
 		}
 	}
-- 
2.55.0.508.g3f0d502094-goog



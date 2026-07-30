Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE91C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV7AgRqM0rROb0IpxCIjCBLFpIy5wqfEikqI+1M66/s=; b=gERNAN7/Nw3MX3gKcQ26onUVOj
	KbWk2gNzxKUArZ7cBIqCBxAFEobMxjlT1DO2dFctsrGEUTfUkFvkykMrt6yA59x1yjj7j1YUUWUjZ
	f3h0DYQY3GjA7ynOJIE2RqDog6Kl6skKq8mE534LFJ9MWG0kccKECaW8f65vmvXeX7u7goh/EfaSn
	Bo26Ad8GtKxopI+vgKRA2YsVneSo5+ZUOtCeqWCHNR2GHhhQnNF9RLPOR4U3MXOjrN7vHu1AS5tvt
	tYcdD4nVzzDVIzcjTFYIgawaT/AJyGERb7jm94du9BhMct/mA3l7NW5hB8fKrO4Vb+AOZdU8k6EEe
	XiBeyr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHy-0000000BDkY-1jAW;
	Thu, 30 Jul 2026 19:19:30 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHk-0000000BDcR-0ZnI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:17 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso538739a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439154; x=1786043954; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kV7AgRqM0rROb0IpxCIjCBLFpIy5wqfEikqI+1M66/s=;
        b=oOXpAPHQ1d8bc7t7riyG4hJcfRaVFdMt0W9SbH2wd1TDTKcvPh/oki0BqQNIHcOb7D
         uEepeShkpWqdMwZH+srZkknREfhqaxbjYN61saIF/DvKR1ut/dKNM4dDFlLiydV/8W+o
         kqTVRyuUQ/LKkULQySCHS4uFuS6nuMD/YYkUQVfXFv5WmyHMIc1gLdSPNPsoj9hkYdfj
         NhkuD9m/hXn42SSZvoRaTIqjvxMXRFg1TWlDLcunasck/4vr5wNkakNJ0yuAOMf3PhSx
         c/YVpG6f/NSfWsa/9YYQZQzzW7TmLtJEVhooYwqzFIeeVl52AIbT10jQ7SNbBj73Amjp
         eTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439154; x=1786043954;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV7AgRqM0rROb0IpxCIjCBLFpIy5wqfEikqI+1M66/s=;
        b=kDFeG6bPl/pToq5ELDobCwtFioxv94IPg5W49v/5pCCXHjgHhEdNCeuQRclVuOeBXE
         0F1ScxFBgILgTxmIe9/QX417yWdV238isWUrJiqyNTxY5bWt7UDCf2NXwZ3uUCLubUjj
         7bTCeZ8PJVYs0PcdcEQVL6GINh35S5oObUiICVFowZWgEIlKG/fb7Mgfe5J/YoS9GH32
         fT1S7OaZygy5sMbZmOvwK25T29VhMlVrrCcvNwvzgw6JHD+dQprkEUVuOTgSUJPXGoNF
         Lj8CYR3ZLU5YVowFyMup0DXOIRl6mcFhedXdkt8kQbStbVfYVpqRygjGrQ5ZTHVNLp0A
         /psw==
X-Forwarded-Encrypted: i=1; AHgh+Romq8O4NaHXOJbyCsoDBYNdrhOkDDv1kWYj4qxnS5e31RZ7rwYGdsqj9wjEyhSkdr+7Romb2Kopo+JMIb9TDhk7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+IaN2dPza5KqffLRZcxSMxA668QDms3G5WRSUvdaJDiR5kXf
	bvkKtSvOt43kcNjcsps6L5LogDtau8V3ln5C73bSNtYm15PHBTZ6PlQaDARvS8slAWIl7L031Kl
	sloRHyQ==
X-Received: from pjbmg16.prod.google.com ([2002:a17:90b:3710:b0:381:bbcf:b10f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e4f:b0:38d:dfd1:7a8
 with SMTP id 98e67ed59e1d1-38f9bd3ef8cmr2857348a91.2.1785439154115; Thu, 30
 Jul 2026 12:19:14 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:02 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-4-seanjc@google.com>
Subject: [PATCH 3/9] KVM: selftests: Affine child tasks to other pCPUs in
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
X-CRM114-CacheID: sfid-20260730_121916_179391_1E54660E 
X-CRM114-Status: GOOD (  12.42  )
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

When possible, affine child tasks to a different pCPU than the parent task
in the hardware disable test.  On preemptible kernels, running 4 + 4*16
child tasks on the same 4 pCPUs as the parent can result in runtimes of
several minutes due to the children making it difficult for the parent to
make forward progress.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c     | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 3147f5c97e94..1bcbd13e9994 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -22,6 +22,7 @@
 #define DELAY_US_MAX 2000
 
 sem_t *sem;
+static cpu_set_t child_cpu_set;
 
 static void guest_code(void)
 {
@@ -84,16 +85,11 @@ static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
-	cpu_set_t cpu_set;
 	pthread_t threads[VCPU_NUM];
 	pthread_t throw_away;
 	void *b;
 	u32 i, j;
 
-	CPU_ZERO(&cpu_set);
-	for (i = 0; i < VCPU_NUM; i++)
-		CPU_SET(i, &cpu_set);
-
 	vm = vm_create(VCPU_NUM);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
@@ -101,12 +97,12 @@ static void run_test(u32 run)
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
-		check_set_affinity(threads[i], &cpu_set);
+		check_set_affinity(threads[i], &child_cpu_set);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
 			check_create_thread(&throw_away, NULL, sleeping_thread,
 					    (void *)NULL);
-			check_set_affinity(throw_away, &cpu_set);
+			check_set_affinity(throw_away, &child_cpu_set);
 		}
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
@@ -147,12 +143,30 @@ void wait_for_child_setup(pid_t pid)
 	}
 }
 
+static void setup_child_cpu_set(void)
+{
+	int cpu;
+
+	kvm_sched_getaffinity(0, sizeof(child_cpu_set), &child_cpu_set);
+
+	if (CPU_COUNT(&child_cpu_set) < 2)
+		return;
+
+	cpu = pin_task_to_random_cpu(pthread_self(), &child_cpu_set);
+	CPU_CLR(cpu, &child_cpu_set);
+
+	while (CPU_COUNT(&child_cpu_set) > VCPU_NUM)
+		CPU_CLR(kvm_pick_random_cpu(&child_cpu_set), &child_cpu_set);
+}
+
 int main(int argc, char **argv)
 {
 	u32 i;
 	int s, r;
 	pid_t pid;
 
+	setup_child_cpu_set();
+
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-- 
2.55.0.508.g3f0d502094-goog



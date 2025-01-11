Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD888E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=; b=NXKKdUGFFr5Gqix+I90s1103gH
	Wfo/rOYM3FgB7YU7x88aqkSVayBToZPVBN6AwUju58M4nSuOmrS5ChU0vS+QasYg7+QWBhm7+raQh
	Px+gUknRhzWPXTnFj5D7q2bdwB033wF3zfEa3YFNvBB9vIN4YycwWEPF/NQEYbbN9EZmA5fmptvMU
	xkKNglfDfv+zWT+XfqLlWju2YqXr6dTNGxuOdzdguB+ExT47LeHL1tYRty+NdzLw/z0fCez1txt2H
	sH2Yds/8kOOWJquIkUrnCmkJ3wJ8VqlMvDa0ZAggXxMUoLGKTqW60oJqnLtJdtr7AZYkw7+vECCG7
	yrMJq2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQue-0000000HYGx-1TU5;
	Sat, 11 Jan 2025 02:07:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiW-0000000HQQ7-21CT
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=; b=hVLOuZqwyAoQ3S/Qaf/XtNXrCy
	oZ7dSfy5tQL71oCOZf+KBzjSzbDFEEntfr9U3qGJCc1LSTJjvAiEOmQeFUmaCv9tH0yYTQlJ2qAW9
	kbgvE/pbXhMfcBVDVcoVijmsxmN1YbB2AImSnEnWCqMI8+Iiow7ULPmmDf9LB3duvbLx4QeSwxQKW
	XmiNQXF+IyrFqCD96UaV8NNw33gYy/5fsD67CkA3FSAOH5PmUbaTIMKRwUENE3avIfBSMr3STEpTV
	Vs/Q3E9gBItWE5pWt81SGF3W1Dir44r+by/E9o4FOleNnQj8BTkVYjs17y4uUVtHE0R0zUbPSxvaS
	9T4cXnWQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiR-00000009yMs-3Y1P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:07 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2eeeb5b7022so4795285a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556662; x=1737161462; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=C590g53WBTBH2pglqPV7I0aj/YKCkAN9TTbKfsWGVOceLorqDGvkIJLWyc8tJJfrTR
         o4HrFCnu5TYSoSVv3XOsZMmcQICHSV71ejFYuwXeHKdURoUfRmXkwFyhsX4UfBqT2uoS
         qn8V4ECAuETc1IBZdtMtTdjOAReubE/cBPufozVitqNI60sRlpx4jNP1i7oSFP9W434d
         A0coBi9zQ94MwiUQ6tVDgnSel/2frzretUV4kMQliikYftueLev0/hGCex2QuWbKaIna
         yEehPpez8m8RmJ+Qvj2+xe8odLy+KDVtRnrWanmQ54NcgOf70lr3M+mOvWuXxIuy/yqm
         L0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556662; x=1737161462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=NtuR2He5W7mCL3vcXDJzMNFJ0jChS2gGNSVheiqAeIjpVak5I/Lq8kg8TMwmYcoojW
         slUWsrUOBLp3C77xQsT98RJFEt9ZqCPughmXG/luB2suiamhyQaiCvil1LXbPeOvjus2
         p0g3Sh0Ttj/iF3GRWeokYsRBpRcyY/iET8iPEKKUtiDVFHLHT6qW9YapQVT0O1fQ8u0O
         31H+JiJhcmdsB5CCAulx32LxATSp5643ddggB+OLzYPFcep1aOuuqhdDpivfcA1LCvBQ
         wXztdyD0ng8phvg7J695gR7joVfGmQhUjoPdsrANjKBXZS+/zkTNiKT09GpGkJ8WJCd2
         In4w==
X-Gm-Message-State: AOJu0YxpdC7/sczmBIncNQ1e3LsKgRic9VaIQzMmhJTY/GRl7XShAGTi
	x2H8OJ0MygCS4KZedkAVNt5rRGfH+QvJOS4XBwdmqmlbZoMSawP7Xh58XHSEdZ1TFNunsFToIcW
	CBQ==
X-Google-Smtp-Source: AGHT+IGlLX0aEPqXGbQsPjSqI3Z9q/GgP2EA9enACEq8PUpXduEFLRvRbXw1OHEj1+uEtI1vezl+E8v1zzM=
X-Received: from pjbnw2.prod.google.com ([2002:a17:90b:2542:b0:2f4:4222:ebba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c5:b0:2f4:423a:8fb2
 with SMTP id 98e67ed59e1d1-2f548eca27emr18806754a91.20.1736556661971; Fri, 10
 Jan 2025 16:51:01 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:46 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-7-seanjc@google.com>
Subject: [PATCH v2 6/9] KVM: selftests: Get VM's binary stats FD when opening VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005103_955145_E70608F6 
X-CRM114-Status: GOOD (  13.57  )
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

Get and cache a VM's binary stats FD when the VM is opened, as opposed to
waiting until the stats are first used.  Opening the stats FD outside of
__vm_get_stat() will allow converting it to a scope-agnostic helper.

Note, this doesn't interfere with kvm_binary_stats_test's testcase that
verifies a stats FD can be used after its own VM's FD is closed, as the
cached FD is also closed during kvm_vm_free().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c88f5e7871f7..16ee03e76d66 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -196,6 +196,11 @@ static void vm_open(struct kvm_vm *vm)
 
 	vm->fd = __kvm_ioctl(vm->kvm_fd, KVM_CREATE_VM, (void *)vm->type);
 	TEST_ASSERT(vm->fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm->fd));
+
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vm->stats.fd = vm_get_stats_fd(vm);
+	else
+		vm->stats.fd = -1;
 }
 
 const char *vm_guest_mode_string(uint32_t i)
@@ -661,14 +666,17 @@ static void kvm_stats_release(struct kvm_binary_stats *stats)
 {
 	int ret;
 
-	if (!stats->desc)
+	if (stats->fd < 0)
 		return;
 
-	free(stats->desc);
-	stats->desc = NULL;
+	if (stats->desc) {
+		free(stats->desc);
+		stats->desc = NULL;
+	}
 
 	ret = close(stats->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	stats->fd = -1;
 }
 
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
@@ -2231,7 +2239,6 @@ void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 	int i;
 
 	if (!stats->desc) {
-		stats->fd = vm_get_stats_fd(vm);
 		read_stats_header(stats->fd, &stats->header);
 		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
-- 
2.47.1.613.gc27f4b7a9f-goog



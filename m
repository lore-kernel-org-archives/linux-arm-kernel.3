Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80CFC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=; b=Py+aQSBIm+PRAo1EsgdXF6UGr/
	6p0HCT1rLmd7DWPoDYX0yApCQhIsyBp8NbHD7sZUiiH9SlVL9q22gJ1akO938sOkkBk1aaZZ5LU3u
	8BmvECX/GOmXQ558wgPaUxnrpNwXSJXR+VYmdp3fMNWgWyfdoc3QATcg9i7TDRnB1vRqH7bfSz2AZ
	KKWzQ8HsWlKakIqiv6qLYAvcfjd9Zwtpiy+rE5EmylTFw4Q6SvnKWAYUIg33ccX65C8G8vSDnTFgH
	Vy8d796KKFApC2+ig2hQd8DRHBX2ZSPpEBU01i/hEefNiE/BQvmdsDg3yno2Rk4hw1Eq1pxLtlzy8
	vuPR8xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgm-0000000DDZY-32IS;
	Fri, 31 Jul 2026 17:06:28 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgk-0000000DDXd-3Xm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:28 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1349769a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517584; x=1786122384; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=;
        b=cLkWuV6YbFSAZXXorBFFHqoV1sn3UFqKBEJAvib9UONlQMnZ+CIaH5x8fybdsb9Zev
         iNwTKJy+hecePw323ExVkdqB936NvAuY/F3Z8VVBNf+xzMaS9GCRQspLPkHinzEW0/WV
         oyG1BEKxsqjpCSZN+oRGXuA0qIFqJ132AJBGLuING219RMdyHQZsjlDqWQQOgtzMm2CX
         ERvg76yB68yeHV4btrycspO0TNDRDUdzqefdgNaOFH+KWHwgtbHiRcX5uxIbEyom1o+3
         XPaiAiwHJoj8k5I4Q3azer3hLHArc7/CtLdJoarILDXGhHLZuXPrZ5esDnMuJr4iu9LR
         IWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517584; x=1786122384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=;
        b=di/mKdoCXxhah4r7IpgysIqGSuEKGQh74zgm6ALn1CDxhhOFzM7adhPjMMBceYHyLK
         0SXcsRgpJi7kKfqKHjZ2CKzsr/WWabs81KN6yr19gzcKL1XXHV+QlqSsS2iOs9zPw3XE
         V5b1XxxbBrR+ldb+biVTtDQCIVhxy8+DrSICqXFYHikpchX0xpHlAKVz0LqzQViraUn+
         zF/Gxhwx79s4UHxkEr4qGyU0IIyU/i0xUtwNJ1Hz446vlPo1AyqGhgglCahd5gQIHaCY
         F90eDHdLyBlsigRL8mbNnEX716LycDddDQYW6c776zJlUvX8xn6+d2q1QD7IuoMewCyz
         BXBA==
X-Forwarded-Encrypted: i=1; AHgh+Rphd4s+ER4aAYfmoVKkX918Jv17JhEQZo7B0X9DP7WrHEc/tiGGXBLX4gMAIaqkjQ11ZOWIwTUnURQM20Wb8pMK@lists.infradead.org
X-Gm-Message-State: AOJu0YzwrdF7fVR5YXvHJBKnGAcNA+pZcGEpa6QCyp1h7wLj1Agcrewf
	BVfFr7B6+g4BZDUGTsZzYxMkZ6GEbGTGaXWbEPMIOkL2EfFTvWHUfBEH50UqBaDA7Jkcw7yRcFv
	ayRPSDg==
X-Received: from pjso10.prod.google.com ([2002:a17:90a:c08a:b0:381:171e:961c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:280a:b0:37f:c28a:de61
 with SMTP id 98e67ed59e1d1-38fbc45521dmr583105a91.17.1785517584041; Fri, 31
 Jul 2026 10:06:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:08 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-2-seanjc@google.com>
Subject: [PATCH v2 01/12] KVM: selftests: Add a KVM syscall wrapper for sched_setaffinity()
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
X-CRM114-CacheID: sfid-20260731_100626_905185_FC59EF70 
X-CRM114-Status: GOOD (  10.35  )
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

Add and use a KVM wrapper for sched_setaffinity() so that selftests don't
need to manually assert that the syscall succeeded.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_syscalls.h | 1 +
 tools/testing/selftests/kvm/rseq_test.c            | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index 5dae6143ddb0..01dca99009c2 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -95,6 +95,7 @@ __KVM_SYSCALL_DEFINE(fallocate, 4, int, fd, int, mode, loff_t, offset, loff_t, l
 __KVM_SYSCALL_DEFINE(ftruncate, 2, unsigned int, fd, off_t, length);
 __KVM_SYSCALL_DEFINE(madvise, 3, void *, addr, size_t, length, int, advice);
 __KVM_SYSCALL_DEFINE(sched_getaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
+__KVM_SYSCALL_DEFINE(sched_setaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
 
 #define kvm_free_fd(fd)		\
 do {				\
diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
index 557e393c223b..edcaf0fbe20c 100644
--- a/tools/testing/selftests/kvm/rseq_test.c
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -75,7 +75,7 @@ static void *migration_worker(void *__rseq_tid)
 {
 	pid_t rseq_tid = (pid_t)(unsigned long)__rseq_tid;
 	cpu_set_t allowed_mask;
-	int r, i, cpu;
+	int i, cpu;
 
 	CPU_ZERO(&allowed_mask);
 
@@ -96,9 +96,7 @@ static void *migration_worker(void *__rseq_tid)
 		 * stable, i.e. while changing affinity is in-progress.
 		 */
 		smp_wmb();
-		r = sched_setaffinity(rseq_tid, sizeof(allowed_mask), &allowed_mask);
-		TEST_ASSERT(!r, "sched_setaffinity failed, errno = %d (%s)",
-			    errno, strerror(errno));
+		kvm_sched_setaffinity(rseq_tid, sizeof(allowed_mask), &allowed_mask);
 		smp_wmb();
 		atomic_inc(&seq_cnt);
 
-- 
2.55.0.508.g3f0d502094-goog



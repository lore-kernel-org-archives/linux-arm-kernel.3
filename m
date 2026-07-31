Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EE0C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=; b=qEpgM+QFfDa8g3RLz5so5yyZhu
	KL79EkUMoAFWF3VfZiQp3K4X0UNhhw1kreJvWFKuwesoffihZU6Dp6C43Eydh9mVZPav4d2tDisYe
	Xg5TNNyvZxJNhdJFFfW/Ytupzl6EZx8yFBIOXGkM23NgTJMiwheNSCjUEPFmuXMRAyH9vNhOQ6NPk
	wWD8/XDmQqTRUv7uzq6tyuyqCtyh/K0LuhJxITEf+sO+Klq+t8IdPB+ixpKTiaCmuGTqznTde/mdR
	5Q5Cy4gV0LYZ36R6FnQs6yXNSGMJ8qWhDFVVeAhWU9KbH2rceiRW4n8Qtz5OGopfUKIXaDeD2KMkV
	hYlMh9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUse-0iDz;
	Fri, 31 Jul 2026 19:56:28 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptL8-0000000DUp4-2vm5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:19 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84a3514f912so2363610b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527777; x=1786132577; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=;
        b=Tne2Vk25aoRtpu1+Y5Peq6mY+hHGMwbcZ6mtIwx5jLyqJIGyjP36kPYMFovzZGUPeP
         ukCQB1P88qvOk4byd/CRaFZvagBwhrWL6IK4i0cBcQbNPprlx53iqGNBDsk6Fup+qijp
         jyTiuerInvqiZEUjY7tL5HflJzdwWAk9tDQSQMs+yztMHfzQ1Htb271JHDutAfphsRo+
         47WEjI3TIb89TDUAJqT4Xx1JI0IkMO2oR7Pj+qH6IY/OKfzF6sM1qP6omCJ8QtUVShAt
         UcvafSFDmex1acL73GFg+9BeYe69FoYdI9dSsvOk2KpqYyCJPBQVCL3Xha/sn67I4Pg3
         v1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527777; x=1786132577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I1vB8uido3pB5A8nVpiV1ZvPN5oqRESsQC5EjXRdj5A=;
        b=cjh8AfpHT/iIAy/smdpRv+NnJO0g5WdthhM9XU6woUtqnoiXF1/sT45hKfw+Bm7ukS
         OWDGJnigNPAB8v0b62wzNyy/sS56bluYxLimFTnPmaQpvpZyV7aSy/SKbR3sj249Rd+w
         L6JFZorKCQVODJBjx+MsYUPvpcfFjeCs09w/dDHiRoaoJarzP6spxBE/WE/SJa5NCYrr
         8/17ilWXDThGBGjoF/xtU7fRgdBbNDxHqUcHVm+yqXKUcOdbmmzlIbWB9d2PX72WUoIM
         PaBTCLPRO2RvBXjSrq3O/rwIfOHIAsWK3hGj6a1UY16SRIOb8HtcLMWmHzlA4XfMral/
         eFnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro971RGxci5IXCNsYEYBbF+eW20kxCgAW16WSSLWPkH4Di1eyQtbgEegU8S2DHKwBNwA7aGUAnxPTr6sjBODsc3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxojqma9kKsyR3zcHYu3aDS62OQUHxmVjcnyMin7a4MRWPZkVDA
	HDvFmS+hq8fiDn1E5Cl2toNG2WKm4aiqY0mpt/v+E41YC/8MVk7lZpHl1xhYWYXXMMF9H3yj4nn
	Aomlfkg==
X-Received: from pfbi2-n1.prod.google.com ([2002:a05:6a00:a502:10b0:845:c4b8:9730])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9a87:0:b0:848:2f73:8ffd
 with SMTP id d2e1a72fcca58-84ee49339bemr849272b3a.70.1785527777019; Fri, 31
 Jul 2026 12:56:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:01 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-2-seanjc@google.com>
Subject: [PATCH v3 01/12] KVM: selftests: Add a KVM syscall wrapper for sched_setaffinity()
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
X-CRM114-CacheID: sfid-20260731_125618_732253_85CBB281 
X-CRM114-Status: GOOD (  10.26  )
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



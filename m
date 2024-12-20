Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17E2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=; b=o3jXQVm18mhQfmqv7+C/KPj3QN
	11EGaa9HzLhToS5WmqIroGIcIMV7jEtOqPcjI+U13c2p5hC3Lu9jB+Fr8GfP9xRJgA01eL+M1Y/wE
	FDgzBYjbdEqYZBGpFAh5yQPNhk/lf68V1GnBqS2nGu7sfZy3gq2YJovnoiirI10dPTqrMY+IJL6Gz
	/J0pEGI5L2X+3gtEKK0xM6ogbFHBeY2ja6nDfnWsYxY9eSjIR+ilZDJl2ej9+AayTSoLz2z2fvG+j
	kqhYV+skjBYhhYvchA09sLWo5Hj0Un4f8QZQAQq/H/PpqvPOczI2MuUkY3kD2ynE5VpiiX5iN93t6
	fm9a+dHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS6o-00000003fKA-3UlH;
	Fri, 20 Dec 2024 01:47:18 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz6-00000003d1m-0dNY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-728eda1754eso1968895b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658759; x=1735263559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=Q0NYNkhVl8uJafBlK5AwmQ/zoSH3tzP5RV7UEAqrkWuTOyk9vpEIsBRT6ydbUhRlgq
         7F0Rsu66y/CVxt0ICQSosYlEbi9FdcYNPZJzsz8Zkjcb7QbrOvJvonA4k8hC4pLUDgK8
         tXtyctYQVRYuqnchCVY+V+pv5z+mLVVeGSsnsJwRKjc5okI/wyc9GL9wcAyoFGmPaN1t
         DyVJ0yBfRplSt8jEjJKXuViQnrtTvUC+9jp6hL3VeUADcRF21+F4GjcP/Lc+gZ64FCP8
         WDuOuBEgkaId2uAAx1w2GJdI8600vExiC3qgx6DJTLQz4KgxVFiTBObxJQC6qPtU2cOO
         kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658759; x=1735263559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=HgXzZCG3QLt/1nGaUDsWL8IvFV5NPAbbneMCrXx9lNkdxJ6F0QOrsDThJ3cgf2BTal
         Z48+yu346Fh2OhxWRuO+Cm7x+SG1HK2ETfgN7PvF5vwxtD/CA47igpitIS8X2EYvfWii
         yJ5KKp+CQf+EhX9kLJKMcwDtwdiFteQMxOZL7HGwlBk5muwgdE6AxOhimqzleuiAXsbc
         nTwdUglMoNY4HxFMIZG3Jyo1awKxuAr2ZHP/Xan8PJcJzqZqzf8ZPXKocuCCTsj9R//5
         nvEXRNU5Y2UGQcy/BxYIJbLwvVWpJgb1SPgfAhOQC1s3eCZU0IhQLJLv36Fb6fFbZbKT
         2LhA==
X-Gm-Message-State: AOJu0YzZ5zDx78Ey+cH7I7p3QcXW8ukeK39aIUsMAZaReAMcSzwMSipk
	diYh+M6BYxa6+woPDT9QO1nv9+zL8/Y8mZeNAsR2SfJ51QRDH8s+M0J5LtOEbH0Giie7J/KRqYK
	NTg==
X-Google-Smtp-Source: AGHT+IFCVSOEBNw3Lv/7iuAoV97N3pDi0VWzw4l+AQLpoLja8FzKhTyc8mSa5fPmEkzN6L6pcIM/EKjTQ3o=
X-Received: from pfbby5.prod.google.com ([2002:a05:6a00:4005:b0:725:e39e:1055])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc2:b0:71e:4cff:2654
 with SMTP id d2e1a72fcca58-72abdd6eb8cmr1219933b3a.6.1734658759224; Thu, 19
 Dec 2024 17:39:19 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:04 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: selftests: Get VM's binary stats FD when opening VM
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
X-CRM114-CacheID: sfid-20241219_173920_189688_8D6FE307 
X-CRM114-Status: GOOD (  12.94  )
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



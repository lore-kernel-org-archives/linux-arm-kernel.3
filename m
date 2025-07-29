Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BBCC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJX8dU8+n+0QNuI44F28R1+g564ctZSa7EPvc3ZFM1U=; b=nouUwBwAYiQG9Baykr5btz9qSq
	c8whTgDhLMLHTKTqMe6xWbSt0ncQTOGo7UEAjdXPEMTxiIijqanLl2xfMoa14z67az8xFHZYoakGV
	ATwaGWJS9PrFpXvXob5StQKxvOX61c1DbgbPmGEh3TaeeyR9wz0gg5qWD7Ency17uDjaPK8Nv7GZu
	GxtR5LsNcaebfXKWNb015wr/Siu6L+EtjeOwq/YNJM4T0HIGEn40/HlGdf+OTOqSpDJlN5alC9zSU
	AafNx6BxNF8av8biXJrU1mb7t7XRoUmNmlt33eGAink2/5cqLCbU0OJi4pnuC8kjal63MTlvH/gon
	XVtqmLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqEh-0000000HaOo-3N2r;
	Tue, 29 Jul 2025 19:43:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq59-0000000HYw5-2pex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:33:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-315af08594fso5826231a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753817630; x=1754422430; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JJX8dU8+n+0QNuI44F28R1+g564ctZSa7EPvc3ZFM1U=;
        b=OkgyYKBKsKldUr4Dm7muQi3NzfAiZqrzWx2sq9h4Y2g67mFPEDbizeC/ZO8NJfbQr7
         KpgVVqDf5V8eLt51/RD2WVd/3Llzi27B4v3dUQWcK5rHUVixQmK4/kJg/HE8Uulcj78o
         KH1fbAbc1xUrXz1xa9N8fzvU11k3EQYpzaGygtGyMsJgrMUEARqga6ChdFZLeuTbVACX
         mmVHRXv+lNCeksh1vmhIPTKjzJGMwL9bOv6N/EcFHtuAJXiX/yDk7k/uuLbfGCi9Z+C1
         PON/xYm7zCICyQd9YjUSTNhn3S+FEUuaUtjD6PSIcWMrCz1vRTXsLknPRiMGVSMWC3J7
         BNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817630; x=1754422430;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJX8dU8+n+0QNuI44F28R1+g564ctZSa7EPvc3ZFM1U=;
        b=RePTzgRkNaFwN0fd4mvU6eMztlHdjLx/OBfruhf6qmXkXekXFH30/NNfrItb0/zTBS
         F4g/cmze1j+1d4GEVuTm03Rin2x5dXacBCAeo8RusQsw1tcB34iUleqkb0Gda/Z7WKJ5
         eK22ByacTsH7TsKV/6/PARQIHkWKJzUJ95Jez3cJGYSZH/tmmyH2nw+Kc57fro3/Y5L0
         crupXMFgIIs34dP+G40AtCqejoWbZnRpxbiwcv5ktboMbidZTKh2wj06bwENFt/4kMCx
         xCLXpXkROtg0haHg9F6esqp/X8x/Got3fQ6+GsXi35CmtJyX6LYJL/VPXzSahqq2sBWE
         SyxA==
X-Gm-Message-State: AOJu0YxVRUjlEJjHi8P2fVTQSwPd8kmLOEA5eU2iRTxIRVJE0IkQPZgm
	lIXpNb6iqs+qOF2Z7i9vKEIN7KXdcvI1zfu+9zPij7LJ3Nljimd9BnWOhbeTw5+JM5eS4QXWKlF
	x4YgvhA==
X-Google-Smtp-Source: AGHT+IHfEWMEuUfBMeiKYE9aLfHbALVYy3IIrBllmmLaQcn7q2hIwc6mBe+teoBHRd1eD2W+YlhcAuMLoXU=
X-Received: from pjbpv8.prod.google.com ([2002:a17:90b:3c88:b0:31e:998f:7b79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33d2:b0:31e:c8fc:e630
 with SMTP id 98e67ed59e1d1-31f5de73bf9mr824146a91.26.1753817630463; Tue, 29
 Jul 2025 12:33:50 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:33:37 -0700
In-Reply-To: <20250729193341.621487-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193341.621487-3-seanjc@google.com>
Subject: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected pending
 S-EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_123351_714010_C4A45BD1 
X-CRM114-Status: GOOD (  12.62  )
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

Exit to userspace with -EFAULT and a valid MEMORY_FAULT exit if a vCPU
hits an unexpected pending S-EPT Violation instead of marking the VM dead.
While it's unlikely the VM can continue on, whether or not to terminate
the VM is not KVM's decision to make.

Set memory_fault.size to zero to communicate to userspace that reported
fault is "bad", and to effectively terminate the VM if userspace blindly
treats the exit as a conversion attempt (KVM_SET_MEMORY_ATTRIBUTES will
fail with -EINVAL if the size is zero).

Opportunistically delete the pr_warn(), which could be abused to spam the
kernel log, and is largely useless outside of interact debug as it doesn't
specify which VM encountered a failure.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 3e0d4edee849..c2ef03f39c32 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1937,10 +1937,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 
 	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa)) {
 		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
-			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
-				gpa, vcpu->vcpu_id);
-			kvm_vm_dead(vcpu->kvm);
-			return -EIO;
+			kvm_prepare_memory_fault_exit(vcpu, gpa, 0, true, false, true);
+			return -EFAULT;
 		}
 		/*
 		 * Always treat SEPT violations as write faults.  Ignore the
-- 
2.50.1.552.g942d659e1b-goog



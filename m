Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38FFCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=; b=oH1W0lpG0CNfvqC92sIpZIi3u5
	wlDxGP4O67l7AZpd+3hTKbXlMPUg+AZq9FIuO4Q05tAOS5V+7NcSmvkk3/4S/plZmDHpfNvVW6nxj
	/QB/rPK7x+tguthvxy2AoLrGqUPkz3T+axE/m+IKLrfcnC2zFW5iMxMAQmf9uuWCewzGYPRUI3nDY
	BwuquewE/RK/92cycr49G4WM+4EHIouJ+1sXEg889Xjx5hWnOmkkq8dJr7dAOjl/KqrIQ+JAQrXyX
	kv6FhjIGdvMZ8psuK71LCtVFc6EfIq5sIIdmER1I76lNzBZve0NlNc1IMbS1FawyAhN6uto5HUdwO
	3FySt6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YUR-00000006HzD-18ck;
	Fri, 17 Oct 2025 00:38:39 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YUP-00000006Hys-124s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:38:38 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-930db3a16c1so373364439f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661516; x=1761266316; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=FprBNEGvAGiaWoDRM/juAiRG+7++LDPiMHSUeksVFAvk6YzOxkT8zSzT0K4HqpMIhi
         BvhWEnfXJ4pl31udvRH+tK1Mg068aAE3wP32w8//HkeHRcBX31ZPFlhU6kWQgNq0obr/
         bzXb/BO431sVFmBj4gFcTlf7QERg3opSnr5xL+75ENjbhUb5WEedCI2RUOvoasySrYlI
         Hvt/nJ07HlAJpqbKQeEAvf+wiSRkBGKhJBmsTkVWpV3eXm4OmTm+XtgujkLtR+mYwDNI
         QxAxtWl8TQpCMGaVI3wJuf3NHl02q6xBtfg1XDqsdGVQ9MQzUDmXrXPmQ9UJeWoelyRW
         SBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661516; x=1761266316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=JhpQ5GUGLJCEo4+6rU4pqYJC/sxU3MKwpz+wWmkhCpmRWdbHYNA6Wiyenr4z4GW2dV
         MPLW8koaum+yWa9oTgJ03vu5BoVy+QvTUeOX62gmV2oho7j6cq3/uW9SK88cBSES0rpw
         uML7FH1If+lrKOyJ+cmaSETdvJuO2gs4dyt2Clc1/gBpGFqpdyz1PXQU3WL7olb977d6
         9PruSdud6GCt09nDLaP0mEfCtLvuqvF5Z0pF467wFWpWNI6q+aOIAzpsA77xsKeR5jGQ
         dnfSKM7KvzZrIjaxTUqN5W2owy4XxpLQWj+B8aPG+S0YbFuKXChGSjwPO88fv7ODvIAE
         s4rw==
X-Gm-Message-State: AOJu0Yz5t9IHe5pzBzV2vzHuBHfDJne8cRVb5DvvXllJzbW7oAWTsPlY
	67P3a4W9jZt1V/mt91sbhL3xp/sQ7cfTp96ImtoRQAusANQSH0DrX7+uU6PyXIc/h4JGpcH3Vep
	1lZVURg==
X-Google-Smtp-Source: AGHT+IHg17I+MrCPzq5TEoO4O1fEv/5Rea+bFeeHOFAKW3+uW2v4jsY6m0H6q4wWDO+YA+zfXcJHtbyRmvo=
X-Received: from pjot19.prod.google.com ([2002:a17:90a:9513:b0:323:25d2:22db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c7:b0:335:2747:a9b3
 with SMTP id 98e67ed59e1d1-33bcf90e717mr1807890a91.32.1760661208480; Thu, 16
 Oct 2025 17:33:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:41 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-24-seanjc@google.com>
Subject: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173837_300091_DA3FF1B2 
X-CRM114-Status: GOOD (  10.10  )
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1de5f17a7989..84b5fe654c99 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2781,7 +2781,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2794,15 +2794,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog



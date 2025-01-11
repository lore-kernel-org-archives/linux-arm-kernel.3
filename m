Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=; b=meBBFzk2mOZ1IP34NGXxqDNAfH
	bkZYfnIaRqimmc1Ra5a2gbBzD7cFENkL4g5r5/xlFUGRBtqFzFN04WtCBvtvR9WINc21R2J573H9x
	CUQAdto4rsGK8AEgxTvyiqX3wEOFjJQyuI+LFkPcao5Z1GMv+zhZZkZ3TXgWqqfofSYcGLtJK+ZEN
	RIrOo49c4xBjCCKYmzDjkk5B2JBRtpg6AC6oXeoFYCVMeYqRWOjM8R0EmBeNSCJqgi2Mb3SDK4s2/
	eUhnj1dh5jrg4pY9wkIubFYd7WpTIZrslSuHyS5dJFxayhaPJBIJ4YeTVm9yJBZabqjtgd+8fj/tC
	UvwbIgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWRNe-0000000Hadt-2juB;
	Sat, 11 Jan 2025 02:37:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFL-0000000HUSg-1BoN
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 01:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=; b=RvRDNRsCxSKs1ZrmYmnyETAMmZ
	cYhkm+T+vAUbrjQ0us/T3Gs89AZ1iZFPVa9nhD5LRUzp3YqFIsgk8GQlMKm3L20S2rKasv65e5uLa
	FaVekl/vq0GrbBKQrAegJeV7+npUvoZUn+9eCPFgKpxrfHo01oHT4qIT0iWAFACW0yvix4cm4K1yy
	vGOcSrHlW4k73cLbokYA53/nJ4u0SvazeZuY++sSi2mB5f0zFwiSFg7EYrLGCs7xvObF49THIwxCj
	1lHUTP4JyhYIOeOhxMhXFVvb+zQ1+nhJEmZ55m0Leo4DawGsdELb0e90W7coEy4HFC6LakY58WJQd
	SEbJCvqw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFH-00000009zI7-2HhN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:25:01 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2164fad3792so44515695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558696; x=1737163496; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=;
        b=Gu6hSbv7R/6iidsVDHhM26j0r1U5RTGam98h9GxA+mskGNOUF96nOrykSWBavGOZYQ
         D0+wUS5/ZIKO1hgOSHVqGdGVDLIMawp3RihysIzx2Ofu+T3xdjdR9C+ffo8vYrA7IF59
         GPh792lQiBYlFsD//sCYxVn/U7FF7wbO43IWOIbWKbTklmk42iRw7EAricUr+r9g0Bdn
         CjFcXIj+xoXmEzG2C9Aks8+NNp+ggakedpuQ5mP9SnaNR+Om7gsiBYaMGsIKMOEuOvn6
         unE4r1Dm3OMeOl1FMA2s/vOBnQ1Lnl7S0+CYNBgPWllJX59iqcEdGp9vbOQcSck2J0bX
         67Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558696; x=1737163496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=;
        b=OkUCOdhNgWC9KGVDbbip8xVfF3xDRbtBzTQe/sijxaBx/gWMmXPxqGinwyI1hyhpN1
         tknVXJM9RyO4STgg6c7twO7+vsAlJ5cTsDIM+xgMng+L8OkK6cSK6UcEUfxrvwr3VM1/
         3tHRufUJAr/nA3+WGIHcAUNYxX/bBOh4AR+6VHQbKL5XtcwwTthlolk9BSZsuxNSBlNN
         yHOVSEZn/gGmGNcB4vKdYdoOwEywbg+fhY9TgzTu0w9KK0YuwAdfIGmV9g4Wcqtqy5hC
         OBMhGVeiIGgHovQJGOkEhluOYqZkd/IXFvH0SuTuWhrgc709UXRDDcWJizdnQGtKpGQS
         T4rg==
X-Forwarded-Encrypted: i=1; AJvYcCUHI+npLRsykoBD5pAVcKHAuzW2uMnAcTH3257LmQohEzF2dUKw+s0PQs/9Qdjb/hEeFyJV2wCbWAhvxgOSdVoc@lists.infradead.org
X-Gm-Message-State: AOJu0YxD/f0eV48VBIV/fI/bDN0J5EhI9gvpjiMcVShFzGjfkIvhhjvY
	THJxMvMwqhaI3mXQSqPVNrVoqIsSZbDZxTjKr2nPi/ddB6gZnEJgqzeJVuwKOrEtNQGsqXy7b9k
	Iug==
X-Google-Smtp-Source: AGHT+IFD3f0YjwZz/pTHPUxUy4yfVqFt92VRSC3L2LvrexSYRapcV9Xo2L4A2CKFVBcFdjD8/mn4jkTqU/U=
X-Received: from pgkp11.prod.google.com ([2002:a63:f44b:0:b0:7fc:fac3:7df6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4325:b0:1e1:b062:f3fa
 with SMTP id adf61e73a8af0-1e88d1dba97mr25121737637.34.1736558695870; Fri, 10
 Jan 2025 17:24:55 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:47 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-3-seanjc@google.com>
Subject: [PATCH 2/5] KVM: Clear vcpu->run->flags at start of KVM_RUN for all architectures
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_012500_305857_EAA0DCFC 
X-CRM114-Status: GOOD (  14.08  )
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

Clear kvm_run.flags at the start of KVM_RUN for all architectures to
minimize the probability of leaving a stale flag set.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c         | 1 -
 arch/arm64/kvm/handle_exit.c | 2 +-
 arch/powerpc/kvm/book3s_hv.c | 4 +---
 arch/x86/kvm/x86.c           | 1 -
 virt/kvm/kvm_main.c          | 3 +++
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..925fa010bb7b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1128,7 +1128,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	ret = 1;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
-	run->flags = 0;
 	while (ret > 0) {
 		/*
 		 * Check conditions before entering the guest
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index d7c2990e7c9e..63692c254a07 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -186,7 +186,7 @@ static int kvm_handle_guest_debug(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_DEBUG;
 	run->debug.arch.hsr = lower_32_bits(esr);
 	run->debug.arch.hsr_high = upper_32_bits(esr);
-	run->flags = KVM_DEBUG_ARCH_HSR_HIGH_VALID;
+	run->flags |= KVM_DEBUG_ARCH_HSR_HIGH_VALID;
 
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_WATCHPT_LOW:
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 25429905ae90..b253f7372774 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1704,9 +1704,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		/* Exit to guest with KVM_EXIT_NMI as exit reason */
 		run->exit_reason = KVM_EXIT_NMI;
 		run->hw.hardware_exit_reason = vcpu->arch.trap;
-		/* Clear out the old NMI status from run->flags */
-		run->flags &= ~KVM_RUN_PPC_NMI_DISP_MASK;
-		/* Now set the NMI status */
+		/* Note, run->flags is cleared at the start of KVM_RUN. */
 		if (vcpu->arch.mce_evt.disposition == MCE_DISPOSITION_RECOVERED)
 			run->flags |= KVM_RUN_PPC_NMI_DISP_FULLY_RECOV;
 		else
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1b04092ec76a..a8aa12e0911d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11465,7 +11465,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 	kvm_sigset_activate(vcpu);
-	kvm_run->flags = 0;
 	kvm_load_guest_fpu(vcpu);
 
 	kvm_vcpu_srcu_read_lock(vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..7d2076439081 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4336,6 +4336,9 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 			put_pid(oldpid);
 		}
+
+		vcpu->run->flags = 0;
+
 		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
-- 
2.47.1.613.gc27f4b7a9f-goog



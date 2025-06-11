Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A3C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trIKCr3BKTnnj1sqkKg+yTyCPFnaZ4cJOVW948+vsJc=; b=emV6wzir70h8Vo+ELikOsdiAjA
	YRLVQP747n/ofRvbfD+W9ooBd01ebZMnD9DITD3S1LYrNrEPFyBm96Yuo5P5s/KZl0NVVfZUecZ2E
	FEv0UiaMtA2cdkGpkqOkBb8wtCNwSq1pQ7jf7V3zVwfeBJvZX66Jjf5ydYCbbZubL9+vuNAlLz2Kk
	bd3ifu3D+NhVPFw6sbgUT56ObgHq7qd1WMMv13P6R2WNwiSUOqw3W3K1jWRtlf40FMxwl5YSUo30h
	e0rr3atA2lLfESNMXTqecdT9EHWuLT4YNPwHetot44T+xwyrfzS9nelwrskTiQOUg+v8sDbau4gr8
	3uFQjkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPW71-0000000BpDg-3QDc;
	Thu, 12 Jun 2025 00:48:11 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEC-0000000BXEA-1oJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2f5cb0c101so157855a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682047; x=1750286847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=trIKCr3BKTnnj1sqkKg+yTyCPFnaZ4cJOVW948+vsJc=;
        b=Qhdeiu4akwYimdL/WsFVumWuBaIaeh7gFTffwXnjsBgok6IFcoGSCjBRlXkdVl5pl2
         z1v1DLsdXDeCT6sMFwRhg7FUx/UENpPBRvouVSHnR7ZFhOEM2SEC821G5tUMm8RunoSC
         nfnrTVp7YJ9VaL815NCuJ9BQoiR+CHZokDcWUZKqnW+WCiIdC1zi3vGJZgG+mPF/+hrp
         A5x9I4/Q0Wt3P6YWESiaLSjMPcqBep1ZMG7ZZ0+vG0PAy7HpPChCwRx576o0boFCz8Ni
         lITn8ZXr4k5oD4TJjUX9Q4E3S2EIYlneGMvBFKLLNBce6ecVdorAHa+gX2e3MGziiAuX
         B8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682047; x=1750286847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trIKCr3BKTnnj1sqkKg+yTyCPFnaZ4cJOVW948+vsJc=;
        b=moFac9ogtK3G/4Eyt9sD+2MbCFmHCzPwMWsRsvF03DMaBarJ5lUTMYmQ6vk3QxIr7V
         M4KmfzImOgw1mPli3OZT3DUdJpKZkZ2VunrPvge1rmVs6PC8zbA60wY5jsINKzYO5Co7
         daRG1fcLnCJFd49LpKzV92dTVq3/VGE+wJIgrF3FcKXd1aPmBrGIMMOkjttAbW9RUTmC
         huA3Ctu++5FAZm4uQaYVDjQ/Bot3Gg7HGTH2D57otfLG+68VKSyhh65rAwtm9IpaaZir
         z44wIrRW/c3syiqFIflpRzyctOAQR+MBxPjZeV97FuVtH9v5T6DIsEK1GufiV+tIP4BM
         aBRQ==
X-Gm-Message-State: AOJu0YxenV8q52a3Jxrj6Xa0KHqIWA16yCG82Jh1r9+NFEI/6v8G7wfD
	ylp7ht5RNB9r/SWcM3jyRuFQXRykVsje9cdX5fmmSEuvHvMHsmxAsyB0RSGi/lmTcpTs5OE8RVZ
	wDCyuyw==
X-Google-Smtp-Source: AGHT+IF+r3WoBv41JnZ3zMdtBzjsIX3MU1bEitF46j7ZacLy0t9sYOOvunU4WNhpDLaXzfE8bRA/KcgnWWk=
X-Received: from pji7.prod.google.com ([2002:a17:90b:3fc7:b0:312:3b05:5f44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3508:b0:312:eaea:afa1
 with SMTP id 98e67ed59e1d1-313c08cfd2emr946409a91.29.1749682047052; Wed, 11
 Jun 2025 15:47:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:21 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-20-seanjc@google.com>
Subject: [PATCH v3 18/62] KVM: SVM: Disable (x2)AVIC IPI virtualization if CPU
 has erratum #1235
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154728_469551_D76D4557 
X-CRM114-Status: GOOD (  13.48  )
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

From: Maxim Levitsky <mlevitsk@redhat.com>

Disable IPI virtualization on AMD Family 17h CPUs (Zen2 and Zen1), as
hardware doesn't reliably detect changes to the 'IsRunning' bit during ICR
write emulation, and might fail to VM-Exit on the sending vCPU, if
IsRunning was recently cleared.

The absence of the VM-Exit leads to KVM not waking (or triggering nested
VM-Exit) of the target vCPU(s) of the IPI, which can lead to hung vCPUs,
unbounded delays in L2 execution, etc.

To workaround the erratum, simply disable IPI virtualization, which
prevents KVM from setting IsRunning and thus eliminates the race where
hardware sees a stale IsRunning=1.  As a result, all ICR writes (except
when "Self" shorthand is used) will VM-Exit and therefore be correctly
emulated by KVM.

Disabling IPI virtualization does carry a performance penalty, but
benchmarkng shows that enabling AVIC without IPI virtualization is still
much better than not using AVIC at all, because AVIC still accelerates
posted interrupts and the receiving end of the IPIs.

Note, when virtualizaing Self-IPIs, the CPU skips reading the physical ID
table and updates the vIRR directly (because the vCPU is by definition
actively running), i.e. Self-IPI isn't susceptible to the erratum *and*
is still accelerated by hardware.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[sean: rebase, massage changelog, disallow user override]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 48c737e1200a..bf8b59556373 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1187,6 +1187,14 @@ bool avic_hardware_setup(void)
 	if (x2avic_enabled)
 		pr_info("x2AVIC enabled\n");
 
+	/*
+	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
+	 * due to erratum 1235, which results in missed GA log events and thus
+	 * missed wake events for blocking vCPUs due to the CPU failing to see
+	 * a software update to clear IsRunning.
+	 */
+	enable_ipiv = enable_ipiv && boot_cpu_data.x86 != 0x17;
+
 	amd_iommu_register_ga_log_notifier(&avic_ga_log_notifier);
 
 	return true;
-- 
2.50.0.rc1.591.g9c95f17f64-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8wf3RrDwwapSfuoerOV8MPC7AS9NZOZvn4WILk0Yi4=; b=a0wbWKvD0JlS7aGjPad9mRjNo/
	XoLRjbCcidwkAR+gTwpjanTVecErE8V2usDn/ftainxmO6ns9B+CVjBrs8lW1nfRpSVCzzMoh/gO5
	OkG8ayLRaBmd5nptUea3o8y+RTk2eONObWKcnJNm8F7FNTBPxhlz7S1wGMdceTlq6BPpk8KgsSxU1
	Jt0LuKh+vhE/56CdVORP1SCanp9kPIGpQcyU55ssTzNxkxEssvTJYaGAYYGwl/Nty+KQ085HfZJot
	tkWGjbE8dAlFvf8lR723slmE6XVZdUUiSuxEtrCtvcy0ZzRdcdC085zP4wwvBwTD5Req/JpwfchuJ
	EhP/VuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWBE-0000000Bq2a-1RoI;
	Thu, 12 Jun 2025 00:52:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEF-0000000BXGA-2pJe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-235196dfc50so2389845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682050; x=1750286850; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c8wf3RrDwwapSfuoerOV8MPC7AS9NZOZvn4WILk0Yi4=;
        b=s/VVLBEwoX2nXxgqGeEQZZs01SxxPGthflHBwOiyxfloEIginYkt69tMjzw5ZJytQl
         WoIEtRimzJxpFqVa9RSepwGfjyXVjFyrs50yNXYztqbfJuVz8AacWXz2P7kFtD08YIAB
         DZ2JI/UGog0EudADnJyhtwU4XLPf1OOtdLPYbpRD6l8h/GQ8sm/cKt2IEOqpcFXit/dA
         v3zwJSa84K0SDmzE+WQpHJ0KwVC6dOkTxkC/kcN648FQNsFa19Mfe3XW2VHo/F0xwx2S
         M2O4skII8Qr8Ug+8+ZwtsHOC2mouk4ih1P3NWPd/4CvJcVz6aE9XmUhIXRC4n5o5sS7u
         RvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682050; x=1750286850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8wf3RrDwwapSfuoerOV8MPC7AS9NZOZvn4WILk0Yi4=;
        b=PRp/VVKrbVFAyyZm8LzvysQXBO0TGOxcNch0pOhJS78sKj2m6mtZoU+Yju8jSQgQ/u
         EhuhIilR996SKiMvttBv/soluwsIoXY27SSBC7DDotxK9sJKwO+MMCRpt26AYJMzvHcs
         AVP4EwIFK54BkTbLZZq0adslVo08KSC7b29T6+aD0TUfH38IP3IqpcxQ2XRCjRmxjNnM
         C9eiEp1yfjNfmaXt4gMy3yK95spONMWFTdQHrPSJSDiAe+PNng+uefk85lxuonaQoRSk
         7L+yrNwbnRCXikiyjG46RRXwCKBOa/NS0wSpIim/Xr5ASLq/CmShPAyGJQrhp8tqFHpm
         eqgg==
X-Gm-Message-State: AOJu0Yyl8PU+rjwNdTngw4l169DrHE4Messw030dXRvpB3XKBU0EQ6vm
	WNCGCy8lHGL7z3+BmO4cq9mTS8n4bQvFeX9nRqhrZ5Ag+7QP2f4vKhbaWdti6Q3ceBlo2cUTQW1
	GaNj+Cw==
X-Google-Smtp-Source: AGHT+IGJNCuXT10P6Ldic0CILM5/98q+VXrxvc0wPM5pd5dn7xv2Zsl8s09cXT8aND58IoPHTgLj9jyuzCc=
X-Received: from plk17.prod.google.com ([2002:a17:902:e9d1:b0:220:d81a:8975])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d54d:b0:236:10b1:50cb
 with SMTP id d9443c01a7336-2364cf689c9mr14160455ad.26.1749682050046; Wed, 11
 Jun 2025 15:47:30 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:23 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-22-seanjc@google.com>
Subject: [PATCH v3 20/62] KVM: SVM: Add a comment to explain why
 avic_vcpu_blocking() ignores IRQ blocking
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
X-CRM114-CacheID: sfid-20250611_154731_738327_8C15E355 
X-CRM114-Status: GOOD (  15.24  )
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

Add a comment to explain why KVM clears IsRunning when putting a vCPU,
even though leaving IsRunning=1 would be ok from a functional perspective.
Per Maxim's experiments, a misbehaving VM could spam the AVIC doorbell so
fast as to induce a 50%+ loss in performance.

Link: https://lore.kernel.org/all/8d7e0d0391df4efc7cb28557297eb2ec9904f1e5.camel@redhat.com
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index bf8b59556373..3cf929ac117f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1121,19 +1121,24 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_apicv_active(vcpu))
 		return;
 
-       /*
-        * Unload the AVIC when the vCPU is about to block, _before_
-        * the vCPU actually blocks.
-        *
-        * Any IRQs that arrive before IsRunning=0 will not cause an
-        * incomplete IPI vmexit on the source, therefore vIRR will also
-        * be checked by kvm_vcpu_check_block() before blocking.  The
-        * memory barrier implicit in set_current_state orders writing
-        * IsRunning=0 before reading the vIRR.  The processor needs a
-        * matching memory barrier on interrupt delivery between writing
-        * IRR and reading IsRunning; the lack of this barrier might be
-        * the cause of errata #1235).
-        */
+	/*
+	 * Unload the AVIC when the vCPU is about to block, _before_ the vCPU
+	 * actually blocks.
+	 *
+	 * Note, any IRQs that arrive before IsRunning=0 will not cause an
+	 * incomplete IPI vmexit on the source; kvm_vcpu_check_block() handles
+	 * this by checking vIRR one last time before blocking.  The memory
+	 * barrier implicit in set_current_state orders writing IsRunning=0
+	 * before reading the vIRR.  The processor needs a matching memory
+	 * barrier on interrupt delivery between writing IRR and reading
+	 * IsRunning; the lack of this barrier might be the cause of errata #1235).
+	 *
+	 * Clear IsRunning=0 even if guest IRQs are disabled, i.e. even if KVM
+	 * doesn't need to detect events for scheduling purposes.  The doorbell
+	 * used to signal running vCPUs cannot be blocked, i.e. will perturb the
+	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
+	 * to the vCPU while it's scheduled out.
+	 */
 	avic_vcpu_put(vcpu);
 }
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog



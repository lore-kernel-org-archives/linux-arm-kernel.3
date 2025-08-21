Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90642CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5D34uO9hhnDzIV0eQsNJj+iG1O4AZl7/xnqUAlhc2A=; b=zjR4VXupU6mpX++o701HS3RZo9
	HwPALiQouKNG8IYiuLodzlWcS0z9fxqdN+kWWTubgGbyYm4noGgbzLgsIThCaJnJahuEtetJIYr+K
	LEMMSf0BHLj353++ZXRJ+kR7rfWMd5tZqMorVMC+j49/4VYVaODJ9D2UE3y4t3NVDWUUOmPyqEb7I
	QaKwYF/ba6UfIIOHPR2P9ac3qPeb9aXJtIePPSurtfDyutkhzFs9LPiA9h/v9csofLBEUtVtD/cQX
	10xB4lg2wqrKb1CNVmQMkL91VstXydXKOgiOEZSnhgGh3YhXm2ahz23Jpx/if/KGI0EAef1Vk+pao
	o6Yny2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKeC-00000001cZ0-2w0v;
	Fri, 22 Aug 2025 05:49:08 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCOz-00000000bVh-43Tm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-246088fc25cso12652955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810052; x=1756414852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=X5D34uO9hhnDzIV0eQsNJj+iG1O4AZl7/xnqUAlhc2A=;
        b=C05z6UKJluPIt5dmQ883T04K721kJ4bvi91qFxsBO/VjhkXMAsy3MdNhoEhzqIgeoj
         hfSXJp91jz81EFG7c9Ba3iZWLSvOO3xwEc2ieCqWJB3oX/M53deQ12pDXuxmgJNYxeMx
         tfqxDez+Q357MsR0KTZp08DAVBqdWZaCWigUpFtDIw16+mM6Laqa0xd+Gs6V/GK4iQjh
         aRdTs+9yc1mjro8jUWa/NMbM/5EvzKwXnacBvEvvDIs+F6KQvAIxwK5bYBnGxCgezVX0
         eJeG3NWX3ggYvtYTuitRr9/Q79IqPkAhWM6TPZDWR9tU7btcBJI0M/a89gQk8YM3Yvh0
         Mzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810052; x=1756414852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5D34uO9hhnDzIV0eQsNJj+iG1O4AZl7/xnqUAlhc2A=;
        b=RHxOL4WFaVvInwbrho3YbNetoZC9GPfCp6Tevfjc6RK9k13jKWVcLb2Tu7Qt5J4d2P
         Su1txh6MgbO2L9pnnuMrwzVrK80gYp4X1ob/zN8L8JLqoaqtAE2QjWOwa9AQgxBiEShn
         trNiJEM7QZxPwyADAKpiap4CWvtsrAFft9oDL1zD82QNF6B+cwrt05nWhnQApFDg7pvc
         vU8vsw+3Di4XeOph2Pq6oPMT6lkatz9ggSKSeyDoQFSiOSY6s0Ph8FUkz0Kvb+ypmpiV
         5PWI2wigE2MuHzmqTFX7EorV7mqmbhEZ4Mqb1a483WIOvWM2/AlWGYeZLj4jUq3eNht8
         xa8w==
X-Gm-Message-State: AOJu0YxtTPcv4vvK+JzzBy0JiqAW1PluKy5utRwsL2w+Wk7dJQ89bIDY
	rlDdK9HWSL+G2z3DTwB1YU5lPIrOyeDni/f7CVoKd0v3XfZ5esU9/kijP4yzIb9CL2RcOXF1AAC
	oeOWudg==
X-Google-Smtp-Source: AGHT+IGd2anZ06gtV+U6bVFsbbPnzA1ZdvlYu/bGmJdbd8hlQ/26jHjvFuQxiH/8Yk00e7KNqc/bTBAWfHw=
X-Received: from pjbsd14.prod.google.com ([2002:a17:90b:514e:b0:321:78e7:57fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da92:b0:246:2e9c:3400
 with SMTP id d9443c01a7336-2462ee5917fmr11005625ad.16.1755810052479; Thu, 21
 Aug 2025 14:00:52 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:30 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-5-seanjc@google.com>
Subject: [RFC PATCH 04/16] KVM: arm64: Use guard(srcu) in kvm_handle_guest_abort()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140054_004970_AE1FFBC6 
X-CRM114-Status: GOOD (  10.96  )
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

Use a guard() to acquire/release SRCU when handling guest aborts to
simplify the code a bit.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index de028471b9eb..49ce6bf623f7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1930,7 +1930,6 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 {
 	unsigned long esr;
 	phys_addr_t fault_ipa; /* The address we faulted on */
-	int ret, idx;
 
 	/* Synchronous External Abort? */
 	if (kvm_vcpu_abt_issea(vcpu)) {
@@ -1984,12 +1983,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		return -EFAULT;
 	}
 
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
+	guard(srcu)(&vcpu->kvm->srcu);
 
-	ret = __kvm_handle_guest_abort(vcpu, fault_ipa, esr);
-
-	srcu_read_unlock(&vcpu->kvm->srcu, idx);
-	return ret;
+	return __kvm_handle_guest_abort(vcpu, fault_ipa, esr);
 }
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
-- 
2.51.0.261.g7ce5a0a67e-goog



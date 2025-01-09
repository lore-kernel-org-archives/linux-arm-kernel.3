Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1852DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej4vKCsRcXi3JRFU5yXFClNg+jWCgVgQEDR3f6Axo50=; b=g6oU30YI4v7j4RUQsr53xOKRzl
	KpRZus6ginuaVBe/Bmd8M01ScH7vm4Zzp2SYy4i2fY0xHQLhcFC6UzxwwebRh38rMI07Ud8JZ32rf
	dZTsAbO7eJIoXghbQwdhrugb+PtatsNScsOee/AIsltrjezminkEw4tgUwPDpxwoBu5XFz/9eypvG
	ISGc+LR0Ewvz7CbmVYYWgmXFv/2G8TQU1vePlf1QEUbxumDP3J9QMb2D4U4uKd8ykEG8IUgsViLgb
	WU5MqjZVnQg4th9qbcuRZDvgX1neGaC/vSS7RR3DaIztYdTUwrhs3MG0K7yADaNV6j3fXsLl4Rwqf
	nQ/ZRJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzcs-0000000DImZ-2nce;
	Thu, 09 Jan 2025 20:59:34 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTd-0000000DGXt-2tHG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:02 +0000
Received: by mail-qt1-x849.google.com with SMTP id d75a77b69052e-4675749a982so22458061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455800; x=1737060600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej4vKCsRcXi3JRFU5yXFClNg+jWCgVgQEDR3f6Axo50=;
        b=c2laMfxL8favRXEMQgpXimsq9MAzGWYUo8O7JRIx+HQkggctFlH/EPUexGn8MWCet6
         fPZa9pekLidNnRIYv2VNFY4sibnFLEMcOOxRzp0HLa8+SsbNqXxqeuG8YIZNOOkNQKff
         ghaIj1YvISJVqGqZF7vfjR3Gt0y2cPFTDAE3CxpQ4XG4ktzK1pDhQ339yO7AwJtQjH3o
         c0N5suSXs1N0Az639aWaB4Qs5uWJggmpXz+Q4GxX+hZgRzYbpL7+3ND4YKFQwJZKPJtn
         AyShcN3sPuDZmoL/2OPeRuzwnFoK3ZVe9MDKq//RaSTjXJaHr11vbeDqlqo7ONPDoj09
         a0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455800; x=1737060600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej4vKCsRcXi3JRFU5yXFClNg+jWCgVgQEDR3f6Axo50=;
        b=fFvEwjo1PHTrlBBClBfAio8z4iEFzKlrLoYn0Jcf7m3djMUbxlErTysigt8vhypdkG
         929VpZbAn7HR5rOsh9JiZ98/hujPWts2W7aMqW/bD7gqXYZ1UMfb3KM8ji4NXN4d+/8o
         6XnaXua9Wo7k3bydNfb+RQljy8rEatrZw+tGJItVc3l3rKlrsth5G5tegLX6GFLOM+X+
         MNodGLBfIS2seS8Nl/jmttNqWtBCAj47jh2388I/r+28vmc8en7ZPUN75V2u1LE795WA
         /cORtZ983sZ5Gp3TAE6JbFbRxoLUWWr10yz8fmhGw2SDLrPoTDGwVV5brVLuHIYksqHg
         ayCA==
X-Forwarded-Encrypted: i=1; AJvYcCXFvOhT6eSg5L39yhjiyVtHKenxeLgIvE/VFfNb7M0UQxJAsbdvG9aU14TE3ilH+fjJrmT0v1qsRcg9tIVWKbjM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6+fwjROv8LKpVCCSS5ZpxESWayvTdwAwm2spSbVFp2Yy3SnQv
	ur4jzK2yTi2UbfJNsd8W34YjCCkS0NnPKV6c/Un2ZhIIJuX4IhgMlYNot85PxKj+1t8lhOrdzAw
	cRkZ0eewjohDECD75Qg==
X-Google-Smtp-Source: AGHT+IEjWh1ifMEjbhq2t/4s1LokEzVaJxOMILKR5p4NmJRJSQEQbDzHfJF1YycGc5qCqnm1VGVZZj4bYy7TorUf
X-Received: from qtbiw5.prod.google.com ([2002:a05:622a:6f85:b0:466:928b:3b7c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:14e:b0:467:5926:fcf2 with SMTP id d75a77b69052e-46c7107e0b4mr103936581cf.9.1736455800057;
 Thu, 09 Jan 2025 12:50:00 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:22 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-7-jthoughton@google.com>
Subject: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125001_736194_DA7A6A57 
X-CRM114-Status: GOOD (  17.16  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Adhering to the requirements of KVM Userfault:
1. When it is toggled on, zap the second stage with
   kvm_arch_flush_shadow_memslot(). This is to respect userfault-ness.
2. When KVM_MEM_USERFAULT is enabled, restrict new second-stage mappings
   to be PAGE_SIZE, just like when dirty logging is enabled.

Do not zap the second stage when KVM_MEM_USERFAULT is disabled to remain
consistent with the behavior when dirty logging is disabled.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/Kconfig |  1 +
 arch/arm64/kvm/mmu.c   | 26 +++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..d89b4088b580 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select HAVE_KVM_USERFAULT
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..e099bdcfac42 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1493,7 +1493,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
+	if (logging_active || kvm_memslot_userfault(memslot)) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1582,6 +1582,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	if (kvm_gfn_userfault(kvm, memslot, gfn)) {
+		kvm_prepare_memory_fault_exit(vcpu, gfn << PAGE_SHIFT,
+					      PAGE_SIZE, write_fault,
+					      exec_fault, false, true);
+		return -EFAULT;
+	}
+
 	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
 				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
@@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 new_flags = new ? new->flags : 0;
+	u32 changed_flags = (new_flags) ^ (old ? old->flags : 0);
+
+	/*
+	 * If KVM_MEM_USERFAULT has been enabled, drop all the stage-2 mappings
+	 * so that we can respect userfault-ness.
+	 */
+	if ((changed_flags & KVM_MEM_USERFAULT) &&
+	    (new_flags & KVM_MEM_USERFAULT) &&
+	    change == KVM_MR_FLAGS_ONLY)
+		kvm_arch_flush_shadow_memslot(kvm, old);
+
+	/*
+	 * Nothing left to do if not toggling dirty logging.
+	 */
+	if (!(changed_flags & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
 
 	/*
 	 * At this point memslot has been committed and there is an
-- 
2.47.1.613.gc27f4b7a9f-goog



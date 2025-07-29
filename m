Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C461DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmVLrvkZP9+4Qi6hccAHfp26jMTaOxOppUd09YnTXa4=; b=cnmqc1UHsIhXJPBWqRXku960iC
	kU1ZYk916clPSUI+44kdUZj3Gc2YwVtSwIU1w/SWOjo1q2RUXpjFUn3w33oqRhYqfsF+9sKG2UphX
	34tdD1GOYWNxWR5n1a4wF9Wk6+nRHN0EVCE6pBQxNZp+t4+ibZpsu0fyDoFM2igwqId87vV6tGCZA
	mkVClnVP4vTNA7Cu5okIdB6PPzRs4hSLzUOVhhoMWBIPWip8huUCluTm0wGXhkyGRnCSZsl2certy
	jrkWp91M7RQZbeOVDNEPkfrfB63yrGrIeKvnWEbzKdv48LJeyrLb+OPuFkFHURjAB/n6tTOhDNvtj
	ntIzu82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtNS-00000000Fof-0Roz;
	Tue, 29 Jul 2025 23:04:58 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEM-00000000Djz-2ZbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31366819969so267007a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829733; x=1754434533; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OmVLrvkZP9+4Qi6hccAHfp26jMTaOxOppUd09YnTXa4=;
        b=fIKb5kkE+MXcs7hbHkOXSO5VDAECiKVWbj0teAXPMH/lFBqLzwiWjrO+CUmnM7vmro
         7Sl0OBVUhRIUtr0aKVwW+mGC5zYof8AgBqPxZm//Z4LT4bQvZz9mpoGIKzTgnXdPPumH
         DplYFVol50QZODMM7JSHFTQC9H52hRQIgGcnrlhTmusntXlc+wftS332YpfNQsMKR1se
         Pt/WL+hA0ebnP7if0LFX3i6I8wf0AXWwX1gcQocgzRwIz/nM6O9i9svRN9jPiHKFvueg
         X4fO0omXmD/TZCpHMfmzrOysGCdBAewL9MNwHTne5kaXZSiCpxgD3khScHyiPal8zqHl
         fbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829733; x=1754434533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmVLrvkZP9+4Qi6hccAHfp26jMTaOxOppUd09YnTXa4=;
        b=kDzyC2c5zF+PR1mdE5m5kvZDr42UJfDFY2xY6J1KTmBwo7CR/uo2GXOdnCM5w4anaK
         GL5KfqeLRSaEzk2PQCsu5aXbyKIUnYfeQqkAumU9RNlJC7HClyYuoamTvCu5EwjvuL0d
         4PRjLh4HBUzCT5FC09mrvpzRQL3qLf1sWc+T0GfyOxNV0+ZagnNFBKbB21DjKDwLpjWC
         KWotBTpdGvtxRYqeEI0DGmXXW1ekboPbHgrIbqc8VrjFGwkfv3IhETsTTEER2x/gcniB
         /PDt+S37LUA1S0cXZ4s4TLAhsyhExdrIZ7UwgwxpHtOp/HYH/w0kHdUm86nC9lAGPRad
         AM2g==
X-Forwarded-Encrypted: i=1; AJvYcCV1vK7EwQWIvWvatd/62FClzvIkOAVgcCGQhc/SPAbBZn2Eqvgi/4/sN7l2hcqolbct8/8o2Gs5h9Y4YxlhTelo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9yystgFs9ITneehjgkDKWdQWHkPgoL7Vv4qmR8IsTkoj57D4y
	VOa+IOOgkaPuI6S6m8ODo/6Vli/g1X+T4EaJLSt9cSkqbGaAQPyPoZ+vvmCYpS5Vv/5iIK0DC9t
	PyryG8A==
X-Google-Smtp-Source: AGHT+IGSrd/EFwxUHSw007+6nrRVXNMPdERz2RNXYrRaT6Ik++IdE/tI3gPpnLHNIaoiETPbklCVAOToMMI=
X-Received: from pjk7.prod.google.com ([2002:a17:90b:5587:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2689:b0:31e:d9f0:9b92
 with SMTP id 98e67ed59e1d1-31f5ddb4545mr1642509a91.14.1753829733349; Tue, 29
 Jul 2025 15:55:33 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:33 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-3-seanjc@google.com>
Subject: [PATCH v17 02/24] KVM: x86: Have all vendor neutral sub-configs
 depend on KVM_X86, not just KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155534_653936_288AE0C6 
X-CRM114-Status: GOOD (  13.94  )
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

Make all vendor neutral KVM x86 configs depend on KVM_X86, not just KVM,
i.e. gate them on at least one vendor module being enabled and thus on
kvm.ko actually being built.  Depending on just KVM allows the user to
select the configs even though they won't actually take effect, and more
importantly, makes it all too easy to create unmet dependencies.  E.g.
KVM_GENERIC_PRIVATE_MEM can't be selected by KVM_SW_PROTECTED_VM, because
the KVM_GENERIC_MMU_NOTIFIER dependency is select by KVM_X86.

Hiding all sub-configs when neither KVM_AMD nor KVM_INTEL is selected also
helps communicate to the user that nothing "interesting" is going on, e.g.

  --- Virtualization
  <M>   Kernel-based Virtual Machine (KVM) support
  < >   KVM for Intel (and compatible) processors support
  < >   KVM for AMD processors support

Fixes: ea4290d77bda ("KVM: x86: leave kvm.ko out of the build if no vendor module is requested")
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 2c86673155c9..9895fc3cd901 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -74,7 +74,7 @@ config KVM_WERROR
 	# FRAME_WARN, i.e. KVM_WERROR=y with KASAN=y requires special tuning.
 	# Building KVM with -Werror and KASAN is still doable via enabling
 	# the kernel-wide WERROR=y.
-	depends on KVM && ((EXPERT && !KASAN) || WERROR)
+	depends on KVM_X86 && ((EXPERT && !KASAN) || WERROR)
 	help
 	  Add -Werror to the build flags for KVM.
 
@@ -83,7 +83,7 @@ config KVM_WERROR
 config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
 	depends on EXPERT
-	depends on KVM && X86_64
+	depends on KVM_X86 && X86_64
 	help
 	  Enable support for KVM software-protected VMs.  Currently, software-
 	  protected VMs are purely a development and testing vehicle for
@@ -169,7 +169,7 @@ config KVM_AMD_SEV
 config KVM_IOAPIC
 	bool "I/O APIC, PIC, and PIT emulation"
 	default y
-	depends on KVM
+	depends on KVM_X86
 	help
 	  Provides support for KVM to emulate an I/O APIC, PIC, and PIT, i.e.
 	  for full in-kernel APIC emulation.
@@ -179,7 +179,7 @@ config KVM_IOAPIC
 config KVM_SMM
 	bool "System Management Mode emulation"
 	default y
-	depends on KVM
+	depends on KVM_X86
 	help
 	  Provides support for KVM to emulate System Management Mode (SMM)
 	  in virtual machines.  This can be used by the virtual machine
@@ -189,7 +189,7 @@ config KVM_SMM
 
 config KVM_HYPERV
 	bool "Support for Microsoft Hyper-V emulation"
-	depends on KVM
+	depends on KVM_X86
 	default y
 	help
 	  Provides KVM support for emulating Microsoft Hyper-V.  This allows KVM
@@ -203,7 +203,7 @@ config KVM_HYPERV
 
 config KVM_XEN
 	bool "Support for Xen hypercall interface"
-	depends on KVM
+	depends on KVM_X86
 	help
 	  Provides KVM support for the hosting Xen HVM guests and
 	  passing Xen hypercalls to userspace.
@@ -213,7 +213,7 @@ config KVM_XEN
 config KVM_PROVE_MMU
 	bool "Prove KVM MMU correctness"
 	depends on DEBUG_KERNEL
-	depends on KVM
+	depends on KVM_X86
 	depends on EXPERT
 	help
 	  Enables runtime assertions in KVM's MMU that are too costly to enable
@@ -228,7 +228,7 @@ config KVM_EXTERNAL_WRITE_TRACKING
 
 config KVM_MAX_NR_VCPUS
 	int "Maximum number of vCPUs per KVM guest"
-	depends on KVM
+	depends on KVM_X86
 	range 1024 4096
 	default 4096 if MAXSMP
 	default 1024
-- 
2.50.1.552.g942d659e1b-goog



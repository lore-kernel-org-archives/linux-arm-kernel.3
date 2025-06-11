Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61357C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=; b=w+taD6EeqH5fi3iD2l1M0ykr0I
	rYHRffg1QhpIn1oimOaexnfZ+S6H2R+Bg7EfwusS5oB5ACl2tjU+T/sEFygOgoDfcaCrYCcPRagyp
	CMCaGUREu5n/C6fkg3pKNkZb8QCwQh+lov6g/fN9+sYctBDdbFEATTz6hfYL9OK1/hEQ/VrngZoM4
	549v+zbWInLB1dMTs+4YcywFDyWGYNGy49JzD5bVqOa7mvjJ0lEaKXIEZNw0PGarUqCSQjhYlVnpl
	VNgrSypjl5M89Tu8/ZkfXSB53JavgoKkeeFbE5nQhWmB1/1VC5Xsb7bbacnzob1znXMQmCnY+ahV0
	SohlzTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9MV-00000008UPb-2cT1;
	Wed, 11 Jun 2025 00:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93Z-00000008SFo-1msN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=; b=HnMazRVk1jCWTt5l39Bvkc8+aq
	uYsLfKraF7kT4VrwuFOnjcMHPbE8zV7Gc4fvA2KaeqwRQ3reWM3ZMWLr1Og8rUU7aUeZOT1t3rdJ0
	sNUoObEtnh+NI9LH2Im+tm/UdbbPhajFV6M4fP015wJ/zX5y34JhY31x6wKNHN2xpDM33OtH6IgX7
	bkUwoTEH0p8DHbclRZnlUcoByMUpLBFgU1qb6d85uXBZBuhAQzq3wSxF/00ZgdM5s9ovmdxGTrOoj
	nRZj3y7aRu1Ow54nkqt1u6YONYBMdqAsMI7J9t5vK1WOWvGYN7yT55OQ3YFDL81DxXyjivBbu9JU1
	bc/JVbyg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93X-000000022Ui-06zW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 00:11:04 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-748475d2a79so2410161b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 17:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600659; x=1750205459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=oAYpn/luT59nFlYSjGzpktDwLlRXQTfsjcsmFitCxyb9WCwlW/CbvTeDWSM1WDKElh
         EZmzjyKLEPA6QgSDOg7UigrzEP56K7eI0HK9Dy0Ce9luvI8TPfF7aaCZ8u+Dl+6nIEtu
         VrhztOu9kVUSyfje40ks1tz2r9KwmjyW3eV/dSee8Cn6ayUvZgDWQSJgYAdMwP4WdDny
         D44S7KSiEk8sJEtbbYyUeQRLW2mnzWrLfUfrqMK5+PA5DM3lMjY/4U79cM1I6ejrIv5y
         RGz376rBDodo0MlWpiVJO2et9vigL+jkZ4i+AG3PEcF0whqN0RSQePuLHuCSuKvj611V
         IdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600659; x=1750205459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=qWKzSJ0vofMi3E0h+uR39hB7cfjl+/rwYG5dkH0b0WeBzUddTs6U46WDwScnGE0R8/
         g7XxGR1X9itda8EZZBS34Lmzlt3Oma0vAoaffIpZ/CCL3DlZWNQY2v6n3h8lRGZxCHvs
         96rgGZkwPFPXid8p8o4FPScuEXhFm/rGJuC5ZEIsqIcaKWJ0OFQLcZc5VYtEKw5KOH+A
         yrj9yxLp49AIDQ3tG6cxQN1pc4jJDjL2a91DN9fr0vLYc9EHCwyH/fb4tdola9P5AMHu
         nZNbA2t3xs0jF06Xs8fiDNbMXmhNMw6Yriz/d8DJJsgSbZy9eya4bzDFuW69D8JoNz5G
         eVIw==
X-Gm-Message-State: AOJu0Yx2Y7pBpT/mRHAu7+bJaYzPxB5cVCTF7QDaNcz42geQ2CNL2pWJ
	rrWi4uR/SPT8UELjTRXMC9wETydWxFLbrTlQgxOo7sFNsWgAFpYH9zBRZxZATLQ0n8QPP1/eF9A
	tpb214A==
X-Google-Smtp-Source: AGHT+IHdKstC+XlYUus8Wdm0HR7HPxHMBlUy5ahB8xm3L+Y1hmecIZTBPJ5vhN4Gi0qdwz1eVbXtQ9xfH68=
X-Received: from pgam16.prod.google.com ([2002:a05:6a02:2b50:b0:b2f:6348:f715])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9012:b0:1f5:8f7f:8f19
 with SMTP id adf61e73a8af0-21f8663f76dmr1960513637.10.1749600659002; Tue, 10
 Jun 2025 17:10:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:42 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-9-seanjc@google.com>
Subject: [PATCH 8/8] KVM: Standardize include paths across all architectures
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011103_156258_904A124A 
X-CRM114-Status: GOOD (  12.33  )
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

Standardize KVM's include paths across all architectures by declaring
the KVM-specific includes in the common Makefile.kvm.  Having common KVM
"own" the included paths reduces the temptation to unnecessarily add
virt/kvm to arch include paths, and conversely if allowing arch code to
grab headers from virt/kvm becomes desirable, virt/kvm can be added to
all architecture's include path with a single line update.

Having the common KVM makefile append to ccflags also provides a
convenient location to append other things, e.g. KVM-specific #defines.

Note, this changes the behavior of s390 and PPC, as s390 and PPC
previously overwrote ccflags-y instead of adding on.  There is no evidence
that overwriting ccflags-y was necessary or even deliberate, as both s390
and PPC switched to the overwrite behavior without so much as a passing
mention when EXTRA_CFLAGS was replaced with ccflags-y (commit c73028a02887
("s390: change to new flag variable") and commit 4108d9ba9091
("powerpc/Makefiles: Change to new flag variables")).

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Makefile   | 2 --
 arch/mips/kvm/Makefile    | 2 --
 arch/powerpc/kvm/Makefile | 2 --
 arch/riscv/kvm/Makefile   | 2 --
 arch/s390/kvm/Makefile    | 2 --
 arch/x86/kvm/Makefile     | 1 -
 virt/kvm/Makefile.kvm     | 2 ++
 7 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7c329e01c557..86035b311269 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 96a7cd21b140..d198e1addea7 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,8 +4,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Iarch/mips/kvm
-
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
 kvm-y +=    mips.o emulate.o entry.o \
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 1a575db2666e..6f12edd465df 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Iarch/powerpc/kvm
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4e0bba91d284..dbe61a398cc8 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for RISC-V KVM support
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index b742e08c036b..5cbcaa7f241a 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,8 +5,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Iarch/s390/kvm
-
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
 
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index a5d362c7b504..f78f11b582d2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 include $(srctree)/virt/kvm/Makefile.kvm
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..0e7ba49026fc 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -3,6 +3,8 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
+ccflags-y += -I$(src)
+
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-- 
2.50.0.rc0.642.g800a2b2222-goog



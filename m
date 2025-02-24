Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB53DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 23:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4yv5E3Df19Io1ieaPGo0Ai9BtJpUzyQSBdyF3aMs18=; b=l9p5nanYn03jDHnoOsAPC9D8FY
	4p2oGo6NjRwiA05UfEwKT2nIkLmBhJiByHGIa6x+el0hvVjmeYMPkHSNWEdmJHT76ZiTyQkqDTMRH
	nx/4UXkyv6zMpwBAFJBEA8kLxfFb41JY6KlLur41A4NwqWXGN2FxlzG3g0SXTEXWEppdpkKCg/K61
	xfykfElA4S2M3AoH4Q2Z2aDR+Di2nsFfmCjP/jM8xp5Xdd0HhhwxKf4W1Q/lioMckzxyHuv+J5uyh
	807QuzDgFeig9R7kiBvaCVB6S4YZq3Pp7W8BbxMoNxdTzK6nchAtjChJzAtRP/wBvQ2HwcADeVPUv
	fcApoTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiKI-0000000FYiO-2x4j;
	Mon, 24 Feb 2025 23:57:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiId-0000000FXtV-0Jku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so10746027a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441345; x=1741046145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4yv5E3Df19Io1ieaPGo0Ai9BtJpUzyQSBdyF3aMs18=;
        b=1t0y8SQ7slHbT5Kja+PbItpxP7clzN1u64uZFWi288gzUs6X/x8m8uQ2zXGvIe53NJ
         TIQDPK0tZhZA9R5KTIl9TcYC9E1qUSil5edUkdEw28XMm0mIKMi0Qzqm/+4uNFVxYALJ
         4G43EXtdujRtYZNNrNt9rng5jwGqQnWX+b5duCLGUMl3W2SZhDqwZqnyGZc8z70Bo1lF
         f2yURSBVchAElQSklo2qOmDXs+biCfShHksIlBzdzM1S9DHV+IGCyDW1r5oWtP5b30px
         uGsyji11RHG+SIKp0OOgQ/Thteiiql/KkqE+ZdJ11rpi+evae4uk7G/0TwGarXia5fed
         /fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441345; x=1741046145;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4yv5E3Df19Io1ieaPGo0Ai9BtJpUzyQSBdyF3aMs18=;
        b=oAcRKk1Mceybf/WXQyi/lNFkjbVqlOtRbeI6b/6ogP9CAQYC9MHRPLd/5B/bG4G288
         tgYaCn7F/CLWCXG/niUwLbGoqhl7JT0jaE8IoGBvpa2SW0wWrN2tykRNQKTgR4brxu+y
         ElJ+oI4yPW6KRhGewKfQcG/iAOT9xWh/uheYy1UxoPBq6iOtTS+dqqNgbuidFEKi0nMx
         mYPYrr/bfoNF8S+YxAUiKUS+ZiNHTjMoYIAI80EXmvEyJxtDJBbIMI0DazMvlxuU7bAt
         Ty0f61WWKMbpqAKcp1JtobU5LhZnL5jz4A8loig/Le/ixrG5zDubz0myEAzPJqCGbztF
         saEw==
X-Gm-Message-State: AOJu0Yw0ExkgOqBdccUTCredTGP5r4uuOixyeXvqAKHJlFkvB1y0S627
	uJ922pnKBRJ2xlhopaihvpc1fNYI1X7fX3HdK6Ulxo2J0Anj7HlK4EAta/u3geY8JN7Yn7LNY/R
	bBQ==
X-Google-Smtp-Source: AGHT+IF6C3DtzvfIloHEkiuLmfsYJNF5ywoI3G+Dg7xZ6ws28dsFaD6h16rXeHiPC/2N2WbxQdNYNz9BqGc=
X-Received: from pjbsd8.prod.google.com ([2002:a17:90b:5148:b0:2ea:5613:4d5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5292:b0:2ee:7c65:ae8e
 with SMTP id 98e67ed59e1d1-2fce77a638fmr26853663a91.11.1740441345356; Mon, 24
 Feb 2025 15:55:45 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:35 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-1-seanjc@google.com>
Subject: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
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
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155547_107731_C9FE3179 
X-CRM114-Status: GOOD (  10.91  )
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

This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
But because x86's nested teardown flows are garbage (KVM simply forces a
nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.

The immediate issue is that checking for a pending interrupt accesses the
legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
results in a NULL pointer deref (or use-after-free if KVM didn't nullify
the PIC pointer).  That's patch 1.

Patch 2 is the original nVMX fix.

The remaining patches attempt to bring a bit of sanity to x86's VM
teardown code, which has accumulated a lot of cruft over the years.  E.g.
KVM currently unloads each vCPU's MMUs in a separate operation from
destroying vCPUs, all because when guest SMP support was added, KVM had a
kludgy MMU teardown flow that broken when a VM had more than one 1 vCPU.
And that oddity lived on, for 18 years...

Sean Christopherson (7):
  KVM: x86: Free vCPUs before freeing VM state
  KVM: nVMX: Process events on nested VM-Exit if injectable IRQ or NMI
    is pending
  KVM: Assert that a destroyed/freed vCPU is no longer visible
  KVM: x86: Don't load/put vCPU when unloading its MMU during teardown
  KVM: x86: Unload MMUs during vCPU destruction, not before
  KVM: x86: Fold guts of kvm_arch_sync_events() into
    kvm_arch_pre_destroy_vm()
  KVM: Drop kvm_arch_sync_events() now that all implementations are nops

 arch/arm64/include/asm/kvm_host.h     |  2 --
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/mips/include/asm/kvm_host.h      |  1 -
 arch/powerpc/include/asm/kvm_host.h   |  1 -
 arch/riscv/include/asm/kvm_host.h     |  2 --
 arch/s390/include/asm/kvm_host.h      |  1 -
 arch/x86/kvm/vmx/nested.c             | 11 +++++++
 arch/x86/kvm/x86.c                    | 42 ++++++++++-----------------
 include/linux/kvm_host.h              |  1 -
 virt/kvm/kvm_main.c                   |  9 +++++-
 10 files changed, 34 insertions(+), 37 deletions(-)


base-commit: fed48e2967f402f561d80075a20c5c9e16866e53
-- 
2.48.1.658.g4767266eb4-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146C2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vr2NEPUlMUbu3MZ3j1bjKONtMkJFv/DS/JUFQy2VOuc=; b=BtsQP0wU27GSU07CFWcJjeHZF2
	A/NH7gNJT+xfAkRWF+U9GhfAOkmq5fENqupsvy+7PU477ERxJfA+C6C+5CrRDZLbTuQmgdljX8FBv
	ZPzT7SgvsOGwLBaBUIzvKh084MUuoA9+Wxtf1JvEpHLB1ySfV738U5dAQSbJseAa3l9eUTayhF6d5
	CIGEo7e7eH4VRuaCLSnfkzxSX6t7gC3baZFl34AN7HwczZ4K5u6QU6i2Dri/7kk2sF6pnKaxp2Vv8
	8HGuuZPaVuzHbnglS45ZjF/MIFaMBY+TE0rckxGlsc+M4SDPJ/hDXkhJagyejGMnS4ElHBn//lZoJ
	kl085uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq9q-0000000HZwr-00ms;
	Tue, 29 Jul 2025 19:38:42 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq56-0000000HYul-0yfD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:33:49 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so6508632a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 12:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753817627; x=1754422427; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr2NEPUlMUbu3MZ3j1bjKONtMkJFv/DS/JUFQy2VOuc=;
        b=LyuOWF+QAzSEKXhJkMeZhug7YwK+76AWMmgPBe/oRuR3mQp1E4RhB1FwaH10kt+FdK
         sTJzEh9mvZLcotT0IjRYY/D58UZkYBNJb6MXbtnAUZA22fGT2n7haRhOWvDPaLbcXgUV
         o/PhWSfXx7EudnL+s4oiR1C1/qAYhio6M4D3KyBbDj/MDItoa3ab7AquTlk8e2dF0hri
         Ekb25USXRcGfJqzCkzhyLnnv5YMxRZQJ6z8F5I1sE+d6rTJHbuexBDYJ3nDrUc+RN3KL
         jguoL6Mhb+gApDdTKgril6H4MOr+q09U69fNax4SmmiMmYh7aV6ExlP+p903OcUnUDfQ
         D5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817627; x=1754422427;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr2NEPUlMUbu3MZ3j1bjKONtMkJFv/DS/JUFQy2VOuc=;
        b=rYAbZCTOA91gLOBbC1hHnB4Oqc3iv+sa6xMoBtYSfN3+Z8X8awHWPnACb3plWMOpuQ
         zPjtPNhdBGv/t5ssxRGwsNh5zUmqerRbh7FSgslkz/np31qvsPYK+I2gj0OaEpvnn2IF
         Mgn6oSovk5L4xerVpy4wQyfgMwWg0gvRZS53wRbFG8C/tZ7fDvca6l11y6RrV2/sw0mR
         jS7musz2LKBJuBoBYeD8FliGDVpoY2UAA+1/yp2pqp52KeGbQ2+D7SJ96xW+PQRGcApt
         dC0iFYwwKDZA20BQlNAGwBPcMGstzlmygSeeHkdhN17Wc9gtWXwWgH/bklVnoY8KToDY
         KB5g==
X-Gm-Message-State: AOJu0YwKPFZ4zbYN/Z3visHNoEl8+oktWhPvOZIlcRMcPLyaN8uwx/GU
	HXuUs9hH5zg+1Dvh9Rp8AuQRHi3pNg4AtS/uQN35g2p+kF+olQnl3Edtvro1WO1ChLHR0y0ExhM
	IpF2BKw==
X-Google-Smtp-Source: AGHT+IEpCUyIaefYP0YL7w8y1faaEZii0WVM++l9+v+mc/1ojeZtttZMEz40RX0OKzEWa3Hqy78BV9878sU=
X-Received: from pja11.prod.google.com ([2002:a17:90b:548b:b0:313:17cf:434f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:562b:b0:31e:d9f0:9b96
 with SMTP id 98e67ed59e1d1-31f5ddb6641mr902917a91.14.1753817626768; Tue, 29
 Jul 2025 12:33:46 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:33:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193341.621487-1-seanjc@google.com>
Subject: [PATCH 0/5] KVM: Drop vm_dead, pivot on vm_bugged for -EIO
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
X-CRM114-CacheID: sfid-20250729_123348_269913_0AEBD429 
X-CRM114-Status: GOOD (  10.54  )
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

Drop vm_dead and instead reject ioctls based only on vm_bugged.  Checking
vm_dead (or vm_bugged) is inherently racy due as it's not protected by any
locks.  For vm_bugged, imperfection is a-ok as the goal is purely to limit
the damage done by a kernel/hardware bug.  But rejecting ioclts based on
vm_dead is dangerous as it gives us a false sense of security, e.g. see the
race found by syzbot in commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES}
intra host migration if vCPU creation is in-flight").

This series was motivated by the last patch, a.k.a. KVM_TDX_TERMINATE_VM.
I applied a slightly different version of that patch for 6.17[*], but I'm
reposting it with the vm_dead changes due to Paolo's question about whether
or not we should have a generic KVM_TERMINATE_VM; dropping vm_dead doesn't
make much sense if we want to add KVM_TERMINATE_VM.

[*] https://lore.kernel.org/all/20250725220713.264711-13-seanjc@google.com

Sean Christopherson (5):
  KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
  KVM: TDX: Exit with MEMORY_FAULT on unexpected pending S-EPT Violation
  KVM: Reject ioctls only if the VM is bugged, not simply marked dead
  KVM: selftests: Use for-loop to handle all successful SEV migrations
  KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM

 Documentation/virt/kvm/x86/intel-tdx.rst      | 22 ++++++++-
 arch/arm64/kvm/arm.c                          |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c               |  2 +-
 arch/x86/include/uapi/asm/kvm.h               |  7 ++-
 arch/x86/kvm/mmu/mmu.c                        |  2 +-
 arch/x86/kvm/vmx/tdx.c                        | 45 +++++++++++++------
 arch/x86/kvm/vmx/tdx.h                        |  1 +
 arch/x86/kvm/x86.c                            |  2 +-
 include/linux/kvm_host.h                      | 11 +++--
 .../selftests/kvm/x86/sev_migrate_tests.c     | 34 ++++++--------
 virt/kvm/kvm_main.c                           | 10 ++---
 11 files changed, 90 insertions(+), 48 deletions(-)


base-commit: beafd7ecf2255e8b62a42dc04f54843033db3d24
-- 
2.50.1.552.g942d659e1b-goog



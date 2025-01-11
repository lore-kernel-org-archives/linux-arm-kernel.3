Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 01:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=; b=CGvljnDPFAYjVV/2jrY8PDx1Km
	DXfhdlYFkH91Nh80sx0901s6Evqvtr3+tGqrWrRJH6y/f8SNaQQLOkiBaIONYOL6ySPEnaPg+UIkc
	Q+MerIv4uTGq0uHueJbXnYShy1dmCPa3QafjnJ1t0/7QN+KSuotiOsehFwAp2l6uWVjhSYD0hJv74
	4WklVGZebiPg8jk6uNrjo3whht++l1lGK9CfyJCypZFb1FaOcIJQZgpvb+XKOulPVF0GTvYI0q8Mk
	DutEqXGEHD9Zb7PkL/MUVubXcmfpmkfReOxTtaWRCMtBXPYHyH0xMJSMuuYvAmXVI9Ym3IQ1vmFiB
	EgDYRTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQGQ-0000000HUik-0qf1;
	Sat, 11 Jan 2025 01:26:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFB-0000000HUQf-3GC6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:24:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so4840173a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558692; x=1737163492; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=;
        b=gTXF5gSxpJTE8WnEA9tMtr3WaWoDlSefZl+Mm9unZrnpZ4kXLhyrxd++e1ghXm7IQ4
         qRZyVXNDZq/gjTHpzDS9ZUk5mlhqjXKGr7fnmhGYVOIjwM/kL3+rod0OLm0mrEQIrsk0
         Jc6gBbwDah/O6Lm9MVLEfHmsUCJ/uBoXZwUJetb3YBpnJ6SUWWBaraiFcP+CDxZKs7Cr
         UAJX62cNOSZULo+XrlawEh4fudT25921h650nc1n066NcFp4LwT4H/ZzweSEUS9czDiO
         lDc87SfEMV/Vdj4yZX5pYwjYRwijJ++Hi/PTbni+NnqECS0beGow/pVVB/p0liLT1CU8
         kfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558692; x=1737163492;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=;
        b=mc1G5WhwR73dnLuJNQHYE9fqC9o0E3zqQV2tHDSF27UpVAso6FTP/fr7NU5lJ9ukov
         QwK2sBLekjGJzusq/tcB1WgfdkgZ7TOtUnlb1RHTupho0M5hIJKlYI9ulsQWM79sWajB
         M+m36SaMvmgO/pqykexzAo95hoPVELzh2LL+SQ6Ty1heKWKvCeiXQiF/ARXf9gZq9QgN
         wmYkVYbsg5aJq3FBkdLfEJtrj21zSao+T45e6ja7tefFLnhqCwhuiEOtQc4sEHDpr8Ew
         YzFVa47vgj58nVuqM7kWi45N6d4y7gDErvMv4xJAxelsvapKAO5n8mMkOEdEoUogXHh9
         eJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyxdDJSupBZG+7X5ulldpO2fgfIy1l5RpZyu3eOevjWv3QRoJS8En/1TpDU28OLafTRsJzK9knhG6Iq6wodbd+@lists.infradead.org
X-Gm-Message-State: AOJu0YwTnhii8EPNx7TqvyabejfUfM7NR71rkv3AkN8JCUfmkjh9MVMm
	XQ2rEJDrw8WeYGE38eYuM3bsIMOjrlGIA//iHkMWgnbThDt3pzPO43fOqc1UCK+sVDEf4yRgTrG
	8OA==
X-Google-Smtp-Source: AGHT+IEfMuWFVKhsS9utsiRr0qZN46F4y7a5kx/arb7GLt+tjCHLQTHDuOdaekKI3i56eThn0gAXDuFPjYQ=
X-Received: from pfef19.prod.google.com ([2002:a05:6a00:2293:b0:725:e39e:1055])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:230a:b0:725:ef4b:de30
 with SMTP id d2e1a72fcca58-72d21f4b537mr18483242b3a.14.1736558692541; Fri, 10
 Jan 2025 17:24:52 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:45 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-1-seanjc@google.com>
Subject: [PATCH 0/5] KVM: Add a kvm_run flag to signal need for completion
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_172453_838185_D835121C 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Add a flag to kvm_run, KVM_RUN_NEEDS_COMPLETION, that is set by KVM to
inform userspace that KVM_RUN needs to be re-invoked prior to state
save/restore.  The current approach of relying on KVM developers to
update documentation, and on VMM developers to read said documentation,
is brittle and error prone.

Note, this series is *very* lightly tested (borderline RFC).

Sean Christopherson (5):
  KVM: x86: Document that KVM_EXIT_HYPERCALL requires completion
  KVM: Clear vcpu->run->flags at start of KVM_RUN for all architectures
  KVM: Add a common kvm_run flag to communicate an exit needs completion
  KVM: selftests: Provide separate helper for KVM_RUN with
    immediate_exit
  KVM: selftests: Rely on KVM_RUN_NEEDS_COMPLETION to complete userspace
    exits

 Documentation/virt/kvm/api.rst                | 77 ++++++++++++-------
 arch/arm64/kvm/arm.c                          |  1 -
 arch/arm64/kvm/handle_exit.c                  |  2 +-
 arch/powerpc/kvm/book3s_emulate.c             |  1 +
 arch/powerpc/kvm/book3s_hv.c                  |  5 +-
 arch/powerpc/kvm/book3s_pr.c                  |  2 +
 arch/powerpc/kvm/booke.c                      |  1 +
 arch/x86/include/uapi/asm/kvm.h               |  7 +-
 arch/x86/kvm/x86.c                            |  3 +-
 include/uapi/linux/kvm.h                      |  3 +
 .../testing/selftests/kvm/include/kvm_util.h  | 13 +++-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  6 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  8 +-
 .../kvm/x86/nested_exceptions_test.c          |  3 +-
 .../kvm/x86/triple_fault_event_test.c         |  3 +-
 virt/kvm/kvm_main.c                           |  4 +
 17 files changed, 90 insertions(+), 51 deletions(-)


base-commit: 10b2c8a67c4b8ec15f9d07d177f63b563418e948
-- 
2.47.1.613.gc27f4b7a9f-goog



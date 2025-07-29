Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C5C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4/83bWvjHcitzad3pCSz+7Zeg+jLiSHIOrBXMY9vQM=; b=Hp8twkIPR1gY9serXGLWjVsodl
	wp5QzHsrH3aX0a0FkhLAroQqBp4fOPD1SNlbbxuT8CkLUX+68LyR2lKxX+DfNdK5OK2bB/FBEjup1
	FvG8IKKLAqBYbrkC0i8j9fQBfWzo4hEDXXu0Q6qQ6LtHTS2YOWwEQoQooHC/0DqBspVzNUKBHAXvs
	WJgYqC6yiZmcQxlv3VzsFCoEfzExty9amJrykDawgcrEQ0Q3o+wTwZKyItu2bekkTDv+CIxWg2Z1K
	/aCVCoXzbJ7jgnBzNL1dzGw78Ws+EhFf0D7Qj3rmuKD98Lptowz2TVpCDnZex747ttzdaX+NgrBbz
	oetjKb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj2f-0000000Gg5f-1iXS;
	Tue, 29 Jul 2025 12:02:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0D-0000000Gfuu-0UvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so27729575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790415; x=1754395215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X4/83bWvjHcitzad3pCSz+7Zeg+jLiSHIOrBXMY9vQM=;
        b=SRPYZUDk1GlQu/nZELwU1U6+l7hJFN2mlv2AsuZyTLsgIba++ZW4Lxum1FgjKDV0iv
         SI+9e5hEb6JNKN4DOXoeD1VuZw+7mtRS98TkRWh65jX/SBnfLoLsLEwcAc7gNkYxfcvT
         YNx2zIZeFbXcgguSBPSYD/UxZzrD8VoYf5hFE9iCUfjtUyZh2yCveqOONIbbULFhOVY4
         c/XQ3HU2LpboSb3/LbH76CHY/SUrodqFqZP1LcAHOdTUAvgcR2w6P03fgrBIW+ukyjhW
         XSkbOsKAKnITeUn+S5z3WGCeSwiZLwHNADu9abb6sMAlz7JOTor8WiN/s0lCYbcqAi98
         7mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790415; x=1754395215;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4/83bWvjHcitzad3pCSz+7Zeg+jLiSHIOrBXMY9vQM=;
        b=sVDfFIW8dctbvM4qSzYFsRj1tPx5fEN5mU9Thy1f874DqgkWIsI1orSUAeBcd8TXle
         dIcqDHSQZwe7W+GUQRpByMXsM2BSUkErKJ8ZJPJkgGxuwIzQ8zHCnfgI/bg98AfddzyA
         aBnKq5UdrC3DMf6cbYUIfO7nZYDhkkVO8Ruc2u/KZ/rmPN9D3rNnJMh/KeFpr1fUp4yQ
         QD46V5rWrflf1YEJCQlh9SpiyEB6vyBdEZfAvv6SrxvbAWqZAxHTRx9+/XoGsBY1wLro
         1YecrvmY5hSwY4yIGqvY/BCyybzj5zlaMeZGxQHx8MUvDUKPZw3Ht2AcCAagOStzqV59
         SAaA==
X-Forwarded-Encrypted: i=1; AJvYcCUvearqqlrWFG8q6bEGIVCsqpPBqPOr/jR7RWQBl8tfOxdsR3++sCU/scsuXTfhMy6apTQgUaGDqCeSYzOtUxj6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9jcpqMSJnOp8TLruRXwpbIiyOqyx4OXcgrZ3fFPc+GG37glL7
	fbHBWt7SUnJmdnEolqujx3FIWmkagwEnp7KI+kJDatwjyq+r7F8g9lSiyz7m2wEuSCmO6O8yzJ6
	UEA==
X-Google-Smtp-Source: AGHT+IGueddsxal2939hNo7/TPjZYhCrBcl985PmCzKbFXvauW9HgNNhAeG9APmfm40qlT6512r7nhK46g==
X-Received: from wmin6.prod.google.com ([2002:a7b:cbc6:0:b0:456:1bf2:2be2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f09:b0:456:1a69:94fd
 with SMTP id 5b1f17b1804b1-458855d3dbemr80179995e9.0.1753790414777; Tue, 29
 Jul 2025 05:00:14 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:05 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-1-tabba@google.com>
Subject: [PATCH v1 0/8] KVM: arm64: Reserve pKVM VM handle during initial VM setup
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050017_157857_7085CDEF 
X-CRM114-Status: GOOD (  12.05  )
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

All VMs in pKVM identified by their handle, a unique per-VM ID. This
handle is shared between the host kernel and the hypvervisor, and used
to track the VM across both.

In pKVM, this handle is allocated when the VM is initialized at the
hypervisor, which is on the first vCPU run. However, the host starts
initializing the VM and setting up its data structures earlier. MMU
notifiers for the VMs are also registered before VM identification at
the hypervisor, which rely on the handle to identify the VM [1].

Additionally, in the future, the host needs to communicate with
TrustZone about the before the VM first run. Therefore, move handle
creation to when the VM is first initialized at the host.

This patch series is divided into two parts:

- Patches 1-4: Renaming, refactoring, and tidying up to lay the
  groundwork for moving handle initialization and to fix existing
  issues.
- Patches 5-8: Decouple handle creation from VM initialization at the
  hypervisor and move the handle creation to VM initialization at the
  host.

Based on Linux 6.16.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250303214947.GA30619@willie-the-truck/

Fuad Tabba (8):
  KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
  KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
  KVM: arm64: Clarify comments to distinguish pKVM mode from protected
    VMs
  KVM: arm64: Decouple hyp VM creation state from its handle
  KVM: arm64: Separate allocation and insertion of pKVM VM table entries
  KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
  KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and
    initialization
  KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()

 arch/arm64/include/asm/kvm_asm.h       |   2 +
 arch/arm64/include/asm/kvm_host.h      |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h      |   1 +
 arch/arm64/kvm/arm.c                   |  12 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  14 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 177 +++++++++++++++++++------
 arch/arm64/kvm/pkvm.c                  |  76 +++++++----
 8 files changed, 217 insertions(+), 74 deletions(-)


base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
-- 
2.50.1.487.gc89ff58d15-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7645C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTjCHNALhtJm9kkINHAhPaKfRIpf+UugZZ6g0+G4iFA=; b=Bbd6ItYJK+Se+bL5MovIF8OlQY
	o9Fom9mtQRyEkPajXyBNC6IF/3oE/+f44CL/omXQnpVvx4iCH4D3sJz2QrbuuyRa6jwGzJqwXncom
	cbX3Rko6u/M0bp2H53uxs8C6qDOmJHhs36W7FD10DgtikaZM+yPetO0r6/Tuep/EgLznlIC8VrrW3
	MyD9OWQ6/ZxKjGQM8qkCbm6tIt38IvpmDBsPmz6FGuNxNBld6mqCXQVYSd12WgVlK4YSv6k4YO4HY
	VgIEVXiY/oDkQ//ZfNIm8NdYsyTuyNEHU9Bs4nrDyXYucH2x8mW4ljlx67TB7xG/3AyXrZtv63reu
	DgUeraLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieTX-0000000CKiH-2PH6;
	Thu, 13 Feb 2025 19:02:15 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaO-0000000C8cR-2BQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:17 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-727063ace2fso368920a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469915; x=1740074715; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTjCHNALhtJm9kkINHAhPaKfRIpf+UugZZ6g0+G4iFA=;
        b=t0B+Xi/HcRid1E2eLVLktKmsXc3qRdDUFpq8+ctEHT70HElWnuD7sgdp2uE2QqNV/V
         664XwPWNEaicblYnh9vSKTBpWg7MKv3YvtMu2VbG1wNj35t2QCmFdOGxHYfRc5xrf9Qw
         WY/O2ptq606LQMRXiZyWRirU4fRHO3YurjWpxmiopPbKliIf88Vtv3icMGOEvP2gZrp1
         KEcB/ytYBg9JJ6xRppSRXbG8luYcVefGQmpZC0Mi2GPg4y4hvluQ9Y8AzXlAl8NELyJc
         0IK712CfYtcciLtU5RIYZQKA3F0ivGGmflIW+lqZRZa5iZxHfRSyQ0301rkmnyEdSjqF
         DJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469915; x=1740074715;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTjCHNALhtJm9kkINHAhPaKfRIpf+UugZZ6g0+G4iFA=;
        b=eL33NAZZW0WkIghiTBi0WajvFCtZYrIIf/jufeICgrXLjycuu2Zz6Of72KULTQOECg
         8aKIFBnies6dA0R6s7h5SLPNnYdsDmIFGcVX21q0WvNPKOaQ9Ry44EhOajqNwnawEjLk
         hW+j2CL50hVxq3CHRmS6kM74sRqK11qUdR43JC97Ht8fyeCUE/MEatewK3OfbY4sf1CD
         i6U0w9mu1LqfJ4TQtL3DjyTwu00tCc1rFgilSmhwnpHannPYJg5gmu0ajIlLyjJ3DNK3
         YZEI+EAZfVPfunqvnZwK6DqvNwuV99cLsg5G0rCJscuVsAxyn95IeVB6Y0X+qaAwF4uq
         nHbA==
X-Forwarded-Encrypted: i=1; AJvYcCWkX3LrR1zGyfnbPZn1MaVugxj4XzyiUNwz6fChkzjIqc5cAoq6vnkH33Rmb7qpFtSzJb5FnJROcwjSqRpCkVQX@lists.infradead.org
X-Gm-Message-State: AOJu0YwbkPwKzOeJvuJRsIud1DFMugpxKBVjqfFrOiW0jagGNceXuMJU
	wFBTEj6FwWqDlMd6aYr+5vXK39eKMavvFKfptzm4mACrna+2axzR/hVXZ1hctzdiCJMPzp6UhL2
	0xzcSECgbYNywP/bvlqNtWw==
X-Google-Smtp-Source: AGHT+IGskVqY6i9bRXfX/e76DJqFlexfmJ+792ViVNAj9Su+9gvc9IWKEbkYdQXuRHWIlqliVBeP0nYN3f0kCSEvKQ==
X-Received: from otbcv2.prod.google.com ([2002:a05:6830:6882:b0:71d:f81f:c595])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:410a:b0:71d:415a:5d18 with SMTP id 46e09a7af769-726f302e609mr5209306a34.3.1739469914886;
 Thu, 13 Feb 2025 10:05:14 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-1-coltonlewis@google.com>
Subject: [RFC PATCH v3 0/8] PMU partitioning driver support
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100516_558571_7501F93C 
X-CRM114-Status: GOOD (  18.26  )
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

This series introduces support in the KVM and ARM PMUv3 driver for
partitioning PMU counters into two separate ranges by taking advantage
of the MDCR_EL2.HPMN register field.

The advantage of a partitioned PMU would be to allow KVM guests direct
access to a subset of PMU functionality, greatly reducing the overhead
of performance monitoring in guests.

While this feature could be accepted on its own merits, practically
there is a lot more to be done before it will be fully useful, so I'm
sending as an RFC for now.

v3:
* Include cpucap definition for FEAT_HPMN0 to allow for setting HPMN
  to 0

* Include PMU header cleanup provided by Marc [1] with some minor
  changes so compilation works

* Pull functions out of pmu-emul.c that aren't specific to the
  emulated PMU. This and the previous item aren't strictly
  needed but they provide a nicer starting point.

* As suggested by Oliver, start a file for partitioned PMU functions
  and move the reserved_host_counters parameter and MDCR handling into
  KVM so the driver does not have to know about it and we need fewer
  hacks to keep the driver working on 32-bit ARM. This was not a
  complete separation because the driver still needs to start and stop
  the host counters all at once and needs to toggle MDCR_EL2.HPME to
  do that. Introduce kvm_pmu_host_counters_{enable,disable}()
  functions to handle this and define them as no ops on 32-bit ARM.

* As suggested by Oliver, don't limit PMCR.N on emulated PMU. This
  value will be read correctly when the right traps are disabled to
  use the partitioned PMU

v2:
https://lore.kernel.org/kvm/20250208020111.2068239-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20250127222031.3078945-1-coltonlewis@google.com/

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/pmu-includes

Colton Lewis (7):
  arm64: cpufeature: Add cap for HPMN0
  arm64: Generate sign macro for sysreg Enums
  KVM: arm64: Reorganize PMU functions
  KVM: arm64: Introduce module param to partition the PMU
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: selftests: Reword selftests error

Marc Zyngier (1):
  KVM: arm64: Cleanup PMU includes

 arch/arm/include/asm/arm_pmuv3.h              |   2 +
 arch/arm64/include/asm/arm_pmuv3.h            |   2 +-
 arch/arm64/include/asm/kvm_host.h             | 199 +++++++-
 arch/arm64/include/asm/kvm_pmu.h              |  47 ++
 arch/arm64/kernel/cpufeature.c                |   8 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |   1 -
 arch/arm64/kvm/debug.c                        |  10 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       |   1 +
 arch/arm64/kvm/pmu-emul.c                     | 464 +-----------------
 arch/arm64/kvm/pmu-part.c                     |  63 +++
 arch/arm64/kvm/pmu.c                          | 454 +++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     |   2 +
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/gen-sysreg.awk               |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      |  73 ++-
 include/kvm/arm_pmu.h                         | 204 --------
 include/linux/perf/arm_pmu.h                  |  16 +-
 include/linux/perf/arm_pmuv3.h                |  27 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c |   2 +-
 virt/kvm/kvm_main.c                           |   1 +
 22 files changed, 882 insertions(+), 704 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_pmu.h
 create mode 100644 arch/arm64/kvm/pmu-part.c
 delete mode 100644 include/kvm/arm_pmu.h


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
--
2.48.1.601.g30ceb7b040-goog


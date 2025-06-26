Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A265C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ty9Yky/2YRmZBC/kRaxnlFXhTAWNXxw17qo7VWYFUnw=; b=iv2NzYEEjioZZtj9BP8EHYgdc9
	FxQpdSxjP4802muhVGaWiqFyt0vkcwSn7NMyPbr1hza3DbdWk2ss0j2gfF8vAknx1KoyrvpJBtp/W
	xD6rsm0zVdGZ6IXvoi/PrY/kkI5EKWpFIsYWxM4yVJtjDt3c5jjbT8pPldcjPCj+XHkPGwvNovmdr
	dfqKOOznWblKxvG3NTRW0swNkTDp/MBNeXOK2ZtD+hf9kdh2j/RoioCPCbihse40rcuxcT4JDPRH2
	cqecbdBMhXk0IPij8lvSY78AJ7yQsOdb4WTwHC8vhyRAwvX2WTPS3RyL1AnBV10TU5KqWzaVGVEhY
	NHgTrCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaGZ-0000000AK60-0PtO;
	Thu, 26 Jun 2025 00:14:59 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaEA-0000000AJgx-2twK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:12:32 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-740774348f6so341783b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896749; x=1751501549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ty9Yky/2YRmZBC/kRaxnlFXhTAWNXxw17qo7VWYFUnw=;
        b=YTY8VXP2aWUsLXfetIg67IfJMctNuqChmWS5fm/HJCxph0zdY1Vvk+gPGznaatGq1Q
         RvsVCEtjuIiU1KgmBIQuKyLXwplCAZVb6dxgMp72C/EYTD0UO3jT4/2cZaIcHWoywz5F
         8ePB7AhXV6Ulq49WmQ3WTAY+cpoqV82ejHkJIsbpeVx9SnqtK080gEw8u3eazIYDdc+J
         Isz2CE0QTm62xTR0T6k3OmlYD291Uk+uZTv/cTW3RE0Skv5dzaooPAqnrg2O+qi5ztA5
         Gqy/BM+AVMuixju3cEB8AtNQND1V6MGMSqHTuym13gAddEcSioLLnbLmEDQ8nAzpTrVH
         F08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896749; x=1751501549;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ty9Yky/2YRmZBC/kRaxnlFXhTAWNXxw17qo7VWYFUnw=;
        b=bRrHsUe4ra1ArX6Z916LhnCiF5gie1k1HsuP0vM6CtX6awcbv69nh1wc78Piv9UG+w
         DqMeKfWq5ixF/3raey7D7L897HV8Wz0lMzwADN3GEr/tWh6RHj55LCqWuCxqV3dbkarW
         XRUJOIWr4ZLNAfdefZsLfzYbjIoohWBD0PA2kVwEs8jq572qt8zXIJpHDRl712gLRJw8
         DJqhnDpYliBy47SJYJeFQ+eUbYYX0SKcjS5zGH5bUUjNuNGxLrGK0wWF7AcCnM0oXbU8
         oIabWMlMDn7Q+Ntfg+O5QScLKyU37pIw0TL7VB/U0+iPSi/ulKsDh989DbPBYGhRUGGO
         uH2g==
X-Forwarded-Encrypted: i=1; AJvYcCWYoPxfgVZ1IH35EB6D/+vHQ1oZ/LQIF+0Fw+7NfrSIfirBuaBABBR/N0F9bC9WpbWi28Y0v7OqNHhqc/O8EZBq@lists.infradead.org
X-Gm-Message-State: AOJu0YzFdZ40CKCovT8Mza59OibEauv/ZWbhAJdNfJgXnIaIyRnyuXeE
	R9pDRIpKelTZ86QAmnNa+DxIjfGh5zNJsts0x0Lr5Lo4Olj7q2fnXOgcaSU4ng7e1DVWohjAwdT
	cL3aF6A==
X-Google-Smtp-Source: AGHT+IF8TpcPM4+ngzfFRwoy1CLwhMuA7U208BIrPiA30EGA+J604Zlx0v8xnfd75p/sgB3YCcwXzUB7EWM=
X-Received: from pfrh7.prod.google.com ([2002:aa7:9f47:0:b0:748:4f7c:c605])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1256:b0:748:f1ba:9afe
 with SMTP id d2e1a72fcca58-74ad4462128mr7447673b3a.4.1750896748834; Wed, 25
 Jun 2025 17:12:28 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:12:20 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-1-seanjc@google.com>
Subject: [PATCH v5 0/5] KVM: x86: Provide a cap to disable APERF/MPERF read intercepts
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_171230_729785_0EAEBFF7 
X-CRM114-Status: GOOD (  13.04  )
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

arm64 folks, y'all got pulled in because of selftests changes.  I deliberately
put that patch at the end of the series so that it can be discarded/ignored
without interfering with the x86 stuff.


Jim's series to allow a guest to read IA32_APERF and IA32_MPERF, so that it
can determine the effective frequency multiplier for the physical LPU.

Commit b51700632e0e ("KVM: X86: Provide a capability to disable cstate
msr read intercepts") allowed the userspace VMM to grant a guest read
access to four core C-state residency MSRs. Do the same for IA32_APERF
and IA32_MPERF.

While this isn't sufficient to claim support for
CPUID.6:ECX.APERFMPERF[bit 0], it may suffice in a sufficiently
restricted environment (i.e. vCPUs pinned to LPUs, no TSC multiplier,
and no suspend/resume).

v5:
 - Rebase on top of the MSR interception rework.
 - Support passthrough to L2 on VMX (it was there somewhat unintentionally
   for SVM).
 - Expand the selftest to cover the nested case.
 - Sanity check that the MSRs are inaccesible in the selftest.
 - Add selftests patches to expand the task=>CPU pinning APIs.
 - OR-in the new disabled exits in one batch.

v4:
 - https://lore.kernel.org/all/20250530185239.2335185-1-jmattson@google.com
 - Collect all disabled_exit flags in a u64 [Sean]
 - Improve documentation [Sean]
 - Add pin_task_to_one_cpu() to kvm selftests library [Sean]

v3:
 - https://lore.kernel.org/all/20250321221444.2449974-1-jmattson@google.com
 - Add a selftest

v2:
 - https://lore.kernel.org/all/20250314180117.740591-1-jmattson@google.com
 - Add {IA32_APERF,IA32_MPERF} to vmx_possible_passthrough_msrs[]

v1:
 - https://lore.kernel.org/all/20250225004708.1001320-1-jmattson@google.com

Jim Mattson (3):
  KVM: x86: Replace growing set of *_in_guest bools with a u64
  KVM: x86: Provide a capability to disable APERF/MPERF read intercepts
  KVM: selftests: Test behavior of KVM_X86_DISABLE_EXITS_APERFMPERF

Sean Christopherson (2):
  KVM: selftests: Expand set of APIs for pinning tasks to a single CPU
  KVM: selftests: Convert arch_timer tests to common helpers to pin task

 Documentation/virt/kvm/api.rst                |  23 ++
 arch/x86/include/asm/kvm_host.h               |   5 +-
 arch/x86/kvm/svm/nested.c                     |   4 +-
 arch/x86/kvm/svm/svm.c                        |   7 +-
 arch/x86/kvm/vmx/nested.c                     |   6 +
 arch/x86/kvm/vmx/vmx.c                        |   6 +-
 arch/x86/kvm/x86.c                            |  15 +-
 arch/x86/kvm/x86.h                            |  18 +-
 include/uapi/linux/kvm.h                      |   1 +
 tools/include/uapi/linux/kvm.h                |   1 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/arch_timer.c      |   7 +-
 .../kvm/arm64/arch_timer_edge_cases.c         |  23 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  31 ++-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  15 +-
 tools/testing/selftests/kvm/lib/memstress.c   |   2 +-
 .../selftests/kvm/x86/aperfmperf_test.c       | 213 ++++++++++++++++++
 17 files changed, 321 insertions(+), 57 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/aperfmperf_test.c


base-commit: 7ee45fdd644b138e7a213c6936474161b28d0e1a
-- 
2.50.0.727.gbf7dc18ff4-goog



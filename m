Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AolOsZu5isQ6acd/8wA384z0bhlwgTK8nhLOayCIhiU=; b=hbb37pSQ8ES5BXpY9qepmNhv8N
	0fUDz0/CjgmF92i2Mvn8urTpB6koJOCPoUO6ibNb1pWlmvbsCYw7VlMXDxvtzJ1zoz60QKCVVQlPE
	vxNYk75AnDwvvBc8sia5i4r6Cr63J8gZYzTry8kfGprZbgZqkdrBB9bGjO3C3q6R+6ElqagGSxVIY
	j+7cHF2rLikinelHCuPuftihBuY+OFcI8kQ1yHnIQDYFQBbZ+f2nSyoANV7dH9yTg3LfxqmaI/Lgi
	JKN3NuzdipEHxjlIxeotFR+W4RKneT7YNaBHWoLGrLtOJ6bVCv7Giyw7VrGeXtBMGBCYjHm7fg0fB
	dvskdbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nQF-0000000DAEd-2RvM;
	Fri, 03 Oct 2025 21:34:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nQD-0000000DADY-1N7r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 21:34:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e2b7eee0dso7695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759527275; x=1760132075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AolOsZu5isQ6acd/8wA384z0bhlwgTK8nhLOayCIhiU=;
        b=cEMrFflEh4HwH5f7j4zzn23CbpMI34e9byABJPg5sOOqKoWNmw2ycnxkJJ5yBavSeU
         pzE99JJ+0MeMSW9keSoKFVB4+Z8uNB8gbL8fRx0A+Oc1XzlP2rH3o0kzVlw4VX9Uv4ef
         lzeyocmoMJm8M8ludA0m67mHavPkbx8S8gai5dQp8PUottNRPeNOfMkuTb8N9CEBxzYF
         3LHnFpqpBKHfusa6Z798m0EGs3DeZ7OU7NxsnbQsYlJfXvQ+UcPqnR04qyff3wLKrPGr
         mAAat/XSlF9i/Zy6OdKqnK4Ci2H9Afc57Q1cMONgepDrjZKSNqjhwsa0Zuhz54mRsHj1
         iMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527275; x=1760132075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AolOsZu5isQ6acd/8wA384z0bhlwgTK8nhLOayCIhiU=;
        b=sYPsF6IEm1xH11WSiqvt+xta0+Zw8y9xV+UbIbqsq17uiZbZlaRmlR4wNNP88sgxYX
         IvsWGdk8npGdNb9lsjIfTXO55BGO5dLsvvAN0cKFMk/5Pahb53CqU0LIXLsVw3uWtbdk
         IwzPHRHrs93vMpVL6DrlPis86J7kHJ/RvwAO1Bpw2FeNId3tQsQIXiMO/byed+it2A7C
         WHXWRLWMQ8qHERKZMvzPNgXiXNGeOc/bo8BHXHMPixg3beAxKsVKN5VU4C+kQAw7V/21
         orWycXhwSl9acjbvWXG64iG5N459UozzdwCvdOPZxcnVydklYJJSTk8DhsiESnA5lEng
         n+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUpq6+tcW2fuIRlPGxO9vaW8bN5tLwe5u91VZhgUopXlidXI9UqfbG4lVGGuRg8oJtfzb7HzZJsUshh5cHAw7bV@lists.infradead.org
X-Gm-Message-State: AOJu0YyBuJPigzb5o3onXg+cm7ZcGmR7dzyJLD2N2oqFnoumNgEkNHfM
	vFx5nlU2LQXgySgWDM7Xg1D4EUu66/5PfUnQCWXNFdY4wUVhfXGvy4kwupJ0jaCVeGVOGNn6HsV
	leChXV3cMDd+sZhd0DH+ih6zxtD9h6msi/lKWs72H
X-Gm-Gg: ASbGncs4ofm7wK8ffchlHUO+XT69vrxN89Z/zZzG3e53oJsnHnDw9fWC6bVpS4oLYZJ
	n4eSx/qnLotfuZa70jQQvPtJXGpDUwhqrJHzeorRdM90Q8KF4VRHo6NEhcV5ModriTg5EZQEG7R
	RNuUMWBGvFM3VmirPeOgZvkRui8QRykfUsUkkMIPnCfU5+rln2j9dQHRXVGJ/ISyKTvGUy12W4e
	cjYCHlXCFPOJFba5hfk+rIn+9nyWI2q/AH1irmWcsWrMm4901h1YZWE2sc0AbQ5+5ymnLVZk6uL
	lTo=
X-Google-Smtp-Source: AGHT+IG+g888nHbRtas0R01E+jPK4UfBpLJ8GQnOWINQky6xv5HWVReEjuHHu18tH8G5o/mleUJVD+7aBJEJSt2Urkg=
X-Received: by 2002:a05:600c:8582:b0:45f:2e6d:ca01 with SMTP id
 5b1f17b1804b1-46e789ad00amr340925e9.4.1759527275228; Fri, 03 Oct 2025
 14:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250731205844.1346839-1-jiaqiyan@google.com>
In-Reply-To: <20250731205844.1346839-1-jiaqiyan@google.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 3 Oct 2025 14:34:23 -0700
X-Gm-Features: AS18NWC200qL2INhmKRcSigwRYSlRaKCFejFFI6CifV04SzXltQ6LUTRzublc7I
Message-ID: <CACw3F51QG70YpSfWaj_gQjAwoPcZ6uFa5dfd+Ave5PxQYDt-Ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_143437_410660_A390B69A 
X-CRM114-Status: GOOD (  30.20  )
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

Hi Marc, Oliver, and other upstream friends, can you help review this
patch series? I would really appreciate any comments and feedback.

[sorry for resending, as previous msg was sent as HTML]



On Thu, Jul 31, 2025 at 1:58=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com> wro=
te:
>
> Problem
> =3D=3D=3D=3D=3D=3D=3D
>
> When host APEI is unable to claim a synchronous external abort (SEA)
> during guest abort, today KVM directly injects an asynchronous SError
> into the VCPU then resumes it. The injected SError usually results in
> unpleasant guest kernel panic.
>
> One of the major situation of guest SEA is when VCPU consumes recoverable
> uncorrected memory error (UER), which is not uncommon at all in modern
> datacenter servers with large amounts of physical memory. Although SError
> and guest panic is sufficient to stop the propagation of corrupted memory=
,
> there is room to recover from an UER in a more graceful manner.
>
> Proposed Solution
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The idea is, we can replay the SEA to the faulting VCPU. If the memory
> error consumption or the fault that cause SEA is not from guest kernel,
> the blast radius can be limited to the poison-consuming guest process,
> while the VM can keep running.
>
> In addition, instead of doing under the hood without involving userspace,
> there are benefits to redirect the SEA to VMM:
>
> - VM customers care about the disruptions caused by memory errors, and
>   VMM usually has the responsibility to start the process of notifying
>   the customers of memory error events in their VMs. For example some
>   cloud provider emits a critical log in their observability UI [1], and
>   provides a playbook for customers on how to mitigate disruptions to
>   their workloads.
>
> - VMM can protect future memory error consumption by unmapping the poison=
ed
>   pages from stage-2 page table with KVM userfault [2], or by splitting t=
he
>   memslot that contains the poisoned pages.
>
> - VMM can keep track of SEA events in the VM. When VMM thinks the status
>   on the host or the VM is bad enough, e.g. number of distinct SEAs
>   exceeds a threshold, it can restart the VM on another healthy host.
>
> - Behavior parity with x86 architecture. When machine check exception
>   (MCE) is caused by VCPU, kernel or KVM signals userspace SIGBUS to
>   let VMM either recover from the MCE, or terminate itself with VM.
>   The prior RFC proposes to implement SIGBUS on arm64 as well, but
>   Marc preferred KVM exit over signal [3]. However, implementation
>   aside, returning SEA to VMM is on par with returning MCE to VMM.
>
> Once SEA is redirected to VMM, among other actions, VMM is encouraged
> to inject external aborts into the faulting VCPU.
>
> New UAPIs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This patchset introduces following userspace-visible changes to empower
> VMM to control what happens for SEA on guest memory:
>
> - KVM_CAP_ARM_SEA_TO_USER. While taking SEA, if userspace has enabled
>   this new capability at VM creation, and the SEA is not owned by kernel
>   allocated memory, instead of injecting SError, return KVM_EXIT_ARM_SEA
>   to userspace.
>
> - KVM_EXIT_ARM_SEA. This is the VM exit reason VMM gets. The details
>   about the SEA is provided in arm_sea as much as possible, including
>   sanitized ESR value at EL2, faulting guest virtual and physical
>   addresses if available.
>
> * From v2 [4]:
>   - Rebased on "[PATCH] KVM: arm64: nv: Handle SEAs due to VNCR redirecti=
on" [5]
>     and kvmarm/next commit 7b8346bd9fce ("KVM: arm64: Don't attempt vLPI
>     mappings when vPE allocation is disabled")
>   - Took the host_owns_sea implementation from Oliver [6, 7].
>   - Excluded the guest SEA injection patches.
>   - Updated selftest.
>
> * From v1 [8]:
>   - Rebased on commit 4d62121ce9b5 ("KVM: arm64: vgic-debug: Avoid
>     dereferencing NULL ITE pointer").
>   - Sanitize ESR_EL2 before reporting it to userspace.
>   - Do not do KVM_EXIT_ARM_SEA when SEA is caused by memory allocated to
>     stage-2 translation table.
>
> [1] https://cloud.google.com/solutions/sap/docs/manage-host-errors
> [2] https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@googl=
e.com
> [3] https://lore.kernel.org/kvm/86pljbqqh0.wl-maz@kernel.org
> [4] https://lore.kernel.org/kvm/20250604050902.3944054-1-jiaqiyan@google.=
com/
> [5] https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@=
linux.dev/
> [6] https://lore.kernel.org/kvm/aHFohmTb9qR_JG1E@linux.dev/#t
> [7] https://lore.kernel.org/kvm/aHK-DPufhLy5Dtuk@linux.dev/
> [8] https://lore.kernel.org/kvm/20250505161412.1926643-1-jiaqiyan@google.=
com
>
> Jiaqi Yan (3):
>   KVM: arm64: VM exit to userspace to handle SEA
>   KVM: selftests: Test for KVM_EXIT_ARM_SEA
>   Documentation: kvm: new UAPI for handling SEA
>
>  Documentation/virt/kvm/api.rst                |  61 ++++
>  arch/arm64/include/asm/kvm_host.h             |   2 +
>  arch/arm64/kvm/arm.c                          |   5 +
>  arch/arm64/kvm/mmu.c                          |  68 +++-
>  include/uapi/linux/kvm.h                      |  10 +
>  tools/arch/arm64/include/asm/esr.h            |   2 +
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../testing/selftests/kvm/arm64/sea_to_user.c | 327 ++++++++++++++++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
>  9 files changed, 476 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c
>
> --
> 2.50.1.565.gc32cd1483b-goog
>


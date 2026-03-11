Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326621049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpltYrqI900oLO2+c+Mia5fE0FAYeJkzONbbl9ulaVs=; b=mCi1cpezByX6Nc6JFn8LoZktUP
	+fon4Tfol6bSBLqNJGTp7wSsx7tGoTbF+Lw5sOYKLAZvhhxbv3AdVI9QheSqbTXmBEgkRUuywLeKC
	aTQeP9CzamEtA9K1y8YEfVyYKug1x1pCEKqww3qHb8f+A6LC9uVaBptFAXfDfG7NuFOlzDAYU9p+f
	9bHW9adBN9/Iy6SlCNyqRFz18m7mFbEcvFrt5aqMD4jQdL3I+/WDO1VV3qgPUbRTNGbDn9GdpASYA
	g80flcnjClX+rOD+UGllLqga8fj+HmLDz4gw3NqgS3ZZalPf50Aob7FqjtkyXpEl6sYNPQq1riReF
	ACffG59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Glg-0000000BQ4h-077p;
	Wed, 11 Mar 2026 10:26:20 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gld-0000000BQ46-2eiO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:26:18 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50906a98ffeso522261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224776; cv=none;
        d=google.com; s=arc-20240605;
        b=abj4vcj/HeXsrjGb3fe3bfIQszlP+gOPuxtAzk2tXRlcm8/xcddbCrYKA3XcQbKBrU
         u5DtFItVVWWZiJjZ9Xd1hiW8R2cNCGeDL5to5UfkVU5SjL5UP+scY0EQDmWyom/Hz9zy
         ynZjn+X/K50Segz4yd2gYJRMqhxwdWmtTs2TFYz6pvMOndez/4NtKg3Ek6NTdImMUQpu
         T47gsnhNmN9LwkSAUiQP5EZi1nwogUeHDYLH8NEMtLO4PlrX0HrIkgilwtq+SXsNItm1
         DZ8SKYCWPO0L+a88AJt2Vwme2GuNn5JMmV2wCOuhsTFQET24CeNNWWwHt1m2ksV6m+79
         hMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WpltYrqI900oLO2+c+Mia5fE0FAYeJkzONbbl9ulaVs=;
        fh=Fm3FDEJ5UDvo57vbvURnnV+tY8v/GyjNey78J3X89pg=;
        b=TjECgnyhlgb00aKSHYQgV2G4+zgNuQ63TyCkLWeitZt24ac7SwNhsliNnUWlY8rlAi
         Yk2RLdPIoqv9ueLIF/gDQPyQi0pBYERLrR8Twx2Itsk98t20gIFRCssjtfXujBr3LPf7
         In/aYdah2I4Zul/NwJldRTfXqsA2EMJ+WvbOIk+u7fHH/4a+ez98BsS7D1ZS0+UFpleU
         UX6/tIQwtV+Kbt+dUScf+r7Y92yOvpX0MSQKB9bhasJxa5VvrNudAb1mEYQdOd6YCXm0
         aSnXCHeWtbzRmwy4BjrZUuvSsXfh5jgfgQkFc8F6i6C69k2mztS2H9fNY6NG+z8EF962
         dljQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224776; x=1773829576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpltYrqI900oLO2+c+Mia5fE0FAYeJkzONbbl9ulaVs=;
        b=h16Bq7ONBjcDamq+Kx82Lz2iEu4/WGVHmWcJuLaQxaz37qkMzWZwqppmb3RfDMuAzf
         RlY5WNAfl3j97druF8cbf5Ny7hMuLlQU+y2L7pc7ggAlzWsyfkwvh+euYmpSC8gaifrZ
         C+v9BCYKP0P/yDTfN6qFzElLVthKwHaHf5UFQwXUnh9x2toNM2uTCtraDTlA3rAUu6Ce
         76SMeufd5ZyTE5qILUcsmAVjuCV+haQ7OReMOyVUbFlr1c61NT2MeznpGKdEIPOuEh1w
         q/LmVMGnLAoSb8Mx1VC+tdNbj7t2jMNmSAxR28/nCmqn+ZSFvIVr6IQxRByLMV2Nw7Yr
         1tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224776; x=1773829576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpltYrqI900oLO2+c+Mia5fE0FAYeJkzONbbl9ulaVs=;
        b=p/VuCDwKlsmdNI7FdAWLqQdHZwzmj9ZIXIbLvDRucoVMNHh3ZuJZYpa6zwoYQ0kfxA
         TjTClU9XcGFC+cta6peCjkEuIEoFFcc7dO903wzTMkTnJiAZSaLSLIO0oG+fCXIh2qEN
         JoCEQh+O5lEvthiSgTAPf0CjhJa95tuqtz4XMTtpLH2dOIZr3IGvwO03MCSymmRwfxPe
         THGSvRrLY3m74YeTqYFZFjwYtUs9mNkInyeakQoealciaZ29bl88x1ik2xlnh3HI2eMB
         laD8mvpBDkvNhyHNbQOYkWWjt/85Tqc7yD6sF8kPJpq8NY7x09hLlF4hybiMzzox2dE6
         XcOw==
X-Forwarded-Encrypted: i=1; AJvYcCU++OhpXzFEO3sR02acGZA+Jeo3w1LTkImwVc/jTb6+wsIGsRpRnXgf8DsnTh6efVIGI1CiKwMrLrCN1XP96Jqk@lists.infradead.org
X-Gm-Message-State: AOJu0YwhovcIsnpFBiCnNAWQBI86j4GLbXxWpvCcXyU3B29nnG8XE9DZ
	74J4gcsmndFd/mYmKGoDvu0OkgH9gwI8Yll+i8exENe6uE8Zk6CSLH1wUa+K4h4mUtDCNjeHvFD
	niAkSC3Y4cXUujIAl08CujWUshtvCzJ8OmbAS1GHI
X-Gm-Gg: ATEYQzyvSmvYdYl1vGi9Rrj0pTRF2UpLadawf2jPG58GCEJtG0mLEO3uo7BnIMBFbAJ
	DG5WbhFz6oVcg5LXCqF2h1zp52bGeYGx9tW9m1hlNRxRYPDYLRgzydwNfkf1aTTmPKSkjUtxT0B
	9bPXkdcknJn0mFRXHzonvkbkCybAXC86u7xuSL8hVjzrfoRMgrjq3ME8f6GsDm/7Mb97+NLMHq+
	EmgIT3sA+cYq8jYM7YLZ2LV+8nKhrwy1M+TZOraIrQrKunD0n0fPGJXUn5XQzYDZbRR3bEvlboS
	iklhq+eGiE4PWxNDVprFeP5BGJlIDdnL7K12Aw==
X-Received: by 2002:a05:622a:c9:b0:509:208f:3876 with SMTP id
 d75a77b69052e-509382cc3e9mr11000291cf.18.1773224775604; Wed, 11 Mar 2026
 03:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-32-will@kernel.org>
In-Reply-To: <20260305144351.17071-32-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:25:38 +0000
X-Gm-Features: AaiRm53cCc9AyEq5QAjsIdDAy2W7kWDmuADjtYNUVtV6GRZJQapB8eqkdi0jMXw
Message-ID: <CA+EHjTwk8c0RGqCLJFRr0PeyFtOzsjmbab33tLZPfBJhdPqtFA@mail.gmail.com>
Subject: Re: [PATCH v3 31/36] KVM: arm64: Add some initial documentation for pKVM
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032617_692852_B431462D 
X-CRM114-Status: GOOD (  37.95  )
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

On Thu, 5 Mar 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
>
> Add some initial documentation for pKVM to help people understand what
> is supported, the limitations of protected VMs when compared to
> non-protected VMs and also what is left to do.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  .../admin-guide/kernel-parameters.txt         |   4 +-
>  Documentation/virt/kvm/arm/index.rst          |   1 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 103 ++++++++++++++++++
>  3 files changed, 106 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/virt/kvm/arm/pkvm.rst
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..c14d80204f88 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3246,8 +3246,8 @@ Kernel parameters
>                         for the host. To force nVHE on VHE hardware, add
>                         "arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
>                         command-line.
> -                       "nested" is experimental and should be used with
> -                       extreme caution.
> +                       "nested" and "protected" are experimental and should be
> +                       used with extreme caution.
>
>         kvm-arm.vgic_v3_group0_trap=
>                         [KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
> diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
> index ec09881de4cf..0856b4942e05 100644
> --- a/Documentation/virt/kvm/arm/index.rst
> +++ b/Documentation/virt/kvm/arm/index.rst
> @@ -10,6 +10,7 @@ ARM
>     fw-pseudo-registers
>     hyp-abi
>     hypercalls
> +   pkvm
>     pvtime
>     ptp_kvm
>     vcpu-features
> diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
> new file mode 100644
> index 000000000000..8258c93bed6e
> --- /dev/null
> +++ b/Documentation/virt/kvm/arm/pkvm.rst
> @@ -0,0 +1,103 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================
> +Protected KVM (pKVM)
> +====================
> +
> +**NOTE**: pKVM is currently an experimental, development feature and
> +subject to breaking changes as new isolation features are implemented.
> +Please reach out to the developers at kvmarm@lists.linux.dev if you have
> +any questions.
> +
> +Overview
> +========
> +
> +Booting a host kernel with '``kvm-arm.mode=protected``' enables
> +"Protected KVM" (pKVM). During boot, pKVM installs a stage-2 identity
> +map page-table for the host and uses it to isolate the hypervisor
> +running at EL2 from the rest of the host running at EL1/0.
> +
> +If ``CONFIG_PROTECTED_VM_UAPI=y``, pKVM permits creation of protected
> +virtual machines (pVMs) by passing the ``KVM_VM_TYPE_ARM_PROTECTED``
> +machine type identifier to the ``KVM_CREATE_VM`` ioctl(). The hypervisor
> +isolates pVMs from the host by unmapping pages from the stage-2 identity
> +map as they are accessed by a pVM. Hypercalls are provided for a pVM to
> +share specific regions of its IPA space back with the host, allowing
> +for communication with the VMM. See hypercalls.rst for more details.
> +
> +Isolation mechanisms
> +====================
> +
> +pKVM relies on a number of mechanisms to isolate PVMs from the host:
> +
> +CPU memory isolation
> +--------------------
> +
> +Status: Isolation of anonymous memory and metadata pages.
> +
> +Metadata pages (e.g. page-table pages and '``struct kvm_vcpu``' pages)
> +are donated from the host to the hypervisor during pVM creation and
> +are consequently unmapped from the stage-2 identity map until the pVM is
> +destroyed.
> +
> +Similarly to regular KVM, pages are lazily mapped into the guest in
> +response to stage-2 page faults handled by the host. However, when
> +running a pVM, these pages are first pinned and then unmapped from the
> +stage-2 identity map as part of the donation procedure. This gives rise
> +to some user-visible differences when compared to non-protected VMs,
> +largely due to the lack of MMU notifiers:
> +
> +* Memslots cannot be moved or deleted once the pVM has started running.
> +* Read-only memslots and dirty logging are not supported.
> +* With the exception of swap, file-backed pages cannot be mapped into a
> +  pVM.
> +* Donated pages are accounted against ``RLIMIT_MLOCK`` and so the VMM
> +  must have a sufficient resource limit or be granted ``CAP_IPC_LOCK``.
> +  The lack of a runtime reclaim mechanism means that memory locked for
> +  a pVM will remain locked until the pVM is destroyed.
> +* Changes to the VMM address space (e.g. a ``MAP_FIXED`` mmap() over a
> +  mapping associated with a memslot) are not reflected in the guest and
> +  may lead to loss of coherency.
> +* Accessing pVM memory that has not been shared back will result in the
> +  delivery of a SIGSEGV.
> +* If a system call accesses pVM memory that has not been shared back
> +  then it will either return ``-EFAULT`` or forcefully reclaim the
> +  memory pages. Reclaimed memory is zeroed by the hypervisor and a
> +  subsequent attempt to access it in the pVM will return ``-EFAULT``
> +  from the ``VCPU_RUN`` ioctl().
> +
> +CPU state isolation
> +-------------------
> +
> +Status: **Unimplemented.**
> +
> +DMA isolation using an IOMMU
> +----------------------------
> +
> +Status: **Unimplemented.**
> +
> +Proxying of Trustzone services
> +------------------------------
> +
> +Status: FF-A and PSCI calls from the host are proxied by the pKVM
> +hypervisor.
> +
> +The FF-A proxy ensures that the host cannot share pVM or hypervisor
> +memory with Trustzone as part of a "confused deputy" attack.
> +
> +The PSCI proxy ensures that CPUs always have the stage-2 identity map
> +installed when they are executing in the host.
> +
> +Protected VM firmware (pvmfw)
> +-----------------------------
> +
> +Status: **Unimplemented.**
> +
> +Resources
> +=========
> +
> +Quentin Perret's KVM Forum 2022 talk entitled "Protected KVM on arm64: A
> +technical deep dive" remains a good resource for learning more about
> +pKVM, despite some of the details having changed in the meantime:
> +
> +https://www.youtube.com/watch?v=9npebeVFbFw
> --
> 2.53.0.473.g4a7958ca14-goog
>


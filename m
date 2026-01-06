Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDEBCE9D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=recndSpVRxacMOc/NQ+rqHcm8FvHHulQC7DjT4UhT8s=; b=H5ccO+ReyU5uPFmy7Xf5bW0qxD
	rpsHyGzdy5spqSk6x8Nl4PDtdpGSPtS76T9zaTliz2HTSvgGhbfaWz+jv9NWxcACKexO4rk99O7MZ
	4TTTy0xXqBMn4qaFXRifIf4dvZjtLfNWhqfEyXaswzOpqxzN9AnutSIRzAd1zeurFp/PdFXvsEbFO
	UR76P5+qD9ql7M94+eHsiMrE8I0h34+RG3e6+fidI8jJskwgfGT20BINLimJjcCO8TzahqGvq5FKi
	ObK2EZ3YA2xlMk2TE9dzjpHUEODnVmtcba4r+HxLfO9ZhXpGFF04g0WCKJXNCHvjx4T/WwGa6thRO
	WQ94VsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9TF-0000000DRjY-3axo;
	Tue, 06 Jan 2026 15:59:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9TC-0000000DRin-2giS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:59:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so9980755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767715181; x=1768319981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=recndSpVRxacMOc/NQ+rqHcm8FvHHulQC7DjT4UhT8s=;
        b=bUdnFZrxLEVLNnMuhmHL7r+04bebSrBidSusQugo7wl0ew4WymM3tzOd+BCQNQyZuW
         HKnN9zwIKQVqRiEaAoZTOa401V86E5QYto+MGz73INr1Rjjef1gEpabK/IDtJ2WF1lTb
         D7vpmreWHkN2th3a6gV0z2XCLwN0KIxpjZaqKL+UGUIfuLBZVvCoZRtSRcqaSV+mXm/2
         gxfCiRoB2QPbxUzgq0nsV1CfM4IICX0En6yMDuqj7JRcnkstmXAyjOqJpimMbx8wNrkc
         JWLfBh6O76DvyNkKlgUOyADYa9mDNcQNJzgemOFVn1erOWuxcNOXp4+BUTALZhD4HxwI
         mvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715181; x=1768319981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=recndSpVRxacMOc/NQ+rqHcm8FvHHulQC7DjT4UhT8s=;
        b=WD+GciJ+REPN6mrD1/JrsxNVSrnbU5VFvh9VARLWF2+dSRn+FRuU59rCIpAKOQ+Gqn
         A6P0AZBfHl/MV5WpRGOxCiijUjqCdTCmK/goxrqI0GGC0N8PEgfa/bZvf3qC67jLuFip
         I1ww0B0xNOn4KtJ8gRe+LFr54vCWxxzbw59XAbihziBmqI6CH7PrG3PXvVBGh1UeJ3RD
         BUdYNlOZlt4T9f0/h3IeLh+xIgR8Qh4vDZzTfXWiq9lHKG0AooOmisM/vLt7DRG/kg+J
         a0ud94s57xFmIxfXYa1TWkLWdC+beeXSQh6UTdkyequMAXhVPNzv7TeXekgcrL/OhPr4
         dEsA==
X-Forwarded-Encrypted: i=1; AJvYcCW7facLkjAH763pBDnHiYSGUfes5K1BOG5hYfDWUKT+XAGcfRqFFCfi26LZDYLmv2fb1PKs1o2kqLlVISlcp/hO@lists.infradead.org
X-Gm-Message-State: AOJu0YzyEXOBe3F7DODORPa8oeU39Ic8MWOGr8BB74CJ7gQJogjwkxRx
	dBCkE7ZxbkHV+8nLGmal19RffqjahuH2gxbNQNYo8mZ76bBcK5M1O65aMv8SFdf1uw==
X-Gm-Gg: AY/fxX6BUcIWFjI+hJHIvcUeT3TL/xgUOfaMnOJ8p11Kwv5uYf/7z5d0PJ/8UJH5sP9
	Fc/MCh2xsYRpcL4503NU7lwGEKxktl40vNFvNGB4HHDLjV6A/M/oft4f2XU9fIhJjkUmXBrzeNU
	/Y7T1fnXGWBf5I58V6Rfk8LIQgpEwRFEPcCuBeiYgEEEC/PfXIiOOk8x4MBKxQAbTfN7wBsjI3r
	WXoc0bKuLXcHQ4h8TnEVCmQsaWDM+o+X8bxv/OXvQSJcGwqsAW7xUwkKOsyetlWRC9M3u7ii2PF
	Yj567p4m01HAPkLY32i/kWFNWfCABXyTCdXR5uZpe0dG3IMpyXm8yMqimpXzzMcPklo29MYE6cB
	FRIadje9d19pLzF0eDgEJaBROoZyk588zs39jW/NByj23o89LMOyOr32LmxGIJJ0+Uu+av5WR43
	hBHVSzxCtkHIy1XZQjKT6DjkA+nUBAYGDzhkGfF5ww84hggqS0RQ==
X-Google-Smtp-Source: AGHT+IHgQG4n6bkU9UNc+S3Rf0s0cs9v/rYkSfUX4JjXBVVvp3ClgsYmai2b+ZGXIe7uEjuKIwHjXw==
X-Received: by 2002:a05:600c:a108:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47d7f36e2abmr28330165e9.14.1767715180422;
        Tue, 06 Jan 2026 07:59:40 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm5090628f8f.42.2026.01.06.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:59:40 -0800 (PST)
Date: Tue, 6 Jan 2026 15:59:37 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 27/30] KVM: arm64: Add some initial documentation for pKVM
Message-ID: <aV0xaa8MpsmxMMkL@google.com>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-28-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-28-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_075942_720796_8CD6EFD1 
X-CRM114-Status: GOOD (  39.25  )
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

On Mon, Jan 05, 2026 at 03:49:35PM +0000, Will Deacon wrote:
> Add some initial documentation for pKVM to help people understand what
> is supported, the limitations of protected VMs when compared to
> non-protected VMs and also what is left to do.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  .../admin-guide/kernel-parameters.txt         |   4 +-
>  Documentation/virt/kvm/arm/index.rst          |   1 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 101 ++++++++++++++++++
>  3 files changed, 104 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/virt/kvm/arm/pkvm.rst
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a8d0afde7f85..9939dc5654d2 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3141,8 +3141,8 @@ Kernel parameters
>  			for the host. To force nVHE on VHE hardware, add
>  			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
>  			command-line.
> -			"nested" is experimental and should be used with
> -			extreme caution.
> +			"nested" and "protected" are experimental and should be
> +			used with extreme caution.
>  
>  	kvm-arm.vgic_v3_group0_trap=
>  			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
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
> index 000000000000..1882bde8cc0b
> --- /dev/null
> +++ b/Documentation/virt/kvm/arm/pkvm.rst
> @@ -0,0 +1,101 @@
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

Perhaps worth to add that there's no runtime reclaim either so the accounting
will only grow until the VM is destroyed?

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
> 2.52.0.351.gbe84eed79e-goog
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4513CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdHHVHX1eK4OumztheWLpvPpWCbLWAPVj4gP9BXPPI8=; b=MXUUCT2b5arLj5ONksg6cPMpX2
	9e41nASP9XrIduLpl2qyqe9Yum1Nk5hpV9UdxIpaG9aIU+kP9U/089glk5gh7cjL+SDNi+agxnGP5
	53nfCsEX1+FEcawWoDB3EtIudRKUq5x/egpZ4CZKu6A15JjXRPEoAFehUcMvT3r9dRK+A9Cpf+e67
	8I24nN57nVRcoUOz7kU2CnziL45WpfOz4r7KpJx9zvvae5T8u8gxQWwvXbnpAxmXRz+qVjN36QvIg
	AvYHP6KN9KyvAGU/EbpeivZ9MIUBQdhbqxqeeifyY7CeSC06rx8eVBcHAkh3/J5rmdk3YzU/m9tRZ
	9SNnKwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UCe-0000000EvJe-3gc5;
	Tue, 14 Oct 2025 01:51:52 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UCc-0000000EvJR-1Gkr;
	Tue, 14 Oct 2025 01:51:50 +0000
Message-ID: <3efcf624-58f1-4390-b6e2-a0aa5e62a9a3@infradead.org>
Date: Mon, 13 Oct 2025 18:51:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] Documentation: kvm: new UAPI for handling SEA
To: Jiaqi Yan <jiaqiyan@google.com>, maz@kernel.org, oliver.upton@linux.dev
Cc: duenwen@google.com, rananta@google.com, jthoughton@google.com,
 vsethi@nvidia.com, jgg@nvidia.com, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20251013185903.1372553-1-jiaqiyan@google.com>
 <20251013185903.1372553-4-jiaqiyan@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251013185903.1372553-4-jiaqiyan@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 10/13/25 11:59 AM, Jiaqi Yan wrote:
> Document the new userspace-visible features and APIs for handling
> synchronous external abort (SEA)
> - KVM_CAP_ARM_SEA_TO_USER: How userspace enables the new feature.
> - KVM_EXIT_ARM_SEA: exit userspace gets when it needs to handle SEA
>   and what userspace gets while taking the SEA.
> 
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> ---
>  Documentation/virt/kvm/api.rst | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 6ae24c5ca5598..43bc2a1d78e01 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7272,6 +7272,55 @@ exit, even without calls to ``KVM_ENABLE_CAP`` or similar.  In this case,
>  it will enter with output fields already valid; in the common case, the
>  ``unknown.ret`` field of the union will be ``TDVMCALL_STATUS_SUBFUNC_UNSUPPORTED``.
>  Userspace need not do anything if it does not wish to support a TDVMCALL.
> +
> +::
> +		/* KVM_EXIT_ARM_SEA */
> +		struct {
> +  #define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 0)
> +			__u64 flags;
> +			__u64 esr;
> +			__u64 gva;
> +			__u64 gpa;
> +		} arm_sea;
> +
> +Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER is
> +enabled, a VM exit is generated if guest causes a synchronous external abort
> +(SEA) and the host APEI fails to handle the SEA.
> +
> +Historically KVM handles SEA by first delegating the SEA to host APEI as there
> +is high chance that the SEA is caused by consuming uncorrected memory error.
> +However, not all platforms support SEA handling in APEI, and KVM's fallback
> +is to inject an asynchronous SError into the guest, which usually panics
> +guest kernel unpleasantly. As an alternative, userspace can participate into

                                                                           in

> +the SEA handling by enabling KVM_CAP_ARM_SEA_TO_USER at VM creation, after
> +querying the capability. Once enabled, when KVM has to handle the guest

                                                                     guest-
> +caused SEA, it returns to userspace with KVM_EXIT_ARM_SEA, with details
> +about the SEA available in 'arm_sea'.
> +
> +The 'esr' field holds the value of the exception syndrome register (ESR) while
> +KVM taking the SEA, which tells userspace the character of the current SEA,
   KVM takes

> +such as its Exception Class, Synchronous Error Type, Fault Specific Code and
> +so on. For more details on ESR, check the Arm Architecture Registers
> +documentation.
> +
> +The following values are defined for the 'flags' field

Above needs an ending like '.' or ':'.
(or maybe "::" depending how it is processed by Sphinx)

> +
> +  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical address
> +    is valid and userspace can get its value in the 'gpa' field.
> +
> +Note userspace can tell whether the faulting guest virtual address is valid
> +from the FnV bit in 'esr' field. If FnV bit in 'esr' field is not set, the
> +'gva' field hols the valid faulting guest virtual address.

               holds (or contains)> +
> +Userspace needs to take actions to handle guest SEA synchronously, namely in
> +the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One of the
> +encouraged approaches is to utilize the KVM_SET_VCPU_EVENTS to inject the SEA
> +to the faulting VCPU. This way, the guest has the opportunity to keep running
> +and limit the blast radius of the SEA to the particular guest application that
> +caused the SEA. Userspace may also emulate the SEA to VM by itself using the
> +KVM_SET_ONE_REG API. In this case, it can use the valid values from 'gva' and
> +'gpa' fields to manipulate VCPU's registers (e.g. FAR_EL1, HPFAR_EL1).
> +
>  ::
>  
>  		/* Fix the size of the union. */
> @@ -8689,6 +8738,18 @@ This capability indicate to the userspace whether a PFNMAP memory region
>  can be safely mapped as cacheable. This relies on the presence of
>  force write back (FWB) feature support on the hardware.
>  
> +7.45 KVM_CAP_ARM_SEA_TO_USER
> +----------------------------
> +
> +:Architecture: arm64
> +:Target: VM
> +:Parameters: none
> +:Returns: 0 on success, -EINVAL if unsupported.
> +
> +This capability, if KVM_CHECK_EXTENSION indicates that it is available, means
> +that KVM has an implementation that allows userspace to participate in handling
> +synchronous external abort caused by VM, by an exit of KVM_EXIT_ARM_SEA.
> +
>  8. Other capabilities.
>  ======================
>  

-- 
~Randy



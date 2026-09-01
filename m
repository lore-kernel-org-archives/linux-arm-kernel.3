Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F255DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJEzvIaybX9Dts9DYz8bf1h8e9d8Ys+d8ayhElVmFmU=; b=RDPXRVq+BgFOwhVrj+RXQQtqGL
	jHkCHYK6TNPNjZXIQJ3tOGZ8qWkFZbUPDEYSRflA2QElKSLUz4AaiYabdkUCetPimf2oAjXoddt7/
	sAJpJDmdVgDMVGNr4YqAzChjT6zWjUa49nRrghY9U+5K13xSz3/LF8rvqaBC6+aVWxhmyWJPzazBw
	4RyOwm3bGgExXRurH4yzmPLcbMoJvO36e0t3Z7s5OUTeSWoDSkB2nmqDAw3RSSBxinfyCWz4Wg9y9
	9lbQrZf+Oa9mjTgkNJxDFyFDWevOwVrYh3DhhYeVS81y3V/ql19uVGYNflT/toDlwJWgl3DJdzosK
	oIuU8MJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1GNd-0000000AzDq-2JwC;
	Tue, 01 Sep 2026 04:45:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1GNa-0000000AzDV-3eK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 04:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788237949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJEzvIaybX9Dts9DYz8bf1h8e9d8Ys+d8ayhElVmFmU=;
	b=OORIIB3BY0QqW5OJa7EMhJNk5MrXhD4EaQRJAEe7uBvcyUqhMG3hBLmPkmuBYoAOZJFb5p
	of8nEOcH/bJsoB79b2Y+TLEjq+0VGIgySGy2xzLolylAg6a51tqrGm37DqBuoHYMhVJG+l
	T5Sz8UdEUZzjY1zqEM+oAC4GnX0ne4M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-4KSztq5GM2myA8MJSdEnqg-1; Tue, 01 Sept 2026 00:45:48 -0400
X-MC-Unique: 4KSztq5GM2myA8MJSdEnqg-1
X-Mimecast-MFC-AGG-ID: 4KSztq5GM2myA8MJSdEnqg_1788237947
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so797641a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 21:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788237947; x=1788842747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJEzvIaybX9Dts9DYz8bf1h8e9d8Ys+d8ayhElVmFmU=;
        b=a1so3TWzqc6/1ZqoimXX4fUW0vLDDFpgFk/E0OyvmfHxCy71S/SHmXw/QNEZPljjNJ
         eQMeev1B7mPsj/WFNs9u1LSbjpA9TKHYUyzRzlZmbfSQoCkb4Cce0gLMwj59KljnNc39
         EFMr/svNcdE/noT2WXXrk86f40tLtfj2UrA/jIZs36d+TJE6kgVrb0PXHNle8dQHMsPf
         BBZMuXw0BWPUCqsRotcThpyX/2SPOYPO7GGjKrn2zI0Exoj8EkXoC2MBHDRdxPj72Byr
         EoE/gOcaLYX5h9f1TEEeIVgnxkEMFhUPAKdqWNqnlxitIxvKOuF+u1YTqspPYsMLkYhe
         VQ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8uEk7rv6U3mumw6+R0RjpdY0sF9No/FbZKGhreOw1ZoLnY6zyA0VqSEKCZ0n939lKyUfYzEv+yAhWshmGjk9A@lists.infradead.org
X-Gm-Message-State: AFuF++l72xraLd30DRMV6jG4GjmWYVpu/XQIbu25+zNfOKAkgSlCMRVQ
	oWgBIjnOSvoAZ5P7IBLLzjrXWIqhxfcMZnm2Bww3QNvggOElTaXMUKzHmKOH03m/0+Dg5j4/bD2
	Rf8q5xFmKgY+/EEjksjhXo3EoAiO7X5BWVtHX5qF8H9D1/x3XbFsQy1iiJ+fvjbtBWxHxAVYcG1
	kw
X-Gm-Gg: AYBFou0d1FN6kfN1l4ZP6nH97rVaz4G8tT33YGMIRca9QxAMcjMDuNimitHvXASpHzd
	ne724jq43RkUo2d4jW3pps5KwVxnhaKt/ZBZzV8kpy1ncy5bTxLqI24UcUXNaeg/DN/F2/9wRZN
	qTTLN5VAjedmXhig+KxDVTlydJQEaiZVB1g1rPczbCeDS5j9TS3NVp9w6IRTOSU/bSDdr8UqJX0
	Ja9niC5U0NQ/CF8pUXFLsHAMpQTJPr0qisPj+HIpTX5Eg1rPhJaza/kOu8NmAtt38yzvIosD76J
	siY4pA78wlYdjEezggakFKeUnlm8KY6N8votT8tdXEVMXMQgdYSgNzQW6vaIgC/OLrbjc4r3W2x
	9VNnnw2Kg5LuYaZH9zV06jT5O8FIqQEazXgayrDVRMQ==
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr26462483a91.10.1788237946702;
        Mon, 31 Aug 2026 21:45:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr26462384a91.10.1788237946100;
        Mon, 31 Aug 2026 21:45:46 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm33333687eec.21.2026.08.31.21.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 21:45:45 -0700 (PDT)
Message-ID: <216cfe43-e696-4de1-bf8e-58b2d35f3372@redhat.com>
Date: Tue, 1 Sep 2026 14:45:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 16/45] KVM: arm64: CCA: Allow passing the machine type
 in KVM creation
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-17-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260803134403.80630-17-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qw_6iotBFN6WaNZRclpgHGfNezVIUPleh1VyMeW1BlA_1788237947
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_214551_016013_E387C20B 
X-CRM114-Status: GOOD (  33.82  )
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

Hi Steve,

On 8/3/26 11:43 PM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>   * Specify the encoding for each VM type in the documentation.
> Changes since v13:
>   * Rework to use the two top bits for the machine type now that pKVM has
>     merged and used the top bit for KVM_VM_TYPE_ARM_PROTECTED.
>   * Update the documentation to include KVM_VM_TYPE_ARM_PROTECTED as
>     well.
> Changes since v9:
>   * Explictly set realm.state to REALM_STATE_NONE rather than rely on the
>     zeroing of the structure.
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++--
>   arch/arm64/kvm/arm.c           | 11 +++++++++++
>   include/uapi/linux/kvm.h       |  7 ++++++-
>   3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ce588c05b26a..802601eaf560 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -181,8 +181,25 @@ flag KVM_VM_MIPS_VZ.
>   ARM64:
>   ^^^^^^
>   
> -On arm64, the physical address size for a VM (IPA Size limit) is limited
> -to 40bits by default. The limit can be configured if the host supports the
> +On arm64, the machine type identifier is used to encode a type and the
> +physical address size for the VM. The lower byte (bits[7:0]) encodes the
> +address size and the upper bits[31:30] encode a machine type. The machine
> +types that might be available are:
> +
> + =========================   =======   ========================================
> + Type                        [31:30]   Description
> + =========================   =======   ========================================
> + KVM_VM_TYPE_ARM_NORMAL      0b00      A standard VM
> + KVM_VM_TYPE_ARM_REALM       0b01      A "realm" VM using the Arm Confidential
> +                                       Compute extensions, the VM's memory is
> +                                       protected from the host.
> + KVM_VM_TYPE_ARM_PROTECTED   0b10      A "protected" VM using pKVM to
> +                                       isolate the VM from the host.
> + Reserved                    0b11      Reserved for future use
> + =========================   =======   ========================================
> +
> +The physical address size for a VM (IPA Size limit) is limited to 40bits
> +by default. The limit can be configured if the host supports the
>   extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>   KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>   identifier, where IPA_Bits is the maximum width of any physical
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6f39831dcf5d..9881fd6c511c 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -249,6 +249,17 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if ((type & KVM_VM_TYPE_ARM_PROTECTED) &&
> +	    (type & KVM_VM_TYPE_ARM_REALM))
> +		return -EINVAL;
> +
> +	if (type & KVM_VM_TYPE_ARM_REALM) {
> +		if (!static_branch_unlikely(&kvm_rmi_is_available))
> +			return -EINVAL;
> +		kvm_set_realm_state(kvm, REALM_STATE_NONE);
> +		kvm->arch.is_realm = true;
> +	}
> +

Shall we use kvm_arm_rmi_supported() here? In that way, the check is consistent
to what has been done for KVM_CAP_ARM_RMI. You know that a misbehaving VMM can
issue KVM_CREATE_VM to create a realm VM without checking if KVM_CAP_ARM_RMI
is supported by the host.

	if (type & KVM_VM_TYPE_ARM_REALM) {
		if (!kvm_arm_rmi_supported())
			return -EINVAL;

		kvm_set_realm_state(kvm, REALM_STATE_NONE);
		WRITE_ONCE(kvm->arch.is_realm, true);
	}

>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 0231ff174a50..adee3936d6ae 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -700,14 +700,19 @@ struct kvm_enable_cap {
>    * address size for the VM. Bits[7-0] are reserved for the guest
>    * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>    * value 0 implies the default IPA size, 40bits.
> + *
> + * Bits[30-31] are reserved for the VM type
>    */
>   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   
> +#define KVM_VM_TYPE_ARM_NORMAL		0
> +#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
>   #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
>   #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> -					 KVM_VM_TYPE_ARM_PROTECTED)
> +					 KVM_VM_TYPE_ARM_PROTECTED | \
> +					 KVM_VM_TYPE_ARM_REALM)
>   
>   /*
>    * ioctls for /dev/kvm fds:

Thanks,
Gavin



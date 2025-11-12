Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4622CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ4CmyX/NTRmW777x76hyUCG7eg8AycsdVo784S1xxY=; b=YL4ne0lN2kOsm7qferRmrFRBca
	MdZNNzPwV/wnl3LR3PgHz5C7pkoWyPFfUpo7RyqI62dqs5XKVP14c2RmYSZO8dLx7JtILZxiXFgS9
	C61XcYGRfLTuZfhM26C7fYqp5hZdqno9DWxsiupWl3orw2OO2KNeDNcjIB0zj41fWD/jOFIoczFZ1
	YIfYlTuZLqh5RP03m06fcUI044SKchqx3iI4Ld6b/T+CXOWaWoVJZa0Vj/5fe7Ifbzn8ICx8mGiKw
	uKJu4HsGPs6Rht6sZ+i26QTAKYjdnxTJs8f2mZWdTTRec3YLEtx39E+018vPA6kK1yh3ThQ5H1o5f
	ffEM7iLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7lG-00000008Wmf-31x7;
	Wed, 12 Nov 2025 10:07:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7lE-00000008WmF-1lcp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C499541E4D;
	Wed, 12 Nov 2025 10:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA2C19423;
	Wed, 12 Nov 2025 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942051;
	bh=qv0rkaW2D6V9ujLxu5wOdIydA/9+KagOl+U71EexFE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1rY93bGfF6KQBMEuguUMHxXmPbykSVli0bFRJZXzqDxNf56tK/QJW7OZvEny9K9A
	 mECJ/EsU11mobGrrYDAUQB7lP26PGcqvA3saTFaf/tvpR58N2wXlhJT1xvtJFCFM8G
	 rui532D3tvKMHRlpXlROMTmhwrY+wNQe7jIy+zJjRcztZgEnqfMWBK4fVbXwLNzblO
	 Ynb1yH13ENfWZM6fGRUUXwvlQ1vjv6YpDumnH5jOPeZwwy7YjBzY4KpPj7zgDu/Hqf
	 PSLCieSmJ1JGgDZXDvXig3+E/sVH6X5DPUV+bd9nSpDk6bdbPDfH87qdqiWDrmuV5i
	 1U1sRp+r6luTw==
Date: Wed, 12 Nov 2025 02:07:30 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Subject: Re: [PATCH v4 7/8] KVM: arm64: Check whether a VM IOCTL is allowed
 in pKVM
Message-ID: <aRRcYltFUrBlcbfX@kernel.org>
References: <20251112092051.1376245-1-tabba@google.com>
 <20251112092051.1376245-8-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112092051.1376245-8-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020732_480217_1FA6B106 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Fuad,

On Wed, Nov 12, 2025 at 09:20:50AM +0000, Fuad Tabba wrote:
> +/*
> + * Check whether the KVM VM IOCTL is allowed in pKVM.
> + *
> + * Certain features are allowed only for non-protected VMs in pKVM, which is why
> + * this takes the VM (kvm) as a parameter.
> + */
> +static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	switch (ioctl) {
> +	case KVM_CREATE_IRQCHIP:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_IRQCHIP);
> +	case KVM_ARM_SET_DEVICE_ADDR:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SET_DEVICE_ADDR);
> +	case KVM_ARM_MTE_COPY_TAGS:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE);
> +	case KVM_ARM_SET_COUNTER_OFFSET:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_COUNTER_OFFSET);
> +	case KVM_HAS_DEVICE_ATTR:
> +	case KVM_SET_DEVICE_ATTR:
> +	case KVM_GET_DEVICE_ATTR:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_DEVICE_CTRL) ||
> +		       kvm_pkvm_ext_allowed(kvm, KVM_CAP_VM_ATTRIBUTES);
> +	case KVM_ARM_GET_REG_WRITABLE_MASKS:
> +		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
> +	default:
> +		return true;
> +	}
> +}
> +

I was thinking of something a bit more tabular since CCA will impose its
own restrictions + pKVM could share the ioctl <=> KVM_CAP association.

Anyway, ioctl filtering should be an allowlist (default to false) just
like kvm_pkvm_ext_allowed(). The default assumption is that new UAPI is not
supported for pVMs unless explicitly stated otherwise.

Thanks,
Oliver


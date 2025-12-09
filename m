Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6190D3B9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCd4xq18Gmlh0p19aMpmc6vePHr11nwSMGxOFkp7KUo=; b=TrgI8G3m8MkAhNtYvLPX4o95av
	RqxSwzfsGMHgq7DQW2tfEraYx+MP1NizmR3rEvwAytoI8vejCLBMB3FppxTL56lngWVl5+fzw3YqZ
	RGusigYiO3AT0c/5UXeWRZb9AThwVKvcOjkpcTupuB9T5ZaNetAM37OdDbh8foJwJMhwsRFD5bB7T
	QkC5tifs/frdqSVSYr068ZECzlxSIS51NDVyFOyRfVt3t2cSLJewKQV2NF3sqqRMst/3CsNfka3dM
	hXUuTXeWvYKiVJTMJ/cgae8C98oiYWPT9HdSkH+HGCB5aDITobkq4Q53f/yp0BBCcZqivVEZzL05G
	hhGiSAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6el-0000000Esxe-41ME;
	Tue, 09 Dec 2025 22:58:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6ei-0000000EsxT-1QKf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B0AC6015A;
	Tue,  9 Dec 2025 22:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A0AC4CEF5;
	Tue,  9 Dec 2025 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765321083;
	bh=V4BtB+Q9IqNyD2A3rjl7JlZezM4qtcAUXtmGwddZn08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KyF0x2RrVkq9JUm5RQ7+FgEqlpUBzgXk7WBFB9jUst56wTkI1MRZtn+CHNRoXPYnk
	 /g5wPbLYlIovoKCmAM4ATtx4QCwNMY0w7cvorFWDfhIZGFKpFe6yLuN1ntRxcolIq8
	 ZiaXTb/XO/dwb6urwzSpVyUFwR9GNBGiksrkPrUXNeyhGAZCkGBo8Y8LzKzyhe+sw9
	 SHbWmvGm5PAfcCq5SGmLuw4kbFfnqBS9cOzMGnwEiLJZcjou7ALLdTPJ/nVCXn5yKy
	 pPAICOaiqI8UXhE5gWMUwA8BWIHzT+u5IY6ynMztH4IFMnDtqF2Av5i2eXZF6tu3Ie
	 CJ0+TajSD2CXA==
Date: Tue, 9 Dec 2025 14:58:01 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 22/24] KVM: arm64: Add KVM_CAP to partition the PMU
Message-ID: <aTipeb2fAmUtSzzX@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-23-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-23-coltonlewis@google.com>
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

On Tue, Dec 09, 2025 at 08:51:19PM +0000, Colton Lewis wrote:
> +
> +7.245 KVM_CAP_ARM_PARTITION_PMU
> +-------------------------------------
> +

Why can't this be a vCPU attribute similar to the other vPMU controls?
Making the UAPI consistent will make it easier for userspace to reason
about it.

Better yet, we could make the UAPI such that userspace selects a PMU
implementation and the partitioned-ness of the PMU at the same time.

> @@ -132,6 +134,16 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		}
>  		mutex_unlock(&kvm->lock);
>  		break;
> +	case KVM_CAP_ARM_PARTITION_PMU:
> +		if (kvm->created_vcpus) {
> +			r = -EBUSY;
> +		} else if (!kvm_pmu_partition_ready()) {
> +			r = -EPERM;
> +		} else {
> +			r = 0;
> +			kvm_pmu_partition_enable(kvm, cap->args[0]);
> +		}
> +		break;
>  	default:
>  		break;
>  	}
> @@ -388,6 +400,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_PMU_V3:
>  		r = kvm_supports_guest_pmuv3();
>  		break;
> +	case KVM_CAP_ARM_PARTITION_PMU:
> +		r = kvm_pmu_partition_ready();

"ready" is very confusing in this context, as KVM will never be ready to
support the feature on a system w/o the prerequisites.

Thanks,
Oliver


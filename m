Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40268CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra4093tDC1jRsi/IiXE13TY50JKdj0F8YQ+te1abZyk=; b=J6oOBvU8a771K1t9IFPv8kJwE5
	jhvTllND65eOUuIj+a4LBif7VH8Ae56eUUjzuHYOczXi1n/giJAmNUBabnsW9bey1QpdJPro3y0zj
	RDMPodqh5QBTXsFBSR7TpZdcbBHKmWz8GNcxotszQFXjw/Qa6mhMaNXIMTWCTKkjyIlIjFTWnvlLs
	/AOOSMRE1eQYdcq7UuWaXtBOK+SMfRm4ARQWd+v8d4RezkDjq3FrOtDmRwMQUifRoiXe+sYf6tET7
	jGRn3aD6z2IbjX4UcNLUcol1/d5B0dfy5U3n2245lEyf0k1sA2lfmT7hfv82+PfBvDAbs3lYBtJ7W
	KjQ2Blkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuuB-0000000EyUI-01IP;
	Wed, 14 Oct 2026 09:04:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuu8-0000000EyT2-31fW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:04:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5276C1596;
	Wed, 14 Oct 2026 02:03:55 -0700 (PDT)
Received: from [10.57.9.28] (unknown [10.57.9.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5E273F7B4;
	Wed, 14 Oct 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791968638; bh=hCdDlst7bj1m0LOdOKYBlBTkqQdM2UjFhwxu9lQemtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijVPr1gskGK9HqirlaUq87YsLpFcaxA4i/EGXPaCKbl9LjDy7uu+ifwdQVGlFeD+9
	 Y2p6nkbHGsvQZt2dvb6riWzfilwHBhBwP4eRJ+gzMS5alvMK4sPXfd17yo3loVrSse
	 pYMoURvmQ0LrEhinDltBP44DkzenKF4KytnDpRV4=
Message-ID: <bd9c0add-8317-4aa9-bb8b-479efbf3164f@arm.com>
Date: Wed, 14 Oct 2026 10:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: arm64: Don't WARN on SMCCC filter reserved range
 allocation failure
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-kernel@vger.kernel.org
References: <20261013164334.1492070-1-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261013164334.1492070-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020408_804597_76C3096B 
X-CRM114-Status: GOOD (  20.53  )
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

On 13/10/2026 17:43, Fuad Tabba wrote:
> The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
> inserts the reserved architecture ranges into the maple tree and WARNs
> if that fails. The insertion allocates with GFP_KERNEL_ACCOUNT, so a
> tight memory cgroup limit is enough for userspace to hit the WARN, even
> though the -ENOMEM is also returned to it. The WARN dates back to when
> the ranges were inserted at VM creation.
> 
> Leave -ENOMEM out of the WARN and keep it for every other error. The
> two reserved ranges are fixed and disjoint and go into an empty tree
> under config_lock, so any other error is a KVM bug.
> 
> Fixes: fb88707dd39bd ("KVM: arm64: Use a maple tree to represent the SMCCC filter")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260829055809.29AD31F000E9@smtp.kernel.org/
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
> Changes since v1 [1]:
>    - Keep the WARN for any error other than -ENOMEM. (Oliver)
>    - Split out of v1 as its own patch. (Marc)
> 
> Based on Linux 7.3-rc3 (fd73f4a665989).
> 
> [1] https://lore.kernel.org/all/20260928152507.2116110-2-fuad.tabba@linux.dev/
> 
>   arch/arm64/kvm/hypercalls.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index b11b8821c9fbc..c9d488c586e5f 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -197,8 +197,10 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
>   
>   	if (!kvm_smccc_filter_configured(kvm)) {
>   		r = kvm_smccc_filter_insert_reserved(kvm);
> -		if (WARN_ON_ONCE(r))
> +		if (r) {
> +			WARN_ON_ONCE(r != -ENOMEM);
>   			goto out_unlock;
> +		}
>   	}
>   
>   	r = mtree_insert_range(&kvm->arch.smccc_filter, start, end,
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780



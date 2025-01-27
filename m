Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828EAC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9dwybOO0+mZiFuuq/Vf+IGs6l28IyHfVWotIsmLO+c=; b=b6dQHtUfzr7xNq6waqIOo0ozBB
	CfbDxRLwVVUZqk2407/IzWdnsxejM5vovBTRxkmxuyaG5fQIR8jbYXVFlJL4P/tQ/TeaqYyRtK/4N
	O58xpl0IG5FsYNsQpDc38rR4JnJqKSrC5uibpHEGI2f1u2QUy2n2/0MaeffXrImTvrCqer/aOAQF1
	F/Y4zpzajcRGGLh+NWJDEAQjwYYG0odMumfNidyUbwm7GheFb8MqyJtMiF6xXYRkptCftX2VPentD
	vexd2w88H4kuJfYFIozgLfrHD6IARBgz7NN+9scf2cu2to5TXBo4OPmPPo7DT/hGlgk0Ohjvm9LKa
	sKR8YuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSaA-00000002qQH-2ixm;
	Mon, 27 Jan 2025 17:07:30 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSYk-00000002qM5-0DUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:06:05 +0000
Date: Mon, 27 Jan 2025 09:05:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737997556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h9dwybOO0+mZiFuuq/Vf+IGs6l28IyHfVWotIsmLO+c=;
	b=u/aPbhrOYBk3Frt9AqX45lJMVsHZmxgN4f4FNLsj7PbQngoz58Z4r82mCC3EuPxpbogNhE
	JBw9xeT+UXhheABj4aVKKV5hZwsWDNxDH5DYyxpCX5HsneZxS3pO28N91a8a4lLU24OP/S
	8aWGyUmKxuY2HmIizZG5v5I6ESr6m8s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Message-ID: <Z5e86rCgvbtK84CT@linux.dev>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124151732.6072-4-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_090602_362547_E80A9AE0 
X-CRM114-Status: GOOD (  17.47  )
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

Hi Shameer,

On Fri, Jan 24, 2025 at 03:17:31PM +0000, Shameer Kolothum wrote:
> Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns the
> bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it only
> returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that
> to return all the KVM/arm64-specific hypercalls exposed by
> KVM/arm64 to guest operating systems.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  arch/arm64/kvm/hypercalls.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 27ce4cb44904..6132cb542200 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
>  		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> -		val[0] = smccc_feat->vendor_hyp_bmap;
> +		val[0] = GENMASK(ARM_SMCCC_KVM_FUNC_MMIO_GUARD,
> +				 ARM_SMCCC_KVM_FUNC_FEATURES);
> +		/* Function numbers 8-63 are reserved for pKVM for now */
> +		val[2] = GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
> +				 (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
>  		break;

This isn't right. The pKVM carveout exists for some KVM-internal
bookkeeping to (hopefully) avoid breaking guest ABI between what's in
the downstream android kernel and what eventually gets accepted
upstream.

The purpose of this hypercall is for the guest to discover what
interfaces are actually implemented by the hypervisor, and we definitely
do not implement these upstream at the moment.

-- 
Thanks,
Oliver


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2AEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jlmwYBu2oRH1liodMvw0DLZE3UBmvT9dFMsw7V0bHU=; b=Vbuow5mkoLGhOEMbhACzuSxrvU
	CRbvH9EUkzKXluFkqEgVEAh6NL7pQ1FxlZGRjnKooj874qCcypEIJ52r3ot7B2GXW5GJlmIF1kq5o
	QWk362Dp70Qivs2GzUZ+bOoIJ58xq40FKdcyy+t2+NH/qR764FxxKa0lodt6HvjaeqKt/17oMsDRM
	FSf6mfJ/tykhXD6S1LPG6t1Ml0VJYSaFV9qz9VosdCPEZryNaGhb7AHV8IYh/NicqrRHf7xCgrykd
	13l5+0nSVTrhlNyBGo3q323nHhukzFAC8mkzSJk+W4FNQExYCl93fvLnt2XUMpoWerC17gwiCp+3Q
	oMkXps7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2c1b-00000008Qw2-1oMp;
	Wed, 09 Apr 2025 20:27:55 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2bzC-00000008QiL-1UXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:25:27 +0000
Date: Wed, 9 Apr 2025 13:25:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744230323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5jlmwYBu2oRH1liodMvw0DLZE3UBmvT9dFMsw7V0bHU=;
	b=EfPl9gvZnpeSw5sXS4Rbq0dN+b3wrz2h4fSxxTDu77H8iiDoD3YLFak7Z8bFhLNpzs+n1U
	DCKhd+TczuEWxIqgE6DhyE6xnadpqBBZqtVXvs9AAm0tWxfg/52e5wmf43/y5jPTHZSOEk
	0g/1jQK86hQbrpF9nbVfqYLNymKmrv4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 3/6] KVM: arm64: Allow userspace to limit the number
 of PMU counters for EL2 VMs
Message-ID: <Z_bXr5izZdn93ryv@linux.dev>
References: <20250409160106.6445-1-maz@kernel.org>
 <20250409160106.6445-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409160106.6445-4-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_132526_532797_88F2CEE0 
X-CRM114-Status: GOOD (  21.70  )
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

On Wed, Apr 09, 2025 at 05:01:03PM +0100, Marc Zyngier wrote:
> As long as we had purely EL1 VMs, we could easily update the number
> of guest-visible counters by letting userspace write to PMCR_EL0.N.
> 
> With VMs started at EL2, PMCR_EL1.N only reflects MDCR_EL2.HPMN,
> and we don't have a good way to limit it.
> 
> For this purpose, introduce a new PMUv3 attribute that allows
> limiting the maximum number of counters. This requires the explicit
> selection of a PMU.
> 
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  Documentation/virt/kvm/devices/vcpu.rst | 24 ++++++++++++++++++++++++
>  arch/arm64/include/uapi/asm/kvm.h       |  9 +++++----
>  arch/arm64/kvm/pmu-emul.c               | 24 ++++++++++++++++++++++++
>  3 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index 31a9576c07afa..6eef154a2e396 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -137,6 +137,30 @@ exit_reason = KVM_EXIT_FAIL_ENTRY and populate the fail_entry struct by setting
>  hardare_entry_failure_reason field to KVM_EXIT_FAIL_ENTRY_CPU_UNSUPPORTED and
>  the cpu field to the processor id.
>  
> +1.5 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_SET_PMCR_N

Similar to my comment on the kvm_arch field, this should be renamed to
something other than PMCR_N.

Otherwise the implementation of the ioctl itself LGTM.

> +---------------------------------------------
> +
> +:Parameters: in kvm_device_attr.addr the address to an unsigned int
> +	     representing the maximum value taken by PMCR_EL0.N
> +
> +:Returns:
> +
> +	 =======  ====================================================
> +	 -EBUSY   PMUv3 already initialized, a VCPU has already run or
> +                  an event filter has already been set
> +	 -EFAULT  Error accessing the value pointed to by addr
> +	 -ENODEV  PMUv3 not supported or GIC not initialized
> +	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
> +	 	  range
> +	 =======  ====================================================
> +
> +Update the maximum value allowed in PMCR_EL0.N, defining the number of
> +counters visible to the guest.

Set the number of implemented event counters in the vPMU

Thanks,
Oliver


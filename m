Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCADE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smpLQ5EAUCvdQcQ3ttJAsHL74T4TA9p4kd4Dy6c0FwA=; b=FzlbBTbiMMetxHdRw0xwxcI2UO
	Q2qjVR7RKjyfZaNSV+RnQtmFFiz9t5LVqmCPG45F+NusSVm2eEpPY7V+2s3c8xRF3D2Orl8ggqN4w
	b0gyi3ONgD8Rk4+C8BTQgTzsXpMn44IVpBjYbFWH+ym0831lCkyTPIXS01oJEz8JQUNAMPWtGDMB7
	Wch/3lhGG2mPvb4XF8ji9B37dxV6GVUQ2AKDTDfY2NhtKmgA6fZW+YRzO7a/Z1yjb9pVVwcMSlWk6
	E0Kw5LhAdaRbigMgwEqVHOP4iW6qBHkTMz0Y8ZOThBR9RmTr/W6ixd0NcC3drjjsMUtqxFECsd/vM
	k9MGxnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMle-00000000A4G-3ktt;
	Fri, 06 Dec 2024 01:04:26 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMjq-000000009aa-2qFI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:02:36 +0000
Date: Thu, 5 Dec 2024 17:02:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733446948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smpLQ5EAUCvdQcQ3ttJAsHL74T4TA9p4kd4Dy6c0FwA=;
	b=LnFLkWHKDniXpH26xNfkwnzM+l7kT59CELP4eEEoZNSXSsO/8IUIR2wexIbM5dgPSX6JfP
	7MI7UWHw61lwWPAZEa+8I6cECCuKh686cgtuMUSU3uwg1nPFf/3dr5rBTl6hPvRixXFpip
	g7l1BZ4DUv1jXEE/Mp36zFH7n4VP15E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, james.clark@linaro.org, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 05/14] KVM: arm64: Initialize feature id registers for
 protected VMs
Message-ID: <Z1JNGmcZka1hl2ha@linux.dev>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-6-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-6-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_170235_067847_71BCBAEE 
X-CRM114-Status: GOOD (  11.04  )
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

On Mon, Dec 02, 2024 at 03:47:32PM +0000, Fuad Tabba wrote:
> +/*
> + * Initializes feature registers for protected vms.
> + */
> +void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_arch *ka = &kvm->arch;
> +	u32 r;
> +

Can you add an assertion that this is called while holding the
vm_table_lock? Otherwise it isn't clear why its safe to initialize
per-VM state.

> +	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
> +		return;
> +
> +	/*
> +	 * Initialize only AArch64 id registers since AArch32 isn't supported
> +	 * for protected VMs.
> +	 */
> +	for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
> +		ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
> +
> +	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
> +}
> +
>  /*
>   * Checks that the sysreg table is unique and in-order.
>   *
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
Thanks,
Oliver


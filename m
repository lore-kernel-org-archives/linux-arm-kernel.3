Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ED2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al7NVeWVCt6wvSuuBxYz51Qa667pYwu4Fk/SDCBU8o0=; b=U+Zf+REL9IVdsX1LpNe+IRHvcc
	FcReAQcCxurqQrS76hv+TC1IouAu65mdYUN9xOsAeBu1J0zQrEKEXipQfb4hWk36MnrPh7FHftsA1
	wMpjRQi8V8lXd3Qrkp8DXMsu+IKmFgTrOoRZbxKGH4wWB6GdX2MTUunWS3oI5abKdPfs5PL4QAhNl
	xZLWtkpX2DOoEjil782J7NQ+qodeuSJBg8Dr6w0GEuJcUQN9oS81jUfsyXvjE1orf2oz6B5i2Pri0
	hcfnXS0lyvXUjmMYvixwgEILIEfUZoIPrkOJUuxOXpPp4wqb5A+gD97dItsXCig6/UK2iHALlsuQw
	RdC5OZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OQb-00000003iMg-3JGL;
	Tue, 30 Sep 2025 00:41:13 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OQY-00000003iMC-3zD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:41:12 +0000
Date: Mon, 29 Sep 2025 17:41:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759192867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=al7NVeWVCt6wvSuuBxYz51Qa667pYwu4Fk/SDCBU8o0=;
	b=vQstJueROGg1w9KYIsYzevZvj3jdAImXxYvZHg6r0xf7aDZpDUjKTklTa23GulRsOgMbzp
	4GJHGn7COhl1od6DtkQORkHPigpwCeXXC1lVpRpGNjgvHP+/0Aqm5ix8LMKrsGsxR+GiNH
	6XeSzLIpbzFIxKg4si7NhCs8RxIgtkg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 05/13] KVM: arm64: Add timer UAPI workaround to sysreg
 infrastructure
Message-ID: <aNsnHUTaHgrql07j@linux.dev>
References: <20250929160458.3351788-1-maz@kernel.org>
 <20250929160458.3351788-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929160458.3351788-6-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_174111_145664_5B6F971B 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, Sep 29, 2025 at 05:04:49PM +0100, Marc Zyngier wrote:
> Amongst the numerous bugs that plague the KVM/arm64 UAPI, one of
> the most annoying thing is that the userspace view of the virtual
> timer has its CVAL and CNT encodings swapped.
> 
> In order to reduce the amount of code that has to know about this,
> start by adding handling for this bug in the sys_reg code.
> 
> Nothing is making use of it yet, as the code responsible for userspace
> interaction is catching the accesses early.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 33 ++++++++++++++++++++++++++++++---
>  arch/arm64/kvm/sys_regs.h |  6 ++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 9f2f4e0b042e8..8e6f50f54b4bf 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5231,15 +5231,28 @@ static int demux_c15_set(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
>  	}
>  }
>  
> +static u64 kvm_one_reg_to_id(const struct kvm_one_reg *reg)
> +{
> +	switch(reg->id) {
> +	case KVM_REG_ARM_TIMER_CVAL:
> +		return TO_ARM64_SYS_REG(CNTV_CVAL_EL0);
> +	case KVM_REG_ARM_TIMER_CNT:
> +		return TO_ARM64_SYS_REG(CNTVCT_EL0);
> +	default:
> +		return reg->id;
> +	}
> +}
> +

Seems like a good spot to name n' blame the commit that introduced this
bug as a comment.

Thanks,
Oliver


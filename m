Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B09CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3QcFHlEvcjj6MiNyJMZ0YIhRNNN88+mlPp+PR6ZG3g=; b=pB6J72FUugHpK/g6ns8IvUiDHW
	jyfToChJ4+a73hk2xZlaypFxFcRaCqxXt/EwRJwrhyBYPZgE5WabtuQ5nIe5Of7D2H4xBF8nVZfqL
	1temPw3OAh3h93QveyfdCIYFy4JYhAVeUZ4LLHEGKCVyhLGxIvT7vyHAucHgYKhkcIelvckbPqV6P
	Ivl48/exc0vzmbymT11rz6J9uUqLzA+bdTw3ExJKjQdoDCYcMlsMZHQQlTjid+ppRyceaI0jTKr8H
	/0TYVxSDiGonHVJmD8Qx+4+0DNKJlB+zWHtXdMAZNKjsAoANlz5mnJO5pQIBbXyaaLfSvZ4p1ocmH
	SZH8wPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB2q-0000000BvyL-0uNN;
	Mon, 01 Jun 2026 22:23:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB2o-0000000Bvy7-38PZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37BC46001A;
	Mon,  1 Jun 2026 22:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8068A1F00893;
	Mon,  1 Jun 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780352617;
	bh=l3QcFHlEvcjj6MiNyJMZ0YIhRNNN88+mlPp+PR6ZG3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLo8azV+HKDO7n7o3OMo/wuuHzrw6nU083rl17z/EwmSElqD27QQIxGNjDUyLjImi
	 bODiBHUObrVmDMaJoU/7jC3v6F7cH9AGZO5U7EPvQlXOao4SRcdTnNfSfJfE601iSk
	 jHOVp181+depQL+AlaX+nmY8+Gtbv/TyjwomyAx/lVwjYpa+/wwVYPiD9a3Ee7zaVn
	 QLxoNxTGxs/Xl32RcO3BRp8Y1kBD/wIY3K3nS9+B+7RK7WcjUIdAALeqHhzKGUvpuj
	 N4CkTjuJDYzKStH0LpItdOH6H1tjoMDN72kOe1fC+KqCQ7d0KAun1jAQDMBSJ7MUQc
	 UnUMIQ465WaUQ==
Date: Mon, 1 Jun 2026 15:23:36 -0700
From: Oliver Upton <oupton@kernel.org>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 12/26] KVM: arm64: Add PVM_ prefix to avoid name
 collisions
Message-ID: <ah4GaFNM7xfS7CJC@kernel.org>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-13-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529155601.2927240-13-seiden@linux.ibm.com>
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

On Fri, May 29, 2026 at 05:55:45PM +0200, Steffen Eiden wrote:
> Rename ID_UNALLOCATED to PVM_ID_UNALLOCATED and read_id_reg to
> pvm_read_id_reg to prevent future name collisions with other subsystems.
> While at it, fix whitespace issues in the macro invocations
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

No issues with the rename but do you even need the nVHE object at all
for s390?

Thanks,
Oliver

> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 48 +++++++++++++++---------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index e8d773d38905..08b14053568b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -282,8 +282,8 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
>  	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
>  }
>  
> -static u64 read_id_reg(const struct kvm_vcpu *vcpu,
> -		       struct sys_reg_desc const *r)
> +static u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu,
> +			   struct sys_reg_desc const *r)
>  {
>  	struct kvm *kvm = vcpu->kvm;
>  	u32 reg = reg_to_encoding(r);
> @@ -341,7 +341,7 @@ static bool pvm_access_id_aarch64(struct kvm_vcpu *vcpu,
>  		return false;
>  	}
>  
> -	p->regval = read_id_reg(vcpu, r);
> +	p->regval = pvm_read_id_reg(vcpu, r);
>  	return true;
>  }
>  
> @@ -379,7 +379,7 @@ static bool pvm_idst_access(struct kvm_vcpu *vcpu,
>   * register with encoding Op0=3, Op1=0, CRn=0, CRm=crm, Op2=op2
>   * (1 <= crm < 8, 0 <= Op2 < 8).
>   */
> -#define ID_UNALLOCATED(crm, op2) {			\
> +#define PVM_ID_UNALLOCATED(crm, op2) {			\
>  	Op0(3), Op1(0), CRn(0), CRm(crm), Op2(op2),	\
>  	.access = pvm_access_id_aarch64,		\
>  }
> @@ -438,46 +438,46 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
>  	AARCH32(SYS_MVFR0_EL1),
>  	AARCH32(SYS_MVFR1_EL1),
>  	AARCH32(SYS_MVFR2_EL1),
> -	ID_UNALLOCATED(3,3),
> +	PVM_ID_UNALLOCATED(3, 3),
>  	AARCH32(SYS_ID_PFR2_EL1),
>  	AARCH32(SYS_ID_DFR1_EL1),
>  	AARCH32(SYS_ID_MMFR5_EL1),
> -	ID_UNALLOCATED(3,7),
> +	PVM_ID_UNALLOCATED(3, 7),
>  
>  	/* AArch64 ID registers */
>  	/* CRm=4 */
>  	AARCH64(SYS_ID_AA64PFR0_EL1),
>  	AARCH64(SYS_ID_AA64PFR1_EL1),
>  	AARCH64(SYS_ID_AA64PFR2_EL1),
> -	ID_UNALLOCATED(4,3),
> +	PVM_ID_UNALLOCATED(4, 3),
>  	AARCH64(SYS_ID_AA64ZFR0_EL1),
> -	ID_UNALLOCATED(4,5),
> -	ID_UNALLOCATED(4,6),
> -	ID_UNALLOCATED(4,7),
> +	PVM_ID_UNALLOCATED(4, 5),
> +	PVM_ID_UNALLOCATED(4, 6),
> +	PVM_ID_UNALLOCATED(4, 7),
>  	AARCH64(SYS_ID_AA64DFR0_EL1),
>  	AARCH64(SYS_ID_AA64DFR1_EL1),
> -	ID_UNALLOCATED(5,2),
> -	ID_UNALLOCATED(5,3),
> +	PVM_ID_UNALLOCATED(5, 2),
> +	PVM_ID_UNALLOCATED(5, 3),
>  	AARCH64(SYS_ID_AA64AFR0_EL1),
>  	AARCH64(SYS_ID_AA64AFR1_EL1),
> -	ID_UNALLOCATED(5,6),
> -	ID_UNALLOCATED(5,7),
> +	PVM_ID_UNALLOCATED(5, 6),
> +	PVM_ID_UNALLOCATED(5, 7),
>  	AARCH64(SYS_ID_AA64ISAR0_EL1),
>  	AARCH64(SYS_ID_AA64ISAR1_EL1),
>  	AARCH64(SYS_ID_AA64ISAR2_EL1),
> -	ID_UNALLOCATED(6,3),
> -	ID_UNALLOCATED(6,4),
> -	ID_UNALLOCATED(6,5),
> -	ID_UNALLOCATED(6,6),
> -	ID_UNALLOCATED(6,7),
> +	PVM_ID_UNALLOCATED(6, 3),
> +	PVM_ID_UNALLOCATED(6, 4),
> +	PVM_ID_UNALLOCATED(6, 5),
> +	PVM_ID_UNALLOCATED(6, 6),
> +	PVM_ID_UNALLOCATED(6, 7),
>  	AARCH64(SYS_ID_AA64MMFR0_EL1),
>  	AARCH64(SYS_ID_AA64MMFR1_EL1),
>  	AARCH64(SYS_ID_AA64MMFR2_EL1),
> -	ID_UNALLOCATED(7,3),
> -	ID_UNALLOCATED(7,4),
> -	ID_UNALLOCATED(7,5),
> -	ID_UNALLOCATED(7,6),
> -	ID_UNALLOCATED(7,7),
> +	PVM_ID_UNALLOCATED(7, 3),
> +	PVM_ID_UNALLOCATED(7, 4),
> +	PVM_ID_UNALLOCATED(7, 5),
> +	PVM_ID_UNALLOCATED(7, 6),
> +	PVM_ID_UNALLOCATED(7, 7),
>  
>  	/* Scalable Vector Registers are restricted. */
>  
> -- 
> 2.53.0
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265DBCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny9fmkEzONcVs1e5iE8VcrCvNlMLooF3aRovoZzxOnQ=; b=mtZUtg/gxYMj3B6nkYuEOr0KAC
	4CEDRNNzBSKvxEfJuctFrkYfo295EnA0uUojLcdFSktFCyzl6GwiczXfDFLaaZFLPBPmDkDYDuCtG
	pV4YA02y+sh72XHBhWwaDEUNTnr9PLE77f+sGAM3WBlneSZkPZ1psP1OOKYRqAoU+iDF7uFoBkB81
	XVjYWIDYWc6HHeQzNnezv0plFz6qxIydqSPhGeNkRyx9WnW/vku81BodqNj1RNgaG48i9pG9pEf9c
	GrGL4jT7ua+/joTit0Qyet2rLcpwGHks8AFw06+jOOZ6RTRwIo8Vai2oP2D7t0qujl2TkRElpJcx1
	ylcBfC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4CZ-0000000E1hM-0b1j;
	Mon, 15 Jun 2026 10:05:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4CX-0000000E1h9-1Zpr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:05:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC7D941808;
	Mon, 15 Jun 2026 10:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA1C1F000E9;
	Mon, 15 Jun 2026 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517952;
	bh=ny9fmkEzONcVs1e5iE8VcrCvNlMLooF3aRovoZzxOnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PwVYscLwLhiJJdb+Hvdhutlv/vueIApMWJs9iI2ewp31Z2K7vt2UZRpBFwgxIG5EH
	 NxqZQaBujMwPQV/dpIKyQceymaStGgC81Qi82u1S7o9Eu5GPPDSHJ4MbzwxqOZ6C3x
	 rPkzZrcu1GT8/HPdzqgJIEYGxvBgoqivC664QFCTbofWU7Z+97MntiDMSl/add1U2e
	 77B4160ITB40fMKBTCNvMHKlUR1DSqYJqT0YAEd2VqyF25zXqSP/wz/2PDMt6sA1Pv
	 ofQDwUuySJe8jVRIgXMVMgZxAYPMVkg6FGCoHLYMDIxG+c8kOAlEzFOESurbBdJP71
	 6uWWrgwelVvfQ==
Date: Mon, 15 Jun 2026 11:05:46 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
Message-ID: <ai_OevUNS-OACPm7@willie-the-truck>
References: <20260612113414.1022901-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612113414.1022901-1-tabba@google.com>
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

On Fri, Jun 12, 2026 at 12:34:14PM +0100, Fuad Tabba wrote:
> When pKVM injects a synchronous exception into a protected guest, it
> re-enters without restoring the guest's EL1 sysregs and writes the EL1
> exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> only in memory, so the guest's handler reads a stale SPSR_EL1 and
> restores the wrong PSTATE on eret.
> 
> Write SPSR_EL1 alongside the other exception registers.
> 
> Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> Reported-by: sashiko <sashiko@sashiko.dev>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 8c3fbb413a06..1a7d5cd16d72 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
>  
>  	write_sysreg_el1(esr, SYS_ESR);
>  	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> +	write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
>  	write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
>  	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
>  }

Is SPSR_EL1 not set in enter_exception64() using vcpu_cpsr(vcpu), which
*is* set here? I'm just a bit wary of the report, as I'd have expected
fireworks if we weren't initialising the guest's SPSR on the exception
injection path.

Will


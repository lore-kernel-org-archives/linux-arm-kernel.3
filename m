Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7534CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcSo2rZZvyvZpgGbvs/yMKfZb1o6MsBELrkTyPVwJiY=; b=4HuOI1xLJQgJWjSn9T8rdl+VDw
	eDcJZSaXmJyAryo0JibY+h+z3VfYvIjCnH0YkttYNnmcIvZp0nHaCfabu/zv/jQkWbAioM2EDkmi/
	cMNAH6tpfybFRb7K/PPln3jLhqwV83yDoPLXLicwGxGBNKiGfYujqtmNIP6P1LKBdzFcKA5REbG7h
	XrW2jBp0x6ebsqN3uFSjtD86QOArADCqg6cCX0kNf7uNfNhvBWjaSAC5pbG3gwqcOL2obCoYU7qlH
	oC/JQ1y7WkZMXsx2igN9XgakYl6PBYM7KJriYPtWbbjNw+BYJev+f/mgKe5+kY+v5e4DgjDqxPV3X
	7G4lcY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIyPi-00000007upI-0fBL;
	Wed, 12 Nov 2025 00:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIyPg-00000007up4-1uEa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 00:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95328600AD;
	Wed, 12 Nov 2025 00:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE0BC4CEFB;
	Wed, 12 Nov 2025 00:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762906119;
	bh=x2q3/YmBP7+xUvA10uWwMegTPDYA5rCthXeXB7vi3nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz3Bxz7+XSxc+KAFCkBAmJ2wjFOBYwh4qNy5j4kmuZf1aSEkIp14TOXMKs2X31cSj
	 VyS691SEYvi+9eU7J7hRPcd86VVMci8puqDKKh6UEfyl1mgPXFCIFQiR465L5W9vKH
	 hw9+Yl8jKzZAuz/Qb1HG9iCFfsYp8tt2zCcQfi+QoBXp68+L08gyr5S4x4vUsqW3Sn
	 JFuq1ylEOVbm1GRB7GEPaRNqcBsIMr49W8wGAQzqlzo7In5aGMUybaLqdi2kSiFBUp
	 AcKEZsZjF4CQF8N3Kc+1OGhmj/U3nSeRimD8JDZCFqYyYjnBomwooybDfGmLIsq67v
	 8azQGBxmu+TbA==
Date: Tue, 11 Nov 2025 16:08:37 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v2 20/45] KVM: arm64: Revamp vgic maintenance interrupt
 configuration
Message-ID: <aRPQBQVPLVXGOxU-@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-21-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109171619.1507205-21-maz@kernel.org>
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

On Sun, Nov 09, 2025 at 05:15:54PM +0000, Marc Zyngier wrote:
> +static void summarize_ap_list(struct kvm_vcpu *vcpu,
> +			      struct ap_list_summary *als)
>  {
>  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
>  	struct vgic_irq *irq;
> -	int count = 0;
> -
> -	*multi_sgi = false;
>  
>  	lockdep_assert_held(&vgic_cpu->ap_list_lock);
>  
> -	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
> -		int w;
> +	*als = (typeof(*als)){};
>  
> -		raw_spin_lock(&irq->irq_lock);
> -		/* GICv2 SGIs can count for more than one... */
> -		w = vgic_irq_get_lr_count(irq);
> -		raw_spin_unlock(&irq->irq_lock);
> +	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
> +		scoped_guard(raw_spinlock, &irq->irq_lock) {
> +			if (vgic_target_oracle(irq) != vcpu)
> +				continue;

From our conversation about this sort of thing a few weeks ago, wont
this 'continue' interact pooly with the for loop that scoped_guard()
expands to?

Consistent with the other checks against the destination oracle you'll
probably want a branch hint too.

Thanks,
Oliver


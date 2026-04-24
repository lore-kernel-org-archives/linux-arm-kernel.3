Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BAFB44BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SDLGP7xfTuvBLKrkgTFGSV6/ELHlpEZ9aT6DGRWRtY=; b=HgeSklIiQh9PJ3Pio/cmM3z7Q3
	OsEMVkMOKWPna5o6DwMKwS9h4hXXceFyLpqJ1hphyPg7BuR0K3EmSXYzrYA8U3IvD6KLNbT+d09Zu
	gPVsCJ33Y7cae3mcMxs90fVJ5zSVMzAPP2n1w8TbUYPoqbwYd0MnKyClysVCp4osRt+PH4/SKLtzd
	JzZgx8oOiR35YHEv9My8voWpM44j63ZrBdINejHzg4cpuluGVxpEPsdRIBI+qgG/6s8qbI1Jvbw91
	lCaK++LQo9bqLHSrS0iDuRhWlSGTNCydMvHZ6y4GXy2uXrjE4pQms/R7+daMxo9upxCwfz7b/M4Kn
	40JhojaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGA6H-0000000CiCX-0wFz;
	Fri, 24 Apr 2026 06:33:18 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGA6E-0000000CiC6-1c3y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777012387; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=8SDLGP7xfTuvBLKrkgTFGSV6/ELHlpEZ9aT6DGRWRtY=;
	b=v3g9sdw7iZKTrayetEWjBAP6YtFahg2eZPMyczU3HdDBZEgKPJPtFBoQdrXgNr6aGSu8e58KlizWq+iAulfEq7pmmj2Gl+TH6IPM+ED1BRWnmDCMKn6MGsKUKiu4ggLcIKVjcDBtsSt6PrUqA+NqrXKOVhOmDFQUtrBNEyo4npg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X1bjMlB_1777012382;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X1bjMlB_1777012382 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Apr 2026 14:33:02 +0800
Date: Fri, 24 Apr 2026 14:33:02 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Wake-up from WFI when iqrchip is in userspace
Message-ID: <uhqgyol622go4lm5btbk4jyieb3swhskpkyel4mnksfeki2mo2@ecnjvxwiqcfw>
References: <20260423163607.486345-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423163607.486345-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_233314_761531_595F6A69 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Apr 23, 2026 at 05:36:07PM +0800, Marc Zyngier wrote:
> It appears that there is nothing in the wake-up path that
> evaluates whether the in-kernel interrupts are pending unless
> we have a vgic.
>
> This means that the userspace irqchip support has been broken for
> about four years, and nobody noticed. It was also broken before
> as we wouldn't wake-up on a PMU interrupt, but hey, who cares...
>
> It is probably time to remove the feature altogether, because it
> was a terrible idea 10 years ago, and it still is.
>
> Fixes: b57de4ffd7c6d ("KVM: arm64: Simplify kvm_cpu_has_pending_timer()")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/arm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 176cbe8baad30..8bb2c7422cc8b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -824,6 +824,10 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
>  {
>  	bool irq_lines = *vcpu_hcr(v) & (HCR_VI | HCR_VF | HCR_VSE);
>

Hi Marc,

> +	irq_lines |= (!irqchip_in_kernel(v->kvm) &&
> +		      (kvm_timer_should_notify_user(v) ||
> +		       kvm_pmu_should_notify_user(v)));

How about a new helper like 'kvm_should_notify_us_irqchip()' ?
We can replace the same part at beginning of kvm_vcpu_exit_request() and
here w/ unlikely().

> +
>  	return ((irq_lines || kvm_vgic_vcpu_pending_irq(v))
>  		&& !kvm_arm_vcpu_stopped(v) && !v->arch.pause);
>  }
> --
> 2.47.3
>


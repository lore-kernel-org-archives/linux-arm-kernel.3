Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52231CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhB9XBoASZEaIPr0CT1pnpt/0SafB3c+6yxK4UJFeHU=; b=HPKPGkIrCdt2lHRbhU0J4hiBeT
	4d4U8hCswX0/HfPnQXT5v1VDCO202mthXVNWOPldUVC1j/sCI19vuMRsCaZBooX1j3sLstntfMp+h
	WQyRAhcAI2dHTRbMQWMwV9mtVCVmtlXBFonJ/P2I0R21txtwWhJdMDrRNMjdVxIsb42u+UKo4EjAJ
	aYsLSpJ5snWvZXBHShUIPV5uj3KF18jWKHn2MIv6tjPbVFVC8SnrL5YYu8ztjlIySYEaLjHjy2x/W
	1cF8Cj98rBiU85dyOVUq02FZr3HyQ2qpZJxrnhg9LnhBZHXDJRwOaq/EJNjOl2scQc51jX45jCowF
	g6Ik9Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjAN-000000049Ve-0wsd;
	Fri, 19 Sep 2025 22:01:19 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjAK-000000049To-3lrB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:01:18 +0000
Date: Fri, 19 Sep 2025 15:00:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758319264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HhB9XBoASZEaIPr0CT1pnpt/0SafB3c+6yxK4UJFeHU=;
	b=gRrKmvAxzdFhtfFtQm5oCDKyPVYgW8khy+blMu1uvXudiSmtqG1OGrvgsibbKknQgBZOzd
	P6Ixvt7X41TAc3ys29H3ScxCr10GiESRicAGewna1GcZqmyNU9Uji47jrCma1i2wIw3Viz
	oWMHSxUOoNBQL079WcvMrCrnoWXend0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 07/16] KVM: arm64: Populate PAR_EL1 with 52bit
 addresses
Message-ID: <aM3Sm4vKZUw2Nu_L@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-8-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_150117_080215_9C84BE5F 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, Sep 15, 2025 at 12:44:42PM +0100, Marc Zyngier wrote:
> Expand the output address populated in PAR_EL1 to 52bit addresses.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/at.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 952c02c57d7dd..1c2f7719b6cbb 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -844,7 +844,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  	} else if (wr->level == S1_MMU_DISABLED) {
>  		/* MMU off or HCR_EL2.DC == 1 */
>  		par  = SYS_PAR_EL1_NSE;
> -		par |= wr->pa & GENMASK_ULL(47, 12);
> +		par |= wr->pa & GENMASK_ULL(52, 12);

That should be bit 51, no?

Maybe just use SYS_PAR_EL1_PA as the mask.

>  		if (wi->regime == TR_EL10 &&
>  		    (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_DC)) {
> @@ -877,7 +877,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  			mair = MEMATTR(NC, NC);
>  
>  		par |= FIELD_PREP(SYS_PAR_EL1_ATTR, mair);
> -		par |= wr->pa & GENMASK_ULL(47, 12);
> +		par |= wr->pa & GENMASK_ULL(52, 12);

Same here.

>  		sh = compute_s1_sh(wi, wr, mair);
>  		par |= FIELD_PREP(SYS_PAR_EL1_SH, sh);
> -- 
> 2.39.2
> 

Thanks,
Oliver


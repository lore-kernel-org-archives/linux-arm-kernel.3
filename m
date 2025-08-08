Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBC0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 00:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZJOuuw+L4JCEgAlhgRdeSHgvzwy2a3DZREpYyzI0P0=; b=XPZzHPJlRdcKZmaDaPFNQpC/bM
	SpQBt2KuUGcR0PBSQMpx2EdPpttLWmUXW/S8v9GLKRQ3nPQQQHFb9DuhkZ6sGB9AbR/upl29gvQfP
	bfKrMDE/ayQ7J4WsFKChPYku7HOxupZsdA2JdbQpmZBNtb8N0Hq4glJS6m1xgIcNmya0xyHkP/4Sh
	5cm3UQuxLGXvIZB7k20thIFc4GyXe6UC6K0dKKP80PtrwJUCVeIx/a8ch5suDzhaZdRughAeKXWg+
	/jUvVhXiA9aXkYcbIbq/nQkqge8NuqSOjum9zs8ADLX/GasRgPecw6gc90j5FZTetpLNeI7r7CvPD
	xD91kAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukX7V-00000003upc-2r4C;
	Sat, 09 Aug 2025 00:07:34 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukVtT-00000003p8A-3Sc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 22:49:01 +0000
Date: Fri, 8 Aug 2025 15:48:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754693336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZJOuuw+L4JCEgAlhgRdeSHgvzwy2a3DZREpYyzI0P0=;
	b=Pw8YByjV545/1c7fBTaoEtEe6bw142ct+rFKef2lDb4d+/XDX3rHueDS6oQK6OWUy3elHa
	2XaCELYPui1H5Pgwjxy3Wr9phxqSCbCch3mr5pSD5zAVG4yon/vQido5k6pgE/xdi8Hf7o
	KSGg2LRITwJacn/nYcst1HHJhLy6LAQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Expose FEAT_RASv1p1 in a canonical
 manner
Message-ID: <aJZ-wCLYh_STGiTI@linux.dev>
References: <20250806165615.1513164-1-maz@kernel.org>
 <20250806165615.1513164-5-maz@kernel.org>
 <20250807125531.GB2351327@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807125531.GB2351327@e124191.cambridge.arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_154900_318939_8BAC39A6 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, Aug 07, 2025 at 01:55:31PM +0100, Joey Gouly wrote:
> On Wed, Aug 06, 2025 at 05:56:14PM +0100, Marc Zyngier wrote:
> > If we have RASv1p1 on the host, advertise it to the guest in the
> > "canonical way", by setting ID_AA64PFR0_EL1 to V1P1, rather than
> > the convoluted RAS+RAS_frac method.
> > 
> > Note that this also advertises FEAT_DoubleFault, which doesn't
> > affect the guest at all, as only EL3 is concerned by this.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/kvm/sys_regs.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 1b4114790024e..66e5a733e9628 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1800,6 +1800,18 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> >  	if (!vcpu_has_sve(vcpu))
> >  		val &= ~ID_AA64PFR0_EL1_SVE_MASK;
> >  
> > +	/*
> > +	 * Describe RASv1p1 in a canonical way -- ID_AA64PFR1_EL1.RAS_frac
> > +	 * is cleared separately. Note that by advertising RASv1p1 here, we
> 
> Where is it cleared? __kvm_read_sanitised_id_reg() is where I would have
> expected to see it:

Actually, I'm a bit worried this change doesn't give us very much value
since Marc already does the exhaustive RASv1p1 check in the sysreg
emulation.

There's potential for breakage when migrating VMs between new/old kernels
on systems w/ FEAT_RASv1p1 && !FEAT_DoubleFault.

Marc, WDYT about dropping this patch and instead opening up RAS_frac to
writes?

Thanks,
Oliver


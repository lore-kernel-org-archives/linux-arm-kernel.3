Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27DBFD4F0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksDXxhaAY3/nfrA68QD3fGkJjj3Wzw0Af1Y1+KsLeSg=; b=K62S5OO4H3nnaCFNZrC0FRAgfT
	gHii7F3Pgahq0+kV3khA73sXeU7a8KZKnc6GWk9SNCQMkUt5/v7UU3Xf/ZkT79Yx4gw5RTWY/7yWC
	MlKyQYHxSc+4ANaDmCKt4FtILjnhOTMOXTYkO2hGBp055rNToM/Z4Z5mvcA06YXaqNyoZlOeVQVCy
	OgofZydRMDSxnmXM0EkM2tCtjeKpAtvKzMbX49ArqfBduBZHLdqYRgss3I+hl5AEb8xFsXi//9M9Z
	vTYkKGea0j2LA84VGOo6xGRCbCfHw0tayNBtArQK4hd6G21F0ZP6rckMoiGYTHD0RTI3L7aX05v6m
	1IwjBN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w015E-0000000A0Fb-1VMY;
	Tue, 10 Mar 2026 17:41:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w015D-0000000A0FI-160W
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 17:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ksDXxhaAY3/nfrA68QD3fGkJjj3Wzw0Af1Y1+KsLeSg=; b=V16WwbUC0IECibGmlCYTyhnMKa
	VXxLQMExRjebry6N+DqWfLtRikAIRQ1FoCXW5vPCkMfg7b32C/IuV1IkIb2lBY2RD5MDLqxz2I6de
	7IhAnMoTvSBP/hKhrajSHeXFtNhETvSV+kfb17AAD5YVezurHEjl3bZK8G+fpieQm/faCQYVe9nin
	lFXrCa+0FQUvrvMTJc+O8mTuAv06QWxV2e24seqr+NoDwh8Y2HDedr90LS/eVvwTNH7SAnTK2jbLc
	XYXWsvO6K0OrSnUnMH5fETxEEjwiBqDjOtXAzBcBm0M24oJBMsNiJbwL8g25Z3sR57ucggHVFeplo
	HagGMs8w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0159-0000000FFHs-32fk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:41:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7141596;
	Tue, 10 Mar 2026 10:41:15 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DD4C3F694;
	Tue, 10 Mar 2026 10:41:18 -0700 (PDT)
Date: Tue, 10 Mar 2026 17:41:07 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND 2/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <2c42eqpjf4m7teualhtgor6kzv7bk2rot4iwdivj6jf7zpe4m6@s3aqt53czzif>
References: <20260308231829.864983-1-weilin.chang@arm.com>
 <20260308231829.864983-3-weilin.chang@arm.com>
 <20260310152604.GA3093715@e124191.cambridge.arm.com>
 <thetpwxswabflbntrrxfsxpej4scwq25qpviv2svmbj7br3w3d@mdrrhsuexsf4>
 <86bjgv7ho1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjgv7ho1.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_174124_112515_CD7B2F63 
X-CRM114-Status: GOOD (  21.82  )
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

On Tue, Mar 10, 2026 at 04:50:22PM +0000, Marc Zyngier wrote:
> On Tue, 10 Mar 2026 16:17:07 +0000,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > On Tue, Mar 10, 2026 at 03:26:04PM +0000, Joey Gouly wrote:
> 
> > > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > > index 5d5a3bbdb95e..f88f6c4d646e 100644
> > > > --- a/arch/arm64/include/asm/kvm_host.h
> > > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > > @@ -217,6 +217,10 @@ struct kvm_s2_mmu {
> > > >  	 */
> > > >  	bool	nested_stage2_enabled;
> > > >  
> > > > +#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> > > > +	struct dentry *shadow_pt_debugfs_dentry;
> > > > +#endif
> > > > +
> > > >  	/*
> > > >  	 * true when this MMU needs to be unmapped before being used for a new
> > > >  	 * purpose.
> > > > @@ -405,6 +409,9 @@ struct kvm_arch {
> > > >  	 * the associated pKVM instance in the hypervisor.
> > > >  	 */
> > > >  	struct kvm_protected_vm pkvm;
> > > > +
> > > > +	/* Nested virtualization info */
> > > > +	struct dentry *debugfs_nv_dentry;
> > > 
> > > Seems like this could be guarded with CONFIG_PTDUMP_STAGE2_DEBUGFS too, or is
> > > there a reason you didn't?
> > 
> > Right, I was thinking this "nested" directory can also hold other NV
> > related information in the future, that's why I didn't keep it behind
> > the option.
> 
> We can cross that bridge when we get there. In the meantime, I'd side
> with Joey and would rather not have a dangling pointer.

Sure!
Let me guard it with CONFIG_PTDUMP_STAGE2_DEBUGFS too.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.


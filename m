Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ED1E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIxrn6gDBkTgraPiBRw+gNRB2bS9Ks0FdtrVzsG+Kzg=; b=EFlzRcTBCBwHHPJge6S1mqSIMA
	SNU2OqCwk27NbOoFx3d8tBfGnOWlueCQsAQFOXgHe/We4Eg7y6lRiyKy6zr3Y8xq7ScISF7OY77/I
	qJlU8WDVJFiOQO8iZbJCRWgEyEdNYy+IlyNpOCZAWMck7mMjTv779a/RIUrafrnAsi+2Sa1fJMHnC
	v8xqEuyiJbqWisPtE2W8L0uaSzgKQ/MwrYzF0er5EWxpcJILbJFdKzT1jONUdXVSY/A4LyZvTCyqO
	rAWzV5vhluxK6nngtZkjoMANbXlTSVFz6+EM5gdHe4pPV49T9u+4aBXhI1mX5WxsrG4nN0S13z21y
	i+9Fkilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7W5-00000007Tpm-0idI;
	Sat, 21 Dec 2024 22:00:09 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7Up-00000007Tjn-0hl5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 21:58:53 +0000
Date: Sat, 21 Dec 2024 13:58:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734818325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UIxrn6gDBkTgraPiBRw+gNRB2bS9Ks0FdtrVzsG+Kzg=;
	b=EknnvT+CTw9gKiB+Xw7ZwYqNKELcHsd1ZsrQW01NthyXKt6fZ8ZuruypV3qFto2Yo3HWBF
	x/2xL5NOOEIZ0/dOeExugYmjUfks51yPerp3hxDq3lbLaV5HjdeRZd/9nQSTYwnB/y5cVA
	tTn4uvrsgtx/rfcl0q+YMkhERjk6BDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 01/12] KVM: arm64: nv: Add handling of EL2-specific
 timer registers
Message-ID: <Z2c6DJYW1_sSbFIw@linux.dev>
References: <20241217142321.763801-1-maz@kernel.org>
 <20241217142321.763801-2-maz@kernel.org>
 <Z2Yb8BWnqpt441V-@linux.dev>
 <874j2xs6hz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j2xs6hz.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_135851_791478_02CEF42B 
X-CRM114-Status: GOOD (  23.58  )
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

On Sat, Dec 21, 2024 at 09:57:44AM +0000, Marc Zyngier wrote:
> On Sat, 21 Dec 2024 01:38:28 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Tue, Dec 17, 2024 at 02:23:09PM +0000, Marc Zyngier wrote:
> > > @@ -3879,9 +4020,11 @@ static const struct sys_reg_desc cp15_64_regs[] = {
> > >  	{ SYS_DESC(SYS_AARCH32_CNTPCT),	      access_arch_timer },
> > >  	{ Op1( 1), CRn( 0), CRm( 2), Op2( 0), access_vm_reg, NULL, TTBR1_EL1 },
> > >  	{ Op1( 1), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_ASGI1R */
> > > +	{ SYS_DESC(SYS_AARCH32_CNTVCT),	      access_arch_timer },
> > >  	{ Op1( 2), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_SGI0R */
> > >  	{ SYS_DESC(SYS_AARCH32_CNTP_CVAL),    access_arch_timer },
> > >  	{ SYS_DESC(SYS_AARCH32_CNTPCTSS),     access_arch_timer },
> > > +	{ SYS_DESC(SYS_AARCH32_CNTVCTSS),     access_arch_timer },
> > >  };
> > 
> > Huh. You know, I had always thought we hid 32-bit EL0 from nested
> > guests, but I now realize that isn't the case. Of course, we don't have
> > the necessary trap reflection for exits that came out of a 32-bit EL0,
> > nor should we bother.
> > 
> > Of the 4 NV2 implementations I'm aware of (Neoverse-V1, Neoverse-V2,
> > AmpereOne, M2) only Neoverse-V1 supports 32-bit userspace. And even
> > then, a lot of deployments of V1 have a broken NV2 implementation.
> > 
> > What do you think about advertising a 64-bit only EL0 for nested VMs?
> 
> I'm completely OK with that.
> 
> Actually, we already nuke the guest if exiting from 32bit context, no
> matter the EL (vcpu_mode_is_bad_32bit() is where this happens).  But
> we're missing the ID_AA64PFR0_EL1.EL0 sanitising, which is a bug. I'll
> send a patch shortly.
> 
> Now, for this particular patch, I still think we should gracefully
> handle access to the EL1 timer from a 32bit capable, non-NV guest.
> Just in case we end-up with a CPU with a broken CNTVOFF_EL2 *and*
> 32bit capability.
> 
> In the end, it doesn't cost us much to support this case, and it helps
> that we can verify that we handle all registers without exception.
> 
> Thoughts?

Absolutely. The only reason I made the comment is because the 32-bit
changes had nudged me into thinking about it. Happy with the patch as
is.

-- 
Thanks,
Oliver


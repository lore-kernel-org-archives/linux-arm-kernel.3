Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D06F557EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OpX43y0/4r3T5hB+uPedYI7HKu6lvLhPOK215SRlmw=; b=27opT3ZAIjhCh8z5dUAfu/Q9UG
	cNGe6V/xDrAyXYx9EjY4fd6D/imSkfClsIALTRUXx87TwFcyaOO2zLNKM/96lB2jvah/U6xL90oNf
	VlSuFnD+KJcdTMsepzTVMA3KuP4e+Nuq2G4Ey83s2cxgKTMLst+1CksfYU/gT84IJK20EtomwaXDx
	MglcWizgwnc+Bkp0MH69n0n1PNbM/DCAlo+uH1lXiIWu86Ep62ICwljyqjAv+FlPuB+Q0dVYgMPf+
	tZiYs1nTIOyM3SAT1opSBiVMTfc2F84EjmgZkx3mE/Ppmx1G1Ke26i59PaX0c1dDA/9HgOLuo5sXx
	4VR1WTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkPY-00000006duQ-2IGX;
	Mon, 20 Apr 2026 08:55:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkPV-00000006du0-2VrW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 740864454E;
	Mon, 20 Apr 2026 08:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3136CC19425;
	Mon, 20 Apr 2026 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675316;
	bh=O5qEzAlW1XZCYge9c/pa7CeB6wV9ZdCNQTkECJw9vIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMYjgzS6ZqypodZLc5FGiz/NHxqDQXP5Kez4CJHNExX767+MBxlUDZlzqmsvKpWh5
	 YdhE4rJTK+WFMAWQTPYRQXXB2C0/8c1NvRLwZezaY5LP/oLF2X3qb3gXOb4o72zqoy
	 T46CAHEkGLlMZzkTu2vqLEvlB4w1evnQUZl3b9Eu6vkXVlOFRyd+NwnjuCwXhPz+Qa
	 sTWm7gYGy4AAFx7MftHJX38DTdx1xjm+Zs8f1cY85PeyBfAfCTbyAqTLFCRqUVWe2t
	 xROkg/I/FRv7jow6EHFweKn+OVy+1GN7dHDsc0OqJGM2B7YGS7i266au38JBxvDI9u
	 bbMWic9XHg+Nw==
Date: Mon, 20 Apr 2026 09:55:09 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeXp7WSqpXNytNPG@willie-the-truck>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aeS4rAeVQ0yJIPYw@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeS4rAeVQ0yJIPYw@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_015517_755313_0C608897 
X-CRM114-Status: GOOD (  29.38  )
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

On Sun, Apr 19, 2026 at 12:12:44PM +0100, Yeoreum Yun wrote:
> Hi Marc,
> 
> > On Sat, 18 Apr 2026 11:34:30 +0100,
> > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > >
> > > > > @@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
> > > > >  	u32 buf_sz;
> > > > >  	size_t rxtx_bufsz = SZ_4K;
> > > > >
> > > > > +	/*
> > > > > +	 * When pKVM is enabled, the FF-A driver must be initialized
> > > > > +	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
> > > > > +	 * the FF-A version or obtain RX/TX buffer information,
> > > > > +	 * which leads to failures in FF-A calls.
> > > > > +	 */
> > > > > +	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
> > > > > +	    !is_kvm_arm_initialised())
> > > > > +		return -EPROBE_DEFER;
> > > > > +
> > > >
> > > > That's still fundamentally wrong: pkvm is not ready until
> > > > finalize_pkvm() has finished, and that's not indicated by
> > > > is_kvm_arm_initialised().
> > >
> > > Thanks. I miss the TSC bit set in here.
> >
> > That's the least of the problems. None of the infrastructure is in
> > place at this stage...
> >
> > > IMHO, I'd like to make an new state check function --
> > > is_pkvm_arm_initialised() so that ff-a driver to know whether
> > > pkvm is initialised.
> >
> > Doesn't sound great, TBH.
> >
> > > or any other suggestion?
> >
> > Instead of adding more esoteric predicates, I'd rather you build on an
> > existing infrastructure. You have a dependency on KVM, use something
> > that is designed to enforce dependencies. Device links spring to mind
> > as something designed for that.
> >
> > Can you look into enabling this for KVM? If that's possible, then it
> > should be easy enough to delay the actual KVM registration after pKVM
> > is finalised.
> 
> or what about some event notifier? Just like:

This seems a bit over-engineered to me. Why don't you just split the
FF-A initialisation into two steps: an early part which does the version
negotiation and then a later part which can fit in with whatever
dependencies you have on the TPM?

Will


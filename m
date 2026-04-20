Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F08F557FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS+gnu4IMb5kbfoR7bG58NmQjl80nPrapQSkPZ8vSek=; b=15EQZT3w7080RXPYBPBEzkfrP7
	IviyXONNuF1oWxeDF03YG5q9Vuy6HSy5Qme6l+Nl+XF1esoGhKTO95YPbTVNclt5e/vaYgqUe0Orl
	q2ph4QCOVnDFC7tiZu24wW5YtUfMVNqby6wzMF0Zga7YJMPgHjNq0tvFHqYwXFs6F7SuENXafZ3cy
	TySb8LYhBXKIpHDYUMaVixuNWYQoZ0H1Jifr4/0Y//TBqUi9D1y1nw41Y7Ba5oJ7YZD9w4fnHv+Lr
	xv3IJR8wAhumVqYUASffiRWcxx5oiNbPdbk50AxjFlJE87QPAiFi5nSFDei4wEXgnHZ+5R/D4+XnA
	UUnGxFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEm5r-00000006k6z-27MX;
	Mon, 20 Apr 2026 10:43:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEm5p-00000006k6i-46mT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 10:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E496560141;
	Mon, 20 Apr 2026 10:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AB8C2BCB6;
	Mon, 20 Apr 2026 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776681784;
	bh=43OQtBHiVkQsJoic6eZI0ym41gkflG3en7sho3mS/20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eauCaia5/Nr2OPkY+4AmlYEHWvbrTWhhvEBDuGYqc7NKZKvX03liCJyAx1blwZfKq
	 IvcJJEX3RpNZvWWKfPzdUD4GSWVRTjXuSqT+XlSdj0mlyQ7cfrBqcTHqrHKuuxVBgh
	 knzLPcoWvt0p8hxz4SJDXRoIk9GW+VtT259VBvmAIilXGJMu6/l50CM4eC/o9E57vn
	 0QXsskS8zWoJdJJDwZC2WSU9lve+W/uKAOchydEBm+3iTt1UqkDy1jdJN94KOsW2RT
	 N5u+IphGQ6physppwYDS4MVQq0kQWEX7buddrqkhgK034fzzgirgwNvLoRLELc7DA1
	 qVAmvcFe1TCcQ==
Date: Mon, 20 Apr 2026 11:42:56 +0100
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
	catalin.marinas@arm.com, sebastianene@google.com
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeYDMEgWdt8F9jWb@willie-the-truck>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aeS4rAeVQ0yJIPYw@e129823.arm.com>
 <aeXp7WSqpXNytNPG@willie-the-truck>
 <aeXxCe4hdizdQbFD@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeXxCe4hdizdQbFD@e129823.arm.com>
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

[+Seb for the pKVM FFA bits]

On Mon, Apr 20, 2026 at 10:25:29AM +0100, Yeoreum Yun wrote:
> > On Sun, Apr 19, 2026 at 12:12:44PM +0100, Yeoreum Yun wrote:
> > > > On Sat, 18 Apr 2026 11:34:30 +0100,
> > > > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > > >
> > > > > > > @@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
> > > > > > >  	u32 buf_sz;
> > > > > > >  	size_t rxtx_bufsz = SZ_4K;
> > > > > > >
> > > > > > > +	/*
> > > > > > > +	 * When pKVM is enabled, the FF-A driver must be initialized
> > > > > > > +	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
> > > > > > > +	 * the FF-A version or obtain RX/TX buffer information,
> > > > > > > +	 * which leads to failures in FF-A calls.
> > > > > > > +	 */
> > > > > > > +	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
> > > > > > > +	    !is_kvm_arm_initialised())
> > > > > > > +		return -EPROBE_DEFER;
> > > > > > > +
> > > > > >
> > > > > > That's still fundamentally wrong: pkvm is not ready until
> > > > > > finalize_pkvm() has finished, and that's not indicated by
> > > > > > is_kvm_arm_initialised().
> > > > >
> > > > > Thanks. I miss the TSC bit set in here.
> > > >
> > > > That's the least of the problems. None of the infrastructure is in
> > > > place at this stage...
> > > >
> > > > > IMHO, I'd like to make an new state check function --
> > > > > is_pkvm_arm_initialised() so that ff-a driver to know whether
> > > > > pkvm is initialised.
> > > >
> > > > Doesn't sound great, TBH.
> > > >
> > > > > or any other suggestion?
> > > >
> > > > Instead of adding more esoteric predicates, I'd rather you build on an
> > > > existing infrastructure. You have a dependency on KVM, use something
> > > > that is designed to enforce dependencies. Device links spring to mind
> > > > as something designed for that.
> > > >
> > > > Can you look into enabling this for KVM? If that's possible, then it
> > > > should be easy enough to delay the actual KVM registration after pKVM
> > > > is finalised.
> > >
> > > or what about some event notifier? Just like:
> >
> > This seems a bit over-engineered to me. Why don't you just split the
> > FF-A initialisation into two steps: an early part which does the version
> > negotiation and then a later part which can fit in with whatever
> > dependencies you have on the TPM?
> 
> Sorry, I may have misunderstood your suggestion and
> I might be in missing your point.
> 
> But, The issue here is that FFA_VERSION, FFA_RXTX_MAP, and
> FFA_PARTITION_INFO_GET, which are invoked from ffa_init()
> as part of early initialisation, must be trapped by pKVM.
> 
> In other words, even the early part of the initialization,
> including version negotiation, needs to happen after pKVM
> is initialized.
> 
> Because of this dependency, simply splitting the FF-A
> initialization into two phases within the driver does not
> seem sufficient, as it still requires knowing when pKVM
> has been initialized.
> 
> Am I missing something?

Ah sorry, I mixed up the ordering of 'module_init' vs 'rootfs_initcall'
and thought you wanted to probe the version earlier. But then I'm still
confused because, prior to 0e0546eabcd6 ("firmware: arm_ffa: Change
initcall level of ffa_init() to rootfs_initcall"), ffa_init() was a
'device_initcall' which is still called earlier than finalize_pkvm().

Will


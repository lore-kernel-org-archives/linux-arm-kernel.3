Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B04CF557F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oBU35fe+Ecs1EBYfON57tV+8FZhM72mKI7SyIWYM8c=; b=PXybkaqF0lagWmRDZSMWAdsQvw
	cIqHDr1vAf0BeiL+38g1wqnKOkf2+gcuMew6wpQAcwyedbjKEtXVFhDMV72Xq7TEXCuIHWHQ9gbgb
	bFG2E9pF7ZCEuMlHsF/oUhEZout/fx3aeJxrDmvi3/DzMRta1IYLxyypEKd2czeL2TF2piSA2pOBr
	is21SSh04eZSnJyNS9udynz9WsXgYq1RABb6bDB7wWHaRlexduOFSmkk2CuMtqZ2n0Rzn3pA6Y5kO
	4ojfqxML9Wdj1c5Zo7WFEG1najS5WzjkUzUKXrF1d/10cWXju9ja/GLbkBYQm5Bh5DBsB+dcMTt9M
	q/67wotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkss-00000006fg2-3y8T;
	Mon, 20 Apr 2026 09:25:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEksq-00000006ffS-0fno
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:25:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 379641516;
	Mon, 20 Apr 2026 02:25:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7313F99C;
	Mon, 20 Apr 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776677134; bh=5ZWOZ1Awo1Bodvdr+l3B4AZiQ8qH26M35oYmXaAHUv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALpasPjhjV0gqvchFfs1EAe5rRLULKlsXeKfj1ATfwQzp6WzWZBQ2aDCGEfGSUc/S
	 gfOkngkAPTDcdZXjxUJ+xg2Mkt9V6Mr9y4V/XHG8VDq1z2SX3vxMXhrE/ivNyQ/Xje
	 TfHXgMa5noXysyjM7r2CEjXb2pGzRzI4e0MVq8CQ=
Date: Mon, 20 Apr 2026 10:25:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <aeXxCe4hdizdQbFD@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aeS4rAeVQ0yJIPYw@e129823.arm.com>
 <aeXp7WSqpXNytNPG@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeXp7WSqpXNytNPG@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022536_456085_9214ED00 
X-CRM114-Status: GOOD (  34.70  )
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

Hi Will,

> On Sun, Apr 19, 2026 at 12:12:44PM +0100, Yeoreum Yun wrote:
> > Hi Marc,
> >
> > > On Sat, 18 Apr 2026 11:34:30 +0100,
> > > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > >
> > > > > > @@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
> > > > > >  	u32 buf_sz;
> > > > > >  	size_t rxtx_bufsz = SZ_4K;
> > > > > >
> > > > > > +	/*
> > > > > > +	 * When pKVM is enabled, the FF-A driver must be initialized
> > > > > > +	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
> > > > > > +	 * the FF-A version or obtain RX/TX buffer information,
> > > > > > +	 * which leads to failures in FF-A calls.
> > > > > > +	 */
> > > > > > +	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
> > > > > > +	    !is_kvm_arm_initialised())
> > > > > > +		return -EPROBE_DEFER;
> > > > > > +
> > > > >
> > > > > That's still fundamentally wrong: pkvm is not ready until
> > > > > finalize_pkvm() has finished, and that's not indicated by
> > > > > is_kvm_arm_initialised().
> > > >
> > > > Thanks. I miss the TSC bit set in here.
> > >
> > > That's the least of the problems. None of the infrastructure is in
> > > place at this stage...
> > >
> > > > IMHO, I'd like to make an new state check function --
> > > > is_pkvm_arm_initialised() so that ff-a driver to know whether
> > > > pkvm is initialised.
> > >
> > > Doesn't sound great, TBH.
> > >
> > > > or any other suggestion?
> > >
> > > Instead of adding more esoteric predicates, I'd rather you build on an
> > > existing infrastructure. You have a dependency on KVM, use something
> > > that is designed to enforce dependencies. Device links spring to mind
> > > as something designed for that.
> > >
> > > Can you look into enabling this for KVM? If that's possible, then it
> > > should be easy enough to delay the actual KVM registration after pKVM
> > > is finalised.
> >
> > or what about some event notifier? Just like:
>
> This seems a bit over-engineered to me. Why don't you just split the
> FF-A initialisation into two steps: an early part which does the version
> negotiation and then a later part which can fit in with whatever
> dependencies you have on the TPM?

Sorry, I may have misunderstood your suggestion and
I might be in missing your point.

But, The issue here is that FFA_VERSION, FFA_RXTX_MAP, and
FFA_PARTITION_INFO_GET, which are invoked from ffa_init()
as part of early initialisation, must be trapped by pKVM.

In other words, even the early part of the initialization,
including version negotiation, needs to happen after pKVM
is initialized.

Because of this dependency, simply splitting the FF-A
initialization into two phases within the driver does not
seem sufficient, as it still requires knowing when pKVM
has been initialized.

Am I missing something?

--
Sincerely,
Yeoreum Yun


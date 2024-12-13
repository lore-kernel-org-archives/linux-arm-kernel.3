Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041DAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZE0kmpgB6eN9cNsKywelPvkWPTPBiDpkbdqR00+YXk=; b=2e7BLBfZI57duiANNOyyHUJOc4
	XT214IDslZ9bQulpiWPZiTVCJyQXyaLV1jZ5MNZ+SqiaN86S9zqQ5czPY0sLr0r107iC2jCe/VOP2
	Z20nkOlU3TKtblVV1KLbA1P4pn6HHGCZVP9DNCBpwTYA9FIA8aWsntLnPrzM+ml6sJHIDGcaRJr/o
	6RB8qn33TTVzMj/s2PbLuoFaF4ONhIF6+0WnOZLtN0hw7TKZzj4jznjtl+225p9EvTWGfogMa921v
	Xh6quK9FKPrNKuqXXlvXjKAd11wBjiFKb1k96BIvNsg27MBseLwE3NNJqJTEakD9NxwTTRPmejMAw
	bXvJ/S+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8NK-00000004Nlw-1sWN;
	Fri, 13 Dec 2024 16:18:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ME-00000004NZi-39ay
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:17:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 288461480;
	Fri, 13 Dec 2024 08:17:58 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969933F5A1;
	Fri, 13 Dec 2024 08:17:28 -0800 (PST)
Date: Fri, 13 Dec 2024 16:17:26 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, corbet@lwn.net, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	liunx-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241213161726.GA30314@mazurka.cambridge.arm.com>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
 <20241211154611.40395-3-miko.lenczewski@arm.com>
 <20241211210243.GA17155@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211210243.GA17155@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_081738_835463_D9FD45AC 
X-CRM114-Status: GOOD (  21.91  )
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

> > +static int do_conflict_abort(unsigned long far, unsigned long esr,
> > +			     struct pt_regs *regs)
> > +{
> > +	if (!system_supports_bbml2())
> > +		return do_bad(far, esr, regs);
> > +
> > +	/* if we receive a TLB conflict abort, we know that there are multiple
> > +	 * TLB entries that translate the same address range. the minimum set
> > +	 * of invalidations to clear these entries is implementation defined.
> > +	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
> > +	 *
> > +	 * if el2 is enabled and stage 2 translation enabled, this may be
> > +	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
> > +	 * disabled, or if el2 is disabled, it will be raised as a stage 1
> > +	 * abort.
> > +	 *
> > +	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
> > +	 * handle a stage 1 abort.
> > +	 */
> > +
> > +	local_flush_tlb_all();
> > +
> > +	return 0;
> > +}
> 
> Can we actually guarantee that we make it this far without taking another
> abort? Given that I'm yet to see one of these things in the wild, I'm
> fairly opposed to pretending that we can handle them. We'd be much better
> off only violating BBM on CPUs that are known to handle the conflict
> gracefully. Judging by your later patch, this is practically keyed off
> the MIDR _anyway_...
> 
> Will

Thanks for reviewing. Apologies for the delay in responding, and for
spam (replied instead of group-replied).

There should not be an option to take another fault while performing the
handler, as long as the mappings covering the fault handler table or any
code in this path are not screwed with. This is discussed further in the
resent patch series [1].

The MIDR revisions will be fixed. I was confused as to which revisions
were affected on an earlier version of the series, and had missed
updating them. The kconfig workarounds should be correct in this regard.

[1]: https://lore.kernel.org/all/084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com/


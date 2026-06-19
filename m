Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DE5CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqdhUFsWUFp2eCGbD2FodqrgQevpgE5RFVgR1OAPSd8=; b=gMpPf1bxcVimtcM3HXxF4LnnpY
	4WsB0j7Tmgmn3n93/jsGJ0clivhdXjmL06NGscLhf1awU67zle/BQXgEXUnfa2cES/LMWB/c1f4SX
	XmbshMu7PVe+7ZpVIR/dyp0ai5HfU8WjzYleF41HVUTnKzWcqyLtSG+TwX1GzavvVA4FRFOJkXeEU
	PfcvX5RCF0Zc7UX3yHZLO1Rh2f2IFMNpDXagMg8NnpgIXmuvasAqdrunPTa58lrRTBqZyZKJs0pET
	9z56XntVsCpKq5FiBCudOJ91hhMqAGl2ulofDPW2ksCtrp4+1Iz5hvResMnzZywHqkc5ysqGszbXI
	N3hraOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabEv-00000002gYe-2eaj;
	Fri, 19 Jun 2026 15:34:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabEt-00000002gWH-0Lr0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:34:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 549C3601E2;
	Fri, 19 Jun 2026 15:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6221F00A3E;
	Fri, 19 Jun 2026 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781883278;
	bh=rqdhUFsWUFp2eCGbD2FodqrgQevpgE5RFVgR1OAPSd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DwNqdVmVr41/zwEfcbZBgrWNfdbO9YSux95QUPaqdHYSzsuo+o6o+oKpeb9f9oLuT
	 cqNBpMlmZhvVDlomyys/BfbstT+siKBoUUboxmW+DA/zNMWZlVopyVaFPaUdYheluh
	 GbXtGKxRs8mKrclsZ1J43dC7vAwHV8Me5dSy0xgCb/IFn6MAZuBQ+g22BhM9OBoWVq
	 n82tVbXgk0uCUhS9aiog14Jd9o2PRTnu5hIqLjftiX0rPB/rF3WOWMT+iebyChFrKz
	 KVmsBnHrrKqttGMCh9bNMzvfB7o+6YVCczHDqx4oBJhpACDA251zNYPr/zyA3ylCe0
	 ucr0US5QvUb+A==
Date: Fri, 19 Jun 2026 16:34:32 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajVhiCXYmbDq-qTi@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
 <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
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

On Mon, Jun 15, 2026 at 04:41:04PM +0100, Ryan Roberts wrote:
> On 15/06/2026 15:43, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> >>>> +	self = smp_processor_id();
> >>>> +
> >>>> +	/*
> >>>> +	 * The load of mm->context.active_cpu must not be reordered before the
> >>>> +	 * store to the pgtable that necessitated this flush. This ensures that
> >>>> +	 * if the value read is our cpu id, then no other cpu can have seen the
> >>>> +	 * old pgtable value and therefore does not need this old value to be
> >>>> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
> >>>> +	 * needed to make the pgtable updates visible to the walker, to a
> >>>> +	 * dsb(ish) by default. So speculatively load without a barrier and if
> >>>> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
> >>>> +	 */
> >>>> +	active = READ_ONCE(mm->context.active_cpu);
> >>>> +	if (active == self) {
> >>>> +		dsb(ish);
> >>>> +		active = READ_ONCE(mm->context.active_cpu);
> >>>> +	} else {
> >>>> +		dsb(ishst);
> >>>> +	}
> >>>
> >>> Why can't you just do:
> >>>
> >>> 	dsb(ishst);
> >>> 	active = READ_ONCE(mm->context.active_cpu);
> >>>
> >>> ?
> >>
> >> Prior to this optimization, we always issued a dsb(ishst) here. Catalin
> >> suggested the same simplification against the RFC. I believe Linu tried it but
> >> saw regressions; Hopefully Linu can provide the details.
> > 
> > I don't follow...
> > 
> > The old code always did dsb(ishst). The proposed code here does either
> > dsb(ish) or dsb(ishst). How can that possibly be faster?
> 
> Ugh, sorry - I read your suggestion as unconditionally issuing a dsb(ish).
> 
> Ignore my previous answer, and now I'll demonstrate my total lack of
> understanding of barriers instead...
> 
> As the comment says, "The load of mm->context.active_cpu must not be reordered
> before the store to the pgtable that necessitated this flush". I thought that a
> dsb(ishst) would only provide ordering between stores. Don't we need the
> dsb(ish) to prevent the load from being reordered before the store?

dsb(ishst) orders prior stores -> everything later. That's why it works
today for ordered a PTE write before a TLBI (which isn't a store).

Will


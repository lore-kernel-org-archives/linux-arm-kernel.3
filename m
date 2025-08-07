Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23062C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1S5Sq3WKKklMgzejhCf0NAV0CagK+MOnsLKM4SNe5Q=; b=bl7Vj7Vs0SkkK+BulGMXChuLeb
	5mQcIfMNseoZTzzMM8VuFTTEW5mMP2WnHV1P0AOTsihnFCoEZFPDcV9tvQ5OvaGT7LN2E8XD8JjbU
	SyqkL9n4up0jq1i1SLFOtcIYnDmH90Z0tr+dl60HbsJn67CY6j5qJBpaDckgIRu0Ot/xzgi+TgyGh
	Lsw6TOSzPP6vhpP/iJTDN/lRvENAJsi55LvGzPScuvOXxJweAy7WsFjfn3Ah7zlHxAWfWuVFwu576
	mWC/4CV4GDm/taG2URfmDmDV6Yp1A6ur7/xbEzuB9kgrh4Tw6dY8dYc+cwrKrTyJiEhAKyBaHSK5y
	WT45HjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0uC-00000000jTv-0lZ0;
	Thu, 07 Aug 2025 13:43:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0rf-00000000j5a-0emv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 13:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D5A9A560EC;
	Thu,  7 Aug 2025 13:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F3C4CEEB;
	Thu,  7 Aug 2025 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754574061;
	bh=375BZlAGU9D1HYGrwP/hldapJabUqFGFwSkWx/PmrJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGG7fkuoZLXMk3vT05sdyfeJBHL6uvP9LGYWzClflbP6F/0KGZZs89OH6tttZftfw
	 gfOVPTX351ZOB3p2AzVz8JfoTL++c7Ju1ZAnHSHfEQg5AheTI67HjtDBhugrVAWAyQ
	 P520ch8tvED3EAbdnwxpv7WYv0IKPaZfbYTQyHTllaRwxBAC6fG2DPip5mFMOqcGH/
	 xYdD65OPnt9fZBhDl8bwPgayztXmqwkXZ1phl0044TegmLg9ecN4392vtBS4oWvSPa
	 dR9U9GiAX7GwSqNlNQGtSU7xingxObrtIQCm3x7QH7xOtu+7GxYDUYUp/Y+uiqNeeB
	 rNCS3vY+qTzqw==
Date: Thu, 7 Aug 2025 15:40:57 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/msi-lib: Fix fwnode refcount in
 msi_lib_irq_domain_select()
Message-ID: <aJSs6dxHIYIGIH0Z@lpieralisi>
References: <20250804145553.795065-1-lpieralisi@kernel.org>
 <87y0ryf9uj.ffs@tglx>
 <aJHNeP2E76liHqUr@lpieralisi>
 <20250806150818.00004a84@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806150818.00004a84@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_064103_258997_37B9E72B 
X-CRM114-Status: GOOD (  31.28  )
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

On Wed, Aug 06, 2025 at 03:08:18PM +0100, Jonathan Cameron wrote:
> On Tue, 5 Aug 2025 11:23:04 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > On Tue, Aug 05, 2025 at 10:31:32AM +0200, Thomas Gleixner wrote:
> > > On Mon, Aug 04 2025 at 16:55, Lorenzo Pieralisi wrote:  
> > > >
> > > > msi_lib_irq_domain_select() is used in other arches, I could not
> > > > test on those (don't know if they have non-[DT/irqchip/acpi] specific
> > > > fwnodes) - from a fwnode interface perspective I think that this patch
> > > > does the right thing, it should not add any issue to existing code
> > > > to the best of my knowledge but it has to be verified.  
> > > 
> > > fwnode handles are architecture and firmware agnostic.  
> > 
> > Yep, though to make sure this does not trigger regressions I started
> > checking (ie I am adding an additional fwnode_handle_get/put() in there),
> > some fwnode helpers (eg fwnode_find_reference()) returns an error
> > pointer rather than NULL on error, it looks like calling
> > fwnode_handle_put() on that value when OF is in use is not a good idea
> > (ie of_node_put() checks for NULL and dereference).
> > 
> > There is code out there that implicitly assumes what fwnode types
> > are used behind the fwnode_* interface or I am missing something.
> > 
> > It is not arch dependent but it looks like it depends on what fwnodes
> > arches use - that's where my caution stems from, nothing else.
> > 
> 
> For the many DEFINE_FREE() uses there is a check of IS_ERR_OR_NULL()
> 
> E.g. Here it would be 
> DEFINE_FREE(fwnode_handle, struct fwnode_handle *, if (!IS_ERR_OR_NULL(_T)) fwnode_handle_put(_T));
> 
> IIRC this one was an early use of DEFINE_FREE() and later discussions
> argued for always adding that check purely to allow the compiler
> to potentially optimize away the call.  Sounds like it would be
> more generally helpful here and I can't immediately spot any negatives.

Neither can I - at present I don't think that's a real problem
(ie we would have noticed) but we can add the additional check
you suggested above.

Thanks,
Lorenzo

> 
> Jonathan
> 
> 
> > Thanks,
> > Lorenzo
> > 
> 


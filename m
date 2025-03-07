Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAtCb1a9mvrDb2uAsAOJmSo4QLnXhdEtm4FnDs/2LOI=; b=ZvuRvxZ900O0n895Vatd+LuqRv
	mBTwaVhF552R0Gk0kKHxIRNBsKnC6QFwryIJHBBfLASzmRU++M0Q6y1IZjd7QGm1T9ZkgwMUOH5SR
	2ASBOKhiSKIM3ea2e+1IzeCGFM1JU2aQKySQ1L3tSfZsZJ39Www88eLIVbq9qQaCgtRW3ANiiIpZb
	5JQPBA1Ute8Tc3bgQxBDcpHhT2L218htGA2PLcbhsZBzsj0RrThlUgiNtD+s7IzGX9crBLzIK8gJY
	DgY268voqq2FAV27JagUUvcWBAZzvyMx3S3iukR8vrfuUq4Kz37Zzx6QG67SZXEQhKEGICWpKQ3Aj
	Jpz3ZMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfQi-0000000Fb1V-2kIZ;
	Fri, 07 Mar 2025 21:40:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfNW-0000000FaS5-473B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EFEFA4536A;
	Fri,  7 Mar 2025 21:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1C4C4CEE5;
	Fri,  7 Mar 2025 21:37:08 +0000 (UTC)
Date: Fri, 7 Mar 2025 21:37:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
Message-ID: <Z8tnARR2jSJEruLw@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
 <Z8s-4OPE2DNSogwB@arm.com>
 <4c621070-688a-4a75-9134-ea19b6d20f04@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c621070-688a-4a75-9134-ea19b6d20f04@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_133711_102949_CF6568AB 
X-CRM114-Status: GOOD (  15.36  )
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

On Fri, Mar 07, 2025 at 06:53:37PM +0000, Robin Murphy wrote:
> On 2025-03-07 6:45 pm, Catalin Marinas wrote:
> > On Fri, Feb 28, 2025 at 05:00:05PM +0000, Kristina Martsenko wrote:
> > > +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
> > > +				  unsigned long esr)
> > > +{
> > > +	switch (ex->type) {
> > > +	case EX_TYPE_UACCESS_CPY:
> > > +		return cpy_faulted_on_uaccess(ex, esr);
> > > +	default:
> > > +		return true;
> > > +	}
> > > +}
> > 
> > Not a problem with this patch but I wonder whether we should return
> > false for EX_TYPE_LOAD_UNALIGNED_ZEROPAD for completeness
> 
> Or maybe rather, true for EX_TYPE_UACCESS_ERR_ZERO and then false in the
> default case?

Yes.

> > (and remove
> > the EX_TYPE_KACCESS_ERR_ZERO, it's no longer used.
> 
> I think that's just hidden in the macro swamp of
> __get_mem_asm()/__put_mem_asm()...

Ah, you are right. I now recall I found them about a year ago but forgot
since.

-- 
Catalin


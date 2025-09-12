Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76091CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gDeU8AQGQoOZmKSbYt/s3y49ykek5V3bTsRDPV3BOM=; b=1aTI4aoirOWjRWlCAAHMGsA7Zt
	vO1TEuNroaKiPvqP5nNcLc2zj9hOgq9auzCgewSYN7tYOpxrPr39k1atAUvQ4WGVqV/W8X6gyd6ud
	O4jkIcDvJhejTo1kptwL3OCWOWruZ33atxhpoY6kGcH9fjAS2+ju+DPLDFsj4rQejvWo3vSicumIW
	1kZ5RFAyVW4WW6td4suuczFfSyMprSWb35N2yTniGAFf9wqWtmCz4Ylvh9VedyFEcegQywbfsT3HF
	gDjHnFKgvl+D8BNmRTqSfFOLbi7b7VBqx5J+JXT3T73Sb5uzR+55+PGBAfl7AqyIQyA1VQK2Pmkph
	oYw3vf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7Nj-0000000AjSX-2Mj9;
	Fri, 12 Sep 2025 17:16:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7Nh-0000000AjR6-0Grn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 17:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC358409FB;
	Fri, 12 Sep 2025 17:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BC4C4CEF1;
	Fri, 12 Sep 2025 17:16:11 +0000 (UTC)
Date: Fri, 12 Sep 2025 18:16:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 6/6] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aMRVWRldi0wJqBpD@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-7-yeoreum.yun@arm.com>
 <aMLpMBWtHDI9sPHK@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMLpMBWtHDI9sPHK@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101617_123166_7C8BC0E1 
X-CRM114-Status: GOOD (  17.52  )
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

On Thu, Sep 11, 2025 at 04:22:24PM +0100, Will Deacon wrote:
> On Sat, Aug 16, 2025 at 04:19:29PM +0100, Yeoreum Yun wrote:
> > +static __always_inline int
> > +__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> > +{
> > +	unsigned int loops = LLSC_MAX_LOOPS;
> > +	int ret, oldval, tmp;
> > +
> > +	uaccess_ttbr0_enable();
> > +	/*
> > +	 * there are no ldteor/stteor instructions...
> > +	 */
> 
> *sigh*
> 
> Were these new instructions not added with futex in mind?

I guess it was _most_ of the futex.

> I wonder whether CAS would be better than exclusives for xor...

I was first thinking we could share some of the code with
__futex_cmpxchg() but...

> > +static __always_inline int
> > +__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > +{
> > +	int ret = 0;
> > +	unsigned int loops = LLSC_MAX_LOOPS;
> > +	u32 val, tmp;
> > +
> > +	uaccess_ttbr0_enable();
> > +	/*
> > +	 * cas{al}t doesn't support word size...
> > +	 */
> 
> What about just aligning down and doing a 64-bit cas in that case?

I think it gets more complicated. Here we get the oldval from the
caller, so no need to do a read. With CAS, we'd need to read the full
64-bit, replace half of it with oldval and newval just to be able to do
the operation. On top of this, we need to check which half of the 64-bit
value. I think it to hairy for little benefit.

-- 
Catalin


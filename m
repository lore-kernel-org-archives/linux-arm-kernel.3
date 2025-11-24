Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B254ACFD34E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5k+QlHwI7+Y2+rSOknCwTrjavJFEEoZVz/kq+73SRA=; b=pW9DkHogCYWx4tKGB/VTgtP/VF
	eY1bLpe1sjWlHVbTLU3a7INwfeAdKRelZpO0A54se68mQJi3eueYwcjdvasac1a9dhh3Rw6wl9csM
	RZtzxG/NNfWx7f02Nnm656EazTsZbN7vwoWxHtk7u/9mcio2Xznfdomejo2W3XTBUfA13PqCkG57E
	4WTm3AY3Pg78ivaAigNh6J84AL2e2sP0HfWpKTPgHMJLqImfzr7Wk5BLEApiDhNi6jpgOkCkxtvyf
	FodbjvIsd3b7qiip0b0SDpr+ofaE0W8xrYoQeB316zGlDX4vbi9aQiykkwG6JtcemMh/1f++I2b19
	+vJkZ4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbxH-0000000CDke-3Oyd;
	Mon, 24 Nov 2025 19:10:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbxF-0000000CDkV-3FmO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9AED60122;
	Mon, 24 Nov 2025 19:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA665C4CEF1;
	Mon, 24 Nov 2025 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011428;
	bh=JPqHRqXoVR3BFq0YCOeqZBWcEnjcQXFhJQoaGkZKN9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjcORZUHd3J4egMs+Z1WXfvFQO5wqEjUs0zUBCntkEsRsSx59bFpjToqOj6DG6WF4
	 7fpI/CLYrNjZn33PpLMajFtYeqFubLsTCV3VXAtYWNmBJ2gtx4HeunMHC+QkVD2jRX
	 Lcph2BMki+0UQ3IOBjkn/yIzhJ/xACsHr49h3j3HcoPIGUVSpQi0D6K7gD/0z2cEap
	 /i6s/IQzvBtM0aj9R9dtXKOCM6j95PirY2lJsCS/6Exsib+sf8CEwaYVotgliJYtFh
	 5i9909+josZ12x1POdHWTPH3yDMpzWVMfWavoTSBH/4wMtW1VZpvYqo3LuOMQUmYQ+
	 f3OhxyghRCRCg==
Date: Mon, 24 Nov 2025 19:10:23 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, rppt@kernel.org,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aSStn55E-omGunwA@willie-the-truck>
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
 <6bc0fac0-3c00-4ecf-948e-5648584ec939@arm.com>
 <aSR1mn8jjzty5J9F@willie-the-truck>
 <fa1def37-b5c6-4652-890d-cae9ab45f82d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa1def37-b5c6-4652-890d-cae9ab45f82d@arm.com>
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

On Mon, Nov 24, 2025 at 06:09:31PM +0000, Ryan Roberts wrote:
> On 24/11/2025 15:11, Will Deacon wrote:
> > On Thu, Nov 13, 2025 at 11:55:48AM +0000, Ryan Roberts wrote:
> >> On 12/11/2025 06:27, Dev Jain wrote:
> >>> The rodata=on security measure requires that any code path which does
> >>> vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
> >>> too. Therefore, if such a call fails, we must abort set_memory_* and caller
> >>> must take appropriate action; currently we are suppressing the error, and
> >>> there is a real chance of such an error arising post commit a166563e7ec3
> >>> ("arm64: mm: support large block mapping when rodata=full"). Therefore,
> >>> propagate any error to the caller.
> >>>
> >>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >> It would be good to get this into v6.18 I guess?
> > 
> > I'm not sure I see the urgency. When the commit message says:
> > 
> >   "there is a real chance of such an error arising post commit a166563e7ec3"
> > 
> > afaict that's either due to -ENOMEM 
> 
> Yes this is the main risk; failing to allocate an intermediate page table during
> split_kernel_leaf_mapping(). I have no idea how likely that is in production.
> The only data point I have is that for the theoretical memory hotplug -ENOMEM
> that Chaitanya and Linu fixed recently, we tried to provoke it by hotplugging a
> lot of memory on a system under high memory pressure; no matter what we did, we
> couldn't get that 4K pgtable allocation to fail. So on that basis, I think we
> are unlikely to see it.
> 
> > or some hideous issue with the
> > page-tables (e.g. the -EINVALs in pageattr_pXd_entry() seem completely
> > unnecessary to me).
> 
> I thought the -EINVALs were trying to catch the case where someone tries to set
> permissions on a sub-portion of a vmalloc_huge() area on a system that doesn't
> support BBML2_NOABORT. But looking again, we already refuse vmalloc_huge in
> change_memory_common.
> 
> > 
> > Do you think failure is actually likely and recoverable?
> 
> As above, I think failure is unlikely, but not impossible. I guess the result
> would be memory that remains RW when it should have been set RO or RX. But I
> think it will all work itself out at vfree. I think.
> 
> We can defer this to next cycle if you prefer.

Yeah, I think we have bigger problems if we can't find memory to allocate
page tables tbh.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E41BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl+bVjEKPw6y3ckKyyNO8Yf83XPzQotfkY2UF8WERwk=; b=V/PP8+pqrrPoRkgdsjMmN7dRsK
	SFqspVT0YWrHDM05Dcunge3B6IGzpwOU0nLdkaF8MpvJWSBK31G4d5M+IzKVGd2S4KzqD8LxPg+du
	bQ4ZFbmP+cp6bMz6/tgPrvXpht7QIM+a/k9it5cVl+2fD+5FU0oRAAgfkIZ3si08wG/MB+TEKTSvR
	uY1WLGH51MLo9sClCUfM2++Xla53odsrbV43WAbHiq8dcZ1j/sEx8MG06svT/9xOXYYlSwZxCMf0X
	IaTNaN4LiThyQrCIIGDcZZQee+DJPIcEdgN8F/SZnkIOjCnZ1tPW5eUUDXIQ9zi0VPJMzLeSQR3bI
	USfLr/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tynCU-0000000FuWC-1jo1;
	Sun, 30 Mar 2025 07:35:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tynAC-0000000FuJD-45aQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 07:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 339D660010;
	Sun, 30 Mar 2025 07:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA77C4CEDD;
	Sun, 30 Mar 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743319979;
	bh=IIDyKI8Qey1PTPb/MvYZR4HnssMujeOxvoCtCZpxi/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDQX425uXxTySy474Zz3RnUXc7LGwElGUanTn1uvh4jNNjEBq7g7tcnsCmqeboPEc
	 WGmt1SQT8IOstk4nvhrT30dX7GfR8RstPHDcHfT6cQFrWE19RP/1p+hBX9iQvWxvgL
	 j709Fw7ZbcMaljePnD5my2ARqp6cskV1tY0ZT+yUWk8ZY+Wuq8ly/XK1h0X29gjx2f
	 UnxGx+gv23n5KDGpbWgTuaC9xyEiPatwB7bw3Rfn5/zGZQ9jpjAyeTlC6SNha/qZws
	 BxUjNHXqni/jfvD1eiA8iJzsCTrlNAeHi/v18cAu9qaQquy3g4vZrIm+ULmG1rM9Eb
	 WA7DYOsQ6NUDg==
Date: Sun, 30 Mar 2025 10:32:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
	gshan@redhat.com, steven.price@arm.com, suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
	urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-jzouwNZwk8Ft-j@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
 <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
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

On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
> On 28/03/2025 18:50, Mike Rapoport wrote:
> > On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> >> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> > 
> >                                                      for vmalloc mappings ^
> > 
> > arm64 does not allow changing permissions to any VA address right now.
> > 
> >> which does not support changing permissions for leaf mappings. This function
> >> will change permissions until it encounters a leaf mapping, and will bail
> >> out. To avoid this partial change, explicitly disallow changing permissions
> >> for VM_ALLOW_HUGE_VMAP mappings.
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.

We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
if there was a code that plays permission games on these allocations, x86
set_memory would blow up immediately, so I don't think Fixes: is needed
here.
 
> >> ---
> >>  arch/arm64/mm/pageattr.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> >> index 39fd1f7ff02a..8337c88eec69 100644
> >> --- a/arch/arm64/mm/pageattr.c
> >> +++ b/arch/arm64/mm/pageattr.c
> >> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> >>  	 * we are operating on does not result in such splitting.
> >>  	 *
> >>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> >> -	 * Those are guaranteed to consist entirely of page mappings, and
> >> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
> > 
> > I'd keep mention of page mappings in the comment, e.g
> > 
> > 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> > 	* mappings are updated and splitting is never needed.
> > 
> > With this and changelog updates Ryan asked for
> > 
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > 
> > 
> >>  	 * splitting is never needed.
> >>  	 *
> >>  	 * So check whether the [addr, addr + size) interval is entirely
> >> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> >>  	area = find_vm_area((void *)addr);
> >>  	if (!area ||
> >>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> >> -	    !(area->flags & VM_ALLOC))
> >> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> >>  		return -EINVAL;
> >>  
> >>  	if (!numpages)
> >> -- 
> >> 2.30.2
> >>
> > 
> 

-- 
Sincerely yours,
Mike.


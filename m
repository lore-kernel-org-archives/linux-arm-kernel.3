Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F598D4978C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spge86DIc8yldpcItP0CUkgFfjggKa+VbBTVmY9hsDk=; b=jHsccTLdNHXRRvdrh6k+VK7esI
	xc3/38AGIQr4xRukazWLEMgF6BUvA6gmouwpao4dP5+tnn0oJJRd6+qHfhEJThLI2+UUsrPglpZSd
	M5TfulYDj4Qm3xgZpfuav3F6z3xLnZf93qKH7BWutgJ+FBMi9RyJuL9KjbBxzFl/oEEvGlPOHNilB
	455+BFsxWqUTmEpQL+E0vIzO/ZhrEhquQoPAmTRiOLLN1cqHy+igMl1EWdhRMokPtlCKKioOg12dn
	DNmGxh5sa0/yPkptgDunOFy46Dbj+AZ+B7xCmQF+AQsOBOsVxOWn6UYOa1+Kd962zDIhkFxykAZj+
	iBYK+zaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHqEA-00000004JVS-0EWF;
	Sun, 01 Dec 2024 20:07:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHqDA-00000004JPG-48jb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 20:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44DF15C636A;
	Sun,  1 Dec 2024 20:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CEEC4CECF;
	Sun,  1 Dec 2024 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733083591;
	bh=aaWvKY5SeUb7dYQQStqcqIh1BRTGwRjbSCfwJgwB3qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBe2hnb4NN7Q9wzlwg6cWgwIJvs6UvM7imwibQYw9DZE26X+tDU9jTLI14lwsWZBr
	 K4aK6k1/T5F9EmezWiBFbW0sBpbjfFP/v4J/hlNwqn2k2pAsC/Cg3HJqokcGRtLxxV
	 1IVArLFgNnXXedF9Z9QBudVNgAfoJG1yE0fqptqercA39/hpCHTIxuA3oR1BJfETSW
	 PpTGgYfhcq3nRgZlGv2Yxd6H8LyF4PMfg7Vws88BMiIYkZMpqwuMrtg/9EULLvIOjT
	 1Id38cq2dvrUivonSKbAPwIOju71HAfMAkXG2cAmPaWd7ZAQQa+S9yQ0d3nKQ2na5M
	 1KxtzgAL2A2hA==
Date: Sun, 1 Dec 2024 22:06:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] arch_numa: Restore nid checks before registering a
 memblock with a node
Message-ID: <Z0zBu1NhzRMfgIIt@kernel.org>
References: <20241201092702.3792845-1-maz@kernel.org>
 <Z0y5xsGgtJrSkyBe@kernel.org>
 <86zflftc87.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zflftc87.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_120633_117184_F4D974B5 
X-CRM114-Status: GOOD (  30.84  )
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

On Sun, Dec 01, 2024 at 07:49:44PM +0000, Marc Zyngier wrote:
> Hi Mike,
> 
> On Sun, 01 Dec 2024 19:32:22 +0000,
> Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > Hi Marc,
> > 
> > On Sun, Dec 01, 2024 at 09:27:02AM +0000, Marc Zyngier wrote:
> > > Commit 767507654c22 ("arch_numa: switch over to numa_memblks")
> > > significantly cleaned up the NUMA registration code, but also
> > > dropped a significant check that was refusing to accept to
> > > configure a memblock with an invalid nid.
> > 
> > ... 
> >  
> > > while previous kernel versions were able to recognise how brain-damaged
> > > the machine is, and only build a fake node.
> > > 
> > > Use the memblock_validate_numa_coverage() helper to restore some sanity
> > > and a "working" system.
> > > 
> > > Fixes: 767507654c22 ("arch_numa: switch over to numa_memblks")
> > > Suggested-by: Mike Rapoport <rppt@kernel.org>
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  drivers/base/arch_numa.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > index e187016764265..c63a72a1fed64 100644
> > > --- a/drivers/base/arch_numa.c
> > > +++ b/drivers/base/arch_numa.c
> > > @@ -208,6 +208,10 @@ static int __init numa_register_nodes(void)
> > >  {
> > >  	int nid;
> > >  
> > > +	/* Check the validity of the memblock/node mapping */
> > > +	if (!memblock_validate_numa_coverage(1))
> > 
> > I've changed this to memblock_validate_numa_coverage(0) and applied along
> > with my patch that changed memblock_validate_numa_coverage() to work with
> > 0:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git/log/?h=thunderx-fix
> > 
> > Can you please verify that it works on your "quality hardware"?
> 
> Commit 427c6179e159b in your tree still has memblock_validate_numa_coverage(1).
> Forgot to push out the updated version?

Argh, indeed. 
 
> Flipping this to 0 locally, I have verified that this still allows the
> old thing to trudge along:
> 
> root@duodenum:~# uname -a
> Linux duodenum 6.12.0-12115-g427c6179e159-dirty #3896 SMP PREEMPT Sun Dec  1 19:43:13 GMT 2024 aarch64

Thanks for testing!
 
> Thanks again,
> 
> 	M.

-- 
Sincerely yours,
Mike.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2745D5CCAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KbX+q+X+LXVY3VJiR6PrFdQFYF2fDOFxzJ5zzS8bHY=; b=fVLa3cLMbdFAwu5UAxrrTeeGME
	dCmt8licukZWZNDayCqLO8a7PrpRNT62eosUB+RsYWj9NAdsSumnqGY1eeN+lIGHqchnPoWjD1Uwp
	41mcteIiJ+TRquk2kDiLbJfc30W3cQSS0zYt49P+kL2LDjFfwwBDQYyJjw8DrGMXEdjclfObtUIG2
	h43TI0w8tuActt5tOV+1+ehAYgsh2w4IuLqxip6OPPqzVo5BCrd0fZt40ZWQYWVimLuqDtdbZAxA6
	5E6QMU2DBz11V9JfcyHY1evHIB7iVoEgvRL0N57CFh13ThP/ZphZHhPRNDLUclMhYXIyL+k6VAQJb
	XtdIsvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68ll-00000000TfV-40WQ;
	Wed, 30 Oct 2024 13:29:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Um-00000000Qj3-3r1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 627565C4963;
	Wed, 30 Oct 2024 13:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6775CC4CEE3;
	Wed, 30 Oct 2024 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730293939;
	bh=GLmPCKsnRLp7UWJOxMGhqO1S7eCnzR3rTDZxud4PtPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0z2elTryGCHcp4StLsu0v6v2EG6rRWLcgnCznBeAokuG9sJvzNvhqsdwPCjFmFFU
	 +R9fIB0gN0UtDK9XSOMmFNb5ybrIddRZ1OhA9gZTByt3rAw/UHMGJ3HHkOgdDfh/To
	 UtR3I//yn80X5mvmimjHxbkYwMdf2qO1tTf7APCxYf6oSH+4lQbsNGibWoAgHUVTiL
	 fccYDnjRCueV2zbW2u2c1su37tWg8zINUJzluecCa9JsmZr+ycspbBZWfC9akFsxmT
	 tIazd/GnZ2ZWCN5c/fAC/kJcUmlC7kBXOvnq1++KnrQEW8An+XTBiPMn62w+nIC31H
	 621pjlrukQ22w==
Date: Wed, 30 Oct 2024 15:08:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Jonathan.Cameron@huawei.com, dan.j.williams@intel.com,
	David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
Message-ID: <ZyIvxWghfaK81I4d@kernel.org>
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
 <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org>
 <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_061221_022984_9747DA1B 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Oct 29, 2024 at 10:03:31PM +0100, Jan Stancek wrote:
> On Tue, Oct 29, 2024 at 5:24 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > > On Tue, Oct 29, 2024 at 4:07 PM Zi Yan <ziy@nvidia.com> wrote:
> > > >
> > > > +tegra mailing list and maintainers
> > > >
> > > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> > > > >
> > > > > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
> > > > > It hangs very early, with 4k or 64k pages, with no kernel messages printed:
> > > > >
> > > > > EFI stub: Booting Linux Kernel...
> > > > > EFI stub: Using DTB from configuration table
> > > > > EFI stub: Exiting boot services...
> > > > > <hangs here>
> > > > >
> > > >
> > > > Is it possible to have earlycon output? It is hard to debug without any
> > > > information except kernel fails to boot.
> > >
> > > I know it was a long shot, so far I haven't had luck getting it to work.
> >
> > Does it boot with numa=off and numa=fake?
> 
> No, it doesn't.
 
No ideas without the logs, sorry.

> > In the log from successful boot it seems there is no NUMA information in
> > the device tree, can you send the device tree as well please?
> 
> https://people.redhat.com/jstancek/aarch64_numa_boot/device_tree
> 
> Regards,
> Jan

-- 
Sincerely yours,
Mike.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0873BC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk9BXGMGll5XoIlIUyv59SEqVo5RfxqKr2JVpkabGA0=; b=Qq0WxJLVPzOQB+eiSXTKKIKX/j
	pcMYlTM6i5r4UMXq3Bs5Jt3x57J+saclzNoJDysKjNqkyV21p+I5inotIUgS9SgiqT9owMs7swZON
	CfeHkoXFrBKA3LS+NYiiNv6nDqfSbK/ZrV+7MPoFrzMGsy8T80DGnSYMSigkD1XjueE6lj+MPLv4Z
	l3Rl3Wbpd2xQ6ftZyaMfPw+x0DwB9D0n5lm1JL4QROyhAZC91Z8y3iAHwrHb9LG5DkFLVO9HtBiJO
	EdxCxuoRd5vC04it+nEcIEaFSC7vLqzOc2sxJFheCkwUC5o69yNZOZ2H6Qfc1/7CMbWfzAVXwvIYn
	m92RVFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsYv-0000000AFr5-029q;
	Wed, 18 Jun 2025 13:10:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5t-00000009xqd-2Jzs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61A6A5C5BC8;
	Wed, 18 Jun 2025 11:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C19FC4CEE7;
	Wed, 18 Jun 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750246600;
	bh=GVLbSPQbFmJsEWhBuQd4bgNbK7h2cLmm5XbplIfuN3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyqeBfE5keSm2NQskHcY9R6uGqvLEzDOJ3+hjLlMh84TIBIekDCJsZzMH3PTRFu5s
	 PuMbvAdmCmbjdQaSRnl7F8zBAZPHk2ATcxpAhGd0VAgHClRKxIySDw3DZXzkgEDuP5
	 shDp5G7odvpIwid+hL3WzrJOJD+1rhbtE5rvPRX3KsJfEJLOcg2/8ukA+vjK21O8Gs
	 kAhHDZRU3aQgPS24WmPyN3f9so4JHOEFG8C2qVfBTurRGJxVzvuYW3AEI5F9AT1+aw
	 FuM43AEMTiUBIvD1V+kVORu+6sYsIzjRISoRwShC4ZktfYYS5bCWCMMTOV2TQIPULe
	 hjbm4xloU2njA==
Date: Wed, 18 Jun 2025 12:36:36 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during
 ptdump_check_wx()
Message-ID: <20250618113635.GA20157@willie-the-truck>
References: <20250609041214.285664-1-anshuman.khandual@arm.com>
 <20250612145808.GA12912@willie-the-truck>
 <5c22c792-0648-4ced-b0ed-86882610b4be@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c22c792-0648-4ced-b0ed-86882610b4be@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043641_631270_B24B953B 
X-CRM114-Status: GOOD (  21.75  )
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

On Fri, Jun 13, 2025 at 10:39:02AM +0530, Anshuman Khandual wrote:
> 
> 
> On 12/06/25 8:28 PM, Will Deacon wrote:
> > On Mon, Jun 09, 2025 at 05:12:14AM +0100, Anshuman Khandual wrote:
> >> The arm64 page table dump code can race with concurrent modification of the
> >> kernel page tables. When a leaf entries are modified concurrently, the dump
> >> code may log stale or inconsistent information for a VA range, but this is
> >> otherwise not harmful.
> >>
> >> When intermediate levels of table are freed, the dump code will continue to
> >> use memory which has been freed and potentially reallocated for another
> >> purpose. In such cases, the dump code may dereference bogus addresses,
> >> leading to a number of potential problems.
> >>
> >> This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
> >> ("arm64/mm: Hold memory hotplug lock while walking for kernel page table
> >> dump")' but a same was missed for ptdump_check_wx() which faced the race
> >> condition as well. Let's just take the memory hotplug lock while executing
> >> ptdump_check_wx().
> > 
> > How do other architectures (e.g. x86) handle this? I don't see any usage
> > of {get,put}_online_mems() over there. Should this be moved into the core
> > code?
> 
> Memory hot remove on arm64 unmaps kernel linear and vmemmap mapping while
> also freeing page table pages if those become empty. Although this might
> not be true for all other architectures, which might just unmap affected
> kernel regions but does not tear down the kernel page table.

... that sounds like something we should be able to give a definitive
answer to?

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3AFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uqyZbYFjivdSJP0aMKKIEPMrtOqIr8aCoIxoeOYNsA=; b=y2il3nORxi2LONqdC0BuK/3od6
	mxioNJQABi+PQN0T42JbPNO/YOpuW8KUzXv+0/thDqlBgmvW+Ma57tazv/6CqvoE306Ax2x/NXaCF
	pn8y5zQbzqFfARL9BNtSK3Bt60SoUPet75ytKb0/2/yqz++4xCr7tk056+P/H+Vc/QmELtMOUQf9q
	1MF7PWLym08wAlM4R+CWaKwcHaIZVrWaOmlZ1t6g6GzSOHB0Ll+54zIBlCt/pW63zd4h5267sTxYq
	0Wuu6lE9SelGGVC4m24hHtKOF5f+yFHptdl1QVCZDyqzTkD5swLJQ4borjRkQXUucr7FwVNi8bKPH
	Qu1SYn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zbu-0000000GZM8-2R5x;
	Sat, 19 Sep 2026 18:16:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zbs-0000000GZM1-2rUa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 18:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1A7E6025A;
	Sat, 19 Sep 2026 18:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280241F000FF;
	Sat, 19 Sep 2026 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789841783;
	bh=8uqyZbYFjivdSJP0aMKKIEPMrtOqIr8aCoIxoeOYNsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ENHB77X3aUbsDqyvI1CoPjMBuwQZMSMFu1h+acmovvPzxMXxPe+dNgXbATWtMjBeh
	 KiICsrUSkrsAFRHzcfZ10WBgEhU2KM+sDkooqe34615pc9g1lboPNpBxdM7Qe4pKM6
	 NbHrRlX+WCJ8wgu8vvxpOh33Pi8BBA5sypjSSRGhJCzFntygX05h22SjTJn0pNSxX3
	 is1kqpjuLNXIU/z74djRdfY6ZrB96EW9UiLPHT4gv/3SrynG6rqIZwKjQVEQDLsMNl
	 qotje6z2g6NAGTrnmBWukovQuJgXrmwMYrQPfHRraCDb+7EYfqk/grtrXRpPxHDdgl
	 rGDAusNVQm0iQ==
Date: Sat, 19 Sep 2026 11:16:21 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
Message-ID: <aq7RdZqJNNtqmaQ7@kernel.org>
References: <20260810005616.13227-1-kmehltretter@gmail.com>
 <178984145401.38162.12449211285441501967.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178984145401.38162.12449211285441501967.b4-ty@kernel.org>
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

On Sat, Sep 19, 2026 at 11:11:14AM -0700, Oliver Upton wrote:
> On Mon, 10 Aug 2026 02:56:16 +0200, Karl Mehltretter wrote:
> > The consolidation of the breakpoint and watchpoint register accessors
> > switched DBGBXVR<n> from trap_bvr() to trap_dbg_wb_reg(). The latter
> > selects backing storage with demux_wb_reg(), which only handles Op2 values
> > 4 through 7. Since DBGBXVR<n> uses Op2 1, an AArch32 guest access hits
> > KVM_BUG_ON() and marks the VM dead.
> > 
> > DBGBXVR<n> aliases DBGBVR<n>_EL1[63:32], and its AA32(HI) descriptor
> > already selects the upper half. Map Op2 1 to dbg_bvr[] alongside Op2 4,
> > restoring the pre-regression behavior.
> > 
> > [...]
> 
> Thanks for pinging, this slipped between the cracks.
> 
> Applied to fixes, thanks!
> 
> [1/1] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
>       https://git.kernel.org/kvmarm/kvmarm/c/239763bda716

This is now 6b1bca1b1ab7, didn't grab the Cc: stable in the first pass.

Thanks,
Oliver


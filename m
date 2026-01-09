Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CE2D1A63C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRbYNy1t4U8HTyBc1/c9vD3h/OasinrgoXKcpbjx78o=; b=SRo9e5O7JlunxZTpglhXOXlM4P
	740uv4xTWz4P/nXV9vwCFQyeNEqwDL7tEkMlHNHv04pv7baUX7HgH1TS+ZtsylA1ZfR3cpgQsVej3
	RAGeU6Lbkoj1UJ74W5s6g6fmp117nacTbBkcHmafO8THqom+pBiPgHEbNrx4S/gj/m5EPyPXwQ7eB
	rXjYW/ps2QhmGnjqmEZBRNj1V9h47vRn4Ov3iFFesf6oltMId5Mh2kovvj1m9DzMq34DNfvtMgRG3
	WSnHTjQMYvrEnSwkri6h2rqGjOANC/vpIGhOTJyl/NES6NMviqrG6Rh6H31BmHLjX28OqdCpT5gEu
	kXn69pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE2h-00000002S5c-0AAB;
	Fri, 09 Jan 2026 15:04:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE2d-00000002S4o-3AlI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E95941B69;
	Fri,  9 Jan 2026 15:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FEEC4CEF1;
	Fri,  9 Jan 2026 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767971083;
	bh=NTHAIMWKRvVNaDIczbnhudQH1H83cIjU7GlMUz7sbuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liTmXKJVPrwDDFTZUTUMLnfd24HIt/o1WhFrQeXzwFuApirgG5AR2hzQMsl2FzTgI
	 X48nu0klTOa+twXjM8t+ZVUDpZVYN65rPmTG1IPYTOFa0w6mHkgLHmXZqFCVIlvZJz
	 NZ1hQWNUT4dKDLiCSjXf9n+fvJ2LGtsKUUJa6GT/aYmzs7xILNrAOSNXErn04KveXe
	 +Bf3OtRUZsmlz7rmFSvpUZhfJZdOv8vfvy90m96XnDP6P0XodEUr38WzSS6bR+X63U
	 UK3KXhYxO5f91bQOoZYaCgTlK9aErSPQ63dNSK+FiKXqjBUpc3pKBHJLKAv90ZgPqy
	 Y0ggRJn8LVMmw==
Date: Fri, 9 Jan 2026 15:04:37 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 27/30] KVM: arm64: Add some initial documentation for pKVM
Message-ID: <aWEZBWWX6EpZd33S@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-28-will@kernel.org>
 <aV0xaa8MpsmxMMkL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV0xaa8MpsmxMMkL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_070443_817586_F4221ACA 
X-CRM114-Status: GOOD (  19.36  )
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

On Tue, Jan 06, 2026 at 03:59:37PM +0000, Vincent Donnefort wrote:
> On Mon, Jan 05, 2026 at 03:49:35PM +0000, Will Deacon wrote:
> > +CPU memory isolation
> > +--------------------
> > +
> > +Status: Isolation of anonymous memory and metadata pages.
> > +
> > +Metadata pages (e.g. page-table pages and '``struct kvm_vcpu``' pages)
> > +are donated from the host to the hypervisor during pVM creation and
> > +are consequently unmapped from the stage-2 identity map until the pVM is
> > +destroyed.
> > +
> > +Similarly to regular KVM, pages are lazily mapped into the guest in
> > +response to stage-2 page faults handled by the host. However, when
> > +running a pVM, these pages are first pinned and then unmapped from the
> > +stage-2 identity map as part of the donation procedure. This gives rise
> > +to some user-visible differences when compared to non-protected VMs,
> > +largely due to the lack of MMU notifiers:
> > +
> > +* Memslots cannot be moved or deleted once the pVM has started running.
> > +* Read-only memslots and dirty logging are not supported.
> > +* With the exception of swap, file-backed pages cannot be mapped into a
> > +  pVM.
> > +* Donated pages are accounted against ``RLIMIT_MLOCK`` and so the VMM
> > +  must have a sufficient resource limit or be granted ``CAP_IPC_LOCK``.
> 
> Perhaps worth to add that there's no runtime reclaim either so the accounting
> will only grow until the VM is destroyed?

Good idea, I'll extend this to cover that. We just need to remember to
remove it when we add support for the relinquish hypercall.

Cheers,

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B5CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXEXSfYdP9D5YAcS2gNb1pyS/spCc6I6rEErBNfP9UM=; b=myYhsvS38U5i9KTlKL74ZzJsl/
	zbIGmP7kDcnou9TO3VgBbSJG96xDfkfyQ9MH/sZFaRCwX16sOW4gj9lOQr0/RrppuyFmJzk4KvqJx
	SMBNNqrwDjoVZbDXWpt4/10B5Eqj8IcUQRvjikYu7oZoO4F66Q6uiXgJ5nFX9yOUlvQNzE3pk641m
	hXDZQNlUCZla7TGTPQlZykMDNPrvNAwZXiSF9aXOozvFbdFGryk11srIWo/7G/Ita/KtjjS/YQHuQ
	eP8R5hbkNOpZ0qAXrVsqabkfTD0WhAADqX0VzzEWcMs7WOAcRbphjlLFO3eMxV+HpC0S08OXAPYxc
	aHWBDDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOti5-0000000Etf2-0xaJ;
	Mon, 18 May 2026 08:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOti3-0000000EteX-3Lfv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B4260125;
	Mon, 18 May 2026 08:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D594C2BCB7;
	Mon, 18 May 2026 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094342;
	bh=EICJi/aaT88j8x8W/lvgeuwIQy7Ne1BVx13M96VG7Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPrnimecxFQILkNqI4FqV1PHtkcjPiTdr3K5Vg34uVYhioVLvTl5/hHempssR7oaV
	 VlqFIWG/vHomjU+jGHMbx4SWlrwEDnmqARe06BCkDuyXRECVVSgCC5NI7R9xAhFpny
	 lbfWcDjkiOSLqUO4JFuW6hnV0xZYUGa7NbaqntRKMZ+Knalg/gSzeVkjY7BOqJdV1b
	 UvvTr3hHtVxIaBjDpPY+oKwUDbB3rWYAwJfEoqC9XSR5xdv8sapTXK//2TBFtrXRJk
	 Hyo49HId1R8SZ57h61cV/6LsaYbac5y08N2d3xMLYlI8olS0EGZI8x7BYRuX8iFq3p
	 m4PJdH5LxnEng==
Date: Mon, 18 May 2026 09:52:16 +0100
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Introduce S2 walker SKIP return
 options
Message-ID: <agrTQMw4QJX6HGrm@willie-the-truck>
References: <20260515195904.2466381-1-leo.bras@arm.com>
 <20260515195904.2466381-2-leo.bras@arm.com>
 <agq-RyKhBy4CIThm@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agq-RyKhBy4CIThm@kernel.org>
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

On Mon, May 18, 2026 at 12:22:47AM -0700, Oliver Upton wrote:
> On Fri, May 15, 2026 at 08:59:02PM +0100, Leonardo Bras wrote:
> > Introduce S2 walker return values:
> > - SKIP_CHILDREN: skip walking the children of the current node
> > - SKIP_SIBLINGS: skip waling the siblings of the current node
> > 
> > Also, modify __kvm_pgtable_visit() to fulfil the hing on above return
> > values. Current walkers should not be impacted
> 
> I'd rather see something based around new walk flags than introducing an
> entirely new mechanic around return values.
> 
> e.g. you could split the LEAF flag into separate flags for blocks v.
> pages:
> 
> 	KVM_PGTABLE_WALK_PAGE,
> 	KVM_PGTABLE_WALK_BLOCK,
> 	KVM_PGTABLE_WALK_LEAF	= KVM_PGTABLE_WALK_PAGE |
> 				  KVM_PGTABLE_WALK_BLOCK,
> 
> and then let __kvm_pgtable_visit() decide how to steer the walk. You may
> need some special handling to get the address arithmetic right when
> skipping over a table of page descriptors.

I was wondering along similar lines, but maybe it would be useful just
to pass a maximum level to the walker logic? That feels like the most
general case without complicating the existing logic.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67AC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH7PvY7Ek5eU0oUzqvX7kiLyqSsMwpIZ9OKCy4/7MyQ=; b=xl9A/nvRjk4kUYOLKr+HIAF4nS
	kdB3HBshjTv/5hDfBhKIlm0naa3YBq056J1p2MgeZ2ZYD/p8PqSQeJd6/qW2PcoA+Lh/oH4YyfQ7p
	v7bgmKhmEMD9fFbZuyxa55/khk9ZiBUX2InZIkBZ7F1cP5XGUivbI0h/hZsMJhzQ2zuSAf5mwt7xy
	YGGMnyuvYRVqmDDLD0t4hz7/Hzt5EZLlN4zQbrBznJtA1X1oJkOO1BIVblmUv8XNMk4QbNs3UQ/Sg
	ilwGiufk6P+QY6X983zUkpS9MTeGe4Wq/5MwNCslrwmBMCCnjtUxbHcONvDctTUv+c2vrTUjQ1oBw
	btzUo/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cQr-000000083UG-24W6;
	Tue, 15 Sep 2026 23:19:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cQq-000000083Tt-3Vo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:19:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 256B241E96;
	Tue, 15 Sep 2026 23:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8A81F00893;
	Tue, 15 Sep 2026 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789514360;
	bh=GH7PvY7Ek5eU0oUzqvX7kiLyqSsMwpIZ9OKCy4/7MyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8tEdldgVrlZDGnYYRBVfvXzbVbG0GfhvQQ4mfX8TcIc9tbzVexXVf/2nkAYkzism
	 eG1QjaPL1qAKyHkmrYSYr8wuKqtFeJb169Tzpgaetzrg+hTcDUpSZ5c83lXUmwTY79
	 O0h7vj+I68pXIMtKObunRugJ73mbA6MWitsM9gtohUcdC7mbgYv24RWfeaDKyQaYFf
	 Iv+HRs1M4nWlqoeA64HWLuMxgDRswcxHJB+k9xlGt+UstfGNe0e/UDf/O4lZ72bZIU
	 MyPh2kkPsKJI+ju8szynHwZOlcpeQEBUG5QqjwBbrBDtKlT4DjZP9WA+2bU892HLnE
	 Tt4RrQ8f2BSug==
Date: Tue, 15 Sep 2026 16:19:18 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 0/4] KVM: arm64: Reduce overhead of full S2 teardown
Message-ID: <aqnSdjE9puG1fsVL@kernel.org>
References: <20260912104834.3093878-1-maz@kernel.org>
 <8bf3f266-06fd-49e0-8de8-33c7a044e997@linux.alibaba.com>
 <865x086yhr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865x086yhr.wl-maz@kernel.org>
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

Hey,

On Mon, Sep 14, 2026 at 09:14:24AM +0100, Marc Zyngier wrote:
> > Another vCPU can therefore still use that shadow S2. The write lock
> > excludes software page-table updates, not hardware table walks.
> > The following interleaving is allowed:
> > 
> >   vCPU B / hardware walker        vCPU A
> >   ------------------------        ----------------------------
> >   Holds an old reference to T
> >                                   Clears parent, skips TLBI
> >                                   Drops T's last reference
> >                                   T is reused by the allocator
> >   Accesses T via the old reference
> >                                   Performs final VMID-wide TLBI
> >
> > The final flush barriers cannot retroactively protect a table that
> > has already been freed and reused.
> 
> T is a shadow page-table page on the host. How can vcpu B hold a
> reference on that page? It isn't even in the same address space.
> 
> Now, I can see that B could have a VA that *translate through* T, and
> that's rather annoying.
> 
> I'll have a think.

One option that may be worth considering is reusing the KVM_REQ_NESTED_S2_UNMAP
request for emulating VMALLS12E1*. All vCPUs that share the S2 MMU would
be forced to take EL1&0 out of context until the unmap operation
completes, at the expense of an unnecessary kick to vCPUs in a different
MMU context.

A bit hacky but seems more straightforward than wiring up some batching
mechanism for freeing table pages.

Thanks,
Oliver


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E3CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GaktLPPAwRjTAy7G2bavDWSlEaXyB501410XPhpj8U=; b=CW1L5VLKY8KfTYwm7kruFVfn+r
	KwQ3zmkzFdxoLCZpbcpwG50udMCb9QlhFSWbqjxaNj0rR8DnHhr/MirZG8mDaIXmGN5WBEwRHJN4o
	LFG2fqUWZmQb0U4guLRk6F5eJ9QjtGcofm+Er0W0xJ4w2DHy8aJ4vIsqqr4iorvObaLzJB85Jf2+A
	KaJ7MSBb3RGffPXPhwHmbbkEv5Gf98uR1VQYnLHcixWHW1qG4YNonGpVlB6ReSNgoQwK0tKfVFZxB
	E/ZwJoXhxG6AyXNAlUl+oZgVNcilhwia7knfKFJezY7oqVFMltDTnB/M0IRJ2mj/lzaCrMbahnkV2
	9TTtqZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Iyu-00000005X8P-2V7f;
	Sun, 06 Sep 2026 19:56:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Iyq-00000005X7e-44tE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 19:56:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149AA1477;
	Sun,  6 Sep 2026 12:56:40 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A4743F882;
	Sun,  6 Sep 2026 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788724603; bh=y/XPLT2vWCH2Ci7UhdoddehaDK9VeeTuUMEqj2C7FO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGNzfZQmDW7LQcK3lbFzxaP8rK0r7IDbMTGaVvTTr3NDCclKPbY0A64mBlQuD3lMq
	 mz90z8weC54giXjafVk52TczR9jUrSns6tFXr2QLcHGnJbPWzmHZiYnl8tVhxt6KSg
	 ER+D7SLBGAo2PKwffciz94syMFgZ+xpTJnlyng/E=
Date: Sun, 6 Sep 2026 20:56:34 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: Re: [PATCH v5 2/6] KVM: arm64: nv: Introduce guest stage-2 tracking
 structures
Message-ID: <w4kihqs6n7ja7nr4sn3i2r4o2mspwj7k36w2fkh4kheizr6oj3@wfsea5mhnto6>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260810205038.118843-3-weilin.chang@arm.com>
 <87mrtu4c21.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrtu4c21.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_125645_226992_1CCFC3DD 
X-CRM114-Status: GOOD (  21.00  )
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

On Sun, Sep 06, 2026 at 04:47:02PM +0100, Marc Zyngier wrote:

[...]

> > +/*
> > + * Record of a guest stage-2 mapping, storing canonical and nested IPA
> > + * ranges. Both ranges have the same size.
> > + */
> > +struct kvm_guest_s2_mapping {
> > +	struct interval_tree_node canonical;
> > +	struct interval_tree_node nested;
> > +	struct kvm_s2_mmu *nested_mmu;
> > +};
> > +
> 
> I'm trying hard to find a way to reduce the size of this structure,
> because this is IMO the only real problem with this approach.
> 
> Obviously, the only thing we could kill is this nested_mmu field, as
> everything else is used by the interval trees. I can see two ugly ways
> to do that:
> 
> - either we iterate over all shadow MMUs to find the corresponding
>   'nested' node: really costly if we have a lot of mappings and/or a
>   lot of shadow MMUs
> 
> - or we steal bits from the interval_tree_node to encode extra
>   information. One realisation is that all addresses are PAGE_SIZE
>   aligned, meaning that we have at least 12 bits that are always 0. We
>   could, for example, encode an index in the bottom bits of the
>   nested.start field. Probably easy enough, but may require some
>   careful masking (and the addition of an index in the s2_mmu
>   structure).
> 
> The result would be significant, as we could then use a 96 byte slab,
> which means the cost of a 1GB @4k granularity could fall to 24MB.

One way of meeting in the middle is to keep the nested_mmu pointer, and
use a dedicated kmem cache. That cache will then hand out exact 104-byte
objects.

That's 26MB for 1GB @4K.

This is a nice improvement from the current 128-byte allocations.
Although it's not as good as 96-byte allocations, the code logic can
remain simple. Would you take this approach?

Thanks,
Wei-Lin Chang

[...]


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA576C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Hy1VeSMTF9iUq2XhpbbFFgeQLLFh6icfoUYAE0Kppc=; b=xVZsz0sHJKZ1CK6D0pdhzk2Nj2
	DljyHFceCfigvV4dT9huAokm7L9wGdKYeylUizW0i+IJN8T/1Qe4GDMVkQCF7OYnNSTbSTlkOOBb3
	MgCOcxncW9lig/DXCq+BluRfJNqixpBz/f4f+nIzPxzmINQWS1WWjR+cOxWhe6V4LHABm/GgMt3h6
	BIP2Lssp1Annad79eb1sehTysrXhjEr07QdJJlCKGIMuABaxQjChvTz1dV/iJMzkRIPyTIiwpuYjA
	dORsIwH3Zc5RDOj5bl1HKil13JF64Lxnnb5Yx4LnQPhsgJx9OzyLwyDUiOG8OF3fmjK18enS+9Vsq
	QXq2OsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bWI-00000004xtL-1ZMu;
	Tue, 15 Apr 2025 08:19:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bLC-00000004vwT-15sq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A78C5C2EDD;
	Tue, 15 Apr 2025 08:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43F3C4CEDD;
	Tue, 15 Apr 2025 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744704501;
	bh=VY+BI83+U62fNIjSJ7wZ0e9O8YlwQ1ENtS67jWwGC38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2xyBPUqMNLhOrAXNHcjWw0mRb6xsy8l2AiEhAO6HouM3bkxEj/JAgFDAKtQSlrs4
	 m93VH51bjGPzXvSEpII7CwhjYF/fGEDg8YYgiipRQBWlL4OXQxfa0mgLKSRMqHBnZL
	 T++QP26VRKNKwV4CbHFmvtAhGxF5kOteSdkZ5y4Ufzdjs8FW0BDDbhYrZs7OL4MOmR
	 VOyjclC5MFc9iwFRmUJ7teMM9Tqei4+e4iTVxaEpTe281mcc2QpksEp4bPhj5tIRvC
	 XvfU5vy3x9RSB0lfuCjM9N6J4a2FCW4BniGR7nR+YsGlAIcQeBJroWOE4stIFDqTOo
	 pT8CZt5Agg1gw==
Date: Tue, 15 Apr 2025 10:08:14 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/4T7lpXSFgomIai@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
 <Z/kM/+uBsD9DAGjF@lpieralisi>
 <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>
 <Z/zGzjyrEMYMd8cI@lpieralisi>
 <4vtbkgtp5c7vdfdzof46l3fjwwsd66j3tynxub4png57zcau7h@k2treu5vgn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4vtbkgtp5c7vdfdzof46l3fjwwsd66j3tynxub4png57zcau7h@k2treu5vgn42>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010822_411153_0B12002A 
X-CRM114-Status: GOOD (  25.66  )
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

On Mon, Apr 14, 2025 at 10:37:57AM -0400, Liam R. Howlett wrote:

[...]

> > I can go for an IDA unless someone see a point in pursuing the current
> > approach - that I would update according to feedback, at least with
> > this thread you get the full picture.
> 
> Eventually, we plan to swap out the backing of the IDA to use the maple
> tree.  I think we could add range support as part of this change.
> 
> If you were to add an interface to contiguous allocate a number of IDAs
> by putting your loop in the IDA interface, we'd be able to switch that
> to a range store during the conversion and keep the use case visible
> during the planning stages.
> 
> Having that interface would make it obvious the change is necessary and
> wouldn't be missed.

Yep understood but on the other hand it would force me to allocate a set
of contiguous IDs, which is a bit cumbersome with the current IDA
(alloc them one by one - if any fails to be contiguous restart, rince,
repeat - it is a double whammy).

I allocate a range because I know the maple tree handle them efficiently
and to be honest, a range allocator is all I need, there isn't any in
the core kernel (there are plenty - on purpose - range allocators, BPF
range tree and GICv3 ITS LPIs allocator are good examples, I could reuse
them instead of reinventing the wheel).

FWIW, when Alexei implemented the BPF arena he vetted other examples.

https://lore.kernel.org/bpf/20241105212001.38980-1-alexei.starovoitov@gmail.com/

I don't think the code I wrote is that complex either and it minimizes
entry storage waste - probably you don't want to see it in the kernel
because it is not a MT usage you'd expect - storage wise, I need to
measure it but I think it definitely requires fewer bytes than a
preallocated bitmap - when the IDA range API is in I would be glad
to swap to it.

> Unfortunately, I don't really have a timeline on changing the IDA to the
> maple tree.

I understand, it is a chicken and egg situation, see above.

> Please keep me Cc'ed on whatever you decide.

I'd need something promptly, so I will go for a simple solution (bitmap
or IDA 1-by-1) if the current MT one has to be scrapped.

Thank you,
Lorenzo


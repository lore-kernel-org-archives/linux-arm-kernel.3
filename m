Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABB6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC5FV0lhnO8jUrqSZ/Q26h4GS5/5YY/C3gSMSJtZllY=; b=ctMl8+3mSqelICB3CjgU/0CiHh
	+iVXQhhAuzg8OXi5zbcSNww9mzMKv5LH9W9uBkbUuOTIWCuKhoZShEgVENfwn4NhxhO/cHTTs0huu
	OmUkXAsvHXzMvmhUtJTD6L8+o//RY2q6WwkfrxOp68ygu/U1M7doEN/Dyb1FBwA5hmxhE4O3e3ms/
	2EgJ+2PX1/OLfPnkAZwdnsPDeb8sNwQ/xDhQ9Kx76/ZyAjLWrbQ7B0lxQGyqsraAO+xex/C+4sOJ8
	oaC2p1jw2WXYDFEZ/ipVQgMaebVfWD36L7yBdmXfxI7ofAIAgep/eo+vZ5W2TQxqzwFHlbEwj9UmM
	WphGa6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG4J-0000000FCbD-1gyo;
	Fri, 11 Jul 2025 15:53:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFU0-0000000F87l-1T4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F8C4448B9;
	Fri, 11 Jul 2025 15:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD35C4CEED;
	Fri, 11 Jul 2025 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752246975;
	bh=dK4M9uBPxqDrfMVxnPZkLcSIMXrTxzxvvSQ7wb4uqbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXQg5Ts3IrsbbjjSFPKGVDejC9h+eWfW6B6lymOICjdMqvZMystoiJ/5rHxJ5pOzf
	 JCDmctGd+pQPeIOyd3M4+h4HSegH+98ZM+j2+4e6VUZ2tR0BjGur+IGS6I1IqarUQx
	 iAdNkzRmA7eTsUERje7NPM7rbN0ZVAFrwG8DIh/E3iyRyOXgIFw/b+C4wQP1t/VfTw
	 XFqI3KvIgVmNWSAQj66XSXgYdbjbODKMEYMWxhdlCu+WZbNwzuoznPf914oBYMKVT0
	 JVFoG1SqHnsoTFmqGfP0e8mFAHCi0CC4DECIWnA6na2kYGzzVsmnV5hqKPiu2yWQSC
	 HCkqRecou2UOA==
Date: Fri, 11 Jul 2025 16:16:11 +0100
From: Will Deacon <will@kernel.org>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	iommu@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Sarangi, Anirudha" <anirudha.sarangi@amd.com>, maz@kernel.org,
	xueqi.zhang@mediatek.com
Subject: Re: SMMUv3 interrupt handling via custom logic
Message-ID: <aHEqu5mGannB0w6D@willie-the-truck>
References: <0482d84e-871b-4522-b94b-29a97c87ff66@amd.com>
 <43acfcd8-b359-448f-bbb6-da1b71a64f45@arm.com>
 <alpine.DEB.2.22.394.2506271219070.862517@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2506271219070.862517@ubuntu-linux-20-04-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_081616_435646_0CC09B75 
X-CRM114-Status: GOOD (  38.93  )
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

Hey Stefano, [+Marc]

On Fri, Jun 27, 2025 at 12:20:37PM -0700, Stefano Stabellini wrote:
> On Fri, 27 Jun 2025, Robin Murphy wrote:
> > On 2025-06-27 8:19 am, Michal Simek wrote:
> > > We are using smmu-v3 in our SOC and I would like to ask you for
> > > recommendation how to handle our interrupt cases.
> > > 
> > > here is description which we are using
> > > 
> > > smmu: iommu@ec000000 {
> > >      compatible = "arm,smmu-v3";
> > >      reg = <...>;
> > >      #iommu-cells = <1>;
> > >      interrupt-names = "combined";
> > >      interrupts = <0 169 4>;
> > > };
> > > 
> > > but it is missing one important detail which just arise that actually there
> > > is additional HW logic which deals with SMMU interrupts separately.
> > > There is a secure part (global, cmd, event - gerror, cmdq-sync, eventq in
> > > DT)
> > > and non secure part (pri, global, cmd, event - priq, gerror, cmdq-sync,
> > > eventq in DT).
> > > Based on my information all these interrupts should be acked once handled to
> > > be able to get another one.
> > > The driver itself is able to handle them separately but we didn't create any
> > > solution to reach custom HW to do it.
> > > 
> > > I looked at f935448acf46 ("iommu/arm-smmu-v3: Add workaround for Cavium
> > > ThunderX2 erratum #126") which introduced combined IRQs but it looks like
> > > that there is no need for additional ACK of that IRQs.
> > 
> > Per the architecture, SMMU interrupts are logically edge-triggered so there is
> > nothing to clear at the SMMU end (the "interrupt status" is implicit in
> > whatever condition caused an interrupt to be sent, e.g. the event queue
> > becoming non-empty, SMMU_GERROR becoming different from SMMU_GERRORN, etc.)
> > 
> > If this is an Arm SMMU IP (MMU-600/700/S3) then the physical interrupt outputs
> > are most definitely rising-edge. If somone's stuck some interrupt combiner in
> > between those and the main interrupt controller, then yes, that interrupt
> > combiner really should have its own driver.
> > 
> > > The HW logic itself is handling secure and non secure settings for SMMU
> > > that's why would be the best to avoid directly mapping it in Linux.
> > > 
> > > One way to go is to create secondary interrupt controller driver
> > > a) ioremap one with notice about secure part because we are using SMMU only
> > > with NS world
> > > b) firmware based to tunnel accesses via SMCs and allow only access to
> > > limited amount of registers
> > > 
> > > The second way is likely create any hooks in the driver to be able to
> > > provide additional SOC specific hooks.
> > 
> > If this thing is munging *all* the SMMU interrupt outputs as I suspect, then
> > the big problem with that idea is that "the driver" is at least two separate
> > drivers (SMMU and PMU), 3 if it has RAS and you ever want to entertain the
> > idea of kernel-first handling.
> 
> Yeah... I tend to favor simple solutions when possible and the secondary
> interrupt controller driver approach is looking increasingly complex.

I think that's probably the right way to go, though. Moving the
configuration to firmware just means you now have two problems instead
of one.

It looks like MTK may have done something similar:

https://lore.kernel.org/r/20250616025628.25454-7-xueqi.zhang@mediatek.com

so if changes are needed to irqchip to handle the limited capabilities
of the extra logic (as per Marc's comments in the thread above), it
would be good to make sure that's reusable. What I really _don't_ want
is a half-baked, custom interrupt handling mechanism in the IOMMU code.

> In addition to what Robin mentioned, I understand that this email is
> directed to linux-arm-kernel and the LKML, so the focus is naturally to
> solve the problem for Linux. However, let me point out that this issue
> also affects Xen, all hypervisors, and proprietary operating systems.
> The "big problem" is even bigger :-(  Complexity will multiply very
> quickly.

Sounds like you need to feed that back to the geniuses who designed this
hardware :). If you want your hardware to work well with existing
software, it's generally best to build it to spec.

Will


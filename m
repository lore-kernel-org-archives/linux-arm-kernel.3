Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B067D339A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJZPIUyASHKIZLcZxFmHyTQ9c7DQ9IIhScA6QACGQKE=; b=uO2z5NXZobDnkCQfKqhen/RaQE
	CENRgyUFPZSU9RIOGVRAJgzFhNbejOQpMzpzK3O7CFf01tRcwiApnYe2dTtA9fCn7lyMrSERrdYgI
	HBh5dgfNXAKm+nC8z02II7AvzaPfspLcrDQyifwOFcgqWNfFFxse6ypzHHPaTgfnDx3ACdXB0NjBv
	0+mYVrSYLu3biCLfO8m4fWZE9oEyQuBhIqmd4xfNCnGEwB/JoF+KqnQH0h17RHNFjGUYJNj/imoAX
	xs1mbO5gIZF90E+Q+4Rt0D7D3t9mMfu7Crl8UNnGeoZ0CVJ2KYQ1eIHxhAsC37PDKtZUH2NUzhJLL
	v2ZBlvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TNE-0000000BdKd-0YJ9;
	Mon, 28 Oct 2024 17:17:48 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TIX-0000000BcYU-00Eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:12:58 +0000
Date: Mon, 28 Oct 2024 10:12:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730135573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJZPIUyASHKIZLcZxFmHyTQ9c7DQ9IIhScA6QACGQKE=;
	b=ISoeuTHAKwgwBa2kBiuaCcAGs7PdxTWGaWY/mOQZ9bZkhdCOVcSRoidFFrOLPrTdVkuGrV
	dzVigfMa+dOk0U+4Wokxm7lP7150WrsL30abwP2Oe6nC8YZw/zchsSxzefQykjeM7+Q5B6
	JaC3dxU+91EV66rlqx4xWmYmItFxONM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, stable@vger.kernel.org,
	syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH] KVM: arm64: Mark the VM as dead for failed
 initializations
Message-ID: <Zx_GDqLO4lBQHnxL@linux.dev>
References: <20241025221220.2985227-1-rananta@google.com>
 <Zxx_X9-MdmAFzHUO@linux.dev>
 <87ttcztili.wl-maz@kernel.org>
 <Zx0CT1gdSWVyKLuD@linux.dev>
 <CAJHc60wn=vA9j421FhVkMqYc0w8u2ZYuc-9TJ+rvriSXjseKHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJHc60wn=vA9j421FhVkMqYc0w8u2ZYuc-9TJ+rvriSXjseKHw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_101257_514144_CBE7854E 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, Oct 28, 2024 at 09:43:45AM -0700, Raghavendra Rao Ananta wrote:
> On Sat, Oct 26, 2024 at 7:53 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> > On Sat, Oct 26, 2024 at 08:43:21AM +0100, Marc Zyngier wrote:
> > > I think this would fix the problem you're seeing without changing the
> > > userspace view of an erroneous configuration. It would also pave the
> > > way for the complete removal of the interrupt notification to
> > > userspace, which I claim has no user and is just a shit idea.
> >
> > Yeah, looks like this ought to get it done.
> >
> > Even with a fix for this particular issue I do wonder if we should
> > categorically harden against late initialization failures and un-init
> > the vCPU (or bug VM, where necessary) to avoid dealing with half-baked
> > vCPUs/VMs across our UAPI surfaces.
> >
> > A sane userspace will probably crash when KVM_RUN returns EINVAL anyway.
> 
> Thanks for the suggestion. Sure, I'll take another look at the
> possible things that we can uninitialize and try to re-spin the patch.
> 
> Marc,
> 
> If you feel userspace_irqchip_in_use is not necessary anymore, and as
> a quick fix to this issue, we can get rid of that independent of the
> un-init effort.

It's a good cleanup to begin with, even better that it fixes a genuine
bug.

Raghu, could you please test Marc's diff and send it as a patch (w/
correct attribution) if it works? I'm willing to bet that we have more
init/uninit bugs lurking, so we can still follow up w/ robustness
improvements once we're happy w/ the shape of them.

-- 
Thanks,
Oliver


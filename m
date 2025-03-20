Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15792C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+nATEGPwxa2fwpxH+oyQjnjtO3F1E78wE3wcZDa8qM=; b=a29sCwCqEwa+3ve9t5nXRPwPBb
	WQMm7jnfivAzoPNArZLpT1vZWoS+YLbE8kFPA3yqIJquax7e/wNXYssMzbI8d/rtJQNivwxpv9qSM
	vgPclTR6Y1+N/iFZbxTLlG1l5xrPpqFcMoM0twjVdWcWs9FJAzHCFMJL/uC6fus7bG6U6BGmtXLyJ
	93YI1gRyG7nclHMO0B/GrhaW46jcTapj2I1BbzM0QASFdYE9qyB8GY4xQNHVwuuxFxw2UuyWOcBRz
	g9OvOqUf7t2kHjK4wqTgymlPC3xpmD4aYQD3CtkFrxbYZzARm2hYclmVVC+YKRhfHwPCARhE6e80j
	N8qxBhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvK5N-0000000Cs6M-3KLd;
	Thu, 20 Mar 2025 17:53:41 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJwN-0000000CqT2-1lYP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:44:24 +0000
Date: Thu, 20 Mar 2025 17:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742492660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T+nATEGPwxa2fwpxH+oyQjnjtO3F1E78wE3wcZDa8qM=;
	b=JTCyBZ6mjiYhZGkv782PMWnYrzrKTbJ3koWgqojfxmL4ewWviXPY0IyXE8HjwsaLSf10Wc
	NlnV38ZtLi9zY89NSxiMVnXzGuD9xU4Er7f+X8odYLu78qoIK7anhWcMI6CtIv0I/jpVBR
	ltETHPFcSerr+Yyx7eDLcRRzlzAunQw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
Message-ID: <Z9xT4_fwCgp7VSgC@linux.dev>
References: <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
 <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
 <86msdhmemw.wl-maz@kernel.org>
 <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
 <86ldt0n9w1.wl-maz@kernel.org>
 <Z9sSMJAlf7cQ5viu@linux.dev>
 <86h63om54p.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h63om54p.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104423_603678_C8B06F0B 
X-CRM114-Status: GOOD (  26.01  )
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

On Thu, Mar 20, 2025 at 09:19:02AM +0000, Marc Zyngier wrote:
> On Wed, 19 Mar 2025 18:51:28 +0000, Oliver Upton <oliver.upton@linux.dev> wrote:
> > I'm at least willing to plug my nose and do the following:
> > 
> >  1) When the VMM does not specify a vPMU type:
> > 
> >    - We continue to present the 'default' PMU (including event counters)
> >      to the VM
> > 
> >    - KVM ensures that the fixed CPU cycle counter works on any PMUv3
> >      implementation in the system, even if it is different from the
> >      default
> > 
> >    - Otherwise, event counters will only count on the default
> >      implementation and will not count on different PMUs
> 
> I think this is confusing. The CC is counting, but nothing else, and
> people using the cycle counters in conjunction with other events (a
> very common use case) will not be able to correlate things correctly.
> The current behaviour is, for all its sins, at least consistent.

You of course have a good point. What Windows is doing is definitely an
outlier.

> > 
> >  2) Implement your suggestion of a UAPI where the VMM can select a PMU
> >     that only has the CPU cycle counter and works on any PMUv3
> >     implementation.
> > 
> > Either way KVM will need to have some special case handling of the fixed
> > CPU cycle counter. That'd allow users to actually run Windows *now* and
> > provide a clear mechanism for userspace to present a less-broken vPMU if
> > it cares.
> 
> Honestly, I don't care about one guest or another. My point is that if
> we are changing the behaviour of the PMU to deal with this sort of
> things, then it has to be a userspace buy-in.

I'm fine with just the user buy-in then. But I still do care about the
guest compatibility issue, especially since the end user of all this
crap is unlikely to know/care about the fine details of the
implementation.

So, Akihiko, I would *greatly* appreciate it if you propose a complete
solution to the problem, including the KVM and VMM patches to make it
all work.

Thanks,
Oliver


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248CFD33992
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HpzFKVfReUYpGSnAB6y94g7QASoiuC/PSTT/yRecTk=; b=RemNpYyNCqQ4UflW6ze2mgdCfy
	UphQ6ZMv2nKtQRTm+EYK1+aFDgIX7VRyYfDMT/yqbuOVLSDwPC7Ls305K90nZqG83SjpuHj7L+KgL
	7sPzh30DWx4/eqp0B5y/AFT1t5I31sk7XN1OkA2ytLdQMEpYwNfxRyMW0fpjc2my4+7Yk9hRSgJEl
	6WvKcUmN2KFfmUD9D8ZZW4nhtTrPg2r4HEsF95wAd9hWyFS0KBAHJJfQ26xm2a8L2V4boMFOYbvBt
	3uOcAmRajmSXGxX7mi5wf/xl2aDA8hgNIzQu38PSyjbubTW2lpBTM2tkVSGli+3zT7Kx0M5xxzDDJ
	p10srXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZAP-00000009jDX-2UTm;
	Fri, 05 Dec 2025 17:00:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZAM-00000009jCy-1FdZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 17:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2806600C4;
	Fri,  5 Dec 2025 17:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9686C19424;
	Fri,  5 Dec 2025 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764954020;
	bh=bQaicZElGWpPclJv8Q7F14L4vqc96yraUR5va+jry88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwWy473Reu64vPTt4Bj3ZOib9vBdWVZ4je+3cT3NlXAffYDSQi3YYjoIx2ymawyel
	 04Ub+oXS9uB41rITYFfzywYfM7Yw9xArA0Fs9ilkdf0lZNFuFVFsqHA+qMHn4pgtwx
	 fUGSWeZdByeLm5ItzsalPUQL+48kA+XxVkylkCC7V2wU25T5s4UVEz7guUg74VhbZG
	 szEykXG4ownraWcIj0dSSONcgGsT4QLdRUGZBtrebHOHNwtBPVJZ6mDupbfgwCWgCC
	 7o4eXJaVke3x7W2UhL6+YDf3DrPwV4kYrw1ty52jBU2B7/hyTG47woFnGWYLw5D6sf
	 T9JJnBdm652Tw==
Date: Fri, 5 Dec 2025 17:00:15 +0000
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com
Subject: Re: [PATCH v1 0/5] KVM: arm64: Enforce MTE disablement at EL2
Message-ID: <aTMPn0dBbSVUwwJ1@willie-the-truck>
References: <20251127122210.4111702-1-tabba@google.com>
 <aS9rmMgNna7I5g4F@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS9rmMgNna7I5g4F@kernel.org>
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

On Tue, Dec 02, 2025 at 02:43:36PM -0800, Oliver Upton wrote:
> On Thu, Nov 27, 2025 at 12:22:05PM +0000, Fuad Tabba wrote:
> > pKVM never exposes MTE to protected guests (pVM), but we must also
> > ensure a malicious host cannot use MTE to attack the hypervisor or a
> > pVM.
> > 
> > If MTE is supported by the hardware (and is enabled at EL3), it remains
> > available to lower exception levels by default. Disabling it in the host
> > kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
> > the feature; it does not physically disable MTE in the hardware.
> > 
> > In this scenario, a malicious host could still access tags in pages
> > donated to a guest using MTE instructions (e.g., STG and LDG), bypassing
> > the kernel's configuration.
> > 
> > To prevent this, explicitly disable MTE at EL2 (by clearing HCR_EL2.ATA)
> > when the host has MTE disabled. This causes any MTE instruction usage to
> > generate a Data Abort (trap) to the hypervisor.
> > 
> > Additionally, to faithfully mimic hardware that does not support MTE,
> > trap accesses to MTE system registers (e.g., GCR_EL1) and inject an
> > Undefined Instruction exception back to the host.
> > 
> > This logic is applied in all non-VHE modes. For non-protected modes,
> > this remains beneficial as it prevents unpredictable behavior caused by
> > accessing allocation tags when the system considers them disabled.
> > 
> > Note that this ties into my other outgoing patch series [1], which also
> > has some MTE-related fixes, but is not dependent on it.
> 
> To be honest, I've actually been having a bit of a hard time
> rationalizing some of these targeted fixes for pKVM. It has been in a
> half working state upstream for O(years) and we haven't made forward
> progress on enabling pVMs.
> 
> Fully aware that guest_memfd has been one of the long poles here, but
> I'm becoming less interested in fixes addressing "pKVM policy is XYZ"
> without having the full picture of the feature.

That's completely understandable and we're similarly frustrated.

> What are the upstream plans on enabling some basic implementation of
> protected VMs?

Funnily enough, I've been hacking on this recently and I've ended up
with something that I think serves as a good basis for enabling pvms
incrementally upstream. I need to clean the patches up but I'll be
flying to Japan and back next week so that gives me a good opportunity
to do exactly that!

In the meantime, I hope you'll still consider fixes for non-protected
guests under pKVM (e.g. [1]), as that is an area where I think we've
made some reasonable progress.

Will

[1] https://lore.kernel.org/all/20251128141710.19472-1-will@kernel.org/


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CB2CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exoYF71mnQYfHh6jQ94nWq8wP/ULR0XH0hX70hEYBmg=; b=tk8AI09ropKnK89BrSiHbAXFap
	cjcvhpbjlR1UfNlDfjBC50J/lYIhwY4mJCOmHxATJW5i4JKJ6C+TEAJaAaJw4i++Z+1YPzTDmrA6R
	AGrb+AS5woDI7YhwJWUFptNE1XvZ4NG3HFCUTdHj6MGiCiwIdLj6heODo1s/wL82mbeLMmkct/ToC
	2gCNZUcA254GVfcoLi4CvXSOg0MQwiRyct43wsYeDvsbxMu8WX673nR/vjljjE/ucXUSMOMni7nD2
	tma7DRdQUBVcWlgPdW5ewPG6uPQV1QQcVPLSHb5dBqPVoJO3Bz2+pyoCnIFyZFAG0+x4JJy/xhWt+
	kUrR/kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yrx-00000004Tl4-1Ls5;
	Wed, 08 Oct 2025 18:26:33 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yrt-00000004Tjm-3tWA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 18:26:31 +0000
Date: Wed, 8 Oct 2025 11:26:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759947984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exoYF71mnQYfHh6jQ94nWq8wP/ULR0XH0hX70hEYBmg=;
	b=epmNAkgGlhEJZyOUN10hOvhoZ5i1y2m9HLL2G3OcPnurM/7SMUqeqYlhJzR9iNqJ5fw5VG
	l0P3mAFIo0HshyNugMrOp/1qO/rsGVuydr3MWQ30PhDc6yPk3SW8Osf2hGpnUKhexDRqth
	KrkCUYhIkp8kUY7LCehBj29pyuSWDrc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <aOasxgCMG0yS4t43@linux.dev>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev>
 <861pndzn4w.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pndzn4w.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_112630_190160_529469B8 
X-CRM114-Status: GOOD (  22.40  )
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

On Wed, Oct 08, 2025 at 11:46:55AM +0100, Marc Zyngier wrote:
> On Tue, 07 Oct 2025 19:31:45 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Hi Mukesh,
> > 
> > I find it a bit odd to refer to cpu_has_spe() in the shortlog, which
> > doesn't exist prior to this patch.
> > 
> > On Tue, Oct 07, 2025 at 11:53:56PM +0530, Mukesh Ojha wrote:
> > > commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
> > > initializes PMSCR_EL1 to 0 which is making the boot up stuck when KVM
> > > runs in VHE mode and reverting the change is fixing the issue.
> > > 
> > > [    2.967447] RPC: Registered tcp NFSv4.1 backchannel transport module.
> > > [    2.974061] PCI: CLS 0 bytes, default 64
> > > [    2.978171] Unpacking initramfs...
> > > [    2.982889] kvm [1]: nv: 568 coarse grained trap handlers
> > > [    2.988573] kvm [1]: IPA Size Limit: 40 bits
> > > 
> > > Lets guard the change with cpu_has_spe() check so that it only affects
> > > the cpu which has SPE feature supported.
> > 
> > This could benefit from being spelled out a bit more. In both cases we
> > check for the presence of FEAT_SPE, however I believe the issue you
> > observe is EL3 hasn't delegated ownership of the Profiling Buffer to
> > Non-secure nor does it reinject an UNDEF in response to the sysreg trap.
> > 
> > I agree that the change is correct but the rationale needs to be clear.
> 
> To me, this smells a lot more like some sort of papering over a
> firmware bug. Why isn't SPE available the first place?

While I agree this points the finger at a half-assed EL3, the
architecture explicitly allows this sort of crap and we cope with the
accessibility of SPE in almost every other case.

We should at least be consistent in how we handle an inaccessible SPE.

Thanks,
Oliver


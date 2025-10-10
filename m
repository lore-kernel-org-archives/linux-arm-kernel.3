Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D000CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bkptGa4qzGPSXKpQfmyXqfdcs/FqgmfOarl0awZkiY=; b=GaxNDAWXGu+GWaLHJVc4Eak3hl
	tm8SNTZCTtNKTINXrAa09EZD0M1gjozw5otHVlL73Dxir31dsIkbqVfK6CtcMF+KGXpz/09Z9p20d
	0T7hlYBXfqNaacsGzoqg+taA6OODxamkxf7kjJbY8APU5nhYAJNNcRamfyDaHkU921qX/3+jA/8oh
	vzp0gTVenuxmeNBDObuZcKKWHy3ZA9tlDJgOBNNkb0vbwojjzAKF4Cvw2L2vHADTmmOYDGnmFtIMg
	lYoNF4IrI6AXK1xm2NEmK84Gk5NWrdS+hAoLzJhm0prqHkbUKczFgKuoKGiST2CguiXjdZX1LO0st
	f5MxEB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79Xs-00000008AzJ-0R0Y;
	Fri, 10 Oct 2025 09:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79Xo-00000008Aye-20vI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 09:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAB241595;
	Fri, 10 Oct 2025 02:36:02 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03CE3F738;
	Fri, 10 Oct 2025 02:36:08 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:36:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH] arm64: Revamp HCR_EL2.E2H RES1 detection
Message-ID: <aOjTg3he873VqEgY@J2N7QTR9R3>
References: <20251009121239.29370-1-maz@kernel.org>
 <aOgpesxEKsnbKGs3@linux.dev>
 <86ldljxgad.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldljxgad.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_023612_560574_6C40FB7F 
X-CRM114-Status: GOOD (  31.52  )
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

On Fri, Oct 10, 2025 at 10:22:18AM +0100, Marc Zyngier wrote:
> On Thu, 09 Oct 2025 22:30:34 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Hey,
> > 
> > On Thu, Oct 09, 2025 at 01:12:39PM +0100, Marc Zyngier wrote:
> > > We currently have two ways to identify CPUs that only implement FEAT_VHE
> > > and not FEAT_E2H0:
> > > 
> > > - either they advertise it via ID_AA64MMFR4_EL1.E2H0,
> > > - or the HCR_EL2.E2H bit is RAO/WI
> > > 
> > > However, there is a third category of "cpus" that fall between these
> > > two cases: on CPUs that do not implement FEAT_FGT, it is IMPDEF whether
> > > an access to ID_AA64MMFR4_EL1 can trap to EL2 when the register value
> > > is zero.
> > > 
> > > A consequence of this is that on systems such as Neoverse V2, a NV
> > > guest cannot reliably detect that it is in a VHE-only configuration
> > > (E2H is writable, and ID_AA64MMFR0_EL1 is 0), despite the hypervisor's
> > > best effort to repaint the id register.
> > > 
> > > Replace the RAO/WI test by a sequence that makes use of the VHE
> > > register remnapping between EL1 and EL2 to detect this situation,
> > > and work out whether we get the VHE behaviour even after having
> > > set HCR_EL2.E2H to 0.
> > > 
> > > This solves the NV problem, and provides a more reliable acid test
> > > for CPUs that do not completely follow the letter of the architecture
> > > while providing a RES1 behaviour for HCR_EL2.E2H.
> > > 
> > > Suggested-by: Marc Rutland <mark.rutland@arm.com>
> > 		^~~~
> > 
> > Thank you *Mark* for the suggestion here, neat trick :)
> 
> Too many Mar[ck]s. I'm struggling! ;-)

Time to file a deed poll. ;)

> > I'd be in favor of this patch being sent to stable, happy to handle the
> > backports if you don't have the time for it. VMs mysteriously dying
> > isn't a very good experience on NV and I'd like to not scare folks away.
> 
> I think Mark (yes, him!) had a plan to backport some of the !FEAT_E2H0
> patches back to earlier kernels. I'll let him comment on that.

Yep; I had a (delayed) plan to backport:

  https://lore.kernel.org/linux-arm-kernel/20250227180526.1204723-1-mark.rutland@arm.com/ 

... to v6.12, as folk are trying to run stable/android v6.12 kernels on
models and HW with the RES1 behaviour, and IIRC we didn't try to handle
this at all back in v6.6 (so no need to backport that far). I was
expecting to backport this patch at the same time.

If someone else has the time to do the backport, I'm more than happy to
leave it to them! Otherwise, I was planning to wait for this patch to
land in mainline before starting that.

Mark.


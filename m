Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27F3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPXde7OALcfEQgF/9k/oQJ8bEHysrV9jUVu6GnX+rW4=; b=COKXhe4sjzLnvSyFzbtLuQ4sMp
	j4X8bj27wppSVDH8PpksTszpoakDJx+9rO4/gyDwuOjTtE9lRgHXIW9yyAWRlqmUwNg3NzBlZ3dzS
	XCjQ/b8rryTY6zuVK82ZmwCRpVlIOEq8y7r6tVcLwaH4bEwCmkX5xfQUtEqZEijrLiwCjaA4l67km
	E0w0V9zf5f5hc0pIlnobqy2z0UfQ3HH0CGc7kx3j7umGc5VOLRWQei9LMGCfSvAYR1b/wSeD7t8m3
	XV6ns2vGQmWKITjajZ/sLCagkOWf/fpGVB1OEbq0tY0EgN7CfpVpoGPIdTWMfIlAB3sLdMWgMaloQ
	dIWNu6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8aA-00000004kQK-11U1;
	Tue, 07 Jan 2025 12:21:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Sw-00000004j6R-2CoT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 855D65C572B;
	Tue,  7 Jan 2025 12:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6044C4CED6;
	Tue,  7 Jan 2025 12:13:42 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:13:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Message-ID: <Z30adHnQ7ZFaU9UR@arm.com>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102160402.GB3990035-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_041346_612133_78D151F8 
X-CRM114-Status: GOOD (  23.31  )
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

On Thu, Jan 02, 2025 at 10:04:02AM -0600, Rob Herring wrote:
> On Fri, Dec 20, 2024 at 12:52:33PM +0530, Anshuman Khandual wrote:
> > This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
> > registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
> > being used in the kernel. This is required to prevent their EL1 access trap
> > into EL2.
> > 
> > PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
> > for now as it does not get accessed in the kernel, and there is no plan for
> > its access from user space.
> > 
> > I have taken the liberty to pick up all the review tags for patches related
> > to tools sysreg update from the KVM FGT2 V2 patch series posted earlier.
> > 
> > https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/
> > 
> > Rob had earler mentioned about FEAT_FGT2 based trap control requirement for
> > FEAT_PMUv3p9 registers that are currently being used in kernel. The context
> > can be found here.
> > 
> > https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.org/
> > 
> > This series is based on v6.13-rc3
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Mark Brown <robh@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: kvmarm@lists.linux.dev
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > Anshuman Khandual (7):
> >   arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
> >   arm64/sysreg: Add register fields for HDFGRTR2_EL2
> >   arm64/sysreg: Add register fields for HDFGWTR2_EL2
> >   arm64/sysreg: Add register fields for HFGITR2_EL2
> >   arm64/sysreg: Add register fields for HFGRTR2_EL2
> >   arm64/sysreg: Add register fields for HFGWTR2_EL2
> >   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
> 
> In case it is not clear, this series should be applied to 6.13 as the 2 
> PMUv3p9 features already landed in 6.13 (per counter EL0 control) and 
> 6.12 (ICNTR). 

So is this a fix that needs backporting to 6.12 or 6.13, e.g. fix for
d8226d8cfbaf ("perf: arm_pmuv3: Add support for Armv9.4 PMU instruction
counter")? It's pretty late in the cycle to take the series for 6.13.

But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL1 and
than traps it at EL2?

-- 
Catalin


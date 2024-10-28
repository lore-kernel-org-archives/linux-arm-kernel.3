Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD45D1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuEu0/1eGUhUp9uVsCOsUp2uMFvFlIjHzY+O20qRa4Q=; b=31pyXWvSQuCT6i7BhQ4Lcc+YIo
	JOj7zF6cAFXHSQOz6u3zHGpMpPLVvaSO3I1Dh+CcS7CJcxhua5f+qkLXHB/YsvaXt5a/usVEqX66t
	Mfqc+S7gINzuU66LkIGTqzQi1Nf9e+ZhsEUC3AYpNuqHk5/PXHsV5mhedTQzxAFCIWqgt8EzueE6M
	x0Wwqd0o0R7zs/mYiTBzxZJtHdxY8dmx6unGc67A+Fcn2qnb8TSKi2x57ZAC7zaxD8RQfAgly+X7s
	ZGUGqVUvdU6sAd37Oqoj/X7POK+dPbuKn/lHHifirj+CVzou3VM0i2N+FxQhbzedl6PmdAWiDKX3a
	VdIHW0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P69-0000000Ao29-0JI7;
	Mon, 28 Oct 2024 12:43:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Oxn-0000000AlqJ-3kIY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:35:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29BE5497;
	Mon, 28 Oct 2024 05:35:45 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E2FB3F73B;
	Mon, 28 Oct 2024 05:35:13 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:35:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
Message-ID: <Zx-E_8SFV74s6xN8@J2N7QTR9R3>
References: <20241001043602.1116991-1-anshuman.khandual@arm.com>
 <20241001043602.1116991-3-anshuman.khandual@arm.com>
 <ZxfOeqyb3RvsdYbU@J2N7QTR9R3>
 <72700154-cbf4-4a0a-b6e2-6f0709dec0ce@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72700154-cbf4-4a0a-b6e2-6f0709dec0ce@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053515_995104_072D570F 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Oct 23, 2024 at 11:42:37AM +0530, Anshuman Khandual wrote:
> 
> 
> On 10/22/24 21:40, Mark Rutland wrote:
> > On Tue, Oct 01, 2024 at 10:06:01AM +0530, Anshuman Khandual wrote:
> >> Fine grained trap control for MDSELR_EL1 register needs to be configured in
> >> HDFGRTR2_EL2, and HDFGWTR2_EL2 registers when kernel enters at EL1, but EL2
> >> is also present. This adds a new helper __init_el2_fgt2() initializing this
> >> new FEAT_FGT2 based fine grained registers.
> >>
> >> MDCR_EL2.EBWE needs to be enabled for additional (beyond 16) breakpoint and
> >> watchpoint exceptions when kernel enters at EL1, but EL2 is also present.
> >> This updates __init_el2_debug() as required for FEAT_Debugv8p9.
> >>
> >> While here, also update booting.rst with MDCR_EL3 and SCR_EL3 requirements.
> > 
> > [...]
> > 
> >> +  For CPUs with FEAT_Debugv8p9 extension present:
> >> +
> >> +  - If the kernel is entered at EL1 and EL2 is present:
> >> +
> >> +    - HDFGRTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
> >> +    - HDFGWTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
> >> +    - MDCR_EL2.EBWE (bit 43) must be initialized to 0b1
> >> +
> >> +  - If EL3 is present:
> >> +
> >> +    - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
> > 
> > AFAICT we need TDA==0 this regardless of FEAT_Debugv8p9 (and e.g. we need
> 
> That's because MDCR_EL3.TDA=0, enables access to many other debug registers
> beside FEAT_Debugv8p9, which are currently used and hence this MDCR_EL3.TDA
> =0 requirement is a not a new one but rather a missing one instead ?

Yes, that's why I said we need it regardless; it's an existing
requirement that wasn't documented.

> 
> > MDCR_EL3.TPM==0 where FEAT_PMUv3 is implemented), so we should probably
> > check if there's anything else we haven't yet documented in MDCR_EL3.
> 
> Will scan through MDCR_EL3 register and match it with existing documentation
> i.e Documentation/arch/arm64/booting.rst. If there are some missing MDCR_EL3
> fields which should be mentioned, will add them via a separate pre-requisite
> patch ?

Yes please.

Mark.


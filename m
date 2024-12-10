Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0C5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr9DX+8qNzfXNyh67RCyfwUonGTIXUPShXCsJ5ttyDU=; b=O2dUJD8DGdPSXPwkz3kAvRAJ5+
	nsmzOKKz2E9GJC1bUiim0SksdTdtpaOfkuni2X8dQn57/2BXbitom74gNVA86noUahqOUqObrc5cm
	dCC+tGG8texptTmwxHm7Pli7b+8eMOYnEDxqkWJTvgjpmAs/Edo7PA2SfHLp6kQz01O5Y9yNPckVV
	GUIFaXW9DNqMK9Seh3I13jdrI/eOW1quRSizOL6E8KIMV5VJ0KwrqQFddTfNAN9K0drk6Rl/6rqB1
	IxKmbGSC9fdSCgExs8vBZbqcRAtvrjXSXBjvtrMVgRg1bm+v4bbstZVieql7IUR7CiU0zhQvlJFzx
	p0Jexh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3gt-0000000CCIy-2vHJ;
	Tue, 10 Dec 2024 17:06:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3fq-0000000CCDD-496B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4330A41796;
	Tue, 10 Dec 2024 17:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DE7C4CED6;
	Tue, 10 Dec 2024 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733850325;
	bh=vaU+OdFiuVkaJ6PMcJ/NEkM/VLKOJSMZuqjDER3Bpz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VV1f8zSKGEMXCGTCBnMhrA+rQFBCZl5bL/h2jdGK8Wcsir+Y9G9PPmgXu8oxBWvTE
	 x7gXi+DeyVO8im7f+lh908tmy23Fbg4xQBZMDTL/nTJ97O7UCmKq+cHZ5gqhKYvd4b
	 q7g1N0FhbNVhu2h28h503mjPz42ul2my6iEtWOV2XzTn6c3KTZ4gbfYFgYR8F1S50Q
	 p0vzgyBCJixO3f7edsXewIg6IND5ZdYsEhTbfz7gFGRPvZdvz2ABIpxtBgjgx2H/3r
	 PPAQitViGoIsCZi25UrbvCf10WC1Kq1+CaIQGRvGBfG8hkkc6sOAmUephMEjXkvagC
	 DLCikw+OPercg==
Date: Tue, 10 Dec 2024 17:05:20 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 5/7] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
Message-ID: <20241210170519.GA16075@willie-the-truck>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
 <20241028053426.2486633-6-anshuman.khandual@arm.com>
 <20241210164144.GA16039@willie-the-truck>
 <Z1hyueAQJTroNIRW@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hyueAQJTroNIRW@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_090527_152867_AD9498CB 
X-CRM114-Status: GOOD (  19.85  )
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

On Tue, Dec 10, 2024 at 04:56:25PM +0000, Mark Rutland wrote:
> On Tue, Dec 10, 2024 at 04:41:44PM +0000, Will Deacon wrote:
> > On Mon, Oct 28, 2024 at 11:04:24AM +0530, Anshuman Khandual wrote:
> > > +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),
> > > +	ARM64_FTR_END,
> > > +};
> > 
> > I think I mentioned this on an earlier series, but it would be useful to
> > see some justification in the commit message as to why some of these
> > features are considered STRICT vs NONSTRICT and why LOWER_SAFE is
> > preferred over EXACT.
> > 
> > For example, why is EBEP strict whereas other PMU-related fields aren't?
> > Why is the CTX_CMPs field treated differently to the same field in DFR0?
> > 
> > I'm not saying the above table is wrong, it just looks arbitrary without
> > the justification.
> 
> FWIW, Anshuman and I discussed that on the v1 thread, after this v2
> thread was posted. Anshuman promised to provide some rationale and make
> some updates in the next version (i.e. v3):
> 
>   https://lore.kernel.org/linux-arm-kernel/8efe902c-8b9f-494a-b9da-430d8ced32ef@arm.com/

Perfect! I'll wait for the v3, then.

Will


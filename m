Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056E5E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu6nYDFw7rietp/Pssp/EajY2lsDMFAoLKDNGIL50QI=; b=XdS3CoDrPmac7OMbGWiDC6AH6J
	gkdOemNzLhICKHOIYpGVZj7lwhXnAqFcOLW6kdS/vJUhmn9L+fo2xzEbCUkVmHHfcNkRdNJnJDi4D
	RJnZBYrwHHE9yKe/SfMw8INmDcx1DwVgHDnhQ6JMzDYw1dqpPa2yiFCf0Jwwo8VC3WhAP93tLUWw0
	NrcDFD15p4MvO12KOh3a7aaIfUjIZCCFqm7hwC0GqQqm4uuMpdHuQXtbqOxdpU6/jJz7hSSXZNwAB
	prP5k3d6dyxZ4dEZLbtkJ/xqZiS1TEYhPtB6m0dYEW2KJgd0EMEeC5N2SRZ+6qaGgpGHH7EH+Umbq
	ALsKwCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJE07-0000000GbFm-33ht;
	Thu, 05 Dec 2024 15:42:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDyR-0000000Gazg-0JB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:41:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430181063;
	Thu,  5 Dec 2024 07:41:30 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 449D83F71E;
	Thu,  5 Dec 2024 07:41:00 -0800 (PST)
Date: Thu, 5 Dec 2024 15:40:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	catalin.marinas@arm.com, joro@8bytes.org, jean-philippe@linaro.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com, ryan.roberts@arm.com
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Message-ID: <Z1HJiUg60kZP4zPb@J2N7QTR9R3>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
 <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_074103_154874_A7C968E8 
X-CRM114-Status: GOOD (  14.89  )
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

On Thu, Dec 05, 2024 at 03:04:11PM +0000, Mark Brown wrote:
> On Thu, Dec 05, 2024 at 01:48:10PM +0000, Robin Murphy wrote:
> >  static inline bool system_supports_gcs(void)
> >  {
> > -	return IS_ENABLED(CONFIG_ARM64_GCS) &&
> > -		alternative_has_cap_unlikely(ARM64_HAS_GCS);
> > +	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
> >  }
> 
> Ah, this is bitrot since the series was on the list for so long.  As
> well as HAFT which Rutland mentioned it looks like _bti_kernel(),
> _irq_prio_masking() and possibly others have the same thing.

In <asm/cpufeature.h>, only system_supports_gcs() and
system_supports_haft() don't use cpucap_is_possible(); all the other
IS_ENABLED() checks are for additional dependent properties, and rely on
the base case being handled in cpucap_is_possible().

In <asm/cpucaps.h> we have:

	static __always_inline bool
	cpucap_is_possible(const unsigned int cap)
	{
		...
		switch (cap) {
		...
		case ARM64_HAS_PAN:
			return IS_ENABLED(CONFIG_ARM64_PAN);
		...
		case ARM64_BTI:
			return IS_ENABLED(CONFIG_ARM64_BTI);
		...
		case ARM64_HAS_GIC_PRIO_MASKING:
			return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI);
		...
		}
	}

In <asm/cpufeature.h> we have:

	// base case
	static inline bool system_uses_hw_pan(void)
	{
		return alternative_has_cap_unlikely(ARM64_HAS_PAN);
	}

	// additional dependent property
	static inline bool system_uses_ttbr0_pan(void)
	{
		return IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN) &&
		       !system_uses_hw_pan();
	}

	...

	// base case
	static __always_inline bool system_uses_irq_prio_masking(void)
	{
		return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
	}

	// additional dependent property
	static inline bool system_has_prio_mask_debugging(void)
	{
		return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
		       system_uses_irq_prio_masking();
	}

	...

	// base case
	static inline bool system_supports_bti(void)
	{
		return cpus_have_final_cap(ARM64_BTI);
	}

	// additional dependent property
	static inline bool system_supports_bti_kernel(void)
	{
		return IS_ENABLED(CONFIG_ARM64_BTI_KERNEL) &&
			cpus_have_final_boot_cap(ARM64_BTI);
	}

> Ideally we'd have no uses of IS_ENABLED() in these functions so it's a
> bit more obvious.

For the three cases above we can't do that without additional cpucaps,
and I think that'd be worse. I don't see anything we can practically do
other than add comments, and I suspect that's not going to help either.

Mark.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C6EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJF25jE6DtDOeZGkVrlPrhYYPvFE2Xx4gNNpwTEh6NM=; b=PZ1FlGmoC7+/xnFfeOWsXHLo6i
	UhLudQvq4m4/5pf8dJ9tIKlG5+tHCGhk9nblO9axiHIKKgdKzmJY/QilWK+PRYV8kXgQ4JN1Yjr9T
	9usdlCdnHdo9lYU3GnfO8j5wRfJAzVGLyErqKjzCuDAEewTY+jKj+deuC+Pp5BNHW6MaLSAsqnDYs
	1AHPAyPaP2CtSPxPbdRLhBshBVyy1yvbS6Zfb7S8p/pFyg9YTU/MVwmwYKEkNbjNGOTqqAGPJTcVW
	QzI4xXJ/qYJ9rOoIaVAomvI7MZNBYYcIgtOuOtVmNcRuipylnhojQVErAqmji99rdA4JO0AQ+q75+
	dLLpP+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNhO-0000000An9L-0CzF;
	Thu, 02 Jan 2025 16:05:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNg6-0000000AmqH-1fgs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A31DA411C0;
	Thu,  2 Jan 2025 16:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DD2C4CED0;
	Thu,  2 Jan 2025 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735833845;
	bh=xwig0kXXTHkd3gdQwpBR4SSkQ+n/TFnuZZXhFs5e0+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOVXCxUyMHGJzaL9r9qX4oZNqTL2oLMAXt2KYg5hsFBaFG381U8IkfKCpBm66ERyy
	 lFqQ/CvMKK9hpJlgC2ksQhSYDKvCbgjBXaf1cNdlNOWVmO5wUpuxnggkLEkiv+NErb
	 n5nV1uJiQPQAPm18mWtuD/Tl3gBVlCx5wkd3kh1T9yVSIh6RQRDVXBU7wFJg91WDYP
	 jOoCiA3rd6iw7j4jGQRW7j6IdZYBbwDCF63D/WX5xioGF/XL5LRryAme83I5ghz6WB
	 Lo35stosQ+u5FiYOvhZ8IhMJWATCusH5Md/cl5/mYsTVamBpaijcclLhE5/Mnsp/vo
	 /SX/6r/7vQcww==
Date: Thu, 2 Jan 2025 10:04:02 -0600
From: Rob Herring <robh@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Message-ID: <20250102160402.GB3990035-robh@kernel.org>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220072240.1003352-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_080406_522283_219AEDAC 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Dec 20, 2024 at 12:52:33PM +0530, Anshuman Khandual wrote:
> This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
> registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
> being used in the kernel. This is required to prevent their EL1 access trap
> into EL2.
> 
> PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
> for now as it does not get accessed in the kernel, and there is no plan for
> its access from user space.
> 
> I have taken the liberty to pick up all the review tags for patches related
> to tools sysreg update from the KVM FGT2 V2 patch series posted earlier.
> 
> https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/
> 
> Rob had earler mentioned about FEAT_FGT2 based trap control requirement for
> FEAT_PMUv3p9 registers that are currently being used in kernel. The context
> can be found here.
> 
> https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.org/
> 
> This series is based on v6.13-rc3
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <robh@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: kvmarm@lists.linux.dev
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> Anshuman Khandual (7):
>   arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
>   arm64/sysreg: Add register fields for HDFGRTR2_EL2
>   arm64/sysreg: Add register fields for HDFGWTR2_EL2
>   arm64/sysreg: Add register fields for HFGITR2_EL2
>   arm64/sysreg: Add register fields for HFGRTR2_EL2
>   arm64/sysreg: Add register fields for HFGWTR2_EL2
>   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9

In case it is not clear, this series should be applied to 6.13 as the 2 
PMUv3p9 features already landed in 6.13 (per counter EL0 control) and 
6.12 (ICNTR). 

Rob


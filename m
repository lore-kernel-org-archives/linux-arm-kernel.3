Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e342ehhETuK9et0s7bi7E/FOWtAVLdIj1k/Jyp5/OhI=; b=VoRj2f8OG0bgyLtkyHMrwezNuR
	TPiDwVKeWNp5X9Jqyhcj46/LpZsg3ya7rOfWxZUjjs3NwHy0eKIYc5pJw4wWk89pdlSncDHGq/2NO
	9lRD4s5isCGrybsTG9lIdvec4iTdpjjnN58MbTKQDv46Y3Qx8pC3H7z+pt1JO41BYOh5WOKikT6HC
	Hnj9HogEFdjla+2peSy7xQqi/dcG/NKVwBJFnSXavzzs7Aee0TvMPKX/q4TCEDkA+u00r4XnHzD+I
	BNwtmmg2BsYLyuHGAjR2U2y1k0B+d+/jgYiBs+K8UjWlGgmT4R553p/oydSCuCsyT7MQjkwgaZIXv
	W3XV5kzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNfm-0000000AmV1-0AZk;
	Thu, 02 Jan 2025 16:03:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNaC-0000000AlUK-0sQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 204FC5C611B;
	Thu,  2 Jan 2025 15:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CA1C4CED0;
	Thu,  2 Jan 2025 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735833479;
	bh=B30R5SQxntFNwn4kc/nsN10P1pyoNqOIX5a/V2t/rZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7t9WfYMlZoULmdlPdsFuOCpI0tSONfMmQJ/b9UZeW4Mk3wxQC5zLJZKOnKbUF2Kn
	 NzLKkK79r0p4HDWLy+Lkty8tEI8sdHTIdqflBNkPx8pQENmcKFSFtcqQKSfvvv+Ibu
	 /eOijlyST9sR2bSdgIZDsGuvUsIB8OnM4E4MuHEjxo6JTBf7V3V2o1CasME3NQUGGS
	 pHxeN4F/rmwkowJdE1jRvX5MZAEZWovLTVrMoetBAt8CqmFZMhsbnfmzSj+VYeVZtK
	 kiYFX0hDJ1FAyFYXufvzl1IXC0qR/uq5CoHKBS9y2+15yoNWg9ckkIlx0UfN5Dx9Yj
	 mwpnzUdprdKAQ==
Date: Thu, 2 Jan 2025 09:57:56 -0600
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
Subject: Re: [PATCH 7/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Message-ID: <20250102155756.GA3990035-robh@kernel.org>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20241220072240.1003352-8-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220072240.1003352-8-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_075800_291477_181E61AA 
X-CRM114-Status: GOOD (  13.01  )
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

On Fri, Dec 20, 2024 at 12:52:40PM +0530, Anshuman Khandual wrote:
> FEAT_PMUv3p9 registers such as PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1
> access from EL1 requires appropriate EL2 fine grained trap configuration
> via FEAT_FGT2 based trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2.
> Otherwise such register accesses will result in traps into EL2.
> 
> Add a new helper __init_el2_fgt2() which initializes FEAT_FGT2 based fine
> grained trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2 (setting the
> bits nPMICNTR_EL0, nPMICFILTR_EL0 and nPMUACR_EL1) to enable access into
> PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 registers.
> 
> Also update booting.rst with SCR_EL3.FGTEn2 requirement for all FEAT_FGT2
> based registers to be accessible in EL2.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  Documentation/arch/arm64/booting.rst | 18 ++++++++++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 25 +++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)

Tested-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


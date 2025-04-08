Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D188C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+aAEnDrXTgDWYTPHU9KYsqfv+w0l39eBf+C/ArRuWg=; b=LCpGaMMeaxkXLGyMplgCpJnsen
	Oezr+t6OugJExVat30OPjT/agel1z99IJtc+k1zhjZMXcCO1sC7BozUpbfXk4EHytcZLkqNA9MCIc
	kFreyjPohuVAJdU5OlMZAsUr5DbDZazXXepwgn1qN2PbjpJ3ojKCGEoo35Ib94vFyE3pF32WxT56c
	ozwBBLkzexZ32e3R2sgtkjCH6z/2x4r7x6JkRetuFE/vCdh2gHbg/DjxWzCl3X5peMacHmEPRtDNt
	jqRlOaSjnCYgY0JhjtbQxT/H8+1tyT33iCqqFaCavaUowFyAzyrzWMCfrH274bZbjtssRfmu1usLt
	1MSb+Xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mH-000000046rb-3YwE;
	Tue, 08 Apr 2025 13:14:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u275z-00000003qAh-0djk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 11:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E392106F;
	Tue,  8 Apr 2025 04:26:21 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36AB03F59E;
	Tue,  8 Apr 2025 04:26:18 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:26:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 16/24] arm64: cpucaps: Add GCIE capability
Message-ID: <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_042623_234511_EA5C0695 
X-CRM114-Status: GOOD (  15.93  )
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

On Tue, Apr 08, 2025 at 12:50:15PM +0200, Lorenzo Pieralisi wrote:
> Implement the GCIE capability as a strict boot cpu capability to
> detect whether architectural GICv5 support is available in HW.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

This looks good; I have a minor consistency/bikeshedding concern below.

> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  arch/arm64/tools/cpucaps       | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..8c60591633f3d435ad9b80a10e484f26af328964 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_pmuv3,
>  	},
>  #endif
> +	{
> +		.desc = "GCIE",
> +		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
> +		.capability = ARM64_HAS_GCIE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
> +	},

I reckon it's worth making the desc a bit clearer, e.g. "GICv5 CPU
interface".

It might be worth cleaning up the existing ARM64_HAS_GIC_CPUIF_SYSREGS
feature, e.g. making that have "GICv3 CPU interface" as its desc.

Likewise, could make the names consistent, e.g. have:

	ARM64_HAS_GICV3_CPUIF
	ARM64_HAS_GICV5_CPUIF

... ?

Mark.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BB7C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrYys628v7gyQU+iCOA4NSuVKJtdYObrVwi45VsVPAE=; b=0xfMEPz5HkVToF4iYfPCrzhHeP
	KqOUPiIFXmXI7kxw7P2h7PBHJRVWUKsdxBerQleQjdV6TDkDq73kvZlH/ilRZOP900+YKtX+l8MWL
	g+HLhG+MU7jKI+t//T3vHdForEPDccIECWMKW31+QTg6uj2EdqKTPZbw2TAJmEuKyFHayM4l0uev2
	9y76Eyo1aJDRYc9H+gUvsVWrXZMJGyisJr5WN4M+Fc0Rom/mihRGGqnoQFR+5fV0ANwaeWfJWs6iB
	JWRWS2rFCW28YwOGEhQsh8aNTuGq2BhJHU0STvf0qsEckZW8J5d8deNtZNe3qRqrPKQ8LMAH4Fjw2
	hcWZLeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AVN-00000004VNT-1ZSf;
	Tue, 08 Apr 2025 15:04:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ATb-00000004V8M-3iwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE64E4515A;
	Tue,  8 Apr 2025 15:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16087C4CEE5;
	Tue,  8 Apr 2025 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124579;
	bh=LKvavUYgpGR64gZmKbXgsDUtOXVLw5hcAok6WXy6l2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1A0ss6HLnm9h4iZmE3GGxq7KgMcTItcndCwA9TrvJ15cN8gdHxIAtMQuUDLaqm99
	 0KZ6n+1XpUrmR3N9EPmN0TR/w26ve6ew02oqFcqz3gfPkFmpt4aGOF8xKDnhNuXLhn
	 lFA4g4QrP3/0RGYEzYOt4WAbQB5svqsyZ51z6tH/tSP6b8QDM01UCHimmHW7RvDfyy
	 JPH67kVjPetJUMEiZ+7TTXxRqD0a/O/khNPzP6UWtVz2T6SjAgfTK+QCzYNMKwMn2i
	 W+4Jvfo01tAc+8CqOD38twNOzVomSZs1vMnjZsRjOerTk4w/Obn6QBi50mY0sUhcyz
	 +1wy+SIS1t7cw==
Date: Tue, 8 Apr 2025 17:02:53 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <Z/U6nVugAnrE2I7e@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
 <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_080259_945494_EEF4BDE9 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Apr 08, 2025 at 12:26:11PM +0100, Mark Rutland wrote:
> On Tue, Apr 08, 2025 at 12:50:15PM +0200, Lorenzo Pieralisi wrote:
> > Implement the GCIE capability as a strict boot cpu capability to
> > detect whether architectural GICv5 support is available in HW.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> This looks good; I have a minor consistency/bikeshedding concern below.
> 
> > ---
> >  arch/arm64/kernel/cpufeature.c | 7 +++++++
> >  arch/arm64/tools/cpucaps       | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..8c60591633f3d435ad9b80a10e484f26af328964 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = has_pmuv3,
> >  	},
> >  #endif
> > +	{
> > +		.desc = "GCIE",
> > +		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
> > +		.capability = ARM64_HAS_GCIE,
> > +		.matches = has_cpuid_feature,
> > +		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
> > +	},
> 
> I reckon it's worth making the desc a bit clearer, e.g. "GICv5 CPU
> interface".
> 
> It might be worth cleaning up the existing ARM64_HAS_GIC_CPUIF_SYSREGS
> feature, e.g. making that have "GICv3 CPU interface" as its desc.
> 
> Likewise, could make the names consistent, e.g. have:
> 
> 	ARM64_HAS_GICV3_CPUIF
> 	ARM64_HAS_GICV5_CPUIF
> 
> ... ?

This makes sense to me, I will do it in preparation for v2.

Thanks,
Lorenzo


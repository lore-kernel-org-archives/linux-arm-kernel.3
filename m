Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9698C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHN/ve3uqZoFmbENE1BEVc2Q1wo7QeV6ce4+Mf1ZYQI=; b=B+FKbFRDSCFJ3cmps6HG8It262
	b1ZGmTZS6idtt0LjaSs01v3DjvL9CTEkrag6lRyiHEbXLtE9vsRX3xE1lEXOnx1VCzlWUftUFJy2/
	+a8dV5uIM1WNW2CkOz+AbgO3xAVaSVqmq6yy7wzWOPwG5Bbm0hl9VvpViQXiM4FkoUWUsIZYUkAG7
	gWn73CCaf5r0E4O6Bb7jACzRoJeu91bgxbDYdYbxIyTxCmuvTE+QQloOHQnujxTh0jjLZpAt2gP0s
	88dMrbKge26EA+rtHeTvv64EsN+3U+kKIPXP+s9LWX+Q4iZCzqmo8Tcrjg7OTFQ0Qokw9kyP9RLxL
	40VRjb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toHly-0000000DbfM-0jGK;
	Sat, 01 Mar 2025 08:00:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toHkP-0000000DbW6-2DM2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 07:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6B2261160;
	Sat,  1 Mar 2025 07:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EE6C4CEE5;
	Sat,  1 Mar 2025 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740815936;
	bh=+7SBZeyhvdU8q8qqLxjcyLKtSgS5euL5/BSRG+GzYnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niS/4gm5vcOZNiqb4rtWstswYmO9WOXfWp21xuJROGBuwNHHrzN2JlaXdUA36BDDA
	 6Uq+KW1rsVqqQKvu+WC0aqBezbeYx4JJhg5iq6BMQYEaeywqD/GVztbNLdumonJFZ5
	 5jsf3qdLSn4GXlAGw4BDgAjbcLwTk2xqu64PV12c8Wv3FVgmMADpr0wk+gupPTr7JD
	 Q59K3Xp8pdgR2I4WLH5bZYpmYSSuzNs5m9oKbvYA2xMKnWE8ik8XYN2F37PZu4Rn5C
	 IAGLbfEgShX/o5ZK1Fnf0FavSAyqnuMEa8njKofeJL3Xq5DIxfwoPhm7l1MM8GprJn
	 MqyVkDZDfMLOQ==
Date: Sat, 1 Mar 2025 07:58:50 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/7] arm64/boot: Enable EL2 requirements for
 FEAT_PMUv3p9
Message-ID: <20250301075849.GA28249@willie-the-truck>
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203050828.1049370-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Feb 03, 2025 at 10:38:21AM +0530, Anshuman Khandual wrote:
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
> This series is based on v6.14-rc1
> 
> Changes in V2:
> 
> - Rebased on v6.14-rc1
> - Updated tools sysreg patches with latest DDI0601 2024-12 definitions
> - Updated document version as DDI0601 2024-12 in all commit messages
> - Added latest tags from Rob Herring for the last patch

I know these have been applied already but, fwiw, patches 1-6 look correct
when compared against the .xml:

Acked-by: Will Deacon <will@kernel.org>

I presume Catalin will drop/replace the last patch.

Will


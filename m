Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F05CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTzJyw2Uxeq3SLoKJu7BpCJLEImuXwZbQvxBz2bjvSc=; b=OlXTAZLwSYTcNrMUPhobI7CHWg
	8um1fPVW7pE4LgqSCsqGmtDUyybOPWNzy1d3O2qWl2UkLo8Y4WDvGBbz8PLlDEOkwwV4dc6lJwpie
	mSH293hE3Qbvz54X+7H2f25o6a2XfHFg9MdN4eUnN8K4WebT8x+AkT2jR03NM2zUkbjRHEZ5OVx9u
	CAaTAbpZr7ZjZevBwPgnQsI4LCM8GraACIDuqbl6pyFvhtR9oem9sFlgVnU3aN7t6BuNQ/su09g2e
	vdYdFJEQn6trQKQwFqcbkyhM4CaOJ3H581Q/oYNzdMO5JOM2HWUH1L0EA05Vsdl67Fo5aC6lEJSFo
	ezo2sI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlfO-0000000DawV-3f6Q;
	Fri, 03 Jan 2025 17:40:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTleB-0000000Dahu-2MPf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 17:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B41EBA40FFC;
	Fri,  3 Jan 2025 17:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA3C4CECE;
	Fri,  3 Jan 2025 17:39:41 +0000 (UTC)
Date: Fri, 3 Jan 2025 17:39:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <Z3gg23G00THN-Ev5@arm.com>
References: <20250103142635.1759674-1-maz@kernel.org>
 <Z3gcRczN67LsMVST@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3gcRczN67LsMVST@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_093943_664095_AB79D6A9 
X-CRM114-Status: GOOD (  11.36  )
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

On Fri, Jan 03, 2025 at 05:20:05PM +0000, Catalin Marinas wrote:
> On Fri, Jan 03, 2025 at 02:26:35PM +0000, Marc Zyngier wrote:
> > @@ -3022,6 +3027,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = match,						\
> >  	}
> >  
> > +#define HWCAP_CAP_MATCH_ID(match, reg, field, min_value, cap_type, cap)		\
> > +	{									\
> > +		__HWCAP_CAP(#cap, cap_type, cap)				\
> > +		HWCAP_CPUID_MATCH(reg, field, min_value) 			\
> > +		.matches = match,						\
> > +	}
> 
> Do we actually need this macro?

Ignore me, we still need this macro as HWCAP_CAP_MATCH does not take all
the arguments. Maybe not the read_scoped_sysreg() change though.

-- 
Catalin


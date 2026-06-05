Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E14CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khDbSfsIX0z9qFI+zXO33XBSvHY2sJtnLh4XWnp+QJU=; b=fQ5cGVm6vz4C+ompx/G9LmqGcv
	Y+ZNul0+/9qCwo7Qzh4AFgDqjn9DEw1qPPzsEZuqO5+y7TCwt9wGxdhgXzeWO1Sk2wBCQ7TfhVTN3
	+fIqtsoyrIOiMYGmgFw2fXyai1imFr1BMIVlKoN57ot/TPyvZxB01XdmenSeC8Cp2UN8pABiDh294
	X7Pf32FoxQa67iiRkErPovgyrdQQ7cf4rgeEggizNCEiergzO7eavlYuUCi3AC2UqfmnYeNJpRUNr
	x78Ei790abNPsWTKnFysvPMukFhgKea5ZQrDsHpNcAxYwRtyv3cpnbj8N7Xm/5GEWomdFYWFXcHuZ
	rlcBTdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPV3-00000000HLT-2R5a;
	Fri, 05 Jun 2026 08:01:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPV1-00000000HL2-0tu0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:01:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A6E4B15;
	Fri,  5 Jun 2026 01:01:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94ACD3F86F;
	Fri,  5 Jun 2026 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780646509; bh=oyb17qXE+TQpLj7wOHLjyKVAHpw+8+/MU0DmqRxGlcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzgDhOinZ5YAdBgNiW8SG1uXrCo8ne5sUg4ZBrzj8gIuJ+ljtlcGK595RIS1Oe348
	 8RXbsrZDk51FMtuIdmhvvMCSmulseXMPkxz/gNlZR7Q6YZN204mQs60cwP3MLTcsEy
	 +MIQ8b4Vvh56oSMAnI+N1/ZgiZYW//Qih9CHMvgs=
Date: Fri, 5 Jun 2026 09:01:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <aiKCaRvofEFaSVkO@arm.com>
References: <20260604231254.1904988-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604231254.1904988-1-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_010151_395782_2C039816 
X-CRM114-Status: GOOD (  18.34  )
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

On Thu, Jun 04, 2026 at 06:12:54PM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.
>   - Specific micro-architectural and timing conditions occur.
> 
> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
> orders loads) between the store and the load, or make the store a
> store-release. A load-acquire on the load side would not help, because
> acquire semantics do not prevent a load from being observed ahead of an
> older store; only the store side (release or a barrier) closes the
> window.

Ignoring Device-nGnR*, a store-release followed by a load (not
load-acquire) would not guarantee any ordering. I assume the
store-release behaviour is specific to this erratum - part of the
preconditions.

The patch looks fine to me.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


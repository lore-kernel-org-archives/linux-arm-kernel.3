Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA239C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsBU320Hc5ufAPLrytCYeiRiiWiPejNIHIOiOIU1tRU=; b=3TyzHspCA9wc8MyCKWK4o79PM2
	4wQc+W2tZbUNqMgzq5h7zwtiGm1vFBmuuJLXPKv/yvsl5qjLtgeqLLZuczxNb0+LDyZJW9W4avZ+6
	tKLTDAlPYJCtnsNvQlvkeC1n5Ijjw7VIF/jQ3ALJnnkaJBJr9DlAnCeEycEXk+gDem+HHOG8yAF6C
	N8QZr5terUeddpXc3Bpjfg/DyRttUFKt2pOb9vJKW7D/GldpCBg9diFITjvMhy6HflhndmGFKPQ+K
	toc8Ur4wq2S0m6yKx6bfu1ErlzSjVDefuJQnm6EU+m+Bdj+JNusL8zCrHGqFcEcYRdxp8OX8OekST
	L1PqP9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZLN-0000000HGln-2GAO;
	Tue, 30 Jun 2026 14:21:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZLK-0000000HGkP-0dxG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FFA04358A;
	Tue, 30 Jun 2026 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5C91F00A3D;
	Tue, 30 Jun 2026 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829301;
	bh=BsBU320Hc5ufAPLrytCYeiRiiWiPejNIHIOiOIU1tRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEafmnya0emV59ZXlYQ85WdhCP1GHh6+WtrnnMLIqUC0AAuMSrJ+6QlCNRQJx4voz
	 PEP8bw2e/LNBYP56c50maL0qzY+YiwCzsF1t3LE7aSzx9HeWpL9tf92Dia8jq1lEqP
	 XKnQWU6pp+FVjXqeYBmhsjxlmLIDtvN31yG0y1+siEsjjfURunI+dHJeyekGVXkcdK
	 Vt74TfXgFSgPH80BMG2dGtam5XLTZGbIts9fiiab0UoaebguZtDRTwKjpx3g/Z5P9E
	 UqVETkJ5cVPusKTru3En4RzcTp64gLQGQudGO8RpLM5CPTZ19gfS3tKWehKT/lNJut
	 9xgYDk7CAe3mw==
Date: Tue, 30 Jun 2026 15:21:36 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 1/2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering
Message-ID: <akPQ8F3OgER621UP@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-2-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625182425.3194066-2-sdonthineni@nvidia.com>
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

On Thu, Jun 25, 2026 at 01:24:24PM -0500, Shanker Donthineni wrote:
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

Does that mean that a DMB LD between the store and the load would
solve the problem?

It would be interesting to see how your benchmarks motivating patch 2
look if you leave __raw_writeX as-is and instead add a barrier in
__raw_readX before the load instruction.

Will


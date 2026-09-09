Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1723C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZZunfy+Zfm3RT6Bz1tju0QqCOyGDzReKwjK9EzzL/0=; b=ulhNobnAbZ1osT12Pfw6vpuVyD
	h7MqBUJejhpLAj1T9Or1t2P/2KAmFLlBrQ+Qp2XbKrMDp9Wm8G2mO03IguvarxjJtXa2p1sYrYyK4
	DejV+q0kJbjzUrSbmd0asGH7SNwTKGBsqWWkADrs/ayRLQ//HXtOR8NzONLT3GtKMEqnU6teuGlMq
	2RbTU99YU0LtDg6eRaCNcWiHaXwvB3beFjRgsXMuiYRo3BNoHahXedCTTU0y1+tdoM4+aoGstkNVq
	dbcZXVbm7qQDU561NcEKEoHuEjdLMCQVNkhe7R8CXeWq0ozJtZWeOjzHeK+ESu/M50FtwKJRSiM/d
	9NcJfK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EFD-0000000BFBr-0XFn;
	Wed, 09 Sep 2026 09:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EFA-0000000BFAU-15rz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:05:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4A01576;
	Wed,  9 Sep 2026 02:05:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90CD3F528;
	Wed,  9 Sep 2026 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788944723; bh=q/sP3AsNoR3RmKdfGQqgTWtlCydIYBxW5nIeJqo9DaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJMzp4kDduuRf2C4T2Advm8bOQaVcMgWtSvIOXm5Qx7LUZwR1aZjLCwml5W6iorfS
	 dxr342WEm/vkSDiyGPLiLsBtvdA7xfxvq0bQJ+z3HPA5ime/m3w/JEg+Ga5KlAy9SM
	 i45FQ7qGO8Gu0jWELoYvPnikdBpTCs7pYHbfgjSs=
Date: Wed, 9 Sep 2026 10:05:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <aqEhTIPqoKj98TRS@J2N7QTR9R3>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
 <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
 <aplRx8f5NprO9dSU@willie-the-truck_quarantine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aplRx8f5NprO9dSU@willie-the-truck_quarantine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_020524_339788_16E5DE98 
X-CRM114-Status: GOOD (  19.08  )
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

Hi Will,

On Thu, Sep 03, 2026 at 11:53:59AM +0100, Will Deacon wrote:
> it's worth noting that Bradley's patch _does_ fix one of the
> hibernation problems and has been tested by Vladimir:
> 
> https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
> 
> I would prefer to take your complete set of patches, but if you don't
> want that then should I just take the above for now? Prior to this
> series, there has been no activity for nearly two years on your branch,
> so I'd prefer to get _something_ in, even if it only fixes some of the
> problems.

Sorry for the delay.

I'd prefer if you picked up Bradley's single patch for now. I'll follow
up with a respin of the rest of the cleanup and fixes shortly.

Could you add a note to the commit message as to how Vladimir was able
to trigger a hang with CONFIG_PAGE_POISONING=y and page_poison=on? It's
helpful for anyone testing a backport, etc.

With that:

Acked-by: Mark Rutland <mark.rutland@arm.com>

For context, when I originally wrote my patches, I hadn't managed to
trigger failures at top level without additional hacks, and so this
hadn't been a high priority. Given that Vladimir can trigger this
specific issue with existing options, it makes sense to pick that up.

I had a vague recollection that this specific fix lead to a secondary
issue, but digging through my notes I can't see what that would have
been, and I suspect I had just gotten confused w.r.t. what KVM was
doing. If I find there was a real secondary issue I'll follow up with a
fix .

Thanks,
Mark.


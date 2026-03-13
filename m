Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A3A105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLyUsWaVlQC9E+siGH2OmLxSLjSqGkW8HsrRxZdao8c=; b=rwdivDaXjpNa0puM8Ah9zLvHZl
	amOJDtW1ZcT7H4ts5M8vfyL2w/rfSSMO86YsrCNfYY6EZW/h9Rfw0zfpCr3w3VgEgilzqzRIriTmV
	Ait3KeEt6CFBB1K/1bv4nlQgxU2cbwSMG7jNs0dIvmVjPWO+spBzJn5NP5sDaXmMNvbWi1v7VjJ6t
	E57KsYa/+Vu4x11ghQFs86l3qpyRTkAHkeE2ii2nzZuqMLduwQavjGIXZGCIW6yVimhjvCZuBAKu3
	163RZr5xXwiNQYgJ7PrTgqTiqkq3iBcbDr4lWBqIPQGExqVW5TO4fKyEnlsvUyxCD7IFZdf4+uQ6x
	F0mj0rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13X1-00000000OOX-3igs;
	Fri, 13 Mar 2026 14:30:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Wy-00000000ONz-3saY;
	Fri, 13 Mar 2026 14:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA6744096E;
	Fri, 13 Mar 2026 14:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEF9C19421;
	Fri, 13 Mar 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773412222;
	bh=Ay+vXhiV8XuqkQrW882GrFkmgzuSWH9fywkBW8jtW0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4msbIrI1iihPXJ8SoRunh20u/9NK5f72rlEZlV6GLsN4qXi4RhYIeTTYKS7Kkouo
	 F22RbtH9apeRv1EeWqcqN2ZzJC0ydp8RCQoXrKJwlGufxdF6IddJiPAogM7bUdOUL2
	 MBJj0OzyPg/77huTVLU3RhIycLaWGNjA0p8aTs3OhtIB/4/wWH33lqGD8jVf0ZPuo3
	 MKihnbw7Vd9l7AhMPVTMBo+QW/e4hDzx3KcRRnOaEIkW4X+vurkqd5sgvM1S8V43mL
	 Gm3PQTyxz7eBfWkPag7RU07e9x5U6xux0cZZDHSl3manqfOL4dUBSveGp0TZ22WPMd
	 UPooWldAcCwPw==
Date: Fri, 13 Mar 2026 14:30:18 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <20260313143018.GD461701@kernel.org>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
 <20260312172430.GA1267298@kernel.org>
 <abMsvOMnnuTdoG-9@lore-desk>
 <20260312172248.68742f98@kernel.org>
 <abP2dLNIw6zqkxL4@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abP2dLNIw6zqkxL4@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073025_005621_5FAA3425 
X-CRM114-Status: GOOD (  23.57  )
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

On Fri, Mar 13, 2026 at 12:35:16PM +0100, Lorenzo Bianconi wrote:
> > On Thu, 12 Mar 2026 22:14:36 +0100 Lorenzo Bianconi wrote:
> > > > Is this a bug fix?
> > > > If so, perhaps it is for net with a fixes tag.  
> > > 
> > > I guess we do not need to target net tree since airoha_eth driver currently
> > > supports just the LAN interface via the MT7530 DSA switch connected to GDM1
> > > and there are no WAN interfaces officially supported (PCS/external phy is not
> > > merged mainline yet, it is only available in OpenWrt).
> > > 
> > > > 
> > > > And at any rate, could you add some description of the before and after
> > > > behaviour?  
> > > 
> > > Theoretically, before this patch, GDM ports were equally distributed between
> > > QDMA0 and QDMA1 while this patch assigns LAN interfaces to QDMA0 and WAN
> > > interface to QDMA1. However, for the reason explained above, this change is
> > > not currently visible to the user.
> > 
> > Please update the commit message. And please try harder to explain 
> > the patches, this happens a lot with your submissions..
> 
> ack, fine. Sorry for not beeing very clear about this (and other
> patches), I will pay more attention in the future.
> Do you think we should target net-next or net for this patch?

Hi Lorenzo,

As per your explanation above it seems to me that there is
no user-visible change. And I assume that implies no bug manifests.

If so, net-next sounds right to me.


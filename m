Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE51061B29
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj8UaTPnOI0lnTiXzdnpSsQENoEE5MW8Y6u1QgbWP2g=; b=4CUbLIJyZRHNoLJ/z///zbM/IS
	35JMZ99bhBA76yYnkQCoSb7YBsYKK8knSxyyCEHm6XcsalF0xMblPG54Q0TWJGW+FWUorKTblVUqH
	xL7TpXSbVx0NxDEQczE0y6nqJLweK61Wu7gUqvMlSa2w1Qhw4x0rnO4esQQUHcO6SbYjnESSYGblI
	HWkGyp9htSqMqWn8TErEpog2h0DNFyhnKLKcw/xfxHJyZMMhDN58dm/pW6B9CiEYsEtfOPCPuszr3
	fxxCv4xAYv6KaHMzhGNMpPo8TXyzFBkiDonLxPzEFZ1Nq8fJERUWixDu2U4Pip9M6xpGcJduScO7x
	N+uM1ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MFX-0000000C2EO-18KL;
	Mon, 30 Mar 2026 23:42:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MFW-0000000C2EI-2QIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 23:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9B716001A;
	Mon, 30 Mar 2026 23:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A5C4CEF7;
	Mon, 30 Mar 2026 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774914145;
	bh=aHrIbDCRF2C63qxAWklCYHcqyfF0RZoSgHISzrHOz9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q1VSOtlxR4oiyc2fLxazcaNC8M5IhUGTkgAvRrzVAWCqhFe4l8xQDBgzerxWvD0KA
	 yWFBZmBbHzI/fd2pbIxl+bGHyTikCvjZHZl/nhqo+sGe8MHIPYc8TeJuxZncvbUi0a
	 htsWUlWRkufWs4hN76gc2I3zO+jpCDDc6+FMCQZfDXX/tFu+rnlL5DoIEBT5OzYfSv
	 m4zXgSftUzB24MCIvy6YBxjiiFWih0qFSd2xUGU0/tt0ItYtavVyNGIH1kbtXsT3Rz
	 RsDSZ7wtmzNqH3qpLb2GhuYJ1XdMZZl0I02CawjX5SopRiB7etyHl9+kaTKSDv8g+o
	 0ffNP2TE7Zh/w==
Date: Mon, 30 Mar 2026 16:42:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Ong Boon
 Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 00/10] net: stmmac: TSO fixes/cleanups
Message-ID: <20260330164224.0b75f251@kernel.org>
In-Reply-To: <acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
	<20260329111123.740bada9@kernel.org>
	<acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 29 Mar 2026 19:51:17 +0100 Russell King (Oracle) wrote:
> > While I have you - you have a significantly negative "reviewer score".
> > You post much more than you review. Which should earn you extra 24h
> > of delay in our system. I've been trying to ignore that and prioritize
> > applying your patches but it'd be great if you could review a bit more.  
> 
> Sorry, but given the effort that stmmac is taking, I don't have much
> capacity to extend mental cycles elsewhere.
> 
> This two patch series wouldn't have exploded into ten (or maybe even
> more) patches had someone not pointed out the problem with
> suspend/resume interacting with disabling TSO... which prompted me to
> look deeper and discover a multitude of other problems. Should I
> instead ignore these bugs and not bother trying to fix this stuff?
> 
> Honestly, I'm getting tired of stmmac with it sucking lots of my time,
> and I suspect you're getting tired of the constant stream of patches
> for it - but the reason there's a constant stream is because there's
> so much that's wrong or broken in this driver.
> 
> So either we let the driver rot, or... what?

I was hoping to nudge you towards reviewing more rather than have you
slow down TBH :) Your patches are generally excellent so not a burden
for my PoV. And stmmac is a toilet, a very popular one at that, so
efforts to clean it up are most appreciated. If you could review a
couple of series every time you post - the balance should be restored
to our tooling universe.


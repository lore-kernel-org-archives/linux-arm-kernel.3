Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFADC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLDj2hZCve2ZWWLDxKombVsx7zXm/NyM2HtS7v1LdNE=; b=Ler9B3cUugXW7tFpdMhDIj16lk
	H3PyfwsESAVVI6yvN0CZb1J5Z2Fk3S4gi40goRbV3GD+SlaWEZ0ArNvBxMKNGAXtOqxj1uycPC1JW
	FPSVTILNY1QtVNrfAJXlrrP7ys6Vg0MoCsCN0KyLhgVyRnVLssr6bRzq4XEIziQmtgwcTARyzzXs3
	biEVWoWZDrYwj4n5AY4izAVxxCq77JidvdnOWRx7ePV1yx/8QRiUTYwcqeoC8pU/S9C2wCjfcVJd0
	azP56/Ukc9UzPxZjepuNn/jwLmnd75UJc6getP89UR1eliSAitW+ZXy/DXDpDi32PtwyRjjhU2tBP
	DqcgLBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqgB-00000000omY-13ku;
	Tue, 25 Aug 2026 12:55:03 +0000
Received: from submarine.notk.org ([62.210.214.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqg7-00000000ole-16V4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:55:02 +0000
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id DD6F414C2DE;
	Tue, 25 Aug 2026 14:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1787662494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QLDj2hZCve2ZWWLDxKombVsx7zXm/NyM2HtS7v1LdNE=;
	b=34qD/RmW3+YAfFU49MNmHd7+ykPxdE3JfNqfWQGiB7qIcaGMHrcpvRq4xnu2MOVwCKGEcI
	wMQD841PBTKqMyrQCUmnj5PVf1Ba4K+8EIVmcrNNwGwkloZ12UHr38dDA2El9tZpXBayNw
	Tcfg7mpgC0VK2f4yq54KKSZtHXBbg7P28Otj3GK0/rPVKQ4auwEr1cHA/JZZCUmCG7g2mt
	Fu45QbiuoeeyZsBYbzQcUYP9JgS0e0SESGZCW/v9aU4BFcJ9YVxCC9QArt9gJ30cND4nkm
	ces1Us63jDfQcluY0mPH44hR/ZlfYjfjUIBR4PKgDSgs0fcaXSsk/9xnE2IjHA==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 2988523d;
	Tue, 25 Aug 2026 12:54:47 +0000 (UTC)
Date: Tue, 25 Aug 2026 21:54:32 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Vincent Jardin <vjardin@free.fr>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Stefan Eichenberger <eichest@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus [stable backport question/offer]
Message-ID: <ao2QiAGMU3g5dQB8@codewreck.org>
References: <aogVVwPlOmCqFsg_@codewreck.org>
 <202608250009.7e963743cf842d4e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202608250009.7e963743cf842d4e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_055500_528290_8801A8D6 
X-CRM114-Status: GOOD (  13.45  )
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

Sasha Levin wrote on Tue, Aug 25, 2026 at 07:49:30AM -0400:
> Dominique Martinet wrote on Fri, Aug 21, 2026 at 06:07:35PM +0900:
> > tl;dr: If maintainers agree, I can send these two for a future 6.6/6.12:
> > 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> > 07fd9385f0d8 ("i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)")
> 
> Thanks for the offer, but let's not take these on 6.6/6.12.

Ok, thanks for taking the time to check and reply!

> 5f5c2d4579ca splits the read path, and the split leaves the block_err
> handling in the atomic variant only, while the live non-dma path ends up
> back in the unfixed handler. On 6.6/6.12 the block-read-of-0 fix that
> shipped in 6.12.101 and its 6.6 sibling landed in the shared
> i2c_imx_read(), which both paths still go through - so pulling the rework
> in would actually re-open the bus lockup those trees are already
> protected against.

Yes, a backport would only make sense with both patches...

> Your premise is right that b460b15b3cc2 is now everywhere, but
> 5f5c2d4579ca also carries five Fixes: follow-ups, four of them tagged

... but now that you've pointed out the others I agree it's more trouble
than it's worth (even if they all apply cleanly after trivially fixing
5f5c2d4579ca's backport), so I'm fine with this
(And that can be reconsidered if more people report timeouts fixed by
5f5c2d4579ca...)


Thanks,
-- 
Dominique Martinet | Asmadeus


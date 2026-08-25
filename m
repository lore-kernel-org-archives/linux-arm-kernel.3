Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8aAnpC+U2U4v4kj2zSuG8wXI0uZsk9I36mmsIH0Apc=; b=akhRaq31mtN4qnjZrb4BlhzNO7
	1O+M4l0V1dGRqzHGuls4MZJp9huSqfmns81sc81AV8AagYQfBvv1YzLJ977XCJ/paHgCqAg5UbgOg
	NL6sMuBauvz9AC/CiVp63mrWYU4BqE70hY3A6Q5f+WQHqU0P3slCWeQbbKG6MzcnrGSX2EJZiTn4A
	o5axo7zC3bVQKQa2ERn7ihSi5zOnU0W9YarXTZA0eb0NmHAIEV5fXjQ0l4Wf2sh4I5L+6DD/VGAAY
	e5/7lp2YfTCsMnggiDC7GgJoiUdcJjF3mSzEE4N+b9rKK8+YKWHBCdQDNAtVtUyNZUNsj+V43XPgu
	votp/wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypf6-00000000iH5-42rY;
	Tue, 25 Aug 2026 11:49:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypf4-00000000iGw-3nuL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05BBF601DE;
	Tue, 25 Aug 2026 11:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C956B1F00AC4;
	Tue, 25 Aug 2026 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787658589;
	bh=I8aAnpC+U2U4v4kj2zSuG8wXI0uZsk9I36mmsIH0Apc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OsJRqSNOWC/g01jeLPauOGWu+TMXfIKOH0mwfvb/kn7zJedG0+1cM1NbzOeW2QYHq
	 T9MJNw+vkz8vEYdjA8kAKg5flhaWyl1M9nyCdnCryUudwKyfBesrPejSlfbPHrrerF
	 54sgE+QjRDzb9kSCveyDB6mAMakmGYGeLbOEHVF7ejP63e2u/0so4RvwMG+A1eCleF
	 0n4YzjbkE/PFKPGZLgb7bD8t+wZ/VbsVOYrZzFr3B9HCGUZ4nf4YMdCAVaH8C3lv2w
	 SWgOgL0I9pHPWzXVjzmG4mMiiuNX6ILiqu5iRO3hrOb1B9UVxzjbjrnpDIQYbJDgXX
	 qQdcgXKRmSF9g==
From: Sasha Levin <sashal@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Sasha Levin <sashal@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the bus [stable backport question/offer]
Date: Tue, 25 Aug 2026 07:49:30 -0400
Message-ID: <202608250009.7e963743cf842d4e@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aogVVwPlOmCqFsg_@codewreck.org>
References: <aogVVwPlOmCqFsg_@codewreck.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Dominique Martinet wrote on Fri, Aug 21, 2026 at 06:07:35PM +0900:
> tl;dr: If maintainers agree, I can send these two for a future 6.6/6.12:
> 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> 07fd9385f0d8 ("i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)")

Thanks for the offer, but let's not take these on 6.6/6.12.

5f5c2d4579ca splits the read path, and the split leaves the block_err
handling in the atomic variant only, while the live non-dma path ends up
back in the unfixed handler. On 6.6/6.12 the block-read-of-0 fix that
shipped in 6.12.101 and its 6.6 sibling landed in the shared
i2c_imx_read(), which both paths still go through - so pulling the rework
in would actually re-open the bus lockup those trees are already
protected against.

07fd9385f0d8 on its own buys nothing there either: it patches
i2c_imx_isr_read_block_data_len(), which only exists once 5f5c2d4579ca is
applied.

Your premise is right that b460b15b3cc2 is now everywhere, but
5f5c2d4579ca also carries five Fixes: follow-ups, four of them tagged
Cc: stable # v6.13+, none of which are on 6.6/6.12 - so doing it properly
means backporting a six-commit ISR state-machine rework into two frozen
trees, and upstream was still fixing that rework in February.

-- 
Thanks,
Sasha


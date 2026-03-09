Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5976EFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aO11S7XpHsjpYy8mMZAXNIDHGyJA/b6wWWf4BYb7QwA=; b=yNbD6VXRqIiJKNkg+XcZ6ZqudC
	ftnwTe8H5rHouwWNxtGwj4QmsUqF2f0ko+/r3/e5U/231dNZL7umyEOmJlX/kAp4Hol7uC9IqmU3m
	XpEaOlijpX+C1+r7yMCUlwxptkFEKpJiSBKpDbPEYA/M9lr6ExnkTh+/ZcvkELpp301+PqSa4NAzV
	3QQM4/6ipAXcpRFfItlidEjTEid/ntWMlHf3GA79iwGef8eb/lu3yz4K3ccbQan9l0vhoVvF3rkQz
	Eq0uCKE6Nx+NsvLhbDrfqY4fZfdbscmENYm/26FrLKNBOJURledGrmqGMmkMw+9OOIlvtC5wEqj0v
	aqvK7NKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYj1-00000007BkJ-3Quu;
	Mon, 09 Mar 2026 11:24:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYj0-00000007Bk9-2dLu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9B77600AE;
	Mon,  9 Mar 2026 11:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1C7C4CEF7;
	Mon,  9 Mar 2026 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773055477;
	bh=YYv8pxQgJWca6hIYn2qoRloJNcRUEr26iVA0OhWlEEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ek8j+14DBss9fXPiAu8OxWzu0+bXUde8LQHxeNu1XsLSpI57NHxBrbBf6TuhcAPJG
	 VGXkG3+Wznf6rvjZc10maDN1a6E/4jw2tNcyYE4Er2sdAR7t9o2AUzEk8u2cx6Ingz
	 pqQWurAnto6paHxQwAx8MK7WMwWmWLxGZ8B2PqfvATJ5tTGFPa1pXwP2Z0IR/QFY0N
	 00xfsKPz1j7IMexA0AF0k/Uub0o28L1zebCSImOefV3D2Xn0mRLyYeCwBZSBmu/Ix9
	 0FI9Xh7PHai8UGfwCp6+Cir7g+O2gcnVJ8AcsZjXstY7Tzpcd3K9ny6DS7IfuWqlMe
	 wWKaNLMbmzQmg==
Date: Mon, 9 Mar 2026 12:24:33 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] dmaengine: Add common dma_slave_config and split it
 into src and dst parts
Message-ID: <aa6t8QrrlearBOXI@vaman>
References: <20260114-dma_common_config-v1-0-64feb836ff04@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-dma_common_config-v1-0-64feb836ff04@nxp.com>
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

On 14-01-26, 12:12, Frank Li wrote:
> Many DMA engine drivers store a dma_slave_config per channel. Propagate
> this configuration into struct dma_chan to avoid duplicating the same
> code in each driver.
> 
> Much of dma_slave_config is identical for source and destination. Split
> the configuration into src and dst groups and use a union to preserve
> backward compatibility. This reduces the need for drivers to repeatedly
> check the DMA transfer direction.

The reason why we had both the src/dstn sides was intended method to
allow upport ofr device to device dma. Some interest was shown for that
at that time.
I dont think we have such a user even now...


-- 
~Vinod


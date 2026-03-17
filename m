Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88676FD7072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzoWuglBUHqkpTQYCjp0o2fNxpGzsQXlIVffnZw0BsE=; b=uatJ/jRVRgm/DDO/Kz/i9OBbdq
	ORYojx56eID47KcDg1EsbSOZRvKj9Rl7KPfgQT0+rSgew3+m3Z41MveenHfbpnNIDvkD6ugonk67m
	22w5ihXuWg54K/oehH/MLTvzsYcN7L8K+OoQaTL7yg92w6k0TQEQt3IfCKimHxqq1Kxc3USTlQA2W
	KSx0nDoxJHPjHg1+2kW5UZEtQt99OnUkBCxGMMdL+Ca2lKfi2Us4Is0rMZJATMfB6d8je+/9VWpXg
	boKI7UstueJgyasvEP9jIEOnXyWl2jZfsDJjLFYSJv9PBoFPn4Z8YP0571HGxh4cEg5MJLaGlxtpW
	HkEAqwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RdP-00000006143-2cRw;
	Tue, 17 Mar 2026 10:26:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RdM-0000000613d-37VL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAB4140A09;
	Tue, 17 Mar 2026 10:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150C7C4CEF7;
	Tue, 17 Mar 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773743203;
	bh=leILco6ESwbAPx5/ChEkDeGOl9TARpFn5FFt7fhV91M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EK+pGd/Qe+hHDmgY8MA52uxvkIPEOhyj8ZVsNmndCnSG5dr/RFkQ9EnPdTtgdc61H
	 Cv1BQnZ3IDVErs0ElcARTaHFjSgtOIlIttxmykiFG8ScBTqIlcuYsDPneEBfXC7EYC
	 Xkspxjnc6XfG8/+Gl8Htahhn2o+gOhHRob/jNy+0w4tkPw5+r5eNhsc1WethmBcvky
	 xWXG2L5QQNS+FE1dYze7XpRzUc/frOLIjc4Nb3FErpzmNekXVc2Q/wMIWWsO/HxGE/
	 VcqQcQuMnZ8Of7QoctvtautlGcfI4NcN1sQiB7KTCaig1mVy2DW5gr/cfnhvZYZf5/
	 CxzWscbT1RSHQ==
Date: Tue, 17 Mar 2026 15:56:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] dmaengine: Add common dma_slave_config and split it
 into src and dst parts
Message-ID: <abksYB2WQ0oNDSbS@vaman>
References: <20260114-dma_common_config-v1-0-64feb836ff04@nxp.com>
 <aa6t8QrrlearBOXI@vaman>
 <aa7Y20I2_Hlp63gk@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa7Y20I2_Hlp63gk@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032644_820132_62FA7417 
X-CRM114-Status: GOOD (  17.49  )
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

On 09-03-26, 10:27, Frank Li wrote:
> On Mon, Mar 09, 2026 at 12:24:33PM +0100, Vinod Koul wrote:
> > On 14-01-26, 12:12, Frank Li wrote:
> > > Many DMA engine drivers store a dma_slave_config per channel. Propagate
> > > this configuration into struct dma_chan to avoid duplicating the same
> > > code in each driver.
> > >
> > > Much of dma_slave_config is identical for source and destination. Split
> > > the configuration into src and dst groups and use a union to preserve
> > > backward compatibility. This reduces the need for drivers to repeatedly
> > > check the DMA transfer direction.
> >
> > The reason why we had both the src/dstn sides was intended method to
> > allow upport ofr device to device dma. Some interest was shown for that
> > at that time.
> > I dont think we have such a user even now...
> 
> My means is the field name is identical, not value identical although most
> case is the identical. but it is possible, especial FIFO space windows,
> 
> sound/soc/fsl/fsl_asrc_dma.c use DEV_TO_DEV, at least src and addr use
> differece address.

Yeah so this would break if we go ahead. Thanks for looking this up

-- 
~Vinod


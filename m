Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4652ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByNhWxGZuyarmRc76Z/XojtfY4lr2vsk75qxGBUB7h8=; b=WqnG4fLWSYOEIdxOQf80yC2Tik
	5MeLYLEXwCI8HSHGilzKKdrWtqV+g6I7W0aEOzobvOjZ2IGc8I0sQeJ63tx5Ffke+kQM4vDf7cx4r
	9OymUXtsCnNlbIo3SzXTnhDAhgu5deNoL+VdomtqeZdN2wyXgKU3Iysa3DPlu6/KhWHmnrzx+mzgP
	9ak8XluPPiTGhGoV8a7fqDpHPOYOxuWdwkhot3veWg1cumUvHU+Tpjt0q4Pd6wwThqsnFKSHtB8H0
	ex36/KdU4vQI5CE6p6jctiFkNeb8BkvN1R9rj8gN8Q/zXoLh/D7VvLvXuDpdLvA72IVtpYU7TB47y
	e5MgMQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAis-00000000G0a-2ypb;
	Thu, 21 Aug 2025 19:13:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up66o-0000000HBv2-1Nga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 14:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 378B85C66A6;
	Thu, 21 Aug 2025 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A6C4CEEB;
	Thu, 21 Aug 2025 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755785860;
	bh=gW7zqHt7cuAakYbLK9BQKAYcDbTeaMYBUi5199VFuWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nT2dFNMTdJafnR8SCtfTZ4mri3Lbf6Uobpr9VzI6B7WWWTWueKS2GpZsfOM4W5Nul
	 jI3GCEU11vPSdLCtvy/MjJMPT8dny8Rwe4zbyNeKnHr7WHKP5mK5SdOIcYajHvymgT
	 tW3YMrkNocdSeWpD4xypEwihTB9ldMoEaAKjOtBBSXxoRYrr1lsfkzqut+JG3kNJ4D
	 YLmM0mIA/lEam7fPLNtPjInCYoGmaIxE7K7Lgdf4UT4vwjb81vIbXKKc9u7722DLm5
	 x80sH/px/HKkEYCDcx1FDetplKayERaM+BZoFgVpNE8rFtH8FqIst1UYrvSwV0d0Bo
	 H/fk60AGBEorQ==
Date: Thu, 21 Aug 2025 07:17:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Set CIC bit only for TX
 queues with COE
Message-ID: <20250821071739.2e05316a@kernel.org>
In-Reply-To: <feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
	<20250819182207.5d7b2faa@kernel.org>
	<22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
	<20250820085446.61c50069@kernel.org>
	<20250820085652.5e4aa8cf@kernel.org>
	<feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_071742_409286_7A114FDE 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, 21 Aug 2025 19:20:02 +0530 G Thomas, Rohan wrote:
> > To be clear -- this is just for context. I don't understand the details
> > of what the CIC bit controls, so the final decision is up to you.  
> 
> Currently, in the stmmac driver, even though tmo_request_checksum is not
> implemented, checksum offloading is still effectively enabled for AF_XDP
> frames, as CIC bit for tx desc are set, which implies checksum
> calculation and insertion by hardware for IP packets. So, I'm thinking
> it is better to keep it as false only for queues that do not support
> COE.

Oh, so the device parses the packet and inserts the checksum whether
user asked for it or not? Damn, I guess it may indeed be too late
to fix, but that certainly _not_ how AF_XDP is supposed to work.
The frame should not be modified without user asking for it..


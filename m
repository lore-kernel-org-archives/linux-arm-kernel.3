Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D99CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsHIhzNEvsjs1xkLJ/mINvYGDCtpz5RiDWmUNIDSXJQ=; b=UFC/Hj0xKjzEZd5qSzfFrv7VNK
	PJlqkKBRmidqlLp9RmFTvSBzBkZY59UNSvZtARZrReNgDrHb13G1LCYzTKkBkTY4s8yc8Vr/E0O7r
	TR8JXcuCL2CRdDqmZrIGFc96Ak7ysQ20U+MZPvwngn0WR2T1/K6qFspjaEwNQ+8FWRwA7CL/kqY+E
	6vzZGgF+B0uEl88J5p+mrs+psOxonXvYQzRdZ6kB1euz9617D+q73rHep5KlC7NB0sqeZ+Ky4h1I7
	uNKTze8NWJV1Z3BytG9+Ch9u7MOC7X8PDqdqebwgUZ0kJo/ls82NmheQH4azSxT7ZclW8sWLVhNzZ
	lkya6FBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkU-0000000ErvK-2BAZ;
	Wed, 20 Aug 2025 20:49:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol9E-0000000EJas-3OiZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E083B61138;
	Wed, 20 Aug 2025 15:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121EAC116B1;
	Wed, 20 Aug 2025 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705287;
	bh=rXsvCo54vmzimq+tMCxR9+qLXEc3s/ulFZc1gIen3Mo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sH8yFEBbP3jESsYJR2shssaXL3L7FXtsORvJgYtBft2gbooUWw3+0TObMw4bSfjuW
	 DUsNrXXxfTEyvqtEv9Zli4Oex9ZeNbbfXmclMsgJFrbO4C7c5SxOWP6ef1W8idmFAB
	 6RK7Cc0KzS6bQEm6M+Qhrv5OOEITnZAVIjL5CJEb2N2RSphl/OhDT/1bqrAqhIlL6F
	 aHQHV3ClIhNAg/0nZtW1vS4b0PhFlDdbjPD3VHeZw4Avr1yZcsAFErFxZ2Fu9U8Wsq
	 6EOJBz8pDevyDZRh1HJzC6rzlHd/YUi7H4eqDigJ9RtQ7OSWqqrvaesYsJ2R1NvanI
	 N1/ZlK1b8nErw==
Date: Wed, 20 Aug 2025 08:54:46 -0700
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
Message-ID: <20250820085446.61c50069@kernel.org>
In-Reply-To: <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
	<20250819182207.5d7b2faa@kernel.org>
	<22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
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

On Wed, 20 Aug 2025 12:44:18 +0530 G Thomas, Rohan wrote:
> On 8/20/2025 6:52 AM, Jakub Kicinski wrote:
> > On Sat, 16 Aug 2025 00:55:25 +0800 Rohan G Thomas via B4 Relay wrote:  
> >> +	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;  
> > 
> > Hopefully the slight pointer chasing here doesn't impact performance?
> > XDP itself doesn't support checksum so perhaps we could always pass
> > false?  
> 
> I'm not certain whether some XDP applications might be benefiting from
> checksum offloading currently

Checksum offload is not supported in real XDP, AFAIK, and in AF_XDP 
the driver must implement a checksum callback which stmmac does not do.
IOW it's not possible to use Tx checksum offload in stmmac today from
XDP.


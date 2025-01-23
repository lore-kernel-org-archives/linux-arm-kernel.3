Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC295C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wRX6nt5upARGmRL+6GBeqGf+Xia6h78Ps4/imq7qz8=; b=34l+M9hNmaC6x5830h6VispzPW
	OKdfRgQQd0a5Rv3JJhadV7Dp4CVQ6CkvXkkosWma1wfRNfwrhk1Oc4xBrfPcWcx7r50jTRh81+2Zd
	cqANbCArtDPbiiYowTnCgoCxA2EwVcWf+2dZAAt9ycQIFW1HhOPr9gJeCtH6ruu6Oe7RPGP0yGhMG
	5Cs0qmGJ1uN2YShog6qtPFZELPS1Erp+QZFNZDoIqc3Dm9XEFlOaFs9cv+8tnlRLm89yj6T7hlo0z
	HbUEibz5AO4MbwR9oTIo5JHFQfUGbglSLastRE1uiSUuJ4VeWQ3oSWnm/Sugvrvi5bnbjVW/F4NiI
	ILDa0+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb55q-0000000DLSD-2mC1;
	Thu, 23 Jan 2025 21:50:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb54H-0000000DLHV-0VOd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4wRX6nt5upARGmRL+6GBeqGf+Xia6h78Ps4/imq7qz8=; b=sxrVu2A3hyTix1INO9hsYSTRlw
	3hsdB0UGVaKHFe93i6+mJgUzYMrDBIOg332lYW/kr30ecXdNoGnmmoX3TNPN5fdI7r0xhC002+N38
	4CJs4giDq2cneX+Hg8Ks49wT14J3KHNDViOGzQgOKhTxJ49wBh3J8gPKDOvEcuQMGMLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tb546-007Njj-4d; Thu, 23 Jan 2025 22:48:42 +0100
Date: Thu, 23 Jan 2025 22:48:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Brad Griffis <bgriffis@nvidia.com>
Cc: Furong Xu <0x1207@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_134853_158228_AF3BF1EC 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

> Just to clarify, the patch that you had us try was not intended as an actual
> fix, correct? It was only for diagnostic purposes, i.e. to see if there is
> some kind of cache coherence issue, which seems to be the case?  So perhaps
> the only fix needed is to add dma-coherent to our device tree?

That sounds quite error prone. How many other DT blobs are missing the
property? If the memory should be coherent, i would expect the driver
to allocate coherent memory. Or the driver needs to handle
non-coherent memory and add the necessary flush/invalidates etc.

	Andrew


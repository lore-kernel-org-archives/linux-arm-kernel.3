Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD844C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVE7rgHgEpJPUkUmaljyORlmxMSMeLFMqZuFdz6ZPZU=; b=dRo1SGGrAV7TOAMTEBq6Nmi4JL
	ZgeNBtkTgskEpjfh7yDZeU25wYc5TA6Fat8ueh868+IGLHW7/30APyoVHJ/WwXkF5W/wMLUcA/drV
	sXuOePSkNwstZC2zaa3KjA19XOcEtTMrrTaywHXUoXTcGHWWXcwhPvNKbOZdABDIm0SD95O0DpdvL
	qjnEsUVQLupOM9czQiKg+dMMuZsGXb2JRUWqEMz1G28C6cgeBvmFgGcfwevvLQMJLFNarf6wKYLX1
	xXM5Krz0QzzyiziNITwwz+71+Vzhk07WjlaTgZAZ8iBybrH9CzhNuSA1VDNazwM1XMLhqIdZMOFTp
	3Slp8jDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLPT-0000000EwK1-3zg0;
	Fri, 24 Jan 2025 15:15:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLNr-0000000Ew5M-0zaF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wVE7rgHgEpJPUkUmaljyORlmxMSMeLFMqZuFdz6ZPZU=; b=awbpgpm2/8U6hinrQEgznqUlzx
	XU4QjE+b8q7yQp6aR6RU48V7vyqL9kOPUi+1plgMMZu5hgY2tGYtsjQZnseT38WnPpi9K7qRMxBn+
	yg5m2efPPLXBgkUYyc8H7XiFjtERBF0IMq+Pf1mjee0wKWzeXlLyrxKOLrx62jdWhhdw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tbLNk-007ctS-US; Fri, 24 Jan 2025 16:14:04 +0100
Date: Fri, 24 Jan 2025 16:14:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Cc: Brad Griffis <bgriffis@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
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
Message-ID: <2ac94866-7258-45f1-be7c-595b64595494@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <20250124095305.00002b3e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124095305.00002b3e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_071411_270982_69C46E4D 
X-CRM114-Status: UNSURE (   8.73  )
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

> It is not an actual fix, it is only for diagnostic purposes.
> 
> >   So perhaps the only fix needed is to add dma-coherent to our device tree?
> 
> Yes, add dma-coherent to ethernet node is the correct fix.

What do you think about the comment i made?

     Andrew


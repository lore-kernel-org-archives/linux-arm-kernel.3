Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8EBC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tW/qXnvYgM00U8Ba3VQcPQjfpnDlU9t847cUdAiY8I=; b=HnrFacgBiN9BfZN+o9X4zBmjR2
	UjbxtJz9PS4CH6M89jzEKzS6bZBW5FfOv9QiqM/JH0204VH+feSHcz245KnskSV7x4Q0pcQYl69HA
	RSfWQVUw/1LxIo0bh1wXcXgErRPIxU65TCjk/GV77faZ155NjfJR4AS6pwq7Q95ZvicK18rRFCThv
	wfwAjEY7YmHvuuC3IQG4q35+8Jv0q5aqxt5qdJ9fs8UGiZzKVoNWBflje7nB2DSHI1MYUOG2nu+tr
	niLLY9Qrf5F6re/uFSgXnGI0zaVVeufDZK5JwF0s7HXv5/CfZrq4xOaJJ2+8948V+Z6s7oKMSuOL7
	FKNrUZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2lz-0000000ARTL-0mJD;
	Wed, 19 Mar 2025 23:24:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2kG-0000000AQwr-40LQ;
	Wed, 19 Mar 2025 23:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5tW/qXnvYgM00U8Ba3VQcPQjfpnDlU9t847cUdAiY8I=; b=qCsS93QNEKnq1solw/D+LZAi+f
	G32S6DpBxTTYEroBH3pDG6Os2stVchMaRoa/g9Irhbqkk4cQDjyqRUmPyafRR1LT38Mf1xxC8+uvx
	PYxkbEC8dwRIIszZ+vW35mQWANSFGRLqQfDI+NddQKRajnZibp8ANjmzYK1faMKYULv8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tv2jz-006QKR-El; Thu, 20 Mar 2025 00:22:27 +0100
Date: Thu, 20 Mar 2025 00:22:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: dwmac-rk: Move
 integrated_phy_powerup/down functions
Message-ID: <f6a6e6e6-c00d-4920-a3a3-8699e9a88b6e@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
 <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
 <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_162244_994229_937E39AC 
X-CRM114-Status: GOOD (  12.02  )
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

> > Do you know what these MACPHY_ID are? I hope it is not what you get
> > when you read PHY registers 2 and 3?
> 
> I think it may be:
> 
>   GRF_MACPHY_CON2
>   15:0   macphy_id / PHY ID Number, macphy_cfg_phy_id[15:0]
> 
>   GRF_MACPHY_CON3
>   15:12  macphy_cfg_rev_nr / Manufacturer's Revision Number
>   11:6   macphy_model_nr / Manufacturer's Model Number
>   5:0    macphy_id / PHY ID Number, macphy_cfg_phy_id[21:16]
> 
> and
> 
>   MACPHY_PHY_IDENTIFIER1 - Address: 02
>   15:0   PHY ID number / default:cfg_phy_id[15:0]
> 
>   MACPHY_PHY_IDENTIFIER2 - Address: 03
>   15:10  PHY ID number / default:cfg_phy_id[21:16]
>   9:4    Model number / default:cfg_model_nr[5:0]
>   3:0    Revision number / default:cfg_rev_nr[3:0]
> 
> So likely what you get when you read PHY registers 2 and 3.

Ah:

drivers/net/phy/rockchip.c

#define INTERNAL_EPHY_ID                        0x1234d400

However, it is not clear where the d4 come from.

The problem here is the upper part should be an OUI from the vendor.
I doubt rockchip actually own this OUI. They do actually have the MAC
OUI: 10:DC:B6:90:00:00/28. I don't know if you can use a MAC OUI with
a PHY ID?

	Andrew


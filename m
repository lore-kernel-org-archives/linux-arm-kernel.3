Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A07DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXlIrUme6nI5TeSJuUb5HUxvaF4DfiOkDvcubgx5iXM=; b=fSbkLOIq67LPD438utpBGgA++q
	/6SmJmTT/qQLeTimnMbDt9XbgLMOr27xF91QO/xui7CLsjfgr/8eu9UtRwXyDZyT0NBcyf8Abot9v
	N6C1A8h1HjZ/KAs7qA6EHvIog5hT4YfDw1kMKQIc8ipVzHzQXf5JUe4VM6nidLxUVs78EvdHxYU/k
	RLfjwvyVFsFNeg1vmYhF1MsoVbVqSxPFOiNlNFch/X9n5cugJGcjn8aOYtc2wQJnixMQg7ZJDbLoO
	bjVxlduqEpC7jDH0dt5C3PMqq+Qe1P7q0vvt+Ib/vYJVM1ger0ijzN58PC7k1KvD1ZJmAwEjxlmMp
	yt78JBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPZm-00000004wdy-3akb;
	Thu, 28 May 2026 01:30:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPZl-00000004wdJ-1WmI;
	Thu, 28 May 2026 01:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KXlIrUme6nI5TeSJuUb5HUxvaF4DfiOkDvcubgx5iXM=; b=Fcf7ulx49S3634h4bP50kc9wS1
	UJQ0xQdTbBxYrz3TGVWJuZGZPoSq1NEI7gauP8gur8Qa1xd3PqIBwtw5u5KlVHWNdE6+7/Gue+6oW
	MNQRknas0osuh1ExdTnGQsHGnP150VnGH5Iac4Sy6PMOYMbasQjkZP1Bt9Xs2Zr9U5L4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSPZa-004pzq-VK; Thu, 28 May 2026 03:30:10 +0200
Date: Thu, 28 May 2026 03:30:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
Message-ID: <35d88bd6-49ee-4ad7-848f-3c573c2a7c2d@lunn.ch>
References: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
 <20260526-add-airoha-an8801-support-v5-6-01aea8dee69b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-add-airoha-an8801-support-v5-6-01aea8dee69b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_183021_401234_C6057188 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, May 26, 2026 at 04:58:11PM +0200, Louis-Alexis Eyraud wrote:
> To ensure that the Airoha AN8801R PHY uses the maximum available link
> speed, an additional register write is needed to configure the function
> mode for either 1G or 100M/10M operation after link detection.
> 
> So, in air_an8801 driver, implement a custom read_status callback, that
> after genphy_read_status determines the link speed, sets the bit 0 of
> the link mode register (REG_LINK_MODE) if the detected speed is 1Gbps,
> or unsets it otherwise.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


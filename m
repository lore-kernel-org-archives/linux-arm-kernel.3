Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9994C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRlSKlwPjz5OfI49MqhNhAWG0xXIoHSGK59j5+5+Zr4=; b=bgF95GAxfusOTTo3zCggrBw05H
	GPkzQlvEbGcUf0FFgRY/FnAnv7CvCTsS5cBhrJY1GFhJoacZSbAuBVeG2F72fVCQ3LbnavoLYR1i9
	HopDyPcfhhORBYyWG/Wtk3PeD45FxH6T888/Q7XkR1gllDDbDMRbHuSMTIzyGNPC5pdYP0EnjlOu9
	8mFtKDvseCwbSc37+VlFStHpf8acDDw8aJLf+i+lb6hrj6PhrMSFfQ3YZEy4vfv30ng7jI8s8UgZO
	eL6S33b2mUvXTzgzvTTNH1u3BTPPMuJ7KbCIHa/uGVU4LgsSklZM7dcCEN3WnWgOHw8Gzv6pjMlKV
	7wKlrHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFzT-0000000CFEK-2kyM;
	Thu, 20 Mar 2025 13:31:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFp7-0000000CDG4-2fPa;
	Thu, 20 Mar 2025 13:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aRlSKlwPjz5OfI49MqhNhAWG0xXIoHSGK59j5+5+Zr4=; b=NfN6pSB9tndSEmbKrcEDWBQ7VE
	a3rhcdRX6VShAnN3x/dbyLefD+8TJqkLDiXi5d6YzibV36IF2c6QJjdbn+vRxdiDdMqkzE57BAKxH
	SFkwOeDkzh09nnY8wLo63xOnVyl95cGmwf0YSSaPHNK8nI2jvVhqMZh7j38ODwYQjyBo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvFot-006TkK-9J; Thu, 20 Mar 2025 14:20:23 +0100
Date: Thu, 20 Mar 2025 14:20:23 +0100
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
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: dwmac-rk: Add initial
 support for RK3528 integrated PHY
Message-ID: <b918b36e-e4d8-48a6-bac8-6aacafe129b6@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-6-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319214415.3086027-6-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_062037_669313_D41289B9 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, Mar 19, 2025 at 09:44:09PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
> the integrated PHY on RK3228/RK3328. Current powerup/down operation is
> not compatible with the integrated PHY found in these newer SoCs.
> 
> Add operations to powerup/down the integrated PHY found in RK3528.
> Use helpers that can be used by other GMAC variants in the future.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


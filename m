Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F646C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 00:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ8+kxRgHxsg9Lq20FwRg26DNXtx0z83Ab3cGQEjgIQ=; b=gZSNRuLE1d/ZVIVE1L6Ek97rKB
	qgUUhAw3kdgbfkq31ifdPxx+s8Sv51OXVx4kL42rW6k00ZzMme1bNW/B6c4mypstQ7y/ukQTreovj
	vdo2EsSllmd2QT2xRBvM09uVqEAmFDQe7q1w912jp5oRfmRyMWGTCP+yy+no1c/8kLMuqI7hPR44i
	+JOv3t+ISPImAUT2C4w/AX1fsfKiRhHQSM3FkJBI9lqfeRKiDRtt0rRH3r82rxDkK82haX1aXp0RW
	z+Ee9EFpEDQ8zFGrLJvvN6LabR/heav3wjKXVJyQcdIdmElrAwqygaTGa1kx6tD+YyAv+38s6JIu1
	xsZSbg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3n8-0000000AcIf-34ox;
	Thu, 20 Mar 2025 00:29:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3lR-0000000AcBn-2eq4;
	Thu, 20 Mar 2025 00:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QZ8+kxRgHxsg9Lq20FwRg26DNXtx0z83Ab3cGQEjgIQ=; b=I+zwFf7lk9fa4q2LzhSi0cKayA
	6thWCCbUK6nO0b9AVz/GbEbotAhUMSOaXR23IemJpeyeF4BIMaKNq2bl7ycE5P/lgrlpSD8zWC+jJ
	7dZQ4y80OOdRKTUc67fOO3pt+DI43qSdai/4uTj8Eli3g0AT7O+XpI8Cnix3ghC19Tsw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tv3lA-006Qcw-CG; Thu, 20 Mar 2025 01:27:44 +0100
Date: Thu, 20 Mar 2025 01:27:44 +0100
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
Message-ID: <ab58c128-f598-4586-a912-0d6128934fcc@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-6-jonas@kwiboo.se>
 <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
 <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_172801_668264_0FD2661E 
X-CRM114-Status: UNSURE (   6.63  )
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

>   #define RK630_PHY_ID				0x00441400

O.K. different which is good.

>   /*
>    * Fixed address:
>    * Addr: 1 --- RK630@S40
>    *       2 --- RV1106@T22
>    */
>   #define PHY_ADDR_S40				1
>   #define PHY_ADDR_T22				2
> 
> [1] https://lore.kernel.org/all/20250310001254.1516138-2-jonas@kwiboo.se/
> [2] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr5/drivers/net/phy/rk630phy.c

The vendor driver is going to need some cleanup before you post it....

    Andrew


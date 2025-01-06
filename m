Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B0EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aLrciYDnEQTOvsZYjNjDkrJhzlljLBC+B1yH89oWGQ=; b=hAC24YYK/DkkYfWKe0EWR/JnIu
	CfwvAkWZqTJNFcy7oYtYcCwnw/yjE7d+kapKplcnO0qB421n9BZwWvuuO09k10/waQ2ApiGNJ8lRE
	9NsFRgSXTfABvQu1ZwUrTeuhr5kS0wd/UIEeLUnTmCN8O1mR3AeRaVkgOXbAgZI/RSw7+w4R4cT53
	ltqdLUQ5VRP90SkEYpgvgf0Yvbn5FmkIdW5K6okfVJ1W1IWkgLh1KSvjbNxlDV/WenlXqqHeMA8eN
	3n0bCEALNZEkDUzPJCwFKJt4nJTUnmGxytGaapdKzBLXagpyhG4FNfrk7RDPjlUnhnirPVjJJgf2r
	hFg1rz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqbY-000000024Xl-1QH6;
	Mon, 06 Jan 2025 17:09:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqY7-0000000242a-2bFh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+aLrciYDnEQTOvsZYjNjDkrJhzlljLBC+B1yH89oWGQ=; b=GTkWa4LdfKGCX1iy1jfYBdG32d
	j78Um9OW14LZR82fEoKslaeKZpzh2j+iuneGfN5HQNJhyEIbahslJiG2kkJY4BgVeyio2EUUA433G
	xtHtR6nERkSPd+zCeacsMeP5zEZTZYPa6Lu4l7ppz8RQYiT2sL1Zcn0aOE1vpKmbLF4E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqXw-001wOO-7y; Mon, 06 Jan 2025 18:05:44 +0100
Date: Mon, 6 Jan 2025 18:05:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 14/17] net: stmmac: move setup of
 eee_ctrl_timer to stmmac_dvr_probe()
Message-ID: <a6a44c8b-1c8c-47df-b16b-005bb0520927@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmB9-007VXz-8c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmB9-007VXz-8c@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090555_660273_9E6A8C44 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, Jan 06, 2025 at 12:25:55PM +0000, Russell King (Oracle) wrote:
> Move the initialisation of the EEE software timer to the probe function
> as it is unnecessary to do this each time we enable software LPI.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


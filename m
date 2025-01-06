Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTBw/8twQXi9pbyFxx9LGrGU5Hjj6/2+Qg9FmAlzSXA=; b=BJOUV99yghZWbAS11IacVxDM7s
	rG/ZtBxLXcGOaWjnAQYDaWxP5Abw4TM1LXAVynHfOpRqNvtON8NU1cYNpPSIyzNY1OSS1wX9h86Fk
	yHRej0jDYBjTbxE0VoGxHjq6TFOkOpPS87quJyWA2eNGCDSs5UQ0lmuZKtlf/rDpmVHfrS8VIiaQI
	tLr8o8ZP20GS7BuLuGBpXct+5K4M3Cd2zUOs5Qd/NOANNJ6eYQHaWdd9tx7+mPJvDG/OoSmG/V9IT
	osfpsMYfJJ5FdBNgNP5Izo8hnhBIxu51t4UGHjCS6QnsysrqbJfdrQx7LJ0TXxd8pMs9Cl31n8QtL
	1/kwqm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqGJ-000000020j8-3Qpc;
	Mon, 06 Jan 2025 16:47:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqEc-000000020Qx-2y2F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TTBw/8twQXi9pbyFxx9LGrGU5Hjj6/2+Qg9FmAlzSXA=; b=r5Yobd/4Srwu5zPjD61dr/6lS0
	PYLb751fHqynwTFSO7K0aCM7P435vjExEyWv25ghiNb7YhIAqWEkGmEFRvl5nzS/8hw936gQ/Fsbs
	Duv3x8D6Jj7bdgdEkbZpJGpVnM9eewfmuZr2C4xLegmeVg5rSB2YMbqoi/XbwbaSY5WE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqET-001vsu-AI; Mon, 06 Jan 2025 17:45:37 +0100
Date: Mon, 6 Jan 2025 17:45:37 +0100
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
Subject: Re: [PATCH net-next v2 03/17] net: stmmac: use correct type for
 tx_lpi_timer
Message-ID: <0cf7eacd-6834-47d8-b370-cac5a7395d44@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084546_741391_037A41CB 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> Use u32 to store this internally within stmmac rather than "int"
> which could misinterpret large values.
> 
> Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> should be unsigned to avoid a negative number being interpreted as a
> very large positive number.
> 
> Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> rather than int, which is derived from tx_lpi_timer, even though
> masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> value argument type for writel().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


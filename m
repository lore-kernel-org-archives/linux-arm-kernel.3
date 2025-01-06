Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oxs/4MA4DXr6PGSSsBWV9IJH/JZ+R3a06+GgPvf2gY=; b=Wjor4IkhLLMKORcY5+OztHGQap
	2LYyd/jj5PhDNEv6sQHUvgn3zVZcWd13v4N1m9rdqqNBrVGtRnEBzuICOXGmFDIpJ2jID4Bjv74Q8
	xmomE1buD/P8mJJQDJ/pSifwJ0uRpGVKu7N8t2WzWUlTkG5T51Hj1lzHfQDYfsWMvNqaEQ64V2djo
	YGD+6Yd61lB9U9RU/qwXARO5qv7qXF3DYtqTga35EvE458YfVHZj2GyLiKsFB/pu14UkUoP4TXwAI
	YsIPwKRhtJ7WfT5/yIoXafsheWZGR8MG60D2x/btl4Konpgu/7B7dfajAq+8eAriNIJfvJxURR6NI
	M91OV3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqKx-000000021NF-0bmd;
	Mon, 06 Jan 2025 16:52:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqJH-0000000214A-00ks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/oxs/4MA4DXr6PGSSsBWV9IJH/JZ+R3a06+GgPvf2gY=; b=UFvhH3kv3XUFilKXU3zQlodH0R
	m5tlbzWQR/Z5sr1HRalMkVXU1hrhXtFQgY6ySoLN4kIjjcHyFfK0KWViCucgbUjMp4jJT4CNWbR2K
	1ywZqkKeTU+BsFUdoFqvs5pogWsqUvje0M95uiyIoVffv7Rq9atCs07oBfXG5JitUEVg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqJ9-001w0c-Kv; Mon, 06 Jan 2025 17:50:27 +0100
Date: Mon, 6 Jan 2025 17:50:27 +0100
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
Subject: Re: [PATCH net-next v2 06/17] net: stmmac: clean up
 stmmac_disable_eee_mode()
Message-ID: <310d3d57-0f9d-4d02-a9c6-f54e97acdfef@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAU-007VXD-A4@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAU-007VXD-A4@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_085035_040493_61029FFC 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, Jan 06, 2025 at 12:25:14PM +0000, Russell King (Oracle) wrote:
> stmmac_disable_eee_mode() is now only called from stmmac_xmit() when
> both priv->tx_path_in_lpi_mode and priv->eee_sw_timer_en are true.
> Therefore:
> 
> 	if (!priv->eee_sw_timer_en)
> 
> in stmmac_disable_eee_mode() will never be true, so this is dead code.
> Remove it, and rename the function to indicate that it now only deals
> with software based EEE mode.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


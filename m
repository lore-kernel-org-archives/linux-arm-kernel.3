Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F51C1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c34I4x6KkJp5PTehFXusG5u5mZnXC6pLusYONeJoxNs=; b=jBE1KaRXbPZv9FXGOFb8dIVjfC
	AaCO9F+0miDrFBGhmApcUHR2yGHHgNpk3/q/Dl680fItFMCj9ym9JC2QfbUN7xQti+EcogeSkjy8u
	qBo8BHY2d/iD7oMz+aHUU6grz/BPfR27xl6p5GEF9OEBPmRNhwBr+rh5bR0Cs/RMYodA0LNTcVFaI
	o3KjB8FmMI+63JeqYHrJUzOd7FY/gOyLPtMf+iijEtKyw1sUWlhHPSLjyn6nqdVGndAvRahCykKUH
	aULQJ60Uy8tJ3CiSg6HVfS6hbkyFmB931zjXJ1Yp4cIxxLRhXMQzqIJDuGpM2rDImgIRBNb2h7Z1J
	aMO1uKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneUj-00000007e0o-45u2;
	Thu, 27 Feb 2025 14:04:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnePG-00000007cle-20Yu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 13:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c34I4x6KkJp5PTehFXusG5u5mZnXC6pLusYONeJoxNs=; b=c1LkWkNKrs5QLSgU0Pf1NLvWaP
	5CEyQM1wIblIl/VcC85lTY1hoxlX1K25K70tO5aCh1Cy68wisbgjaDebk9B4i+hU7kXRo8fZwJXQ9
	ZVYf+5shMj0+UUowT4/AUJ00h9B34CBOxfZHe6mtXKn+3r8g7sdUsePGrFZNGUViocmQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnePB-000bpv-SW; Thu, 27 Feb 2025 14:58:25 +0100
Date: Thu, 27 Feb 2025 14:58:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 02/11] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
Message-ID: <f7dcf21c-c43a-4474-868a-85dfec30b7d8@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0K-0052sY-QF@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna0K-0052sY-QF@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_055830_520793_072DAE7F 
X-CRM114-Status: UNSURE (   7.16  )
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

On Thu, Feb 27, 2025 at 09:16:28AM +0000, Russell King (Oracle) wrote:
> Provide a generic implementation for the set_clk_tx_rate method
> introduced by the previous patch, which is capable of configuring the
> MAC transmit clock for 10M, 100M and 1000M speeds for at least MII,
> GMII, RGMII and RMII interface modes.
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


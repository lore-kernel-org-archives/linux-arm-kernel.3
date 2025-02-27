Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65C0C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAD5gaqK7x1cnVYR5Z+IhayFxmM2nS7DFCjvFomea9U=; b=sBoWl7ldNegnhEqsQvTd4sTyIM
	SSlK5xNi3xUmOuYG0m7V4zQNodSLaOb7UBw/hj5I2rEgi7mGSf6CuQ8ltvDOU2UKQRRR8RNhoVcfT
	8isg2UDNZkOr7eLloQn1IaHgZav2wbAb3HuYLe1o1GGbSkQIwviiLx/a0WAw2ttrjlph9wRtwTIgV
	2khRh5T/CyTGogFRGg3K93v0cOOacoTRV51cww4ys/yZSqYFz5Mo+m/VezoS/l8xi1u5eBANqZjuc
	TzHD7DvMtisYgsVn2Qj/SvtqAdBxYRN+ZPV7p3hqpw5c2VU3PN3YTmj/iLwNCyahNrQ37+fQhG7E1
	0Jskn2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmLz-000000091Co-3mYl;
	Thu, 27 Feb 2025 22:27:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmKR-000000090rH-08CW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 22:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JAD5gaqK7x1cnVYR5Z+IhayFxmM2nS7DFCjvFomea9U=; b=Uo6ERNsTacLNPhNTLfvb3Pb5RC
	ztc4m+/t8mZnDvkf4wue8gMYY3mp1h/f6Lfc7rxrcAHBUrIbgnE638keqw/gCcdx6LQvGwkkMJIbM
	9wLOi/DfsoCgtJS7tX+LsGlFGDpI8GUoamHF2SMIrTQI8OYOgiKDDSqR653uzm4+6IK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnmKK-000jtD-TS; Thu, 27 Feb 2025 23:25:56 +0100
Date: Thu, 27 Feb 2025 23:25:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 4/5] net: stmmac: remove _RE and _TE in
 (start|stop)_(tx|rx)() methods
Message-ID: <166e33f3-1602-4d12-853d-0744f6dd4ce6@lunn.ch>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_142603_067952_86C70408 
X-CRM114-Status: UNSURE (   8.99  )
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

On Thu, Feb 27, 2025 at 03:05:17PM +0000, Russell King (Oracle) wrote:
> Remove fiddling with _TE and _RE in the GMAC control register in the
> start_tx/stop_tx/start_rx/stop_rx() methods as this should be handled
> by phylink and not during initialisation.

Maybe the commit message could be extended. 'by phylink', i think you
actually mean via the stmmac_mac_link_up() and stmmac_mac_link_down()
callbacks which call stmmac_mac_set().

Bit of a nitpick, so:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


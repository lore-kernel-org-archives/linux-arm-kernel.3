Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1019CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR07+ur7lR44DlmDxnBOEhptZ0qh61GqcpjU+2E4Clc=; b=hnsKpCRbaW7EhZTJ8Ge7SCD9Hc
	OtDvgEI331FxSMERq0X5m8uaLrTO3KCYFWqzZ9MXx4gNG7LGbGvqu+wqBmHauRVgAkpFUO7ZzmaJ5
	PtpavI4jY/OrTgoN2+SX+PUisiGxZ3F+SEFHzN/m5mixNgots8sN3ADKLq3Daonwzm/sQENJ/cvj7
	7daHzgoKLaYAQf2lhVlKjIBphZs/SNoTpwrDINCc04FjfeIf8IzvkdI2V4TXLCCVjAyYXRJAu1QCS
	K9aYEfLHLiLKGCp9Eujkm1lsbx3AHOPLdYWFr1i96EcpIvj6v39Gdg9U40GsohmobWR/ZOVXPCgTx
	r+31KfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3BM-0000000Bexj-4BD3;
	Fri, 28 Feb 2025 16:25:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to36n-0000000Be2c-0W5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oR07+ur7lR44DlmDxnBOEhptZ0qh61GqcpjU+2E4Clc=; b=FWoQPC9/BSHpE+CDHKOSEiEyaV
	gGMRbdkpgy5zx1Vv0PvZeWkM+f9kzH4A6KNW9P2pgGMTKGv+cflMsancxgoW8Y1g61xPVuvI3qppo
	a3H8x+wb+LxuQeffrrBmJZ9EdbUdNxPEa8cLNNhPzYun0M5Ayy3oBoONars22+rO+jho/CVR+qTsu
	Bx2Q9H1BuZEg66jk/81Vb2mc6mQKEop/cd979oPWgx8aDgON84Tueuqu2h+Mr7hUFSemOXYZcUf08
	GABNqxPi1MLomYpaXXdmDdWaLYALkmWONnrPug9TZtyfEN3l6coyuc849rKkxqPlpfArF2OLeaLaB
	6FwBcLMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47038)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1to36e-0002NQ-2G;
	Fri, 28 Feb 2025 16:20:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1to36c-0000sw-1y;
	Fri, 28 Feb 2025 16:20:54 +0000
Date: Fri, 28 Feb 2025 16:20:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v3 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <Z8HiZpxPLy9YKTsf@shell.armlinux.org.uk>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
 <20250228145540.2209551-10-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228145540.2209551-10-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_082105_161752_B9CB8652 
X-CRM114-Status: UNSURE (   6.64  )
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

On Fri, Feb 28, 2025 at 03:55:34PM +0100, Maxime Chevallier wrote:
>  	adv = pl->link_config.advertising;
>  	linkmode_zero(adv);
> -	linkmode_set_bit(s->bit, adv);
> +	linkmode_and(adv, pl->supported, c->linkmodes);

There is no need for linkmode_zero() with linkmode_and() immediately
after. linkmode_and() writes to its entire destination.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


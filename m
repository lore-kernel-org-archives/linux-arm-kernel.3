Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80762E7719D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agNC8oF9rUXSC9YbiyboPCaucWw3KQBsHEsPHpHMHUk=; b=KdSK8zDMmK8tPlKPUCmubP6tKy
	NzfCpjNzDTFoxYRZqjLnkx+7Fw6rPadZTq0VXOoCt/6G7de0egkM/wyQqd6QIWdrvSvJsAJErAZgH
	1sO93sziG7UjRJyQuJIQJ4FWxAHyRvkiY2GHlZPNtlSE/a2aHFwBd+Qg+2tX1CtZAxkZV8VbyBBHm
	frFCqfmxj/bdrmKLYGWNfOcEZ/Rw3jMDNwZCXvTGRm5kypw2jV6mNU/150o+txXBQKwtewnn0X3Bo
	nVUa1rRnNX32nVHBgRCWLPSLQMUKSh3HqPvQGM9xPOfPwkoV21xSCCRTh5j8goWLmoNL0Kh95MSQd
	VT7CAeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCNP-00000005bkz-1Jgd;
	Tue, 07 Jan 2025 16:24:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCM7-00000005bZf-3rzG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=agNC8oF9rUXSC9YbiyboPCaucWw3KQBsHEsPHpHMHUk=; b=w0tGPoVPuCFhfdKT9EhePXNdrJ
	6jg0NeIr0AUvVSvAQgz6RgYSMfSxiav2wf1dQcn7Pvg6mulrK5TeyeZb6QwWc7qgTohB0O1VlXn0D
	2p/O2XFLE7LMSp6+glS+sgUWj2LcyBQLUvEQPYKiwsR2+g0rQ16MT89SVZwSZFbFAwaw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVCLz-002HvG-1C; Tue, 07 Jan 2025 17:22:51 +0100
Date: Tue, 7 Jan 2025 17:22:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
 <20250107171507.06908d71@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107171507.06908d71@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082259_957163_D65F1890 
X-CRM114-Status: UNSURE (   8.03  )
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

>   I have however seen devices that have a 1G PHY connected to a RJ45
> port with 2 lanes only, thus limiting the max achievable speed to 100M.
> Here, we would explicietly describe the port has having 2 lanes. 

Some PHYs would handle this via downshift, detecting that some pairs
are broken, and then dropping down to 100M on their own. So it is not
always necessary to have a board property, at least not for data.

I've no idea how this affects power transfer. Can the link partners
detect which pairs are actually wired?

       Andrew


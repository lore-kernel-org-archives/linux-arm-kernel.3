Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082CDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o70+Ae9X2Zr3CDWk9BdTtVVj7aEVdRvbX1+IN/r1S7Q=; b=AEaQ1fLid3+39LvJuWrXbgoK9h
	P5hUtfEXXCUO0AFlQI5vrev6C7iDeu9VMw8SbPXOP9rI9ZjUFyOC5AyI4lhx5Ns8InAnw5szYav3J
	JhcaaJreQtrGZH1SFLdf9EIElTp7qM82hG05G6JN3BKXMKTjoc/YsJXN21/jP1R7lRjLupUPafDwK
	UI/z8iD7s/2LwEPlyH9XvNHv1RwpVo5IDIa2+UPaytKQdcRk2n/al/QtUH2ZUysIs+1Vi7jLXRp2s
	6VhWrNrUUnxMEVXJHmoOGd3LJWL0STaxIZpaG8VaOMTiwQ48N/EdZ/H0UUKFPDEhTW2djvXnqGZVG
	mqhx0G2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIjs-00000008gkq-0gpL;
	Wed, 12 Feb 2025 19:49:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIiQ-00000008gVJ-2eOJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:48:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73A3EA41988;
	Wed, 12 Feb 2025 19:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D56CC4CEDF;
	Wed, 12 Feb 2025 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389689;
	bh=yVac8dY+M10XXCZ6KGuP6RmE55GlDz/HkM5TX68DG/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgXONBeQyNYIxCc/hTehCunY9lF08ToTiWnCSIRSenYMIT1SqXIhvSIlngpnyTDTU
	 PEkxliqEa34rjyB2LC4pPC9FOdzTh4NrRDk7vU8QmAJmvTInujX4qV5XXlQfnxyBuv
	 sW6rJ9++nSArChktyXzKGsMeG8vSuZ+27MeSnehTADfXNOJSCaqHHu0lxkDt/2eKki
	 6iwfLDfT8xpeZSFBT0Ge6CXEIx/dTcw7ZC2BDPG8LPZBarPA/GfoA/dNkbCTgz+Iyb
	 ptUWUqpHtvQUS4tGcnczPUsWhW/Ah79BG0gU+TXiy+JVNzSYh5BOMUJLd6k+uPd1cH
	 MXCM7l1WLACGA==
Date: Wed, 12 Feb 2025 13:48:08 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port representation
Message-ID: <20250212194808.GA130810-robh@kernel.org>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_114810_737597_960A4FD1 
X-CRM114-Status: UNSURE (   9.43  )
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

On Fri, Feb 07, 2025 at 11:36:19PM +0100, Maxime Chevallier wrote:
> Hello everyone,
> 
> This series follows the 2 RFC that were sent a few weeks ago :
> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

That makes this series v3. RFC is not a version, but a condition the 
patches are in (not ready to merge).

Rob


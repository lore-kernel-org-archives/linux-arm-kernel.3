Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 22:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwMfUz4DFsWidBocR7kOt39zwWI/U4VW18DMFO9dYPI=; b=edlF3GF4NIkTZ7VBlxcYiby4Wj
	C4+mjWAttOAyOP7ig+MvjOAAlOTp49aaD7vxQamXSgvjJN7XKK6vU2A8KKUjWus1BEMEDR4gTGNf1
	iorP+taibqGRUysVB1i/TtcKYHGaiJkBEK5NMIlIklhI+kDnxYMD2ZeoToqf9+sRnUz4edTMxX9Pt
	m/8oXVdEI0s6CY4HvB2wDRj++3nbQJrQ5Uz0uBY2Zq315LjgEmArSuEi+BSwhuith5RwSB6laAFG2
	xmqK+lEWLxi4lUVMA9eYC/Asskau3sMHH83xyhSvMOpoUqTNc25ZEfoNl60Vfv2gICUXmtqaAzjKI
	hwCNfTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz0kd-0000000GkZc-1fpa;
	Sun, 30 Mar 2025 22:03:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz0iu-0000000GkSY-0mad
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 22:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kwMfUz4DFsWidBocR7kOt39zwWI/U4VW18DMFO9dYPI=; b=qngwqqaaexO6eKBiK3FhtSkgdL
	MSs+nzF88N5K+EnT0ayn42AcEt1Tzd/rNS0zSettN7iHSvSTi0GDIgh/3ttm0X1eKnUb4BifKp7Kq
	Gq8FPlSLKGduevzveO93LqEZAsb+UOabQlZ62bvZcUYAh+P2QGohtxJ/5jZNFbWqPAeQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tz0iW-007XLD-KA; Mon, 31 Mar 2025 00:01:20 +0200
Date: Mon, 31 Mar 2025 00:01:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <022e19f5-9a9c-42eb-9358-a6fe832e8f5f@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
 <20250328133544.4149716-5-lukma@denx.de>
 <3648e94f-93e6-4fb0-a432-f834fe755ee3@lunn.ch>
 <20250330222041.10fb8d3d@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330222041.10fb8d3d@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_150144_273452_1A237B38 
X-CRM114-Status: GOOD (  11.89  )
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

> > > +	/* Prevent a state halted on mii error */
> > > +	if (fep->mii_timeout && phy_dev->state == PHY_HALTED) {
> > > +		phy_dev->state = PHY_UP;
> > > +		goto spin_unlock;
> > > +	}  
> > 
> > A MAC driver should not be playing around with the internal state of
> > phylib.
> 
> Ok, I've replaced it with PHY API calls (phy_start() and
> phy_is_started()).

phy_start() and phy_stop() should be used in pairs. It is not good to
call start more often than stop.

What exactly is going on here? Why would there be MII errors?

	Andrew


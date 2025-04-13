Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9067BC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 23:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc3hQPnL+F3ev1WHyWrf8FAqTE2yopRhwUwxaCnP6ts=; b=MtqRRcg+nCT7eAjqxCX31dajBa
	pG1Aijjo10LkNJtntWiLEuEA78Zp0QNlK05TEBO7bUC8L9Ru/eYxR9gg4/+1nxQ1JGMDISLnaNYag
	jvGmYaeROdZivxBA6TywOeFOQLwQMkua711Wh+zUHUab5VbK/2DJC3YhQ65QoQ0k8ftBTIV9i1Zz+
	AqEu6vZpP6ai42QJh001tLFNqjv2adSU989D3wDTo85MOp6RemugN0ZZ7gwYGLCQiaC9ukYRtmI13
	seE6OWmLoBhFfolrrDVs0SrXtnjT5aXv+N/TOrKbo4MBrvxUIg6FdwU6BodV/y23LMnNBtVtwaR+L
	9c+JXukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u47DB-00000000ME5-0UX6;
	Sun, 13 Apr 2025 23:58:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u467f-00000000IBX-3UjI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 22:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wc3hQPnL+F3ev1WHyWrf8FAqTE2yopRhwUwxaCnP6ts=; b=ciSjOv33CYqLN+A0x6uSF6foQ/
	yt/Iq83shz5+Z/Z+D5H5vwrsMpxqmCFgW62J1m1mnJFCeUOZt0mbHR56pDKixcLRNP4zG9tgFGWVP
	zS/iYR7bMgZSllg/R2Obv5O1VejCYBcx7qEXKCqzRl8vG2FZjD6NWCKL8cVaFzROL58k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u467V-0097KZ-13; Mon, 14 Apr 2025 00:48:09 +0200
Date: Mon, 14 Apr 2025 00:48:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next 4/4] net: stmmac: anarion: use
 devm_stmmac_pltfr_probe()
Message-ID: <5501a5fe-a536-45ed-9411-13d2a752aab3@lunn.ch>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfU-000Em3-Mh@rmk-PC.armlinux.org.uk>
 <acd537c9-51f2-4d5c-a07d-032ea628d241@lunn.ch>
 <Z_w9aE62dqOdr4w9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_w9aE62dqOdr4w9@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_154820_063514_4747A268 
X-CRM114-Status: UNSURE (   7.28  )
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

> Thanks - but nipa found an error in the patch - s/&pdev->dev/pdev/
> with the new call. Ditto for "net: stmmac: anarion: use
> stmmac_pltfr_probe()" so I'll be sending a v2 for both. Do you
> want me to keep your r-b with that change for both patches?

Yes, keep them. The basic idea looks correct, even if you made a minor
error.

	Andrew


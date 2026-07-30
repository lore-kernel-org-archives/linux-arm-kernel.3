Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD6C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNFN2Co99MmNM9wjzZFskt0bLc4iBky+Jm2OcMCXmE8=; b=3kqq2vFd3MS5uWmwyXI7DDINyR
	20ZQZVrRn296VI0vzIz+iQV0LNsWqKrSUlcbv6fcQWhJB6r9xb+FJwFovKELB1Y/cJwSu/u4ILjax
	3DnrRkfVhUWjjD67TEyj8oFuLTAuvXr4+Bt95x4ngf5gBwCW2RpEy4yJD0teSnTnIrS3pxWYpictt
	9yeTojyT9wwEwMsAftGOHPiuOvp4dMq7d1SGLkKlrQ4PI/NTUAILhVnxd3yQLIQ20Eo/WUe3D/i3X
	0HCg0nQ30Ypmz61TQ7swuBCzFRSYhsUVqwH9aZ4dpakTR2lhsWv9tUCPZvoCfwqg+Pe3Odf0xAMJ8
	fFNs+AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTQg-0000000Ay8J-2dde;
	Thu, 30 Jul 2026 16:16:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTQe-0000000Ay7K-1nga;
	Thu, 30 Jul 2026 16:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VNFN2Co99MmNM9wjzZFskt0bLc4iBky+Jm2OcMCXmE8=; b=p/CFWH9OT/Hf2t9gPenGWEjaiD
	Z1qfm6U1bT3BS+ytUN53IACn0m088dp/I7mcIukGS7ipfvdmupelUkYfHVkeRtaflpSloiwR9CiQj
	k8HAJVWOiMXk0OklgT+Z/9C97os3vah6sDXZpgTwItT+uoWuOu0mMpfdkaeUET+odmU8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wpTQO-00F2Cg-JM; Thu, 30 Jul 2026 18:16:00 +0200
Date: Thu, 30 Jul 2026 18:16:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 3/4] net: dsa: mt7530: error out on failed PHY_IAC
 command writes
Message-ID: <5f1b2fc3-33de-4c50-9ad2-fc989838f9de@lunn.ch>
References: <cover.1785427248.git.daniel@makrotopia.org>
 <2c0409afcdbd795fbc15b0cd3c9018474c272883.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c0409afcdbd795fbc15b0cd3c9018474c272883.1785427248.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091616_466853_01C2169C 
X-CRM114-Status: GOOD (  10.38  )
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

On Thu, Jul 30, 2026 at 05:03:29PM +0100, Daniel Golle wrote:
> MT7531_PHY_ACS_ST is only ever set by the command write that precedes
> each poll in the MT7531 indirect PHY access functions, and that
> write's return value is discarded. A failed write leaves ACS_ST at 0
> from the previous access, so the poll succeeds on its first iteration
> and the functions return stale IAC contents as if they were fresh PHY
> data. Check the writes and bail out before polling.
> 
> Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


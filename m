Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E1C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL3Oo7QOt9gbYMZOfnGaQko6Bls9KQHHxXUeMAA4kYs=; b=V5U16tF283XOLoMdwcMcBnqXEM
	Taq+haS4pPEj5Vy/Ty3Seej1I7wwIQ/9Grm3Z4Hu8wjYK9Zsb/OdFdCDUq+RSy1M3ahnuPMgFKkOX
	Jhc6slqniagdqbXTUU7dLJtMgM6iFvK5EazQDzpAR/+eYTovp0q0pDZNN80IkyiiZmUPxgSJEOJGM
	JLeKtjItKB22oCdotRQ73mziLTn2nmUln/PeaF14VdgdLNdw/q/92ipL2bt9YtxfXpfr8oe0+ZqCH
	Gguern6p0yE4YFybdp1ybyJp3+r3sECR0xBZfeF3FP2l0o3LmZphKtMYzEdPkefy6n5fhHaX5u7e8
	9o2PC26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTPv-0000000Axx8-1eA5;
	Thu, 30 Jul 2026 16:15:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTPs-0000000AxwP-3EpQ;
	Thu, 30 Jul 2026 16:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IL3Oo7QOt9gbYMZOfnGaQko6Bls9KQHHxXUeMAA4kYs=; b=kNbvtihEq+ufWkZGyL3dKiuh1L
	VYiSyD5AE4oJel9u0So3Xo9mLfar0Lqf1QG/xJuS4F92Y4mFGoWuqN6Zv7hlg3TfYu9eSCX1qUwfM
	HUuHlEmUI2Bs7BV1j1mVmEW9mlgxdc6ssQbavmD1U55MxFVQeep+06F4LNErn66ez4FU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wpTPa-00F2Bf-IB; Thu, 30 Jul 2026 18:15:10 +0200
Date: Thu, 30 Jul 2026 18:15:10 +0200
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
Subject: Re: [PATCH net 2/4] net: dsa: mt7530: check bus->read() error in
 core_rmw()
Message-ID: <a1bc4379-3d28-4d8e-99ee-8c4035434eca@lunn.ch>
References: <cover.1785427248.git.daniel@makrotopia.org>
 <fe3926ab260b94d88d97ee5f417dab7dcf55f8fc.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe3926ab260b94d88d97ee5f417dab7dcf55f8fc.1785427248.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091528_809349_D615C0B2 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, Jul 30, 2026 at 05:03:17PM +0100, Daniel Golle wrote:
> core_rmw() accesses the MMD core registers directly rather than
> through the regmap and has the same unchecked bus->read() as the
> one just fixed in the MDIO regmap backend: a negative errno is
> consumed as register data, modified and written back to the switch.
> Check the read and bail out like the surrounding bus accesses do.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


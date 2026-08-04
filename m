Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5F7C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rGRx8OaJNzRAz1WOh3NNt3mZINuXm/v8BSSbIGxWRE=; b=EVM8NXxWWroBU1Ix9yV63ef5G8
	m1+IWA7zdK1fkuIRY6uTwnMfPvDb3ODTg/9IG0ngSxavkdnjA4Ywms6dCBB30jNyMYKxr3Jaoi6gj
	yqcN3lUdeH2Sm1i0IWIehUQ7nbfBsicl07VjjWa+NfE7A7sSCc2JAx0LeFHLeuAqPLl+qn7MvAwwn
	Gy7aEeJN2QO+RMtcLVJ0nTaM7UfSoQ62Fw2627ntBZNcu5BrSDQvKGJywEO05gkupMZU41TLcvIhF
	zbYM1s2R4SR1cpB7E7tIAGa0Y5EZWsEUvhyPv9OquQ7qQJrQ/nA6AHac3kPrUjw9l9uxRcJFBr702
	BRMc4RFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKmh-00000002g5G-338n;
	Tue, 04 Aug 2026 19:26:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKmf-00000002g4l-2Qev;
	Tue, 04 Aug 2026 19:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0rGRx8OaJNzRAz1WOh3NNt3mZINuXm/v8BSSbIGxWRE=; b=Ct51M5DXYzZwqiaUq3vOl6E0Yu
	nyFFkmbwUjXEEjJsqJTHVAirm/33GvlgwI1ttgkBUoOhJUmdrP+et7WndcCwkIktuioBAFyVOCUnE
	LLE7alckuKRhcuOO1NjFYBqOGtX7Q+VlvPwkQCtQbgcfm/HIWdnYrquXRApByi1XPOik=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrKmF-00G2yY-HM; Tue, 04 Aug 2026 21:26:15 +0200
Date: Tue, 4 Aug 2026 21:26:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX
 bits
Message-ID: <a12116a7-a25c-4048-9558-9171550d72f2@lunn.ch>
References: <20260804113511.3371248-1-naseefkm@gmail.com>
 <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
 <anIwRrQT9qMD89v5@DESKTOP-TIT0J8O.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIwRrQT9qMD89v5@DESKTOP-TIT0J8O.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_122641_620004_BC9B3105 
X-CRM114-Status: GOOD (  19.06  )
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

On Tue, Aug 04, 2026 at 10:32:38PM +0400, Ahmed Naseef wrote:
> On Tue, Aug 04, 2026 at 08:11:21PM +0200, Andrew Lunn wrote:
> > On Tue, Aug 04, 2026 at 03:35:11PM +0400, Ahmed Naseef wrote:
> > > MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
> > > from the RX blink bits instead of the TX ones, so both TX masks are
> > > identical to their RX counterparts. The TX bits they should be using,
> > > MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
> > > by the per-speed branch of mtk_phy_led_hw_ctrl_set().
> > > 
> > > A TX trigger selected without a link trigger therefore programs the RX
> > > blink bits, and the LED blinks on received traffic. The masks are also
> > > used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
> > > as a result cannot tell the two triggers apart: an RX-only
> > > configuration reads back as RX and TX, and a TX-only configuration
> > > reads back as neither.
> > > 
> > > Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")
> > 
> > Was this bug introduced in this commit, or did this commit just move
> > the code around and it was broken before? The Fixes should go back to
> > where the bug was added, which could be earlier.
> 
> It was introduced by that commit. Before it, mtk-ge-soc.c correctly had:
> 
>   #define   MTK_PHY_LED_BLINK_TX      (MTK_PHY_LED_BLINK_10TX |\
>                                        MTK_PHY_LED_BLINK_100TX |\
>                                        MTK_PHY_LED_BLINK_1000TX)

Thanks for checking.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870DEA4E22
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/L1RsM3ifNpNZNp4Aw/HlURvPThVG1lk4TYHvWSF78=; b=lVsUjVbHdsWHvabALbxa/P7+SM
	1CcQQ5e1TI9LP/OWCRg+q/XCBMuJ3Kvf5J/zYjTvAV43rs4343Y7CUtJ/fQsvhv2xAcFQdctUkO3E
	t/mEutvl4Ne2NSIYBP5G7SIYu5tVAUGk3TqzmaAVPe8zwCNFp4MJMtmy02c27F6k7b51560VplaZu
	jQiRJmgnGMAXsh3DgriGn2nXZwjyaBx5iI9tIOIpe2Dx14OrHT7+NLygJjc/GX5/j9aw1MfhI06GT
	pj6s65kXSz09h74QG3WDP6gMNEbEFPsg+diZnWT9wN6z0Thom9aO93XGVAyBAiDJPndjpcxnnglHZ
	Ve3mEEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx56z-0000000DLu3-1w6e;
	Mon, 02 Mar 2026 15:23:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx56x-0000000DLt9-2TyL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Z/L1RsM3ifNpNZNp4Aw/HlURvPThVG1lk4TYHvWSF78=; b=5A4V46mpge7k4Q/0orHLQoyri9
	blKLRtS4agjMpmaalW+TWwrHoBTOWJaHLult03tudMjFWdWQvfAXS9V+unyuhg2E9GuebFc83lqOO
	54Hx+w4Qa6jy1jvIsmGXdvzKYUlha0ocSzDAtAimxVhLfpHB8lE6nVHnDaNVd1LBqD68=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vx56e-009h7F-Ej; Mon, 02 Mar 2026 16:22:48 +0100
Date: Mon, 2 Mar 2026 16:22:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: Handle PHY reset during initial PHY
 ID read
Message-ID: <9c29300b-a8f9-4b92-bb38-c75a6b56e793@lunn.ch>
References: <20260302144458.3180702-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302144458.3180702-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072307_631293_39DD7C70 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Mar 02, 2026 at 10:44:57PM +0800, Chen-Yu Tsai wrote:
> The mdio device core handles reset GPIOs and controls for PHYs and
> MDIOs after the MDIO or PHY device is created. However this does not
> cover the initial PHY ID read _before_ the PHY device is created, since
> the PHY ID is needed for the PHY device. This causes PHY devices that
> have reset GPIOs or controls to not work after a reboot if the GPIO
> is left in the reset state; neither will it work if the reset GPIO is
> by default (for example, missing a pull-up) in the reset state.
> 
> One possible workaround is to place the reset GPIO or control property
> under the MDIO bus instead of under the PHY. However the common PHY
> device tree bindings already allow a reset for the PHY, so we should
> make some effort to support this.

Please either:

1) Add the ID to the DT

2) Work on driver/base, and add generic power on sequencing code which
can handle reset GPIOs, reset controllers, regulators, clocks etc. A
solution which works for PCIe, USB, SATA, and other enumerable
devices.  And then modify phylib to use this generic code.

    Andrew

---
pw-bot: cr


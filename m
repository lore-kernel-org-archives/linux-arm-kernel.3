Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E82ECCA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO9r6nTqLr2tVA0A8M90x9kRo7dOno/9gKwYAl3CwRk=; b=E+n/hKoD2y+5xoJuKoLqA1k4eo
	Lh3sQnbOiTVrzY/j3AnjWn8NO9zhC+wOr9H6/7V1+1GKLEiwfg3Ai/u1Re2nNvs6oTQmxeH+cqyXD
	1kZ2fnkCRtZQ8M+JYPq76H+o+rfUlLw4NR3CTUE9wSd8bnlx8NXqG3goeqiaSP3zqK3T6n92STqSH
	6LCQfzEZaXkVbLvwCpyIBOg1TZBURKR8dyHiaB5/chkzm0eT2ZAmm9n7PnP/y1pYN5iGow4Qgf3Fe
	jFBkbYig4YeSttx+iLGENCvegGKri/1modIxY+lrffphilt248uwwD8EfWT5D68a9i7WyWkmwbFpY
	2UukGjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rYh-00000006wfl-1PR6;
	Wed, 01 Oct 2025 07:47:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rYe-00000006weW-30S6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GO9r6nTqLr2tVA0A8M90x9kRo7dOno/9gKwYAl3CwRk=; b=N1RNaG894XdDdK0mI83+kc5Ajm
	Z8NqCdllVlqLGkDMQ4dDaQxGkmyS7j5adsiRmA6gIj1QMjn7J/ytNoV7fDPBh5WNADhPrAOTgCT/N
	M9H/35Knojmj2po/LyBnnHKtacH0aLXS+dqXcG3j3MU7vieuRSkEu4P5yUAM/LEnW/tyV8N57ZyUm
	RtHk1ZzeirzYSdCxuqoP2Zq/oxa9oF6iJA8F/1ZFpv3ZJ88sgCF3+6YQSDDZZ49ewDy3OHSNn1kpd
	9GgIrVuGpCDeu2FFrlNo/4SQnQ6zEkk2yp5i9w0uCHiOx1Mc9Iq+sIONJ5VzBb1jsC9tRfLTJj6Zk
	SoCvxfdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40816)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v3rYN-000000000Aj-0u3G;
	Wed, 01 Oct 2025 08:47:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v3rYJ-000000005J3-0T0K;
	Wed, 01 Oct 2025 08:47:07 +0100
Date: Wed, 1 Oct 2025 08:47:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <aNzcehZ7ALayP48B@shell.armlinux.org.uk>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org>
 <20250930172022.3a6dd03e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930172022.3a6dd03e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_004728_756729_BF93BF10 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue, Sep 30, 2025 at 05:20:22PM -0700, Jakub Kicinski wrote:
> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
> > On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
> > > The Allwinner A523 SoC family has a second Ethernet controller, called
> > > the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> > > numbering. This controller, according to BSP sources, is fully
> > > compatible with a slightly newer version of the Synopsys DWMAC core.
> > > The glue layer around the controller is the same as found around older
> > > DWMAC cores on Allwinner SoCs. The only slight difference is that since
> > > this is the second controller on the SoC, the register for the clock
> > > delay controls is at a different offset. Last, the integration includes
> > > a dedicated clock gate for the memory bus and the whole thing is put in
> > > a separately controllable power domain.  
> > 
> > Hi Andrew, does this look good ?
> > 
> > thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
> 
> Adding Heiner and Russell, in case Andrew is AFK.

I believe it's fine. Applying the delays irrespective of the RGMII mode
is what I think needs to be done to allow the delays to be fine-tuned.

The author hsa confirmed that the delays don't apply to RMII, so that
isn't a concern. So,

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


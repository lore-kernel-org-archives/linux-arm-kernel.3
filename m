Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQqhnepfREGfXBXs6Gy2jlQYAmeLNJdpGYN4w0cdQSQ=; b=Mqnm4q6HT4/caNa5DRg3rEE++M
	sFI1MKtXEkDxASFTQoePIMXOMzCXITctsTkVasRU/uq8HotXfcOvbitbtSAd5HfpvnJcP2VJdCO8s
	iZ+gBSfTXXU1lubEOov/w5HS+WP/QBlhmHV3X/X2hrw+PhqeOYKwzDnTlxS/hB4v+kYC6lVZkQf3k
	/AXDggFWz+NFos0liJgA/eiOdLP8I6QQZ925dpWNto1Bj5eXh3d9Hho5HV9pUYVO8takGttvREcFW
	E6m4Nk6sKaSEZwzDZGZIPyhcnhplpRKB3ucJZC/pqqb9YhqAZRXrlouuPdEXkuNTN56odTWZPZdH1
	iR0bOkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJDs-00000002IBi-0O6v;
	Mon, 14 Jul 2025 13:28:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIwC-00000002Eik-07g6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cQqhnepfREGfXBXs6Gy2jlQYAmeLNJdpGYN4w0cdQSQ=; b=sUyJsBIYZZmfdt9NaOTTe/wl8q
	9WCbAVyudP9xk/saAaz0MTppPijs97FYttyaxfqpr7xVQ6OTJjCkEGFAhgBSaxAh4dwC9Jq7uggHk
	tfCx0DB5aSxpzzhMh0Y5uqbpHKzQkO4qB1JegaktAqSu0QQovxxJZFiUwhetDKg6fXoU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubIvq-001SZ7-L8; Mon, 14 Jul 2025 15:09:22 +0200
Date: Mon, 14 Jul 2025 15:09:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Walle <mwalle@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <fa3688c0-3b01-49fb-9c16-eeea66748876@lunn.ch>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <DBBOW776RS0Z.1UZDHR9MGX26P@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBOW776RS0Z.1UZDHR9MGX26P@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_060944_065624_0B4DDFA2 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Jul 14, 2025 at 12:01:22PM +0200, Michael Walle wrote:
> Hi,
> 
> On Tue Jun 24, 2025 at 12:53 PM CEST, Matthias Schiffer wrote:
> > All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> > mode must be fixed up to account for this.
> >
> > Modes that claim to a delay on the PCB can't actually work. Warn people
> > to update their Device Trees if one of the unsupported modes is specified.
> >
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> For whatever reason, this patch is breaking network on our board
> (just transmission). We have rgmii-id in our devicetree which is now
> modified to be just rgmii-rxid. The board has a TI AM67A (J722S) with a
> Broadcom BCM54210E PHY. I'm not sure, if AM67A MAC doesn't add any
> delay or if it's too small. I'll need to ask around if there are any
> measurements but my colleague doing the measurements is on holiday
> at the moment.

I agree, we need to see if this is a AM65 vs AM67 issue. rgmii-id
would be correct if the MAC is not adding delays.

Do you have access to the datasheets for both? Can you do a side by
side comparison for the section which describes the fixed TX delay?

	Andrew



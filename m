Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E58CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xu5J2YUVmO+KaIFCwe3YTQ+9UN97u6v/RSU7wP6bNI8=; b=glxwetH7pJcpAS7LZRLUWwBfYE
	0G83mQ4JGNhyGE8rS3PJwH/hEHLixsAFrZsJT0wlXOC0icdF/KV4hHu+K3orChPG2Xd/Npaj1IKjW
	QDipCng+tHgebTutBWsL7Q8KQynHbYO+tJ8ZNPE8EQmkX35OxG3IJOdzrvyBDdhHMHuZOhPydk1mT
	Bv1qwlxmhBN9D6qRy/TUYsllxS+TDgxnwmQ6V548iBYyATtAlcUQqFtM9MhZ2W4DIuBrKJxCD37DI
	gcNDocuzTRepmp5nZlLeKUr1+6wOBQ1ZnmYYD4TmpffSljOU8DnoeBrs2+xI6vnlbYwbDIgqs6m1P
	IZov75KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAlf-00000008pl6-1Mbk;
	Wed, 12 Nov 2025 13:20:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAld-00000008pke-1sTP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xu5J2YUVmO+KaIFCwe3YTQ+9UN97u6v/RSU7wP6bNI8=; b=0uvMUYbckaKxc9ZGTp6DGbg3YN
	LALnRa7NcqVeGPt4nB5iXP1V4HqFy8LBFW7/xewuahRQ+6gPCw2f4WaEhI9ijAyzq6xNrwf7/E+M8
	UvW05os7ZPsFzkNKwfIlPDFicG82Pb+eeBdJi4Lf92Ogx+Yp8YwTCJ6bJaypmP2LJ6A0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJAl1-00DkSt-Dv; Wed, 12 Nov 2025 14:19:31 +0100
Date: Wed, 12 Nov 2025 14:19:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v4 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <3af52caa-88a7-4b88-bd92-fd47421cc81a@lunn.ch>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
 <68f10ee1-d4c8-4498-88b0-90c26d606466@lunn.ch>
 <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_052009_510871_D73921F0 
X-CRM114-Status: GOOD (  20.98  )
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

> > This is an optional property. If it does not exist, you have an old DT blob. It is
> > not an error. So you need to do different things depending on what the error
> > code is. If it does not exist, just return 0 and leave the hardware alone. If it is
> > some other error report it, and abort the probe.
> > 
> 
> Based on this for next version, I want to move the "aspeed,scu" from dtsi to dts.
> Change it to optional and accord it whether existed to decide it is old or new DT 
> blob.

I think that is the easy way out, not necessarily the correct way.

All systems have the aspeed,scu, so it should really be in the .dtsi
file.

What are you really trying to solve? That the DT blob says "rgmii",
but the bootloader has configured the MAC to add delays? You should be
able to test for that condition. If it is found, issue as warning, and
treat phy-mode as 'rgmii-id'. If the DT blob says 'rgmii-id' and the
MAC is configured to add the delays, the system is at least
consistent, no need for a warning, disable the MAC delays and pass
_RGMII_ID to the PHY. And if the blob says 'rgmii-id' and the MAC is
not adding delays, no need to touch the MAC delay, and pass _RGMII_ID
to the PHY.

Are there any mainline DT .dts files which say rgmii-txid, or
rgmii-rxid? They would be rather odd, but occasionally you see them.
Assuming there are not lots of them, i would probably just leave
everything as is.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E341ED44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10XFHA4WlKYuCUuXVeCcAEgWg2V+Sh14geel43tsfcc=; b=Q7n2RQ6U7ndhyi5WFpWpuxJwcY
	ccxBR5WUPsSQrtVmhwK407DIoyXsmroQ6D5U3p83OLz3PrNHCY9wZRhDQq1n+jLYxdYmMI/9QQcqi
	ahzdLSFoZKgqBaM5jnnOAdtRSTRkks2GCisT5ghGVhBMV+txZnNIqcNeUKA0vTJTMVmnmlyUbqEba
	grcu6KGSnf+ZGQOGOmviTpyjozHBLvRKORx+Uil+GMX1Tw9iQ74Ckmm9zRqyvzy+e4Dkb6/KU2FLh
	ykK5FX0pNvlJ62OUi5URcUvsJPFZMdXpfILvQl6yeluUOsgFlNRkgQS+ObEd/iJm7kO1eaeXaq9gw
	HJiXyFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOGF-0000000CVMG-2Ls5;
	Tue, 19 Nov 2024 13:27:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOFJ-0000000CVDI-1VBK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=10XFHA4WlKYuCUuXVeCcAEgWg2V+Sh14geel43tsfcc=; b=v9EloRtNMXlEcEg5euoahINDxU
	BsgU65QlQD3uKoH2Qfbws9YV99RKTqGhbNFfLlHJdXiMqeRGVZPP9EN3NhIszhvO2b7U1cHNOl8TB
	Uf2vRBK/g7+XhmdmS+DtqxOBlvzGNzx5wQ9oYLv7nfbV0tIxHs9aYDTptdocqbXumWkc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDOEv-00DnnA-DP; Tue, 19 Nov 2024 14:25:57 +0100
Date: Tue, 19 Nov 2024 14:25:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [net-next 0/3] Add Aspeed
 G7 MDIO support
Message-ID: <6ae91aae-5939-4ffd-a430-181fb88d259b@lunn.ch>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
 <7368c77e-08fe-4130-9b62-f1008cb5a0dc@lunn.ch>
 <SEYPR06MB513475D2B233EA9BDF52AD259D202@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB513475D2B233EA9BDF52AD259D202@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_052621_398977_A382F4E7 
X-CRM114-Status: GOOD (  13.38  )
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

On Tue, Nov 19, 2024 at 05:35:40AM +0000, Jacky Chou wrote:
> Hi Andrew Lunn
> 
> Thank you for your reply.
> 
> > > The Aspeed 7th generation SoC features three MDIO controllers.
> > > The design of AST2700 MDIO controller is the same as AST2600.
> > 
> > If they are identical, why do you need a new compatible?
> 
> We want consistent naming in the DTS of the new SoC, even if Its 
> design is the same as the older SoC.

You might find the DT Maintainers push back against this. What you
want is effectively a Marketing game, it has little to do with
technology, describing the hardware.

	Andrew


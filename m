Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8373DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wpx9IjkcuCXJrN+lvoQ0/PWGUe4eWqI7yjH11ZhMTc=; b=Azg92AiNdwJw2jUhB/Nb67TQj+
	MD++CSKAThvcoVAlLNX8SVy5dPCu7WHErXbIGh7o33P+yl7jjixy7/XRN7MukWxK0b2Abm/KTAaYb
	qmbmhADOgibaNgSwLtsFb5+CF8a4i8B1lKJxsdRuieF08AAliQg1iZWmm+mHh/YvEfCZE4hgEO3Oo
	f3vLSd1RM/OO2K5M4RNqcN67CasdJt87EyWmGNCjrkm2wDg5g6EWYllVchUg3bueVODbSEO/WKSzB
	vFoiSTI524Bx5tJZtHSr9lyH5KY9sYVczoeO23OplTQRGJbm9qz+OIZ5rnSKhraL8Xdn2p2OYbvy9
	twjYYBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQYl-00000005Rnj-0sg4;
	Tue, 02 Dec 2025 13:36:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQYi-00000005Rmq-15G8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1Wpx9IjkcuCXJrN+lvoQ0/PWGUe4eWqI7yjH11ZhMTc=; b=VC9d/UAnse+naHpZdifFVmTv3e
	21BAnHhjw8HPGF19RKmyVaDfCX6uHMOxsibeLkKxh5KZZeEQwS0ZaR2Ua03HSCUyahL8vElefUN41
	iBZxxnp/a8B+iPeb1ShSxBRSNEViUIygvNlf3anjA6FMYUa0PzxmLXuwq5Uhc3Ct54bE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vQQY7-00FhXN-UW; Tue, 02 Dec 2025 14:36:11 +0100
Date: Tue, 2 Dec 2025 14:36:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Tao Ren <rentao.bupt@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <4f0e4aa0-166d-4a7f-b91e-42dbc6b832e5@lunn.ch>
References: <68f10ee1-d4c8-4498-88b0-90c26d606466@lunn.ch>
 <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <3af52caa-88a7-4b88-bd92-fd47421cc81a@lunn.ch>
 <SEYPR06MB51342977EC2246163D14BDC19DCDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <041e23a2-67e6-4ebb-aee5-14400491f99c@lunn.ch>
 <SEYPR06MB5134BC17E80DB66DD385024D9DD1A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <1c2ace4e-f3bb-4efa-a621-53c3711f46cb@lunn.ch>
 <aSbA8i5S36GeryXc@fedora>
 <SEYPR06MB513424DDB2D32ADB9C30B5119DDFA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <SEYPR06MB5134A5D1603F39E6025629A19DD8A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134A5D1603F39E6025629A19DD8A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_053648_301744_0A97E2E0 
X-CRM114-Status: GOOD (  17.36  )
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

> Hi Andrew,
> 
> I miss one condition is using fixed-link property.
> In ftgmac100, there are RGMII, NC-SI and fixed-link property.
> On RGMII, we have solution on dedicated PHY, but there is an issue on fixed-link
> property.
> 
> Example on dedicated PHY.
> The driver can pass the "rgmii-id" to tell PHY driver to enable the internal delay on
> PHY side. Therefore, we can force to disable RGMII delay on MAC side.
> But there is not any driver when using fixed-link property, which means
> no body can tell the outside device, like switch or MAC-to-MAC, to enable the internal
> delay on them. Also mean the phy-mode in fixed-link case is not used.
> 
> Therefore, could we ignore the RGMII delay on MAC side when the ftgmac100 driver gets
> the fixed-link property? Just keep the original delay value?

MAC to MAC is one of the edge cases where phy-mode is not great. What
is generally accepted it to use rx-internal-delay-ps and
tx-internal-delay-ps with 2ns and a comment explaining it is a MAC to
MAC link, with this MAC adding the delays.

I suggest you see how messy it is to implement this for 2600. If the
code looks horrible, keep the bootloader delays. For 2700 you have a
clean slate, you can implement all this correctly from the start.

	Andrew


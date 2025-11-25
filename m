Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9DED0EE18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5DEfi++1C8bftapZgqYGj62YjX3kAgMlduZ/oN7pZ4=; b=TKd2+HoMMmK/450+Wk40UHCj4y
	9xsnML1BEmZL63fHFff/EtGgHZ+EVDu3khnrNKGmtV55n1sUeo5QXf/elKCKjEga6TvkTUZ7rjnCq
	sstX0+8pLw33y56Sg18RgOfRtDjz1CmokQTcNkapDgQIZZ+II72pKG3Ym6xn52vm9hnfaezjNW0xS
	WaJRDTL+NqMuI175ntn+DiZmoPHxcq6Dt049mvi0ghqS+xGcYrOErzYl4Q1WCByFYR6Wt4jwyGtbt
	FqxMqrInKto6tYHkBTtK0NbR89elDnFHdN8T6yi6zIKRg9qXoAN1r/bh27v91aPXuAYc/NhxVxZD6
	D9OLbhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2nh-0000000E5hd-1mW5;
	Tue, 25 Nov 2025 23:50:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2nf-0000000E5hD-2inK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v5DEfi++1C8bftapZgqYGj62YjX3kAgMlduZ/oN7pZ4=; b=LO3hDRESQrCbqmtAAAldsvnpKS
	oB2F7027X8GPBxEB5HXMPoON3NcEYL7a8m2rDjC7OwKAo/00pFXnIDPIjPxmqs5ll1LfYHhbI/qjM
	IA+xdcVV7tSrOsqWvX5SghR1oYbfrvFQ29wKqPMGjjYPJMdXtiacYOjEXDcmOP7PGVKA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vO2nF-00F5Jm-3I; Wed, 26 Nov 2025 00:49:57 +0100
Date: Wed, 26 Nov 2025 00:49:57 +0100
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
Message-ID: <1c2ace4e-f3bb-4efa-a621-53c3711f46cb@lunn.ch>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
 <68f10ee1-d4c8-4498-88b0-90c26d606466@lunn.ch>
 <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <3af52caa-88a7-4b88-bd92-fd47421cc81a@lunn.ch>
 <SEYPR06MB51342977EC2246163D14BDC19DCDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <041e23a2-67e6-4ebb-aee5-14400491f99c@lunn.ch>
 <SEYPR06MB5134BC17E80DB66DD385024D9DD1A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134BC17E80DB66DD385024D9DD1A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_155023_709855_9AFB39E4 
X-CRM114-Status: GOOD (  22.27  )
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

> I try to summary in the following informations that I understand.
> 
> 1. with rx-internal-delay-ps OR tx-internal-delay-ps OR both
> 
>   Use "rx/tx-internal-delay-ps" property to configure RGMII delay at MAC side
>   Pass "phy-mode" to PHY driver by calling of_phy_get_and_connect()

Yes, since they are new properties, you can assume the phy-mode is
correct for these delays. We just need to watch out for DT developers
setting these delays to 2000ps and 'rgmii', which would be against the
guidelines.


> 2. withour rx-internal-delay-ps AND tx-internal-delay-ps
> 
>   If "phy-mode" is 'rgmii-rxid' or 'rgmii-txid':
> 	Keep original delay
> 	Print Warning message
> 	  "Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> 
> There are FOUR conditions in delay configuration:
> 'X' means RGMII delay setting from bootloader
> A: 7500 <= X <= 8000, 0 <= X <= 500
> B: 500 < X < 1500
> C: 1500 <= X <= 2500
> 	Mean "Enable RGMII delay" at MAC side
> D: 2500 < X < 7500
> 
>   If "phy-mode" is 'rgmii':
> 	Condition A:
> 		Keep original delay
> 		Update "phy-mode" to 'rgmii-id'
> 		Print Information message
> 			"Forced 'phy-mode' to rgmii-id"

So 0 <= X <= 500 is a small tuning value, so yes, is correct.

> 	Condition B and D
> 		Keep original delay
> 		Print Warning message
> 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"

Yes.

> 	Condition C:
> 		Disable RGMII delay at MAC side
> 		Update "phy-mode" to 'rgmii-id'
> 		Print Warning message
> 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"

'rx/tx-internal-delay-ps are probably not required in this case, the
2ns from the PHY is probably sufficient.

> 
>   If "phy-mode" is 'rgmii-id':
> 	Condition A:
> 		Keep original delay
> 		Keep "phy-mode" to 'rgmii-id'
> 	Condition B and D
> 		Keep original delay
> 		Print Warning message
> 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> 	Condition C:
> 		Disable RGMII delay at MAC side
> 		Update "phy-mode" to 'rgmii-id'
> 		Print Warning message
> 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> 

These look correct.

How many different boards do you have you can test with? Do you only
have access to RDKs? Or do you have a test farm of customer boards for
regression testing. I would throw the patchset at as many boards as
you can to make sure there are no regressions.
 
> Because the driver may need to update the "phy-mode" of dts, it need to add
> CONFIG_OF_DYNAMIC in ftgma100 of Kconfig.

I don't think you need this. At least, i would not patch the DT blob.

You are only fixing 2600. 2700 will be correct from day 1. You don't
need any of this code for the 2700. The 2500 also does not need any of
this, from what i have seen of the 2500. I've not looked at 2400, but
i also assume none of this is needed there.

The current ftgmac100_probe() is very complex. So i would pull it
apart into helpers. It looks like the ncsi is generic across all
versions. So that can be put into a helper. I would then probably have
helpers for 2400/2500, 2600, and sometime in the future 2700. In the
2600, i would look at replacing the of_phy_get_and_connect() with a
call to of_get_phy_mode() and of_phy_connect(), changing the interface
value passed to of_phy_connect() as needed.

	Andrew


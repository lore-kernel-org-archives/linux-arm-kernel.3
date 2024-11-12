Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F4D32D8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTmv0CbwPhVLiyGv+VThv2LUCJf1WK8mnDMsTKFO0S0=; b=Nz4UlPwwy4xfdvdzuwjOLCx4bR
	4z0WrDcQ7tPLnoVtUD+ZidQ+FIdTFx6x3PgvZnWMxucRASpmPc60s19VZ1FR+a8dKpQsnT2chtIsH
	wCyKg5uAUR/DOVmokFaF+pwMzzanhRCU/1lEGbeRsiuBnM285IaAQ8KkPu6qESvjx8SN4PmL1Ro/g
	XVqpwRY95XpEBsVeY7G7UFDqXgII2bQe9fWeDbh0NjnuBT4TiXqRlZS2JBWI+cJjyugF/Y4fjoIYV
	Y9C7o0MmBCcIFnrvXoXpBNod6iGf7b/cE+udG4vNb0VFJe/fQh8yc2lVaTwsdsks57F3hhfRk5YdG
	t1QqYxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIU-000000034so-3QTA;
	Tue, 12 Nov 2024 10:38:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo6K-000000032WL-1ciP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731407184; x=1762943184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kuZHpQVynWF0dMml92KBBRYvg0segfgTnuEueyOfqWI=;
  b=yHfanwW6QiTlKeSiE8DsXU1u0C0XkOHkBJkrr16lnoQeiRXQdZwZnggW
   l2Qapa3tRkHYdsyHnNNCY3pATuxf6IXImDUTM+Iwm0wl11tHEC0242LIr
   efR4istcfTPXmfckxy9USEUU34SRnF97MkzIPSa8ZHhDCRV4Fsbblf2R9
   JvAVlzqTCmtoc+xvzNyLW2PWFgypte7/XpUEGCt2TWc1npKT3G0VuCkFu
   qaNKQgA2Z4BbD/jAZ1QhKMovH1aAhX1V51yczIsA9fZk1FT55Mt3TrZ3S
   D1DV59DDS3qScmxeJDsT3YjvoVKk7wvSat/smS1IMF9qtToRv4g9Gq6rF
   w==;
X-CSE-ConnectionGUID: 3LJNlechSByP7VxoY/Eupw==
X-CSE-MsgGUID: 9ycbmhISRkmmNQwzqMXIaQ==
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="201628733"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Nov 2024 03:26:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Nov 2024 03:26:20 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Nov 2024 03:26:17 -0700
Date: Tue, 12 Nov 2024 10:26:17 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, <UNGLinuxDriver@microchip.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, <jacob.e.keller@intel.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next 7/7] net: lan969x: add function for configuring
 RGMII port devices
Message-ID: <20241112102617.lhb5ou7kxlqm7qhk@DEN-DL-M70577>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
 <20241106-sparx5-lan969x-switch-driver-4-v1-7-f7f7316436bd@microchip.com>
 <6fee4db6-0085-4ce8-a6b5-050fddd0bc5a@lunn.ch>
 <20241108085320.fqbell5bfx3roey4@DEN-DL-M70577>
 <Zy32_Bs7gDAtay5V@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zy32_Bs7gDAtay5V@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022624_617578_23D28CD6 
X-CRM114-Status: GOOD (  28.76  )
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

Hi Russel,

> > Hi Andrew,
> >
> > > > +     if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
> > > > +         conf->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> > > > +             rx_delay = true;
> > > > +
> > > > +     if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
> > > > +         conf->phy_mode == PHY_INTERFACE_MODE_RGMII_RXID)
> > > > +             tx_delay = true;
> > >
> > > O.K, now warning bells are ringing in this reviews head.
> > >
> > > What i don't see is the value you pass to the PHY? You obviously need
> > > to mask out what the MAC is doing when talking to the PHY, otherwise
> > > both ends will add delays.
> > >
> >
> > What value should be passed to the PHY?
> >
> > We (the MAC) add the delays based on the PHY modes - so does the PHY.
> >
> > RGMII, we add both delays.
> > RGMII_ID, the PHY adds both delays.
> > RGMII_TXID, we add the rx delay, the PHY adds the tx delay.
> > RGMII_RXID, we add the tx delay, the PHY adds the rx delay.
> >
> > Am I missing something here? :-)
> 
> What if the board routing adds the necessary delays?
> 
> From Documentation/networking/phy.rst:
> "
> * PHY_INTERFACE_MODE_RGMII: the PHY is not responsible for inserting any
>   internal delay by itself, it assumes that either the Ethernet MAC (if capable)
>   or the PCB traces insert the correct 1.5-2ns delay
> ...

Ack. The case where the PCB traces add the delay is certainly not
handled with the current changes.

> For cases where the PHY is not capable of providing this delay, but the
> Ethernet MAC driver is capable of doing so, the correct phy_interface_t value
> should be PHY_INTERFACE_MODE_RGMII, and the Ethernet MAC driver should be
> configured correctly in order to provide the required transmit and/or receive
> side delay from the perspective of the PHY device. Conversely, if the Ethernet
> MAC driver looks at the phy_interface_t value, for any other mode but
> PHY_INTERFACE_MODE_RGMII, it should make sure that the MAC-level delays are
> disabled."
> 
> The point here is that you have three entities that can deal with the
> required delays - the PHY, the board, and the MAC.
> 
> PHY_INTERFACE_MODE_RGMII* passed to phylink/phylib tells the PHY how it
> should program its delay capabilities.
> 
> We're then down to dealing with the MAC and board induced delays. Many
> implementations use the rx-internal-delay-ps and tx-internal-delay-ps
> properties defined in the ethernet-controller.yaml DT binding to
> control the MAC delays.
> 
> However, there are a few which use PHY_INTERFACE_MODE_RGMII* on the MAC
> end, but in this case, they always pass PHY_INTERFACE_MODE_RGMII to
> phylib to stop the PHY adding any delays.
> 
> However, we don't have a way at present for DSA/phylink etc to handle a
> MAC that wants to ddd its delays with the PHY set to
> PHY_INTERFACE_MODE_RGMII.
> 
> Thanks.

Right, so using the {rx,tx}-internal-delay-ps allows me to configure the
MAC delays, or skip them entirely, in case the PCB adds them.

Thanks!

/Daniel



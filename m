Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A07AD5E149
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAiNQOA3qz+nLZgL9pEbduXgzmmCZjpJG+7FhOBNwL8=; b=IaLRGsD5NtBZ4aynZfBS2SCFJd
	zr+69U9g8ZxynJlNeYGvLxUfI7Wc1C9LTzMcl/1fGuYOQ+j5evUVfDx6f9dX56/wuntrvAFIaQiM8
	l1SIZ2lF5fMedT77l2glYFarYDCMIQDVN24BLJmprT5RFj7/teRnWkggiXxM3GPe4tCIDGmBphsvD
	BfpAc4jly3CVT+e/AUmiZwMRFzMQ8YybeFf7ou/vd5Avs5N57cG3ycwCN2wogcI/6CmwqHmQk+8nh
	Gqpeqnq8lFyvICvR650APRmEURTdK7VVPsXd5WT13zrmt9nauIWcGzItp18YJfBbxYCGeOC1ymT+5
	Q4UY7xXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kvv-00000009tbk-3XBi;
	Fri, 08 Nov 2024 09:05:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KkX-00000009qzB-1Gyq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731056029; x=1762592029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AcVXvw+r6ZLlMrJuixd3Dp/DLv/ioDFxkx3vejkhmOA=;
  b=p7khZaAbUXNkEkDafEoLTT5siW3HutUHtYqqloqY629VJ0OkCOaeAm0C
   x/Yr6EZPcdAIrr/TXE5dYEW07iRvGOMnDOWENcO8bWXZeCrROkETWDKuw
   w6VqQFYZKBe3mwv75ET8UK6y8UkrCg8pLZZ/8gTlCRqpqD1Spr8eh7iwC
   O6yVUG31QHujAcBCTWdr4wVw7Kuq/PBLQhvqgxp6Q7y2KeAjy529uclYq
   rWB5Gxt1c9CukFfpRccO5E6lftkuqNpSQknz5FjMZOS7gLzhl0CeCUUlT
   tFlvVyrSO5sh4BmW6qty5wziGLxyb6zQ+iDTlCJtDtER3GZtCH6U1E3wv
   Q==;
X-CSE-ConnectionGUID: /fgcW3NtTnSPHHSCigru4g==
X-CSE-MsgGUID: vj1XepvpRP2CPB/h/uuGDw==
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34564781"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Nov 2024 01:53:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Nov 2024 01:53:23 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Nov 2024 01:53:21 -0700
Date: Fri, 8 Nov 2024 08:53:20 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next 7/7] net: lan969x: add function for configuring
 RGMII port devices
Message-ID: <20241108085320.fqbell5bfx3roey4@DEN-DL-M70577>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
 <20241106-sparx5-lan969x-switch-driver-4-v1-7-f7f7316436bd@microchip.com>
 <6fee4db6-0085-4ce8-a6b5-050fddd0bc5a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6fee4db6-0085-4ce8-a6b5-050fddd0bc5a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_005349_433631_8D203B9D 
X-CRM114-Status: GOOD (  31.57  )
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

Hi Andrew,

> > The lan969x switch device includes two RGMII interfaces (port 28 and 29)
> > supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.
> >
> > Add new function: rgmii_config() to the match data ops, and use it to
> > configure RGMII port devices when doing a port config.  On Sparx5, the
> > RGMII configuration will always be skipped, as the is_port_rgmii() will
> > return false.
> >
> > Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> > Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> > ---
> >  drivers/net/ethernet/microchip/lan969x/lan969x.c   | 105 +++++++++++++++++++++
> >  .../net/ethernet/microchip/sparx5/sparx5_main.h    |   2 +
> >  .../net/ethernet/microchip/sparx5/sparx5_port.c    |   3 +
> >  3 files changed, 110 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > index cfd57eb42c04..0681913a05d4 100644
> > --- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > +++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > @@ -9,6 +9,17 @@
> >  #define LAN969X_SDLB_GRP_CNT 5
> >  #define LAN969X_HSCH_LEAK_GRP_CNT 4
> >
> > +#define LAN969X_RGMII_TX_CLK_DISABLE 0  /* Disable TX clock generation*/
> > +#define LAN969X_RGMII_TX_CLK_125MHZ 1   /* 1000Mbps */
> > +#define LAN969X_RGMII_TX_CLK_25MHZ  2   /* 100Mbps */
> > +#define LAN969X_RGMII_TX_CLK_2M5MHZ 3   /* 10Mbps */
> > +#define LAN969X_RGMII_PORT_START_IDX 28 /* Index of the first RGMII port */
> > +#define LAN969X_RGMII_PORT_RATE 2       /* 1000Mbps  */
> > +#define LAN969X_RGMII_SHIFT_90DEG 3     /* Phase shift 90deg. (2 ns @ 125MHz) */
> > +#define LAN969X_RGMII_IFG_TX 4          /* TX Inter Frame Gap value */
> > +#define LAN969X_RGMII_IFG_RX1 5         /* RX1 Inter Frame Gap value */
> > +#define LAN969X_RGMII_IFG_RX2 1         /* RX2 Inter Frame Gap value */
> > +
> >  static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
> >       { TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
> >       { TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
> > @@ -293,6 +304,99 @@ static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static int lan969x_port_config_rgmii(struct sparx5 *sparx5,
> > +                                  struct sparx5_port *port,
> > +                                  struct sparx5_port_config *conf)
> > +{
> > +     int tx_clk_freq, idx = port->portno - LAN969X_RGMII_PORT_START_IDX;
> > +     enum sparx5_port_max_tags max_tags = port->max_vlan_tags;
> > +     enum sparx5_vlan_port_type vlan_type = port->vlan_type;
> > +     bool dtag, dotag, tx_delay = false, rx_delay = false;
> > +     u32 etype;
> > +
> > +     tx_clk_freq = (conf->speed == SPEED_10  ? LAN969X_RGMII_TX_CLK_2M5MHZ :
> > +                    conf->speed == SPEED_100 ? LAN969X_RGMII_TX_CLK_25MHZ :
> > +                                               LAN969X_RGMII_TX_CLK_125MHZ);
> 
> https://www.spinics.net/lists/netdev/msg1040925.html
> 
> Once it is merged, i think this does what you want.
>

Nice! Thanks for letting me know.

> > +     if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
> > +         conf->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> > +             rx_delay = true;
> > +
> > +     if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
> > +         conf->phy_mode == PHY_INTERFACE_MODE_RGMII_RXID)
> > +             tx_delay = true;
> 
> O.K, now warning bells are ringing in this reviews head.
> 
> What i don't see is the value you pass to the PHY? You obviously need
> to mask out what the MAC is doing when talking to the PHY, otherwise
> both ends will add delays.
> 

What value should be passed to the PHY?

We (the MAC) add the delays based on the PHY modes - so does the PHY.

RGMII, we add both delays.
RGMII_ID, the PHY adds both delays.
RGMII_TXID, we add the rx delay, the PHY adds the tx delay.
RGMII_RXID, we add the tx delay, the PHY adds the rx delay.

Am I missing something here? :-)

> And in general in Linux, we have the PHY add the delays, not the
> MAC. It is somewhat arbitrary, but the vast majority of systems do
> that. The exception is systems where the PHY is too dumb/cheap to add
> the delays and so the MAC has to do it. I'm don't know of any
> Microchip PHYs which don't support RGMII delays.

Ack.

> 
>         Andrew

/Daniel


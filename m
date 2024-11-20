Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DF8D6392B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDG7NRxvRRjMeBBInMNAmj9qVxnI5eJCfIur9WpIakE=; b=XWpBoh2Wv+72NLafhPKCa3cZ1t
	FB8Q6N5gzv06/XuOaleYt0X4mFn2Shqi9IEIharvSHWr+3HRtI7OJTGCHhL9+6a5BM9N3pdme6aru
	maZQHylPZPG5BPhxUlNzJ14osy5K2mIYwSvKiO8rsSdpOXF4OLcirKZCwzXs2qMd8vo9sPhL0od2s
	j8cgf1HLVuWBLS2o4eOOL3UmH1qv4E53ae4lPIX0oS7zACCtqkKLBNk/GA+SCmqz1uDQrRUFudHJ6
	hXHbas5nhtraBnBs6IZBy6+Hd8CY2XnChude33poHwYLZOueOH36FVO1X5Gb5Z4scecj6Lh8R4yq6
	+9PtK+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiZB-0000000F9jW-0kkS;
	Wed, 20 Nov 2024 11:08:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiPY-0000000F7Si-0WFb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732100296; x=1763636296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7zHVbE3RTdvozr56Vt0hiaPEg1DTrOhKqhHM3zAKh1c=;
  b=Fc37Z/7JWLv2XClCZA2tY8RFlRgW/oaB+ZMT5ShMb/SirC9PDreccpj0
   LWFSZoX7bTeyhIQwtdjlcQ8/oCLLOanspixrc+HrHRlu+ujHRMO97GOGX
   6eXHlVNTAQeCHI2a0zSjMyahZgDR2GEd0vXY/5GaKBnKG3ps/jfB8YGC0
   o4XUdBAE6XxCGwZfXWK6aJBevWd7tN+yNztJpQiQTy7sW9riicSO4RoeO
   101csuhSfcueXbXlwjKjySSZpGCg/8aqyb+i4a4h/x/NTIGR4x94iBXe5
   dChffMO2YovRHpiEjBh0XyyGBjg6O7iFleo8scTO8WsDBi0JH02XT+i9A
   A==;
X-CSE-ConnectionGUID: lSn+5QYEQsKTrQdRtaFjuA==
X-CSE-MsgGUID: 72+GzUJ4Rx+eWsYYc4nfOw==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35058070"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 03:58:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 03:57:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Nov 2024 03:57:41 -0700
Date: Wed, 20 Nov 2024 10:57:41 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, <jacob.e.keller@intel.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v3 4/8] net: sparx5: use
 phy_interface_mode_is_rgmii()
Message-ID: <20241120105741.bivv5yvsetic55x4@DEN-DL-M70577>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
 <20241118-sparx5-lan969x-switch-driver-4-v3-4-3cefee5e7e3a@microchip.com>
 <ZzzwNci1cHqsfHm4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzzwNci1cHqsfHm4@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025816_235013_69A0E805 
X-CRM114-Status: GOOD (  14.42  )
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

> Hi,
> 
> On Mon, Nov 18, 2024 at 02:00:50PM +0100, Daniel Machon wrote:
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> > index f8562c1a894d..cb55e05e5611 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> > @@ -32,6 +32,9 @@ sparx5_phylink_mac_select_pcs(struct phylink_config *config,
> >  {
> >       struct sparx5_port *port = netdev_priv(to_net_dev(config->dev));
> >
> > +     if (phy_interface_mode_is_rgmii(interface))
> > +             return NULL;
> > +
> >       return &port->phylink_pcs;
> 
> Maybe turn this into positive logic - return the PCS only when the
> interface mode requires the PCS?

Sure. I can flip the logic and return the PCS for the interface modes that are
advertised as supported.

/Daniel 



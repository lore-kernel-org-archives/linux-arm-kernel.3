Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA02ED5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/HZff0dufS4l9tvBTXrxQwJX44CyH2SfQCeuwchqII=; b=i3c9oAj4Ndx/NZShNVmsC2vQBx
	QTJeK38vQC+SJXaeGL5Est5694Ccl2yOb2mewTAGfq/gwzM0gmATLYfUXX+AcGkXGnb5yi75zsWRY
	zHkzwxVfQSjH5M5fy/rwfMmv7S2zNmAibhdXdlzqrlX57gO9p7Dy/d/yD3Xr/iF2i9LczuWaOGLXy
	oDCfDoCI9NlTYSWvZeJIRU4mY+y0G2cIhv/h5HoAQ4GYWj+5tlO5VATPQJOJXqO7E33i2AfkE2cne
	gAxU+p8xrO37Gx2CxCbCNAOhUbOCZGooJJ16fQBSaj1KUXrZEYamvRqqFodRuMmYseNUB8BsZ2TuW
	5qcGK7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KyG-00000009uI6-3fWg;
	Fri, 08 Nov 2024 09:08:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kqm-00000009sRd-3JaQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 09:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731056416; x=1762592416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RV4BRrDPu9fzqimtYkCGhm8dxWaki2Xe2w2Vb0cDQM=;
  b=UNnxvySE+dSEzp8niNbW5zasK//WIdY/LnxTERRzVakH/T8hX8mn/C1h
   8WEOcthRml8ykI2tfdjiUlfbGKxGkXS3gAk+RPK145MOhW8MxezyGUa66
   OHIOhGuJZ4GR7hOM+x2LNyiU6mVYN3Ol07YeoRj11VNng5yZZ8gJxpawd
   1UY5zZU8piRXUJORAFBHNNtMUHRVu0pRbibEGmg2hcjdBZBozou4C/shG
   nFTaJgNxhv67ZkkMMuaamyB5YwlfwmaomuD2dgD1Myw4CyShVxyh33Tfz
   gS+X3apw53IT/59ew12rsVSoHV10c7tXVdBdCrfEABd5bDqvNWBxakNXt
   A==;
X-CSE-ConnectionGUID: HVTPMN6wSQqpa45vmMRqjw==
X-CSE-MsgGUID: +GH327iKRSSLSExU7iDt1w==
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34564944"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Nov 2024 02:00:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Nov 2024 01:59:59 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Nov 2024 01:59:56 -0700
Date: Fri, 8 Nov 2024 08:59:56 +0000
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
Subject: Re: [PATCH net-next 3/7] net: sparx5: use is_port_rgmii() throughout
Message-ID: <20241108085956.pr23rcnkhleoesnl@DEN-DL-M70577>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
 <20241106-sparx5-lan969x-switch-driver-4-v1-3-f7f7316436bd@microchip.com>
 <4748d3a9-55e8-48f9-b281-60ec619bf304@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4748d3a9-55e8-48f9-b281-60ec619bf304@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_010016_925269_0426F547 
X-CRM114-Status: GOOD (  11.22  )
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

> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> > @@ -1087,6 +1087,9 @@ int sparx5_port_init(struct sparx5 *sparx5,
> >                ANA_CL_FILTER_CTRL_FILTER_SMAC_MC_DIS,
> >                sparx5, ANA_CL_FILTER_CTRL(port->portno));
> >
> > +     if (ops->is_port_rgmii(port->portno))
> > +             return 0;
> > +
> >       /* Configure MAC vlan awareness */
> >       err = sparx5_port_max_tags_set(sparx5, port);
> >       if (err)
> 
> That looks odd. What has RGMII to do with MAC VLAN awareness?
> Maybe it just needs a comment?

The sparx5_port_init() function initializes the RGMII port device (and
the other types of devices too). After the common configuration is done,
we bail out, as we do not want to configure any 2g5, 5g, 10g or 25g
stuff.

I can add a comment, sure.

> 
>         Andrew

/Daniel


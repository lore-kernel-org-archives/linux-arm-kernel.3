Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8262ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWW1eSQpDKc7jM4m1QbAQ8yAiFI7MLFkR9wVlwBKfxU=; b=rAVcZlTdBBL9WL1Dp4zJJt/kY+
	LGqj9GtEznKrcWLvV/Z+AN6PoMZfouddI8KbgUJON1qng/FZQiVl/DVqXIam7hxEcdD/a8NTGkDoc
	Efbh6VBXzlQA4KRNbnIZlIw9aaUDe9TGO+0DVa8uHHgybF4tgC998SsxLLSrUGOxz2vwlHLdsXn2N
	RjEKVqU366ylIpWduANpEPQc5taquHxwSWBKAhcV2VVg019Kkj7Zg/ZvZgXasNkefaFMPSqsQ+vRW
	MrpmdEZqHHw5azxGbdN4xYhZ2QLvC/RLrSbVETAooD522ZPVB8pk0dbj0c6iGrE/QEZHM0x+IYh7p
	CjgPdsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILqE-00000004reD-26jP;
	Mon, 10 Nov 2025 06:57:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILqB-00000004rdN-2mXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 06:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762757847; x=1794293847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1SqMrYP18FymGyJURtzA5MuI3ISTgbkmBySUQpZDmRQ=;
  b=WvzsjMS0foWFgDlKKYEFZo6adj0h4w/QIva9NTtaxZkhlCGFj/GByL5I
   tYL7d5gY1XMfWISG0x3l+6sTQTSbIv3nMa4V8KcIthkOzxnCKSGRSYPzA
   PY8zMkIEluT3psCy85qwI8V86Q2Ui7+VH/h4wbJa8cUNMgrlf64SDwsKi
   cHFY68u4vBUukakDBslwOa4fu+iUpeap+CNWDdCF1jRyJIipMqvpJPXYE
   Jx3Di9MwlBheZJTEuwg2XnASLo2dK3d7dvwTI3Ac6mfxiLgXg2Ax8Jbda
   fg6xxsi1/vaGhEE+/LmAsJYzJZbLVDGQj0yQ8CC2R1Bti+var8D5ew/eC
   A==;
X-CSE-ConnectionGUID: BYri1NdbQKqXZYAxeGkImg==
X-CSE-MsgGUID: D3jqOOT7QGi+yvk96naJ9Q==
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="216235639"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:57:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Sun, 9 Nov 2025 23:57:04 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 9 Nov 2025 23:57:01 -0700
Date: Mon, 10 Nov 2025 06:57:01 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<luka.perkov@sartura.hr>
Subject: Re: [PATCH net-next] net: sparx5/lan969x: populate netdev of_node
Message-ID: <20251110065701.rch4wjflap3vicjq@DEN-DL-M70577>
References: <20251107141936.1085679-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107141936.1085679-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_225727_929766_9242945F 
X-CRM114-Status: GOOD (  17.08  )
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

Hi Robert,

> Populate of_node for the port netdevs, to make the individual ports
> of_nodes available in sysfs.

Sounds reasonable :-)

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> index 1d34af78166a..284596f1da04 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> @@ -300,7 +300,11 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
> 
>         for (portno = 0; portno < sparx5->data->consts->n_ports; portno++)
>                 if (sparx5->ports[portno]) {
> -                       err = register_netdev(sparx5->ports[portno]->ndev);
> +                       struct net_device *port_ndev = sparx5->ports[portno]->ndev;

This line exceeds 80 chars and can easily be wrapped.

> +
> +                       port_ndev->dev.of_node = sparx5->ports[portno]->of_node;
> +
> +                       err = register_netdev(port_ndev);
>                         if (err) {
>                                 dev_err(sparx5->dev,
>                                         "port: %02u: netdev registration failed\n",
> --
> 2.51.1
> 

It seems wrong to me to stuff this into sparx5_register_netdevs() - there are
two better candidates, either: sparx5_create_netdev (where other ndev variables
are assigned) or sparx5_create_port().

/Daniel


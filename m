Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6055C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UZs8HwsvNoqMdICuFwRiz2hP75+KY/MI8qd1TV0XZc=; b=zC5YGmkvIYu87ZreueZYRLkMEL
	0KI+zhGP9kzF77ciJiaLcn3Ag+rjSS7C5NuqTfrwRJRQbIhOlkPsUe2Tn6r5SNCSN8rrcNXtgd6hG
	4yt/9DSZDa6sSnQf5xdct4QXh7tUQJecA5QhRaHtZXihXlYtco4+A4qFgD7809CMSRtUiJXcTUpz9
	cKg67pX/T7u1Blr1K3ov4ZVMy5GLsiiqSE3L70a8183gv/C0peyJhx6w+U9J1X/WxIf9eKX9jec+S
	GBLDopbTfP6B7zKVdUyH8+9JBYqFqJI8UYTk9zIK7p3OGhtYAd4vLaBWG37Ps+GoYAXf/2WScFWzV
	Dj2KLKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Uy-00000000CWN-1pj1;
	Mon, 28 Sep 2026 09:18:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Uv-00000000CVr-1gKz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790587089; x=1822123089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b44XUbiRQYUmDL/k+pA2FEOKYweiIA5RdOF7K3sTzhI=;
  b=rQ3IVriLBkh4/8ijO15ZuRAkr2HGYnozk6hqi12R5n7os8r1f7MxOUiO
   26U5EMgVq3KAbpX1MU40kKsYsejDdhTnqAZS8JJLvkA02z7SjCEyUJ/oY
   ZhioVnkIOqC3IZJHZK7dxAsL1vMH05FALsI23Dz2Y+wiwUIYjmyyvuAXO
   6dcoC7uxxfv4M2HBDB5e+d9UsSMkMtOaYMH6AlDl0qUO5GD17T4oMR0y1
   FTlH3hzNOtQNENt+LPHvycz0L4KO5lW1okMLrY9Lk37TIWgX0xNqqwwGz
   uohYXgmgEhEdXUIcXd6rB+Sjpx5bEIOXoVrNIwAu2I0DQ1pP3veb9oA3/
   g==;
X-CSE-ConnectionGUID: q5Ut9g5gQUS/I7W0oGo0YQ==
X-CSE-MsgGUID: oaii23oQRuKf6L+crpEU7A==
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="231360037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 02:18:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 02:18:07 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 28 Sep 2026 02:18:05 -0700
Date: Mon, 28 Sep 2026 11:18:04 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <UNGLinuxDriver@microchip.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>
Subject: Re: [PATCH net-next] net: lan969x: correct RGMII port mapping index
Message-ID: <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577>
References: <20260922125112.2111256-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922125112.2111256-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_021809_694821_D4791C20 
X-CRM114-Status: GOOD (  21.33  )
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

> Currently, the lan969x_port_dev_mapping does not check for RGMII ports
> and just returns the physical port index.
> 
> However, this does not work for RGMII ports as they have dedicated DEVRGMII
> register space with an dedicated instance per RGMII port.
> 
> So, check if requested port index is an RGMII port and return the correct
> DEVRGMII index.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> index f3a9c71bea36a..bf5320c7a6ca8 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> @@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct sparx5 *sparx5, int port)
> 
>  static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
>  {
> +       if (lan969x_port_is_rgmii(port)) {
> +               switch (port) {
> +               case 28:
> +                       return 0;
> +               case 29:
> +                       return 1;
> +               }
> +       }
> +
>         if (lan969x_port_is_5g(port)) {
>                 switch (port) {
>                 case 9:
> --
> 2.55.0
> 

The mapping itself is right, but as far as I can see nothing upstream
uses the returned index to access DEVRGMII. Every caller of
sparx5_port_dev_index() pairs it with sparx5_to_high_dev() or
sparx5_to_pcs_dev(), which never return TARGET_DEVRGMII. Those paths
are also never taken for RGMII ports. The code that does access
DEVRGMII, in lan969x_rgmii.c, computes its own index with
RGMII_PORT_IDX(). Sashiko, correctly points this out.

So I don't think anything is broken today. Did you see a problem on
hardware that this fixes?

FYI, we carry the same change downstream. But there it was added together with
RGMII MTU support, which reads and writes DEVRGMII_MAC_MAXLEN_CFG() using this
index.

/Daniel


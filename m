Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67627E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXfWEZ3ge/59+Typn8diei7OCTNELx2QH5McCQU1+QI=; b=rkiDS2LCWvMxaK2SVSTQ2svMAL
	rn2lS3/DpXRKiX5HFMDDb/vPLu5MgmpFHPtHQllXS0M9LxWh3N/UFvhTG+dAqk3KBB9NDLA0Kpqm3
	R0CgIJKOPPgku3ge4U5NJI4G6+0jGAxngMv1BLhHXMEG7300xcDX/tZbbXJfQ4kCLx3ZjAxX6qCRe
	Xx5BQqeRk22X44EmmonvZItYMNWyxgKBPldC9+X/1dmj85oA6RVYxcKh8tQJNKGK18qWFE5VnZMxn
	z2xRMJZRNPHQazDrt/+iGnP2yrKSqp+L5lKHwFNH674gwaWHhz0Ez2LybsjpFax5Pasgc0jB1309K
	qK5+xLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV3j-00000001A7t-21n5;
	Fri, 06 Dec 2024 09:55:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUvY-000000018aR-0xTK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733478432; x=1765014432;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NyqUxD4+oNCtW8qXiH/xVm64iV6vut41ehuQt6eTnzQ=;
  b=Uc3dmYYEO5FL1h9HheBq0vRvJSsdgg6dDOgUacB8INdcGubTFUs2cEsv
   OsFW/pxaEOqpYXc2+6IIAwUjJhFZyVw9+biHW1f97x/8LndMU5GQiK8rA
   ++/8/Bk9E2QY1wRggFWAXNVHjlY2/4Xd1kWOi/iUvTNQUXHCnQihlw1Zx
   IQEtOAXR2L6vblzgMZAAFn7owyFLbfHt7qgT1TGMdMIlMGzXrfCdl8K5a
   95AoBfIQbGPjPtr5bm/RCM3eWYqY+ykxglka3aqo4qtIIYoqw2cD22JRH
   KCCZNqVEntd0d9VhQ4dhwzWbmSAvHHms2eSkPStHLNyld9OLNoNf1u5Cj
   w==;
X-CSE-ConnectionGUID: pTa19jmpRCeKQo/pb8i0zg==
X-CSE-MsgGUID: twfRaRnqSvecierGvL/pdQ==
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="202666736"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 02:47:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 02:47:04 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 6 Dec 2024 02:46:57 -0700
Message-ID: <43ec4b5e-9ccb-412f-a2c7-cac5f8bc2bbd@microchip.com>
Date: Fri, 6 Dec 2024 10:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 10/15] net: macb: Use helper rgmii_clock
Content-Language: en-US, fr-FR
To: <jan.petrous@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Iyappan Subramanian
	<iyappan@os.amperecomputing.com>, Keyur Chudgar
	<keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<imx@lists.linux.dev>, <devicetree@vger.kernel.org>, NXP S32 Linux Team
	<s32@nxp.com>, <0x1207@gmail.com>, <fancer.lancer@gmail.com>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014712_475527_0F20F5DC 
X-CRM114-Status: GOOD (  13.36  )
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

On 05/12/2024 at 17:43, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

If needed:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index daa416fb1724..640f500f989d 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
>          if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
>                  return;
> 
> -       switch (speed) {
> -       case SPEED_10:
> -               rate = 2500000;
> -               break;
> -       case SPEED_100:
> -               rate = 25000000;
> -               break;
> -       case SPEED_1000:
> -               rate = 125000000;
> -               break;
> -       default:
> +       rate = rgmii_clock(speed);
> +       if (rate < 0)
>                  return;
> -       }
> 
>          rate_rounded = clk_round_rate(bp->tx_clk, rate);
>          if (rate_rounded < 0)
> 
> --
> 2.47.0
> 
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7DC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCnEd7tGfLsvqQ9t4dLxlXhkU3vDq79dR6i/bF6oDRI=; b=d/JzoRTqVMHZnm2Z6T0ipJb8GQ
	dagRaaRMxWlOGIXb5V1dtXHUrGKMfbul1BKE4KeAoeNbL6fv9+iOSAFeFmnLZCo1vYmew7GOpAI0m
	0KiPhkHvOf7LHvATFS5mHquUjN29S8tk5WZqaPjHY9LE+0hhGD8fa82NXcRaHBqmW5oS9vX4VdLp6
	eoG1flTfiDltLsxl5Vys9BEGV9M2XryW4bjsMXZyYDVLq2MKStV5HW4H+X26nvWiZuEobkN1W53VL
	m9WCCz5FcCvi8Ehp0oSe/spP6Xragq1x25OSNpP+cqXZ2KE4bwFS15+fOerlzmCr2oKMZV3Z765kG
	lBTHRgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7eu-0000000AYet-1zhx;
	Sun, 09 Aug 2026 17:50:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7er-0000000AYdA-1lXo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 17:50:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so16247855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 10:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786297799; x=1786902599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCnEd7tGfLsvqQ9t4dLxlXhkU3vDq79dR6i/bF6oDRI=;
        b=T6qmTaYairvXL302MPAXLZ6tU/ijqjPt5odhMQXYq8BOe2JzfHpoyNK2OX913I3rnC
         +C91v43HIJRQxgZCJ3kwvKKJ8cs7EPTygBYhe9C7J3rpy+rLhKXmUy4iMBb/TKIpFplJ
         TaBfwNSDf0KLDlcZ/EmM3YSemRGYWphGTLXko0ew9VcLOAa7QTqrJHM4HcpxN11TJbA+
         vbWEGh1f9tYbK9P6FgWW+bBk8Uc5vCUBPMk+A0UmCx2THYsZstOtPMdQhCnqjJZg6Pgy
         pcsMec+Zr/TRXbdYG8GIaet9DtBjLf2ETiydMDScYylXcFqpXHvhg/1nXlM0KqCo6m7K
         UwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786297799; x=1786902599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCnEd7tGfLsvqQ9t4dLxlXhkU3vDq79dR6i/bF6oDRI=;
        b=nGXsl+OS1woQjRT2W+AzC1ZQPr8IismH33NecS29xFAU2S0POIMVgLiqzZ6KN2fykn
         Gm0wQiaujjGwsicMTikMWZch2ATRwQOSARQPbQacCDhqApwd6DsuK76ouSck3935i38n
         Y974mF/NUPuf3rNugPfZVRt7ODxRajIxRR/x0WnXHIN1++lYDR1dwdY9MhkDUCJeLD9l
         J5xz3H4r+OyM+v5h36ZgCN6KMXDKb3X+0BbbN2aanr1z+d9lDNF4+XAhDZIkYbFR+XFp
         fwrIvHPbFB2MZcvLawGElunGn/JQkVo796+PuerWYB/qnWuauPJfCRoUuIW+wrBblBbT
         ZB+A==
X-Forwarded-Encrypted: i=1; AHgh+RqbdzbJ6Lvav8nFfWQuWNAGU+4Oeo5P1/UQpT5wsEfxEtTLlWRz9vJGbHH+zzhM2LSc6rahOhZfXbi9GMppTeTU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10oa0NM/kk/pPjiNQefETJT60aKB2rGanFQOtQMg9IHjZS6/5
	t8YcppyNRnbOLbTgjEy4yrCDwMbpkkdYrM2R8s5Ln/+bmrU6qqypeKLI
X-Gm-Gg: AR+sD13h3EG//cJ+XB/N2gVrlHjgSv9zt+71iHgQNfP5x6juy+FVpUndO79ua1D36QX
	qkMjWDE731/2+WrySL+4PSg1QRSMJvqyoPYxNkryR0BV7rTAUlOMmDOAb92PqMtpegqxh5XXWE7
	64TyPNdD0wEhuCZdQVZcwWCUSkiBgcBnP7rj/ChEzohxNaa22KT8PJyOsvunaaQvhYQLsN5df8s
	5MFInd/rA8wE4i1sbp/KZGj6RL+so5V3kREexYE5d+3/FWrnvjclxDQO0WDpjEJ++caVGnwGF5w
	joxmXbPtW8qTUufsR4JJXreKc4bc3Kag/9hX8lEUELFyH/quXzXfw7l3NxLG1rPsC5R4Wy9KidG
	GFrff3e/1hcEOoAES4UFFIg40lKqpnSGyGfg6vlS0ERebSzd//4/nF/yCHcsdQSsrt4KsCNexOm
	68Yrz3s3Q6XyzkRNKIc6OG+12bnm7ajF64uQn6fy3X1uu/GceGLJtyZc8eBZ8n3XkvjCBnJngMs
	ht+baMaiCjR6k9C328Tgmfcx84nfjsXWdbyfsKFwps=
X-Received: by 2002:a05:600c:630c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4994e71c87bmr402295485e9.7.1786297799337;
        Sun, 09 Aug 2026 10:49:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421934asm340945865e9.5.2026.08.09.10.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:49:58 -0700 (PDT)
Message-ID: <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
X-Google-Original-Message-ID: <ani9wg-GiHuUV9ab@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 19:49:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_105001_521078_2E928F8E 
X-CRM114-Status: GOOD (  36.33  )
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

On Sun, Aug 09, 2026 at 07:44:55PM +0200, Andrew Lunn wrote:
> On Fri, Aug 07, 2026 at 03:12:42PM +0200, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> 
> One of Russells complaints was the phylink has too many bits of code
> for ideas which did not work out and were replaced by new ways of
> doing things.
> 
> We want .mac_select_pcs to go away, this framework should replace it.
> Please could you convert one of the exist users of .mac_select_pcs, so
> we get an idea of what that involved. If that conversion is pretty
> mechanical, i think we should have a second patchset which converts
> all the current users, and then remove support for .mac_select_pcs.
> 
> Overall i think the direction of this patchset is good.
>

Thanks for the initial check.

Maxime converted one device with this and the patch delta was small... let
me copy those patch here. (it was referenced in v9)

I think the most annoying one will be stmmac with the 3 different PCS
implementation but we already handled that in a upcoming ipq50xx driver
currently present in OpenWrt mainline.

Maybe if Maxime is O.K. I can include his patch in this series.

From 38ad94b1e62bf3523097983dfb515f59b1634477 Mon Sep 17 00:00:00 2001
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 21 Jul 2026 13:52:57 +0200
Subject: [PATCH] net: marvell: mvpp2: Convert to the new PCS API

Following the introduction of the PCS framework, port mvpp2 to the new
PCS API.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 161 +++++++++++-------
 1 file changed, 95 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index ccc24a1301f2..8d9663c7a023 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6499,21 +6499,6 @@ static void mvpp2_gmac_config(struct mvpp2_port *port, unsigned int mode,
                writel(ctrl4, port->base + MVPP22_GMAC_CTRL_4_REG);
 }

-static struct phylink_pcs *mvpp2_select_pcs(struct phylink_config *config,
-                                           phy_interface_t interface)
-{
-       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
-
-       /* Select the appropriate PCS operations depending on the
-        * configured interface mode. We will only switch to a mode
-        * that the validate() checks have already passed.
-        */
-       if (mvpp2_is_xlg(interface))
-               return &port->pcs_xlg;
-       else
-               return &port->pcs_gmac;
-}
-
 static int mvpp2_mac_prepare(struct phylink_config *config, unsigned int mode,
                             phy_interface_t interface)
 {
@@ -6786,7 +6771,6 @@ static int mvpp2_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 }

 static const struct phylink_mac_ops mvpp2_phylink_ops = {
-       .mac_select_pcs = mvpp2_select_pcs,
        .mac_prepare = mvpp2_mac_prepare,
        .mac_config = mvpp2_mac_config,
        .mac_finish = mvpp2_mac_finish,
@@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
        };
        struct phylink_pcs *pcs;

-       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
+       if (mvpp2_is_xlg(port->phy_interface))
+               pcs = &port->pcs_xlg;
+       else
+               pcs = &port->pcs_gmac;

        mvpp2_mac_prepare(&port->phylink_config, MLO_AN_INBAND,
                          port->phy_interface);
@@ -6823,6 +6810,78 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
                          SPEED_UNKNOWN, DUPLEX_UNKNOWN, false, false);
 }

+static int mvpp2_port_fill_pcs(struct phylink_config *config,
+                              struct phylink_pcs **available_pcs,
+                              unsigned int num_possible_pcs)
+{
+       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
+
+       available_pcs[0] = &port->pcs_gmac;
+
+       if (mvpp2_port_supports_xlg(port)) {
+               if (num_possible_pcs < 2)
+                       return -EINVAL;
+
+               available_pcs[1] = &port->pcs_xlg;
+       }
+
+       return 0;
+}
+
+static void mvpp2_port_init_pcs_xlg(struct phylink_pcs *pcs, bool has_comphy,
+                                   phy_interface_t phy_mode)
+{
+       if (has_comphy) {
+               __set_bit(PHY_INTERFACE_MODE_5GBASER,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_10GBASER,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_XAUI,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_5GBASER) {
+               __set_bit(PHY_INTERFACE_MODE_5GBASER,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_10GBASER) {
+               __set_bit(PHY_INTERFACE_MODE_10GBASER,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_XAUI) {
+               __set_bit(PHY_INTERFACE_MODE_XAUI,
+                         pcs->supported_interfaces);
+       }
+}
+
+static void mvpp2_port_init_pcs_gmac(struct phylink_pcs *pcs, bool has_comphy,
+                                    phy_interface_t phy_mode)
+{
+       if (has_comphy) {
+               /* If a COMPHY is present, we can support any of the
+                * serdes modes and switch between them.
+                */
+               __set_bit(PHY_INTERFACE_MODE_SGMII,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_1000BASEX,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_2500BASEX,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+               /* No COMPHY, with only 2500BASE-X mode supported */
+               __set_bit(PHY_INTERFACE_MODE_2500BASEX,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_1000BASEX ||
+                  phy_mode == PHY_INTERFACE_MODE_SGMII) {
+               /* No COMPHY, we can switch between 1000BASE-X and SGMII
+                */
+               __set_bit(PHY_INTERFACE_MODE_1000BASEX,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_SGMII,
+                         pcs->supported_interfaces);
+       }
+
+       /* RGMII and MII are still routed through the gmac PCS */
+       phy_interface_set_rgmii(pcs->supported_interfaces);
+       __set_bit(PHY_INTERFACE_MODE_MII, pcs->supported_interfaces);
+}
+
 /* In order to ensure backward compatibility for ACPI, check if the port
  * firmware node comprises the necessary description allowing to use phylink.
  */
@@ -7082,28 +7141,17 @@ static int mvpp2_port_probe(struct platform_device *pdev,
                        port->phylink_config.mac_capabilities |=
                                MAC_SYM_PAUSE | MAC_ASYM_PAUSE;

-               if (mvpp2_port_supports_xlg(port)) {
-                       /* If a COMPHY is present, we can support any of
-                        * the serdes modes and switch between them.
-                        */
-                       if (comphy) {
-                               __set_bit(PHY_INTERFACE_MODE_5GBASER,
-                                         port->phylink_config.supported_interfaces);
-                               __set_bit(PHY_INTERFACE_MODE_10GBASER,
-                                         port->phylink_config.supported_interfaces);
-                               __set_bit(PHY_INTERFACE_MODE_XAUI,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_5GBASER) {
-                               __set_bit(PHY_INTERFACE_MODE_5GBASER,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_10GBASER) {
-                               __set_bit(PHY_INTERFACE_MODE_10GBASER,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_XAUI) {
-                               __set_bit(PHY_INTERFACE_MODE_XAUI,
-                                         port->phylink_config.supported_interfaces);
-                       }
+               if (!mvpp2_port_supports_xlg(port))
+                       port->phylink_config.num_possible_pcs = 1;
+               else
+                       port->phylink_config.num_possible_pcs = 2;
+
+               port->phylink_config.fill_available_pcs = mvpp2_port_fill_pcs;

+               mvpp2_port_init_pcs_xlg(&port->pcs_xlg, comphy, phy_mode);
+               mvpp2_port_init_pcs_gmac(&port->pcs_gmac, comphy, phy_mode);
+
+               if (mvpp2_port_supports_xlg(port)) {
                        if (comphy)
                                port->phylink_config.mac_capabilities |=
                                        MAC_10000FD | MAC_5000FD;
@@ -7115,35 +7163,16 @@ static int mvpp2_port_probe(struct platform_device *pdev,
                                        MAC_10000FD;
                }

-               if (mvpp2_port_supports_rgmii(port)) {
-                       phy_interface_set_rgmii(port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_MII,
-                                 port->phylink_config.supported_interfaces);
-               }
+               phy_interface_copy(port->phylink_config.pcs_interfaces,
+                                  port->pcs_gmac.supported_interfaces);

-               if (comphy) {
-                       /* If a COMPHY is present, we can support any of the
-                        * serdes modes and switch between them.
-                        */
-                       __set_bit(PHY_INTERFACE_MODE_SGMII,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_1000BASEX,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_2500BASEX,
-                                 port->phylink_config.supported_interfaces);
-               } else if (phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
-                       /* No COMPHY, with only 2500BASE-X mode supported */
-                       __set_bit(PHY_INTERFACE_MODE_2500BASEX,
-                                 port->phylink_config.supported_interfaces);
-               } else if (phy_mode == PHY_INTERFACE_MODE_1000BASEX ||
-                          phy_mode == PHY_INTERFACE_MODE_SGMII) {
-                       /* No COMPHY, we can switch between 1000BASE-X and SGMII
-                        */
-                       __set_bit(PHY_INTERFACE_MODE_1000BASEX,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_SGMII,
-                                 port->phylink_config.supported_interfaces);
-               }
+               if (mvpp2_port_supports_xlg(port))
+                       phy_interface_or(port->phylink_config.pcs_interfaces,
+                                        port->phylink_config.pcs_interfaces,
+                                        port->pcs_xlg.supported_interfaces);
+
+               phy_interface_copy(port->phylink_config.supported_interfaces,
+                                  port->phylink_config.pcs_interfaces);

                phylink = phylink_create(&port->phylink_config, port_fwnode,
                                         phy_mode, &mvpp2_phylink_ops);
--
2.55.0



-- 
	Ansuel


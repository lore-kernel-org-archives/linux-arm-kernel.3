Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1359CFA462
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLqK+GhGI2GvTP8XVLItGDUPB6k79bfh6wVAO1Pmz6M=; b=YLUVr0/SHbtn/Ri7MVkX6H389T
	qGAfk04YWt++cblQC86fTM1zBaBBSIhlbRByiZBLzd+sHWpELIG27GAikFvr74P8VwFr10ne3Fv3H
	ClBePPM8pAEgDhSr9+hxa7MdEY8zSTjUDfpUsCyoMclauYjMKTKXFcC+gZr70FkfoeGLHKYV/flk7
	JUHsd/DZZsYEuD1GVd/znI1nmTYO98nY/64Zq8MTWWOzq+X8IKSiDRiIAX/h6mmpYAXqsNqwAICHQ
	ucc8gXCovHvadCNFApp+O4I5ufkngkioN55xAIuFH2neGHQ4Y3t0M00ISPJip0IU6s48A/5jfuzQE
	POvP7Qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfj-0000000FlrS-1XXS;
	Wed, 23 Oct 2024 20:09:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gAT-0000000FYSD-3FOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729708394; x=1761244394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jTmoWEA/AvudZiXAP5wmbx3SBQUJFGbhGS0+jYMgA9s=;
  b=V/pFmo5/JFBfyIevIQOGiFQez91GeuOMJAoc45ibnkCWoHnOSf+fxru1
   4jbD25piPruYI4VKHbYvxAjM/Ka3x+kM40aBC6Hsh70jWzQkag/HeDLwi
   C5TtHIxrs5OrqSzEPCq7Sj5lgmIJn+KRWMTtNBFEpeg8+pGzUn5Rykgu6
   a+cCfbe/BixeeNKnGJp0gm3rwXccvseabjd28mlHXro97/XasJi5mkPxI
   CFDLkrdEDfmRXrkc7HfX4M4LmIYj8Kh90PQkCmWIGAXl/s4HasV9Vlbmg
   /KrliVE+QkSDeb9dmZyTtZS5y6CyHiSJWofzZCoAnphShbWy6QeeJoLXX
   w==;
X-CSE-ConnectionGUID: JDex8fWsSkymE6te52D0xA==
X-CSE-MsgGUID: BgJUY6LtTXG7CdeXOxbaSQ==
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="33404578"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 11:33:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 11:33:06 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 23 Oct 2024 11:33:02 -0700
Date: Wed, 23 Oct 2024 18:33:01 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <andrew@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next 14/15] net: sparx5: add compatible strings for
 lan969x and verify the target
Message-ID: <20241023183301.5st3aa23ad6nl5xz@DEN-DL-M70577>
References: <20241021-sparx5-lan969x-switch-driver-2-v1-0-c8c49ef21e0f@microchip.com>
 <20241021-sparx5-lan969x-switch-driver-2-v1-14-c8c49ef21e0f@microchip.com>
 <cetor3ohhg6rzf3w2cm6hqxsqukh52nm54mp7tizb2qc3x44j4@n53v6btq6t6r>
 <20241023110034.jpwoblwrds3ln5nr@DEN-DL-M70577>
 <24b18f9e-6fbd-48cc-96bd-e634d0af9824@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <24b18f9e-6fbd-48cc-96bd-e634d0af9824@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_113314_177586_433434D2 
X-CRM114-Status: GOOD (  45.93  )
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

> > Hi Krzysztof,
> >
> >>> Add compatible strings for the twelve lan969x SKU's (Stock Keeping Unit)
> >>> that we support, and verify that the devicetree target is supported by
> >>> the chip target.
> >>>
> >>> Each SKU supports different bandwidths and features (see [1] for
> >>> details). We want to be able to run a SKU with a lower bandwidth and/or
> >>> feature set, than what is supported by the actual chip. In order to
> >>> accomplish this we:
> >>>
> >>>     - add new field sparx5->target_dt that reflects the target from the
> >>>       devicetree (compatible string).
> >>>
> >>>     - compare the devicetree target with the actual chip target. If the
> >>>       bandwidth and features provided by the devicetree target is
> >>>       supported by the chip, we approve - otherwise reject.
> >>>
> >>>     - set the core clock and features based on the devicetree target
> >>>
> >>> [1] https://www.microchip.com/en-us/product/lan9698
> >>>
> >>> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> >>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> >>> ---
> >>>  drivers/net/ethernet/microchip/sparx5/Makefile     |   1 +
> >>>  .../net/ethernet/microchip/sparx5/sparx5_main.c    | 194 ++++++++++++++++++++-
> >>>  .../net/ethernet/microchip/sparx5/sparx5_main.h    |   1 +
> >>>  3 files changed, 193 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/microchip/sparx5/Makefile b/drivers/net/ethernet/microchip/sparx5/Makefile
> >>> index 3435ca86dd70..8fe302415563 100644
> >>> --- a/drivers/net/ethernet/microchip/sparx5/Makefile
> >>> +++ b/drivers/net/ethernet/microchip/sparx5/Makefile
> >>> @@ -19,3 +19,4 @@ sparx5-switch-$(CONFIG_DEBUG_FS) += sparx5_vcap_debugfs.o
> >>>  # Provide include files
> >>>  ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/vcap
> >>>  ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/fdma
> >>> +ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/lan969x
> >>> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> >>> index 5c986c373b3e..edbe639d98c5 100644
> >>> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> >>> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> >>> @@ -24,6 +24,8 @@
> >>>  #include <linux/types.h>
> >>>  #include <linux/reset.h>
> >>>
> >>> +#include "lan969x.h" /* lan969x_desc */
> >>> +
> >>>  #include "sparx5_main_regs.h"
> >>>  #include "sparx5_main.h"
> >>>  #include "sparx5_port.h"
> >>> @@ -227,6 +229,168 @@ bool is_sparx5(struct sparx5 *sparx5)
> >>>       }
> >>>  }
> >>>
> >>> +/* Set the devicetree target based on the compatible string */
> >>> +static int sparx5_set_target_dt(struct sparx5 *sparx5)
> >>> +{
> >>> +     struct device_node *node = sparx5->pdev->dev.of_node;
> >>> +
> >>> +     if (is_sparx5(sparx5))
> >>> +             /* For Sparx5 the devicetree target is always the chip target */
> >>> +             sparx5->target_dt = sparx5->target_ct;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9691-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9691VAO;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9692-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9692VAO;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9693-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9693VAO;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9694-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9694;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9695-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9694TSN;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9696-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9696;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9697-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9696TSN;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9698-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9698;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan9699-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9698TSN;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan969a-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9694RED;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan969b-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9696RED;
> >>> +     else if (of_device_is_compatible(node, "microchip,lan969c-switch"))
> >>> +             sparx5->target_dt = SPX5_TARGET_CT_LAN9698RED;
> >>> +     else
> >>> +             return -EINVAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/* Compare the devicetree target with the chip target.
> >>> + * Make sure the chip target supports the features and bandwidth requested
> >>> + * from the devicetree target.
> >>> + */
> >>> +static int sparx5_verify_target(struct sparx5 *sparx5)
> >>> +{
> >>> +     switch (sparx5->target_dt) {
> >>> +     case SPX5_TARGET_CT_7546:
> >>> +     case SPX5_TARGET_CT_7549:
> >>> +     case SPX5_TARGET_CT_7552:
> >>> +     case SPX5_TARGET_CT_7556:
> >>> +     case SPX5_TARGET_CT_7558:
> >>> +     case SPX5_TARGET_CT_7546TSN:
> >>> +     case SPX5_TARGET_CT_7549TSN:
> >>> +     case SPX5_TARGET_CT_7552TSN:
> >>> +     case SPX5_TARGET_CT_7556TSN:
> >>> +     case SPX5_TARGET_CT_7558TSN:
> >>> +             return 0;
> >>
> >> All this is weird. Why would you verify? You were matched, it cannot be
> >> mis-matching.
> >
> > We are verifying that the match (target/compatible string) from the
> > device tree is supported by the chip. Maybe I wasn't too clear about the
> > intend in v1.
> >
> > Each target supports different bandwidths and features. If you have a
> > lan9698 chip, it must, obviously, be possible to run it as a lan9698
> > target. However, some targets can be run on chip targets other than
> > themselves, given that the chip supports the bandwidth and features of
> > the provided target. In contrary, trying to run as a target with a
> > feature not supported by the chip, or a bandwidth higher than what the
> > chip supports, should be rejected.
> 
> But you are not supposed to compare DT with what you auto-detected.
> Detect your hardware, test if it is supported and then bail out.
> 
> None of above explains the code.
> 
> >
> > Without this logic, the chip id is read and a target is determined. That
> > means on a lan9698 chip you will always match the lan9698 target.
> 
> That's not the job of kernel.
> 
> >
> > With the new logic, it is possible to run as a different target than
> > what is read from the chip id, given that the target you are trying to
> > run as, is supported by the chip.
> 
> So just run on different target.
> 
> >
> >>
> >>> +     case SPX5_TARGET_CT_LAN9698RED:
> >>> +             if (sparx5->target_ct == SPX5_TARGET_CT_LAN9698RED)
> >>
> >> What is "ct"? sorry, all this code is a big no.
> >
> > In this case we were matched as a SPX5_TARGET_CT_LAN9698RED target. We
> > are verifying that the chip target (target_ct, which is read from the
> > chip) supports the target we were matched as.
> >
> >> Krzysztof
> >>
> >
> > This is a feature that we would like, as it gives the flexibility of
> > running different targets on the same chip. Now if this is something
> > that cannot be accepted, I will have to ditch this part.
> 
> I have no clue what the "target" is but so far it looks like you try to
> validate DT against detected device. That's not how it should work.

I will get rid of the verification in v2.

Thanks.

/Daniel

> 
> Best regards,
> Krzysztof
> 


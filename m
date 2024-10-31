Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C480E68965
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ylu46RF2ggGRCRkOOBK6DQu3d07pTADM5iP72a1Tsg=; b=NgARVgGzftLYDOnR3X+FHnckco
	897KAi61Uh8DJC7gHc16ZVwTobpO8uW7ce4r5OKoSp0lLkzSmjK3Wue8w7x4uR9iYsCbTYYiuWWu2
	zRGM8B76MvBJi8I2/FF3v3SoKukX9fhoz+8Lxxh1aRp+cqU4gx/Zm0sQARJl9VXq0kXc07khmlLRc
	9mpBctn+suPtlhe135y6t1fjqoMahU9K+ADkucwJbF/XY2SW0KtcPbDzcQlBtrMw7om+veHuAwinI
	N5YKSIiGECmf5svgyuF3tWxL3UbaLxT6q98YlG6WSbCp+Ps+rajKwUUXMUVGNugV6D7yekfNnAa/A
	UcqzOsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RdK-000000036vf-1iXs;
	Thu, 31 Oct 2024 09:38:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Rbf-000000036dC-3ztQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730367404; x=1761903404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jk/UL+5rTj1PV/YoegypnMhOCixtc3MMVbc/scCFjOE=;
  b=0DLijNuzIFb9PXAIXtQWOJK5sP98VFMh0v24Xkl2TiGUceu7H45/ewUc
   ipIM77Mit/P1BGQeLddnMafJSSB5qHmswXDlROoNggkSO6M7b46uZNeb0
   fpjagY0RCLg+0D2t0+k4KhW6YCVPl56GGGmB1dcOCl7Tx4s0S0RWo181d
   LGXdoD9R/ZurPnSWE3tRbpLAtjSLhcpWYAzSEVhpO8PpH0MWU326Iaqlz
   fs6unAKFApjWT/x0sPLALJHciXRsfub4c7iKD1sO5A/EJNeDlcYaZiHwG
   +eeAeAvYb0Xj8v6yqogG+80N6Shzxn+v043gk6fmkfLvNB4sI7IOJSgit
   g==;
X-CSE-ConnectionGUID: U7/DaQSZR9qiaEJq3md8kg==
X-CSE-MsgGUID: BBxWSfWVS0+qtiQRUILoGg==
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34234608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2024 02:36:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 31 Oct 2024 02:36:33 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 31 Oct 2024 02:36:29 -0700
Date: Thu, 31 Oct 2024 09:36:28 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v2 10/15] net: lan969x: add PTP handler function
Message-ID: <20241031093628.faiupqqny7oco7uz@DEN-DL-M70577>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
 <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
 <20241030180742.2143cb59@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241030180742.2143cb59@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023644_102610_ED7B63E1 
X-CRM114-Status: GOOD (  12.87  )
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

> On Thu, 24 Oct 2024 00:01:29 +0200 Daniel Machon wrote:
> > +             spin_lock_irqsave(&port->tx_skbs.lock, flags);
> > +             skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
> > +                     if (SPARX5_SKB_CB(skb)->ts_id != id)
> > +                             continue;
> > +
> > +                     __skb_unlink(skb, &port->tx_skbs);
> > +                     skb_match = skb;
> > +                     break;
> > +             }
> > +             spin_unlock_irqrestore(&port->tx_skbs.lock, flags);
> 
> For a followup for both drivers -- you're mixing irqsave and bare
> spin_lock() here. The _irqsave/_irqrestore is not necessary, let's
> drop it.
> 
> > +             spin_lock(&sparx5->ptp_ts_id_lock);

Hi Jakub,

I agree it seems wrong to mix these.

I just talked to Horatiu, and he mentioned posting a similar fix for the
lan966x driver some time ago [1]. Only this fix added
_irqsave/_irqrestore to the ptp_ts_id_lock - so basically the opposite
of what you are suggesting. Why do you think that the
_irqsave/_irqrestore is not necessary?

[1] 3a70e0d4c9d7 ("net: lan966x: Fix possible deadlock inside PTP")

/Daniel


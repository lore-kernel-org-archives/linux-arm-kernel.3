Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005D2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63yhZuw+u+K/LV2NV+Jlud+olu+1UGZ666wYwEleOwo=; b=FzwRZx7YTXTm4+j5REHe2BFdfW
	cPIWKDYtufO/cA55fZv8fu+i9askvoWrEt87lzAYAiWaARMKxO7bMlbS4r8//UUyerDDkRKCfpcd8
	VSbaN1ZVCYuih4GnFPsMLjMR6/IojVQA51nRwbJ3ahh67jsvAFG34+C7DKDStxp6IoHhzwIOoHdEs
	q8i0H6TI8Jhu6r05yVgTdE52NwY/CP+AjA/SBdiKcUaq9yOB6XC/U0BGbALO7vLkZh1apY09XrBlJ
	eXGOkssnI6aotVFG+5gPzCgEdtaqi7f1yi1ssVfxfCs7Qa/JfDhX3APgm00RVn7JiQTIIOoZjr6Rs
	gfoDkxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBQg-0000000Ekhh-02Qy;
	Fri, 10 Jan 2025 09:35:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBKm-0000000EigE-2S3N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736501380; x=1768037380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGkhmBkgK/2ki6XHDU56SkvQQB4yKkPfpIUPnQHxMGo=;
  b=tnaOlz9VWr8fC0CPoPwFysTz6O5yHzTRQ65jKRkWnYHg6KBYiU8l7x8n
   3DWMIvAiXloOYbeZGIt7jRkc/mEObKCxcf2rG0hEyaWW0Xqg54aQxdVL+
   rif71wuhaoWnAl8mIQO5yAGkiBfvxRyfJur3v69nO0+95dcFm2QF/e5on
   oteuj8KaOWqed3JTb18OKz67s+2IUHDzzA5WAHhQQM6+G2ZNZuNgCWS4T
   Sl0D9OfLJhVgwjp11h80cZ+6QXOHgFK55Xd24QO4PRw5kv8kj8YtoiTkg
   r0xs3NEg00/dxQO5YduiidjmNHtEWXBRey8Uy4UuPqI+VWcRuyof0XpBG
   A==;
X-CSE-ConnectionGUID: ZXymC1RqQb2YdZpceUKUPA==
X-CSE-MsgGUID: gqk5PFCaQBaNHSW5mBP17Q==
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36030268"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2025 02:29:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 Jan 2025 02:29:32 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 Jan 2025 02:29:29 -0700
Date: Fri, 10 Jan 2025 09:29:28 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Eric Dumazet <edumazet@google.com>
CC: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next 4/6] net: sparx5: move SKB consumption to xmit()
Message-ID: <20250110092928.thsaqm3ucgyhw7s7@DEN-DL-M70577>
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
 <20250109-sparx5-lan969x-switch-driver-5-v1-4-13d6d8451e63@microchip.com>
 <CANn89iKA=ha6y0_UHUp6Pjkf0H4RevRbD-CHswdBqk0O=KkNqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANn89iKA=ha6y0_UHUp6Pjkf0H4RevRbD-CHswdBqk0O=KkNqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_012940_802763_81BE5C41 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Eric,

> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
> > index b6f635d85820..e776fa0845c6 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
> > @@ -272,7 +272,6 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
> >             SPARX5_SKB_CB(skb)->rew_op == IFH_REW_OP_TWO_STEP_PTP)
> >                 return NETDEV_TX_OK;
> 
> If packet is freed earlier in sparx5_fdma_xmit(), you have UAF few
> lines above here ..
> 
> stats->tx_bytes += skb->len; // UAF
> ...
> if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&   // UAF
> SPARX5_SKB_CB(skb)->rew_op == IFH_REW_OP_TWO_STEP_PTP)   // UAF
> 

Yes, this needs to be done differently. I will rework the SKB consumption in
v2. Thanks a lot!

/Daniel



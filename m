Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207BDD11704
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jYudn3PQJ2bfR0TYUK2r7jrFZc+9KyF2UZN+Of+HVc=; b=eUYmkHj/VQ6p3HRNpeWsggo+DR
	SF0Af0fwct7Dh4m1fqtSbZisSo63sMzWo80JOX8l/2ccjmtyHyspRmE1+++cX9G2dZCZkCXrLLIO/
	xq2K8ZqgPepecvU0QbuCNW9owXxtBndIkn2S1bzdXAFsiYt2oI9TbhScevBejvJ1YUmBul1HOlgKp
	7zZdLWdSOTVYnk6p0XPi+2iJ3CVdP50Yw+7bhyk6Bzn7h1OjbymW0jpBUGMV3XRW/Zo9AtALg2vFu
	4mgYF6ZbB9eOgzvwPuv+QMlwyDS0kOWE7CyabxUDOCUu3OjjE4OjfAovnXdynjRi2DZfz8VM02YfB
	2AiB6neQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ec6-00000002nO1-0fvD;
	Fri, 25 Oct 2024 07:20:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EZs-00000002n5Z-2I9x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729840664; x=1761376664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqqqvJ8g3AVzb03zYJsih0JTQPOidvJI2QvhRqV7u9g=;
  b=FuQlVFFwTIxTBLNNIzQLuZwInIj0hIoDLXN5t1pVk9ihdckoqNI0otRk
   pJUGbosmRYmoeaKv1zXCRtnCS1u/nmA3niJo96eGgGhj0VAEGUUlp9uXT
   W0ZgxPna1lTlrAMmv2ZD28tGA2jIgA02DBI7PFUwydKSZcnc+dfiKEc+p
   UxetxwBA1wHjlv+xo9eclxoj7I7p6UyY4usPTHLCCE/nQGGqD0CO1Uqlx
   BtLpyI1PdcoSHMAprwUxVaIGEVbbChjb3WX9lfML8YO+IATgPTDhChbsa
   r8ixTf7ksln2Gr+tMBC5RcMqq/KIRt3qP3GxfGRQLdFHCL1C6h1Em/d20
   Q==;
X-CSE-ConnectionGUID: Hp/0/euNT4aWmfDdVqjxpQ==
X-CSE-MsgGUID: TdR5MXcUTliy1kkXe/9EYA==
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="34008259"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2024 00:17:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 25 Oct 2024 00:17:22 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 25 Oct 2024 00:17:18 -0700
Date: Fri, 25 Oct 2024 07:17:17 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v2 10/15] net: lan969x: add PTP handler function
Message-ID: <20241025071717.rz3zqppplu52cdpc@DEN-DL-M70577>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
 <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
 <24147551-b639-4f9f-be5e-def2570a863d@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <24147551-b639-4f9f-be5e-def2570a863d@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_001744_689052_E9FCFB9D 
X-CRM114-Status: GOOD (  29.32  )
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

Hi Vadim,

Thanks for reviewing.

> On 23/10/2024 23:01, Daniel Machon wrote:
> > Add PTP IRQ handler for lan969x. This is required, as the PTP registers
> > are placed in two different targets on Sparx5 and lan969x. The
> > implementation is otherwise the same as on Sparx5.
> > 
> > Also, expose sparx5_get_hwtimestamp() for use by lan969x.
> > 
> > Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> > ---
> >   drivers/net/ethernet/microchip/lan969x/lan969x.c   | 90 ++++++++++++++++++++++
> >   .../net/ethernet/microchip/sparx5/sparx5_main.h    |  5 ++
> >   drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  9 +--
> >   3 files changed, 99 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > index 2c2b86f9144e..a3b40e09b947 100644
> > --- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > +++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> > @@ -201,6 +201,95 @@ static int lan969x_port_mux_set(struct sparx5 *sparx5, struct sparx5_port *port,
> >       return 0;
> >   }
> > 
> > +static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
> > +{
> > +     int budget = SPARX5_MAX_PTP_ID;
> > +     struct sparx5 *sparx5 = args;
> > +
> > +     while (budget--) {
> > +             struct sk_buff *skb, *skb_tmp, *skb_match = NULL;
> > +             struct skb_shared_hwtstamps shhwtstamps;
> > +             struct sparx5_port *port;
> > +             struct timespec64 ts;
> > +             unsigned long flags;
> > +             u32 val, id, txport;
> > +             u32 delay;
> > +
> > +             val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
> > +
> > +             /* Check if a timestamp can be retrieved */
> > +             if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
> > +                     break;
> > +
> > +             WARN_ON(val & PTP_TWOSTEP_CTRL_PTP_OVFL);
> > +
> > +             if (!(val & PTP_TWOSTEP_CTRL_STAMP_TX))
> > +                     continue;
> > +
> > +             /* Retrieve the ts Tx port */
> > +             txport = PTP_TWOSTEP_CTRL_STAMP_PORT_GET(val);
> > +
> > +             /* Retrieve its associated skb */
> > +             port = sparx5->ports[txport];
> > +
> > +             /* Retrieve the delay */
> > +             delay = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
> > +             delay = PTP_TWOSTEP_STAMP_NSEC_NS_GET(delay);
> > +
> > +             /* Get next timestamp from fifo, which needs to be the
> > +              * rx timestamp which represents the id of the frame
> > +              */
> > +             spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
> > +                      PTP_TWOSTEP_CTRL_PTP_NXT,
> > +                      sparx5, PTP_TWOSTEP_CTRL);
> > +
> > +             val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
> > +
> > +             /* Check if a timestamp can be retrieved */
> > +             if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
> > +                     break;
> > +
> > +             /* Read RX timestamping to get the ID */
> > +             id = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
> > +             id <<= 8;
> > +             id |= spx5_rd(sparx5, PTP_TWOSTEP_STAMP_SUBNS);
> > +
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
> > +
> > +             /* Next ts */
> > +             spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
> > +                      PTP_TWOSTEP_CTRL_PTP_NXT,
> > +                      sparx5, PTP_TWOSTEP_CTRL);
> > +
> > +             if (WARN_ON(!skb_match))
> > +                     continue;
> > +
> > +             spin_lock(&sparx5->ptp_ts_id_lock);
> > +             sparx5->ptp_skbs--;
> > +             spin_unlock(&sparx5->ptp_ts_id_lock);
> > +
> > +             /* Get the h/w timestamp */
> > +             sparx5_get_hwtimestamp(sparx5, &ts, delay);
> > +
> > +             /* Set the timestamp in the skb */
> > +             shhwtstamps.hwtstamp = ktime_set(ts.tv_sec, ts.tv_nsec);
> > +             skb_tstamp_tx(skb_match, &shhwtstamps);
> > +
> > +             dev_kfree_skb_any(skb_match);
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> 
> This handler looks like an absolute copy of sparx5_ptp_irq_handler()
> with the difference in registers only. Did you consider keep one
> function but substitute ptp register sets?
>

Yes, I did consider that. But since this is the only case where a group
of registers are moved to a different register target in hw, I chose to
instead copy the function.

The indirection layer introduced in the previous series does not handle
differences in register targets - maybe something to be added later if we
have more cases (hopefully not).

/Daniel

> >   static const struct sparx5_regs lan969x_regs = {
> >       .tsize = lan969x_tsize,
> >       .gaddr = lan969x_gaddr,
> > @@ -242,6 +331,7 @@ static const struct sparx5_ops lan969x_ops = {
> >       .get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
> >       .get_sdlb_group          = &lan969x_get_sdlb_group,
> >       .set_port_mux            = &lan969x_port_mux_set,
> > +     .ptp_irq_handler         = &lan969x_ptp_irq_handler,
> >   };
> > 


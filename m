Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C857CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUyTN1Q8z/nB8ZvC+1b6gordI7gtZlRjxQ9PFY00EYM=; b=pGEUx3p5dVBuZ20iIUweZ/3nU9
	uZtPN+j1i+8zBR5YC1fqVBDFTs83l+FvKUqAl6lhKFFjL5g0tdUI8hgYG1wRabO9znzZI0zm6mEev
	6ChXiSdlhzVzPiEqPTZjIveVGUCjuaKRnDdfhBb9J5mvd7BtzW7r2E98nO8yp7Q4iKJgTY4Ewljvl
	ad7NIbjv4szoAez7dMKwG+QdajV9xd75c6ewZR2uLss07yCX07BU7/LC5SyIT5VKQa7W6MYHvwdTw
	x46KC8WVug86b5SjiXiz+wgta9Fl6AoyS9wSl7+lMlYCrr1A++nIZKJ9ntD4k1VqSyomFRJLIgsgB
	7SnJPKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZyn-0000000CcFB-03p5;
	Tue, 13 Oct 2026 10:43:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZyj-0000000CcEI-2Yqj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791888209; x=1823424209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tgFp567zqoC/vWH4jrI5Tw4AAm+vPbmDSpC84qhGZ0Q=;
  b=Ae4N6meBIJlkz++lFQ0XMLiBPX0JyO0hoDFZuOBKmMts0uslKBnTWV4Z
   HcaKFbSwRvkehorLk5T9qjtAc0GURuTZSpQMR2vRQvnF8eN37XFwcd0W0
   KxPKWFBCRfchxlkUifIDTqMeB7RQbMPYqbD+TddnouRTP7OQUc7YDsKHF
   8cHyvw/74X0znSPdh4DKPojnyItMuNglQUAhnAAweQo1j0WSVlN4PNDc/
   KjA9NooHPlZkqW7EeHN/hh/8z5MxvflWf+UYfzueJkA5WPkgd+A93NEgr
   5zzH1O1R5tYCdORw5pru/Q7/SdjKz7La4PVhpbFu367wOtIHMCCbb4Jud
   g==;
X-CSE-ConnectionGUID: mdYmmJoFRxys8NdynXBmww==
X-CSE-MsgGUID: rlSoBSxSTK6bcsPGvC9yww==
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="232041531"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 03:43:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 03:43:28 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 03:43:26 -0700
Date: Tue, 13 Oct 2026 12:43:25 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Davide Caratti <dcaratti@redhat.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Daniel
 Thompson <daniel@riscstar.com>
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
Message-ID: <20261013104325.j526p5yurc5zmzhn@DEN-DL-M70577.microsemi.net>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
 <20261013101031.42ilxihghwsivccm@DEN-DL-M70577.microsemi.net>
 <as4GJdF8oD_8FsGI@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <as4GJdF8oD_8FsGI@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_034329_685293_3F3AE6CA 
X-CRM114-Status: GOOD (  36.30  )
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

> On Oct 13, Daniel Machon wrote:
> > Hi Lorenzo,
> > 
> > Just a question:
> > 
> > > The channel-mode mqprio offload and the CBS offload can currently not be
> > > enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> > > mqprio offload as soon as any TX queue is configured in AVB mode, and
> > > tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
> > > is active. As a result the combination is rejected whichever order the
> > > two are configured in.
> > > 
> > > The strict-priority scheduler selected by the channel-mode mqprio
> > > offload and the per-queue CBS shaper are independent MTL settings and do
> > > not conflict, so drop the checks and let the combination be offloaded.
> > > The following configuration, which was previously refused, now works:
> > 
> > Looks to me like these checks are shared by multiple cores. Are the MTL settings
> > independent on all of them?
> 
> Can you please explain what you mean?
> What I mean with this patch is we can have a given queue (e.g. queue X)
> configured in MTL_QUEUE_AVB mode and another one (e.g. queue Y) configured
> in MTL_QUEUE_DCB mode.

Sorry for being vague. I meant the MAC cores. So, dwmac510_tc_ops is being used
by GMAC, XGMAC, XLGMAC. My question was whether the claim that the commit
description gives (per-queue CBS shaper are independent MTL settings) apply to
all of these 3?

> 
> Regards,
> Lorenzo
> 
> > 
> > > 
> > >   $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
> > >         map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
> > >         queues 1@0 1@1 1@2 1@3 mode channel hw 1
> > >   $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
> > >         idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 offload 0
> > >   $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
> > >         idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 offload 1
> > >   $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
> > >         idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 offload 1
> > > 
> > > Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offload")
> > > Tested-by: Daniel Thompson <daniel@riscstar.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 --------
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 16 ----------------
> > >  2 files changed, 24 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 56d89a696272..51d502930219 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -7740,14 +7740,6 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
> > >  	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
> > >  		return -EINVAL;
> > >  
> > > -	if (priv->xmit_qdisc.prio_offload) {
> > > -		for (i = priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
> > > -			if (priv->plat->tx_queues_cfg[i].mode_to_use ==
> > > -			    MTL_QUEUE_AVB)
> > > -				return -EINVAL;
> > > -		}
> > > -	}
> > > -
> > >  	if (netif_running(dev))
> > >  		stmmac_release(dev);
> > >  
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > index ea1f97d6f0bd..175236ba379d 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > @@ -346,9 +346,6 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
> > >  	if (!priv->dma_cap.av)
> > >  		return -EOPNOTSUPP;
> > >  
> > > -	if (qopt->enable && priv->xmit_qdisc.prio_offload)
> > > -		return -EOPNOTSUPP;
> > > -
> > >  	port_transmit_rate_kbps = qopt->idleslope - qopt->sendslope;
> > >  
> > >  	if (qopt->enable) {
> > > @@ -1340,7 +1337,6 @@ static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
> > >  static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
> > >  					struct tc_mqprio_qopt_offload *mqprio)
> > >  {
> > > -	struct plat_stmmacenet_data *pdata = priv->plat;
> > >  	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
> > >  	int i;
> > >  
> > > @@ -1350,18 +1346,6 @@ static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
> > >  		return -EOPNOTSUPP;
> > >  	}
> > >  
> > > -	/* Forcing strict priority conflicts with the CBS algorithm
> > > -	 * of AVB queues, so reject the offload when any queue is
> > > -	 * configured as AVB.
> > > -	 */
> > > -	for (i = 0; i < pdata->tx_queues_to_use; i++) {
> > > -		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB) {
> > > -			NL_SET_ERR_MSG_MOD(mqprio->extack,
> > > -					   "SP conflicts with AVB queues");
> > > -			return -EOPNOTSUPP;
> > > -		}
> > > -	}
> > > -
> > >  	for (i = 0; i < qopt->num_tc; i++) {
> > >  		/* The offload switches the MTL scheduler to strict
> > >  		 * priority, which only supports a 1:1 TC to TX queue
> > > 
> > > ---
> > > base-commit: d0bd617658ddfa5a115e64d1ab687bf155f6331f
> > > change-id: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2
> > > 
> > > Best regards,
> > > -- 
> > > Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > 
> > 
> > /Daniel




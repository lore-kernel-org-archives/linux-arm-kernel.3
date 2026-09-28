Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0BFCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+znANfSSh16+59u0E8yg3o7FFvNZmmlNFW11VIynFu4=; b=okQh7v+N3btAeejWP4q2yncAkv
	ZxiVcN8X032vfQSTT6Zc3+isNd+S1QgGv++LRQyGn32jijkivcIoG1JYnQQMl0Vc6AOT7CWT4WtOy
	dx9umBBGpiz+wI+S2W2sTDwZ5wANcb2lVHdDT6V3B8ALoqXaCF9vKUcPO0QVaLDgoIE2bp6mJIreD
	n1651olzhbbNBPew0pM2WRnf99oUaDoo7VMSwJL8Q5LVtuB6Zkg0rNt3s8EYLAhHOVCJa789zbjb7
	QiOa80PG2nvovxkW851JMP6eA28576bpkgzt7fryFTMuoy2h+WHR4nRwGDX8wZV/IJxeuctlc/hkW
	2EW2dSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD4H-00000000rzv-2X4V;
	Mon, 28 Sep 2026 15:15:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD4E-00000000rzK-1SWB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790608503; x=1822144503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=//iA92Cb/95cVPrsed63yZV1ntnzxyLz5sN+/uqxqIc=;
  b=C4PsfkECn8ND8PVjorm2Juej5vx8NjjxNcSeLcndo6xeo0XnSX4u3QsD
   2MbLJ4DXCHVhZP6QmCN3qKYgXYglO3gjrjU3Q/x2a21RDnQxuNijlOzD3
   D24zGacTsE5W9rskcEY/hFhrbWUE6yV3eBL5RSVP7nCIi0zFLgykMFD3y
   ndx2mA4SaUN4uKx0k99ULV6q1B+JXH5iahzkuHnGJQPdWrhsNpqzemQ8z
   AsZJQELMHXwcLX841RI7odPJI/JtGkaGF3CqH/Ph5cqNa5lzm8qX6q6Gt
   EQ1mDozxblN1GZnTT5GPTzh1CakqxVgbqLBT6KkNPwWQ4BeEMMEVn3OBO
   g==;
X-CSE-ConnectionGUID: ruO/2bxPRV6E3dOTkw2JSg==
X-CSE-MsgGUID: Y9gywBzxR4q9pSNX9VzmmQ==
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="231374969"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 08:15:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 08:14:56 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 28 Sep 2026 08:14:54 -0700
Date: Mon, 28 Sep 2026 17:14:53 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: start the domain 0 TOD counter on
 non-PTP lan969x variants
Message-ID: <20260928151453.fzch356vrp3ergy7@DEN-DL-M70577>
References: <20260928044955.29647-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260928044955.29647-1-quentin@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_081458_643991_7B038CCE 
X-CRM114-Status: GOOD (  31.74  )
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

Hi Quentin,

> Currently the base non-PTP capable lan969x variants don't forward any
> ethernet frames. Testing showed that starting the domain 0 TOD counter
> gets them working again.

Ack. Not initializing the TOD domains on certain variants is a problem.

However, TOD domains shouldn't affect basic forwarding. I tried it on my board
with PTP forced off - no forwarding issues.

Certain TSN features do require TOD domains to be configured, though. How did
you test this, and what exactly did you see fail?

> 
> Fix by moving the TOD counter start code into a helper and calling it in
> sparx5_ptp_init(). Non-PTP capable lan969x parts now start the domain 0
> counter, and PTP-capable parts start all three, as they used to. A similar
> workaround that starts all three and registers the PHC clocks is
> implemented in the vendor BSP 6.18 kernel [1].

What we do downstream, is to ensure that all domains and PHC's are configured
and registered on all variants, with a very simple is_sparx5() check. 

> 
> [1] https://github.com/microchip-ung/linux/tree/bsp-6.18-2026
> 
> Fixes: 207966787b71 ("net: sparx5: add feature support")
> Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>
> ---
> If anyone with access to documentation more detailed than the
> register map knows WHY this clock needs to be running, I'd like to add
> that to the commit message.


> 
>  .../ethernet/microchip/sparx5/sparx5_ptp.c    | 72 +++++++++++++------
>  1 file changed, 49 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> index 5953e04ef14e..b436684ddae6 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> @@ -573,6 +573,42 @@ static int sparx5_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
>         return 0;
>  }
> 
> +static int sparx5_ptp_tod_start(struct sparx5 *sparx5, u8 phc_mask)
> +{
> +       u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
> +       int i;
> +
> +       if (phc_mask > GENMASK(SPARX5_PHC_COUNT - 1, 0))
> +               return -EINVAL;
> +
> +       /* Disable master counters */
> +       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0), sparx5, PTP_PTP_DOM_CFG);
> +
> +       /* Configure the nominal TOD increment per clock cycle */
> +       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(phc_mask),
> +                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> +                sparx5, PTP_PTP_DOM_CFG);
> +
> +       for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> +               if (!(phc_mask & BIT(i)))
> +                       continue;
> +
> +               spx5_wr((u32)tod_adj & 0xFFFFFFFF, sparx5,
> +                       PTP_CLK_PER_CFG(i, 0));
> +               spx5_wr((u32)(tod_adj >> 32), sparx5,
> +                       PTP_CLK_PER_CFG(i, 1));
> +       }
> +
> +       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0),
> +                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> +                sparx5, PTP_PTP_DOM_CFG);
> +
> +       /* Enable master counters */
> +       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(phc_mask), sparx5, PTP_PTP_DOM_CFG);
> +
> +       return 0;
> +}
> +
>  static struct ptp_clock_info sparx5_ptp_clock_info = {
>         .owner          = THIS_MODULE,
>         .name           = "sparx5 ptp",
> @@ -605,7 +641,6 @@ static int sparx5_ptp_phc_init(struct sparx5 *sparx5,
> 
>  int sparx5_ptp_init(struct sparx5 *sparx5)
>  {
> -       u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
>         const struct sparx5_ops *ops = sparx5->data->ops;
>         struct sparx5_port *port;
>         int err, i;
> @@ -622,8 +657,17 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
>                 sparx5->ptp = 1;
>         }
> 
> -       if (!sparx5->ptp)
> +       if (!sparx5->ptp) {
> +               if (!is_sparx5(sparx5)) {
> +                       /* the base, non-ptp-capable lan969x variants need the first tod counter

Nit: s/the/The

> +                        * running to forward frames.
> +                        */
> +                       err = sparx5_ptp_tod_start(sparx5, BIT(0));
> +                       if (err)
> +                               return err;
> +               }
>                 return 0;
> +       }
> 
>         for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
>                 err = sparx5_ptp_phc_init(sparx5, i, &sparx5_ptp_clock_info);
> @@ -635,27 +679,9 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
>         spin_lock_init(&sparx5->ptp_ts_id_lock);
>         mutex_init(&sparx5->ptp_lock);
> 
> -       /* Disable master counters */
> -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0), sparx5, PTP_PTP_DOM_CFG);
> -
> -       /* Configure the nominal TOD increment per clock cycle */
> -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0x7),
> -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> -                sparx5, PTP_PTP_DOM_CFG);
> -
> -       for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> -               spx5_wr((u32)tod_adj & 0xFFFFFFFF, sparx5,
> -                       PTP_CLK_PER_CFG(i, 0));
> -               spx5_wr((u32)(tod_adj >> 32), sparx5,
> -                       PTP_CLK_PER_CFG(i, 1));
> -       }
> -
> -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0),
> -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> -                sparx5, PTP_PTP_DOM_CFG);
> -
> -       /* Enable master counters */
> -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0x7), sparx5, PTP_PTP_DOM_CFG);
> +       err = sparx5_ptp_tod_start(sparx5, GENMASK(SPARX5_PHC_COUNT - 1, 0));
> +       if (err)
> +               return err;
> 
>         for (i = 0; i < sparx5->data->consts->n_ports; i++) {
>                 port = sparx5->ports[i];
> --
> 2.55.0
> 
>

/Daniel


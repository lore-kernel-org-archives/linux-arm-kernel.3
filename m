Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9DD0fnDN/AtUagifRVVvBok4ZTdBpDaDU4p8Mda5rU=; b=3zdr4k+orme8+1z50ZOFdZRsAT
	NBq1HJoZoOhWxGmolaLPBjWf+IwmIPCkSH+CliEfWF7iqHyO8HgMuLao811/pcfItSO0KapfUqWpD
	ABs8dUeqPoEuCAmV/9WIoZfwxIFNdIZlQZvFWHOehFJOpB/x+wDW2euvtoPcFDZJxK9LR1DE893MO
	T3lNExjfQf9PzR4tQ81t4tdUtrjJnZ/uKb/NRDDkhTAxy2LCHBYJFYBsJnt5CdCJDqAVdK8EJiSAS
	0G1ZLC77Gt39t4MTUYIuPUqUE52ZZQs5urrfmGa1bCThUy+8WCbe8S4ldeF+ZhCmFO+TNuePC8lht
	8w5JyeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnF5a-00000003O3X-45kp;
	Wed, 26 Feb 2025 10:56:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEfz-00000003IZq-1Ekx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:30:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab744d5e567so128359366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740565801; x=1741170601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9DD0fnDN/AtUagifRVVvBok4ZTdBpDaDU4p8Mda5rU=;
        b=NPSnu7DCrdlvFykKFjYZ8t/uko+UIYTr3CRC9S40/cPDb1coSCUIgB946BDObDhhqY
         +v9bgY/VjJRw+xjgLxI0Y8jgn+u+fKnE5wQ7ScPlrsJ/nL/Ey7P1EGfLZdLhqW0ZHD6m
         JzzTdiDhobfB0Xlx7+6QYIywszmScjuuNno9734dMHMHM3Bfh99uzyEDVDk/Jy0fpvP2
         7E7Cx9QqQshUIuZPIGDRVKYohiD+yktTvGViPcoxgEiaEl/XAmL5AsH6ts2Br8D0YhrJ
         rpAknfGnWoVU9gT9LJA6oEfRNoOpHjEHKovOx3u5ofafnRnt7hc/EKdx5ZLcZf5K1fV2
         bSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565801; x=1741170601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9DD0fnDN/AtUagifRVVvBok4ZTdBpDaDU4p8Mda5rU=;
        b=gynU2rD4xCVhW/5Xd0ZRcRCI9J+MDQvFYloM5JjKgZ3bQA6udNxrNqlihBcAmSdQDp
         0QKTqrWBeTv9Kvym0bMjh/askconMc2DP93SiC3VwyiXCyEjQOy+fOR9Cz04wxx69p+r
         QEd9wFojjo6gdDa0JnaaYbBdoWdSRxIVW6a0aL9OVSkCModXioC6raISvmrAYVRJ+sfe
         6azDUfxhHe3TtFOVPokmr7HbvB7sn7Awzevuns1birTT8AC4oSfmJimLnw2A2j158DLZ
         7XojVpF9j/v8H/u0kpztMH5gKoVm7i9B1cDuACXLWRna6lXOt3BFhXELX96EWh07yDPL
         Yn4A==
X-Forwarded-Encrypted: i=1; AJvYcCV9VNC7hv2+BLeLXPgAAD7d6CF7xHfkDaAdh7bHN9WaOufXbpAkaLTWk7puM9IMPti4UKG4mxB6tL6PPggMBfo8@lists.infradead.org
X-Gm-Message-State: AOJu0YxVpQbXdZhhEteHwDxOdKSBkSFuEe0sD3Vms1Wp3cixQ9nXSDRA
	RRSyfrOyIFL8kdECs3AIsJEUjfmmySZSLhqIbZeGtR9NIpsLHv3DlG9ml+nIdBY=
X-Gm-Gg: ASbGncsoKjIFMx/L6YzJh+eBNcUhX9Op5AgZ8qDtSo2uwIQv/XAC5BX6f+pTNsoP4bo
	1yD60M+fk7sghGVYpOSmGPGbMtze0vYAJdyaSPMmwOt9NcrceGUDuhYonxik2hKDQB41syqZ3s8
	9kymfjJzYvsL2efRUaPnE3phJKgvxWTHHfJ+j67ce5viPCk6KQrjovEnIiXOwJXnVOcrVpqDjF6
	XVYjRx2j/rXxU0kQpnRdLgNJslUQgrJqUI+GfM7hQg+3yTBi9M5ZNV4aTlkMxbwTbm6X6EGvhuy
	hd5moHaI+g4EqFKAvHp8Tgm9E4yaYHs=
X-Google-Smtp-Source: AGHT+IHr4uQ5R5/KWmLNlHHoe7q5Yn5WHDFYUfnRdWeKc0hVpBSxYaUpHUfPTVtbh9gcGuAG6MEifA==
X-Received: by 2002:a17:907:784f:b0:abb:b24d:c63e with SMTP id a640c23a62f3a-abc0ae910famr1773453866b.16.1740565801539;
        Wed, 26 Feb 2025 02:30:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1d54a0dsm305559066b.50.2025.02.26.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:30:00 -0800 (PST)
Date: Wed, 26 Feb 2025 13:29:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	matthias.schiffer@ew.tq-group.com, schnelle@linux.ibm.com,
	diogo.ivo@siemens.com, glaroque@baylibre.com, macro@orcam.me.uk,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssg-prueth: introduce and use
 prueth_swdata struct for SWDATA
Message-ID: <41fbeb70-bf49-4751-b4ba-6b122a45233d@stanley.mountain>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224110102.1528552-3-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023003_340321_12EE9AB9 
X-CRM114-Status: GOOD (  26.72  )
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

On Mon, Feb 24, 2025 at 04:31:01PM +0530, Meghana Malladi wrote:
> From: Roger Quadros <rogerq@kernel.org>
> 
> We have different cases for SWDATA (skb, page, cmd, etc)
> so it is better to have a dedicated data structure for that.
> We can embed the type field inside the struct and use it
> to interpret the data in completion handlers.
> 
> Increase SWDATA size to 48 so we have some room to add
> more data if required.

What is the "SWDATA size"?  Where is that specified?  Is
that a variable or a define or the size of a struct or
what?

> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> Changes since v2 (v3-v2):
> - Fix leaking tx descriptor in emac_tx_complete_packets()
> - Free rx descriptor if swdata type is not page in emac_rx_packet()
> - Revert back the size of PRUETH_NAV_SW_DATA_SIZE
> - Use build time check for prueth_swdata size
> - re-write prueth_swdata to have enum type as first member in the struct
> and prueth_data union embedded in the struct
> 
> All the above changes have been suggested by Roger Quadros <rogerq@kernel.org>
> 
>  drivers/net/ethernet/ti/icssg/icssg_common.c  | 52 +++++++++++++------
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  3 ++
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h  | 16 ++++++
>  .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  4 +-
>  4 files changed, 57 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index acbb79ad8b0c..01eeabe83eff 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -136,12 +136,12 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  	struct net_device *ndev = emac->ndev;
>  	struct cppi5_host_desc_t *desc_tx;
>  	struct netdev_queue *netif_txq;
> +	struct prueth_swdata *swdata;
>  	struct prueth_tx_chn *tx_chn;
>  	unsigned int total_bytes = 0;
>  	struct sk_buff *skb;
>  	dma_addr_t desc_dma;
>  	int res, num_tx = 0;
> -	void **swdata;
>  
>  	tx_chn = &emac->tx_chns[chn];
>  
> @@ -163,12 +163,19 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  		swdata = cppi5_hdesc_get_swdata(desc_tx);
>  
>  		/* was this command's TX complete? */
> -		if (emac->is_sr1 && *(swdata) == emac->cmd_data) {
> +		if (emac->is_sr1 && (void *)(swdata) == emac->cmd_data) {

I don't think this conversion is correct.  You still need to say:

		if (emac->is_sr1 && swdata->data.something == emac->cmd_data) {

Where something is probably "page".

regards,
dan carpenter

>  			prueth_xmit_free(tx_chn, desc_tx);
>  			continue;
>  		}
>  
> -		skb = *(swdata);
> +		if (swdata->type != PRUETH_SWDATA_SKB) {
> +			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
> +			prueth_xmit_free(tx_chn, desc_tx);
> +			budget++;
> +			continue;
> +		}



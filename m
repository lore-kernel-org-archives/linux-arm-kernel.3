Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C0C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g0aAQ3sTV3pEk/c08ymRkyu+vrncQM0ftrLofpZAv8=; b=wUak5D6oxhRNoLlCORMalG9J4m
	aReE80P8Wi0MLR+ctha13Il/RWi8WupHWRH4N1KgIjUsOz2cZ8m75HEgNkvzpaZiY3Pg5g9S1Sqzk
	IT6+Xt7CbkxkEU1W89JpESMsJcdyI7okxGnZc+RtXD5mI9HUQtxt9OvX4fzRGRO9ggVZj0joSZSbj
	SO3NecRsUAiRRLX+kiA8yMPZ4sJv32hr1WhvOz2qM6Q5iOUNNG8osUqeJShlg8n6JPdmsZ6Nyax+O
	Hgq9IbwwXK62siwhg5Q0pWu9rg18udhclPrYwCRuKxaCgnIWK6m5vG1SAtRuY95sQYk1Vo2eA9MW4
	IDiVzSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfwx-00000004N9R-1FHN;
	Wed, 05 Aug 2026 18:02:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfwu-00000004N93-1c7U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 18:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785952959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/g0aAQ3sTV3pEk/c08ymRkyu+vrncQM0ftrLofpZAv8=;
	b=QenSoqPd5q5KSpCvqhh1hUH40O52NS1MK2FtXApdo3Jey5zXbofIM6QJ78A7Q5HCJtU8CE
	yqTU0dvTYDuEg0FlUxhspJaB0lHplKF3MJnccZV4rsTV9W0I6DXQVFJ9n+1n20zECFiCYG
	JOt9ZDJfgdHtWd3Nj0M3naCnSepdwuk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-yUmNiBSpOJWoJSVnS8pCHg-1; Wed, 05 Aug 2026 14:02:27 -0400
X-MC-Unique: yUmNiBSpOJWoJSVnS8pCHg-1
X-Mimecast-MFC-AGG-ID: yUmNiBSpOJWoJSVnS8pCHg_1785952946
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so9846735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 11:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785952946; x=1786557746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g0aAQ3sTV3pEk/c08ymRkyu+vrncQM0ftrLofpZAv8=;
        b=Sv1k8oFvUwJSYZAHnCFJ6RijsGJuje8bv8wuZrTULBD6fUPZJXYf5pZB6PN8VpCeNU
         FnAMPZOieW3D+Cy0pd7uhHq85L+PjON2iqDURXziYsbMxq+eALKZHuenmljnCJpET/8k
         cUozCzpeLbWE6ZQ47MMEE+XwRSh1XHcrYu7VduEirCAmRUK8VbkgEAcZhQIu/IsWxOvG
         1y3+Ft0LtVsEY5iBbcNa2x6ge55tRxvbLHBUCVU1BAsEl+7nc+kk1QB64HNluqihMH4p
         aAoQNTNaMQbqIZmDAvfpj5/yzmM++HOnxoPL/96nsgD0HGoKqTK+6fK0+l840SQBvTLG
         tFvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZwPHFl1mkqKIgsQyUu3eTX+Hjg5ESULsKRp1BqcwHFGpt7KTo5xlTwjvyHeA6opgbQQY0BFWSP3JJ0GfGR0Nu@lists.infradead.org
X-Gm-Message-State: AOJu0YzfH4iqiXWmZ0712xibBN8MbW9eFMESMuAQRxtGp3c3EvM9DfEn
	0u/8HuoRx/tVVKG9XtD8pDyqIcn2SbXQdtMUCztWzAbjH02YgQxkL1vcPowQYLaqDYlshmzu4wW
	6Cb2TmCTUa/ve9jogS/i0+3HLZ1rvSY4rj72KeiBBmUmOkEAqrKEtcTWtmTvUBRt4FmBMqaUnks
	yZKl+Tz6uFz0w=
X-Gm-Gg: AR+sD11v+xwrR0U771Kr5JrU52ruJ3JlKvOZJZjai4259Gu2IV1bmeLkTYXdtgdkYQ+
	QFzLwwO9TaKbqLwaPD0S1Z45hpuKxeApg3qprqfsNaYGuVEz3a0XOa4Fia1MTpcOQrEKhGYR6KX
	SlaEVjQehXC5rI2rTQfEk1fNwLOZitTkRdnEgyxJz+yxXUTeWYj/iKhc67V7PsnvXAtPtu+hyJ0
	B711hRRlOnXCITAZz5SG21HngFfN04IdNBwxIaMa6xSO2R0LsctGwvs2v8s7IkfBmjuLhi/e2vM
	NH0hKkaM3zCvyUYu+AWZzPATKnDwEbDJ4LsuZ1LzQxMDQCarUNXGXl39rOnN3DmUD4INSFfj2MM
	=
X-Received: by 2002:a05:600d:8492:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-4994e7bb193mr87767725e9.11.1785952946352;
        Wed, 05 Aug 2026 11:02:26 -0700 (PDT)
X-Received: by 2002:a05:600d:8492:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-4994e7bb193mr87766805e9.11.1785952945804;
        Wed, 05 Aug 2026 11:02:25 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd4bbcsm199485675e9.7.2026.08.05.11.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:02:25 -0700 (PDT)
Date: Wed, 5 Aug 2026 20:02:24 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Thompson <daniel@riscstar.com>,
	Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: add tc-ets qdisc offload
Message-ID: <anN6sHZt47dRZeaE@dcaratti.users.ipa.redhat.com>
References: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sYnUzU75Conc_VQkMNb5JKM4y3h8_oqRGCozeej6beg_1785952946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_110240_505632_0DBFF0EE 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, Aug 04, 2026 at 08:17:35PM +0200, Lorenzo Bianconi wrote:

[...]

> When all bands are strict priority, the MTL scheduler is programmed with
> SP scheduling; 

... and I replied too early _ sorry for the noise _ there is another small thing
w.r.t. SP scheduling:

> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1210,6 +1210,73 @@ static int tc_setup_etf(struct stmmac_priv *priv,
>  	return 0;
>  }
>  
> +static int tc_setup_sp_sched(struct stmmac_priv *priv)
> +{
> +	struct plat_stmmacenet_data *pdata = priv->plat;
> +	int i;
> +
> +	for (i = 0; i < pdata->tx_queues_to_use; i++)
> +		pdata->tx_queues_cfg[i].weight = 0;
> +	stmmac_set_tx_queue_weight(priv);
> +
> +	pdata->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
> +	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
> +				      pdata->tx_sched_algorithm);
> +
> +	return 0;
> +}

The above function configures the stmmac SP queues to a well-known state where all
queues are SP. However,

[...]

> +
> +static int tc_setup_ets_sched(struct stmmac_priv *priv,
> +			      struct tc_ets_qopt_offload *qopt)
> +{
> +	struct tc_ets_qopt_offload_replace_params *p = &qopt->replace_params;
> +	struct plat_stmmacenet_data *pdata = priv->plat;
> +	int i, nstrict = 0;
> +
> +	if (p->bands > priv->plat->tx_queues_to_use)
> +		return -EOPNOTSUPP;
> +
> +	for (i = 0; i < p->bands; i++) {
> +		if (!p->quanta[i])
> +			nstrict++;
> +	}
> +
> +	if (p->bands && nstrict)
> +		return -EOPNOTSUPP;
> +
> +	if (nstrict) {
> +		tc_setup_sp_sched(priv);

This is not necessarily what the user wants when setting up the ETS qdisc.
The driver should parse 'priomap' (like in [1] or [2]) so that only 'nstrict'
queues are involved, and selected based on the packet priority. Otherwise, the
offloaded ETS is going to behave very differently from its full-software
implementation _ which is something we probably want to avoid.

[1] https://elixir.bootlin.com/linux/v7.1.5/source/drivers/net/ethernet/microchip/lan966x/lan966x_ets.c#L36
[2] https://elixir.bootlin.com/linux/v7.1.5/source/drivers/net/ethernet/airoha/airoha_eth.c#L2281
	
WDYT? Any feedback appreciated!

-- 
davide



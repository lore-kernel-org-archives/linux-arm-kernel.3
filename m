Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A846EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvf5TT4THTQo8Vgq5kQVKZIB4tzxRyZ0EIxkRmLPp9c=; b=Zai8uAIlNLU13xSb0GhOO7fkeJ
	egimYYybSLxvf5xYe2GqLFipnD5VVjaQizRyaibZUk2WRWGUU9rWSqXYioq2oHPDm6aFabOqBQ3jW
	enwuCg+hzlg7tIu5OTuIZkzldKbzoEH8THpW3GzTshsDaZo8UiDNmr2OsfyNTWJIecFvz29CyDGJG
	3rGK/3Qn6g/zQn/sPK+F1lJ0xFn49zi/mm1v0G9QIUgGyqfa3JfwaSM7V7DHeS+Ljd/416vgJHlCx
	/ko4f6adA5ATnFAvCQYXV+of57PCtr0ZXDbbN/Vxk0WXWQOPiX6pcY0cDJv5EvcoO9ZfQG25onF88
	WS1qhutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxkZ-000000071ER-3N8d;
	Wed, 29 Jul 2026 06:26:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxkW-000000071Dx-0dzV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:26:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C65E4E40FD4;
	Wed, 29 Jul 2026 06:26:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F7366039A;
	Wed, 29 Jul 2026 06:26:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C11DA11C14993;
	Wed, 29 Jul 2026 08:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785306392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Gvf5TT4THTQo8Vgq5kQVKZIB4tzxRyZ0EIxkRmLPp9c=;
	b=Y0Z7OUKqTitpQC4pDdj2I4WkZwnECbktc3br1Fr8iShkM7wTDbH/k9Kz782dLjGs8OqDZH
	5l5FRhHKhOwT3gj5i5oH1C0Q+VMOstsWQVZwDs4T+j3SKFAfRtuDus45jDSHkkoxTAq3nd
	qpMPIcRSGlVJWYI/3w3lEKBs+qSuVH5M8aw6GJl/51E/LSVYUAm/Se6xPGAS24TlL10P+X
	x5w78hKJJ1wG4xrvUiXVQ0I6LGKZA1otfuXBle0WfTJpgwJcU94/it3tQRnhFDNDo+aCql
	+borfurKAmqo3Srh7VeEwJMSZgIfW7IVxxBsDZZSXE8H4wEDhYvqJJ7VwTtbQA==
Message-ID: <22d95b3a-752f-46fc-be0f-497e78f9f189@bootlin.com>
Date: Wed, 29 Jul 2026 08:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: fpe: Enforce pmac_enabled in
 set_mm and keep it on at init
To: muhammad.nazim.amirul.nazle.asmade@altera.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260729015247.25774-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260729015247.25774-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_232640_420279_4816947B 
X-CRM114-Status: GOOD (  16.30  )
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

Hi,

On 7/29/26 03:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The preemptive MAC in DWMAC is always enabled, meaning DWMAC is always
> ready to receive preemptive mPackets. Initialize pmac_enabled to true
> at init time and reject attempts to disable it via ethtool set_mm.
> 
> Also add a missing fpesel capability check in stmmac_set_mm() to return
> -EOPNOTSUPP early on hardware without FPE support.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 7 +++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c     | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 92585d27ab88..8ebdd249e5c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1064,6 +1064,13 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> +	if (!priv->dma_cap.fpesel)
> +		return -EOPNOTSUPP;
> +
> +	/* DWMAC always have preemptible MAC enabled */
> +	if (!cfg->pmac_enabled)
> +		return -EINVAL;
> +
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);
>  	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index c54c70224351..2f880c5e35b0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -176,6 +176,11 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
>  	    priv->dma_cap.fpesel)
>  		dev_info(priv->device, "FPE is not supported by driver.\n");
> +
> +	/* The preemptive MAC in DWMAC is always enabled, so initialize
> +	 * pmac_enabled to true to reflect the hardware state.
> +	 */
> +	priv->fpe_cfg.mmsv.pmac_enabled = true;
>  }
>  
>  int stmmac_fpe_get_add_frag_size(struct stmmac_priv *priv)



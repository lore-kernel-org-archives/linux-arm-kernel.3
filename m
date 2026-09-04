Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA94FC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3epY1+67KLNv+IiSLbiHclGF4bMJDsX7GFrt9DkOYA=; b=Vx+7pf+xlltRXP9Tqm85rwzCi0
	lUAT4gY19joCOnqniWkzG1FWvWktTPX3Mq5Fd7Mpj0cj1Lm1y+lUTi1Vws67HtTzjNtfTSHplso1e
	Ib0QmGSjWiIq/itjwOltNzRbTuUqAbB4fef3Xak5iE1bFM4y642qC6m20dtmO74JObByDDPqD2SyT
	8wUT/GNiqT6qmSYePX4rgcauXCNCvg1ZHJYceC6Zige0f/Bb226+n6MRpdJ3bAkN+J+3IbcLghdHR
	B3cfy5p7uC3xauHkFBhN5EGJtDAjDDNLqPtL+2+2eTMITKVfHZUr7T5qGCp9YdXdYBoNTwprh/nBM
	mlv/fLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S7x-00000001pOk-40pG;
	Fri, 04 Sep 2026 11:30:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S7u-00000001pNT-3AuC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:30:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 738DA1A19AA;
	Fri,  4 Sep 2026 11:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 385CA6057F;
	Fri,  4 Sep 2026 11:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 456E811C7ACD3;
	Fri,  4 Sep 2026 13:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788521424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=E3epY1+67KLNv+IiSLbiHclGF4bMJDsX7GFrt9DkOYA=;
	b=ipExXbYr18+T4LuW6LN7F0s3LyWtmOSffrPuVWtBPVLFTgg3T6PTPkHxBVcB9OaJ7xoBso
	m2ueNuhhXe/l7MTLDXPLRgVzsDe9EU+eNrvRtS/7mgwScitmIdX7iOVDun2JLX2+9/yanD
	yfofokEZBnPxjrJoWL7UCqFdqs6EQXy+YpjOGq6LiUa7RErv3g9hHrocXEuDrj2g9eG9+k
	j+jydJrMEg1KgkoxQSjfw1hvctAY6YITLTHSgCj1QkJVE3qu/a2G118TbhZSl/dyTm5Ms6
	DSR61EapucpHNFLA79pvAuXOI/KrpNfxzPT05J12HJ43rzuUZPbpx2GigKEyqg==
Message-ID: <3b4865f9-fa18-4138-a46e-05b14f1d3cef@bootlin.com>
Date: Fri, 4 Sep 2026 13:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: initialize ptp_lock at probe time
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043034_953846_ED9709E6 
X-CRM114-Status: GOOD (  16.04  )
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

On 9/4/26 12:32, Lorenzo Bianconi wrote:
> priv->ptp_lock is only initialized in stmmac_ptp_register(), which runs
> during __stmmac_open(). However, the lock is also used while the
> interface is down and has never been opened: tc_taprio_configure()
> invokes the PTP gettime64() callback to compute the EST base time when
> offloading a TAPRIO schedule, and stmmac_get_time() takes
> priv->ptp_lock. Using an uninitialized rwlock is undefined behaviour.
> Move the rwlock_init() to __stmmac_dvr_probe(), together with the other
> private locks, so that ptp_lock is always valid regardless of the
> interface state.
> 
> Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24656b35350b..5fe7e95fdd34 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8025,6 +8025,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  	stmmac_napi_add(ndev);
>  
>  	mutex_init(&priv->lock);
> +	rwlock_init(&priv->ptp_lock);
>  
>  	stmmac_fpe_init(priv);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 960249960004..3bfcc9760dce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -365,7 +365,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
>  	if (priv->plat->crosststamp)
>  		priv->ptp_clock_ops.getcrosststamp = stmmac_getcrosststamp;
>  
> -	rwlock_init(&priv->ptp_lock);
>  	mutex_init(&priv->aux_ts_lock);
>  
>  	priv->ptp_clock = ptp_clock_register(&priv->ptp_clock_ops,
> 
> ---
> base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
> change-id: 20260904-stmmac-fix-ptp-clock-init-b8eba4328243
> 
> Best regards,



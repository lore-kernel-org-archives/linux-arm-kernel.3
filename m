Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F90EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ+s2XEBuZodW5KuiEYx8rkHpmMdoiYAvq8N8LYvLc4=; b=mgmRncE3IbLx4qb25KtFj993CA
	VtZF2u1c1FsaB0fxdcfwCZUX0Qtaq8inQQJ9D+xbWxHyggDRDOS4W68Z3hXNW02K4Hg8WkBmd51PQ
	vvvtBQNjN2f3cDhEuHqDB7JnwzbIPITCemkf26/nnppE9m5BLjjsyKRaOYXRU7Stkc89eHgY6Tb5t
	DzNBVhzfK8SaIfS4Pvw2+gMS9QwfbbPb1TIKOuPTTQrCua1X9J+GM92DwIH8LLyT0zm6yjSPtfYvL
	NhUB0t+wkiKnyYF8VNbtcVqcLKC+ZTx+23R7HVDRw8P0P/pnBXwxq9e7n2lZJKoEfVuWBZ+W9oMxK
	I5+vECPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s3G-0000000Ftvh-2qrY;
	Wed, 02 Sep 2026 20:59:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s3D-0000000FtuZ-18IP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:59:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D8121A1943;
	Wed,  2 Sep 2026 20:59:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAD7B6053C;
	Wed,  2 Sep 2026 20:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1794411C79331;
	Wed,  2 Sep 2026 22:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788382750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zZ+s2XEBuZodW5KuiEYx8rkHpmMdoiYAvq8N8LYvLc4=;
	b=GUZn9Q2E/CFdQn3IIRW01htGWPqiIf5a1pfqU/uTykLAPwY4be7vjNZjyAAwvPOnWvagGe
	4k+SHJ1uobhodformV+POrG1zcNCQoo49bh48QStlKJqv8ixoa/IdZQBx7ogQ82YjgY90T
	K4hg9wMOSeX+Rf4mvmxTPP2vSmAaO8YYOvXKvxsfVMtE1I2LWWhfidpuf35ioYGAJhsif8
	UW0EyDqjXfLA8Rsbkbfw1vNuKufW/im+omwOR5X2jIN76nUa/DFBTX3dkBB9SlQ8nEao1k
	yCyoyCp8C69XLYHPnoycuiVjo43echBMyZf5CQ3NCI2WNPbze3VmX9Cjq7St9Q==
Message-ID: <1010cb80-d9c9-4891-a719-8d7ca31c732a@bootlin.com>
Date: Wed, 2 Sep 2026 22:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/4] net: stmmac: propagate PTP init failures in
 stmmac_setup_ptp()
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Thierry Reding <treding@nvidia.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
 <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_135919_468819_22463C7F 
X-CRM114-Status: GOOD (  18.55  )
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

On 9/2/26 22:15, Lorenzo Bianconi wrote:
> stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> the PTP reference clock enable and stmmac_init_timestamping()
> failures are logged but never propagated. When they fail, the MAC
> system time counter is left in its post-reset, non-running state,
> while the driver keeps operating as if timestamping were up.
> This matters for the upcoming taprio offload re-apply, which derives
> the EST base time from the hardware timestamp counter: arming the
> gate list against a non-advancing time base would leave the schedule
> permanently stuck. Make stmmac_setup_ptp() return an error code.
> 
> Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
> Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/disable")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

nice fix, this isn't the first time we have issues because ptp init silently
failed :(

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 46 ++++++++++++++++-------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d576059c04df..47295845371a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -937,18 +937,27 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
>  	return 0;
>  }
>  
> -static void stmmac_setup_ptp(struct stmmac_priv *priv)
> +static int stmmac_setup_ptp(struct stmmac_priv *priv)
>  {
>  	int ret;
>  
>  	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		netdev_warn(priv->dev,
>  			    "failed to enable PTP reference clock: %pe\n",
>  			    ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = stmmac_init_timestamping(priv);
> +	if (ret) {
> +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> +		return ret;
> +	}

This can legitimately fail with -EOPNOTSUPP, we musn't failt the whole open
sequence in this case.

Maxime



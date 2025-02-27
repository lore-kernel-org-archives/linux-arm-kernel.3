Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A27C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlwRt4wQ2xFVKA1gnOfel5WpP6ziq3DqOeLOcmYMfaQ=; b=lKPfnbxAFwYnpwN+gZsbmlscp/
	Ggd8QcTmzUZ8/lIM2KGRkPMEVZwF/vyih5iVGIx2MI2SzFDgbkYl+EB0DREpj40LwmoRQfAE4gXvS
	iDxyRxUdG+yiMh/QRP1mBtF2kvshegVSXft3KxXiP5Cy7iwAxNXjKApxh8dO4TZusyavwvrItz4Bd
	aWikScF0DrO5ZH3NQ+zhKjFcx5ph530AlfaKe0wFSmG1iaIERnof7TjuF/WYYF2IwdWwnygIJ8HW6
	9Yrz8B4uEPr87PhGB2WHi7BSSltXEs2b7M8sqccAnhHqiAEAU1N8tXIonRSBdDZ3Uy/EfYBtyA84A
	b8MlEyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjj8-00000008XZS-2K5u;
	Thu, 27 Feb 2025 19:39:22 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngP4-000000080Iz-2N5S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:06:28 +0000
Message-ID: <542018d4-ded1-40c6-9a97-d3789877b771@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740672380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlwRt4wQ2xFVKA1gnOfel5WpP6ziq3DqOeLOcmYMfaQ=;
	b=f1xRBVY9kC5vW0Jmevz6TSCi6ihdzUm1YZh8shcQgPXA/5MQK77athpLb9tTS6JlCKbbo/
	g/ZkYclMC3BONheB7zHH/CKYLOMheX2zqrMHh6J5w6F0OfVaDOi3qXwMqpPvLKYfvZMr9p
	wtA9SMC8mz2efcjqOcd9uJqxRCQdR30=
Date: Thu, 27 Feb 2025 16:06:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net] net: ti: icss-iep: Reject perout generation request
To: Meghana Malladi <m-malladi@ti.com>, vigneshr@ti.com,
 javier.carrasco.cruz@gmail.com, jacob.e.keller@intel.com,
 diogo.ivo@siemens.com, horms@kernel.org, richardcochran@gmail.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20250227092441.1848419-1-m-malladi@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250227092441.1848419-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_080626_757372_0FEA4967 
X-CRM114-Status: GOOD (  18.11  )
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

On 27/02/2025 09:24, Meghana Malladi wrote:
> IEP driver supports both perout and pps signal generation
> but perout feature is faulty with half-cooked support
> due to some missing configuration. Remove perout
> support from the driver and reject perout requests with
> "not supported" error code.
> 
> Fixes: c1e0230eeaab2 ("net: ti: icss-iep: Add IEP driver")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> This patch is a bug fix to disable/remove a faulty feature, which will be
> enabled separately as a feature addition to net-next, as suggested by
> Jakub Kicinski and Jacob Keller:
> https://lore.kernel.org/all/20250220172410.025b96d6@kernel.org/
> 
>   drivers/net/ethernet/ti/icssg/icss_iep.c | 21 +--------------------
>   1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index 768578c0d958..d59c1744840a 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -474,26 +474,7 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
>   static int icss_iep_perout_enable(struct icss_iep *iep,
>   				  struct ptp_perout_request *req, int on)
>   {
> -	int ret = 0;
> -
> -	mutex_lock(&iep->ptp_clk_mutex);
> -
> -	if (iep->pps_enabled) {
> -		ret = -EBUSY;
> -		goto exit;
> -	}
> -
> -	if (iep->perout_enabled == !!on)
> -		goto exit;
> -
> -	ret = icss_iep_perout_enable_hw(iep, req, on);
> -	if (!ret)
> -		iep->perout_enabled = !!on;
> -
> -exit:
> -	mutex_unlock(&iep->ptp_clk_mutex);
> -
> -	return ret;
> +	return -EOPNOTSUPP;
>   }
>   
>   static void icss_iep_cap_cmp_work(struct work_struct *work)
> 
> base-commit: 29b036be1b0bfcfc958380d5931325997fddf08a

LGTM. It maybe cleaner to remove PTP_CLK_REQ_PEROUT in
icss_iep_ptp_enable as well, but if the idea is to bring the feature
back, then it should be good enough.

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>


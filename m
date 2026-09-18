Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB6C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQuk43Brm3omuO2DAekLSRMmNspb8q1ZaXTTwle8fh0=; b=UpNvSZRCgExx6+Pm2pSUaBHSdF
	1a1iksXMlRD66zJF282dByjPXTKmnG/5mB7Cmv8X9hl2nbpbo5APvY/Eh4l+49FEtxVnKxHvhpY98
	LTM3TTTQ/R4j8w5n8otkl+y9s2eTYo0cRRzSnqMINh1PfBBf/hPZ6771fG9x+uE7tsGPvRGW/doy9
	XFNiDMAyJ2hlnB+qWPyOJrsj5vsahqvZaEavhqhAFDWk5yCivfGN8XB6QHksr9afsyIYxucPt85zw
	M//FbzM/TiVESepZM99Vol3dBO3uBbM0/66ADpzE7fcPkHzrE/efGvFkElx1kr0l7qk0bm2vDg2zM
	yDMZglJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ruw-0000000DYJf-2QfB;
	Fri, 18 Sep 2026 06:17:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ruu-0000000DYJU-3suq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:17:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C5DF403B9;
	Fri, 18 Sep 2026 06:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5304B1F000FF;
	Fri, 18 Sep 2026 06:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712268;
	bh=ZQuk43Brm3omuO2DAekLSRMmNspb8q1ZaXTTwle8fh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VIymmGnMspsP0ZCZVY4PL6IoQsRGqoVMe6G9hD5c4ysDDmi8QeeDmXQPdZK8eTdyB
	 qgUXYXI82Snvu3l6r6Xrd3IT1Cm+FUDt2b3R2efOqoj5cvn1ULdyBhzwLSge4tTgWb
	 dZJXHHmNdObQOFAEvE3k6+JsVfbUMPfK7NWXSTvjTJcyhjNRJ+jdAmY3ESeAw8HJOM
	 9gdxrG0r+FrCVnE/y/dcTbbslcYQYtVRzQDU3icXkC11B5bUy2UEnZ32sY1AxsBFya
	 oMeawWzq4mHGu7JgLPbIbAvD/hpyDXAW0Yz2eJ1+AXHlmwucCuieuZETAFHd5ZFpoD
	 VXDSDi/WgJ8wg==
Message-ID: <5b086e1a-8b8c-4536-8b64-e0169826ab33@kernel.org>
Date: Fri, 18 Sep 2026 08:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] dmaengine: bestcomm: use platform machinery to get irq
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260918001835.154305-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260918001835.154305-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 18/09/2026 à 02:18, Rosen Penev a écrit :
> platform_get_irq() avoids having to explicitly map and dispose of an irq
> by having the platform_device machinery take care of it.
> 
> This requires replacing the device_node with a platform_device in the
> bcom_eng struct so that platform_get_irq() can use it.
> 
> Conveniently, this also allows getting rid of of_node_get and
> of_node_put as the platform_device machinery also handles that.
> 
> Adjust the goto labels in bcom_task_alloc to match what is being freed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v3: drop stale description
>   v2: resend
>   drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
>   include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
>   2 files changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 241a91936fe8..1006030ff167 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>   
>   	return tsk;
>   
> -error:
> -	if (tsk) {
> -		if (tsk->irq)
> -			irq_dispose_mapping(tsk->irq);
> -		bcom_sram_free(tsk->bd);
> -		kfree(tsk->cookie);
> -		kfree(tsk);
> -	}
> -
> +err3:
> +	kfree(tsk->cookie);
> +err2:
> +	kfree(tsk);
> +err1:
>   	bcom_eng->tdt[tasknum].stop = 0;
> -

This blank line removal is unnecessary.

>   	return NULL;
>   }
>   EXPORT_SYMBOL_GPL(bcom_task_alloc);


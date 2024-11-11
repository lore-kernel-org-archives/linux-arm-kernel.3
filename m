Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB377D2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/jrxPCxS60J9H/HVOxVW1okcw5BokDkmpW3VCI94iI=; b=Y5fLxh22O+7Fe4xwNF6I9heLJD
	fY1GZoqWVka2m8b3pz2lT4MTVH0QBry2/h9leRjx2hq/d6xlY76Db15/jlF67pQ2KUxCeCNO+nEhm
	IXlI6HhnlufqgUnRzqf+ER9QTN+jArgoNgOGWbYI/JZ9oZMowud3PhS8BG8Wzlgc4pAXMNzBw7K5W
	TQqeWsEspbJF7xUqMtH6AVNxjTeY959r/RWNg/agi40iUrjiWiOoEMs3atfBw+A6H7NIei2F5pH9T
	9O6vK8gXs6zeUfojXz3uSfBDPkB7utNXx5W6DcpSbPeY5tmQGp3rsMAgOafPCoplhJwjf6pfktOO8
	p+QVZoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUsq-00000000EJK-1xX1;
	Mon, 11 Nov 2024 13:55:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUr3-00000000E2w-2kfE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BC4B5C5A30;
	Mon, 11 Nov 2024 13:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7E2C4CECF;
	Mon, 11 Nov 2024 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731333200;
	bh=ge5oa0wYzEMJ7QB+lZ6ggej9jKDVWgoVDWlv5rzge9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YA5O1gyQh3kljoc/vTndzAudVh7CVjwqrznl4tjWw+sqAaO/LLIHElV1SQhhU84fj
	 YL1FSkeoCXx3frSZHkns7PtW0sjBiUYcL3zojU3q4Rsb/Li1YJTqXthbhaZmvaVJNe
	 NJjMaNWrneeLWHvfh8kyPSZBtU33OiuO0FdHevrcylMKN3PZVBFYCdkSTKGP2dX4j+
	 g2oGkXJkBtC/GiwJp3gjJ/pRNZvlaRWap0PkEI8rd83GYidhwuP+SGpJPqXW11nezi
	 9zIDMVCkPKfVtpyokm2+mTPzeykcjQ1vjKq6HlgjO9SEBTqvbb0kuVXNf5LRBfcRzg
	 0cdTK+ay0TnTw==
Message-ID: <f28bf97c-783d-489c-9549-0dd0f576497e@kernel.org>
Date: Mon, 11 Nov 2024 15:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] net: ti: icssg-prueth: Fix clearing of
 IEP_CMP_CFG registers during iep_init
To: Meghana Malladi <m-malladi@ti.com>, vigneshr@ti.com, m-karicheri2@ti.com,
 jan.kiszka@siemens.com, javier.carrasco.cruz@gmail.com,
 jacob.e.keller@intel.com, horms@kernel.org, diogo.ivo@siemens.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, danishanwar@ti.com
References: <20241106074040.3361730-1-m-malladi@ti.com>
 <20241106074040.3361730-3-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241106074040.3361730-3-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_055321_818243_5728F41C 
X-CRM114-Status: GOOD (  23.19  )
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

On 06/11/2024 09:40, Meghana Malladi wrote:
> When ICSSG interfaces are brought down and brought up again, the
> pru cores are shut down and booted again, flushing out all the memories
> and start again in a clean state. Hence it is expected that the
> IEP_CMP_CFG register needs to be flushed during iep_init() to ensure
> that the existing residual configuration doesn't cause any unusual
> behavior. If the register is not cleared, existing IEP_CMP_CFG set for
> CMP1 will result in SYNC0_OUT signal based on the SYNC_OUT register values.
> 
> After bringing the interface up, calling PPS enable doesn't work as
> the driver believes PPS is already enabled, (iep->pps_enabled is not
> cleared during interface bring down) and driver  will just return true
> even though there is no signal. Fix this by setting the iep->pps_enable
> and iep->perout_enable flags to false during the link down.
> 
> Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icss_iep.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index 5d6d1cf78e93..03abc25ced12 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -195,6 +195,12 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
>  
>  	icss_iep_disable(iep);
>  
> +	/* clear compare config */
> +	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
> +		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
> +				   IEP_CMP_CFG_CMP_EN(cmp), 0);
> +	}
> +

A bit later we are clearing compare status. Can clearing CMP be done in same for loop?

>  	/* disable shadow mode */
>  	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
>  			   IEP_CMP_CFG_SHADOW_EN, 0);
> @@ -778,6 +784,10 @@ int icss_iep_exit(struct icss_iep *iep)
>  		ptp_clock_unregister(iep->ptp_clock);
>  		iep->ptp_clock = NULL;
>  	}
> +
> +	iep->pps_enabled = false;
> +	iep->perout_enabled = false;
> +

But how do you keep things in sync with user space?
User might have enabled PPS or PEROUT and then put SLICE0 interface down.
Then if SLICE0 is brought up should PPS/PEROUT keep working like before?
We did call ptp_clock_unregister() so it should unregister the PPS as well.
What I'm not sure is if it calls the ptp->enable() hook to disable the PPS/PEROUT.

If yes then that should take care of the flags as well.

If not then you need to call the relevant hooks explicitly but just after
ptp_clock_unregister().
e.g.
	if (iep->pps_enabled)
		icss_iep_pps_enable(iep, false);
	else if (iep->perout_enabled)
		icss_iep_perout_enable(iep, NULL, false);

But this means that user has to again setup PPS/PEROUT.	

>  	icss_iep_disable(iep);
>  
>  	return 0;

-- 
cheers,
-roger


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A995C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eAkh+9MDHG9RqYKYJgFw2VrMIEyWF85IrttsVxYYoM=; b=D8jLT/Q1nVjo0wW+hb1+e4IJlb
	7+zjk6D87OMMLwGPP9j4FxWunf/rg85W9y6yCcgl9JC0ilrzZ9mFZ0yVtgz3Al3GcPLURkw0mMl+G
	3/GxAiZToUc3JDUUGfWaX0EmtaHsMxTiWZPqrYSR2jdbIpu6WV1NUAYad9oduVDJeRVVgtjBUsQL/
	gtMN9XToljofAX/otl3XorLX1l2XxOuHczWU8TYT+2oWPWZl717RXAt9bjL1qGK4kVD8iL5/hVdGb
	FYHspeDdh8Dtg8k0GMkkq2cLBh/4h5Te4HfRcSThGF6riCNjUpnrHvMv0UJPhsrIpTH2uvfGhDzLJ
	t4ZgJAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAZm-0000000CFWL-3tRR;
	Thu, 20 Aug 2026 21:45:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAZl-0000000CFVo-3Kjo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 21:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C11A413F7;
	Thu, 20 Aug 2026 21:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2E31F000E9;
	Thu, 20 Aug 2026 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787262329;
	bh=4eAkh+9MDHG9RqYKYJgFw2VrMIEyWF85IrttsVxYYoM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PfPjX6h3ZieTA0J/Nb9kfqZSr17Gezj08YfSg1S5PcaqPIB6KU/GaG4isyu8tX0Me
	 fkmYE/sV8fVlvutWgMgUEGIl97m0RAvq43SVvWz8wPX3BhjEJ2C394sfwr3256zkgs
	 dxcm383xc+QmJaCOBj5SeljaQZXTUj50HMJBaVRmYGB1TrXZEJNqnlQKgwNyCcbU4b
	 8qMqapQFSZ7ulaEu3KpfJHdGRkxCIDGT7qv0oEZEuWNgGRex2jvmvIL3sSrpZRqMFZ
	 SaAKmLVQXoWjehV1sImf5pLil1H7pd1QLC5YTzNX18FJEWx75BcsOL2REzCc38vwhM
	 KLyyI31DPDqKA==
Date: Thu, 20 Aug 2026 14:45:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
Message-ID: <20260820144528.7107ba90@kernel.org>
In-Reply-To: <87h5kq1s1f.fsf@jax.kurt.home>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
	<20260817103337.74c30adc@kernel.org>
	<87mrujzzjv.fsf@jax.kurt.home>
	<20260818075335.48936b08@kernel.org>
	<87h5kq1s1f.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 19 Aug 2026 09:35:40 +0200 Kurt Kanzenbach wrote:
> >> I want to use ETF Qdisc with hardware offload, which is currently not
> >> possible on the stm32mp2.  
> >
> > Do you need multiple queues for ETF/normal traffic?
> > Or one ETF and one "normal"?
> >
> > How do you sort the traffic between the queues?  
> 
> So the stm32mp2 has two CPU cores. I've isolated CPU1 for Profinet. That
> one uses Tx/Rx queue 1 with ETF to reduce the Tx jitter. Everything else
> is routed to Tx/Rx queue 0.
> 
> Config looks like this:
> 
> #
> # Tx Assignment with SP.
> #
> # Tx Q 0 - Everything else
> # Tx Q 1 - RTC
> #
> tc qdisc replace dev ${INTERFACE} handle 100 parent root mqprio num_tc 2 \
>   map 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 \
>   queues 1@0 1@1 \
>   hw 1
> 
> #
> # Enable Tx launch time support for TC 1.
> #
> tc qdisc replace dev ${INTERFACE} parent 100:2 etf \
>   clockid CLOCK_TAI \
>   delta 500000 \
>   offload
> 
> On Rx incoming frames are steered via PCP field (vlan tagged).

Thanks for explaining!

> >> It seems like a static configuration in the driver today. I basically
> >> followed the same convention as dwmac-imx, dwmac-intel, dwmac-mediatek
> >> and dwmac-qcom-ethqos. Only dwmac-socfpga does it differently.
> >> 
> >> Tx Launch Time requires a different DMA descriptor layout. Currently
> >> tc_setup_etf() just returns -EINVAL if the DMA configuration is not
> >> setup appropriately. I guess a dynamic configuration requires to change
> >> the DMA config and perform a full release/open cycle.  
> >
> > release/open is not ideal but still better than hardcoding?  
> 
> For sure it's better than hardcoding :). But, again the driver does it
> statically. Maybe there's a good reason for it. Maybe not. I'm not that
> familiar with the stmmac driver. I'll prototype something to see whether
> we can enable TBS at run time using the ETF Qdisc callback. It may take
> some time though.

I think the m in stmmac stand for 'mistake'. 
We need to start cleaning it up.


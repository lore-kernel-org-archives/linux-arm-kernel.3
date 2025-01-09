Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1679E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V7la2Ow0dmMmaXPhyzYEGUuO3tHH+m08W0Z8ZWwrZA=; b=NoQOAf6gPa2pxhhs5PrBBtdsyW
	c69EoS8WCnWo3cOBVFSUNlOrKOKC7GusnRgXvj+0DtpW+Isa+FqD1ldVltjIpjAuvDAaRL4KDfJ2G
	RnWGBGIXGn/oBc4cWlHZ4hcYmzDxYdUkNhS5Epu5S6TwASPwxw+DEy46wUvTO8oeP814/fNSVl2VT
	+ssrUxWg+aH7imtEJbViFasEAbGWlbBuL+EVI3ZXOs0fLGK18gmGnNs7wVNNohTS7o3Ct0amgo/hO
	WITmCvZv8+xZ6x+1XTglUV8Qj2ExZJOYoooCNN9tLWzWuoXoZ0U7Im3J0RZdZaQ3v1hy7FKqe1kXT
	F7UuQlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1v3-0000000DYN3-072Q;
	Thu, 09 Jan 2025 23:26:29 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1t0-0000000DY2V-0SUO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 23:24:23 +0000
Message-ID: <5b819ac4-a282-4413-aa45-356563550198@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736465059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7V7la2Ow0dmMmaXPhyzYEGUuO3tHH+m08W0Z8ZWwrZA=;
	b=jHjHdouV9m1wON/w/VN2qk2cwYN9hSBt+dOM6o6IC8nRm39mMpwrvsZmqFts3iJb52/Hra
	Oj7Z5+07NG9FYx6Wms7UNHr+5bwxjzotbABllcYJyyBjtGn0imQTvGXt+jiqKnl6kYNQi0
	8ITiiMuErzJeGJJ3LNMOLRXnxTpNZ14=
Date: Thu, 9 Jan 2025 18:24:14 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net v3] net: xilinx: axienet: Fix IRQ coalescing packet
 count overflow
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Shannon Nelson <shannon.nelson@amd.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andy Chiu <andy.chiu@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109224246.1866690-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250109224246.1866690-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_152422_436070_8FB4320F 
X-CRM114-Status: GOOD (  18.02  )
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

On 1/9/25 17:42, Sean Anderson wrote:
> If coalece_count is greater than 255 it will not fit in the register and
> will overflow. This can be reproduced by running
> 
>     # ethtool -C ethX rx-frames 256
> 
> which will result in a timeout of 0us instead. Fix this by checking for
> invalid values and reporting an error.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
> ---
> 
> Changes in v3:
> - Validate and reject instead of silently clamping
> 
> Changes in v2:
> - Use FIELD_MAX to extract the max value from the mask
> - Expand the commit message with an example on how to reproduce this
>   issue
> 
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 0f4b02fe6f85..c2991aeccf2b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2056,6 +2056,12 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
>  		return -EBUSY;
>  	}
>  
> +	if (ecoalesce->rx_max_coalesced_frames > 255 ||
> +	    ecoalesce->rx_max_coalesced_frames > 255) {

The second line should be for tx and not rx.

Will resend tomorrow if no other feedback.

--Sean

> +		NL_SET_ERR_MSG(extack, "frames must be less than 256");
> +		return -EINVAL;
> +	}
> +
>  	if (ecoalesce->rx_max_coalesced_frames)
>  		lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
>  	if (ecoalesce->rx_coalesce_usecs)



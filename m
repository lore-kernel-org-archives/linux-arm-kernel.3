Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDhOomFDs/ZZD4vuslnbojv48ZyhcN8z335ldHPO6ds=; b=ZNuwJIUO5Y1e+0I/ncZvOBoTa1
	kbhC9h93LnUw8xX794ZGOXXjICSoUdXho5vbTFnQ+W1ZE0MhtQ+5rX0VgOJ1g9tcBTt++EYV36A2d
	+1gjlvt+77TQA8gnvxyq3au5sDJv9AT1s5wUoq4Mm6Esl9MD/tTtUfCshL7myavAYtvaZFmv5JebE
	a5b8kOawiW744BrGf5Lbot3aMXM6vxqFNR6anUT3gGC+qV675sEqX+q4QnV6BhshM/BaqN2HK1L7x
	RcmF0ArAYrM8uYzY/zFLtyWe4OJcpdxdvlsQ/YK6izKVnkTAngZtycsvTxtlk55RdHlARm+ObzJh0
	+Mt4OBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEEp-00000006Pc8-0TgN;
	Tue, 08 Jul 2025 19:44:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDB5-00000006GCZ-1WNt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EED1AA4B8B7;
	Tue,  8 Jul 2025 18:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596DAC4CEED;
	Tue,  8 Jul 2025 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751999785;
	bh=+wDb55masaQIrXES/8KNFPSYi1OWO4Ce1wHyf8x2E3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xqmk7XTCw1qNIQ2m/Hqs9+1DvdsIJ4F/i75HixRU7hFnqttwm4nuZQsAeEhygK6cV
	 XP+fCojM3Hs024mlSotVfbp5cbSZVTg+WYQ99s+F3Mi0eSQHHBPmUc60I088hGissc
	 DvzjpoZl8QA99MtF3sUrdD/uhhGPNC2xomBd7JlJon9V20bqc65dy48bd/lDlroEBL
	 HOTwtkBEyOAtOHxeL8PsU9m1FfUxMr5ztBs/qI8EHMZ+NBsjjLq5ruzTEpwDbEUVAG
	 hFv/sU65r4BfXuJKFDnWkrFYe7DCHSj+Gjcx3KOdpRwncCbSCdzeTOxTQ8hS2I5nNW
	 ynxBQTkFTeKlQ==
Date: Tue, 8 Jul 2025 19:36:20 +0100
From: Simon Horman <horms@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
Message-ID: <20250708183620.GV452973@horms.kernel.org>
References: <20250708103516.1268876-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708103516.1268876-1-h-mittal1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_113627_532345_2B953D45 
X-CRM114-Status: GOOD (  22.79  )
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

On Tue, Jul 08, 2025 at 04:05:16PM +0530, Himanshu Mittal wrote:
> Fixes overlapping buffer allocation for ICSSG peripheral
> used for storing packets to be received/transmitted.
> There are 3 buffers:
> 1. Buffer for Locally Injected Packets
> 2. Buffer for Forwarding Packets
> 3. Buffer for Host Egress Packets
> 
> In existing allocation buffers for 2. and 3. are overlapping
> causing packet corruption.

Hi Himanshu,

I think it would be useful to describe the old layoyt, or otherwise
how the overlap occurs. And contrast that with the new layout.

There was a minimal ASCII diagram of in prueth_emac_buffer_setup().
Perhaps expanding (on) that would be useful.

> 
> Packet corruption observations:
> During tcp iperf testing, due to overlapping buffers the received ack packet
> overwrites the packet to be transmitted. So, we see packets on wire with the
> ack packet content inside the content of next TCP packet from sender device.
> 
> Fixes: abd5576b9c57 ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>

...

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c

...

> @@ -297,43 +301,60 @@ static int prueth_fw_offload_buffer_setup(struct prueth_emac *emac)

...

> +	/* Configure buffer pools for Local Injection buffers
> +	 *  - used by firmware to store packets received from host core
> +	 *  - 16 total pools per slice
> +	 */
> +	for (i = 0; i < PRUETH_NUM_LI_BUF_POOLS_PER_SLICE; i++) {
> +		/* The driver only uses first 4 queues per PRU so only initialize buffer for them */

> +		if ((i % PRUETH_NUM_LI_BUF_POOLS_PER_PORT_PER_SLICE)
> +			 < PRUETH_SW_USED_LI_BUF_POOLS_PER_PORT_PER_SLICE) {
> +			writel(addr, &bpool_cfg[i + PRUETH_NUM_FWD_BUF_POOLS_PER_SLICE].addr);
> +			writel(PRUETH_SW_LI_BUF_POOL_SIZE,
> +			       &bpool_cfg[i + PRUETH_NUM_FWD_BUF_POOLS_PER_SLICE].len);
> +			addr += PRUETH_SW_LI_BUF_POOL_SIZE;
>  		} else {
> -			writel(0, &bpool_cfg[i].addr);
> -			writel(0, &bpool_cfg[i].len);
> +			writel(0, &bpool_cfg[i + PRUETH_NUM_FWD_BUF_POOLS_PER_SLICE].addr);
> +			writel(0, &bpool_cfg[i + PRUETH_NUM_FWD_BUF_POOLS_PER_SLICE].len);
>  		}
>  	}

It is still preferred for Networking code to be 80 columns wide of less
unless it affects readability. checkpatch.pl has an option to tell you
about this. And I think that it would be good to apply that guideline
throughout this patch.

E.g. for the for loop above, something like this (completely untested):

	for (i = 0; i < PRUETH_NUM_LI_BUF_POOLS_PER_SLICE; i++) {
		int cfg_idx = i + PRUETH_NUM_FWD_BUF_POOLS_PER_SLICE;

		/* The driver only uses first 4 queues per PRU so only
		 * initialize buffer for them */
		if ((i % PRUETH_NUM_LI_BUF_POOLS_PER_PORT_PER_SLICE)
			 < PRUETH_SW_USED_LI_BUF_POOLS_PER_PORT_PER_SLICE) {
			writel(addr, &bpool_cfg[cfg_idx].addr);
			writel(PRUETH_SW_LI_BUF_POOL_SIZE,
			       &bpool_cfg[cfg_idx].len);
			addr += PRUETH_SW_LI_BUF_POOL_SIZE;
		} else {
			writel(0, &bpool_cfg[cfg_idx].addr);
			writel(0, &bpool_cfg[cfg_idx].len);
		}
	}

...

> @@ -347,13 +368,13 @@ static int prueth_emac_buffer_setup(struct prueth_emac *emac)

It's probably out of scope for this patch, being a bug fix.
But it seems to me that there is significant commonality
between prueth_fw_offload_buffer_setup() and prueth_emac_buffer_setup().
It would be nice to consolidate the implementation somehow,
say in a follow-up for net-next.

...

-- 
pw-bot: changes-requested


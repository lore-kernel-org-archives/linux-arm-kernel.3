Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ED6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00Gzf353kwdb1ZwQdVZ5r/R1yScWtg1pxdKWd+hUbQI=; b=tWc91D8kuPflm8WnhfmsUswIc8
	vD/vcttfdvsmj1tioejZgEOWjWvEqej3sKxTilWvFfAXEmr9jlAlZ6hd1dgWBy2kjQIvcAKhrtxRJ
	4p0sLzmfsFdy8gl+ssx8tnIxhv9se6pipZWWIhmkt+wEU1tnNd5GDIBpQ/txbrAUsDQZeUbvvDfyR
	+ogYwlO3TUYBYZ4riB9TAxtBFFZICm5gLxLFbugkd07rGBsS0xSB2x5WUPQAuIHP9IKZnLC2xQw4Z
	yP7AsI5OwcmagoZ8xARzvu9V9VMFpieX7K6DjyhmAsPtvLnHIgzxkul8Qypq+tyvvH0nwfNZ5Cd91
	mjd66qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFbU-0000000GIap-1Rwm;
	Tue, 05 May 2026 13:14:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFbQ-0000000GIVX-2Nzv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:14:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44e1860558fso1520320f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777986858; x=1778591658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00Gzf353kwdb1ZwQdVZ5r/R1yScWtg1pxdKWd+hUbQI=;
        b=WCaREu0awKQs9hmc5Bc1+hoHJfEXcO9GImHmhw/y7M2Yl53EumcRn2x7vBwolDRUfr
         wda6plxgbYLHzUuFCN1UdykcE4uj5qcODWfN97It6mTidyoW4oMx5Xy+n+QFmj4R1DR0
         j+zhiFAhE/0IE7jl8quHQdJsGbyBjgDKpK3Xbjra6xg1q3Fv3wpQxY3nRQGjK1KaozwR
         iMoAVLnaP+WH0Zl+Y3qOFxn6zAiupa/478E1gfhMggs0Wt54a3ZQ8DKLnr2YQON+S/vy
         FPWDYR9WwEZ5KX7PNx43aOWrQUfTqXvjj2VKfithaEWPVrRI/OlPBw6L+2fy4rdDJveR
         JXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986858; x=1778591658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Gzf353kwdb1ZwQdVZ5r/R1yScWtg1pxdKWd+hUbQI=;
        b=J0LCVvYmaMfyichQu4oCWvfn9avtVuCE/bShWlH9yCBMP8Wkzm871Q0SSk8g6/hR9E
         CR4MZ0dgBQ7icrmTh2oCz+d013QW6/7VkiaCmr6LxTVW8snVwN7Cy4krgNiLsIbrjBe4
         1DdNpqxY+auxpkRMl9Buw575HWe2cO++fib8sUx7ngeb54lEdz2d3wbBnrs8tYuBfWIP
         TwyhaCymonP/drX32kl3PKAXaRfQSMokPO6MNv5m30RYrHCG4AbU2sry4LZiq8vwyRVH
         Xp6VZ/94ElnkOpqV0VcNeZgqciiXipN4wLmI1dYmU5S9YuW8/htdxTnDVan37QZVMw91
         hkig==
X-Forwarded-Encrypted: i=1; AFNElJ/4VHbVakrKY1fGXqhuhuZUjz6cK5g2fxjGk0pYo6A4TBC2nd3D4OpnFre9rjtcF/zOUu74MHeeuIth74MvPrkn@lists.infradead.org
X-Gm-Message-State: AOJu0YxxV4GHist8rtV/Fbw+7CHVbGivPOd8LsUKYYjfuQFL5mQRAKyj
	fB2lVUAMo3yflAT79NxgBdjC19OsA1LJEESmKrppJpzsq9OzoF42BhR0y6X0mu60E2E=
X-Gm-Gg: AeBDievxCywZhcpU9iQYAMFkmEJwra3igSRLPrWkVHNALQMkaEZFhwkAk8zCU8d27MP
	L0GfIlz+T8Qq8G6Mm10GLfiLfTjbdt0RdDKDyEXmVxWZka6DNqUv2hAuS/WivRL/kA26DVSlsrT
	1p2AylTP0YGSHotXya5yFiI79PamgCiWQLHLslGraKk8fAUmIUo6Z1KQIEmQbbQm6mppZ9zL5fi
	cXMN0xZ5fbMpISuftzTcdEyBtbytCfSYa+bH93rAdKu1kd1FkbCbbDSNgQM5yEtlJZWccOsj5AW
	YKX3StvlzXtllWgjdZ6fZGLGZ0x9LD9rX6Zk+e7EzvvLb3whCLSx/66xh8w4BE9QkONl1oQ2oe/
	r9vqZA53I8R7mwF12IludHmQO7rtd+PUo4F1RUGDjR3tcG7DGk3Bsq3zA5bJkOKFtR510vWqfsp
	w2NE9C/OWY2lXwpR/ewyPfcB3tuRCMuPMR9EE15xtlCwu5cz8O6Tr+igrzisfmkRwOQNemFTY6y
	TTxcsY=
X-Received: by 2002:a05:6000:2911:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-44bb67cf042mr24716352f8f.42.1777986857973;
        Tue, 05 May 2026 06:14:17 -0700 (PDT)
Received: from localhost (host-79-47-155-212.retail.telecomitalia.it. [79.47.155.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4932144f8f.28.2026.05.05.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:14:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 5 May 2026 15:17:33 +0200
To: Lukasz Raczylo <lukasz@raczylo.com>
Cc: netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [RFC PATCH net-next 1/3] net: macb: flush PCIe posted write
 after TSTART doorbell
Message-ID: <afnt7Txq23RafQUF@apocalypse>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <3106d546d494f2f52ec832e7f7d04f534286e254.1777064117.git.lukasz@raczylo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3106d546d494f2f52ec832e7f7d04f534286e254.1777064117.git.lukasz@raczylo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061420_635185_632E02F2 
X-CRM114-Status: GOOD (  33.86  )
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

Hi Lukasz,

On 23:38 Fri 24 Apr     , Lukasz Raczylo wrote:
> macb_start_xmit() and macb_tx_restart() kick transmission by
> OR-ing MACB_BIT(TSTART) into NCR.  On PCIe-attached macb instances
> (BCM2712 + RP1 PCIe south bridge on Raspberry Pi 5 is the setup we
> have in front of us), writes to NCR are posted PCIe writes: they
> are not guaranteed to reach the device before the issuing CPU
> returns.  If the TSTART doorbell does not reach the MAC, no TX
> begins, no TCOMP completion arrives, and the ring remains
> quiescent without any kernel-visible indication.
> 
> Note that the raspberrypi/linux vendor fork carries a local patch
> around the TSTART site (a queue->tx_pending breadcrumb that is
> promoted to queue->txubr_pending by the next TCOMP interrupt,
> triggering macb_tx_restart()).  That workaround makes the loss
> recoverable under traffic, but it cannot help if TCOMP itself is
> not raised because no TX started -- which is exactly the case we
> are targeting here.  The handshake is not present in mainline.
> 
> Add a read-back of NCR after each TSTART write in macb_start_xmit()
> and macb_tx_restart().  The read is an architected PCIe read
> barrier for earlier posted writes on the same path; it ensures the
> doorbell has reached the MAC before the functions return.
> 
> We do not yet have direct hardware evidence that TSTART is being
> lost on the RP1 path (that would require a PCIe protocol analyser,
> or at minimum a before/after counter on queue->tx_stall_last_tail
> with and without this patch applied in isolation).  This patch is
> one of a three-patch series ("candidate fixes for silent TX stall
> on BCM2712/RP1"); see the cover letter for context.  We have
> verified the series compiles and applies cleanly against mainline
> HEAD and against raspberrypi/linux rpi-6.18.y @ f2f68e79f16f;
> runtime verification is pending.
> 
> Link: https://github.com/cilium/cilium/issues/43198
> Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index a12aa2124..b6cca55ad 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1922,6 +1922,13 @@ static void macb_tx_restart(struct macb_queue *queue)
>  
>  	spin_lock(&bp->lock);
>  	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
> +	/*
> +	 * Flush the PCIe posted-write queue so the TSTART doorbell
> +	 * reliably reaches the MAC.  Without this, the write can sit
> +	 * in the fabric and the MAC never advances, causing a silent
> +	 * TX stall.
> +	 */
> +	(void)macb_readl(bp, NCR);

Do you expect it to be a temporal issue (in the comment you stated that the write should be delivered
before the function returns) or is it just a dropped packet error? In the former case can you please
explain why? If it's the latter, I'd expect the dropped packet to increment the counter in the AER,
and I'm pretty sure it didn't when I performed my tests.

Many thanks,
Andrea

>  	spin_unlock(&bp->lock);
>  
>  out_tx_ptr_unlock:
> @@ -2560,6 +2567,11 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  	spin_lock(&bp->lock);
>  	macb_tx_lpi_wake(bp);
>  	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
> +	/*
> +	 * Flush the PCIe posted-write queue; see the comment in
> +	 * macb_tx_restart() for the reasoning.
> +	 */
> +	(void)macb_readl(bp, NCR);
>  	spin_unlock(&bp->lock);
>  
>  	if (CIRC_SPACE(queue->tx_head, queue->tx_tail, bp->tx_ring_size) < 1)
> -- 
> 2.53.0
> 


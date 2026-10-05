Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1EECA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV9congHlVCrHEqybgP75xi1HGXEwIeAsocmSQkvZMs=; b=dxhTLBNqUGEP3ICjwnX8H61ATh
	1RharNcvY0Rz4tfWePeW1v8ttW+XB0ueHGtq4wqCfmT3GOzq51gE3JIwCcDiiGD3r2wbKPNTfs6ZA
	vQZKj224TMT4wFF3jnGRtSRLVtYuwDq6jTR9ZEDwy0cyXAbuOokqypKTwe7ZwSTemg15qJtogmhPq
	hZGghIifw7YHnFNPAa6mI0qfO0JtpqNahl1m9VgvWEn2MTN1MAiIIEqvhg1+C3frFb8ZYQgZ8Odot
	mZzZsBgCrYiUARvzyBJizwYkt0cn1jeIw0v8GVIvpfB1etW9lhdQ2SHGBHgPDAWh4U4M0t8zxllan
	86auzLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsJH-0000000HLTh-2Jdl;
	Mon, 05 Oct 2026 23:41:31 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsJE-0000000HLTC-2MVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 23:41:30 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1101699a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791243687; x=1791848487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MV9congHlVCrHEqybgP75xi1HGXEwIeAsocmSQkvZMs=;
        b=RvxvdADPTtPpaJsLZHiBzrDgDInrTP+nfv5hBv9IGsbznCyNeT0l+BNseOpqzGd7v2
         erpLRvHUTxkD8ybbj/D9IZB+tAkSapJMjbyqM1tr0V5CpcN3XC5TR+4Pg8Hvbo3lSsIf
         Q5oq9iZy0C9/aBZpcwk7mGCFMHULOq+gHiYaMRg22oja650I7P2DR6kjiRimAV3MOsAw
         bCBTCfKl4vRGY9jhnDDt79YfisZJLLAVmM32jTcfdzymImXvghNaqQZh2ui9eFCPRQqz
         kXmnsQIPxkczYzvHgoQwkkGaqcSao3U7zCYXjAvgMAdThAXrul4U0gL5TMzVQdBBLPUd
         my+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791243687; x=1791848487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MV9congHlVCrHEqybgP75xi1HGXEwIeAsocmSQkvZMs=;
        b=HRKN8LzTFfYCsK2a8/ZPOjO3GFRiyZmHqParjNiofPxFxBR4wzseC3mOHSmx79aSJC
         Hms8jfo+AKtRyQ5yucV54e2DRFotrbqKKufIP8KHK7r3FR0U/48uZWLp7rsJ446t7Q25
         Pfw+eB0FwCCsPNWvxiJA44ND81ckqCDL2nhmVznJeLlDSyvM0b89smmwPjmmDyT25+xG
         L78xcEFkguWx5kCa51U6Fj4EA6or1K61oINl02XDsxWv+xnslVgh7Z60K27lTCsVVXbN
         3yCoqqSmbdBvL5ft6rDXE2pO++CZC16OnC9GNfz1hlSIL5aniJPJXiJ2ld3XB4GUjRr+
         YHGA==
X-Forwarded-Encrypted: i=1; AKwUvBwJLxX4d3ydCvct3xABh9QI1lDkyhayMvvgqrns6rKIuSrTl/7VLZaZuDUbyA7ycYUUackLMWgrRUerFuxAwi8Q@lists.infradead.org
X-Gm-Message-State: AFq9FYJr1537ljVpPVmg10JuBsBGPTqzUqt3zGXxJJ6EXBMPOEA5m3tG
	fgN2DHSGAN7L9Erkr/5VMu9chYB3BFyUNv1PgQkUETUssVRQl/HU6r8IP3Hae69cnpg=
X-Gm-Gg: AYBFou2mFnni/AZuowis8Ng2qck8OWduChKdsLuqw3hQLDSoQTjcrZ6sbxXcfsR9YhL
	C8MQa/9k9AXNHlOl8dJIXHOanvM4hUyjZ0moMXqXafwhd0yQft4rdB9GcRxSpWGu2r6Fzt+Oma9
	SKFSBE7S3c/EeF79kVEoiifKkrzLaPrkDRCFDU+uuf68aEcWltkVC2SR2RB59x/u29VzHZKKh1s
	ZT35Xhd2Z3/vXTo+SWDgVwi55tjxDQlxBQCObvcgmwqD+4wTIvClwd3HvEO4mezZQF4xHi5eT0X
	SVVMczXjuw86hqvcSNHOnqTvhXACn+Xy38akwVe3tdn00vE1N0y4ifQj5J4wu+5QoxlJzqqxR4z
	NZgDp3pHs1xZ2n4AIFjRS8cqtmejLHDCXOpQZp2JHTOT+Uu8uAW9/yaaavX9cyAIK4LUsMFbDDy
	hDS9aImWugvNQy4kHYT4AjNjiYAQECuA+/FvQAh7ZhfdxVPGH1npEV5jmscEmkcS591D+//G3RR
	sBK6vJHJXZuf866hfkrwoM=
X-Received: by 2002:a17:90b:5805:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3a6ce6e6756mr7887037a91.19.1791243686911;
        Mon, 05 Oct 2026 16:41:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8211b74c8sm2765205a91.0.2026.10.05.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:41:25 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:41:24 -0700
From: Joe Damato <joe@dama.to>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	daniel@iogearbox.net, jacob.e.keller@intel.com,
	suraj.gupta2@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, daniel@iogearbox.net,
	jacob.e.keller@intel.com, suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004083759.1016519-1-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_164128_929312_4664657E 
X-CRM114-Status: GOOD (  29.10  )
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

On Sun, Oct 04, 2026 at 11:37:59AM +0300, Sagi Maimon wrote:
> axienet_dma_bd_release() walks the RX ring to unmap and free every
> receive buffer before releasing it, but frees the TX descriptor ring
> with dma_free_coherent() alone.  Any descriptor that
> axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> its streaming DMA mapping, and both are lost.
> 
> axienet_stop() disables TX NAPI and stops the DMA engine before calling
> it, so nothing reclaims those descriptors afterwards.  Bringing the
> interface down while frames are in flight therefore leaks up to
> lp->tx_bd_num skbs and mappings each time.
> 
> Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> every descriptor whose cntrl is still set - axienet_free_tx_chain()
> clears it on reclaim - and free any skb still attached, as a drop.
> This relies on axienet_stop() having stopped the DMA engine first, as
> the RX walk in the same function already does.
 
[...]

> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Assisted-by: LLM sparse
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caught a
>       NULL tx_bd_v from a first open; after a close followed by a failed
>       reset the walk would have read the freed ring (Sashiko).
>     - Reword the comment on the skb free: a descriptor can complete after
>       TX NAPI was disabled, so "never transmitted" was not always true
>       (Sashiko).
>     - Say in the commit message which hardware the test ran on.
>     - Kept Jacob's Reviewed-by, as the changes are small; please say if
>       that is not OK.
>     - The hardware test is v1's.  The changes since only affect the
>       failed-reset paths, which it did not exercise, and how the freed skbs
>       are accounted.
>     - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon.sagi@gmail.com/

[...]

> 
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 09443623a3e2..c88c671f8b2d 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -186,11 +186,34 @@ static void axienet_dma_bd_release(struct net_device *ndev)

[...]

> +	lp->tx_bd_v = NULL;
>  
>  	if (!lp->rx_bd_v)
>  		return;
> @@ -221,6 +244,7 @@ static void axienet_dma_bd_release(struct net_device *ndev)
>  			  sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
>  			  lp->rx_bd_v,
>  			  lp->rx_bd_p);
> +	lp->rx_bd_v = NULL;
>  }

The added null writes makes me think that centralizing this code and using it
from both axienet_dma_err_handler and axienet_dma_bd_release (instead of
repeating it) is a good idea like I mentioned in the last post.

The code seems right tho even tho I don't like duplicating the logic.

Reviewed-by: Joe Damato <joe@dama.to>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C10FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1bk2EU/D9te5qb656u67tT8QWc8LP721IAfJA7T8gw=; b=NFDPqtnWxGDvfNekEfdBQ2T1ev
	qLmF3q4AT2bwfPG2Dzof8dMy5OUw0tE/jpEEdPi0TFXRJVtMnYMGppEY+ny3cysiDKkZfsDFGuqoc
	wwWjHYRVQBLcxjhV5//zjRDRyq/AGHMeP0RwlKDOgPK+dlDcDxYyk5PSBrtZSvi6RigLQUyi27UlT
	4/Osvv+TV6+6LrT3GW853UZbCCNjdFj5BAOyu5yUmniw2Us/eLQ/hen1sV3cIzBJsMuqwjA1F99U3
	Nf8xq1uqDKKawRsPhUklHkuPgUNp1sV3qiXk10IAyLT2twOgxtqz3u3pyiYYUqJGXdnkhICf9iLbx
	QnTcrG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zil-0000000Ejs0-2cyW;
	Fri, 18 Sep 2026 14:37:47 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zii-0000000EjrP-463V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789742265; x=1821278265;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cT9MZUefqqkKw7WHWzzp8+aaN83F67m383N8MtMYnbw=;
  b=jKEVTa5H+5PcUCkKxdRiP4EPO++0WWzK1S9mcmHqxPp+0HnJ0I0ucxYt
   E2dVjd5N3K04/Q1XlqtWOVYDnSm1c5HEj/q9oYRG0LA4HxIcDAfJ0UjBL
   wwKwpCCUIoJFmKIsJ82qxiuVWmQaGau0FXPiNJ0Vq9fZ3kjmwSiF47li9
   X4OqXK36sczn9kk8i4QWb90pBHVVGPkT6E8O8kbrTTQiCIhSKHbHpzrYz
   aaK9QmiovVRWbHw6AoT0fHiQ+Vw2M0FNOOOENn1vZctdxWajWWXs1/1zd
   UglRcnhSrbCzepZ797zpQ6C4VNPt85YxO27Abidx49reGcH0I5yJoHqdM
   A==;
X-CSE-ConnectionGUID: AGUZEmC4TCiqZfUsIa9rmA==
X-CSE-MsgGUID: Kc0JV2aFRyKj/X/hv10xqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100850522"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100850522"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:37:43 -0700
X-CSE-ConnectionGUID: 3Vkr41R3Tu+QsrJlbrlgVg==
X-CSE-MsgGUID: a9tY0WWmS7ioSf8PSh08gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270737077"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.117]) ([10.125.109.117])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:37:42 -0700
Message-ID: <8616f55f-9703-42d3-8d3e-7fdfb6a8a5ff@intel.com>
Date: Fri, 18 Sep 2026 07:37:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_073745_032502_FFB0E78C 
X-CRM114-Status: GOOD (  15.64  )
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



On 9/18/26 7:16 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/idxd/sysfs.c  |  5 +----
>  drivers/dma/imx-sdma.c    | 15 +++------------
>  drivers/dma/ppc4xx/adma.c | 29 +++++++++--------------------
>  3 files changed, 13 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350..2b0524324089 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1095,10 +1095,7 @@ static ssize_t wq_ats_disable_store(struct device *dev, struct device_attribute
>  	if (rc < 0)
>  		return rc;
>  
> -	if (ats_dis)
> -		set_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
> -	else
> -		clear_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
> +	assign_bit(WQ_FLAG_ATS_DISABLE, &wq->flags, ats_dis);
>  
>  	return count;
>  }
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 36368835a845..b8a91a0343b5 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -710,20 +710,11 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
>  	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
>  	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
>  
> -	if (dsp_override)
> -		__clear_bit(channel, &dsp);
> -	else
> -		__set_bit(channel, &dsp);
> +	__assign_bit(channel, &dsp, !dsp_override);
>  
> -	if (event_override)
> -		__clear_bit(channel, &evt);
> -	else
> -		__set_bit(channel, &evt);
> +	__assign_bit(channel, &evt, !event_override);
>  
> -	if (mcu_override)
> -		__clear_bit(channel, &mcu);
> -	else
> -		__set_bit(channel, &mcu);
> +	__assign_bit(channel, &mcu, !mcu_override);
>  
>  	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
>  	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..39b1c4fd9ca5 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -350,10 +350,8 @@ static void ppc440spe_desc_init_dma01pq(struct ppc440spe_adma_desc_slot *desc,
>  			 * of the transaction (src, dst, ...)
>  			 */
>  			iter->hw_next = NULL;
> -			if (flags & DMA_PREP_INTERRUPT)
> -				set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -			else
> -				clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +			assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +				   flags & DMA_PREP_INTERRUPT);
>  		}
>  	}
>  
> @@ -508,10 +506,7 @@ static void ppc440spe_desc_init_memcpy(struct ppc440spe_adma_desc_slot *desc,
>  	desc->src_cnt = 1;
>  	desc->dst_cnt = 1;
>  
> -	if (flags & DMA_PREP_INTERRUPT)
> -		set_bit(PPC440SPE_DESC_INT, &desc->flags);
> -	else
> -		clear_bit(PPC440SPE_DESC_INT, &desc->flags);
> +	assign_bit(PPC440SPE_DESC_INT, &desc->flags, flags & DMA_PREP_INTERRUPT);
>  
>  	hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
>  }
> @@ -2136,10 +2131,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_mult(
>  					chain_node);
>  		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
>  		iter->hw_next = NULL;
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>  
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
> @@ -2221,10 +2214,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
>  		iter->hw_next = list_entry(iter->chain_node.next,
>  					   struct ppc440spe_adma_desc_slot,
>  					   chain_node);
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>  
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
> @@ -2246,10 +2237,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
>  					chain_node);
>  		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
>  		iter->hw_next = NULL;
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>  
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;



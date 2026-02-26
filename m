Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4583FFD9E02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ln/7jOAd0mq+qmA6pTYKQmtpks7jHYiU+Gg/M2EOX0w=; b=VNMzmtTiWmBKJ2+9LA7FM1sxqk
	WsxSqEhMWCTEaHdhGYlkZgFf79GfCSbmsNClplrlnTKmzZnu2OwwgW/oAIu7h+0yzcOE9AoKVTRzT
	rAisLnnJzawdClY4yKiqzt6Slar5fFMW7vfy7ZaRtsoWO25wkobgCvTtF8ex5v52QMgKC0qhbjL46
	caXOoeosT1KyP494yzisVcGLMgaOFdN49SL9tCnT+Q0hPIIVkNL228Pime9aJhaMiVFjEUrwjve78
	7XSd/pCfZkZjSxZECNb1dOrPmaqQ/p4ecSzGq9dyYucKJ1YSH8HDyYqAfmE5GTu6Tw2/ppF+hQVBG
	oKpR8Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhBp-000000075rm-07kM;
	Thu, 26 Feb 2026 19:38:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhBm-000000075qI-0KWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 19:38:23 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a1086f63c8so1118632e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772134699; x=1772739499; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ln/7jOAd0mq+qmA6pTYKQmtpks7jHYiU+Gg/M2EOX0w=;
        b=auILZwS7GVh6gXbzR7D9GFjsosxtwSafJuZGGmGaJQ0rUBDOY+oghJIEAJBfUs2nUp
         6yLfwaQ4v72QQ2gjGuVWO30C6AFIgy0ON+tt13yrfs1zkanY5SAO6Gzk54O8663/bJfl
         mA3ZbKKiDLRCrGDduOgIDflTYbz9v0ukZwGbwV84IqytOi92iOf+qFynuJfKsbZeO0GM
         fXzqlhklfj/wAziemOhZXzZNigDShaCCQJmTJnKK2d83YJTA00ut1BTzO/iyg1U3pNHw
         NhP+XB3CxKvRewSVtXsVFUwei/+ercWJY9ftZaR9xEP/OiRmN/6dnTa+kEBsMU/QRZkt
         ENFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772134699; x=1772739499;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln/7jOAd0mq+qmA6pTYKQmtpks7jHYiU+Gg/M2EOX0w=;
        b=F4brf6oYWaBHLLyYi0OlJ6xH0exMN3vX43Bhwa/noZxAckJ7Yyg/4RLKBKGIw2P3MA
         FRNa8N/UhlNusz1yiGWX64PXIYgxRM5ggn0UQ8mDSuz7pKCGqDPCdJvyLFrOWiHivwDs
         Z7AB8VoDQEEAnNJJHmUJzMdlSHGBvGu2sY4WEBZOw108kDlF/cI+0bd9Do41azag46mY
         wCKqf7aiANcDTdAJ64Rzbo4VRcT4eR9K5+7h/9fWW0z5+LDARJjyRHJ2RD29NRHRxPDX
         JJpMYiSLd5PU7Wn465ZECfq/miS348R4P8Ns4rhmgNMbvHEDmqQWObRIz1HPj4Mwyx7U
         JpPg==
X-Forwarded-Encrypted: i=1; AJvYcCXKz2vW50YWp5Y1pMHTYvkYEy338N+VN1h6VkyA+THHOc858OZ0OoVUGtJ+3iR1y99CuqvkLiezCvi+eCZZOggh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx0AzKUH78MtBASuMOF1Qr0e0qjm/0ylL+6jigNoEVaMi+YFMa
	QsgYw93uSPbaKUvrlvciYVteUYIII9c7kjtGvN7k17SBi1Ly+I0ZBzTH
X-Gm-Gg: ATEYQzz2Lc3g2/sX5I3vd817VKAFVUHtJksfEzY3vrE7SPIRnjVaFSvuOATonQ17aYl
	OMKoaHfHZmMsFg6dDMp48N/fQh1EypHK3W61QCKwk5BQ1Jn4BXf45JyOjQehojfOYvED8wOQj2P
	eENlYSJwhCQBYZUDG0ukSGTbFDW9LUyWpAtoaAn+m8j6EbZR+/1zrUW7muOUXg3a6Xj9yCe+ew1
	b1FKW9CUcdKsKoo2WZdCz4AcDBjGvdzAzb29Ydb0xTc2nGiK8e2ueya4XwhJLN1YohNS6ap0MYo
	RtVbRz3TGKMBrMTXwMHz/dp56xQnIdPMwGZjihSyBeEZYoPIsJUinYgXCeIpKH6crUJL4DkrSmG
	nzziEDy8Y7taGJpqRtwPlRt1XVderz7rpz+AgUbDVIb8HhNqYHBcgN01oYkJDqc+2GqQbfnxtMl
	jKGKxCMEj2Q3c+95kPFyQsBJZJoryILRrhUtrglTqT1sXX6mwYr/q2aEZvknxmJ4v2va8+Qrw=
X-Received: by 2002:ac2:4f0d:0:b0:59e:5fc4:26b2 with SMTP id 2adb3069b0e04-5a10ff299f2mr101372e87.0.1772134698984;
        Thu, 26 Feb 2026 11:38:18 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10ff4341asm122617e87.39.2026.02.26.11.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 11:38:17 -0800 (PST)
Message-ID: <5c70a8d7-9215-46d3-bcd4-0837597fdda7@gmail.com>
Date: Thu, 26 Feb 2026 21:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com, Frank.li@nxp.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260218095243.2832115-1-s-adivi@ti.com>
 <20260218095243.2832115-16-s-adivi@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260218095243.2832115-16-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_113822_175899_B1C7AAA6 
X-CRM114-Status: GOOD (  33.58  )
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



On 18/02/2026 11:52, Sai Sree Kartheek Adivi wrote:
> Add support for BCDMA_V2.
> 
> The BCDMA_V2 is different than the existing BCDMA supported by the
> k3-udma driver.
> 
> The changes in BCDMA_V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to PEER
>   registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> Also, since a version member is introduced in the match_data, Add
> version v1 in match_data of SoCs using v1 DMA.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/dma/ti/Kconfig            |   14 +-
>  drivers/dma/ti/Makefile           |    1 +
>  drivers/dma/ti/k3-udma-common.c   |   86 +-
>  drivers/dma/ti/k3-udma-v2.c       | 1283 +++++++++++++++++++++++++++++
>  drivers/dma/ti/k3-udma.c          |    9 +
>  drivers/dma/ti/k3-udma.h          |  121 +--
>  include/linux/soc/ti/k3-ringacc.h |    3 +
>  7 files changed, 1446 insertions(+), 71 deletions(-)
>  create mode 100644 drivers/dma/ti/k3-udma-v2.c
> 
> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index 712e456015459..40713bd1e8e9b 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -49,6 +49,18 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
>  
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC
> +	select TI_K3_PSIL
> +        help
> +	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
> +	  DMA engine is used in AM62L.
> +
>  config TI_K3_UDMA_COMMON
>  	tristate
>  	default n
> @@ -63,7 +75,7 @@ config TI_K3_UDMA_GLUE_LAYER
>  
>  config TI_K3_PSIL
>         tristate
> -       default TI_K3_UDMA
> +       default TI_K3_UDMA || TI_K3_UDMA_V2
>  
>  config TI_DMA_CROSSBAR
>  	bool
> diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
> index 41bfba944dc6c..296aa3421e71b 100644
> --- a/drivers/dma/ti/Makefile
> +++ b/drivers/dma/ti/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_TI_CPPI41) += cppi41.o
>  obj-$(CONFIG_TI_EDMA) += edma.o
>  obj-$(CONFIG_DMA_OMAP) += omap-dma.o
>  obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
> +obj-$(CONFIG_TI_K3_UDMA_V2) += k3-udma-v2.o
>  obj-$(CONFIG_TI_K3_UDMA_COMMON) += k3-udma-common.o
>  obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
>  k3-psil-lib-objs := k3-psil.o \
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index 0ffc6becc402e..ff2b0353515ee 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -171,8 +171,13 @@ bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
>  	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
>  		return true;
>  
> -	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
> -	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	if (uc->ud->match_data->version == K3_UDMA_V2) {

Consider to start with V1? V3 might be similar to V2 and you save on
churn in the future?

Same comment for other version checks.

> +		peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
> +		bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	} else {
> +		peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
> +		bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	}
>  
>  	/* Transfer is incomplete, store current residue and time stamp */
>  	if (peer_bcnt < bcnt) {
> @@ -319,6 +324,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  	size_t tr_size;
>  	int num_tr = 0;
>  	int tr_idx = 0;
> +	u32 extra_flags = 0;
>  	u64 asel;
>  
>  	/* estimate the number of TRs we will need */
> @@ -342,6 +348,11 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  	else
>  		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
>  
> +	if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
> +	    uc->ud->match_data->version == K3_UDMA_V2 &&
> +	    dir == DMA_MEM_TO_DEV)
> +		extra_flags = CPPI5_TR_CSF_EOP;
> +
>  	tr_req = d->hwdesc[0].tr_req_base;
>  	for_each_sg(sgl, sgent, sglen, i) {
>  		dma_addr_t sg_addr = sg_dma_address(sgent);
> @@ -358,7 +369,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  
>  		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
>  			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> -		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
> +		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  		sg_addr |= asel;
>  		tr_req[tr_idx].addr = sg_addr;
> @@ -372,7 +383,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  				      false, false,
>  				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
>  			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
> -					 CPPI5_TR_CSF_SUPR_EVT);
> +					 CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
>  			tr_req[tr_idx].icnt0 = tr1_cnt0;
> @@ -2052,6 +2063,8 @@ int udma_get_tchan(struct udma_chan *uc)
>  		uc->tchan = NULL;
>  		return ret;
>  	}
> +	if (ud->match_data->version == K3_UDMA_V2)
> +		uc->chan = uc->tchan;
>  
>  	if (ud->tflow_cnt) {
>  		int tflow_id;
> @@ -2102,6 +2115,8 @@ int udma_get_rchan(struct udma_chan *uc)
>  		uc->rchan = NULL;
>  		return ret;
>  	}
> +	if (ud->match_data->version == K3_UDMA_V2)
> +		uc->chan = uc->rchan;
>  
>  	return 0;
>  }
> @@ -2379,16 +2394,26 @@ int bcdma_setup_resources(struct udma_dev *ud)
>  
>  	ud->bchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
>  					   sizeof(unsigned long), GFP_KERNEL);
> +	bitmap_zero(ud->bchan_map, ud->bchan_cnt);
>  	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
>  				  GFP_KERNEL);
>  	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
>  					   sizeof(unsigned long), GFP_KERNEL);
> +	bitmap_zero(ud->tchan_map, ud->tchan_cnt);
>  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
>  				  GFP_KERNEL);
> -	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
> -					   sizeof(unsigned long), GFP_KERNEL);
> -	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> -				  GFP_KERNEL);
> +	if (ud->match_data->version == K3_UDMA_V2) {
> +		ud->rchan_map = ud->tchan_map;
> +		ud->rchans = ud->tchans;
> +		ud->chan_map = ud->tchan_map;
> +		ud->chans = ud->tchans;
> +	} else {
> +		ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
> +						   sizeof(unsigned long), GFP_KERNEL);
> +		bitmap_zero(ud->rchan_map, ud->rchan_cnt);
> +		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +					  GFP_KERNEL);
> +	}
>  	/* BCDMA do not really have flows, but the driver expect it */
>  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
>  					sizeof(unsigned long),
> @@ -2484,11 +2509,18 @@ int setup_resources(struct udma_dev *ud)
>  	if (ret)
>  		return ret;
>  
> -	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
> -	if (ud->bchan_cnt)
> -		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> -	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> -	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
> +	if (ud->match_data->version == K3_UDMA_V2) {

I would probbaly check for V1 and leave the V2 as simple else - trusting
that v3 will likely be closer to it than v1?

> +		ch_count = ud->bchan_cnt + ud->tchan_cnt;
> +		if (ud->bchan_cnt)
> +			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> +		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> +	} else {
> +		ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
> +		if (ud->bchan_cnt)
> +			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> +		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> +		ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
> +	}
>  	if (!ch_count)
>  		return -ENODEV;
>  
> @@ -2510,15 +2542,25 @@ int setup_resources(struct udma_dev *ud)
>  						       ud->rflow_cnt));
>  		break;
>  	case DMA_TYPE_BCDMA:
> -		dev_info(dev,
> -			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
> -			 ch_count,
> -			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> -						       ud->bchan_cnt),
> -			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> -						       ud->tchan_cnt),
> -			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> -						       ud->rchan_cnt));
> +		if (ud->match_data->version == K3_UDMA_V1) {
> +			dev_info(dev,
> +				 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
> +				 ch_count,
> +				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> +							       ud->bchan_cnt),
> +				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> +							       ud->tchan_cnt),
> +				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> +							       ud->rchan_cnt));
> +		} else if (ud->match_data->version == K3_UDMA_V2) {
> +			dev_info(dev,
> +				 "Channels: %d (bchan: %u, chan: %u)\n",
> +				 ch_count,
> +				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> +							       ud->bchan_cnt),
> +				 ud->chan_cnt - bitmap_weight(ud->chan_map,
> +							      ud->chan_cnt));
> +		}

if you have else if {} you do want to have plain else {} to handle cases
when neither.
CHeck for V1 and leave V2 for a plain else branch?

Optionally if indentation is geting tight, just create a helper function
to print this info.

>  		break;
>  	case DMA_TYPE_PKTDMA:
>  		dev_info(dev,

I think this and the series looks good, the only thing I would consider
is to revers the V1/2 checks when it makes sense - future incarnations
of UDMA might be closer to V2 than V1 and you save on maintanance headache.

-- 
Péter



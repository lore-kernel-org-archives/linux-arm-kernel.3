Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1140AE8305A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8GrinKDGOqbbFlvjaosDEAsZcli0GS5u0koOnCbV+4=; b=YlU5fLRU2fyss2pSts3e+8dE7q
	nje9HFJeHJm/n1Gk9kao1BIQs3DYUb9HCVIHYg1i8LKngGfKoTvIuInrrhF3ZcqR6QlZwTTKQTLfo
	LgfIiZ3VpCzrnanCBaof+QFroO67JTJxrAOGWG0N0olzA2JGmReQ2a7nq07U3XraWyf+SWj0FGcQf
	PM9bvVf220PPMqIUh2ORIKPsGdcEKqV4m4TGH0h3HDOENPtnnCslfRrbtpfqrNGoH6Dk9CE7uTmB6
	1qqcUgkkHsEqwvX7U/cw3otwXCJwIbQ7Q4HIVSMlG7TsgtIy5tyj4mCi5L5XOxq8dDgeYJ2szQT6l
	1j+mLw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnA1P-00000006CHq-0LzP;
	Tue, 03 Feb 2026 06:36:23 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnA1M-00000006CHJ-2WRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:36:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59de66fdb53so4937498e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770100578; x=1770705378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8GrinKDGOqbbFlvjaosDEAsZcli0GS5u0koOnCbV+4=;
        b=TRjxMc/qll17N/25gRJBJUO2GfC2JH4foXUr+1MzYDEVkxuYakjb9xsj4wFnX2VKvm
         T4Ax2frXTB1v1gwD6SewnBAIIOwPvAUap3hgvQXWjxUfVt7a+NokmY6qpDRdRmu5ADxJ
         EnKkvlf8tdgk65ondZprAmIMlqF5zu9zm7+QCwC7jEjlFEiMmNL20VDVVtZS/aZiYIrv
         dKb7naYOsomSUzCl3VR9nFLqLCOBXIlwVRLV22oNBcBBPh48lkfczjS+hs56l9u7sKZJ
         tYj8HO0G7lVba8uSnxdrOdBO7jOGQscwpvS6hgUxoGMScig+vN4gO9T7QQMx7TE/0qzH
         bY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770100578; x=1770705378;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8GrinKDGOqbbFlvjaosDEAsZcli0GS5u0koOnCbV+4=;
        b=lyRg8lf7c971LjlAt30gU+irl4NUIjveYHGkFkGEyAsfdqsAdprbyXWs00xPdbSox/
         KMwQDVpX4ChuQ0XDucv6PINA+x1DSo55q81b8JFoifXK1j4thxNjqzM12fcUZjskc/wl
         O2110KHoVxahWEYlnl/6bf0iF+Bb+yJg41sdK3ZKo5wI1kVomTmu1jzY87LxmNOcCpiT
         bUT8H5cNlfFgHTXzUVddVqzc67qzZmH6iloEXtGFX0MkURmqy6vWPfM2bcGrz4HxdTVO
         +9vJaW8ayWZXZp9duPNFsSb1qTm6PyBRU1maJaTmcVOMNh/6L/ReE336qGQ8E10O4IHI
         lf+w==
X-Forwarded-Encrypted: i=1; AJvYcCW1+sYw+2bkoC4tTSB02RzNCXHB/Q21RJug1dVxSBzKoLo+GOd5PYjbD0Ce2So5e/PMOwLNW8B42+K9TXQm48w0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ris2fqZftD/ay7xLYtW0nyDTfO3x9opVLqFN3dbuhhmfoUTe
	cB/neP/9DHOPn+V/hvViGuXPURftGYaJr3fkAh7u7e9HGAMttI8aI33r
X-Gm-Gg: AZuq6aIzhjqJww81VsuF7NQjltxkG4vNQZn2OuJHxRE/7pysCBEwqZGrbFgEA135BoK
	of/zuirgGRHx4dcKwj3vse99Uq0QfxE9xmlM5ZDH36t9ejvcprDbXFPP5JRlL1qXUxGt7Ff/tt8
	HDnYfIQzM0CRasmP/nS8eeslXqGM7RNZjfc8MfmdECg/oJuqM4MsunPuOTrLdTp/X9fHbZKdspL
	TXK7LZNZqtXIYP0K/bY8m0SxHdq9X/MHQS6nsNBDuVFDlV773Vm6aLoVMSDlsSeos5J/YuYgcBC
	PGH0OG2T8sBwDRTAcLSe4LXV8fLG1zxS/uOEgIZoF0OaBOT+69TxefU9gWktV0vK39LX++hYRce
	loxUt/ofZBOjTOmhdwoCNEPaROeQNZccOnGBwp3vt1DfyOe0e8StvDs4bGydrUIXx0hvfBuNXBb
	Co7J+YFi5Bb86+nn2MzqTR4ci1m78GQ9u48oodAX5QAWgODDgrqnckN2dA/XodjYTnPUY37g==
X-Received: by 2002:ac2:4e01:0:b0:59c:bfeb:cc2d with SMTP id 2adb3069b0e04-59e163f5918mr4193887e87.2.1770100577863;
        Mon, 02 Feb 2026 22:36:17 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e08e7e0d6sm3844554e87.62.2026.02.02.22.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:36:17 -0800 (PST)
Message-ID: <98c254c5-94c1-49b0-b361-617639b781d8@gmail.com>
Date: Tue, 3 Feb 2026 08:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-16-s-adivi@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260130110159.359501-16-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_223620_695127_BF567CB0 
X-CRM114-Status: GOOD (  33.01  )
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



On 30/01/2026 13:01, Sai Sree Kartheek Adivi wrote:
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
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/dma/ti/Kconfig            |   16 +-
>  drivers/dma/ti/Makefile           |    1 +
>  drivers/dma/ti/k3-udma-common.c   |   75 +-
>  drivers/dma/ti/k3-udma-v2.c       | 1283 +++++++++++++++++++++++++++++
>  drivers/dma/ti/k3-udma.h          |  117 +--
>  include/linux/soc/ti/k3-ringacc.h |    3 +
>  6 files changed, 1429 insertions(+), 66 deletions(-)
>  create mode 100644 drivers/dma/ti/k3-udma-v2.c
> 
> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index 712e456015459..ada2ea8aca4b0 100644
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
> @@ -56,14 +68,14 @@ config TI_K3_UDMA_COMMON
>  config TI_K3_UDMA_GLUE_LAYER
>  	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
>  	depends on ARCH_K3 || COMPILE_TEST
> -	depends on TI_K3_UDMA
> +	depends on TI_K3_UDMA || TI_K3_UDMA_V2

At this point the glue layer should not have dependency on UDMA_V2 as it
only receives BCDMA support, which is not used by the glue?

>  	help
>  	  Say y here to support the K3 NAVSS DMA glue interface
>  	  If unsure, say N.
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
> index 0ffc6becc402e..ba0fc048234ac 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -171,8 +171,13 @@ bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
>  	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
>  		return true;
>  
> -	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
> -	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	if (uc->ud->match_data->type >= DMA_TYPE_BCDMA_V2) {
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

nitpick: reverse christmas tree order

>  	u64 asel;
>  
>  	/* estimate the number of TRs we will need */
> @@ -342,6 +348,9 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  	else
>  		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
>  
> +	if (dir == DMA_MEM_TO_DEV && uc->ud->match_data->type == DMA_TYPE_BCDMA_V2)

I would add the evaluation order in reverse to skip checking direction
for UDMA_V1.

> +		extra_flags = CPPI5_TR_CSF_EOP;
> +
>  	tr_req = d->hwdesc[0].tr_req_base;
>  	for_each_sg(sgl, sgent, sglen, i) {
>  		dma_addr_t sg_addr = sg_dma_address(sgent);
> @@ -358,7 +367,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  
>  		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
>  			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> -		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
> +		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  		sg_addr |= asel;
>  		tr_req[tr_idx].addr = sg_addr;
> @@ -372,7 +381,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  				      false, false,
>  				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
>  			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
> -					 CPPI5_TR_CSF_SUPR_EVT);
> +					 CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
>  			tr_req[tr_idx].icnt0 = tr1_cnt0;
> @@ -632,7 +641,8 @@ int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
>  			d->static_tr.bstcnt = d->residue / d->sglen / div;
>  		else
>  			d->static_tr.bstcnt = d->residue / div;
> -	} else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
> +	} else if ((uc->ud->match_data->type == DMA_TYPE_BCDMA ||
> +		   uc->ud->match_data->type == DMA_TYPE_BCDMA_V2) &&

Have you thought of adding a version member to struct udma_match_data
and use that instead of distinct different types for BCDMA/PKTDMA?

Here for example you would not need any change as the code is common for
both v1 and v2.

>  		   uc->config.dir == DMA_DEV_TO_MEM &&
>  		   uc->cyclic) {
>  		/*
...

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> index 0000000000000..af06d25fd598b
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c

...

> +static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
> +{
> +	struct udma_chan_config *ucc;
> +	struct psil_endpoint_config *ep_config;
> +	struct udma_v2_filter_param *filter_param;
> +	struct udma_chan *uc;
> +	struct udma_dev *ud;

nitpick: reverse christmas tree order
also in few other places.

-- 
Péter



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE1C3ABD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNoGYCfFn1Ise+cYyN4rMghXeEvaDWlpHmEHwktQf4A=; b=4ksgwxnaD1aHZthlJMfCJg8xIu
	KiSUVz42jMu1pi2PQLwfNFZnC/Lw+m51/4/U3q1cGfdW81p9YRB5/aBXF9eNCCA2QtcWoFBVfCmL0
	/iCTj8oQe6fR3i79cgksvFJSx/dsHowt5oFRjyU87ieWxbwCUBiNGavQfMGL8h0LZRM2MTcu26OTM
	q9XDw1kzN8OySm8MJY3eTpWoSAdeRZ9HlDCDMUG2PzkbFvS6l+6YHNl+o6PkmuJsfWQqF2GU83ABD
	hMPyTeGrup/FF2EJ7yScLTXoQxtdbX4N+hXj1w5NtB6JPYey9ml4x5x+VaLk4lFBYOcSO3DxwEZSs
	vbU44Gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHr-00000004miA-1LZw;
	Fri, 09 May 2025 20:25:39 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQaL-00000004HTV-3jB4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:28:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2928809e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746808108; x=1747412908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNoGYCfFn1Ise+cYyN4rMghXeEvaDWlpHmEHwktQf4A=;
        b=Tr2kIjPOFt1dDpBoaL7HfLfMb2PHeXV69Gf2c7NlxoREwPXk3za37jdkWPg3M8mUqD
         FkcHRPRD7BdMthgLCuW9+txgtr6t0pfZdycvun8lLSfTFhyogekZsAnAlcu5j6FO1rkf
         RCYs1CsKKTMc8r6ss228dQfFXXbZk+Y90CIk/JQSQku8c8vWNkV+js6r3fgVLdgk1bYb
         w9H8sbFU0ch3IygmXmTdorTjFNj1YLBK1CFkfJDul2kOWdf+SNIu26yxFCC35RcNEg76
         u4s8pVH+Q2daP9fQVka4Ij4o8qOcCkYUapV0s1x6fRchtmtQQbhe235Tgf/aWZeRojl1
         98Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808108; x=1747412908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNoGYCfFn1Ise+cYyN4rMghXeEvaDWlpHmEHwktQf4A=;
        b=DDLfg/wMJusGC/8SBDXPGAADbg3C6zXR1puFHUIFvdJFODAbqIBRL4XsT+oGrzhxI6
         pXhTdXDBfQcB6qYE2Hh9oE2R4N+wS1kF6Jwp0x3H0NeSa50caCEXFRZK5GR23MYtgpiu
         WZEeBECRXo/YI52A3X2yDZ/v4j2smi1JOHFzv7E+FvqfQ7RRxWs5WGcPgXJdlmGsxVcv
         cLSMaRF8HRassORD0efSK4AxlDJdk8qb5a3MWn6jTkFtVYGE2HQmyNjoytL7AHVh3YOb
         jI7X+jzjptofxWCDMeRihxm6GpNxKQmq6Bd/OO89/kCalCpk7BMUvw63GVXte10j0wJO
         iHjA==
X-Forwarded-Encrypted: i=1; AJvYcCUdJfndrju1q4MAk6kL19KYl0wDOmKiLNuBHiS2/jKdhS+o5SS1OciufznpUiL60n6QMKzvB6O7w80d/aiz5Ugw@lists.infradead.org
X-Gm-Message-State: AOJu0YxICkr8EAtolwITvpSgoQ/RhWIZUa8/AhSxdjRG3FVFepyUQv1N
	pAwxHbp7aGuqvSs1bu7LBaCM+EJfoL5X08BQ6Y58I4weKX6CnAWw
X-Gm-Gg: ASbGncthrSONFTB0Xo3Z+w9ePCU/++pYgfq+B+ZCLT/qx2/0UMZSJG/he1J42vFViMS
	rMRzTW3wOhZpyZNMAuyYv6uqH9Pm6NRCS8uji2JUrwfcrIai+w/0yEWEdp5rTuZ4KMTI3fCciVC
	kpNLKf7HjTLJqTgRb++EPEvcZax6wC2jTI7LV2gFmXrLU5eoTvVzFKTaG00/7cbKHUFKtr6nKSl
	PrLfdZhOdXJjEVaOn+1a7ubf2RRpsMeTmMFgPcnY/LwEEOWOuOpv+YWrItTzYlfh8y+4YyI+Zbf
	loGnkJfi6IWWqKeA3lDQWZxIiPZTuzCjmwCPKR5hVCGWo9zGCy1JkEzpUU4+JywChUB1SrXtGp/
	7F2UK7f4RuoVJ
X-Google-Smtp-Source: AGHT+IH/EXb373raBKjt6WQfYf9//Y986Nd2SlGxe0WcdFkLId+97MeCHvJVp1WwYjOQkLDE9lalsA==
X-Received: by 2002:a05:6512:6501:b0:54f:c074:869a with SMTP id 2adb3069b0e04-54fc67e28c9mr1175869e87.45.1746808107398;
        Fri, 09 May 2025 09:28:27 -0700 (PDT)
Received: from [10.0.0.100] (host-185-69-73-15.kaisa-laajakaista.fi. [185.69.73.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdaasm325994e87.60.2025.05.09.09.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 09:28:27 -0700 (PDT)
Message-ID: <aa852707-9be9-4e88-a0b3-034ebd47a9ac@gmail.com>
Date: Fri, 9 May 2025 19:29:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-6-s-adivi@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20250428072032.946008-6-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_092829_929723_505F6599 
X-CRM114-Status: GOOD (  22.95  )
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



On 28/04/2025 10:20, Sai Sree Kartheek Adivi wrote:
> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/soc/ti/k3-ringacc.c       | 162 +++++++++++++++++++++++++-----
>  include/linux/soc/ti/k3-ringacc.h |   4 +
>  2 files changed, 142 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 82a15cad1c6c4..49e0483676a14 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -45,6 +45,38 @@ struct k3_ring_rt_regs {
>  	u32	hwindx;
>  };
>  
> +#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
> +#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
> +#define K3_DMARING_CFG_ASEL_SHIFT	16
> +#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct k3_ring_cfg_regs - The RA Configuration Registers region
> + *
> + * @ba_lo: Ring Base Address Low Register
> + * @ba_hi: Ring Base Address High Register
> + * @size: Ring Size Register
> + */
> +struct k3_ring_cfg_regs {
> +	u32	ba_lo;
> +	u32	ba_hi;
> +	u32	size;
> +};
> +
> +#define K3_RINGACC_RT_INT_REGS_OFS		0x140
> +#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
> +#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
> +
> +struct k3_ring_intr_regs {
> +	u32	enable_set;
> +	u32	resv_4;
> +	u32	clr;
> +	u32	resv_16;
> +	u32	status_set;
> +	u32	resv_8;
> +	u32	status;
> +};
> +
>  #define K3_RINGACC_RT_REGS_STEP			0x1000
>  #define K3_DMARING_RT_REGS_STEP			0x2000
>  #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
> @@ -157,6 +189,8 @@ struct k3_ring_state {
>   */
>  struct k3_ring {
>  	struct k3_ring_rt_regs __iomem *rt;
> +	struct k3_ring_cfg_regs __iomem *cfg;
> +	struct k3_ring_intr_regs __iomem *intr;
>  	struct k3_ring_fifo_regs __iomem *fifos;
>  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
>  	dma_addr_t	ring_mem_dma;
> @@ -465,16 +499,30 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
>  	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
> +	u32 reg;
>  
> -	ring_cfg.nav_id = ringacc->tisci_dev_id;
> -	ring_cfg.index = ring->ring_id;
> -	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> -	ring_cfg.count = ring->size;
> +	if (!ringacc->tisci) {

these are not in hot path, right?
The reg can be moved here and in other functions.

> +		if (ring->cfg == NULL)
> +			return;
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +		writel(reg, &ring->cfg->size);
> +		wmb();
> +		reg |= ring->size;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ring_cfg.nav_id = ringacc->tisci_dev_id;
> +		ring_cfg.index = ring->ring_id;
> +		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> +		ring_cfg.count = ring->size;
> +
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  void k3_ringacc_ring_reset(struct k3_ring *ring)
> @@ -494,16 +542,30 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
>  	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
> +	u32 reg;
>  
>  	ring_cfg.nav_id = ringacc->tisci_dev_id;
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>  	ring_cfg.mode = mode;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> +					ret, ring->ring_id);
> +	}
>  }
>  
>  void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
> @@ -570,15 +632,29 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
>  	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
> +	u32 reg;

this can be added to if (!ringacc->tisci) { } scope.>
>  	ring_cfg.nav_id = ringacc->tisci_dev_id;
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> +					ret, ring->ring_id);
> +	}
>  }
>  
>  int k3_ringacc_ring_free(struct k3_ring *ring)
> @@ -669,15 +745,31 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
>  }
>  EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
>  
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
> +
> +	return readl(&ring2->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
> +
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
> +
> +	writel(0xFF, &ring2->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
> +
>  static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
>  {
>  	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
>  	struct k3_ringacc *ringacc = ring->parent;
> +	u32 reg;
>  	int ret;
>  
> -	if (!ringacc->tisci)
> -		return -EINVAL;
> -
>  	ring_cfg.nav_id = ringacc->tisci_dev_id;
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
> @@ -688,11 +780,26 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
>  	ring_cfg.size = ring->elm_size;
>  	ring_cfg.asel = ring->asel;
>  
> +	if (!ringacc->tisci) {
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
> +				&ring->intr->enable_set);
> +		return 0;
> +	}
> +
>  	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>  	if (ret)
>  		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> -
> +				ret, ring->ring_id);

suprious change? The alignment was correct.

>  	return ret;
>  }
>  
> @@ -1480,9 +1587,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
>  
>  	mutex_init(&ringacc->req_lock);
>  
> -	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
> -	if (IS_ERR(base_rt))
> -		return ERR_CAST(base_rt);
> +	base_rt = data->base_rt;
> +	if (!base_rt) {
> +		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
> +		if (IS_ERR(base_rt))
> +			return ERR_CAST(base_rt);
> +	}
>  
>  	ringacc->rings = devm_kzalloc(dev,
>  				      sizeof(*ringacc->rings) *
> @@ -1498,6 +1608,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
>  		struct k3_ring *ring = &ringacc->rings[i];
>  
>  		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
> +		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
> +			    K3_DMARING_RT_REGS_STEP * i;
> +		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
> +			     K3_DMARING_RT_REGS_STEP * i;
>  		ring->parent = ringacc;
>  		ring->ring_id = i;
>  		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 39b022b925986..fcf6fbd4a8594 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -158,6 +158,9 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
>   */
>  int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
>  
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring);
> +
>  /**
>   * k3_ringacc_ring_cfg - ring configure
>   * @ring: pointer on ring
> @@ -262,6 +265,7 @@ struct k3_ringacc_init_data {
>  	const struct ti_sci_handle *tisci;
>  	u32 tisci_dev_id;
>  	u32 num_rings;
> +	void __iomem *base_rt;
>  };
>  
>  struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,

-- 
Péter



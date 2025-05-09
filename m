Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2784C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoaHVq8f5uoSyjjX75HEcA9MREgvZcIUuW4iFJxdZ4A=; b=gavNFbqostWzk4wtWulhLVv7hr
	/pbgY1VObiZbRIuUS+fRPft3zKxNQCViVFbLprQBPIwgjdv5aBbwqKEhUk+pxC8YEmKwGaDCEK1pp
	hz1uYdUn3AiwJx3b2H0pdYK0WiLd4uFC+ziuQzUTZQi1ola9Cn9mrq45Ot1Wp93vdnW7itDw5vCDL
	9NFo2GMm3VOwk6nRnFtB24EekP0V2PzUCAxb7KbA7ik1WfQSJEdBI0c7CQDDvMGRKzD/AK5Lw37WV
	PhW/0zTcYg/6LjpWJ29TzZBXMalez0kAdF9uzsKV3pG4Eunj36LDZo/03MEeXJ4asqjJgPdkQKkKQ
	fCJZC0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDR1v-00000004N2W-3hGG;
	Fri, 09 May 2025 16:56:59 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOdo-00000003wBS-2Nwj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:23:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54d6f933152so3001803e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746800634; x=1747405434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MoaHVq8f5uoSyjjX75HEcA9MREgvZcIUuW4iFJxdZ4A=;
        b=CkVBXVWQEKng24xxPUNlkzbUK6nrHpLCxDbMJRrJSofhwuWq6HnMx7MRRMjx43lkwf
         eyWlD4UPOdnTbEEMuvYNHtS6cVVas9qd8mRGoWlq1UFlLaS5QwGFDe9nP+caIXk9yZlw
         d9rBZ8fVMcItQiz5HTBiTskumGnF8atJy+9MNpJH2gXFL2DyjuLalqEmv9ewN41W0thw
         wKXC14DBWzRE0iZugDly7qG+2kfsQPtuNVC77SknqAmj9XJDQx8HjWtf1l1+KMqyox5e
         OWty4Bvtl8+cbPEZzmZPdYNe9lwNGEYipu65iWCSleRxHwD+uvWG7s1hdMNf0hu04Md4
         JLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800634; x=1747405434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoaHVq8f5uoSyjjX75HEcA9MREgvZcIUuW4iFJxdZ4A=;
        b=AQf09p3iu4np6TwZqdAJF5Wr5MonGr/TJIZKZp+XINlUdZHKZUBLF5u6b5IStMI0IH
         EszCQr6V5oj4o12dDFylmY7LWdAgwOvRLAGqNAdlM7Dv6MI+eg/82fp+S5fSKEqlIwAI
         5r63oHsXGu4A4Mb2dceIgmbieM5JSuh5FPuhf4WGRJzHS3+cD5jXPnRwsmb1O/I3KSei
         FctparHDC3gmXT4Bll5aEy07Ra80ZEbXpIHsLiB89ggcGK1h20zOrupXCiBq/Dh1zxyx
         oT+9vDvj6CmMyQQZZnEuZ7piCH0HYmbkLVbYGqtz3CSvxHSdeEIiijKkuJQ76HFELwiv
         gmwg==
X-Forwarded-Encrypted: i=1; AJvYcCUv7I/kAQJ8UDo+nsgSyjBzUcINcps62tMVBNZebHNrtSmnjk8ZNkAs9LBvNKUpqXxJoQoXMlIyx5OF2ueawHv2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzio2371n8ViiKuEF13bejiKAcS06XdEQBsg8cCIOCGeuuSl4kq
	rnSWMDu7vZjMzrFhQdNLWMC0xXt7fGuiEODarbQKFpmA5I5zUs3w
X-Gm-Gg: ASbGncuoo9sMoc8jInwzOArHN5WDwc4g484WWG+bVmY8jBSEf3YR0JiE1Q4i9NInC9r
	7o3/swRrQY0xi/w1kGU3Tw30d6u3JeQ/LtbT7cjsIsul8hr1CyMvpaUzIYT8zxQVRcCDm2Cu4JV
	MxIIz4y3OuMnOhtRLyiMWTWf3/AhfK3LnGk85oaICgrZAnPoX2ChnYA+WNF4YoGs2AA0Lc1fetc
	CXyyL5h+B25zZW2Zkr3dhL2emb8/959ZTWGztRGLqUacv0rAG4A44Pq8RU3DjKZnElLmap90GES
	NmA7bjfcSgn7OBaL9v6qiqbJujguB+hQNCMc/LElUXosnFwUGli3Bgi07rl/PshZlCu3KdIUHpv
	EQ5AN0dzOjtuyJG7aG/UMhhXMIxwfBvr425UtJdBHyVTBv1DVP5rdbXbyUhGTdJ4WSwHCOATH
X-Google-Smtp-Source: AGHT+IEiqJIsmXnH9dNxGfVEY7/IBx5BdjSAyjSugSQ904/Pvglv5wzXp+SHaqKYougS4EZvpuYKRw==
X-Received: by 2002:a05:6512:2913:b0:54a:cc75:3d81 with SMTP id 2adb3069b0e04-54fc67b4624mr1116687e87.4.1746800633673;
        Fri, 09 May 2025 07:23:53 -0700 (PDT)
Received: from ?IPV6:2001:999:701:52e0:b498:b01c:c3ac:ae69? (n7kenj77twmhzm8jtyh-1.v6.elisa-mobile.fi. [2001:999:701:52e0:b498:b01c:c3ac:ae69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6ebesm289857e87.137.2025.05.09.07.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 07:23:53 -0700 (PDT)
Message-ID: <e823a43e-20a8-4142-875f-a3575cbb0d0b@gmail.com>
Date: Fri, 9 May 2025 17:25:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers: dma: ti: Refactor TI K3 UDMA driver
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-4-s-adivi@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20250428072032.946008-4-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072356_607139_11028849 
X-CRM114-Status: GOOD (  19.39  )
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

On 28/04/2025 10:20, Sai Sree Kartheek Adivi wrote:
> Refactors and split the driver into common and device
> specific parts. There are no functional changes.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/dma/ti/Makefile         |    2 +-
>  drivers/dma/ti/k3-udma-common.c | 2909 ++++++++++++++++++++++++
>  drivers/dma/ti/k3-udma.c        | 3751 ++-----------------------------

I'm affraid you do need to break this one up a bit. It might be doing it
correctly, but it is impossible to check with the churn, like ....

>  drivers/dma/ti/k3-udma.h        |  548 ++++-
>  4 files changed, 3700 insertions(+), 3510 deletions(-)
>  create mode 100644 drivers/dma/ti/k3-udma-common.c

...

> -static bool udma_is_chan_running(struct udma_chan *uc)
> -{
> -	u32 trt_ctl = 0;
> -	u32 rrt_ctl = 0;
> -
> -	if (uc->tchan)
> -		trt_ctl = udma_tchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> -	if (uc->rchan)
> -		rrt_ctl = udma_rchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> -
> -	if (trt_ctl & UDMA_CHAN_RT_CTL_EN || rrt_ctl & UDMA_CHAN_RT_CTL_EN)
> -		return true;
> -
> -	return false;
> -}
> -
>  static bool udma_is_chan_paused(struct udma_chan *uc)
>  {
>  	u32 val, pause_mask;
> @@ -643,189 +88,73 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
>  	return false;
>  }
>  
> -static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
> +static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)


These sort of diffs.

>  {
> -	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
> +	if (uc->desc->dir == DMA_DEV_TO_MEM) {
> +		udma_rchanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
> +		udma_rchanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
> +		if (uc->config.ep_type != PSIL_EP_NATIVE)
> +			udma_rchanrt_write(uc, UDMA_CHAN_RT_PEER_BCNT_REG, val);
> +	} else {
> +		udma_tchanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
> +		udma_tchanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
> +		if (!uc->bchan && uc->config.ep_type != PSIL_EP_NATIVE)
> +			udma_tchanrt_write(uc, UDMA_CHAN_RT_PEER_BCNT_REG, val);
> +	}
>  }
>  
> -static int udma_push_to_ring(struct udma_chan *uc, int idx)
> +static void udma_reset_counters(struct udma_chan *uc)
>  {

...

> +struct udma_dev {
> +	struct dma_device ddev;
> +	struct device *dev;
> +	void __iomem *mmrs[MMR_LAST];
> +	const struct udma_match_data *match_data;
> +	const struct udma_soc_data *soc_data;
> +
> +	struct udma_tpl bchan_tpl;
> +	struct udma_tpl tchan_tpl;
> +	struct udma_tpl rchan_tpl;
> +
> +	size_t desc_align; /* alignment to use for descriptors */
> +
> +	struct udma_tisci_rm tisci_rm;
> +
> +	struct k3_ringacc *ringacc;
> +
> +	struct work_struct purge_work;
> +	struct list_head desc_to_purge;
> +	spinlock_t lock;
> +
> +	struct udma_rx_flush rx_flush;
> +
> +	int bchan_cnt;
> +	int tchan_cnt;
> +	int echan_cnt;
> +	int rchan_cnt;
> +	int rflow_cnt;
> +	int tflow_cnt;
> +	unsigned long *bchan_map;
> +	unsigned long *tchan_map;
> +	unsigned long *rchan_map;
> +	unsigned long *rflow_gp_map;
> +	unsigned long *rflow_gp_map_allocated;
> +	unsigned long *rflow_in_use;
> +	unsigned long *tflow_map;
> +
> +	struct udma_bchan *bchans;
> +	struct udma_tchan *tchans;
> +	struct udma_rchan *rchans;
> +	struct udma_rflow *rflows;
> +
> +	struct udma_chan *channels;
> +	u32 psil_base;
> +	u32 atype;
> +	u32 asel;
> +
> +	int (*udma_start)(struct udma_chan *uc);
> +	int (*udma_stop)(struct udma_chan *uc);
> +	int (*udma_reset_chan)(struct udma_chan *uc, bool hard);
> +	bool (*udma_is_desc_really_done)(struct udma_chan *uc, struct udma_desc *d);
> +	void (*udma_decrement_byte_counters)(struct udma_chan *uc, u32 val);

You can drop the udma_ prefix, it is clear that they are for udma..

> +};
-- 
Péter



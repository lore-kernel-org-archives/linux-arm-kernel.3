Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C0FC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F1AyUc8E8n9yeZIf5vw56v5InQeBZLcKuG+dGd7CQc=; b=dpZuThhjT7748gWIQI26KYmkNB
	54O/uIuMqezGleiVAaqw+FLWaHTZmN5SU2p8G6jpFuMfjONzNTaiyHOsNPcIYPUePpOwe9QKlvBVd
	lMajosN0HF9t2mTlzvbEy30NX9+vHmRi2/Z560ClXONfLL0qnXU49cp0PY4nTxNDJMqWKfK/Vvv8+
	HCpwLGV+PDervHYXOeg516HE+C0TQSfydiICOtBvsxR/dpEJEat+Vy4LyXKF/HIIMXMhH1VCS8o0l
	mWEkp62KfdusB64sZHSnKSaFMvFxxe60RCKBWUZ2e8DYmLSeHvlArFsEDrMwtz+Y80sOb10hKmsZf
	W2aXbDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZ6d-0000000FJJx-0GnE;
	Thu, 29 May 2025 08:59:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYrr-0000000FGoK-3Vs9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 08:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748508242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9F1AyUc8E8n9yeZIf5vw56v5InQeBZLcKuG+dGd7CQc=;
	b=VfiqJC3MP619VaA0Brr5dg0ySTW2DbwbHcb19w82CQQ8Hf3PUZo5mJ4LUzEfrFiQY17wLr
	iSH/Ir+VihLlcPXyTvDvragKPhpl2ooHIAf3aOxcSr5+6760lsgdnMWjQ1XvGC61IeC44C
	J/3UFctgCCO9BDjO+x/PK0i1+G1V+J8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-k8-p7TGqPEGJZHyyoW6CHA-1; Thu, 29 May 2025 04:44:00 -0400
X-MC-Unique: k8-p7TGqPEGJZHyyoW6CHA-1
X-Mimecast-MFC-AGG-ID: k8-p7TGqPEGJZHyyoW6CHA_1748508239
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so5128515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 01:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748508239; x=1749113039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1AyUc8E8n9yeZIf5vw56v5InQeBZLcKuG+dGd7CQc=;
        b=qfR2xa8e1YfcRCC2MY1bIrwyEWGzntZI+SwrB4Q2dmzAudRiEgD8a7LSYigF1yWOkU
         vNmpk1bOYYFDpS0xWAkZ680DxlEC6KRBgyq2UbwEwlExeU6WFvtrlIxKvm8UbBvPwrYL
         POsdQFCZ9YWJHoajfc/cZbUxc6oubf/wwRkyjZj56WK7j2RPGq6rQeTxbzLbLhld0gDl
         ny4GAelhkw+sMcbkVNWrQVvLql6s9A/Ncklzc4Ia2X6T93kt/OWqh3XWJHgWPWQ1KqR8
         2OzYcnT1PDW6XJ0Z2zaeHrwb66bprPwARJEZT4I8eOmmT9Wcg176R/+QwNOzjViRBo+e
         lCyA==
X-Forwarded-Encrypted: i=1; AJvYcCWeUhA0wveSdju2w/bXgzWsxM3YV4Dt+mXZdLBcfnXjw4xLpK8PlMzY734znAxJNPYeonDf551Ij1eJ6vouYGu9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt0bHpO4NXcmeDcPfiuSWBgZRckXlqOuIaFLu06wSfY2ggzRrQ
	uXRo6p0B8OULb0sN4ePcJ7Raovc/8EjOX7eeDZshIHTLeSYP45yyGtbkEevFA1EgpY6QrBT5XT2
	RJj6anCPpUrVNEhraWAg2fs9ibv6S/sq7Dnto+KoY9eAss2e1LoCnXobtq/ZCOm1D9VsKhUSjlQ
	wd
X-Gm-Gg: ASbGncvPWJb/2bgTGLcE97vTWKpDPSWJLO8K3a3PdX/eGsuKdHe6zx5hHIoTo1Uctnk
	LXK6vGS5NG2tkLdRST4zPCmoG6aKGRxR5ibW1svRX6VatKLfISL3jSpoDWmFPptkmmN4MxoLwi6
	UiWBOXJAUl2fEYWtiBPZFLMGNnrA4qHZafxqMqMiRnHJsi7uAa1D66zQ/6szSnMqP7hpYkyOTPQ
	Nm+IwxEDOGyfmkwJc38XrZM7vP9e/7TSMllvGdOZ7UO1HnWk+LJ1UNFA1TIBgbU2K/Y7RKzLBzh
	mjZPrhtDwRNr2Zs0olqvyofdorFlSKqYVvrnm6tWvlBEJqGBijbmRXpxksk=
X-Received: by 2002:a05:600c:6215:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-44c933ed932mr180609335e9.33.1748508239275;
        Thu, 29 May 2025 01:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFswQtvfSvNa9PDN1FqTqNOAN2DsMJlj+GqnmV0wxODM5kDCL47pz79wZsKUTl0iK8d06a4FA==
X-Received: by 2002:a05:600c:6215:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-44c933ed932mr180609025e9.33.1748508238797;
        Thu, 29 May 2025 01:43:58 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c9d4sm1325738f8f.38.2025.05.29.01.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 01:43:58 -0700 (PDT)
Message-ID: <0df20c3e-bd51-415f-bfdf-f88bbd39f260@redhat.com>
Date: Thu, 29 May 2025 10:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v12 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250522075455.1723560-1-lukma@denx.de>
 <20250522075455.1723560-5-lukma@denx.de>
 <f738d1ed-7ade-4a37-b8fd-25178f7c1dee@redhat.com>
 <20250528125329.084ab649@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250528125329.084ab649@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T-tEv1TvPfGP_b6m4t9sK8Qlep-pwGXqoQC-P24BiM0_1748508239
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_014403_958786_7FD60CD2 
X-CRM114-Status: GOOD (  48.98  )
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

On 5/28/25 12:53 PM, Lukasz Majewski wrote:
>> On 5/22/25 9:54 AM, Lukasz Majewski wrote:
>>> +/* dynamicms MAC address table learn and migration */
>>> +static void mtip_aging_timer(struct timer_list *t)
>>> +{
>>> +	struct switch_enet_private *fep = from_timer(fep, t,
>>> timer_aging); +
>>> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
>>> +
>>> +	mod_timer(&fep->timer_aging,
>>> +		  jiffies +
>>> msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +}  
>>
>> It's unclear to me why you need to maintain a timer just to update a
>> timestamp?!?
>>
> 
> This timestamp is afterwards used in:
> mtip_atable_dynamicms_learn_migration(), which in turn manages the
> entries in switch "dynamic" table (it is one of the fields in the
> record.
> 
>> (jiffies >> msecs_to_jiffies(LEARNING_AGING_INTERVAL)) & ((1 <<
>> AT_DENTRY_TIMESTAMP_WIDTH) - 1)
>>
> 
> If I understood you correctly - I shall remove the timer and then just
> use the above line (based on jiffies) when
> mtip_atable_dynamicms_learn_migration() is called (and it requires the
> timestamp)?
> 
> Otherwise the mtip_timeincrement() seems like a nice wrapper on
> incrementing the timestamp.

Scheduling a timer to obtain a value you can have for free is not a good
resource usage strategy. Note that is a pending question/check above:
verify that the suggested expression yield the expected value in all the
possible use-case.

>>> +	if (!fep->link[0] && !fep->link[1]) {
>>> +		/* Link is down or autonegotiation is in progress.
>>> */
>>> +		netif_stop_queue(dev);
>>> +		spin_unlock_irqrestore(&fep->hw_lock, flags);
>>> +		return NETDEV_TX_BUSY;  
>>
>> Intead you should probably stop the queue when such events happen
> 
> Please correct me if I'm wrong - the netif_stop_queue(dev); is called
> before return. Shall something different be also done?

The xmit routine should assume the link is up and the tx ring has enough
free slot to enqueue a packet. After enqueueing it should check for
enough space availble for the next xmit and stop the queue, likely using
the netif_txq_maybe_stop() helper.

Documentation/networking/driver.rst

>>> +	}
>>> +
>>> +	/* Clear all of the status flags */
>>> +	status &= ~BD_ENET_TX_STATS;
>>> +
>>> +	/* Set buffer length and buffer pointer */
>>> +	bufaddr = skb->data;
>>> +	bdp->cbd_datlen = skb->len;
>>> +
>>> +	/* On some FEC implementations data must be aligned on
>>> +	 * 4-byte boundaries. Use bounce buffers to copy data
>>> +	 * and get it aligned.
>>> +	 */
>>> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {
>>> +		unsigned int index;
>>> +
>>> +		index = bdp - fep->tx_bd_base;
>>> +		memcpy(fep->tx_bounce[index],
>>> +		       (void *)skb->data, skb->len);
>>> +		bufaddr = fep->tx_bounce[index];
>>> +	}
>>> +
>>> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
>>> +		swap_buffer(bufaddr, skb->len);  
>>
>> Ouch, the above will kill performances.
> 
> This unfortunately must be done in such a way (the same approach is
> present on fec_main.c) as the IP block is implemented in such a way
> (explicit conversion from big endian to little endian).
> 
>> Also it looks like it will
>> access uninitialized memory if skb->len is not 4 bytes aligned.
>>
> 
> There is a few lines above a special code to prevent from such a
> situation ((unsigned long)bufaddr & MTIP_ALIGNMENT).

The problem here is not with memory buffer alignment, but with the
packet length, that can be not a multiple of 4. In such a case the last
swap will do an out-of-bound read touching uninitialized data.

>>> +	bdp->cbd_sc = status;
>>> +
>>> +	netif_trans_update(dev);
>>> +	skb_tx_timestamp(skb);
>>> +
>>> +	/* For port separation - force sending via specified port
>>> */
>>> +	if (!fep->br_offload && port != 0)
>>> +		mtip_forced_forward(fep, port, 1);
>>> +
>>> +	/* Trigger transmission start */
>>> +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);  
>>
>> Possibly you should check skb->xmit_more to avoid ringing the doorbell
>> when not needed.
> 
> I couldn't find skb->xmit_more in the current sources. Instead, there
> is netdev_xmit_more().

Yeah, I referred to the old code, sorry.

> However, the TX code just is supposed to setup one frame transmission
> and hence there is no risk that we trigger "empty" transmission.

The point is that doorbell ringing is usually very expensive (slow) for
the H/W. And is not needed when netdev_xmit_more() is true, because the
another xmit operation will follow. If you care about performances you
should leverage such info.

> 
>>> +	/* First, grab all of the stats for the incoming packet.
>>> +	 * These get messed up if we get called due to a busy
>>> condition.
>>> +	 */
>>> +	bdp = fep->cur_rx;
>>> +
>>> +	while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
>>> +		if (pkt_received >= budget)
>>> +			break;
>>> +
>>> +		pkt_received++;
>>> +		/* Since we have allocated space to hold a
>>> complete frame,
>>> +		 * the last indicator should be set.
>>> +		 */
>>> +		if ((status & BD_ENET_RX_LAST) == 0)
>>> +			dev_warn_ratelimited(&dev->dev,
>>> +					     "SWITCH ENET: rcv is
>>> not +last\n"); +
>>> +		if (!fep->usage_count)
>>> +			goto rx_processing_done;
>>> +
>>> +		/* Check for errors. */
>>> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH |
>>> BD_ENET_RX_NO |
>>> +			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
>>> +			dev->stats.rx_errors++;
>>> +			if (status & (BD_ENET_RX_LG |
>>> BD_ENET_RX_SH)) {
>>> +				/* Frame too long or too short. */
>>> +				dev->stats.rx_length_errors++;
>>> +			}
>>> +			if (status & BD_ENET_RX_NO)	/*
>>> Frame alignment */
>>> +				dev->stats.rx_frame_errors++;
>>> +			if (status & BD_ENET_RX_CR)	/* CRC
>>> Error */
>>> +				dev->stats.rx_crc_errors++;
>>> +			if (status & BD_ENET_RX_OV)	/* FIFO
>>> overrun */
>>> +				dev->stats.rx_fifo_errors++;
>>> +		}
>>> +
>>> +		/* Report late collisions as a frame error.
>>> +		 * On this error, the BD is closed, but we don't
>>> know what we
>>> +		 * have in the buffer.  So, just drop this frame
>>> on the floor.
>>> +		 */
>>> +		if (status & BD_ENET_RX_CL) {
>>> +			dev->stats.rx_errors++;
>>> +			dev->stats.rx_frame_errors++;
>>> +			goto rx_processing_done;
>>> +		}
>>> +
>>> +		/* Process the incoming frame */
>>> +		pkt_len = bdp->cbd_datlen;
>>> +		data = (__u8 *)__va(bdp->cbd_bufaddr);
>>> +
>>> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
>>> +				 bdp->cbd_datlen,
>>> DMA_FROM_DEVICE);  
>>
>> I have read your explaination WRT unmap/map. Actually you don't need
>> to do any mapping here, 
> 
> There are 16 cbd_t descriptors allocated (as dma_alloc_coherent). Those
> descriptors contain pointer to data (being read in this case).

I'm referring to the actual packet payload, that is the buffer at
bdp-cbd_bufaddr with len bdp->cbd_datlen; I'm not discussing the
descriptors contents.

> Hence the need to perform dma_map_single() for each descriptor, 

You are not unmapping the descriptor, you are unmapping the packet payload.

>> since you are unconditionally copying the
>> whole buffer (why???)
> 
> Only the value of 
> pkt_len = bdp->cbd_datlen; is copied to SKB (after byte swap_buffer()).

The relevant line is:

		skb_copy_to_linear_data(skb, data, pkt_len);

AFAICS that copies whole packet contents, which is usually quite
sub-optimal from performance PoV.

>> and re-using it.
>>
>> Still you need a dma_sync_single() to ensure the CPUs see the correct
>> data.
> 
> The descriptors - i.e. struct cbd_t fields are allocated with
> dma_alloc_coherent(), so this is OK.

I'm talking about packets contents, not packet descriptors. Please
re-read the above and have a look at other drivers code.

An additional point that I missed in the previous review is that the rx
allocation schema is quite uncorrect. At ring initialization time you
allocate full skbs, while what you need and use is just raw buffers for
the packet payload. Instead you could/should use the page pool:

Documentation/networking/page_pool.rst

That will also help doing the right thing WRT DMA handling.

>> This patch is really too big, I'm pretty sure I missed some relevant
>> issues. You should split it in multiple ones: i.e. initialization and
>> h/w access, rx/tx, others ndos.
> 
> It is quite hard to "scatter" this patch as:
> 
> 1. I've already split it to several files (which correspond to
> different "logical" entities - like mtipl2sw_br.c).
> 2. The mtipl2sw.c file is the smallest part of the "core" of the
> driver.
> 3. If I split it, then at some point I would break bisectability for
> imx28.

Note that each patch don't need to provide complete functionality. i.e.
patch 1 could implement ndo_open()/close and related helper, leaving
ndo_start_xmit() and napi_poll empty and avoid allocating the rx
buffers. patch 2 could implement the rx patch, patch 3 the tx path.

The only constraint is that each patch will build successufully, which
is usually easy to achieve.

A 2K lines patches will probably lead to many more iterations and
unhappy (or no) reviewers.

/P



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634FBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqJrxIoT0NsSUqxGw8G610oIR60/B2YKtR0eMCHfHoU=; b=yInj17SymFxlXP0XrRXoNKxU39
	7OouUOk4WJbxR+oA8DgOZtGPyjnUp73POLTceAagNUjNx5Lv+T+ASO4XgtXSojA0mRcoYVFnyUgnG
	VCAg0lgDHHMWO6N12frOsvUs6YV2twvbHRU/NMscxoWEA33W5wAIVhVQF2+xEkRFbExHVxtuP3ngC
	RPbZHpoIdO6xdjdkIZrJp28MX/i+YhWJw20g5oEuqA/UvIHRcOneX4KIWA/HtaupdDxuvRR2xIXXa
	Pjo5qROc0NTrlCoyJjQ8k0Xw1VMuszNCxhx59MOYy9KLRSgzkktdcOUTeRP5Ix3VE27Nwj9LVTiqf
	3CV+nJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHkP-0000000ByDE-4AFg;
	Tue, 06 May 2025 12:50:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFff-0000000BahF-2lBB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746527826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqJrxIoT0NsSUqxGw8G610oIR60/B2YKtR0eMCHfHoU=;
	b=TAxknJin3mO1Yzx8FDeV7Gk7zqlSa55v4pM6Yt43X+fcFygAx18bGfFBexpVhjHVHkG002
	Qv5FzazlSONAafiMxdyq/vJcAgsMYV31t5JPjdxFvkIEpVxjE8kwNhW7OkKKu3+VCeEtaH
	KJvg1g+yBFiAre0C3t/MIbo2wbrJbWQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-ZFoD7haLNkaFNjCmVHkQmA-1; Tue, 06 May 2025 06:37:03 -0400
X-MC-Unique: ZFoD7haLNkaFNjCmVHkQmA-1
X-Mimecast-MFC-AGG-ID: ZFoD7haLNkaFNjCmVHkQmA_1746527822
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d917b105bso2744400f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527822; x=1747132622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqJrxIoT0NsSUqxGw8G610oIR60/B2YKtR0eMCHfHoU=;
        b=jcDOEVYSOcuLmevgVTR5XRIoQUmYDtTzkNqZxX58KcN5xNkk8oxW0hIr/G6UgPg3Xy
         N14XO7CKiHIkyVLwLnxPS7lAvUE2H1WmhblLqlS53ubjYBGdfno1l02dHh11JONDoSsO
         HpmtMnrswk8k3dc7uqjy1WFckmr0J3zlzpZORVF5KW1Wl2wd+lfEUJjTap0O5XapF2lv
         RAccsq5OJPv8z3y+80cO80JEY8DO7V2tQkTwNusv77bDtmrTkb5GFDmmnoZ1ws3gm/pG
         sKRC58jHbrqSEIGQgOaZWOkcyG5ZnOQfIE4qBl24z7CDGAxpxpkLv7q73xrRHaQcwJMq
         zybQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZTNAwysx/Ie9HB8uUvZQrkgwNWPdxjmNPeqn253DwF8Imih+qQnzxWu6N/mzBSqpuHsVY1M8d60SP23AHs02c@lists.infradead.org
X-Gm-Message-State: AOJu0YztO650ON1oyin/+43CFua8DzaphQSR3QqeM6ATobmhOh27sS7E
	2hPFnRTWb2lyimcx9VagMEWPV2hSSey7l8bo2g6mTo1jlgFSkikM7UopmnEKSLkNdetEAnh6/Df
	ewJb2h45DhxpD9wvxTxPlhLrSHCTgy4mESMYShEgcIuSv6r7RzNr9AU251rc8T0Zgu8DFR9Kd
X-Gm-Gg: ASbGnctjKskjsNOyvzdyJO5BGDagSspsZqHNdxSGG1EpglJ3fMHqcyLPXAHEm2mpLv1
	v5zl+Clo4V1pyLtyfw/TzlcgIedq27O8/v/+hpSFppMoWBGhHS5s91dk4tAyts1EBOOqX9fmMsB
	o8HJJV1+Se6s/opMVx72OjHHdMNrWq/Auu1HAjF99a7mRbZB8ZZziZbBBm7MU0Gr0cfe6EDhGFR
	vOHmLJhrX0OOqLmIKBBgMbW7rT4/ilmSh34NY+B5lqQ541DoFvOxolx+Kee+fIjjUb850zQjZQk
	pYzPpQSkbg5AzmxG0eLJsxbeRy/PZTTdzSlITzfxYbl7a52NE25LUzaFZ5k=
X-Received: by 2002:a05:6000:4383:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a0ac0ec4a6mr1662165f8f.33.1746527822126;
        Tue, 06 May 2025 03:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIqkSxt+T1Y7TtJsOmByWaD3BgViww9S8kLQLobpWHpxjPJOZvKt1Y7bskuQM3nS0/SlP2Zw==
X-Received: by 2002:a05:6000:4383:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a0ac0ec4a6mr1662118f8f.33.1746527821579;
        Tue, 06 May 2025 03:37:01 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a2874asm162916855e9.26.2025.05.06.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:37:01 -0700 (PDT)
Message-ID: <61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
Date: Tue, 6 May 2025 12:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250504145538.3881294-1-lukma@denx.de>
 <20250504145538.3881294-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250504145538.3881294-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I7pr2uZab48MIsCgT_W83-eyZLijue1m6t7nbQWGJGg_1746527822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033707_775151_4118FB99 
X-CRM114-Status: GOOD (  16.85  )
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

On 5/4/25 4:55 PM, Lukasz Majewski wrote:
> +		/* This does 16 byte alignment, exactly what we need.
> +		 * The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
> +		if (unlikely(!skb)) {
> +			dev_dbg(&fep->pdev->dev,
> +				"%s: Memory squeeze, dropping packet.\n",
> +				pndev->name);
> +			pndev->stats.rx_dropped++;
> +			goto err_mem;
> +		} else {
> +			skb_reserve(skb, NET_IP_ALIGN);
> +			skb_put(skb, pkt_len);      /* Make room */
> +			skb_copy_to_linear_data(skb, data, pkt_len);
> +			skb->protocol = eth_type_trans(skb, pndev);
> +			napi_gro_receive(&fep->napi, skb);
> +		}
> +
> +		bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, data,
> +						  bdp->cbd_datlen,
> +						  DMA_FROM_DEVICE);
> +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
> +					       bdp->cbd_bufaddr))) {
> +			dev_err(&fep->pdev->dev,
> +				"Failed to map descriptor rx buffer\n");
> +			pndev->stats.rx_errors++;
> +			pndev->stats.rx_dropped++;
> +			dev_kfree_skb_any(skb);
> +			goto err_mem;
> +		}

This is doing the mapping and ev. dropping the skb _after_ pushing the
skb up the stack, you must attempt the mapping first.

> +static void mtip_free_buffers(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	bdp = fep->rx_bd_base;
> +	for (i = 0; i < RX_RING_SIZE; i++) {
> +		skb = fep->rx_skbuff[i];
> +
> +		if (bdp->cbd_bufaddr)
> +			dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					 MTIP_SWITCH_RX_FRSIZE,
> +					 DMA_FROM_DEVICE);
> +		if (skb)
> +			dev_kfree_skb(skb);

I suspect that on error paths mtip_free_buffers() can be invoked
multiple consecutive times with any successful allocation in between:
skb will be freed twice. Likely you need to clear fep->rx_skbuff[i] here.

Side note: this patch is way too big for a proper review: you need to
break it in multiple smaller ones, introducing the basic features
separately.

Cheers,

Paolo



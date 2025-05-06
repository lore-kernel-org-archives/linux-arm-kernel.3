Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1187C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBp4p4deqUzAG3SrieVeuIkuCgjpw2beSF6aI8YLfpc=; b=P07vt3aNT+mEidZUErzbACPGGl
	yDbmtxTcvUR8XYj5ZQUmbwWAtl5qM5MYVmJDxn2bb70EIldWGqX7yvoNLrPD3teP+dBb4PC6RLyF+
	eGgqDcZ33dqNim5NTptdHYWwUsm7dNbGShPGKO/JOCqTYxFAZzhOgQkERk2tXjtduANa3ieOGp99C
	Sqvgf1MfVNFRAvFqEuOD5Zda4zWn5kCQC/NAU9PmgEYCBGQHXD8Pr7DblnVEhbBSI1cTwDbQE/W+x
	Xjr8iqF9DeTNm2YVfbiehsPhnqz9Y+r/hOLD6qEgZiinVwCOOa9x2eVeRmPuFSqYO4Wu/ywyAKYdH
	MW41m1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIjg-0000000CD6R-2p7I;
	Tue, 06 May 2025 13:53:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGOV-0000000Bigi-3NwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746530606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBp4p4deqUzAG3SrieVeuIkuCgjpw2beSF6aI8YLfpc=;
	b=dltudh91B+x5OHPma7F7RqaTfhA5qEuZiNW0QRMOsj0OeWydV1aVfHzPhjyhHE+l+9iP5C
	PtWxgi8MfbNhHHUG01gTfN9eWfs91hdD2Czpb6jdnHcHHhX6DOogdbGgsFBxNHJ4Ra7TE8
	9shA/x4hxsWgHfLdbp/q/i5TSrPR5Jk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-RImgqNmlNnCsb4Ag8XNCdw-1; Tue, 06 May 2025 07:23:25 -0400
X-MC-Unique: RImgqNmlNnCsb4Ag8XNCdw-1
X-Mimecast-MFC-AGG-ID: RImgqNmlNnCsb4Ag8XNCdw_1746530605
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so30954015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530604; x=1747135404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBp4p4deqUzAG3SrieVeuIkuCgjpw2beSF6aI8YLfpc=;
        b=TEytmaP9Jl/b33FUMns19DLeYgIUl1Ugio2XAHENqxppxpwud6LVyGCLptxAWAGtk2
         ZsK5Cidu+CCi5Kc1cS6mLMxI1VlcJWpPufXzEh/IUnEDHkFZF+D79RVeVheG9pcdvQa/
         tcsc+M4pQaj491zx6wqfv/5K/w1xxPGQTdxBQw8rn7dLnF2nDHiCaW5hfsI/T+yTyj1m
         NXOIWf7Aavk/HN96WRYUhIIzZQccGrtbjA9C0Dm90cKvaLAHx/1p4JQTlHF7nLPtr3/b
         95oKOZkO8mXT6T666t13KoUw/AaU2JiYsPkNRXRur28i3w8+T961+lUJVqxCBsadoMi5
         zpWw==
X-Forwarded-Encrypted: i=1; AJvYcCVdF8GiGsZ97Iq5KXcpSrIAyBmqfh0VFDQUA2G7bx82j6EymXtugjo4LFnpBGU3mMCSRsX0f1idLYgqQv2a8MQ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Hdnu/uC8hK3FbBDlP6zprJ0eZJ/ZnCZPRJvjSZtUW3YDZCEJ
	MuRR9r8wjbApCMqstF8R341QEShSwa9MWtI6BWNxubuMtcPD8FYm9F3D7VBDXhV5YqKUYnGa6pk
	vamVORasuVUd6Sw93/DtKgiU5x7KOhtghaa5CYtPnXELTbvrgdxx0Ic3cP1+5jRYQFxOuxaPvSY
	VXl647yLg=
X-Gm-Gg: ASbGncvkoV8ODoCocipsUjwUPDegM70gsYR4Ps5UHdZtZ/fi6DGgFU9SU9iFS2tlQkg
	D7pWmwDDtuxniVm1klsukBI4Y2TgiiaTc018a2nIJxmFSlP7F7bxbeCBu4YVIJ3ZRSUSREbhWSj
	vnpNveK0cMDSV8dFZrEpfPVXrxCDR4mp/8Z02ggQwRCLJmnFMGdm2ka6fBm53X1fVlTFl1ITuM4
	Gn4YPYBzK/tmqkxxrS6J00yvSrKIXR6QhLf62/oNM9JeA+T4vZPm49udW8O3QerTwvuVbDXMZ5T
	3QJk/VDqcYU4uOGUDLL6NSBwNQWWdQktFg7f4lnYkbo08syfB4CpSMLeYps=
X-Received: by 2002:a05:600c:1d1f:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-441d1014fcfmr16250015e9.28.1746530604240;
        Tue, 06 May 2025 04:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeYO2F4emx5hXi1uWB9URVLSGX9o9e7D7vvbT0onpTpSIZrGfufwgIJiasWRhRjn91m92mTQ==
X-Received: by 2002:a05:600c:1d1f:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-441d1014fcfmr16249785e9.28.1746530603759;
        Tue, 06 May 2025 04:23:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7ab1sm212836775e9.4.2025.05.06.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 04:23:23 -0700 (PDT)
Message-ID: <3e91e070-24a2-4dab-bca5-157fea921bf0@redhat.com>
Date: Tue, 6 May 2025 13:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
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
References: <20250504145538.3881294-1-lukma@denx.de>
 <20250504145538.3881294-5-lukma@denx.de>
 <61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
 <20250506130438.149c137e@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250506130438.149c137e@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bkon7cb9kR4upCjKIoZQcR118B8xxklyt3kj2aZXuwA_1746530605
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_042327_934931_2183E6DB 
X-CRM114-Status: GOOD (  16.08  )
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

On 5/6/25 1:04 PM, Lukasz Majewski wrote:
>> On 5/4/25 4:55 PM, Lukasz Majewski wrote:
>>> +		/* This does 16 byte alignment, exactly what we
>>> need.
>>> +		 * The packet length includes FCS, but we don't
>>> want to
>>> +		 * include that when passing upstream as it messes
>>> up
>>> +		 * bridging applications.
>>> +		 */
>>> +		skb = netdev_alloc_skb(pndev, pkt_len +
>>> NET_IP_ALIGN);
>>> +		if (unlikely(!skb)) {
>>> +			dev_dbg(&fep->pdev->dev,
>>> +				"%s: Memory squeeze, dropping
>>> packet.\n",
>>> +				pndev->name);
>>> +			pndev->stats.rx_dropped++;
>>> +			goto err_mem;
>>> +		} else {
>>> +			skb_reserve(skb, NET_IP_ALIGN);
>>> +			skb_put(skb, pkt_len);      /* Make room */
>>> +			skb_copy_to_linear_data(skb, data,
>>> pkt_len);
>>> +			skb->protocol = eth_type_trans(skb, pndev);
>>> +			napi_gro_receive(&fep->napi, skb);
>>> +		}
>>> +
>>> +		bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev,
>>> data,
>>> +						  bdp->cbd_datlen,
>>> +						  DMA_FROM_DEVICE);
>>> +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
>>> +					       bdp->cbd_bufaddr)))
>>> {
>>> +			dev_err(&fep->pdev->dev,
>>> +				"Failed to map descriptor rx
>>> buffer\n");
>>> +			pndev->stats.rx_errors++;
>>> +			pndev->stats.rx_dropped++;
>>> +			dev_kfree_skb_any(skb);
>>> +			goto err_mem;
>>> +		}  
>>
>> This is doing the mapping and ev. dropping the skb _after_ pushing the
>> skb up the stack, you must attempt the mapping first.
>>
>>> +static void mtip_free_buffers(struct net_device *dev)
>>> +{
>>> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
>>> +	struct switch_enet_private *fep = priv->fep;
>>> +	struct sk_buff *skb;
>>> +	struct cbd_t *bdp;
>>> +	int i;
>>> +
>>> +	bdp = fep->rx_bd_base;
>>> +	for (i = 0; i < RX_RING_SIZE; i++) {
>>> +		skb = fep->rx_skbuff[i];
>>> +
>>> +		if (bdp->cbd_bufaddr)
>>> +			dma_unmap_single(&fep->pdev->dev,
>>> bdp->cbd_bufaddr,
>>> +					 MTIP_SWITCH_RX_FRSIZE,
>>> +					 DMA_FROM_DEVICE);
>>> +		if (skb)
>>> +			dev_kfree_skb(skb);  
>>
>> I suspect that on error paths mtip_free_buffers() can be invoked
>> multiple consecutive times with any successful allocation in between:
>> skb will be freed twice. Likely you need to clear fep->rx_skbuff[i]
>> here.
> 
> I don't know what I shall say now.... really... 

I suspect my email was not clear. AFAICS the current code contains at
least 2 serious issues, possibly more not yet discovered due to the
patch size. You need to submit (at least) a new revision coping with the
provided feedback.

Thanks,

Paolo



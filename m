Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED8C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWu2mrsEBIWGkWqeUeYJyw5B2ia475IvzX8OU4kWUv4=; b=JIDFWsXlnTdy5YA304iATMHZkz
	qUQRYuTXNcWkjRI+H/6qn51FeNX6GJmeTWdbIsJUFKGnt3QGiW/dvitzRvfb2KZgi8ZLzPtBctwrE
	vsyAJzxPXX7HUWS+1vxhxqf+tlcLX5Eb+6Vb+FlxrqCqwEHPWNoXlQ9YxvyNiwxoWnnG++uvR/JUH
	7lUHZ8hQdpeoLQFtyuFhVD8iIJJbLilNW065TIby2R0NoOiHOfOE4lrbAmp3c4wGxo4Axn42BGEWk
	c0/TdwW8GjMtTD2ZcRFWv11PT25RL1/+YNs1JbCNkavDzHOIb9wn4KP09ZPUOteLjwj30UWz0apdz
	jyFf3Reg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrgg-0000000ATxq-3jD9;
	Tue, 27 May 2025 10:37:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJreY-0000000ATmC-2VqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748342125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWu2mrsEBIWGkWqeUeYJyw5B2ia475IvzX8OU4kWUv4=;
	b=itLh3ljCWwbgPS2cHmP3Fg0NZDlJ5dX5aog/jHgT6O1Dp8kvE1P9OcZ1y3dyKIqtJP/5b8
	V4ZHH0RxRD16Eqn+twIEe+c5c9hozWiX6IKXeVltirAfhSK50f2J7eZ1U9vy7lmrTZ3OAO
	0G0ZZjNELjSrf02FpGM32DxoN8ELig4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-2V7czdrMOzmHn4knpMvTcA-1; Tue, 27 May 2025 06:35:24 -0400
X-MC-Unique: 2V7czdrMOzmHn4knpMvTcA-1
X-Mimecast-MFC-AGG-ID: 2V7czdrMOzmHn4knpMvTcA_1748342123
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1269617f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 03:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342123; x=1748946923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWu2mrsEBIWGkWqeUeYJyw5B2ia475IvzX8OU4kWUv4=;
        b=pzNI3s6JNZzKUHGjnqCyDBerzxZ9OF0UAMBDLRCtvZiLv+sACfymp9MR3Dz3kvVvka
         cdLl2TbHzxor1Tdjc+p5oXZgab0356CVDD8Po0mUdP/65wygf0TnhyQ30cfDACLRnIuW
         rXtXy11o+YQ4UMoR29qnG6H7BJ+L8Tz2wvjkaFDZk49hIURZkrCYPb1T4bzeqc7E2Lhv
         Wo9IEhlGeqiElGY4Wp6LYaXvsyZyBsibFw6TsH9dB+nQB5rzkJQ+0CDqfHBnxNztp3b+
         cM9WqaDAVkivrgj0wWaU3MN73NMhbhBcpJbA9O93deMI9csrASZMMfZs+iT+ZxrN8gvL
         eXWw==
X-Forwarded-Encrypted: i=1; AJvYcCVtPGkQkKwlcRbbK0duM2+K+Elq2NYqtKhgbdA/3ckbhQ3Vmno34cIp4CdTFImRvTQ3r+s+jUCL+EFlYe2TDpNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2kME3RvRwxib2j67Z8mOqDGLAaYw5rpdUp3frnBYWURHhfu8Z
	WwQI54yws4oBlRWK+2TifVy4Q5FZbvNo37oU98xfd/STbRsYuiuwVym/ZJPVABP5ddyqAhaePfJ
	P8re2RywC9n+5Vd5lAXGJnAqNSbB2gR6NDv9402IK8LQMYxu3z5zuRnwK8aO4BOalkzVQo0yM/c
	M5
X-Gm-Gg: ASbGncvkAfOfg0HA+D5wYYqjo8k+6amPH47FKHcyIHtK3zsK41bYaDTLq3uAhZEdD93
	s7gZzxnnqbnSiZ5ndYhZzCepqcGIB+YUiucXOJhDtLgBRjcGjySldNDmg6koc3TUbtRyXEqfOU5
	2KcFCqKQfIR+f1IRU+ieBut/dzxfrLjAAZZSGXddKFvL+StAQvO4WhAr9ypq7BMK4r/ml6WLioy
	KJikKKAQrlUV/ALvNoN49Zk4Du7KJwD4M+6B5qYk+0YVaBR7PY4D/jMhB0DS970xlg7PrPCEHtj
	qxL0xYxKwVD2HXXT9P8=
X-Received: by 2002:a5d:6e5d:0:b0:3a4:cc6a:4707 with SMTP id ffacd0b85a97d-3a4cc6a47afmr8067293f8f.48.1748342122854;
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Z0+wYgjwb+KMEhoIXQs6NQqsPmlcJox8t+LPqcLdWR6Idrt6pQtkHSyvpeUNQ/WjbvgQNg==
X-Received: by 2002:a5d:6e5d:0:b0:3a4:cc6a:4707 with SMTP id ffacd0b85a97d-3a4cc6a47afmr8067256f8f.48.1748342122498;
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ab8sm262443105e9.13.2025.05.27.03.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
Message-ID: <ec6487a8-277f-474b-b9ef-273a7f160604@redhat.com>
Date: Tue, 27 May 2025 12:35:19 +0200
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
 <20250513073109.485fec95@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250513073109.485fec95@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4OIUTDNy7J_r9eC6R1mo7LokQ8LEjuq2dO3yEjdtvxE_1748342123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_033526_721302_0778EB8A 
X-CRM114-Status: GOOD (  17.76  )
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

On 5/13/25 7:31 AM, Lukasz Majewski wrote:
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
> 
> I've double check it - the code seems to be correct.
> 
> This code is a part of mtip_switch_rx() function, which handles
> receiving data.
> 
> First, on probe, the initial dma memory is mapped for MTIP received
> data.
> 
> When we receive data, it is processed and afterwards it is "pushed" up
> to the network stack.
> 
> As a last step we do map memory for next, incoming data and leave the
> function.
> 
> Hence, IMHO, the order is OK and this part shall be left as is.

First thing first, I'm sorry for lagging behind. This fell outside my
radar. Let's keep the conversation on the new patch version, it should
help me to avoid repeating this mistake.

/P



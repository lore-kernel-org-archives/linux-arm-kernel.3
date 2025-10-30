Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C821DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WMVXs8TQMP3kSanWp9H8RTwHILJeUuZYlKUFoW3Nlw=; b=NJfl5GpjJXSr2k+xw94DQV6AQc
	f+Wwc0D58yFffqFxNeUTKwpfLrO9Z9JpmxFWADvSPrVBHQSE4+uTfEWHYK7UqUfPr+kCzANm6yLZB
	OhmbZF+ZQ23nf7JHNDo9XDUza09PvvvKSyuTkpC53JYYAWjYTOLBgyiF2bBWKGvqSd66DN/TUloVu
	2SnWFg51HBN47jV1x+MN12+VQIl2h3QNxyxlHQ70lYKsNva2EQQP+S4QBGqGi1NE1ddLKuRvy0MkM
	xlw9kQwFhD9St/rdnEZa32Lfcv5iZnq2gIY3NHvS8UIHE8+yfNc7mMz++xG5Vo8XdbqTriJ9At1Dw
	nMmqZkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlv-000000047ZI-39qx;
	Thu, 30 Oct 2025 12:28:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlr-000000047YD-3gaG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761827329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WMVXs8TQMP3kSanWp9H8RTwHILJeUuZYlKUFoW3Nlw=;
	b=A0LW+ue8xSq37qODwE/SfXSorgI0WFb9q6F0bfaunm3r084Ibu8fbyvgz9rK3LNFyIs9KG
	tJH7n7JHa79HqJCqxEyLoobStESqLnLi2GqwejlFEpq4EqimTAIlMBVyh3NyKCvW5ZO37O
	/dVkacldbuQ62JM35d+J011/iGnR4Dk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-THyxp5Q5PsiPpiiwIPK8JA-1; Thu, 30 Oct 2025 08:28:48 -0400
X-MC-Unique: THyxp5Q5PsiPpiiwIPK8JA-1
X-Mimecast-MFC-AGG-ID: THyxp5Q5PsiPpiiwIPK8JA_1761827327
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47106720618so10071615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827327; x=1762432127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WMVXs8TQMP3kSanWp9H8RTwHILJeUuZYlKUFoW3Nlw=;
        b=heBdEVw1TJPJjsi4zzYLq8rNMrVzixVFg+p7F3hWE4PtoRurX2rPokGuN1SEOnHQUL
         wwfh6UJHMxegrRo1i5DwbvIKBij8bmVxB0Udxn0QCwq6SlnFwqrMruWYY3gR0R1BQJ+8
         NVH7ETlqMrhCnq1ru8IZz45bsg74TIMvKvWnIbNwe9xFYvppxoeo9XMLegRs58qFcMKG
         GoAwce8X8s7liC62/qr1dh6K8gsbJlQl0rPC5/CPCcSrRa3TbEThjT8ZMFS0+RKe2t9Q
         UHLRe0BSzQ3HDjaXa4yaOL/AKyvH+jLdJhBDP1mnsFO33/pIw1OYkaKMz4CAI/9EIrIB
         Ck6w==
X-Forwarded-Encrypted: i=1; AJvYcCV7MJpfOZfwRTX1iWqAQaGOXusyx8NGRO0BVK0XXKQUEBNlKfj3sWKIO7G/ZiDys4Nbe5yTsT7RhbJrhfqp1q7a@lists.infradead.org
X-Gm-Message-State: AOJu0YwWfyBiarGoi3jjIJ1baUNEVhifRhg1+5AnyGmyIes3BqHhhleA
	B+w5ao/suV79nYmgmC5ZMykuZhbvogcjLfpnpyA5jAQiqhon+E7jWkM6ptdE8qD+EHY6PM1S9kQ
	yiUZpZaJ5PzwvrG650///ImXPdn13/BVTQPC9FcYOZCYZYlXvSb7l7T+ZDNZBBrCSvRhkZDVS7S
	/d
X-Gm-Gg: ASbGncs1ObRCryWdD4MVeeH4q7NHPqIB+p5FIyyTWZb2w4lUdRUl5Tgtw82zysjc4tV
	Swo4OTOzBucP39YyciJ9bDusTH7Ul9DID/mJWRZKCuyQYs4hX8Hfs/S36G6jsbP36m46XopIZPr
	D6S4cnHndTWZxSd8wpefuHSSbDWepYpJRmnq+jnUJAgS1NAk1tQqLuWMuf6tXNgvuG7cKHgGM4A
	DD8Q0cSRlLs5rJJApT0q/8bB0Kvf6vmxyoJN1hA1ILFwmdj5OI7dXKSLJbOS4sjI2Kv/P+wiolc
	LDBn+JE+05ivOSLN1ByEdnuoVlHNdINdY3mnadMHDinVo+c232dFxTNYm6UHCaiHXYQvHDljVNp
	qVzK91TCUNA+Hc2NXL4t79722mRfoNXfKORo5/ahJcKPu
X-Received: by 2002:a05:600c:4511:b0:477:e66:4082 with SMTP id 5b1f17b1804b1-4771e1ec1d1mr66499285e9.29.1761827326744;
        Thu, 30 Oct 2025 05:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQc3JgzM1QEslivftQlK3inQluENUMNYgDE1rjtok3+8IGknzl6HMn3biCdPkc1D7PQaX66g==
X-Received: by 2002:a05:600c:4511:b0:477:e66:4082 with SMTP id 5b1f17b1804b1-4771e1ec1d1mr66498985e9.29.1761827326363;
        Thu, 30 Oct 2025 05:28:46 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm41187325e9.6.2025.10.30.05.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 05:28:45 -0700 (PDT)
Message-ID: <154ebe12-6e3c-4b16-9f55-e10a30f5c989@redhat.com>
Date: Thu, 30 Oct 2025 13:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553930.5396.4492315010562655785.stgit@firesoul>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <176159553930.5396.4492315010562655785.stgit@firesoul>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r5zyzPUQ7q8wj4M4wVDqS7PZuiPq_t0jdRgPEKq8quw_1761827327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052852_350976_EA841BE7 
X-CRM114-Status: GOOD (  14.92  )
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

On 10/27/25 9:05 PM, Jesper Dangaard Brouer wrote:
> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
> about to complete (napi_complete_done), it now also checks if the peer TXQ
> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
> reschedule itself. This prevents a new race where the producer stops the
> queue just as the consumer is finishing its poll, ensuring the wakeup is not
> missed.

[...]

> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
>  	if (done < budget && napi_complete_done(napi, done)) {
>  		/* Write rx_notify_masked before reading ptr_ring */
>  		smp_store_mb(rq->rx_notify_masked, false);
> -		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
> +		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
> +			     (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
>  			if (napi_schedule_prep(&rq->xdp_napi)) {
>  				WRITE_ONCE(rq->rx_notify_masked, true);
>  				__napi_schedule(&rq->xdp_napi);

Double checking I'm read the code correctly. The above is supposed to
trigger when something alike the following happens

[producer]				[consumer]
					veth_poll()
					[ring empty]
veth_xmit
  veth_forward_skb
  [NETDEV_TX_BUSY]		
					napi_complete_done()
					
  netif_tx_stop_queue
  __veth_xdp_flush()
  rq->rx_notify_masked == true
					WRITE_ONCE(rq->rx_notify_masked,
						   false);

?

I think the above can't happen, the producer should need to fill the
whole ring in-between the ring check and napi_complete_done().

Am I misreading it?

/P



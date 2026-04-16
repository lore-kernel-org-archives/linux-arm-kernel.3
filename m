Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF50F8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=; b=rjjuk5Fn7v2Y1ldDJdQnMmdEXG
	NM6YYjblf/9hKY+HEqPeIcqouO8NfDw87zgQDREqQA62zSmdPmrV+CL/QyZAGnHxzq4FdLsB879fx
	ooysRe61FAgTHtaCvsWu1ydRESJxhZFNwTl+VLwZEVtXamwBrXfCjSxOgZ3CsaFLV6ROQA8rlQFNq
	nBkpeQEiHF9MmHvqzfdhF5SmGTp2Tw4OiCUsjpk3n233uUuU6FNQeZGjUKgbpzR4IaKHFkNmN+0Nw
	eU0k1k/YzurdSI3UqDuJ2MNO28newH4QEU8SqvaCyuwqHPwtGkbqlHc4kiWTDIPFEKP9eVIlM47N1
	OqIPYfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIL3-00000002Bes-3LQz;
	Thu, 16 Apr 2026 08:44:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIL0-00000002Bdm-3pKa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 08:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776329077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=;
	b=QfceV0A0EUmk1ILh6tf5xgOrvcaxXklxh7ObZ9ggBgqKYsSTH0lmRa0XDIHp5ZjkOXoGG/
	+jU1Rr5mL6g7RfjB+srhDtSglAMBNB3FYeNK3WfuBryLv+D1RceLEma1CCWalZa0rGMC58
	pGurTlbCur++T4aUiuDeAHzd2qa+gec=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-qi5MCjQoMsWKDSEefJKJmQ-1; Thu, 16 Apr 2026 04:44:36 -0400
X-MC-Unique: qi5MCjQoMsWKDSEefJKJmQ-1
X-Mimecast-MFC-AGG-ID: qi5MCjQoMsWKDSEefJKJmQ_1776329075
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so63833125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 01:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329075; x=1776933875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=;
        b=X4kU2S+hAxc47KM1yiLrjEsbSDcWMOYmWqAi3z7us8SXO+4+HyxvW2FYSZgRi/MZ8d
         FXwoTQIA+D9Om1XG6t7p6Nk+sMI0h3dAswxLOm3aVooNvA3rtdEEjmgJUx4Q0ksNx1GB
         x4GjDA4ybDtszijJPC/seDo9mIle9ukqQUOcEAWJtTCsKr03Aj8Le6Iw67U1tn6Rk1uw
         qWRvAyxIczQH8nT7qYFhmK0sb5QJyARwB2FCBFsxzy1OJIMB2pbytTR6Fds0j71chiPo
         XH8QTI15mod/OlH2g+FIoLw1AEzWMmN6qKZOB9aENRyrpPIWyR1O9se03TXKXk5mdxjb
         nesg==
X-Gm-Message-State: AOJu0YzGUk791ZICS7PUa2TpcgFmMm0bMNd040pXUvlM0W7mU7mUKauE
	q8FVRq1xujjmqJJzdFt9T19Xhd3zjC0GErzQfNU14Hqy6Rxf1GdE9zdxPUvcTJbC4Pgnhh+6nyt
	aUx5zoqyaxHGiEHe1/ZLjWgB422OHk3sdNWcVeBDZ/ZhFhaniFjMl1ruDv1V1ANLBNHT/5CKBsN
	ac
X-Gm-Gg: AeBDietOJvF2p3N/bTWCXqbAUvihSHb3SGyuIRWORbkxRZbzSOY0CnDvIeEssk5w5Sj
	YRBa0BMPWQanEbGsAbV7d33gdrzfU7sNJhRjR0OvDVDzf/CgaZh+G5wubdqdIYk5tOWeQHUhvoZ
	4Af5lmHJXl/cF0LXUEWy2oKSY5qDpYguxS/wwDTBQOuty1zrr8aNWqSANlytlSQ62zFHWz69d4a
	8cL9QUPuNHO9U7sI8JHO4PsVj75z/ldAOPAB1zAxW/QBOg2zjbwvKNUL3l0ks7IJ/WlafXszsxd
	YSd9dUQcKGKsd2+m+O/lm0tWZVtkPfrO97xD6suqLkVdW/bsm1PsKhC3aSpXqs0M7wAaak9fAF+
	SexN7w9ioP2GVIXAyGbmSYlPUlnoEKz2KU2hzDRooQzWDXZd8w82Lsj8oxHGb2nWiynk=
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr323665075e9.1.1776329074612;
        Thu, 16 Apr 2026 01:44:34 -0700 (PDT)
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr323664795e9.1.1776329074141;
        Thu, 16 Apr 2026 01:44:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e306sm42442665e9.11.2026.04.16.01.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:44:33 -0700 (PDT)
Message-ID: <f3315f5a-c5cc-4001-bbd3-bfb4aed080e4@redhat.com>
Date: Thu, 16 Apr 2026 10:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix possible TX queue stall in
 airoha_qdma_tx_napi_poll()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QETpYnmHxlXyV1o2zgPTYrEckPq0n5COHn9yNdG55O0_1776329075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_014439_029976_983BCC3A 
X-CRM114-Status: GOOD (  21.89  )
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

On 4/13/26 10:29 AM, Lorenzo Bianconi wrote:
> Since multiple net_device TX queues can share the same hw QDMA TX queue,
> there is no guarantee we have inflight packets queued in hw belonging to a
> net_device TX queue stopped in the xmit path because hw QDMA TX queue
> can be full. In this corner case the net_device TX queue will never be
> re-activated. In order to avoid any potential net_device TX queue stall,
> we need to wake all the net_device TX queues feeding the same hw QDMA TX
> queue in airoha_qdma_tx_napi_poll routine.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 9e995094c32a..e7610f36b8e4 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -855,6 +855,19 @@ static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
>  	return 0;
>  }
>  
> +static void airoha_qdma_wake_tx_queues(struct airoha_qdma *qdma)
> +{
> +	struct airoha_eth *eth = qdma->eth;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		struct airoha_gdm_port *port = eth->ports[i];
> +
> +		if (port && port->qdma == qdma)
> +			netif_tx_wake_all_queues(port->dev);
> +	}
> +}
> +
>  static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
>  {
>  	struct airoha_tx_irq_queue *irq_q;
> @@ -931,12 +944,21 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
>  
>  			txq = netdev_get_tx_queue(skb->dev, queue);
>  			netdev_tx_completed_queue(txq, 1, skb->len);
> -			if (netif_tx_queue_stopped(txq) &&
> -			    q->ndesc - q->queued >= q->free_thr)
> -				netif_tx_wake_queue(txq);
> -
>  			dev_kfree_skb_any(skb);
>  		}
> +
> +		if (q->ndesc - q->queued == q->free_thr) {

Sashiko says:

---
Can this exact equality check cause a permanent TX queue stall?
The previous logic checked if the free space was greater than or equal
to q->free_thr. If the xmit path stops the queue because the free space
drops to exactly q->free_thr, the hardware queue will have exactly
q->free_thr free slots.
When the NAPI poll routine subsequently reaps a completed descriptor,
q->queued is decremented, increasing the free space to q->free_thr + 1.
Since the free space is no longer exactly equal to the threshold, this
condition evaluates to false.
As NAPI continues to reap more descriptors, the free space strictly
increases, meaning the exact equality check will never evaluate to true
and the netdev TX queue will remain permanently stalled.
---

Please, try to triage sashiko comments proactively. Especially on NIC
drivers, validating the AI statements is extremely cumbersome for the
maintainers.

Thanks,

Paolo



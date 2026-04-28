Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3563FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=; b=WgmYCNXR/MqBR33Ta/WSYKVEaw
	8+sH1Qe+gTDf5EHAYyfH1MLXROaX26WD2i/uOHdwfQtP2ugTF48wdmJx2ztXSEfykQEerbDJxM/fP
	op99JReKCEu2JmnNqGhcFoBHp/C0HjgbTEh1U0DNYthT6Z+nKFQkRZT8/AHhq2LSvC4sBmOS61rJA
	FR6MJE3L1rPa/rRK2NcsDsReBRQ18s3Muu58co7/dezLiPtem1e2IbqQy+lyZg03++bu00i67Rl4I
	qaJR/XBE2P1XF+WXfnLHEQrr6ULzZ21st4qUWRM6UCZaBSOIAWfuELQGFiQzo/DoVk3Wm6/dnKqlx
	2C1VunTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTD-00000001XPp-1Qhf;
	Tue, 28 Apr 2026 13:27:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTA-00000001XPK-45PO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777382840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=;
	b=EHafJc/IozJvsSxqCYH14w512qIjB7NXfiMtBUeLVc2IkAOiWttCzmXEGHSJmNO1bGOSE5
	2BDFd4OUoysqjObxxAXJ/Zvi35+9+td59o/o8iJwaDS28tG8kKW8T4+R+IlwsqFy1tXf90
	CMmaXSP47z4RXvlZnj+Q1iCitVlOL9w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-r44NBGGKPdK026pubn1jtw-1; Tue, 28 Apr 2026 09:25:19 -0400
X-MC-Unique: r44NBGGKPdK026pubn1jtw-1
X-Mimecast-MFC-AGG-ID: r44NBGGKPdK026pubn1jtw_1777382718
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c0120047so67583505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382718; x=1777987518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=;
        b=tEAILfN4inu5Wnrnqgczo74UcvgbLPQ0XszC7mjQmhzd0SGYsbrziTFDFbxeBpKphv
         TXoza5nRUWXvbq8//51NJhjlRB6cTRAPufnZEIbkTlalWtarueFVJO6wv/cXxg9A836e
         ZS5DxTQfBeJWYkivcVf+Qqz4ht1KjzZwnWjwGL7S/TcobLbbT42T5RtSDcaEZiaeoIMM
         rK1DgIXD24tqxXD+jmjLa01Lf+7CZOt/ws2QKl9aGRTVv1Zv+tdbo5olluAg0xFPRGgc
         AST6zQP+P6TJVIAzBFtDpDRzaFp4QDi/Foykt9YwfkN3QlKFBZGYH1R/Fn2+AaZ4aXxn
         37/g==
X-Forwarded-Encrypted: i=1; AFNElJ/bTLlJg9mVvBwsguqn9/V4EGaLzeG5XPQVqwn8b35LnJ4T6P52VKRMpV2KMC5O0UNSWmQP3Ti5U/9IrQiEgzCE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1G6U3SIt80N1bq5i2FdfASMYjI+fmkWstEJYp5g7uqBC/N9UX
	U1AcJ+SgFWXdt9lJwIcxH35r6nRo25ZsrK/dTci2825Nx8P5OXyMqSaA5/4ma1wae2fvCOxsyE7
	G5izXwwSeBxb6Gwl6COh6FP4uPexpAMh8ruZPnFarYt9Z0zt/hBnZhZSLj2kKeyBqwxHS6EPMrD
	k9
X-Gm-Gg: AeBDiet5UstCMaaGGcP2qtQTTAB0ikfTz/9+QHn86qj/Ty2iMk0vc/nUDjksTrB4TtN
	4cdMZGpvDhjTkwYvC9Cv+B4BbXO8GCPGXpajZis65EEsQ5HmxbRbOZktyaDPxEH4HAJlcV00TKV
	ThhYgsRQS/HWx6wesLX1fZJBBYkoi4BfmlG1VYpQMJ4s6916OLVqLvSHbIo63+F8w6VXJXaKH3v
	q5rXO8S+hWNbLj7kPmFjxkzRX/wlC++ay5ry4v0cOJFt3uIsRLfzqTk3zhNvnKvWYxkuY56OI/O
	HJZUXRGi7paD6PFceg29AnkyXD+9199SRG31BqnbJYofwjhXYpGsWUEqIOQn+D/KFYcYhJAHXmU
	mjb7qW6lXrBmf938N3Jxw9NKGfKHV2rdPQJoQdGyzU+5XM4ugnZof52qAujkAMNOyGg==
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48a77b1da5emr55604815e9.14.1777382717849;
        Tue, 28 Apr 2026 06:25:17 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48a77b1da5emr55604145e9.14.1777382717385;
        Tue, 28 Apr 2026 06:25:17 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773a874asm72235935e9.3.2026.04.28.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:25:16 -0700 (PDT)
Message-ID: <679ebe0a-5889-4a84-afd6-3da50a07bced@redhat.com>
Date: Tue, 28 Apr 2026 15:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Move entries to queue head in case of
 DMA mapping failure in airoha_dev_xmit()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rRd0ypCKvamQyKKYloMEEV1_mDCUqclI_kMieVpNl2g_1777382718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_062721_096383_F6ABE628 
X-CRM114-Status: GOOD (  15.35  )
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

On 4/28/26 10:44 AM, Lorenzo Bianconi wrote:
> In order to respect the original descriptor order and avoid any
> potential IOMMU fault or memory corruption, move pending queue entries
> to the head of hw queue tx_list if the DMA mapping of current inflight
> packet fails in airoha_dev_xmit routine.
> 
> Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 5effb4a4ae84..82018a085e46 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2123,14 +2123,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
>  	return NETDEV_TX_OK;
>  
>  error_unmap:
> -	while (!list_empty(&tx_list)) {
> +	list_for_each_entry(e, &tx_list, list) {
>  		e = list_first_entry(&tx_list, struct airoha_queue_entry,
>  				     list);

Coccinelle says:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/airoha/airoha_eth.c:2123:1-20:
iterator with update on line 2124

I guess you should additionally drop the statement above.

/P



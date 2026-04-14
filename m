Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBDEF9D0CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=; b=Y4za1LIrp0IXJgr+qNPWL9uddl
	ydcbvAXhVyUdYTdvwpgde7Iy6mOlcy/RwBr/EnksWFN496jADatiCNvORf8yqgaxi0uVMXis4/6JY
	wAUQMSn6KkKJET0k5fRuwxX68d2zwkODGFxEz7BiBTLn+4ADETQx29vkqpKed3pb2HLADEjC5S59z
	SB67oZ+DtswU69sPC9shhQzx5B3jCAA7tU56bFUZLnstKwX54rgHB2llumXfWzdjLzr6RJG/PPmkT
	wCOlz7CiPVO24JeGJ0hMNVtPOPUHXEe/9k9Xx1QnxQWrOAhI29QaBqsH1tLf+qF1Gvz/P171/4eRz
	QYZNyJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdRa-0000000HLGK-0fkK;
	Tue, 14 Apr 2026 13:04:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdRX-0000000HLFe-2rAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776171878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=;
	b=SPq666ubaYXYgNC2CbOsXm7daMYJLDoFY8TF5VIhG/BOqb1FIFKk4s7AU+7tHIXJpcJF6x
	f9EWBhH7Gj0/3PA55HjaESFpWJ8Ei8cPpGpajXc5M+kSzvmTVeQGDT71uP7MwKgOUosr+0
	bDw13iOsrxF1M8w9Rbe1/5empyfGFcA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-O0cpOHttNGulfhAp6BjQcg-1; Tue, 14 Apr 2026 09:04:36 -0400
X-MC-Unique: O0cpOHttNGulfhAp6BjQcg-1
X-Mimecast-MFC-AGG-ID: O0cpOHttNGulfhAp6BjQcg_1776171876
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d7d03e1e7so1052205f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 06:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171875; x=1776776675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=;
        b=OfKBlB4qezrETGVt1GAwOq9giMREaSt66hjavU4ANH9jEEFH4n+zs//DdEwri6KLuK
         47Eb55CQRj/cHIFUQT9rlNfHw0YRPGzhOHLQrM25sweQXNdMs68/BXSoHPX4M2/MmLej
         WDX7PyyKDOSit94kZ22nj0g1cY9FScWQZ/20Ak5WcXC+F1PJBbrgl8v7y6GYJ/dB4ZjH
         5RKMNCEUZymYXmtVtNZPruFw6oLoHQaBOsKIUneMri/bahB5sbcgdVnrx9zs8SJzOqAd
         LecbMxMghIZmNsODkQgTaej5o7vSwX5wcGFj0Xr4VZT5kH7r295V8d9nH4y4tSu+e+dC
         iOgg==
X-Gm-Message-State: AOJu0Yw9CnfX63a22Rh/rroj83LGqi6T+iU7EyELZZ/IUgLyllXwm2PG
	f7khBkP/9CB7TnpG9LWiZ94i8UYkd2M7oVsfHjCJdvZPUOD626DxrqM8mm7ku6DRQADm32UTP1I
	O3CZbqPhDEPUkrMyqExmF8qQb7tFEIQiBY2YkEJ6ZSD1LkIXwYOagQ8CKAGNle6fzRSdKK8vFiv
	XlHPGGVpUy
X-Gm-Gg: AeBDies5lVkowadA2HrxUoX5DljTtxG+BazH9Ah/fDw4BCvAFiSakKpZjcqVBgM+vZ9
	eQNE+8C6DG/Fh2VnRokXs7dvPu2ZI6u1Eb2TwBQvO1aewFq2brIM7Z/p9D8P73N1TDO6hDFv6ut
	o5pvk8YNQmLBUm090Bg30hmpBjXDk7i5PR3jAEFrQzIZuYsOxte8L9BpWJ5uN8aphCJz6pxZluO
	JFZvNNK+OZB6ENvi+MY0yDCYXZyi2wNAXmoSV+bqwNUnbvq2eWah0OmDhIy1szZLgQ7Lu6XCnrI
	Nf1hJE71LZ+9nKrsv7qkoXeiQVuYHufFzvGHAs7BexamurbrWChGInI5eshOt87InKD8eHdUUg8
	w2Rdkx5PGLkjq/jpYknoXU6aTYd15dhn3/5oNbov2+BKd0uQ4GMcGOy0o
X-Received: by 2002:a05:6000:1788:b0:439:d7db:c526 with SMTP id ffacd0b85a97d-43d642a7b38mr26089366f8f.29.1776171874454;
        Tue, 14 Apr 2026 06:04:34 -0700 (PDT)
X-Received: by 2002:a05:600c:820a:b0:488:b675:360f with SMTP id 5b1f17b1804b1-488d6889a6bmr214737225e9.27.1776171861891;
        Tue, 14 Apr 2026 06:04:21 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b128dsm200877535e9.2.2026.04.14.06.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 06:04:20 -0700 (PDT)
Message-ID: <5767dffc-26e7-40da-8be9-46b878795a85@redhat.com>
Date: Tue, 14 Apr 2026 15:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix max TX packet length configuration
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xyKBKjW8aFrFYHKzGvP2xoAW39JZGkTW6etpgFd4JsM_1776171876
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_060439_798698_FBEFD480 
X-CRM114-Status: GOOD (  14.43  )
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

On 4/12/26 10:09 AM, Lorenzo Bianconi wrote:
> According to the Airoha documentation, REG_GDM_LEN_CFG() register does not
> include FCS length. Fix MTU configuration removing ETH_FCS_LEN from
> maximum TX packet length configuration.
> 
> Fixes: 54d989d58d2ac ("net: airoha: Move min/max packet len configuration in airoha_dev_open()")
> Fixes: 03b1b69f0662c ("net: airoha: Introduce airoha_dev_change_mtu callback")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index c14cdce588a7..a81ffda72b39 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1629,9 +1629,9 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>  
>  static int airoha_dev_open(struct net_device *dev)
>  {
> -	int err, len = ETH_HLEN + dev->mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port = netdev_priv(dev);
>  	struct airoha_qdma *qdma = port->qdma;
> +	int err, len = ETH_HLEN + dev->mtu;

Sashiko noted that the above may cause regressions, dropping max MTU
vlan frames.

/P



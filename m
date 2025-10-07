Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=; b=yryfam028jFksOf6P4Swin+ulp
	aXO7prU/CLATgaUzobGkYGRypIo+CfOFkFQ77JKLu49dhmsFjxCTvus7sVOdzOwsGUymLeNqeFx3M
	ngr8pmDUYIO+Oj22OR/E/jYpaz81SUBw3qVVlpQnmchmXHFnHItt5c+SbREGdqCyAnd7LAlrBgpwD
	HZqNMCgrdqm17xuP5G/72Iff5p1joCnJh5CdXXySqlud+DPO+VVO6mxVLzzSm+j2GO9iHPyAYkdTQ
	ZgNJVHJ2ny9OSeGyR5DwEYWt7A93TGYIiIv89iWeFn4BHZdnyU7nufsNavrmc8H9+Y5DC2k5WQ5X5
	Z/77dhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67PY-000000021oD-3W4W;
	Tue, 07 Oct 2025 13:07:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67PW-000000021nA-13Lz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759842439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=;
	b=HtZEVkxabP8xRfG6MuLUVUazk9pLKLK9rsJaHsESIE1QMTtAAHvt41F9dRhIT+iMPv/H/r
	8zwaPupftcawj7ONqnqpl8Y2HH3lmB9IiKjIxiYlyTcwLGsiAsrqUCo5UrxeDHDdwDoHKE
	vj2Nm6IIYbu/Fqag7jTcuKEq7B7RlB4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-IQGQE_9JPh6Z-9ioLE8czg-1; Tue, 07 Oct 2025 09:07:18 -0400
X-MC-Unique: IQGQE_9JPh6Z-9ioLE8czg-1
X-Mimecast-MFC-AGG-ID: IQGQE_9JPh6Z-9ioLE8czg_1759842437
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e3ed6540fso33535615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842437; x=1760447237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=;
        b=kLTG4BzeZJh/yVPOZ2eIOZ0fN/ncAIBXysaF5/b/+LnsMjb/fcEN7H0J94KXAIMBsv
         noBX5jqC6Vy2a69hw5AoIIGGrm5NOc75YG/697I3Jb5TfyY5tvpOyfWPN2/4H8el95mK
         4U4S7RphExQkKAO1DKBk3Witk+QpgLQuiCTgWANoe0fhubRWxh1b9InBBhRMAfzcTg8h
         R+LRYXsZLC2N6DKVDVEsR12R9QxHO7yNtFuILLGNlA5vDowcf5V5Opc8jm7haST9Hglh
         yFYpmQWtD3ZqcKBxHh63Gl0KKqzqEW8R0w5q6gORzvnvq9pUpzfyA/IXEFekpfW9YeYZ
         CRRQ==
X-Gm-Message-State: AOJu0Yy/ogYbDhTbweYEuUtiVtr/RXFXCvXR77GsbXTUM5LJoYikBb8y
	cEN9rAKbT8yvGd0KBx+3R8TgpSW7b+haSMjQdNDmlDa4yS/8WuaDD6GpmAwMBSMdJL817MFQP96
	zqW0FO3OAIbjKzldSE9HIXqVqtVDSNVTZUtMV8yi9nC6ZmxuSVM6IJFqJqYs9TOGs2cguVIQ2Xg
	Ap
X-Gm-Gg: ASbGncsQHCutHJj6LGikyN94e5uX0i5YXDj42A0ehlgAKgoT6T+6HF4m+HuRaDW3xiK
	7Bz10DW68A7KOU8ui5pXPtmIOxAV5uUAPFbDmxW93YYkZksBj8xA1k54UxDFitVygUF543vBnTV
	gEjiF+PVYawWPwD2I9txRUAlXLFbpC67m38UmXcb0TRMelJxwV7SEmkhnAZA0FqN9pZVGXIu/3f
	5AQKKpQmbpYwYbC1btriP3whDgMkK3NnimaH4lo5mfMDnmXAvud2Tj5LEjtb47tAXScDitsngTP
	2LG+Di7Iyj3SHyW1M73aQjaBSC+3H6tnLOvxKENmxykqpafnqjKpEvB/s5tMm87lsm2Qb1nCFkN
	/ki6p5MEApH7wsYXiEw==
X-Received: by 2002:a05:600c:6a07:b0:46e:74bb:6bd with SMTP id 5b1f17b1804b1-46fa2952c89mr17285455e9.4.1759842436888;
        Tue, 07 Oct 2025 06:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2L851GpOZr+HLN+RmzEFHJmku4g/YovfWmiVjt/V8y3IuJukmtrAjm+9vQy2k3rcv11whEw==
X-Received: by 2002:a05:600c:6a07:b0:46e:74bb:6bd with SMTP id 5b1f17b1804b1-46fa2952c89mr17285295e9.4.1759842436449;
        Tue, 07 Oct 2025 06:07:16 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a020a3sm307487145e9.10.2025.10.07.06.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:07:15 -0700 (PDT)
Message-ID: <7b460ea8-c340-4ab8-96d9-43568227ee07@redhat.com>
Date: Tue, 7 Oct 2025 15:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix loopback mode configuration for GDM2
 port
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mVXBnqEykXk-JjwGy9Kx01w9xJTSimGN2LrLDAhTNe0_1759842437
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_060722_365102_23ED2D09 
X-CRM114-Status: GOOD (  14.38  )
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

On 10/5/25 4:52 PM, Lorenzo Bianconi wrote:
> Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
> routine.
> 
> Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 81ea01a652b9c545c348ad6390af8be873a4997f..abe7a23e3ab7a189a3a28007004572719307de90 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1710,7 +1710,9 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
>  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
>  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
>  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
> -		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
> +		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
> +		      FIELD_PREP(LPBK_MODE_MASK, 7) |

I suggest introducing some human readable macro to replace the above
magic number.

Thanks,

Paolo



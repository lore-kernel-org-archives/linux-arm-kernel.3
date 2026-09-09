Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E0C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfqIN4Kwtqfnd1bFRCrRwzjmsoY7buI31s7mTLJJCXA=; b=B2E4Y+yu/aAZlqYpRhT06HFndK
	2NInprel1qoeA9oLRXJFs1tbEJc+E9CRgzy8KyUCDGsP+J3JpeD94jTjM2ZhXIWp7h2KQlDyw8Pj6
	DeISGq/4DWiyXW9662F3hSJNnmdD53j8PANbdEj3b/SRfxozshxDCwiDsLgLc0YOknHxMF8UoqY0d
	EEvhIPz03VWN719abydJtgGhmcLC5eJBttVBQhwbeYm2ALshZ6DtBBqrr16a7Q0IQJf6vj42TnW/x
	2geef+6seBOe1FFtXXT9UGzHNhm3jLbKMhNpvZWbT9QhhAnCE59bUdlMd1ZIgyQcTYkHZPPqMGs+8
	rabt6tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E6B-0000000BD4I-0ZHR;
	Wed, 09 Sep 2026 08:56:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E68-0000000BD3T-0Rir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788944161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XfqIN4Kwtqfnd1bFRCrRwzjmsoY7buI31s7mTLJJCXA=;
	b=e4kMk1Yq6A/kh/+nSn5vLI/kbk6ND/Rr/umTBR04UWVLZoOp/qTNDPV9EcZINGuR1uSZLI
	Y2fBq3gKaCAewnIFKFUpOI9J7gDRf9UJKD67nBP9ZYk74b8dIEDNRRPVlgOLU4OliRrhFh
	FR4s4HNCVqhB0l1nVsoQItVuBqwea1I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-uADNAtHxMU2HZuzu-0--rw-1; Wed, 09 Sep 2026 04:53:39 -0400
X-MC-Unique: uADNAtHxMU2HZuzu-0--rw-1
X-Mimecast-MFC-AGG-ID: uADNAtHxMU2HZuzu-0--rw_1788944018
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e05af072so4487989f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944018; x=1789548818;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfqIN4Kwtqfnd1bFRCrRwzjmsoY7buI31s7mTLJJCXA=;
        b=pNNfaL38u5pVgTzzfU8zElxk2P+/oKRR/QRyE1aLyp4i/cw3UjnOjh8Gc1r8HxTEAS
         fvCnN/Ac4IqljTy7pE7bo2IsZDXJxUgfLj6eeohg/kCZDrbqvi0n16lP9xGHfXXVrzh5
         rDgQfJ74qXr50U2Fn6MQKihI1IkkPusIoVc8H1NAEvTDZ7YTvsFUZkOCVsS4cGg3rsGg
         AWYrW0pwhydtqCWNlEUVdcEBkH1vRg1hJVJnefIKsS2jMd4ESS/zYtYmA8dVLsBkpDPB
         aOVbZ+pinu4flMsLn/91rFNhqVXkJcK6VtkhZmB9qbdGZ2OJEA9R5+tZqaSFG1a2PmkC
         Mmxw==
X-Forwarded-Encrypted: i=1; AKwUvBxXc6qxb4+Uk6YkggH4uJsllSw/W17xXg7nTy5EnyJ1r7nIcoxWo3ydKga+0SzmyU4aA66QonFGLQfMcCETVJjz@lists.infradead.org
X-Gm-Message-State: AFuF++lKBqOnWUoN6ySMgW1kYFpUmZHlCREr7NN6inOWw+p1wIQYrx02
	G11smnCS0eCaUcL7v3DcwLHCf86k1eZHBnpsP/nFBwNOwT3q0+ZcfQ8TyiXjinTPCq7tx7+9JKw
	P2z6dOMZwk24gPeWcSr+WPLOO3bGdo9Sk4uY5ioIhqvitnxzTtH0ERrYWOy3cfGLmrnQ96m5L04
	O5
X-Gm-Gg: AYBFou1z83aTS0MX7p1mya12AAWpXh6kOnBF2HZHuvHtep0JxI5uBDR4RixIyDURsgM
	tXteOx+YdT5w/mL5sTfnxeufDH4IzSz8mjy8BuzaMAskkKahGvqA2/lwJA0zaLlP4xmahkt8QR0
	9EL1aZnXNFkAUuK0Q+tjWZYYz3Pf7l1qRkFUsKtqT4g2foe5V5/2HbB1KlQeoRz4NgpY6SD82+1
	aZeuzApsmIldz+UkOb2rDgIgJKpInJ7n6h77IzqqNzzo+spl2duua+ybnyYjDen9Htz8bqLodmr
	4grX9AY6uN58LaRC2GlNM4V2PzoYztBE2++km0D+mIBaNb1V+CMicq4r10cdroZNAXPUJgS/oQ=
	=
X-Received: by 2002:a5d:5f52:0:b0:485:9233:a5ae with SMTP id ffacd0b85a97d-4859233aaf2mr25267365f8f.3.1788944018457;
        Wed, 09 Sep 2026 01:53:38 -0700 (PDT)
X-Received: by 2002:a5d:5f52:0:b0:485:9233:a5ae with SMTP id ffacd0b85a97d-4859233aaf2mr25267336f8f.3.1788944018095;
        Wed, 09 Sep 2026 01:53:38 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm31003763f8f.37.2026.09.09.01.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 01:53:37 -0700 (PDT)
Message-ID: <5a1c75b6-8d68-4bfe-bda8-b2ca25cdffab@redhat.com>
Date: Wed, 9 Sep 2026 10:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: xilinx - clear AES key buffer before freeing it
To: Thorsten Blum <blum@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Michal Simek <michal.simek@amd.com>, Harsh Jain <h.jain@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908191607.405177-2-blum@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260908191607.405177-2-blum@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ls--ipC6AmTkB0ElzATTj54XUcvdJLhkQNtoLO-cs50_1788944018
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015604_395276_753941D0 
X-CRM114-Status: GOOD (  15.56  )
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

On 08/09/2026 21.16, Thorsten Blum wrote:
> In xilinx_aes_aead_exit(), the AES key buffer is freed without being
> cleared, which allows key material to remain in memory. Use
> kfree_sensitive() to clear the buffer before freeing it.
> 
> Fixes: c315cb0005be ("crypto: xilinx - Change coherent DMA to streaming DMA API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>   drivers/crypto/xilinx/zynqmp-aes-gcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
> index d54c268dfe34..ebee37dddb1f 100644
> --- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
> +++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
> @@ -766,7 +766,7 @@ static void xilinx_aes_aead_exit(struct crypto_aead *aead)
>   	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
>   
>   	dma_unmap_single(tfm_ctx->dev, tfm_ctx->key_dma_addr, AES_KEYSIZE_256, DMA_TO_DEVICE);
> -	kfree(tfm_ctx->key);
> +	kfree_sensitive(tfm_ctx->key);
>   	if (tfm_ctx->fbk_cipher) {
>   		crypto_free_aead(tfm_ctx->fbk_cipher);
>   		tfm_ctx->fbk_cipher = NULL;
Reviewed-by: Thomas Huth <thuth@redhat.com>



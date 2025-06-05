Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097A8C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=; b=4sb3rwJBlwgKMV9Y/LEqF71j44
	5DV33KzVBN5oHU0kjoCgApLyaI0dsrvDuAcPGDaIipKgQ6pd3lC6NoRihgGK2a+sHsxui1RVEjGrL
	UfGKDUsQ9vug7Z6418Gl9bYuP5+alGqZwehfT3gyE6/8d8lSsdU/hvuoyBhBZ3/sTfMeb15GbjuHA
	4Ydv7hV1HwqAjtOkVyWKD4VjY08WrJxgm6di2NxmcAuBK07BQPFRvQ4VplX4k1lBv8bDRJzsiPLwF
	VM9mlYNREuF0lDcb0bV1pp0TyNptAxAMJU/WJs9yXUw3gGQ6HRXHrDVhRFMOzPuedLQHX7+fcpOHY
	RKS1fhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAVV-0000000FboD-33u6;
	Thu, 05 Jun 2025 13:19:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAGQ-0000000FY9J-2QyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:04:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a365a6804eso696867f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128648; x=1749733448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=C/xgoSWREqcqNthoEjgo5AQV6NcSZdzBSDpCeTNa21vyXv6XRy8AFydd+ljtdzYR4B
         ceNXvDXm6ZP/5gn5fRMo0eNWAuSTclVC4ZDBOJ/oZq4Ck5wB2+cdGkhQQ+NVabxZZO33
         XxnexAIpr1rFNyFjoMCA2bvSaQiNAs65Bzy1CGKrWjcs840/buDV9kVf8IjJrVdzp5Pb
         EyUFGfoXzdjcQbXOoYBBzyebHmI1T6c0YVPOB5cyzTbbgwnLHXvbleT5d2/i7HnFUaPN
         +1D5XWk9A8nDIRZjv1tZR99s7nG8BfcjBPhx5TqwZsGI+B1vPgmJKs8vXJPry1jibRTh
         mC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128648; x=1749733448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=NERV3FUJNAelxZCK3S5DyfO9cqE1q5rZUwJSghP/MO9JEcG4/YMnXvIO6CKsKujtkl
         qGEFwWywmzTEQgY1fILwVALILxBmaew9MVe04rbJ8CDJz2DPxPrc47qTE8zfeoR9RRRI
         Jk+e6umcmHHGzGHRhe2Mm9Mvma3aa4dhr2U1gAHFJxHhVPuwPIxQwCPugkzbf1F/l9IJ
         +cgo+JvSSZo7pCHSbe6h97utZrRexMW33HSUmby36I3B+STIDLynegzpgxU2UHn5cmMe
         d7E66kChEs5HIGdc2RDzFiPFHk5H50zdm+pGtEYMbOD0zX8va7HzoYFLNLok4RKzxWuQ
         hf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYeyHr35VaLz3B703/tjLwL/qxR3INsWaqdWwJySKWE9PEbzQDbbA1VRQwZ3WMqKcl2FBHGSDvdDtXJxuk9b1/@lists.infradead.org
X-Gm-Message-State: AOJu0YxeLVlSIEatkcqll1FBK4Y8Bc5nJOpqEirHLh5l1gROMiKD/Kxe
	7x442+RgjZr6eqDUVEXBN4WPEzNqpvckz3GaWPZHnqXeu8t+UNiB+6vw0UDfQkkM3HA=
X-Gm-Gg: ASbGncvzJCbMTKJAfSHLIliVIN1u5URO5aqTbQ6wWhyfo44UxfTrDAJKu6Nhq+uj59h
	ZxcufMNfSQOUWgcbyLgvx6qxfUTYUDxFMPrZgOiTbnky+agysI2aQLkxGAb6m5HPy8Enm3N3U1T
	dFqYJZd5mtfB9sv9kKZndDr6gudQdQRQY6DAVTDdi+CNz2aC5V/CDDu0RYUT+eMsBYXPD1wNQN7
	sKTbUnhQ9YkX9AuDNezhpWKSOuupfeRr+ETXnomJwejnwBovQRfiC0VkJFz7L2cRCeM483vNRcL
	ih9F7iq8Np8aJ6h83AypQhSgT3SU9Wp1jEAi2WyOijgdoak2HBzVLyD7gL8=
X-Google-Smtp-Source: AGHT+IE/BmSVdL4tbFWwRI8QdSGrFvhSPvFKD3SoCTJ/6Nr+n1FoiYUpOSD1J4F7Wnuta6OWoz81dA==
X-Received: by 2002:a05:6000:40e0:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a51d973c93mr6275072f8f.53.1749128648387;
        Thu, 05 Jun 2025 06:04:08 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a525da8e66sm2814969f8f.38.2025.06.05.06.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
Message-ID: <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
Date: Thu, 5 Jun 2025 16:04:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-3-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_060410_626211_6E0F410A 
X-CRM114-Status: GOOD (  13.80  )
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



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() allocates a handoff FIFO, but the matching 
> hidma_ll_uninit() function (which is invoked in remove()) 
> never releases it, leaking memory.
> 
> To fix this call kfifo_free in hidma_ll_uninit().
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> ---
>  drivers/dma/qcom/hidma_ll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
> index fee448499777..0c2bae46746c 100644
> --- a/drivers/dma/qcom/hidma_ll.c
> +++ b/drivers/dma/qcom/hidma_ll.c
> @@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
>  
>  	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
>  	tasklet_kill(&lldev->task);
> +	kfifo_free(&lldev->handoff_fifo);
>  	memset(lldev->trepool, 0, required_bytes);
>  	lldev->trepool = NULL;
>  	atomic_set(&lldev->pending_tre_count, 0);

Is it possible that the handoff_fifo is freed, then we could observe
reset complete interrupts before they are being cleared in
hidma_ll_uninit later on, which would lead to the following call chain

 hidma_ll_inthandler - hidma_ll_int_handler_internal -
hidma_handle_tre_completion - hidma_post_completed -
tasklet_schedule(&lldev->task); - hidma_ll_tre_complete - kfifo_out

?


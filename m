Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E0CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=; b=zTd1OyaEVOg/MtH3rvpwE3aDN4
	dJhK1xMBEaqsRfRyVoSS89JXm272eDF7TvJSWy+9GN8FLTmxw9QuxYxKBHGX9bXXDBTM8QRT7nJjx
	3LTbDaXMd91TnyJyA2h47HjagA4bzh6PJdDKtCKOAbU4y6PihMEBfXSmgX07Tukg82V78un0LFA7z
	hSU6OTcg5+d8Ynn6mA//z1TQNNUYPKVUJpqTD+FLtrBUDnvGjhgsMc8nL2R3PtHW+xrS/++tm4lA0
	dxsGEiCu/+sDVsZqHurDpCJ0rtGkqtotpaGuHRW0x2Gqkk3IHVqy4H7hQbYE4ogu5IsU0iK5LzNq5
	uHi7w7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uxD-0000000GJJT-1kEE;
	Sat, 19 Sep 2026 13:18:07 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uxB-0000000GJIc-2kpD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:18:06 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so11278425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789823884; x=1790428684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=oQ4maGGwuQtA/5tgncOapd+G9hlhXBy60xm+Pw5PQvUGz4JMqVgySuuAtINZIdBCZO
         mPj7BWDqPw9OIN0sj9W9HQ71wzPn5ZlZsPj3BmbLLWqBpFLum8/H4ySOMLQ0HyjJOpsg
         9qp/HgW2GRiEg8Fa+C/sN7pH6yKrMGP8o0gGoC2A43UxWNZffXfBtwzxZvCbUICQ0kYC
         3/GCUa5A4ILAl5kF7TXEDL4U85U0oA4/lV8JTEv8C0XLYoaCk+3gaMj4QtEx+jkNaxSX
         A9F2YkwED3ffZ8doVCKv1Ngu1qVbj7Cr7+OiHKkpdhX2QvcglgJ9Dp71hfipStU2Eifi
         PqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823884; x=1790428684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=n9mHOBAB/KTGCWSENIDXTj3q5rXdKTKaJGc+l8HK+JhfFw2hNTk4p1EEt0uUgW05RD
         lpw2LQK5DICCKz0j/oVGsyfXwZnl1j4A9WM3Q8PCV904uFmKJnmdfsh/AUSY12UxO3fa
         q096T51ScgEwM5rWZL/6O0EYIl10PMdzsXVzoSQ+mYyhB11wa26WyaXwTSOP/J+SBwiD
         5v31otHCmni3a1ynYXRhddT9hPbEC9Tf/P4vh2+U4No5gZfRMRkPzN4Zb0jVAvk1iVYm
         4YISkIkTNCxV359Rm7XsJcS8oaNO6XTBwTU0fMxzVatS5qDQjZfSaooiNfeP6prJ8thz
         VssQ==
X-Forwarded-Encrypted: i=1; AKwUvByXeTvh/8Xm46LDbznUWiBOz6QhzDZDMQAWbHXo5B5Yic2OP5MxvC4qh84BRdgnS99ubRMJ7Bl+/kSpCflqOSGC@lists.infradead.org
X-Gm-Message-State: AFuF++k6LVl0c1QiZypLpCxsnQLHvwIRkvvckWrAj/joVlxNQZrm+pOC
	FROYAtDzacFieggEURxVGn/WqyVrbeYQsZ3SepQs0OFcXlWpOaBmwsST1drAqyAyycI=
X-Gm-Gg: AYBFou1KXeJZVSsdThSScsb6oSelZFtI7gnTr+GNDalBo2klhaVADZdUVeYNGSd8Kw6
	7DLwgiCAgKGbV7QdEFO9Jv40dq8pVwaTUscDscwmjL4sTo2x7dz/Pk5nsAcXWOmU6ZCCxS2I6l2
	/FeOvOY74dpiI/YUBxft+q9zGzO9j3NuH+zrIvPQrH41wKUVi5GEkv9/ypGOl0pfvK4nhhEs2tY
	P/eZX/ensbhvTHeTotiZHyzAagJp4xXQjyZgNcXRhREg7GRfKKxRc/MBrfANpDhB8liWnXTT0XU
	otOjD3WabWFZXlc5srlCmpNSBWMvJyKaacy9kXNgUK+KT7BHZikRUr/3AK4UtkVcG9H6QkUC2z8
	EQGkm1LGpaR/dz6Hjnm5dWcL7xfHkqi4836OW3RUOj4bVrCuU4gc9uIgEDUrkB3CWJwaRJxqN6L
	+NIyBmTDg25b5bCiHsd3oyRD3GA5WIfEwHbqapgm8GdFiKV9XLeKi9VeSegIzW58dzlXaXAApwk
	N3ITbbpbFJzkYelDL0T14v7AGj/rv7Vo4VHyKw+tcyQjCa548uBlMF8axbvtWan6A==
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr71850835e9.29.1789823883840;
        Sat, 19 Sep 2026 06:18:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm70658255e9.0.2026.09.19.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:18:02 -0700 (PDT)
Message-ID: <275bb967-21f9-429d-89fb-efb8a498f388@tuxon.dev>
Date: Sat, 19 Sep 2026 16:17:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v6 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc: add
 sama7d65 and dt node example
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Language: en-US
In-Reply-To: <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_061805_705789_9F9D830C 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add support for sama7d65 and a dt node example that shows tag can be used
> to reference a packet stored in the OTP memory.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


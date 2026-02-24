Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D58F3C997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P27+Z4Mn3VpUEFcO0AEZzb62/MrR0GaThwrhuZeI+7o=; b=Ma/WcxY3hKmUSkRbfNjDbqKz7M
	0fTgFFEg8KdBdDrDE7ufKQN8HiVjdJZHKaWT3KV0ngLZIgZp/umypZlvRuV9TJU+9Vpxz49CCxKin
	JHZKoz6Yzd/6udSkbkAZ3Z1p+qXLUHwogboCtI2oohoq15C2lxhVbMuVZZnAqHNsbQZ53wGJC3Hhu
	/r65pHneJfmK+YPdtPWoDyvYITtNOkyoUHLGD1o7Ej/gDuCAYMe2j7mPF8zTFF3uAHmRCh1R3YCnf
	qjHYL843n9W/5d7yMm0FqqgRV0DPDdciLKd5fFxYNUy+rYnVL5s4Q5nIPbZuTr8VetagVJ2TBxPYE
	TVU60U1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuHp-00000002JA4-0hZf;
	Tue, 24 Feb 2026 15:25:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuHn-00000002J9i-0JR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:25:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-43988056dc3so640919f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1771946717; x=1772551517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P27+Z4Mn3VpUEFcO0AEZzb62/MrR0GaThwrhuZeI+7o=;
        b=k6RSqc/Q9sTGbJT1n0PQvS14Z1ZrzV3RR+OPUZGhh7n/Ku/ARKUG75CyeLnQWVnhn3
         NtiTUE1635z6sYnFXcLV8DN6gORH4Co0++k4zJDJXJGFe/MxO7YHtc04M9W5ILtpaKr+
         hEuV5shUAoao9+gDCjPqPNTqgTT55KdL4bjGuGAiL7jZXI9/wglfuwBDXpzxCz/9wxMQ
         L2pM/NyKr8hgO783eSBg1gMqUmsK319jZ9/A8fPg9M/nyFURSnNCQJntJKeps6cjzHOT
         TzxcNsgkoR3fvGAx5jZ4ApsqeJ5uZm/aMXeL1HddXp19paDczuNjZFVpYFk1Yo1GErFE
         O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946717; x=1772551517;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P27+Z4Mn3VpUEFcO0AEZzb62/MrR0GaThwrhuZeI+7o=;
        b=w/9k3wUZj5e2+Qk4iXTV7m/nxiBGH6yayKMn774wzSiq8cFd5H5ASvfFODFdM1ESih
         ybdofONDyBVK9dbde/y9XzWgScKogNR8GCMNCEeuoefmA8HOGEiK7jCaiLNLX3J7NkgL
         84O1yTeBWGHoN8F0Fr6PfPDUN2gs7c6XwvkfPFwc8y+wp+ME5g+eiIzxK4nIpK7I0kxQ
         y6DmZb+fvrgQTbL/bRbKGclGQErGmkAORj0u5jS1dkHenxujnCIekMLWKAsez+pgVMBm
         iHlAqdgCcr91KMS19c/DvRQo4AS1qnrH8Qyl14c4r32qdp8tAg6e0kNvj2IpJ9Ihv0of
         bC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaeO9XFWsDCr54dA/TuZpYHWBats/e2CDGjrQuW22qtrL+ITFaJx0wiJFDD5HO03LWLDhngACl/Eob6+H8Le9u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz40zdhXxwkIEm9pjtswfYXYCf7+kDHhschlpThjTotj9q7U9W
	Jm2BghuZYbmUeqyZNfx+tDK5ZVegmmNvtjajCDoH6dLUItI1dK8nqNbh/USbZduj2Kc=
X-Gm-Gg: AZuq6aKFECk0eng2RpidClvmfRbmv08Z/t43fT3OArf3rWSQLwXCooQ1kh1aQFccOEG
	3kdEJFy3VcsiXW0p3fiAeSube8IvmBkD+Cpi0vinREllW7EKT30wRsRSTX+7mI5oQA8sOoCV/DY
	uGgn/HWUqWuMruot+0mZYrytjfHCPXZKl1lomk6fObVF20micqNuX+EovG1auvO9Z3BHyxNnhwJ
	W4hyiYrmUfSw4Ay0LNODD7W1OGSPJEdrcjleIJbMkh5WBNrzvnxkd0NSeDlzq9QwwCH4Z0Hc7JH
	AEaO4IomFIGaCnYpoYjbI5EhMXGsVUcYnh0Z5aqSXV4HJcWwcIQrD81/2E5Nh7bxMmABSoB4Ozw
	tYqF7HlwEFl/E5/8ZFpE/35xR1J2OV8dAeQS8YthYcjq1vK5yuyq59MBmjfKTbm7o72UMQiILlI
	j/QdMLlTXt2A6BXH27V5xxkPypfaeS5EsZceGUbpu0rX5Vj33A3Ov8B9PP/u+B9KSZ
X-Received: by 2002:a05:600c:3b18:b0:483:6e32:50d4 with SMTP id 5b1f17b1804b1-483a95e9555mr240773595e9.18.1771946716451;
        Tue, 24 Feb 2026 07:25:16 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:ede2:e79a:81cb:9434? ([2001:67c:2fbc:1:ede2:e79a:81cb:9434])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm10632345e9.0.2026.02.24.07.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 07:25:15 -0800 (PST)
Message-ID: <d14f3943-b97a-4940-95dd-39c6fc240130@mandelbit.com>
Date: Tue, 24 Feb 2026 16:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32: fix missing pointer assignment in case of dma
 chaining
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072519_166659_87B4EE8E 
X-CRM114-Status: GOOD (  16.18  )
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

Hi,

On 24/02/2026 16:09, Alain Volmat wrote:
> Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
> introduced a regression since dma descriptors generated as part of the
> stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
> to the caller function, leading to mdma-dma chaining being no more
> functional.
> 
> Fixes: c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>   drivers/spi/spi-stm32.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index b99de8c4cc99..33f211e159ef 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1625,6 +1625,9 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   		return -EINVAL;
>   	}
>   
> +	*rx_mdma_desc = _mdma_desc;
> +	*rx_dma_desc = _dma_desc;
> +

Thanks for catching this!

Indeed my fix lost the pointer-to-pointer logic, which was needed to 
pass back the computed values.

This patch looks good, but at this point I think you can also remove the 
lines:

	_dma_desc = NULL;

in the error paths above? Setting them to NULL makes no sense as they 
are not going anywhere.

Regards,



-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com



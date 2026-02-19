Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCABE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=; b=qm03C/mLVygsSoQ/sOJN3gZVhV
	NhZgnWSBvqgwyYuJq8UadyN76uMW0a/xDOXQBHGOEFddPgXmqjfOmpunIIEc0XGwlyIMLyHZtnt9Q
	oxhTlktCTyj3+TwWbDkMiMyPrrSPz3D7PHO2wNE0riQSQhS6LkoOvupKMxUu/6ojbfqLJZnhs/Ucm
	GYFR89cCsn45xwnRVeldTSYaOCm+afNzCJn+1C2BWhigKg8irIxU3ZZbnBTQ0FHTxedmWtMH1VRt6
	ATUsrK70dSXpJWeIhUE0zSY2TcaTXm3jMMZi5XpBPQ5Aax3ZPMZNC1S/mcCwu0Yzt+aBYN6QF8Z3p
	9Yzzbp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt24u-0000000BGt9-1GlF;
	Thu, 19 Feb 2026 11:20:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt24r-0000000BGsj-2V25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:20:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43767807cf3so633766f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771500011; x=1772104811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=BYMKBTb4/MyQz0ZJ25G5o8yegjETQOe3lZ0jBnXg6HDlTv0I+bnklC1s9VWrBUwr/H
         XNWEqE0yru14iu2YkBlBYgR0m2SFMhweasDWQux1VzF7hAsrXwIKBSO4k2RvTwg/eJX5
         s50oI3CgKhnVPmn6fJn7IRQLzZVwu2Pdq8xjvlVMjFnymIgJ9ExfODByhopCTdq+wBbg
         ltaj8OqIwYBC6NRpcGT4qYoRGobj9IgT9Obu8TJttOX+osPtZnzm4Iey8JZcM3DntjXC
         SPm+RjmVqOifc96B0UzKXx43sVX/tJMjhwn7E4k2ckS9O65D1L5rCca8YLsmRvTguVmg
         lk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500011; x=1772104811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=M+DNtIPO5XPVFO1esmV5spBPXaLAUpXsk9kmnjMWcHvEBHdSeNsvRls3cl7Au4fHja
         5+sHnWPVFl4PmBegf2tVBmCUwpQkMhZUDhyOB7orqnjRdjFcn9NHPIm+DtD/RA0q6lfj
         bbd1owYQsOYUfmS4CexQJebA3jRUjbOls/P5k1WeKERu0TM7oUXYmW38qQ5xk36A112G
         +gsbDUnYQhsRPhU6onsaibNYkYGZps00QAtvS/xZGvl91CypCK18999fkgcKHIsA+4j0
         qkBZiYVX479TsCY66+jjfWYtz2QOHfhdXJ5BKcWFkMDbU+wASJmvTvHirVZUhdjYSibm
         o62A==
X-Forwarded-Encrypted: i=1; AJvYcCW5MgpvKuxDCZoPJRqJH09Cp8s/WQlIbBLjh7VGuXkkE26Zk7WcqfDWOGRbdoazZuA8P2eVedGwOj+28Y/+pCFP@lists.infradead.org
X-Gm-Message-State: AOJu0YzaMIoWayIZ+ZZAiU2aB4WlcEDZNmgBA+peNnxTDaDt6orm6Pxv
	+LAqQ+RXZlWGCuJ9nRUrHN8ZaDA2hzbziFKI0Z4K5cp1wLasygYYmBrUm7kNQGqjWA8=
X-Gm-Gg: AZuq6aJikd/E5/KTwrzl5Xi1D3B3N6jR5KloVhCoZxVKzUGtHkCZdvdY8uD8rHAFLnL
	xLUos59yFvh6oE9YL3ouhqDiW3RLWo3B88D/yUa8DrCZPPQSK3wubKzc6RSFz/N4RFPUAsDa1gT
	qjW6HUTdZZyQBKy2PYMeZEyPXudTl3ONi64ANIWx0CF+1rJ/NshshmuOTnFq15jOwo0SlrrvxSi
	Oyp0TDh5aeFqzyvKUkztXIVjjzFcYfHZyz6aGUs2XmZyfeiYznho4foWL9VLj8UoAUyFrc+WB2P
	442G185sQOXJIyxpoeGpmiTy+jQw6uHpcLvxQeYMVdA41NpTlAF7hygEbmFcQzt5MGU9cprpdoS
	vij41cvf2m0d7FXgKQYItwGfQfrNnIF657n884pEthtw+0CaRzKEaUWaI77WubOYRHA4iCG2cAj
	euNOD6fuy4m0OiQTWmrNVDOauZ8zURFJtA
X-Received: by 2002:a05:6000:144b:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4379db98611mr32771301f8f.51.1771500011417;
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm51473650f8f.27.2026.02.19.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Message-ID: <47bbcacc-32be-4a64-9ce6-9b441622e84e@linaro.org>
Date: Thu, 19 Feb 2026 13:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/3] firmware: exynos-acpm: Count acpm_xfer buffers
 with __counted_by_ptr
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_032013_676054_DDE92A52 
X-CRM114-Status: GOOD (  18.20  )
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



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
> validate runtime that we do not pass over the buffer size, thus making
> code safer.
> 
> Usage of __counted_by_ptr() (or actually __counted_by()) requires that
> counter is initialized before counted array.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> __counted_by_ptr() actually maps to __counted_by() for clang v20.
> Alternatively we could introduce new __sized_by(), already supported by
> clang v20, but it is not available for GCC, AFAIU.
> 
> RFT, testing would need clang=20+ with COMNFIG_UBSAN and
> CONFIG_UBSAN_BOUNDS enabled.

Tested cpufreq (ACPM DVFS) with:
CONFIG_CLANG_VERSION=220100
CONFIG_UBSAN=y
CONFIG_UBSAN_BOUNDS=y

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
>  drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 55ec6ad9d87e..a4864973f65d 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -24,12 +24,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  			       unsigned int acpm_chan_id, bool response)
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
> -	xfer->txd = cmd;
>  	xfer->txcnt = cmdlen;
> +	xfer->txd = cmd;
>  
>  	if (response) {
> -		xfer->rxd = cmd;
>  		xfer->rxcnt = cmdlen;
> +		xfer->rxd = cmd;
>  	}
>  }
>  
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 422fbcac7284..8392fcb91f45 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -8,8 +8,8 @@
>  #define __EXYNOS_ACPM_H__
>  
>  struct acpm_xfer {
> -	const u32 *txd;
> -	u32 *rxd;
> +	const u32 *txd __counted_by_ptr(txcnt);
> +	u32 *rxd __counted_by_ptr(rxcnt);
>  	size_t txcnt;
>  	size_t rxcnt;
>  	unsigned int acpm_chan_id;
> 



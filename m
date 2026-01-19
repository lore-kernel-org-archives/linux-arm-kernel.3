Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB92CCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3eT6Bg7ZWijWJ4NFvVulXfOaaoq9EAaYQC3GNm1H3Q=; b=s3/XtrKFkpIJLx05EVqM3I1sRK
	nwLiCG19pIx+oFk2AJSO7TZBc8OSinFPl323xVMbb/Di+hIssu1zG5lmBSQA6PDzWn26tbsjDlrYz
	fReVGYdVchftD3UhwxQRb3kw6ZANFLp8VU9aJ5RcQn77iQ+675qKPF2SGdWw2mPnt1yAhG26kKroE
	YxQLlYfttgjI/6HIyELI+Qy8W77DCxZoETrAyr07fV66pFC10SEdgg6r45sILVfsyGZOEvpcPTjVU
	6gFgNXz4P/OpNMJOQOkUPBKfldu2wcLwilX1xvanwB5M5ocbGmWC9lBaIywNENkR3AdvUs0Q8F6+1
	9MX3d/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoUB-000000021ZR-0lhe;
	Mon, 19 Jan 2026 12:35:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoTs-000000021Og-0dvG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:35:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3484968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768826124; x=1769430924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3eT6Bg7ZWijWJ4NFvVulXfOaaoq9EAaYQC3GNm1H3Q=;
        b=LURAlj0nvX04MZXwCVfh2+Yp7BDA6xBuQM9ImRVQn6IGFLSvdH4jj10njo8ET0foil
         FmZxzdrRk4SX3qKmrDEduIqfpc5zlYihTnaprfAkoc2X0JmJZjsqFI0YcVn+Gce3wvJX
         o3ppn74jkk8mVmx31mTByXVLvQqrGpuCh2YPhfreNZ6Mecqr8dHJdsqRGSmpqRmAZehE
         sPuP6+o57ht2C1dcdgA5nx/JcqWTgEA7Mo3oGkFzdd3TzetLFBs3wsNNhfC0nvgA0aTK
         jVQ/vGYqkBkdNcFhuVhtbNlllSsJ+o2D7HIYUO+IelDY21NWxhmwRe6yWTIj59KPtaRN
         GkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826124; x=1769430924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3eT6Bg7ZWijWJ4NFvVulXfOaaoq9EAaYQC3GNm1H3Q=;
        b=t2GvS+j8f6Xc0u53nI16uxRgS2H61pi+P+gO2skP79tieKZf8EBZjDlRjx2NU06vzC
         zSlPM6RSTE9m0I6O5GfT4Z0VOjxUUunIHTLKihBfpW2kiWyCs+dyiRCRKCa4/AmRHCgE
         vuR0OTfwFnWVnV9hysNN7isPdWEQaUERiMQ/pJ5nHtm3u97KAbr/WABtGZ3PxW0fHf6M
         U7bWSZv1BmDRc/1IrNlpZL5H8GMlZUZdGeEl0nAV4kAUPuhlUzUPEX1iDFOQXAJxm3Hl
         +fc2OADoldhi1uM3+e5ZoPGx/qOH8mDSWXbmJfMzi61XRU20mLD1zdriwvi8CaJkUC88
         L18A==
X-Forwarded-Encrypted: i=1; AJvYcCWhtyDoS76TiFBfvrk5webQExDKo5ruKQIde3p5h5QPnsoJgQboBIFE6CqPNfwRuxOdwfpdr9cYPwNKroVdfXDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+YZ+vra2NjGWG7XtyhT30M7YFMbBMk/ZjMmfBLpm99F4kkCBS
	k3Gra8ETaUlmfBcb+9ss0wLgqqgGNmHUqcu9qvyW/7OT/ggOVI+XL288RwOLzWtqnXE=
X-Gm-Gg: AZuq6aJXrhtHIUy3qDmoRwU3g6KDI/dqASY71BeQXKWzUpGs6Yii5RNPZ58ZIm2FlKO
	HVK7TSCqSBHOun9B7xiCiPbDu7BsSsETPfHvygBJWijI9ItUI+wk9ISVEBc7gGNZburZ29SmA10
	cZ2LY7/W+ctuHLEQOajJRTaT1qgc/lGs17W3973/ndXtIzZyo1MBXevgri9G1KHiDocr0qs+aVv
	+q9FaoK3DLjXSCZ/U2PiMuVMlmDrujFA/mpGmopqzOJDUouA4fYlw6+dyhd7MvQvTX5LThC7Q75
	Yldz0j/Tnon2CyntGn8eneveuI4JYlAHJirZ+7DihsKlkULXL5z7bgWBDYj7zPDMZmihi51ZlUA
	6jtOt5P9nzZPnVENRwsHDJAa021bG3C4P5nf4rvhhjkYYiTSbSn/7PyhKteTunVwd0IolG0+UR4
	vK+bWBcoFzVuplbgPG
X-Received: by 2002:a05:6000:144b:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43569bbb0acmr15961638f8f.29.1768826124241;
        Mon, 19 Jan 2026 04:35:24 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm22268489f8f.24.2026.01.19.04.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:35:23 -0800 (PST)
Message-ID: <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
Date: Mon, 19 Jan 2026 12:35:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stm class: Fix Kconfig symbols
To: Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_043540_389766_E34543AE 
X-CRM114-Status: GOOD (  18.74  )
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



On 17/12/2025 9:39 am, Leo Yan via CoreSight wrote:
> Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
> prefix for default values to work.
> 
> Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
> Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/stm/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..cd7f0b0f3fbebc74775d8835187e49e5bd21d646 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -13,7 +13,7 @@ if STM
>   
>   config STM_PROTO_BASIC
>   	tristate "Basic STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>   	help
>   	  This is a simple framing protocol for sending data over STM
>   	  devices. This was the protocol that the STM framework used
> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>   
>   config STM_PROTO_SYS_T
>   	tristate "MIPI SyS-T STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM

The help below here says "If you don't know what this is, say N." which 
makes me wonder if this should be on by default or not?

Also everything is in an "if STM" block, so "default STM" is a bit 
redundant. It's not that obvious what the intention was.

James

>   	help
>   	  This is an implementation of MIPI SyS-T protocol to be used
>   	  over the STP transport. In addition to the data payload, it
> 
> ---
> base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> change-id: 20251216-fix_stm_kconfig-a72f40c7612c
> 
> Best regards,



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0371CFA756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=009Kp7JLW19gzy0Kbdi9X3BDysqs7Ujtagl/qk1DBvg=; b=joAeUJ5IrUVfzXkOJFDwAP+Cyo
	JjICtAD2SQ5J30aXLfWF9EKxOWYnjOZ07QDTNm+Zb+gVYxzjgyK0pyklQSgaAlvksjKu7IhE1GoQk
	u8er+E57SsXYQvbeVjGsv1sFoEApK30jep4MzciF46o86Hfcqd5d6xz8kMyrJOx8GSmbZiousO/ck
	8SuvpkBKvwelkszYDVbDo7qNqYTGeH5v1cJt+XjNs7rVwIINJNGtk9xpL7rIEV4fkHmS60H8kyiAx
	gDeCtPqSESDGK7uM7EhSkH14GrK7oyx6UtVj3UJFfyg1eff77ZPC4feusiWDRUQzdeUhkL4KM4Dao
	a+Ccq1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMsh-000000086Mx-1r1E;
	Fri, 21 Nov 2025 08:52:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMsf-000000086ME-0Hn8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:52:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so11563445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763715155; x=1764319955; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=009Kp7JLW19gzy0Kbdi9X3BDysqs7Ujtagl/qk1DBvg=;
        b=V32ksELbbOKro0jCGkRK8CBYXQOrlxUn9A7LsGfW6gp/Xvre0lXLe1JI7Lf6LAC3oO
         DplOk3C985FmgNHhJmqsVslpFROPcREGKkcurO1E/GS61WPZLDdqtUY/VkemAHJyvZ/W
         lxHuXYdXCsz0UQQOrBqHl0/va5Gc/A99fACjp9wAGWHtXUPt15T3zNrFkbydCNhCtJWf
         nPucLGQU9L5zrWO2HANmQRiqG27G4vkAxlbBtubaB9LNrrFjw1tYeBAtypqc/Ho5Tckz
         sAxmIX+TLWh9jiuWW8Nnnq9f1U6PAuMHH2PbRyp5YKaZzPJdJpme8p1fPdeLTQLymwyI
         Q6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715155; x=1764319955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=009Kp7JLW19gzy0Kbdi9X3BDysqs7Ujtagl/qk1DBvg=;
        b=CgjeAnQJSL+pShapv+Ojykxe9Mg6onZqafCzZk8YYRoiFpSpFK6rsV1Z5mNKT4idWS
         nxN5S1412wT6nOPL5ty/X6lGJo1mqX3qQPztbKlbqLlkVt8idlQrjZseL5i6K3Q8piJK
         d+PGUuupmMrRcMx6Oqg6F1tvg0lkfuPyZhFgB/J/b0JqPuSD853/FE3GDUSWuaRPyDoJ
         0yFa+gMmGO0IhonR16z5M0ULchwJm2Ysqi3J43tgzky1hK5bPlVIUGw/S24Ygx41wMR3
         yAMdj5cteIMShmDWy++K5ezKzD6epr3B0PhlyMiAq2cNNjFHWOkeEsKFi2VF83hxYHJz
         dyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXOtyj/ZWGwbtDPfYL7c69+kFV1Ple7V4xsv3rr5e+1nrtS2RjGjrrZgyCxX5j0z9tj4I19b5oaMyIgRIN4Tnf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy75DVmEvgVYGutzuZrbmlrPBRii08MG8WK0wRhuUlClgGzNgL
	NComddbuyy5gOYC1WWlYgmazTO0X0HmM3JHAam59QHwr9R2aRaqnhfaU+cr35fkq6jgXBo7UZAK
	KA91NwSU=
X-Gm-Gg: ASbGncvNYXEJhm+a7j+Ch5C3iwbRXdfmu4HJKUfW5MlkOjcoZzTTUsBAe8RVRiOs/n0
	XRIKGFk9S8edewdpgSo4KLpO7wbTiYFCaTkwfGhjzuQxXK6p0MOv2rHb4lzeqa/Czjy0S9vjmT6
	uBTUdjPr6o7tDr/EiQGULzH0hJMKpIYkh5sIIyLImBxy7XgEo9NxX0SLMvmPVkFwUzFd0Cxna5J
	FmgrBLWApgImKPfGqPKTlcmiD49Q8h86Ogb0x8z5/X0T/hSKrBeX+F/z7hS9NNF7ImLQ6VItGEU
	B10P0wf1n9rV7Xp1Ax1PeWhx3MomDrer5oH5KDyG23cCPxlmWLOsDFKikDb/nhNtaX+1SDzOzMF
	cy46NYUiO/hqmpHTmQyIkS/7MIzzjHILy4WT0PnyOJIeMohMz+tgGUUjLCKMPoscyMmHhIXUGpQ
	M951FuTXW9ogPEL1yWSg==
X-Google-Smtp-Source: AGHT+IHHUafu+OUkKK50Le8mjsvU0/uci6SliRNf6HLCwNtTf8n2cBp38PJX5FeIrDkrXNgKHP3y7g==
X-Received: by 2002:a05:600c:3146:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-477c01b2211mr15198445e9.18.1763715155168;
        Fri, 21 Nov 2025 00:52:35 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8d97sm9388669f8f.42.2025.11.21.00.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:52:34 -0800 (PST)
Message-ID: <a837deb0-b353-4647-81ec-5f50aea5a0e3@linaro.org>
Date: Fri, 21 Nov 2025 10:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dmaengine 2/2] dmaengine: at_hdmac: add COMPILE_TEST
 support
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:MICROCHIP AT91 DMA DRIVERS"
 <linux-arm-kernel@lists.infradead.org>
References: <20251106022405.85604-1-rosenp@gmail.com>
 <20251106022405.85604-3-rosenp@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251106022405.85604-3-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005237_114986_1E2418B0 
X-CRM114-Status: GOOD (  13.11  )
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



On 11/6/25 04:24, Rosen Penev wrote:
> Allows the buildbot to detect potential issues with the code on various
> platforms.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 8cb36305be6d..243d3959ba79 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -102,7 +102,7 @@ config ARM_DMA350
>  
>  config AT_HDMAC
>  	tristate "Atmel AHB DMA support"
> -	depends on ARCH_AT91
> +	depends on ARCH_AT91 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
>  	help



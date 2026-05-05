Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15EECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2E1ZA+JT1zATLXU3871R3Np/zDJ4I4k+ZTjgi78jyM=; b=1bAE1VH9bT1M3CRx+y6Nfo8nQv
	Fkjx/Zzz14pGtwtO2Cy94h1Lm2AnbTLMdk25p9wCLE2dFEY/nJ4X/6nDo1F6fwe18tZLOOqQVSyQ7
	S1UBVPYv0kiR6UqR3f7/NMWczcuTFC2eZ4pekz4p9Pg0Z6oRY4WF6agThCzX7z+M69SUnhg5yAV9p
	Q/tcZPVgpffne6BkQl4/CPxfsUW7wewZudz2NtwArBbRWkxdg3+jR/d3XzKotQNno6SX0vhVDa7Gw
	VysckFuAb2ZRI3PaKqYU8XGHHCkQGtkqDIeX5pdtl6Pem7HWx9GDWL1LNNzcfB8oh3VzJdYnb+1Lg
	1+l4o3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN6K-0000000HVrE-2g7c;
	Tue, 05 May 2026 21:14:44 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN6H-0000000HVq9-0wUD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:14:42 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c6e2355739dso2221219a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015680; x=1778620480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=r2E1ZA+JT1zATLXU3871R3Np/zDJ4I4k+ZTjgi78jyM=;
        b=RauPw+ze82XAOB373+i419gJL6eq9EgiM3nm+hrLLXkkW3wMVSftBjQXjjdEqaZ6Ej
         jN9BFl7HLnQmrnGAmCjUmn7hmfbYh+yJFjyJIm3HAWEDo97v2FEtpnTeXfdY6JVxHQLi
         5s59a7z7e/QKD1JJ/xg4VTwF9asR8EjOV04yTILBYGOWwL14cB73UdPEZyzBTytxcuYe
         Q3fRaMvqHKkBVCgsSOfWmHoMsT4veQ+IPjRZPnZKsMNbMYAM7+aKOjLKW77ENXpjo8tH
         2eUXF71dfs/E1XBbtxrIlEZMwb+eVrns6OZggJ8o2cKn39gg4j+b7DhGzgMSvQR47AwP
         6p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015680; x=1778620480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2E1ZA+JT1zATLXU3871R3Np/zDJ4I4k+ZTjgi78jyM=;
        b=gxzI/SgSQvHeM96mnJ3PeyOGbvFD06vfymowtYlybWuemJurL37RZy3rMf6EbmAk9b
         EiPxplxa2H6tiFxuUBLIP/DaYruQSH9gsYNQ2McIZlwAKpxmagEP8roM7GGs9wV04jWC
         S/h4dvWmaraA8rHq9sE4/u4wXvlQDVZXqoM92rdKtelY3/9F/Ov5t0ut1awbWO3r/wSW
         UYiSh5YGZnFjiCpSyj8O3/BZVpAQXqS7bUFvaZ7QkbxxzNY21R6bXB9bpdpkWC5Y9U8G
         l190dML9rlXAskIBeZM7HmgHJBqVntM4IgpDM9YEGabm/fFIoU4Z8aUxlNQS5euPgOMA
         RDmQ==
X-Gm-Message-State: AOJu0Yz5j1NJkNGPXE3eVJTeapl//Bi4NpCgGHMLOc/e6wbkjIgBENRT
	0jblYW8YsPS+fzabyRzS0hz92MqRR05Fq+7s5/C2b3AYFpXlRh6pwIo032Y8ig==
X-Gm-Gg: AeBDiesnQk/y48c2yNtSHidn3q7Ej/XjQcQ7cSCvAYYP6WOotlAPNqoDaS2tXyHWLAZ
	w61O2Iwl6xeh9baytFUeG+pvEjyviYITTm5V7j84E5ndfl3KpUFCOcuQWNAz7U/3Wrc63x/2Soy
	jCkMRLQEq7HjhMRFiQ6Uta91qIW2k+Vi93pePoJwUN6WuxrMnAf7+aAMOP48b4opx+x2orrmq6r
	oAfBOnaOfXqZI0IcAXHpoiBwKaQJJvNhofTYBj45mxKi44eaGnNnP7ROCx2AvB3Ky9KYX+W97Ts
	2u3quWyDLVwcxqKOOHbQT455GyiQFlxLHnuiIwjRMgGj3p3da4CW11pn7zlGgOOJToKBTI/03Uh
	+miW62H/4NQIyjVHrGe5pfj5+AIN4FapNkhuWRwZW3ywqnFTzfoEeEGIgShXeMw1vrEuNgECq8W
	ezT0FtWHHn+A1i7LeCGnIboGkkHWAPPbjHiZ8tDLn/dRWkxW1xAl2DKHFeRXq/lwMF2Bf2u+uxi
	KCp6RTes2w=
X-Received: by 2002:a05:6a20:a11d:b0:398:78c0:6dca with SMTP id adf61e73a8af0-3aa5a9545f3mr517767637.15.1778015680235;
        Tue, 05 May 2026 14:14:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242bb871dsm135724a12.28.2026.05.05.14.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 14:14:39 -0700 (PDT)
Message-ID: <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
Date: Tue, 5 May 2026 14:14:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: Linus Walleij <linusw@kernel.org>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_141441_282900_998570FB 
X-CRM114-Status: GOOD (  21.71  )
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

On 5/5/26 12:15, Linus Walleij wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
> which in turn calls of_syscon_register. This function allocates memory.
> Since the memory management code has not been initialized at that time,
> the call always fails. It either returns -ENOMEM or crashes as follows.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
> [0000000c] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
> Hardware name: ARM Integrator/CP (Device Tree)
> PC is at __kmalloc_cache_noprof+0xec/0x39c
> LR is at __kmalloc_cache_noprof+0x34/0x39c
> ...
> Call trace:
>   __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
>   of_syscon_register from device_node_get_regmap+0xa4/0xb0
>   device_node_get_regmap from intcp_init_early+0xc/0x40
>   intcp_init_early from start_kernel+0x60/0x688
>   start_kernel from 0x0
> 
> The crash is seen due to a dereferenced pointer which is not supposed to be
> NULL but is NULL if the memory management subsystem has not been
> initialized. The crash is not seen with all versions of gcc. Some versions
> such as gcc 9.x apparently do not dereference the pointer, presumably if
> tracing is disabled. The problem has been reproduced with gcc 10.x, 11.x,
> and 13.x. Either case, if the crash is not seen, the call to
> syscon_regmap_lookup_by_compatible returns -ENOMEM, and
> sched_clock_register is never called.
> 
> Fix the problem by moving the early initialization code into the standard
> machine initialization code.
> 
> Fixes: bdb249fce9ad4 ("ARM: integrator: read counter using syscon/regmap")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/20250518164118.3859567-1-linux@roeck-us.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi SoC folks, please apply this directly for fixes.
> Got stuck on a sideways branch for way too long.

I actually stopped testing the integratorcp qemu emulation
because it no longer works reliably, not even with gcc 9.x,
since the timer-sp804 patches were applied.

Given that apparently no one but me ever hit that problem,
I wonder if it is time to remove support for that machine entirely.

Guenter



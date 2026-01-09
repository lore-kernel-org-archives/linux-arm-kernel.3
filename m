Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64589D26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sH82HZeooQjJu3LbcyB4SEm/Qe0ZcN7MT6wknG495Aw=; b=YvXsrB8fsYTLtb71/sfn65wBuD
	8alPQaPgwJO7wwJAzgJhQg/wfXy8qE+elnnd7qoEu6e6BJpP7/4Q5SOV0NcKJZ/Zq3WL15yVk6pT0
	2qsbzldaUzsQDQmWPdm/u8Sw9vXUEDHjaxqvMYoGN5H76S/W2EVCI2uCgwa0s4ln1ddtCV42Pqb6I
	VRmnAvmTxNmBncBIWAfS4MB4nkCigcPQubX+gaAMPc6vak8BnNIcnbojO/VWAlqb1FomM+kRK940g
	bTC8JUDbrDSpd8nAEheWaXx+FP5AlXzO+tcXyPu4L+Bm/6Q2NSbWZrQOHMAhpqaPBZ1AdKKHtGEVu
	PSEsocpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFN5-00000002cez-1rhJ;
	Fri, 09 Jan 2026 16:29:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFN3-00000002cdF-0ani
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:29:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso32706805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767976191; x=1768580991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sH82HZeooQjJu3LbcyB4SEm/Qe0ZcN7MT6wknG495Aw=;
        b=sd1VA2FctgeOqdd2n1eIExVYs3vMuWlEhwzy0F2sv9C1RhkXteastpl3Pd3CAI9jON
         Y8+4hkUB28jCG4mBMHlJze3kML/Zy0ib4KHFQA3fftxc6QNwsY+nh8FRPr2397+3ghK6
         wwxRce3s2QDYUoDqHV9n/Cs5jIn2Qyz4wg4BNVnCUPUaDZKV+WFuC0Va3kdKVVF5q5N1
         71ID9IPiNCk39hpjkw0bBpZ9vHwzUSITPZ2O5aitCcVvA0DvSQ3OeldOGIgsHWcDJ+ek
         uU7185cpMBSyDt93OE5mddZLI0ve5aMH1Cv2aitD88FIcpyh3wmaegerS8EHS8G0P5e4
         KmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976191; x=1768580991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH82HZeooQjJu3LbcyB4SEm/Qe0ZcN7MT6wknG495Aw=;
        b=dLadlr5Bk5rOo8Xmr9d61UxPEeHUiojVBITp1YkzTPsJ/AEACwDCyFgol37+yftE1F
         agxVRbt8UKeS7Nnm2bxJsM63vVlPrtxWB9g/eG59dJElIskij0OQAK/8LNk65BtJ9DC9
         k+jtBYrMFio2BfKN49MeboEsFgNydeV864Z7+0Mx4y6XMgNgkRaEOOh3xnO+EdOAaUWA
         yU+PpwpKMO8x4yVN/wtRVt9F/IeZeGTLOsraekrYhJ1K14QkL2TmXnzMr39DWZ0wAw2J
         Llv44XGz91K+PZRxYaL53tQzwTrEqFzUj7NiagCEuJTKAKxasyEFy8xxBx2k2HTJ6AoC
         +lMw==
X-Forwarded-Encrypted: i=1; AJvYcCUdi7P8cUegKpBWMHW50PJAOV4JFpodB8ia0IxQXWm8c/fInVsygF048O/iWiIkUMemwaUHS38G3VySeXNaMTjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzuXz7ThRKJLgsdNfPDB1m9q7M7vJFzqTPA2uOi2aXRbmWolVQ0
	qvt/ufsC00xR7YndO9nlq8w4qxNEH3YNrypSUJRhUZkvuaLyzQ6+494TBH60AHT5Ldc=
X-Gm-Gg: AY/fxX6SXaMg6jXTTc5HTrnJMp/x34qUWGvMBv18CWhha/vEWVdb91+7Io+LamETF24
	zZVPsRd480t37Ine/UQ3aX7daFsYa/FG3eafP7MVxuIQyTJl1QRdiu5bprbYtOSDr9FE/wdbLpP
	C44pZehC3OLsQEDGOjM111nnLi1pQXMYwhbT+DwWkXKXhKeCVUAMxBF3qy6pRelmePlW9Xt8T9T
	w572RdNTc6Yngdv2xxbF34i5ATEbWJa8wq9RBRGoydcHYXqQnL2wZLPA3Y8HWI2oukPXgLSnSFl
	MXcqM70Y2N5J3bOjVTz9WOve0WaudzLnVGF8L7QDAcoN+zZYp7iGw6KFSlaJTBIkYmEhIxyAejx
	m/Wnw/n/IZ84jjiR66tRt3mp7mwVQqWM3eeSM8ut5sjgiJzdxQfNeeqbAZTj2XapmcJNnwrjitU
	0xaPbzDTm8kNQp/g7q
X-Google-Smtp-Source: AGHT+IFvEex0eSGI0zBvBOU+P4xfAclyVh4ZDcQNrtmGp7L94SuKsKC0/wbJy9k8++p9SZf17t8s9Q==
X-Received: by 2002:a05:600c:444c:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47d84b0a9e5mr121188225e9.1.1767976191330;
        Fri, 09 Jan 2026 08:29:51 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8678cad8sm70961885e9.3.2026.01.09.08.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:29:51 -0800 (PST)
Message-ID: <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org>
Date: Fri, 9 Jan 2026 16:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-4-alexandru.elisei@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114160717.163230-4-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_082953_203422_039782CA 
X-CRM114-Status: GOOD (  19.37  )
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



On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
> Add a new configuration option that will be used for KVM SPE emulation.
> CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
> 
> 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
>     and that will be used by KVM to emulate SPE on heterogeneous systems.
> 
> 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
>     level.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arch/arm64/kvm/Kconfig | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 4f803fd1c99a..31388b5b2655 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
>   
>   	  If in doubt, say N.
>   
> +config KVM_ARM_SPE
> +	bool
> +	depends on KVM && ARM_SPE_PMU=y

I think the most common configuration is module, so requiring built-in 
isn't great. If there's any way of avoiding it, even if it costs a 
little bit of pain, it would be good for adoption.

It was basically the first thing I got stuck on trying to get it to 
work. Or if it really can't be done, maybe some kind of debug message to 
say why enabling failed.

> +	default n
> +	help
> +	  Adds support for Statistical Profiling Extension (SPE) in virtual
> +	  machines.
> +
>   endif # VIRTUALIZATION



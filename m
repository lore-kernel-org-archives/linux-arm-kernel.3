Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C86C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=; b=ctMsN9FXMe4p1t
	GTsRiLSCOvt+/CqpD8FAjhI4ve6z6broJt8mi66uzjiPM3go3u2xtZjnWpZkbWvZMwpOuaX1YpLB7
	Gnf3s/C5z0CR39Wl36YlJ29htyY3Zmd0SdEfyI88pXv4aUEKAEcylNU20C5S9QmwTaZPmdT7zYAlm
	hixmv3td9RpOJ39EVZEYaW2j3CmfIkVLYoe873Cjt9fm8018IZxkunD22YoOdQpeJygEHtlODaN8r
	pfUUfFRsBuSAhcsHCpqcAJkiPgSotzT0J8CgKW0RZWspluLvqrfHv/eLy6wzVIDXSk8EXpc9EZKT3
	508Sm/7ArcMRmTP4VPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxMm-00000003v4w-2nJN;
	Mon, 17 Feb 2025 09:24:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9R-00000003sjq-15DW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 09:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=; b=q2OFroy19LqnWuYWLqG7iBFl8B
	GUoUonxfo9NdS6RfwfvSvBeDB67EwK070XuxiN+Mq/0wJWd8C2Y2HUAPSMrMhOpmjB3hIU3mGwXdD
	OWvg1lSj0srCtnarOL2p6JHpybUTFPVBJZl1XGvsrjwymVyJhxoFBD5eBhbU0Udd1LM8/H1vYC3V5
	7HVwuYeHCIGcOkarnRypWMuqgJMIRLyQfGyMC4/by+vEc1YsGs2a3P8OgrMA9I7WzE5u+Fjpzwm6k
	jeoTEU+4WzU/0aM+l/+DJZku1GlXkV6Ca8aos3vbKshKG3sAlvrekRAECoWYb/s596NHW0gktdr0F
	KdGNjnvw==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9O-00000001kCs-1H8i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:10:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abb90f68f8cso189745366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783448; x=1740388248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=;
        b=R0HU6j3wN4ec7Onc5JpDh5rG1VWAaL3LM0Iv7Jn7YS20MDLXoS7xsZOV1ame1oxV3z
         XJ+QXxBbVs+pTc9/9bCEPfAoSEriXtwCD2Lc/OYrTMsHWn2CqSKNJ4DAZfmmKt0TAMPu
         ZipXzTcFpq1oKTMU3YJOxkv2DBvsj78Xu8baHwdtgdvZjOW9Ig45J874AiQBwrV+ayVn
         y9kJXuVu7qqXCL4JXg0SYPIqPPNp9VieKJHMRsfgi1zgvTfqYKXQdBGzdTTxOgM+hO73
         NcdnDIHcmdN0MEYPVpLbLavktgt3hcJ6zE/jUtltgJ8NMiv61R4hfNa/zeFXy3xPyxD8
         r5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783448; x=1740388248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=;
        b=uqkJ881t2E5dGZCHdcsgBiXehyPNvOSYTiXrJ3akFicg3kjNIrSQayJnG3Xy24mPUw
         wNowwXGaprzG/Y7KmLIBpk02UVaJXueDE9HBKyrXdGR4T0C/yzRZrrySR7D6Hb28UTew
         uKhcnTLmM9QMQjkB9+E3vHqCr/KeVqKcM1EDQXjTd9udYdRWB0z8QjQcJXJsmMh22n1r
         Z03eZrD1FOCjJ/P8Dl3m1tTsMCMhL3zJVARQBQAlnvZ8ipIoroUOV/lTkP3NyroJRa/3
         GphLz4rp2pbm7yeW62zVgdrPKZy+0/QevDrwMRsPx61FuyC8BB/aRF5xjgJUs53FjEFn
         bkFw==
X-Forwarded-Encrypted: i=1; AJvYcCWna2l9tfZqBVuWSONOBameP1kdmso4a/Krpe6KmzvGCx+r7/yn1SmzZLNDM1JzwIAiWgBCfZOMS9p2NbCmxBcT@lists.infradead.org
X-Gm-Message-State: AOJu0YxM0pwNItcgf0bMKYqOMFCksL0ZF5oXPiKvur2MwzyqHqaE85t2
	A1lpFI5XU/6g0BnvzCPFNfIS6iYIfnfmwOWJYcfRcBDvqZfLU7uqrbY7zvMjsFM=
X-Gm-Gg: ASbGnctYlNr571BptM7CdhgdR1ESbQ6xpAy0rJ/ktVL21pjQ5NbRXvnsH8U7vWtx9Zj
	RAHDc779VyyawPMePoPTb0PCW3W9AzBXd+05DFd3autOSzPF1sN2zckC7VeZx+YBbc97PEmx/iY
	Us90ZAYEcrOMiTR0TLwPNgV9pH8amXezosAMnIoL6+J6wLM8B1ZmTkHGITe4/cO6etH+57H1EaA
	bHCvSf+fLzlm3z4RDuS5S3f+3DQ98maTkuKIpv45YFPKi5AHbJmUKH00f1qdQennWNKiJL/zjm8
	fzxl/TkHGakUY+SCYHom4CQ=
X-Google-Smtp-Source: AGHT+IHrxbwT11nHlNtihnFEo6GxLB5WUZzVMCb1sDWISI6fMsTNPgPdGYggA0tSbgXZaPERaVzy5g==
X-Received: by 2002:a17:907:da4:b0:ab7:a5f2:ed22 with SMTP id a640c23a62f3a-abb70a7c9b4mr851455266b.1.1739783448057;
        Mon, 17 Feb 2025 01:10:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba3d765acsm91405266b.130.2025.02.17.01.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:47 -0800 (PST)
Message-ID: <116c9e5c-8bb3-422a-a52d-9d6d8c79e10a@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] nvmem: microchip-otpc: Fix swapped 'sleep' and
 'timeout' parameters
To: Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_091050_575000_B95BCD7F 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 11.02.2025 08:52, Alexander Dahl wrote:
> Makes no sense to have a timeout shorter than the sleep time, it would
> run into timeout right after the first sleep already.
> While at it, use a more specific macro instead of the generic one, which
> does exactly the same, but needs less parameters.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")

Fixes tag goes above you SoB tag.

> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
> 
>  drivers/nvmem/microchip-otpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index e2851c63cc0b4..bf7e5167152cb 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>  	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
>  
>  	/* Wait for packet to be transferred into temporary buffers. */
> -	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
> -				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
> +	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
> +					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
>  }
>  
>  /*



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFADC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD0ged1tbWk7V8+0mBgsPRbGV+NS/Ji1P1tciZQV6bE=; b=WYRuuneKKbNlMYn7W29wKfxQ5f
	GqJjDV/9xAMVs16kBAuNWSl7Scj3l3AaS4wCs0S8CWjhOBSDYIUJ7qWNXnYk20Z1a2gzll7nJsvIr
	5CrOsviFuOJmqj9rKkTyje+BxgP97xcbjkDFRCzNUAsANqaJreU7RgVgeuHzuwAacVXXANuVCdK0B
	stYufL6KpKn3f1OStWsnvvVT7TRBqomVGYMI9n4jtnhL4x4hB7PCKjpMEMVLZjRw3Ymt0DrqkglTB
	TSMkl6fyG5vMmdF+1qSdQbuEFw+EHYlk1DKmrY+R3OyXBLDBalPOxSMbx0OF67rsVfk7bDZWr+y3k
	qcI+jKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1A7-0000000HWeR-3qbZ;
	Mon, 03 Mar 2025 08:28:31 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp18Y-0000000HWO5-2KxP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:26:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so102970966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990412; x=1741595212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BD0ged1tbWk7V8+0mBgsPRbGV+NS/Ji1P1tciZQV6bE=;
        b=TumThhJrva1ARDS1LeRK2EvPlYXnF1/4aaEO+PfLzOMqpRazTnammfXVqojv7kcWm7
         Le1YVQzJmGBuljTys63YLaC0LLqZkR8XIrYPlV+xqo2RgR1Q2hFewjJ7LGykkh0zoptG
         +Tyw9/t4VTbOM9kY1gMCnHYfGqr5DYWek9cYIQt7paNA07BtgQy8Z0SG+C/Eey+ARB3f
         ViiLl3XSCRX+Do/Htv5yab7B1NIaaneYHaG9PfEhbupZkwufUqYzamL/c1xb7HshSHRa
         9T1SXyhrY+zUEggGJMfyUWb2jhAXf0j9vhaEyJB6FLGZtYyHMXy2hrHGKqp93GkWH/5E
         Ii7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990412; x=1741595212;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BD0ged1tbWk7V8+0mBgsPRbGV+NS/Ji1P1tciZQV6bE=;
        b=RywTeWpEf7+aIj0lUdcdEu3rMepj+iwp6OphFKcsMRDGNiY4G5U2c7SdC6fpY/IOmt
         K/hKG0eHa7J6W8yBIlwv/e22SZZybIkMIBESizlQs2+KnhuU+jkM68kaec35HrZck28V
         MSVVMsAXRs7B2fhfFiigqn+ILEMXyDJ/ZAfyriQYbEqUahIhVIc3m77aV+imTDfZ/2Si
         tG8RaEvdHsXnlmtf6BZgbvwvfb/+A39clL/dAGZwroGz8s6IBWrSBHmp4m56CfCM2WUb
         FJ+J+6Ou8YIONbOjAFgl7UYuBVDF35IQd0Hr1n3SQn24mq8G914YaAlxG2r493UiySmP
         tkkw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/QyuXOaDrW/isJril/b19ODyHG1Tx/FGla87/UctLafGbNhWtKkLItJgY+uVYFMgfjqBfkIHvYGsMURRjJHx@lists.infradead.org
X-Gm-Message-State: AOJu0YyVK0dU5+ujFMlJ9Km0L5yEXS+ukEps/BR68WDYz3zHuHVHYFzr
	vdCp/mYx8EFAPsNmOjbKxigsPo51KdJzVl63EeqLDSr0W56wPkr7xAW7oZBrdw4=
X-Gm-Gg: ASbGncvoPbpWqWW4PdvsKB3KDQqrLaQupFTGwOotkM5g5/9FMFSPnUdI5dJ8cNsX5nK
	rGNOCx++NOiukFfEOQr/v70XKd3GWxCOm2WjLJmlb073gtBXujkVW2X0+8SoY072JspJPpBbfaL
	rzp7QmBj98tmydqAEC7/SMwwhzUcCzTDH7NCO+RAzDKNDwUMrAkkrKELqB8Lz8cNNMOKiiowvmZ
	8n6ABfTLLxO5QoSZWUvwc5bRFlSf5YPfvdDN74Kp4vLTXKSeGl2NueldWAhHxZ+JXqPSKQSThsf
	RWBM0gybGb+SidLgrFJDrkKUF4G55UcYhMbUUxkYubAIqFN5tniN/g==
X-Google-Smtp-Source: AGHT+IFB0ef71YNR9dJGXCO7UqAzxgYbd67xW8P9JXXgL21idOk1dW4h3KG6K2wPSXyAzJ2F6c4cew==
X-Received: by 2002:a05:6402:2692:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e4d6b4baabmr28693051a12.23.1740990412164;
        Mon, 03 Mar 2025 00:26:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee491sm776723966b.103.2025.03.03.00.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:26:51 -0800 (PST)
Message-ID: <f03946a8-24bc-4a1a-8d06-d5652a4db34f@tuxon.dev>
Date: Mon, 3 Mar 2025 10:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/21] ARM: at91: Add PM support to sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <f4634d70f1e7002db059f2cc892fbbbfe1a95dac.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f4634d70f1e7002db059f2cc892fbbbfe1a95dac.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_002654_746772_FA052EA0 
X-CRM114-Status: GOOD (  14.01  )
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

Hi, Ryan,

On 27.02.2025 17:51, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add PM support to SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/mach-at91/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 04bd91c72521..f3ff1220c0fb 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -65,6 +65,7 @@ config SOC_SAMA7D65
>  	select HAVE_AT91_SAM9X60_PLL
>  	select HAVE_AT91_USB_CLK
>  	select HAVE_AT91_UTMI
> +	select PM_OPP

This is for OPP not PM support. For this series this should not be needed.


>  	select SOC_SAMA7
>  	help
>  	  Select this if you are using one of Microchip's SAMA7D65 family SoC.



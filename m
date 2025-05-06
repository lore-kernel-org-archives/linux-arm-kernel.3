Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D0C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKxUmPHgtJ1auRntYQ3zJdbwoBcjW9ng47toHLgvQyQ=; b=ZO2JlUAfeWUootGljL8FdZTxRr
	YXGXk8HkzU8Hd0qMjtRT37YmdRfBZxJoNRHvpayH2NppHp33Efh7in0eOR+uBWGvf/H/sdlBokiQD
	q4xqejBR6Js93iA7gOufMTvGU8srKG0/R6BNzyQ2wsH2SSOHajAhv20dbjqPlfjGI0PNJYLL7XX6t
	xPIlic1ihSZolv5HrtsNtxdC2efKJ7OBPDcD1D7U7rI5Pp1BYZ/SWIUw0aJBIjJMSId1oRU3QpSST
	9WhQ9aawaMBo1yvCg7V8Cmry6lUlO1/4Dvkp0Fat32j2wGBYwjzbHWuhH0KWHlGOn+X0Dys5HKsyV
	uJmN/NYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQio-0000000Da9S-0Szl;
	Tue, 06 May 2025 22:25:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLk3-0000000CnXW-3KxD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 17:06:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso7045255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746551162; x=1747155962; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKxUmPHgtJ1auRntYQ3zJdbwoBcjW9ng47toHLgvQyQ=;
        b=E8wcjj6aNFG4SJ5Y9EWFTrQHVGSt4XqE2cDzdNQ14Wk4AK30K+By3ku7SDSpuMm82I
         Vg9JJROXvkudWQQtVMbjlB+uMQjZ1lZvqLWtxcCTC4013oalRMhdMEC0WYlcuoOfpZx+
         UquNT9nVZ17XAN6vaO+qiXRuaS6kPfg3/3NEishVs96yM9D5WYI8IDtHGuv1t2xK5I12
         lQJ8yeBpKMk+2zNVJKxtAo9wPiUHmp+OQH25ezLi2Jp8EmtxjdUFQT2ewyp4ivlpEVm1
         SRbUcNnIDMGW8LbXjVcYavkKZmId7MV8E23v/cEAYfVzwM497UFkDN1ugBuxpXayvqXC
         8L0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551162; x=1747155962;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKxUmPHgtJ1auRntYQ3zJdbwoBcjW9ng47toHLgvQyQ=;
        b=YL9/qidhFzK8odWCscUXTNvWC0SS4eImMhyoMX1NhTfJKbvKlsfHDgGQuZ1bY1jVFa
         Eeg7HgoclTurwAd8mhiXclNdLOrQAvVhFoy+lb77+zV/C8YomjQGRnkCFN0N30raQgYR
         FVj3kOxQxlT80Nd9yT6xDWbYcAw8AgCXPTGLMo9PBXYuT4Qnp1aJ7CoZIC3OArjqCSHt
         OplyuCOAXMYhBJN0TvewEyAwcHey2v9ss53VIgHqiUlUNwgjrIrtD4Myb/tG9yv03Um2
         Iq5bCFVqGjh9OTUToYS9v3s9DVxgdKWqplR4gzAPvFqqYXVT/GHftyk9C0lexDPxjEX+
         pfng==
X-Gm-Message-State: AOJu0Yz8MVJvQE5KO97fI6azHIwiKwosppJwwKFDM1bn/iYxZmjBFK/I
	TY8/C0WDya5wZb3XdHgMz0d3OjjDi7FcOJrcDpJ2sTG7AVjjvyQoRBOZTzedqcYPAmDHP7S14f+
	b
X-Gm-Gg: ASbGncu/2aaJ7fpzyFUgSjMtSoChtg/V32OUq/b2n+LZt9Hn9Y6+wANFt4RnENyR9M7
	FfGLzVdhMX5IPKQ80N7DLk8fWxd7CUFYCcehRh3dx/GImLagLdU5ymfNhZecn6tryy7V6WUnunX
	yWXVjJhRdRUv41HlOIvad2skgk283ESXgnwqCUPKrF8/IxjPGzDgHLTMeqDvYCzOR3VLG0ktFXC
	YeXwB0fdcC07hsEqWxjFVcB1JMbaTKfxUedY1e70bQnME8Lc2V0wOPH12zse8yW0Md5uGQ54wtX
	Rk4kfmJEKOS0R5+iqdrP9fHDC9ZvoJ99pRd+kfak9Wb95PlzhIGBfuLNdnCy9RZ/8ONHnA==
X-Google-Smtp-Source: AGHT+IGHoQYv3yKC01U0PdcyTniOLz3Ljk+3J/XMWm4y8VZKBtbq5GjI8V30r+/hbEY1whEUZmU54A==
X-Received: by 2002:a05:600c:3b11:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-441bbec0daemr57107415e9.3.1746551162115;
        Tue, 06 May 2025 10:06:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b44474sm223802455e9.29.2025.05.06.10.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:06:01 -0700 (PDT)
Message-ID: <bb857b7d-97f8-4505-9d2a-1ba9d6319710@linaro.org>
Date: Tue, 6 May 2025 19:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add Luckfox Omni3576 Carrier Board support for
 RK3576
To: John Clark <inindev@gmail.com>, heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
 jonas@kwiboo.se, frattaroli.nicolas@gmail.com, andrew@lunn.ch
References: <20250506114115.613616-1-inindev@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250506114115.613616-1-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_100603_849800_F6DE38C9 
X-CRM114-Status: GOOD (  11.85  )
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

On 06/05/2025 13:41, John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576
> Carrier Board with the Core3576 Module, powered by the Rockchip
> RK3576 SoC (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52
> MC3 GPU). It enables essential functionality for booting Linux and
> basic connectivity, with plans for future support of peripherals
> like WiFi, MIPI-DSI, HDMI, and Ethernet.
> 
> The series was first posted as v1 at:
> https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
> v2 at:
> https://lore.kernel.org/linux-rockchip/20250504102447.153551-1-inindev@gmail.com
You got extensive guideline what to do in my reply to avoid exactly the
mistake you did ... yet you ignored the guideline.

I don't understand.

Are you going to ignore also Conor's tags?

Best regards,
Krzysztof


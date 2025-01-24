Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3BC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFRWQAnQKD0cOeCdNKHeHeJi/NQ7F6aLdvoRMADeNDY=; b=xovhDcZfWCnXLfNSYT2xaNqrvi
	uyPHK88bUOtt9ZyXxhUYtGvIfoiVz5AoGVYWA51Hmn9fW/PD+Uku7o8pddnjZQ0uOXzsU7tQQ0gr8
	vAp7OFYp9ecN/TlF2W3/WHNZk62+RI4oohvWcPdInqDwtua/10vQnwwYfIoSDvWItw3+oFp4zirMV
	fFp7CohgRoHl/CcPR5cg/ky0+KkB4chXTo8+e3Lu0I4N3Xo0nvQPKwupiwIYOheUVEM4HkvhcdoLi
	ZdvXdvfkZIzdNoWSPfINTeg4IwNUM77DIdYKIr4T0g/SgWAxlDi4FjMzYi58/8Hj6GkRinGBd5Z9F
	RYC9DS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEHD-0000000E9N4-39pl;
	Fri, 24 Jan 2025 07:38:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbE8B-0000000E7Dx-0Tfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 07:29:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaec61d0f65so394966866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 23:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737703769; x=1738308569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFRWQAnQKD0cOeCdNKHeHeJi/NQ7F6aLdvoRMADeNDY=;
        b=hsaVZtVPIwUnbj0j+EYZfk174OoBjVqsDHE8MeYc+2bbpB2c+udzRPYBW2cQzL/XcZ
         xH+3cttKFYU1rR94fb9Qg0vvxcy6qeFlfpmG0zrK+0TlgjLdHesn5t/r23UNGrNCllI1
         ZEmY7BlVhSX9FxJU0t0UAyJZ0yWz+XrLEPG5gnrnt+GFSEslkjMvMaPr/IovG798Ns2V
         hSf6rKWzWYVPx1eqveb6MG1tIpLDkKdrCuUYj7/MDACB9CJfftfphJK9gmjk2Nle3gJN
         t7gNIWBL1IPiL/Y9xbOg8sdZgKwCYzgV5RUhGVpaZvGprMy8sODJy/y7lKQniv1yHDv2
         eadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737703769; x=1738308569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFRWQAnQKD0cOeCdNKHeHeJi/NQ7F6aLdvoRMADeNDY=;
        b=SOzsQxbZsKiT7MtSNR7Hss4wejO0J6H+4WYBBV0Cd3xKhcnLnzLWvDDoDZHT1/xJ0p
         C/3cX9spaFwbesJW8vyQkZOjEVjzcjTeLCKQu/aD+jiAkBtb2x/SAC6Ptzxf3/fntewu
         WNf9EQS8WbXeQ3Wn2e/dpuNC+QlhQlzAkIkvT8JuWjLJBEfXd/BxUxiTTGIQSlJQ7Efr
         wgHNGOcGsR8VsKYlukRho7s/ioWuxcqTWtZpIrzwDXFbC4vzNR7vOtI4RFpNnzARVo/6
         Y5X0SHm5Y0yOJPQSiAL5fmjLfRVaTC1pAaNaGys6FxsqyR0klZMFKw647rGfyayLNz9R
         ahPA==
X-Forwarded-Encrypted: i=1; AJvYcCXeTb57GGo4EMdCrmDQuO2uJHyBo3sN04UyUVUS/o4w+r92QOd5RDoxwlVoFbp8FGKnciRPU6ZKZDDidsPdE72Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwszU3mSyuxgyS4TmZGfGKrR+Kw3oqvQa5zq3Phz8cjnJvsOTlq
	LExzkHY0Ca/21UAoOyWlSrbaTp7oSo23pEsqYiMVmcI2+CyppKllLmpDz49/4F8=
X-Gm-Gg: ASbGncsEyXFbzvtqw/WMH3sOiL0xEmrEHTmKHtMlghLSUDdaUosZ7BCWJC6TK1Oewpt
	vK62uFwrm0MlujdFrwLO+MONpsrqoPP9P6FGieZpD8mxUuPhXI1B6EguUKWkaSq7HQULy10mc7g
	AWdysHS8WsyTL6EtxcNyWgdcgQFXUUEhSv9CQ4I7CR2f9DuT0BJWdC38R7oyyEHVgf0TgTsl8gg
	Fjq0uBAcN3yaa7GVN2MKstGKn3LIZQMR7zlfn0mp+n6VhQxiO+mXnRrZBnHbRrazASukTiX3PYv
	iZb31/fhpmy8xQ==
X-Google-Smtp-Source: AGHT+IGlO8IurKfAUaDFQ9yj+nNACZ22XTZ7n6MTCnWo3Z3sqwo54Pz73RTpqelSGI+/3LK+XKZGdg==
X-Received: by 2002:a17:906:f598:b0:aa6:4a5b:b729 with SMTP id a640c23a62f3a-ab38b1bbeacmr3032453266b.33.1737703768986;
        Thu, 23 Jan 2025 23:29:28 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18618362sm770232a12.14.2025.01.23.23.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 23:29:28 -0800 (PST)
Message-ID: <6057f88e-e690-44fb-b70f-97347f9decab@linaro.org>
Date: Fri, 24 Jan 2025 07:29:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: convert atmel-dma.txt to YAML
To: Charan Pedumuru <charan.pedumuru@microchip.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Durai Manickam KR <durai.manickamkr@microchip.com>
References: <20250123-dma-v1-1-054f1a77e733@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250123-dma-v1-1-054f1a77e733@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_232931_195788_ED8F633F 
X-CRM114-Status: UNSURE (   6.18  )
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



On 1/23/25 9:28 AM, Charan Pedumuru wrote:
> +maintainers:
> +  - Ludovic Desroches <ludovic.desroches@microchip.com>
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>

If sending v3, please drop me from the maintainers list.

Thanks,
ta


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16BEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZsqPIlzakM9CiQKEYZw0VMhLSMsXirFzLyiqiLeJ8E=; b=JFpUNNdHm+y7rUaHwP2DZ7ReXU
	R+nIk8E82Oc0px5xFmqByZ+W4aVhCopIpdRo7SOfwnRwbZJWFx+SZT2Ca+lkEPLt9ShQ326p0Hwi2
	hN1cDnYK+7iolAXpdwFtCGoCelXHqtUEB1DW+bFQ5Uu8P0Qu/8FcLTGiD1ktsh//fnTpYuxnpVpQG
	LPmIk5zdRe/RISzIMSjhqnesxPmCmKH0sMF3mE5PUhATL/OgXc2IEqsDjL2TluXx9r3wsxdnboqoq
	IgVWAkGoi2jMwTpBJlyG4AD9eBB7sDfRiG64/tgajp7l/2hqz1P1DdnhoUpDXolDqpXDi9uRNEml3
	AdXEQnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxxd-00000004r7R-0llY;
	Tue, 24 Jun 2025 07:20:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxqb-00000004qQS-0ZZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:13:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ade58ef47c0so1011359566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749215; x=1751354015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZsqPIlzakM9CiQKEYZw0VMhLSMsXirFzLyiqiLeJ8E=;
        b=S8E3KsXN/qhNbpATFpn2PmjqiY5djvKUEeFoRGVzfAapGm6/++M7c8OGPQZfGcpi8y
         KXhsDHRLQHE9Dpm39iCudq9oDAr9NI85/WLRKJcKHnioz/CRMSA6ARX6NwOKsk2Fty9N
         GYs6fu/isEG7V91NGqGbsFUFEUwYtLer0MUJhoREcjqDGc2DbJnXkpkagjpljDn6R3k0
         vtZRwW7M0PWFTo510E6yoC9WC9W9nd5CXLJ9ZzmzdWbLTu/AV53zAgyXS8ZJWhQRihPR
         JmtpgfIALqTzpcA7Vh2wZLIh1lCjLWipNi3qq9cOlOyjOT/shcAmr0EK1DqO6v4OhFwi
         Ylvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749215; x=1751354015;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZsqPIlzakM9CiQKEYZw0VMhLSMsXirFzLyiqiLeJ8E=;
        b=uGXYHY6OY5F8Yq6oFOSFd0rI+zTuwslMw+yd6o66TNv18Chg5Dau214IkNIaasXIMF
         G1r6fCwkS1+/BeGcwHHtCOX1DGCzm5aZgqBtXhhMWtAMGLKPn76dmZnU32RyARLPAKXz
         3353aTOMaSTlhWPqE+BhFFNXRWFIOpy9UfJ9ZdptlBzholwUyQTaQiADyRBCgZnvvv0c
         yINqF+cDF5JHXdpBCts63JPUQk5kk7TvW3EWIZWSG6SwvApjSOdlI888G3JXqaUzuQAK
         PYNIdJiYFV2YoAVc9Yl9mwGQ8N8glhYg60V6zKHs1UwzJX4107mEgKgJzoFbfkYXp2Kg
         FySQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZROzjjD88TmO03gvVq1ix+F494O2INqD+R9qfm3/mceO+MTM6OmRBiVY2a/0PFFpO7kjKFeaq0texKzmiThnx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/JU6PKZpRenmFpnc9X3ybhoQ67eE6vZMkRsp/zY9HvUEXsjd3
	lxD0UhaYDevGtZWVUsOLf5YIph47FGlu0I2gknCjgeruLmyn+k5ygFVnf5Mj5s8C5+VIpCbZnJs
	1Y/UP
X-Gm-Gg: ASbGnctIVTqQN7oF2jrrdYjys3+3/UZ7moKv4MBE/U5Ulnfsojgb5GZlIlRWalKE/0I
	3+Pu7fEfXQpYwyFPHxsGXRh0lMTBglHIDyHihCqhwbZEVXvTGBBOkBx4Pbb9k6D0/Nl0mVxz+GX
	1QVcYpwRowv9GpEg9QeW6jSIFESIkNps1jpFU8WQkJhzTYGOBjt/4ISjgSY7Yn1dJ55DID2RgQU
	LAmTGr3m2behKk+fhz1SlmjpPisrRnqguv1X6CjIWeR4sV1cgtwnUDpB7bbMunhXdga2ZFvkTJW
	IkeoxFMJQSiOAdlbC8B0+YaeBiyZckZII4lwCdUbZoWNQl0dmYkTO9usWfkcsnEf3CJAkNM=
X-Google-Smtp-Source: AGHT+IHKnr+Ic27f5Dqtk9V1XEvi1k7erHnsJ8svDB4g8oyxVwlgZRh/6GZoFZH6tUF8NCWR+LBHiQ==
X-Received: by 2002:a17:906:794e:b0:ae0:a0ab:245f with SMTP id a640c23a62f3a-ae0a6efc2c0mr247497666b.0.1750749215471;
        Tue, 24 Jun 2025 00:13:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm13120566b.177.2025.06.24.00.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:13:34 -0700 (PDT)
Message-ID: <c3895975-b02e-4648-9cbf-9dd7f62ed4cf@tuxon.dev>
Date: Tue, 24 Jun 2025 10:13:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: microchip: use recent scl/sda gpio bindings
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
 <20250519112107.2980-4-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250519112107.2980-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001337_178650_4DFBEE67 
X-CRM114-Status: UNSURE (   9.16  )
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



On 19.05.2025 14:21, Wolfram Sang wrote:
> We have dedictaded bindings for scl/sda nowadays. Switch away from the
> deprecated plain 'gpios' property.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/boot/dts/microchip/at91rm9200.dtsi  |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9260.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9261.dtsi |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9263.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9g45.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9n12.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9rl.dtsi  |  8 ++++----
>  arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 15 ++++++---------
>  8 files changed, 22 insertions(+), 30 deletions(-)
Applied to at91-dt, thanks!


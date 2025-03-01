Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D42C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyE4RDFymN6Y0/tDe7AGiAbq+AewoZBWihg6OLLbjWc=; b=tYTMK61H/7ULSn
	ee91jyRrlpHsft2FNVRSJnqgktIxVHF2c/Al20mOXIbt0ifdyt6woyXhw5rNSrQmpHYcacfyhKyyj
	y+P6vxTqE2Vk7hWusymI60+8RJLTjDwZrm39odQok+78QsUrP+/XqHgQu4vlLqH7CJk/+l+WJtIvt
	q78OgCYZJV7k/W46fPIMVz55TzKV0PW+JuKaAQSutr7R1njFutCOHRtbd0jn9G1VuseOiYIzIE11r
	QRQkfVSUmxyP86Qzyy/xreiaP4zompdKRPjSFrr9u1B1lzvypBkcBUekSPFNdDx4HTQTQWe8WMnKT
	mUDhXpp8MT+DMipA8Okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toOin-0000000EYQr-1j04;
	Sat, 01 Mar 2025 15:25:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toOhD-0000000EYMj-2TB0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 15:24:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4399deda38cso20113735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 07:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740842645; x=1741447445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyE4RDFymN6Y0/tDe7AGiAbq+AewoZBWihg6OLLbjWc=;
        b=jVtNh2l/4EdnnlAR4Bu02a1XAxqL7rmal2xhEtVHMI5ILrW1SRd+RZDV6rYq+lCGxK
         dBAdhKDDNpfjwKw3+mhElWpQGmM9aF9WqUi8EEZM9tXcDEDs0CiImhkxeeG5gRFZDTPc
         DAlX0YVDPZC5rZPH0WUGZal4sPdmVcLU0+1EbBOzgNgSz2Eg+tfunfVSm7fHej74en5A
         g3RooBuGV4Cxq5kgU42pkvnMP6hdDBQGfqXM//NbCjSq0vMApMgRV9Utp5dprVOQDKKb
         kcKMqbJZmHBIRhQSM3O+lpRzStpOSDhMwT/0fbexYHRhATWF8Hf4tPED4OOFwkvqTOfm
         IkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740842645; x=1741447445;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyE4RDFymN6Y0/tDe7AGiAbq+AewoZBWihg6OLLbjWc=;
        b=MKlicghqZeJ9MXZ5BwBO0j/nJqiPqKQGXpTmJ0XSQoLORhoZHndVgZIjlZAuPxl26I
         9ODNP60+ZnMB1dKB1J87u3R1ofIM8wKg89V2z+88iU9cx70INq3h3FbRaWwYWVeDzwrU
         VTvIyBArZfwSuob2s6x024eA2JP+Veu9jByJA09eU9UMrs+NGFQK7FlH/e6aSPIX181C
         xMNt/jto7XsU27Y85jzem2Ek8gXQWO2Ix4lPBEfs7vpuPGZe3VPoWQ8rY5dEIiUhauqr
         Wp9Mw6nAoINyQvRwJk81PLBx7DD25t9QLREsKD+2BM6hoC4V6mF/7QWyEpx1BZj7Tz1i
         jB/w==
X-Forwarded-Encrypted: i=1; AJvYcCWSmZc54pdyptnO93sz6N1Zrvf/nlOTTa0bfZXLimXtQT+8Mi67HD1dXkMw4qo6+kL+vFpqDfIYx3FOCn/p5ZVu@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxpIIOLD/oVeL8Zl97ff2mGne81kTR9vTa6slpdD2eB4+XcpG
	anIAkkXdsThrhTjzFbgi0azn70AF0s+koUa6YyVpNjlzkA2jXeonRRu5awcrIAbODN6an4FBqc0
	v2CU=
X-Gm-Gg: ASbGncsvUkHdQw+4xalHTiMXneUxout362SwK6KR8MytbAVWiil1EfHG0O4aMM01OCb
	8DKBkh8uyPQ100PShlJzzf9OdZ63rAVNEdaRf2bbt7lV/LY8wt+bYs/LZkUoH0YoqYbb2ip457W
	mZMfcNgeHgNSqvnEnaevbi4RPHL++8JVvDH20Nzu3qXBWbbVise9FcXZDrdYsw85O41WyfZLM9m
	ERX6LaPXOp4y3+MDQi1S/TMAoDUywHedz7Y+b27nd7ZQ4gUjmn9z0aJzHsG0dTkM99Ro4/KzDns
	zCM3L45Qq9LkPu1TULszkn1n2Ug1EjenPriGHEDNwaxtUe2SO2yZcA==
X-Google-Smtp-Source: AGHT+IHiRxjnZq8NhUb5asT1Hu0VwjQR+BBK3Vyg+BBt9UXQkSJXAdtpoOKry9ltGZaW6bEq4w2XVw==
X-Received: by 2002:a05:6000:1f81:b0:38f:32ac:7e70 with SMTP id ffacd0b85a97d-390eca4ad13mr5456232f8f.49.1740842645416;
        Sat, 01 Mar 2025 07:24:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm8785532f8f.15.2025.03.01.07.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 07:24:04 -0800 (PST)
Message-ID: <35dd6819-591a-4dcb-9c01-f32e7f1db54a@tuxon.dev>
Date: Sat, 1 Mar 2025 17:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: at91: calao_usb: improve support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_072407_776270_1224C5EF 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 26.02.2025 10:49, Wolfram Sang wrote:
> Wolfram Sang (4):
>   dt-bindings: ARM: at91: make separate entry for Olimex board
>   dt-bindings: ARM: at91: add Calao USB boards

Applied to at91-soc, thanks!

>   ARM: dts: at91: usb_a9263: fix wrong vendor
>   ARM: dts: at91: fix faulty ohci/ehci node names

Applied to at91-dt, thanks!


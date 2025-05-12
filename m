Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6703C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJ0pZeoCKCfyAqX8wSUvG3d18OLltfb6qKEIEaqAKws=; b=oZ9p2NKi6h+tyuBFhkYpznVGHx
	JuQTWHxLQzaUIih9+R/6qzWLv2fJlZ/wX9zbvZl7BbOLtz0JjzJbWCDeXlSNtH/G+CP4ZOZfe1EUo
	KGOaqoyk3tAMSCh5Ckdh9Gl9EG88/wEXBc4HOc3RBG2RIGIYD2kqWC9raTXyckT/ETrtsz3ULQJ75
	kfLBcYBGLW3xkFpxrnxN0PG4qmb4y0IR69YNUGHvxKmw/CbCiedME8fZRNvl4bzIJzhLveQBltKhB
	cEfweLrRpx2u3Abpa35X3xRtbkoVXGlJpqNk2ICmw6Vct8kWy6WtExp93Z8PmC/VjtD8bjdOtKay6
	7uTavUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVO8-00000009wAV-2bZR;
	Mon, 12 May 2025 15:48:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEV0u-00000009rbg-34iw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:24:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so556042366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747063459; x=1747668259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJ0pZeoCKCfyAqX8wSUvG3d18OLltfb6qKEIEaqAKws=;
        b=ZPR3ItLlFJiH4PkRuPi6ZlH2anBjP65fo1odJn/CXys75Z5wEj2hZlIokBIcrM9O3V
         X8/B5X7go4cWWb7huZqBCSnYrzrL8uBzpGFuhjweu5FZr3PdTLJPgXYubOMIat/k3G9u
         qWt33WYXM2z5OaKHxrOSwMIqbBeQx1+LsPo5PQmDvfpWME4mS9YB7FCva73oVTFuUalu
         2RcDhaJorVvDDBWEiamx+k7K29Uvx4vT41Y7fj1OuTVGgj21fDkdoYMZFwUl8JMraPVY
         lvsHJhJyQKp80LArjqI5YGpAKAmcVudDpV2npVmNHwXqLtdPgJeCjr4zV6mybXzYtgPo
         AP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063459; x=1747668259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ0pZeoCKCfyAqX8wSUvG3d18OLltfb6qKEIEaqAKws=;
        b=vEXvoB3n/0NL+STPHlIOSbiC+MUPUZXpXvocdZo7+hF8elHSBYYenV0jAU+jwTKOee
         V/lrShzHz9lkri3iw8ncckxBlYKOLONIbmxxe5tV2iCoi3SMOyNxG3zpdAw/AsC/y5rM
         RZ8Bh49/eM2DThcakKr8tJCWYiKvaPjzZExGH0ZoGfQx1azklADC6C8tNPpaer2wlD3j
         oLZmwh0AFCZjFKLBJxTK4D8bfYEL0RY2HE7r22qZnFIHJslHANX548eFgMQyoVkkgfw+
         LMaXePBLLd5P9cZ4NsNgN2S5rJ2WHI+nwaIdgFuo4ojpQNtaGycxtKyT+l/bgMKzFv0I
         kHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGnoq+yY2PyJOD3qkyxngFhskwlFOpKWcRnnONnbicMYsuQy/yRrtXLtGcEehPpw18NCtNEpnnfUeeE08/mA0T@lists.infradead.org
X-Gm-Message-State: AOJu0YxWBtR95AJd8huRzSf2UQTvJWgv0QjPhCcg8CUOAOqk6igjfOW/
	iZ9IYJgXOQXyNiH8YUN6Sz6mROIFNYvdM3BQmqVuKi49Ez3ZT/BhKZrkPVXW1fs=
X-Gm-Gg: ASbGncswu/CSS8qIV+jsUwVmFrZH6901AIT9RfSB++hTa5jDVmLLN7TKUczRk56ZP1T
	wwCgbxBk7mz83ih5FoCZqlbRBT6l7T2qBb4xtcM8fPBspD6omfmvhahazamImFrRWx7zy/D2tIk
	x5pwdY7kdfYhCFtk5oCgMuUk2pn2CgcAIgHLu1I/0T1PMJVRrzJtIh4QZTQP3oALlI+U9+t5/wf
	UZVA1OELoC91cI3QQc3D/2WAdmaRV0n2Eq2RGVIR9N3ufWcmplBbvOr+MKUqlIqp41r7TDvUTxz
	ozsy+cbSm63WeGirqudWGe/6Z3oAn4yycIemRbWu98koPenc1QNrhApP4Ik=
X-Google-Smtp-Source: AGHT+IFiscgJH74JtDHKRPJ6WOnSp0Qwetiugaufm74/HPiww3G05l9dWnAAkpOvvIaNJe+iKRRcsg==
X-Received: by 2002:a17:906:620a:b0:ad2:2d74:a1b with SMTP id a640c23a62f3a-ad22d74107dmr898443366b.45.1747063458757;
        Mon, 12 May 2025 08:24:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24121e992sm361199266b.14.2025.05.12.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 08:24:18 -0700 (PDT)
Message-ID: <c1f42c52-0cbd-4673-90cf-3e1c4de38e92@tuxon.dev>
Date: Mon, 12 May 2025 18:24:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7g54_curiosity: Add
 fixed-partitions for spi-nor flash
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250429064547.5807-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250429064547.5807-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_082420_775399_945E5A5D 
X-CRM114-Status: UNSURE (   9.58  )
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



On 29.04.2025 09:45, Mihai Sain wrote:
> Add fixed-partitions for spi-nor flash to match the at91 boot flow
> and layout of the nand flash.
> Partitions can be listed from /proc/mtd:
> 
> [root@sama7g54 ~]$ cat /proc/mtd | grep qspi
> mtd6: 00040000 00001000 "qspi1: at91bootstrap"
> mtd7: 00100000 00001000 "qspi1: u-boot"
> mtd8: 00040000 00001000 "qspi1: u-boot env"
> mtd9: 00080000 00001000 "qspi1: device tree"
> mtd10: 00600000 00001000 "qspi1: kernel"
> 
> [root@sama7g54 ~]$ mtdinfo /dev/mtd10
> mtd10
> Name:                           qspi1: kernel
> Type:                           nor
> Eraseblock size:                4096 bytes, 4.0 KiB
> Amount of eraseblocks:          1536 (6291456 bytes, 6.0 MiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:                  1 byte
> Character device major/minor:   90:20
> Bad blocks are allowed:         false
> Device is writable:             true
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

Applied to at91-dt, thanks!


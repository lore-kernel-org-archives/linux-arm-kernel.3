Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65068D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XwABaHQba0TZXE5KSskxvkqQOly72ac18mmHR+qtCY=; b=0b7wNNNCz5yuK7LC9aMGeHAYYH
	kDSyY/97QbE7hWZzSoTLKKmoPekf6oVXWdxB67Zgc/pgl0/L7dgsi6iez7Wi/G9DpezhosVyjKcWG
	69dkQICMqhYp5gd18+vW9rtB6yAmLD6FQOiMRX0QRGdbqV95vuc/uSZboGjiPzvs6Ij4B9TnDBdD/
	5YHIXkrTTLnScDIxbCmKyXJ9R8Iy0cO3kxWkfxdSqky2A1zXgws3hyaXn6QBcHY5DDx7slQS/zQx/
	e6Gj7OJ+D6CCQ0n2UIJGVyp/3wey6I2u66/I0bL3vgZR7ZEGyJ5yOwklUDqMwbVKTkcOFLohhegiM
	OE0bcahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew3x-00000004GyM-0tSH;
	Sun, 11 Jan 2026 14:05:01 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew3u-00000004Gxg-0V4t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:04:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so7701030a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768140296; x=1768745096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XwABaHQba0TZXE5KSskxvkqQOly72ac18mmHR+qtCY=;
        b=U2U7ij+SZTEmWYP/rN6FOGqdh7CNxxaCJHzrV2mL3CkCppXYIq3VBbpTWadLQRnxsA
         Igp/FfbHNBax92RxX2dQpy8ra4wU3VqUbV8fYAqV7TI9t2dRiMnUfDM7G70BVRT+U7Ou
         Un5mahiNhcv8JsktZu1o4BRKcUqR2YJXPv+O4fWoaBn7GEekml6MHP3oHaJKg1f8BpnV
         ADx2yRMV1FnS1solDu8cBDbNIC3e0346cvgWw5BLNTDrwbpjcXYCsWFGkffJzrNFIfze
         sqgm+e4JcVciGDJBSavITit8bolblKg0NYfjvHmFgJF035gXG37kTLS3uxwnSe0ywdkM
         xEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140296; x=1768745096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XwABaHQba0TZXE5KSskxvkqQOly72ac18mmHR+qtCY=;
        b=YCkpaxbvHh0CEgvJZRhRi1SBCnMh8DSKVREQzaLz5haDCM8ezA/qDVd0RdtzR1z3m7
         bTuKoTuCxv9pEKj0vHBtRUuXwUIres6PMZsYvI9BevW5+KADDHDXyqpxAR5i0Wmpq+ba
         ZTzHe0YjZwQpk3ZatUxCUcU+nI2RKl4mK29AgkDPtrZZNQpYGMRjmow5pXQkAwuX2/gG
         llXoNO+jjUIQ/Saec0p3TaRYekEDHbH/RiumJEWmpCiz6NvMxu1IaibloTs3+i2GnoB+
         vBDACP84LNnU1IHO8Bps3cMKLeAHVo6ZnOa2FtfY0zocHVlwnoA7do5Xypa1K/deTOb1
         /P5w==
X-Forwarded-Encrypted: i=1; AJvYcCXAuEVhSIeDVlEX/si5zKYo/XEzo2bOB396i5JaewcssPiIHlNNXbzGyH4qdSQ/F71GAofBM9C+5ieE9leitT/c@lists.infradead.org
X-Gm-Message-State: AOJu0YxM5+KXaCeCQB2LICnsAdoPBBWXYGTWZkB40CcD6ym1l9vNStqW
	cyKs3SqcT8wF2XGbaBWvIhfeo6HvWKYnMVVHIrp+1aZu952cXIoDa2PHbAkHQZA62X4=
X-Gm-Gg: AY/fxX4ThTwjdUyt4FBshqPm7AgGG9LYDZ7FDngIa7dq/EldBi1dyNKdIm8tFOkyUoh
	zbjhEmsvPZ8Ejf+rrRHVHlox3WzzCrVasBjZN8Hv0Khy8Z+x5pdb2yn4jqdy6X+/4lx9WeGR+7O
	NagHw6haHf5pAbOpIKEwfQwXsCh3oOi+t6/TgfZMb5XKdoSLbVsw0bzbl9v+U2Z4VPoXtrHmu5t
	/3URQRTT/oewUOXz6KBs/jd40Z6SanaL0vCEA3JiOfMRhTzs765EdLNEBcbhVE7VO3jmOlF7gst
	93cMZnxx5J+7pQ5AZnKQfHtiBTV1ua+NPpTJkYexmbgH7/6x2vhxAdRHGdHMQcGR2A/193plt8D
	1KVCzpgidCFk7YSXGWYj6h3GpE/d4N3zaGG/nd2nYyTzRaoRdfyDFijUpOUSM1PD8wmijdOpKSP
	Pt+2CDM9pIHdwvx+dnKhfFTyY=
X-Google-Smtp-Source: AGHT+IFH0IHMLB/e9VMPw+PNQvxklsKe4TmQmjkQDY/3vRiOU9XAUjD+Bmvv1dPy8Ir0WmHAJUU9Lg==
X-Received: by 2002:a17:907:a08:b0:b07:87f1:fc42 with SMTP id a640c23a62f3a-b8444f488f0mr1766243166b.16.1768140295378;
        Sun, 11 Jan 2026 06:04:55 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f0d6d7c6sm455055266b.42.2026.01.11.06.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:04:54 -0800 (PST)
Message-ID: <3f82d755-552a-4074-bee4-b2660eb6a979@tuxon.dev>
Date: Sun, 11 Jan 2026 16:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] dt-bindings: usb: Add Microchip LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-2-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_060458_335231_5DA20659 
X-CRM114-Status: UNSURE (   6.02  )
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



On 12/29/25 20:37, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


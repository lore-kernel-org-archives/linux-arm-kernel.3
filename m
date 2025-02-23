Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ED0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2O2KTC9PdkNA/KkwPolaX2XkbT1j7iEFVoAGaCdmyM=; b=d4qrBGHYc+ohgDAiIHUcx7+gwi
	oODkdf8IMxtsjTAjm979hZLyokxYGXID4xl49MJWq83C7JtMzRxaOnp3vWFrZEp3IBDjB59npD+Kt
	4a33KIb22Ktcl55xmLw4aZNbd1cZfDwB03kOQFo6FKcxlu7qUtS61R5BhuP67vBKXRBT2FkgDaWcA
	G7pasWYIpujET7B8hdT2Y8ulB8FRh+i4kDn0ZR1San4rzb+fCefHIcwtW7ikNsLtbcSZGUKXCS9bV
	aq0XMOT9duP8Lv8rL1Rvvo/h7rC74kaqbX0LIJyHEcEbrXOxVd4FgbDKvNSCGXeXnXWTVG6dwJYEs
	mPk4fkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFkN-0000000BVAu-1M4k;
	Sun, 23 Feb 2025 17:26:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFiq-0000000BV1h-0z0U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 17:24:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220ca204d04so55871835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 09:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740331495; x=1740936295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2O2KTC9PdkNA/KkwPolaX2XkbT1j7iEFVoAGaCdmyM=;
        b=DiFGbjOwkXWU9bfOxzPrqttN39kNlFrUjKfQVuU2aPjHcEcr8XLO8W5kRAoKGeYO3y
         luYc1+kcsSeFxeS0IvZgYQOvGv+Ga606jcZox0AZdaLCzN/1m+dMMnkkMmxQor7SaobG
         nMqsQbWCy1MW+/Kip3UN+Iq4IfT0h6rt/jd9P1Emm9CzjSsk6bJca4kRFOHvYf1NbSAp
         mAiKeQu9bMlL8v3pjgVVnJ581I7aK2DJ5Z7Q/wHWqsITM0p5DRemBuAwfrvssXE2TqAD
         87+6S6gBfspR9QXsyPegF9qz0sgdD7iDbtVt72HpMsXXVQRg7oiup1bvOzJclZDWgqAa
         XE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740331495; x=1740936295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2O2KTC9PdkNA/KkwPolaX2XkbT1j7iEFVoAGaCdmyM=;
        b=td1dg6tElDT6uyudeTJjLNzp1g8rtT7jZe4RL7YGOKuWYGYDBdxF86Q7eUA/8FCmIB
         i9oCjnJ/c4it9Jb48u/uwzZ1xJuOKimfO8b6A1rs5NaHVoJKMfeMcdDPeFDysl0KzJmS
         iVY/i6vdrMXe18q8vG8eRekz4uSnIZ+XKj8R57Q8FFcm7Lr4d1s06e44grJw5q6ZdvD0
         +fTu7Stx+EUi7UnkvM/R2LxL4tsQs7QL/rW0fH+i385Z0DJF5ze2SVMjuGNTOOiG6TVj
         yzLOhyBTjTWIW2u+o/jv+iMOMKjT5NSMN+iNKr8Gqr7rzwGZmRT9xaJq1dd/eKe8NTzY
         aLtA==
X-Forwarded-Encrypted: i=1; AJvYcCVBjaMsutd2W07r5XLd+Pvcss8wVhYjY4PuJwIrSpFlSvjqN3PTVRW95/GKzgKqBByWFrPWWKok3PXpKfvIHMsu@lists.infradead.org
X-Gm-Message-State: AOJu0YyC2fMUM5ErGzkoIugSf1Vj7YKhueipqk9Pp7WdRj1LQTbICOpT
	7wnmcDQ0cAk2yAWtQDDHQOXql2+xZAtTP0DQf5wYVNX29fjgbd31
X-Gm-Gg: ASbGnctK39564K6V4vZKsOirm27lMfHn/QNu4srcCM5ks+eaDlSJFOYmIEeBKN+Ouha
	Yns9VoD7k/PhQ+jvEWBgF0CmtOczgwbqJPIGZZrdu2/9E7g4GHdviUD9GMoWfsSpQhYDyIvu21f
	j1aYY2bheu0dUqtCFeeQNhJ3ohOOseMHaUwPjCqzm4+NFgAT2++M8ahJowBYolwH6TbVgRlncut
	8fUTOBaZ6GCTljaKw4AQXsySKmOoqmC1HUzsEPYYJYz/qbJETP7h64f8L512/ZuizkquQU1xDq0
	kOXV5grvUb5L5swITDwN66Ku9RtepIhJt0Vb/mw33iA7jQj3n7j2Jr/X/GXnLoy4SM6LYxiQuIk
	Vvw==
X-Google-Smtp-Source: AGHT+IHXoNAmOo8/9xcT49igECoNdcpYHSblNJXXk1FCIeh9kqW3ppcoD17Je8BB/XcvGZAqYF5zeQ==
X-Received: by 2002:a17:902:da8c:b0:220:c813:dfda with SMTP id d9443c01a7336-2219ffa7636mr172101415ad.41.1740331495405;
        Sun, 23 Feb 2025 09:24:55 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:ba1:8069:4a70:1a15:7c01? ([2600:8802:b00:ba1:8069:4a70:1a15:7c01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d559089asm165603035ad.241.2025.02.23.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 09:24:54 -0800 (PST)
Message-ID: <bf20d5fd-bf82-47b6-9c1d-0b77f0e6c083@gmail.com>
Date: Sun, 23 Feb 2025 09:24:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: bcm2712: PL011 UARTs are actually r1p5
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>
References: <20250223125614.3592-1-wahrenst@gmx.net>
 <20250223125614.3592-3-wahrenst@gmx.net>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250223125614.3592-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_092456_277953_A7CD5E5A 
X-CRM114-Status: UNSURE (   8.12  )
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



On 23/02/2025 04:56, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> The ARM PL011 UART instances in BCM2712 are r1p5 spec, which means they
> have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
> Thanks to N Buchwitz for pointing this out.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Same comments as for patch #1.
-- 
Florian



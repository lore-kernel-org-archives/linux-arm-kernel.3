Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3A6C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JawF4TGF1j57LNBqwF7f46NzGiGmOvF3HoWhyY7xlVw=; b=FZic+83HPn043r1ErGskCZUynT
	hmYdW7qu4y83AO+9p/zBo+9gSJKIi82bQ99LPmyisn5MnOYIPlPy0OMEZsTNu1UZAwkYH/dl6z2Ov
	o5yHD838cVircTQecfndF0EE0ajyZcwoTUbbXIqC8fDeDG34srjtbtZqwAB6oNGBnskndb7wB0nOk
	bEcKGb3Ro34TPG3GON9vMcvLlsbyidHySfNlnBMhjVcDS3MZWWVWWGEwcngunZvomjrXgmoUpgFJ8
	m9OSYs003bEreYdNL0qP8x/DDflmRwqYvu/NQaNfKasOQi/kf12N3qGTHBdJW70ZA/2+GJsMV6X/b
	iAw9GsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmwl-0000000BEKU-2FsD;
	Thu, 10 Jul 2025 08:48:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlnC-0000000B1gB-1nzm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:34:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae223591067so104628366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752132845; x=1752737645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JawF4TGF1j57LNBqwF7f46NzGiGmOvF3HoWhyY7xlVw=;
        b=BLM7y7ykCsN876S0cyDm691C2x680UrHpsSAsAxOETZ3XuIv20Eoaf1RPhS1/DCqzT
         GhuDByjdfWxx4HMJFex2i0ZlWDXVbEqVdf0FoHYJxzhiPBiIRm02bM0KNJH24yAbtqKs
         91CTtZAPvzm5/SlGpz2e36LzLbDDZ6Zw3n/f9uqveYyL23/erSFKzLV08l8mYgRg3EuH
         vsYQiEYXS8dNPm322ykeDgBpvanipJdcrfNKViQQsMX37qQ59eKYuYrafjcLEv/Q+ysu
         kNvUTSMlahWHrMRftMaW+VubUtxYAMiY791x96Ep7FVBNkT3WcYMp3dEswqJYIlsbVN3
         dZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132845; x=1752737645;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JawF4TGF1j57LNBqwF7f46NzGiGmOvF3HoWhyY7xlVw=;
        b=BUecTuI9MHNZ07aOuXTK0R3k617y3//UdzZsWhHmlXIe6XLoLHeFcrpWgwaIzVxVep
         ycUURarZ1l27xUfS2xKPrLVf/oCMxRy8eY7e7MwQXRlZj1bSFuhP7nvKb/DV9Mnn6g8P
         g+FwKeBHRs5+CZPDD4mjj9fB7UPiegFOrkApt2YrbxzDa4J/oTXL101mxMgkFfhpUjZ3
         Ba0WMSmzK3ntc3vXUORAKhl9UxIL9m2hGKOHY4b62KVOz17qx1Krck97gJCQu674Y7g2
         7+mGYWEr7eYd/3Xj5E1NLo0FNcKbiAyAAprtaq4HPs9iXZ5vHxbKQw5erc1S6a8CZJbJ
         3PsA==
X-Forwarded-Encrypted: i=1; AJvYcCV9cJEYj4ODlbyi+OsigNcXcwQWgFJHlPAd+UXxo9GGFrTK5neMp2X1sRC+JstqhdejhtEKAhdso2zcy4+FhCAF@lists.infradead.org
X-Gm-Message-State: AOJu0YyXen18gc2J+/MramCJbUvCZXOrDmI8T5JjuZjnAm6lmB9zF/vY
	Zh/isIzHdHR9QVHCi3AVXP1JMfaHkzR5RANUGWJWOaVwXSt4sOIyj511e+jxV6LuOhE=
X-Gm-Gg: ASbGncvWt3RpEUl0lw9+SykbzGY8Tht3U7w/M9xSFMEoVGSeUSPtZSznpnN9w8UGZdV
	0Es4f8+NbLy564bhjMzY4i9q5DTV63cf5OIpXmlgFE2fHVQfYSMXqv+0CnYQ/4Gqsh/ud8y321U
	iPcURak0CpUhdcU7Ml796KdWJUuR6gIbMV/y1bmcSFAUs0mGuJABxSsVUdDab8X2saV4fIS/Ym3
	FzaF5rqOCUIfzvXhfC3bilbqbxpwMuxLdE3pYTpwWWFxtqbr0KSJApao+5zh9xBHyMSGiz+p23S
	xT9+SBOyBIXVhaO6Fz0q/+Wm+ZhptZLiN/WM+Zm0s9izLOLQ3nSUb2lW0/RUkqpAyz+Xyre57cu
	sFqnE
X-Google-Smtp-Source: AGHT+IGPe11W59uO1omcl8GyG58pyhcK7ZXWq168g/SLScHSinvdniJYkRnoIhmYDGQWOP0mBpiX6A==
X-Received: by 2002:a17:907:3e24:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-ae6e70f48ffmr163003566b.55.1752132844772;
        Thu, 10 Jul 2025 00:34:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dedd3sm81643566b.150.2025.07.10.00.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 00:34:04 -0700 (PDT)
Message-ID: <31ee6752-a898-4cef-b339-9991d9df1580@tuxon.dev>
Date: Thu, 10 Jul 2025 10:34:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add cache configuration for Microchip SAMA7D and
 SAMA7G MPUs
To: Mihai Sain <mihai.sain@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619070636.8844-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250619070636.8844-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003406_470962_7654E490 
X-CRM114-Status: UNSURE (   5.81  )
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



On 19.06.2025 10:06, Mihai Sain wrote:
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
>   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

Applied to at91-dt, thanks!


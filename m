Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C827C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbrmQ+GhkVEYubpdUNjaSBaIV7BvrLU3vULivoHV6Ks=; b=x0HRoorXd6g+8SS3V6gSBdOv9r
	lsDa6XS4WkW4IexIdEQgB+v+AI4GJYfMMUTvuWLpMx7j532aqxYcBVOKM+BvFnX1uKJVUWWKahHFQ
	k80QPJufKVKTxbHfoGQ1g5QaatlOH84mypKrl3qjDT57etr0jffaFoaqj50Yplf6o+s3MbM7qnSBM
	F7/DnQ3bA86RgaS77eh4/ZQPu+H4PEmQBL+4vD7FO1vyBJA0v1S1TYnhnzw4ADLzwTKgmy9H8qqGm
	rEGi9fKHy/pleo9ytXyZLxoE9v6PRc7mMuFxE55vQpLKjqtgdIzcVb4ZsWEnEZuGOU3oTaUIThwJV
	0wtX6DVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws07c-000000066vX-258T;
	Thu, 06 Aug 2026 15:35:04 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws07a-000000066ux-0Tf2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:35:03 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1661799a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786030501; x=1786635301; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbrmQ+GhkVEYubpdUNjaSBaIV7BvrLU3vULivoHV6Ks=;
        b=hcVkiDblqKZgIn1jf4w1FMj+k5T4Vk4CnEc77OKSwvM2RkBoOZ0Q1AHzsUj/Ofj1jv
         5uwttKDm3OcPV3An1Q3G4d4SW/MkTI/Da7iZWuk2wDuqT0CU74fx1A3tx/F1x0PlrWjo
         Vy96u3XHvdX3npDByktioJzdABeNN5Dej9d1DNEphPYzlTyAsSkbgMAz57U4riaKuJnD
         mCiD82g0s5ee5TRyJpyGOlhv/GhGLjWnKv/rarG0uvi56OUjhkV5e/tKadKkwLladfvC
         J3/lFprtUGuiNGBo6spahGyHGVOQVrMhJI7ze1aEZYgIv/kJmmZVtLaLPGTBsJGnECAh
         bIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030501; x=1786635301;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbrmQ+GhkVEYubpdUNjaSBaIV7BvrLU3vULivoHV6Ks=;
        b=swohSMD9hagDfcbrcsYK/wL/HZAURqQW7g0lMiIEioskKDOnCnlIkhe+y2qxJCkfOb
         zbKB4vXYw79Kz9EYBUzWauM4moA2qZvrdudqgui+irVu9mjy41NoFZrS6zniOqvHwlbn
         yTO7zcxYPYiph8QZkWkEdOxFYURkeskCmPDjlmi1QoMuHQZtjXDFVXnGJJdtyojW354y
         oJvCC9UugdQj+ugCw38S3un/6BJkJN9ChZ02t74NwKjQjppXJuY2MAmBW0Jf6d9mGEal
         Zb0aYxnfSFlnzds+6msXD3HALvbWETT7Oe/n1ufky3u7MW7dJP6wf9PoUIOfpMkq7LzW
         30LA==
X-Forwarded-Encrypted: i=1; AHgh+RqGp93p3/qlIv6sTZzlQEKIuCNfi5MCumOqFeNwptQeBgx7lj4WTeMiFXXMQDj7/28GlssBgyZOXJmiLk3tfZyk@lists.infradead.org
X-Gm-Message-State: AOJu0YwjbFAdYElR7u5B9WiW5xPMvhp+D8l8Q7n7Xtw6t5NNf/y3kIgQ
	caV64UIPoELflf+Ewds8plcPwp0Y/UPVIVHzYE+QJKgwnid8KGe/dcpN
X-Gm-Gg: AR+sD13i7gWAKfzKlj4JJQQfwtm6a5WlQomsR5U5u4EbjoLx4N1rbyQ4wo9pN0qracK
	IPYsTpWBvj74KOzvLg/5yfF6Y6vHVNBVlqUZIB/B/UkSqoRZgVW3wibcoEAHHqmWnbNtzGhPc3t
	OU3IVmqc1yeCS0UhAmjray03UyP5rqWEAJ+nblJjMsPMWH20a0+InDHNcRZNvy0p87zhQNCDbz6
	iihHcvqUIDZ+KTHm2BwUBKYkgOw9wXyv5JLzykKKsKBsbMOAWrQ+x+/z1usFt9rGHGvOwq24S2v
	HhmeENTWOtTU0JsqdLL3ovNqmt81MIYyFxxBhlTQTiUpfy2VbEP4/1JcBnLYEY7LRb5OE/cqZuZ
	w2eljVw1Ft5WcDdSpu6aUvfUxEK8wa0EO/wXa5sNyPiEm7OxbL0gpJ6CFgFS1Y5JgUHUKpjULuO
	xOiQcJ584sRm/I1VMfMMOlP4lI9SlBjDD+6UR47kIe8MwqRv5A2J5Uj5iqHY1pP6rGm2iwtPyco
	kwxw5gtw1Il3sNMpJmu4LuoRzKUjhmERYSR7g==
X-Received: by 2002:a05:6a21:9992:b0:3bf:b68f:4685 with SMTP id adf61e73a8af0-3cb85f43e7cmr17944621637.23.1786030500875;
        Thu, 06 Aug 2026 08:35:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm42980668eec.21.2026.08.06.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:35:00 -0700 (PDT)
Message-ID: <d027eec5-ca83-4aba-a3c1-4724c77df0dc@roeck-us.net>
Date: Thu, 6 Aug 2026 08:34:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
 <anRaB--HAHoWFkDo@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anRaB--HAHoWFkDo@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_083502_157228_144177E3 
X-CRM114-Status: UNSURE (   9.29  )
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

On 8/6/26 03:04, Uwe Kleine-König wrote:

> If there is a hwmon lock that serializes calls to hwmon_ops::read and
> hwmon_ops::write, .pwm_lock isn't needed. (Unless I miss something,
> please double check. Also I'm unsure if there is such a hwmon
> serialization.)
> 

In hwmon_attr_show(), hwmon_attr_show_string(), and hwmon_attr_store():

	guard(mutex)(&hwdev->lock);

Guenter



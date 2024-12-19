Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWeWvkXzvLu3Igmu9GnqFUCreGXAUYNQ3shShzUdti0=; b=XYJxAJxAqkIQIdTahSojcTv6XF
	s+FeNZEl7eT9cNq7/u2rouX+n67R4XIW0Be58zbwBaKiCD/bZ97QFdH+li5iVNMwTzmTzZy+BGPxI
	znYYXeGV6ZugQuXvqan7jtEcFSFTzaZ+RHk9+YOsxk1CT7ZqtQK4Ga6+w9MrGgC6npYZGcZs9yxh3
	aPtmD67C67pBvGACpx4MqVnekFLjyzB+WjykSzi8Rw8KC8DziTemZVEKz07+RM5oPaGqFk+FMSY3U
	2glCh7J5VDdLvjb+Q6RrPL56GTrqX7hlCWRacfkM0yVJA0Lp9G6sUjSisJvpDEjBnxyEECdr8LkDC
	TGDL6WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCVo-00000001MG4-2n2t;
	Thu, 19 Dec 2024 09:08:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCUh-00000001M0p-0FNa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:06:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43624b2d453so5445155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 01:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734599213; x=1735204013; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWeWvkXzvLu3Igmu9GnqFUCreGXAUYNQ3shShzUdti0=;
        b=X0FJODvsPuOdh52VNr8co5XavMJ0U5d6XhrCZiaxWH0zEqRa2vUmD/RrBC2fythYBT
         XwBe59xAbcF0KnWTx+74p0LFf54yGM8IqDfv92TYvnyCipvpKqwgWMaAhCZF44VMjtQO
         xON6rpgZ9M6pGi5yPRrNa85Zp853AfT3v31wL2ZY5fN4U1piFdgLdnfyQXtgTG/eHO0g
         9gbqkknGEf1QuVJzdk9pKHCFJQ8wDgm+I4G6f5qGSsonTu6/lS0U5bzoCrEk44aOqb9c
         2wwBXx9KMBG9twQ7QNA0+YzGsMTOtZF71bju6TtmTsLvPY4VsAX01HbUFJKJwFasmwIF
         SVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599213; x=1735204013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWeWvkXzvLu3Igmu9GnqFUCreGXAUYNQ3shShzUdti0=;
        b=UlCXmm2goq2hB7YmHELDrbMepNqLJWgsP6E6aH6YHaofrX4NCy7frkCNBNQ3xQu6PQ
         Z82d79mhK4UnEPwzb3ZXzD/b1vM/psnjUCdi6U70DkFLOgDVxMfcu04BypR379Hqo9op
         qdw6dEM6r1+kpgkJXYz0lcsSk/qAg9fGbzgJVqF1GOuGB8FQCIBmhH+x6dvGBydck/Yv
         79kuZE6UQeZieUAXUxgAem3dyK+keGcoDVP53UvNpasw6cSIHXNp/0YhxaAJYbzT96UR
         nQL778Py8cZWxndHEKvlUd9DwnJKxmdpFyvn4PE6n5XvbJKHxIvcbS73iy+6hoPFk8Zy
         aRXA==
X-Forwarded-Encrypted: i=1; AJvYcCWjknzhYpUqNdKi0HfS4HFm9VWWwk6lDySgth9gE+Y5zlLhorEXLTZC8DvqzI2GBGi5p8fmX9lOnL4tpd4YdYOR@lists.infradead.org
X-Gm-Message-State: AOJu0YxpNze2x74ZMKMXOrVbMkCOd/amuFcjS0BpR8M4+Siar0pD1TPk
	UgwvHqe806I6lBXm/3d4loPJLaKdTGz5GBVByadF++zXYsIN+q5H/wqO/ri36g9WJ4qtSZERqJg
	t
X-Gm-Gg: ASbGncu2tAc8qXhEH1iYts+IIVMsiGRGjNtcIAXejBFjpW9lYpGKV0YIXcioPb0hkUb
	wpnlyWYf/E9R60tYavkxwEr1g1Q16hLhZjNjrgy+91iDEn7yXLHLVHrAsY7ZH5GPfcnOrFInxNm
	BqTVKwKPO6mmD7eKF9wHCHvzjf9iey5XZJFBBazJLo7InARY1dQ7/Hnq7SkEcP0tLU/WQVg/Bx+
	Y+NLx3wuEtoA8TBfsIF2U1KgyYuEVMLv/AONbgtZi1Y961VudBiBIuoonxUvOH3/Q==
X-Google-Smtp-Source: AGHT+IEnaGro126gC0WrQbj/7yxYqfDWITdMViGNaOBvGvwU7MwJfIU4k1E25zyXtYEsrK/u6ddQ/A==
X-Received: by 2002:a05:600c:46c9:b0:432:d735:cc71 with SMTP id 5b1f17b1804b1-4365c7c8eb7mr17227275e9.25.1734599212864;
        Thu, 19 Dec 2024 01:06:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm46008175e9.8.2024.12.19.01.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 01:06:52 -0800 (PST)
Message-ID: <347a8bb9-5a0c-405b-aa9b-01994aff8b53@tuxon.dev>
Date: Thu, 19 Dec 2024 11:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add address/size properties to spi-controller nodes
To: Mihai Sain <mihai.sain@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241218080333.2225-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241218080333.2225-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_010655_260051_196B4AF3 
X-CRM114-Status: UNSURE (   5.32  )
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



On 18.12.2024 10:03, Mihai Sain wrote:
> Mihai Sain (2):
>   ARM: dts: microchip: sam9x60: Add address/size to spi-controller nodes
>   ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes

Applied to at91-dt, thank you!


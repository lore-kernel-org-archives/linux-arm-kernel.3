Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F66D5CC9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQaUzwaxnnqV45/x8tEAI39WnNj925wRWeOEbSeY/uI=; b=fZZdICEeY/xDXS
	oYK4zx8Z74d7tfzDeTEoHHlk9xGv5PGhJliUhUZnHi8HmZ99apVHOMwFEjASsdeEi/9UNskSGBGGr
	XgzVCMgwMNmRA8U69RxFIcQkOmYXyJR6bmTmKjfdoQ4o1ydKTiFZAR+/Pip7DJkTe2gdyl6XP0JQ/
	1chw2aqkBwZhkcpMXzhRCzPLNJlsDlvkX3y3u+Ium52F+IB+UTzLnp1Tgjcy3xWTKJHviON9nWck7
	eOabwiYQv6YBQBTJ0vEr7w4LfIkA0MTFy4t2QsQJMJv8fXzAVBF763Q7ZJDsgbYcovr+F7JWNeIlU
	hUUHcCJUNh/IvBWPtorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66zz-00000000ANM-19rW;
	Wed, 30 Oct 2024 11:36:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Zt-000000005Jg-2yhN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:09:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539f84907caso7100583e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730286568; x=1730891368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQaUzwaxnnqV45/x8tEAI39WnNj925wRWeOEbSeY/uI=;
        b=tPNeR69ePbBQI/A+i7q6WLcJs0I5RNhu4Yt6G5M1aDxI4T2zq/CbsUYWJo6/FStUUR
         hC7ioT3DWwnUOcseRXyCuIn3v15eOoU7DVUEpPgsizy03VpY9qRFKSEAZJgC3hLZj2SI
         0H/MYwo7JZMldfsJuPIaW3L6PjYSjKPUSdlBBEDKU2DDFd7c6ipR6N7A/Hyco3szNx1n
         no0UbSQNXO4GO1enEc2Mt5KkQ/CFebOsKWwKjByjtM64OGRqBop/zVQVjT2eM+kmDvC+
         xiUc3BKjBrYQR3CAKobrsI5Xvz5gcvBmh/iIRLtqWkpbfP6r1kirgs4APOSQ5vjfdGYH
         NZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286568; x=1730891368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQaUzwaxnnqV45/x8tEAI39WnNj925wRWeOEbSeY/uI=;
        b=T+4Ul0fW0VU6yUYr0rmwjG9wkft1qc8VRlIMqb1vBwMa5Q2qpZcFTOBCn4Cd/2vnjn
         NMRAzC0Qqoj3A4wxGchZfYWxFezbklRU7kirLip+AOoVRMZPqAsF3v6TxaHtR06cQvMZ
         L/oiThWopxymbZC2RjUuSJ15DfCfcv/oPyWmduVEuCnH/y7+qY6zWqJeZXmdbzQtrnBH
         JUBuTCWijRPhEmCnFQG6BBKAQmtCfbztQmzP0kADWg6WkyJCGuypyQJLBq7+Gm0sGhWL
         tJrLzzoj2Mu9yoDX+ux+jFlReRdzfj4BfhfpqsX2EcvlIwbUkzg6Eza8IAGnobGhFG8t
         abhg==
X-Forwarded-Encrypted: i=1; AJvYcCVqOzwjFnLicvbEmmYGlOUF23pT9oNvYlj+e0B+5HlFypsruEVNDc2sLQLLix/aWnCvlagCkFxu+atbjvwtiEMo@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXD/vtyL9RIRpaou4zKihKmzh4oUYHeWn9T+OIByOQhvW/05F
	Ts3m/GrZdWLfV5tNXTM3hzYkIPXLhlETsUq3E0OeEeSWb9xqH9bedGUuOcHJUo4=
X-Google-Smtp-Source: AGHT+IFQvNMe1Knd6pNleviaqJovBHa2NbBVLssU/HpGHKZatxe8p94FQpXjkdGNR+UdreZfcJSkiQ==
X-Received: by 2002:a05:6512:6801:b0:53c:7652:6c9e with SMTP id 2adb3069b0e04-53c76526f55mr415631e87.53.1730286567743;
        Wed, 30 Oct 2024 04:09:27 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm18186125e9.41.2024.10.30.04.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:09:27 -0700 (PDT)
Message-ID: <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
Date: Wed, 30 Oct 2024 11:09:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241030084445.2438750-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040929_779512_77D5DB3A 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 10/30/24 8:44 AM, Csókás, Bence wrote:
> Refactor the code to introduce an ops struct, to prepare for merging
> support for later SoCs, such as SAMA7G5. This code was based on the
> vendor's kernel (linux4microchip). Cc'ing original contributors.

I think it's fine to split sama7g5 addition in smaller steps. But please
add the sama7g5 support in the same patch set, otherwise this patch
doesn't make sense on its own.

Also, if you think you significantly changed the code of authors, I
think it's fine to overwrite the authorship. Otherwise, try to keep the
authorship and specify your contributions above your S-o-b tag.

Cheers,
ta


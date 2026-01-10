Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B69CD277C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qncqnLubMYC4ApM8lJi4wrVgA/Yt4u3+/s/LwC2vUkg=; b=mARdhuvpHwpiu7FHUWuJV7sp7g
	FFDctlM2iUDSurrE0LsDUB5q1O3zz11ClpT40zQ8TGkFlKT3K6Hg3EudCb3yIM4woElyniUzxp4ih
	U7oEZ8XulepTKTUWDNPK4KqV1O1mw2YYYA6e+jNjnPac3hYXHKdabRnZEQOLvWE4vGDuE7tiMPhQy
	hoThzE6ed5JRiKDVYUTrp33Ki9L/3K5GN0yMQ2AAwJRn55eG38z8Z4iLRTkGuHXli0+d0ZXcDCkqg
	v8mrxq+LkyiemnWc+c7bUTDukok3o9kwzxF6rIXQ5UBpTOOgRjHp2HnvrSj/4wS1o5btExSEQHtpz
	9nOUfllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebes-00000003XvQ-2t29;
	Sat, 10 Jan 2026 16:17:46 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebeq-00000003Xv3-14EL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 16:17:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so6388665a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768061862; x=1768666662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qncqnLubMYC4ApM8lJi4wrVgA/Yt4u3+/s/LwC2vUkg=;
        b=j4SxMyg+Dt0+iR3cT7JWqXzWRVq+PwiY7lQ9+twj3c+yAVEC2/c04R8v2Kdtse4VDZ
         ds4ScF7q7SJoTQuKdTE9CKe0hNnf8AcdnsaatgjRjkZIzm8zit+FUqQgPa+SXm4bJvbg
         Wq40n7rS9b2dr2tcAywA1x/+f6+hn4R8mxCm8hiBJYiDlclAztydzc+W9SC/8sPCwzIi
         00QzhUMPQyuW6O4jrnle+G/KtvjNGk3BVYdd309/d38sCuNMHPJRSP7lFSH88ZT+mxVV
         KsQY7Pn8jxFSIESWwk/4wfwH06/9FEc/Px3PDijFtilZqLrXW3VTybd3kjr600CWSvlU
         yROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768061862; x=1768666662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qncqnLubMYC4ApM8lJi4wrVgA/Yt4u3+/s/LwC2vUkg=;
        b=BAWaaRx14LBUf+3kXeGY3++py2lgGSBSP1+6h+87B6iH/WPJ8tizPLCvJiQvqTZ4uf
         pu2suwKMATTyBYva1+32xI08aCxt79YzCkdSQHY4HQm6wjK5wJXiVqcRCo0x0Dd48TIC
         sBlOPNgQ20vZ+tOuuONvetey+MFW0jzT1Rv78YoZLMg2XZ7v0kkSIIS2PI14GpHc2LaY
         rnHOU7osxaiqa384uyC2RnB3tR9Mqa0kKuygwydVYJ4ar/iwjEtBtnlfTLULHH2cjcc1
         euAu/1pozsH3ItFGbkitJd1j47i2/DJV8HMGmITdYTyWCEc9DTpmPOBEdJ+XJnkrZtsZ
         DxCA==
X-Forwarded-Encrypted: i=1; AJvYcCWzVV67Ux0xlAl/chdfxnoajxdIGaBbi7qbXttN/2utKALlOB9SAoFcy2/pB6q4KTyNhSIsHBr/PwXS3gvE/lNZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxEVdIFgIMbIsWd0taX5KBG67+HxmCFI252MNkoaQhzpOl57HGP
	S3L2MI4YTcvMfG4siEYsrNxo4Kj/ONePKTsgncXFvZuK1CyUendI5npgpDhpJKWixo4=
X-Gm-Gg: AY/fxX4DDEemh4J1yipU/82nv/yONR72KKxXXU5c6kCLb9YRmCKmyz8D1CNYdSllTsn
	wNpGIr495XaBxjcmmAXHPOaHz0vCqA9fVl3mi2IWCKJMoU7OPm6fPUmEMAxNXJtYMT8IMyHHIVA
	T0wzieru98QfwLvuhYH6k0Si82p29WS2CGbX38Xp4ijlS9vh7jDMljbaUjvRVfjpF3X3JBOD2Mn
	lA7RmdethZ6uuM/KK6dxuD1s8JaR0JBFGnR2Tc54Kaqp+JF9+CvjHldMaxNEFf0H4V+O2CkdN87
	nhIWX2wTwamh8wPAg6Hi1LUhMLSGjZeosFT8siMDF/4czIhEfk1D5ctujLHIpW8PSn4304/1oq2
	TpnkaelVHqFB13k+S8IO2lIOOrvWUGpJ4EW+aYWzaPxYE5Gz4wC3278eXc1bHg91zxopyB+Cr56
	WolzKovOU9o4lSnlFvoQ==
X-Google-Smtp-Source: AGHT+IEt1vR7d0Du0VgJnxJCpzSziFh+TSZwsM8O+w7rOv3sQtzjQL9vGDgyVHyYf8b4VXURK530tw==
X-Received: by 2002:a17:907:3d11:b0:b80:3fb7:8e68 with SMTP id a640c23a62f3a-b84299be630mr1773773866b.21.1768061862067;
        Sat, 10 Jan 2026 08:17:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f0d6d7c6sm213670766b.42.2026.01.10.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 08:17:41 -0800 (PST)
Message-ID: <b288af38-f0b2-42ee-a950-c8f9739fdfdd@tuxon.dev>
Date: Sat, 10 Jan 2026 18:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2] Use kmalloc_array() instead of kmalloc()
To: Sidharth Seela <sidharthseela@gmail.com>, alexandre.belloni@bootlin.com,
 nicolas.ferre@microchip.com, sboyd@kernel.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251123070905.93652-2-sidharthseela@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251123070905.93652-2-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_081744_307033_83404FF4 
X-CRM114-Status: UNSURE (   7.30  )
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

Please use "clk: at91: Use kmalloc_array() instead of kmalloc()" in 
patch title.

On 11/23/25 09:09, Sidharth Seela wrote:
> Refactor to new API, for cases with dynamic size calculations
> inside kmalloc(). Such calculations were found using grep in the
> sources. The patch compiles properly with multi_v7_defconfig
> and multi_v5_defconfig and generates object files for the following
> driver files.

Patch description should answer to "what?" are you doing and "why?" are 
you doing it. Please specify also why are you doing this change.

The rest looks good to me.

I tested it and saw no issues.

Thank you,
Claudiu


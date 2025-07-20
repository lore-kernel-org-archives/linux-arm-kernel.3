Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF9C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zwjkw9KFxFD4C47j/XMBwDbWOsjV7wxr/S1vVbiJ7vI=; b=X74JCVTQpqIixD6H94PciPAWyS
	qECZPpChWQmccaHdaYqEcSo2nNXUKjSmc40aGBpRNiLCdH6EPcCONm7JUUFclWzCtndxij4KyCHMG
	os2pjoIws5Ae7JU9tSzk/fojh/yZomgxRicSqWCZ0+aGBbqporowYo7FV/qJlfXIRq37IocaCPpOb
	Z2BVrbYOBEyOyINVU6KBW4k5ULxh/VrmluzRweDIr/33yIEjWnwXyugWK89Ee7hC/LmVJC+7MpohR
	ohIAaDbBXQX8T65pZuBJGNqLcfJZZqICBaDFxWCFepO7V1Vda3wjYfQVtM02vswEFGandduVGBiSw
	WKOu/3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQei-0000000F6Yn-34vH;
	Sun, 20 Jul 2025 09:48:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQcH-0000000F6T8-1KZL;
	Sun, 20 Jul 2025 09:45:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a522224582so1675324f8f.3;
        Sun, 20 Jul 2025 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753004755; x=1753609555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zwjkw9KFxFD4C47j/XMBwDbWOsjV7wxr/S1vVbiJ7vI=;
        b=gdMzZPo1vbVtEohtWgZEGTcCYbsp37MguAJ8gCBdWf9l0a4q/T1LRaJ1ShUOKOYHBW
         MMj9Fiyznpd37JG00T2wTosIq9bWWOE+H/mznF5HJzb0APR54oaB6uRX7HOuqfljYfjN
         B5KkUXuZRBDBM6XqBQnsOLfI4BnqC9fiiw5egm5Bs7Pd5BhshbmLMQil4AXOVCLHGNDG
         FLH1SzxcUIdIDlmSzqN65E+1ys5nQy8mzTJijX3ILKfvinQvhC25kecVy6y7+B4ZgOyk
         FpDJPPJC3XBdVUCrnBshUEJRwnlhUJLW1FByXCEzAjouUxlgAgHheDkjtaJB2+VlKzeh
         DZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753004755; x=1753609555;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zwjkw9KFxFD4C47j/XMBwDbWOsjV7wxr/S1vVbiJ7vI=;
        b=BEpRutsMiV20pPAXWS78as6Njtaa8441P+0qIFm3e46uQdnpnRywNSCAj0W37og/Gt
         CDBylWxevdlkfy3gjccYcZpk+nzFSB+/+H6Ksk4vy1G109DsWBQY6JQKjLINwVudYGLu
         q6m5JaVzlZ8Q4ar63eFaogMrz9PnqGXCYncviEVZ26DRnGMRUGlKbRkAz7JVg3c4R6fs
         Bm/vZ5FJWa2lcZ8g6p4/nzRlR5frveKeuuNXYbtGO7tQu3PDt89bxrRmRbf11N7QNg93
         mo6Kbwn24Xj7ZSs/MvuTI5lzlrmIYtMPvjKwJeawmQ/m7y8Xyatq5zqJXL2IVXcXu/E/
         ZhGw==
X-Forwarded-Encrypted: i=1; AJvYcCUmvRGRxSmNhYqHT+SObP/Eqsq3eTwGrpWsyz5e5zoNVNBaulSEpI5hYPgqnxNJJ3cK+tfR7s5htYrqmP66Z7nY@lists.infradead.org, AJvYcCWMhxuUS6xHvT9AqPWYb6xrxdlXKvLHo81AUlQt1v5aUFltYXJ1af/v+vWCiBUbTTdwyOw/p3QrXhEqU5PsIQc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu2/YIU5HhWtO5oYyBQGS3/4UCj1jfbmNbVuJxU7SKpmm/5Aa8
	B4fwB3S4q+KE3Hr/zUNYSn065KRqzn3Pp2bKH8rCueKogGlENfRxGcI=
X-Gm-Gg: ASbGncvMwQ6GFhZg3RqfjwoTPzf1FiZCctm0J3G3QiISrpY9ScLWRtFoqth+3nODL+a
	nPowwXKD7GTV1NjQSGOwgPzugnA/zxSi4ILCgrOGRfnL6D9k6lnryNcZVkFKF7ie9ZWaIW2hW7G
	wDRzujjRd2JS3/1yrau1Fa8k4Fv0N2BcOg3Ad7Qx3MWWx+uclV0XE+zXBPG2QDuly8hKeD1pLG+
	HhrV4/clBDEzQsVhzcodGDS9ZuRVDd2ICHFiKYbd+gITzqFtC46K+IxqFR029NN1jM1dJzyillD
	vwBle7VCRAhNz+LlNxGDt1twk19il/F6Sa2JvbF/ZBim7hQVqOkxOSSyTvtQVzwzi6aO7fnuG9j
	XljQRSFk+gcSpKdOX2m12WcQ4PreZVljDnwyw/PdG1eX30Mgj7uj8297OLxvGfJOuFpmf
X-Google-Smtp-Source: AGHT+IGq7fcfZpYeNzACrrAxWMs1ClbmBrmlPl+zvYuNlRQCCRF3nxdfAa5q1h5I6jmuSNUlkpRoBg==
X-Received: by 2002:a05:6000:4305:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3b60dd95c4dmr14388787f8f.27.1753004754967;
        Sun, 20 Jul 2025 02:45:54 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:8b91:8a7e:bd07:2736? ([2a02:810b:f13:8500:8b91:8a7e:bd07:2736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b81asm7107712f8f.20.2025.07.20.02.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 02:45:54 -0700 (PDT)
Message-ID: <86814bf6-5d1b-47f3-ad1d-962cae4a543f@gmail.com>
Date: Sun, 20 Jul 2025 11:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
From: Alex Bee <knaerzche@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <104a501d-b9b2-494e-b073-932ddadd7129@gmail.com>
 <20250719143008.54288-1-amadeus@jmu.edu.cn>
 <24ef5e60-dcea-4102-b87f-8a5572c7497f@gmail.com>
Content-Language: en-US
In-Reply-To: <24ef5e60-dcea-4102-b87f-8a5572c7497f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_024557_381638_83881519 
X-CRM114-Status: GOOD (  11.94  )
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


>
>> Hi,
>>
>>> The issue I was seeing is that there actually *is* a variant called
>>> 'RK3528' which at least according to the latest datasheets slightly 
>>> differs
>>> from 'RK3528A'. We are doing development based on 'RK3528A' and 
>>> calling it
>>> 'rockchip,rk3528' which might make it hard to add the non-A-variant in
>>> future (unless we call it 'rockchip,the-actual-rk3528').
>> I think this can be ignored, because rockchip only provides RK3528A 
>> chip.
>> RK3528A should be a revised version of RK3528, which solves some bugs,
>> so we have never seen the silk screen printed with RK3528.
> Thanks for sharing that inside.
> I wonder why there's an v1.4 of "Rockchip RK3528 Datasheet" dated
> 2024-05-12 which differs from v1.4 "Rockchip RK3528A Datasheet" dated
> 2025-05-12. Anyway: If everybody is happy as-is I guess it's fine.
>
Just for the record: There actually is a non-A version of the
RK3528, which I actually own (but forgot about - perhaps my subconscious
made me reply to this thread). It's on the Mango Pi MK28 board [0][1][2] -
which, to my knowledge, is one of the first RK3528-based SBCs.

[0] https://mangopi.org/m28k
[1] https://x.com/mangopi_sbc/status/1729384633979322512
[2] 
https://pbs.twimg.com/ext_tw_video_thumb/1729382603202170880/pu/img/k-mVxtpl3ey4V3sX.jpg:large

>> Thanks,
>> Chukun
>>
>> -- 
>> 2.25.1
>>


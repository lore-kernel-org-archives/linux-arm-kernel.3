Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70174C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34Fl013avGLIxojThvGclQvDHH9D0XOpk1JKH4QnB8s=; b=hHgPXvEfBaR7QAydu54V1cM0LN
	eL4Jtijd8U4Q+ILYWSOtVKL5r6/PLuobgvAN9ASlqrNNznBKYsLNjYZxNtk0k8Z1GQS5FCaaG7k6C
	nWg9wEeSfHK5bh31yUASGxncggYQwZctx5y/dkxBulD+Og9uvJyfQmDtj6DtDnyB6tn8WWmxMB6ug
	bl+aFQfhBA2KSaPIW1DnGMqYmRDQB8pskAXt8F7+98Dd3bMUM3BzYGTiaWqW5Cisl0tBQQmrJgOS9
	U0GjjrYqYPLs1GzMAW+y5XTshEXJFSekxFXMt9GIkvYzvxVHvnMs6RJG3scgYc4bXVh0/n/mzuI4u
	jQx8t4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA8k-0000000EQBn-2fGM;
	Sat, 19 Jul 2025 16:10:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA6G-0000000EQ46-35e3;
	Sat, 19 Jul 2025 16:07:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4555f89b236so28705115e9.1;
        Sat, 19 Jul 2025 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752941267; x=1753546067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34Fl013avGLIxojThvGclQvDHH9D0XOpk1JKH4QnB8s=;
        b=PPJiiqQNZlYk9ug+DU4JcdCS87TrtVCQ1HJTDP1C6JghnnNlZgYqETdLETQx+EYv9s
         bL455jW2O9GNHSzA4eUrwFmOJbenAUHfvM996N9Z3FCVZtdbKba10Ij++STLPgS0xiYR
         pFddvD/kUxMI1CyNgme8WOiQIUYpMoJTmOblSCE97T4+Ia6V/VWsBXQ7TR/9jzx28Abk
         yG0yCMs1iHHGAKiJa2R1SdTm42Pn3h3LgiLg0H0QPsWxuRMVxsGAMCGndn1Zhgs88fVe
         Vbjcltk+3/Gey079xvq711kYz0rO6UdJK+P6NEjf3IfxltyYRWv5DbgTk3lwAlZstmnl
         zoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752941267; x=1753546067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34Fl013avGLIxojThvGclQvDHH9D0XOpk1JKH4QnB8s=;
        b=p27pN7rDXWS5AleLWcy7WY1JMFawmiGKRTKzlzDOE+2BjGMw0bcUoASRgDFMirm1J0
         386E3yY4EFCqZCzqbTKUIwXjz5L+hRgPG56nA548bEOQQ+T67meC7rhQvxjIf4mWP20M
         rR3cR25YW0kV1skXb4HfN12wczdxtad84C0mrfan5xzbhiYJX29Zytqm5kmtZwFyi2aw
         HwqtrIqFohx1K8fuLoMIPW5EGqBQSyz+7Ig++CtxCP3VFH2TzocwAp1M+tEpwcI12/xS
         s5ra2HgoHK1FQnBmWqOYiCZXD5sUwFXoSSczugLA6gXNA7T04foOG9E3qpddRrGm8EMh
         jwbw==
X-Forwarded-Encrypted: i=1; AJvYcCVifQxH7soQImQYx5DC9RfnEpC5DJcbT1INGIY4o9zmFVXst260IlqpTmAysbdSKV9hZRMPjHDuWkNyaKB6R+79@lists.infradead.org, AJvYcCWCcGpx3CHVaMwVy7vNN8Zx62M8iynzX+bFPkD/DsxAb1mRLq3yp/kmvGETWj1ytGaaC7VWXDOiNhHM2ld4Vn0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhJJagxpiDpCBpUpyS656rB/eE7rAfb56eOiPSTVcCHPen5Wb4
	8WeYwD1UUYzQTBFRiSC09GQTA8Vi8k/Me10ldmpxBkpULuJSze0eKFA=
X-Gm-Gg: ASbGncu0q2AixoLpZOGnP7X/Xe9uoRjfXhR60qBnod3+fttrUmwPcX/YKk8Z8+qHsl0
	iWkud0IHb6TVxtNeSmT5dI3ekYEBJHkFZBJY5FzvSYtix+Uw/DClsqOft21Rz+wz8V5UNcrubhh
	gSjq/vy1nU0OAjaQ2J+C0mT/1tVRUFs+CqTgYTZGY0GCT7TK+isW2eGSum6M+FqaRe7ipCaMdX4
	VkjBYT0fzYKd1zHa9DdOXHf4N0R0zygpZ3uPGSA6lb0+jW6MpOSYrqbpBh1zuNWVgmbCZZ3COza
	3XD0BhocL/udv7R26VJPFffhFKuC6FMpVAe8b4jLtfRV8gkkz0jbuE6XNMRUfn8yUcY8OPBlkVc
	WET67RtzmhDl09iG43Lc7t70VS2GNfImMSkGJ9VJNci4Zh8qFgw8qun9HJv4vV+4YFZx6px6XyY
	Wt
X-Google-Smtp-Source: AGHT+IES9oPDKMYKkdduvhO3yIdGJjlII97bZjjl594Nemv+AquGEt84ATf4PGSkJI2nAQVKAHXu9g==
X-Received: by 2002:a05:600c:1c88:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-4562e3b9144mr146586165e9.30.1752941266695;
        Sat, 19 Jul 2025 09:07:46 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:9864:6cd6:911:3e03? ([2a02:810b:f13:8500:9864:6cd6:911:3e03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f4289sm110158655e9.7.2025.07.19.09.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 09:07:46 -0700 (PDT)
Message-ID: <24ef5e60-dcea-4102-b87f-8a5572c7497f@gmail.com>
Date: Sat, 19 Jul 2025 18:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <104a501d-b9b2-494e-b073-932ddadd7129@gmail.com>
 <20250719143008.54288-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250719143008.54288-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_090748_780647_904C3734 
X-CRM114-Status: GOOD (  12.66  )
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


> Hi,
>
>> The issue I was seeing is that there actually *is* a variant called
>> 'RK3528' which at least according to the latest datasheets slightly differs
>> from 'RK3528A'. We are doing development based on 'RK3528A' and calling it
>> 'rockchip,rk3528' which might make it hard to add the non-A-variant in
>> future (unless we call it 'rockchip,the-actual-rk3528').
> I think this can be ignored, because rockchip only provides RK3528A chip.
> RK3528A should be a revised version of RK3528, which solves some bugs,
> so we have never seen the silk screen printed with RK3528.
Thanks for sharing that inside.
I wonder why there's an v1.4 of "Rockchip RK3528 Datasheet" dated
2024-05-12 which differs from v1.4 "Rockchip RK3528A Datasheet" dated
2025-05-12. Anyway: If everybody is happy as-is I guess it's fine.

> Thanks,
> Chukun
>
> --
> 2.25.1
>


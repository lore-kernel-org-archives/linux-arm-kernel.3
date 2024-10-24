Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA7CCFA456
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWFrbyngtx/okFnAnXziGIwpshdD52HD2rAoJDGqVCM=; b=l9dxabOTWuGtWxLbw3ov7Qt3Ji
	1WmDk+CYr3DsenapxMv95IZeot9zjSKIfrLYqhmGK3P8oEPiOedZhppcuYo2wVC19i5XCPKZwqlAh
	G7slM/bMCaFZ9INt/qVUF0R/Ohv3aRGTEzyarngt5n73YqUok8+UPoumWO0IMUafQeNJz8IeTRi+Z
	N8pzhsYvVadVz+Stfec2tnltByFTBSxSEGbAvew9ft9D3joHoidI8izggCbI7NLbAtOQ+cWH5IDtc
	EQenlp27BQhEbu67dWZj8CGzSTpxElRQ6P6ZgTrdyUX5cVaKnWhy6kOKlCxaOmemcuh2NxUT1LZof
	hHpaiuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ujm-000000000Xs-2YfX;
	Thu, 24 Oct 2024 10:06:38 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uXq-0000000HYwF-0Tmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:54:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e63c8678so750893e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729763655; x=1730368455; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWFrbyngtx/okFnAnXziGIwpshdD52HD2rAoJDGqVCM=;
        b=f9WX+MfgLE2/VoKkC6RP/5gYxgjcRQPwNTLMcPPq2eznRpcYyDv/VXk6GMzHwAMGYP
         12gjsO1WFUHBqFDJmA9w390YFmZr1g5SbxZ9znXZE2GGZx/Vc1eXvEvzuYK+mjmFtRbB
         aWpdIf+R5WjRkAfSRHuUnTYXaDE4fctiMoN8uO+qqNgpHFTuKfYRpHER7g9QLNWrYqAi
         ikdC0hvlJEkCwTEvnKv3/0Pn/SW/1dUaYWQu6LoEcn5KA+ToHn6o7C9Ns+dpzj3ttf3g
         35loAgmdqquU3EG17LXPgZOGgSHsyfbNiTTt3kVuggqg/TcoTa4mWTg1ZW0xRhMeCFGZ
         YvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763655; x=1730368455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWFrbyngtx/okFnAnXziGIwpshdD52HD2rAoJDGqVCM=;
        b=PxnzlqTAFLY7mNNDsZ+o+r0dCLmbi1EvLgbsakFK6vqFDVFEHT1eqOd0rSMqcTqGBB
         TgLtFbQzWPMg5PCcgPh3nE1vlyQ0nPiAnU1bfcSLIcY+1h3tzkyiqmhQYzcaz5BEkDoh
         YcJiPNBUOEMZmmDWOnDSQMesqUPlt+tkbJphm3dyVWvPslubhJ9xD0/Cx/FySIfZL4//
         yZNmnFM/S4R0CpmGUx4YhtLLPyGXP7jUmFi93m5np3SpZTOOB3o29Fc7KX+CpjYD4JwJ
         tOAkLhYWvQ54pffsY4b5KdawvwKJn2nUJqxe5IaVk8367pjuyc25fGtXZu1TZ+0UfpT7
         dpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcg7ZYIDbYKTgr2Zo5xl//Qo5ciC2jrvxTla7F0ORDBRG5AeHEwgQIccrbZ1G37tQFmVSHbVYTvZF14VRTOViE@lists.infradead.org
X-Gm-Message-State: AOJu0YwqaaMf9KR7WWeBGAlsde5Okgp2ygRSIEhigKJLcRbKaQKy87oW
	Xh3W7D/MjU4VV/b3UWNEHUuUtjsZEOBhZI9WXr6gr3p5Uoai57xQ
X-Google-Smtp-Source: AGHT+IESS/b985DjGqxcVR4TpFmyKByLbgcGL5xpKJP8FcedH7Cq7mq7giZwGEwbp0hOURP0H6AUbw==
X-Received: by 2002:a05:6512:1583:b0:52e:9762:2ba4 with SMTP id 2adb3069b0e04-53b1a315eeemr2629947e87.25.1729763655208;
        Thu, 24 Oct 2024 02:54:15 -0700 (PDT)
Received: from [10.110.248.100] ([79.110.251.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b1ade1875sm455020e87.18.2024.10.24.02.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 02:54:11 -0700 (PDT)
Message-ID: <3448a096-849a-4f61-8017-c03a83e22c38@gmail.com>
Date: Thu, 24 Oct 2024 14:54:04 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
 gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru,
 conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
 ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org,
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Language: ru
From: B4D_US3R <producerkgb@gmail.com>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_025418_214769_F74C6D53 
X-CRM114-Status: GOOD (  11.86  )
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

Grandpa, take the pills or you'll get your ass kicked.



Дед, пей таблетки, а не то получишь по жопе

23.10.2024 22:45, Linus Torvalds пишет:
> Ok, lots of Russian trolls out and about.
>
> It's entirely clear why the change was done, it's not getting
> reverted, and using multiple random anonymous accounts to try to
> "grass root" it by Russian troll factories isn't going to change
> anything.
>
> And FYI for the actual innocent bystanders who aren't troll farm
> accounts - the "various compliance requirements" are not just a US
> thing.
>
> If you haven't heard of Russian sanctions yet, you should try to read
> the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.
>
> As to sending me a revert patch - please use whatever mush you call
> brains. I'm Finnish. Did you think I'd be *supporting* Russian
> aggression? Apparently it's not just lack of real news, it's lack of
> history knowledge too.
>
>                        Linus
>


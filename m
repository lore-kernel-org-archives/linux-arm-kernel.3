Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81880CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=; b=duCNpqACndXwXBosq2hm6JNlrd
	70ufGuqxxoKblpLxeSDgho+1aaVOVaeLYJb10KDgRvqdAJSnO2pIOD7iuKbYK876cB5s7fA93pK8K
	Ymh3B6RaQAk9K1gVs3dEVpOdxifpI8C0oUIXog5IVkaC45w5Uwa/m+JGSW7fMLoVuOA/L1UlDlWtR
	CbDDhocbGYFsirot/+g8QIdZMPfGmlcUSD9IWAYRlIsugObcn/GfMlClFS+PvKXUtPgg42S3Dfwa9
	aXUbC06Vt+T4AhMPXCX8PT/X0PiE5uuAdLu1/opOzz2Kegaj4p8OiO4eUw8e56XP5GJaAhsf94Oa2
	76aKUdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWEV-00000001eAo-0VDX;
	Fri, 16 Oct 2026 00:55:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWEU-00000001eAh-1lfx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 00:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=; b=YNUOssLpqfDrrz6mc1Rr4RRMYh
	hss9cT6ximSfaMS44Z6hRO4F7ZI+FueZz2ijf/7V6uCJsJsmGPgsgJLco4BU1ekVqMSz/0Ozj7hEl
	FGa+BKcU/4o2mAX5FuWS9du5XrlmjwZpoCCuKtG7Bi+yK6AWCMGGu1AA5c6qhmabYbKXQS1pZm9Ix
	zeTgAFMUyttI4Wh/rwGFJT5je+rwfE/cJtr0eXBFPA/8KzbuMDMvV0GFQzFAuWos1jVVNj5LoN2q+
	Jxr8yhM8a+skrrab5VZ6UiXAr6zQloEb02SyMMGAPThbIXHBgno19Dk0K6SGP9CytHkYPYR9naxAm
	MyxDhH4g==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHWEL-00000000xdF-2a9I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 00:55:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso4608903b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 17:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112124; x=1792716924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=L7+XrpQrNefbJqSzCOSYohQYE1WtxqMyGsMg1qubE8fZmZ60gS8qF6acL8tDwpsESt
         tGgkzDzPSeJMsnKXJa87wvGP1K+oLD/aPNJeIzGmFF5Qz/9w9RKkf93DIUfelDLdwnFy
         GGyPuvHUu17R66nTYuGuj7s9xdW/D6us8gcmabTqZRroI71yS3cfXPx9RhACg3Z/HSDS
         G6dAHSf4acgkZ9RdAdM62JkeDvcZLZKdk/6YDzrDkmzBDoWoOsLOQ3lsQVmppLoMwRke
         MK+Q/UVjOdI/aJU+ZSAbmw1jm1usVvG4GEyC1AOUrqghTKAlr+25TIY4iThpWO9bakIg
         Ph5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112124; x=1792716924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=cVQ6vdEn5cS0FE8K0ZzDd2xrS5Kqijt/fyMNDq6wBX50Cd0ELwlXjsPYbhDDpEs8O4
         gZj5JTq2iZbqIp4h/YJg0zmtlAikcVrYLWChM9txPNnwX9bUBYN1CIb4FEXz4hX8+OZv
         OhY+V2wz3viWeBmCe4A/xnRHAf6SQkJGYobJFVcQfZJvRdVMvVjxh4w/xMBredtOmDRp
         ga6EX7zdt4/I9Yl3+nMyZxn/8h81fbtkg65al6TYOch3Mds/yblB0PozldEaFv0W0s2U
         lDqWK6UaIwt1Us38XuKqApgg1T1cqpIctuqqEPJ91DJZOIfC0uMXlUN3CXHLFc+mpaXr
         DBLg==
X-Forwarded-Encrypted: i=1; AKwUvBxlW7oEsjFQsipVrgKAmA3RNp0TwymL02IxO0dOWxeB0irOLTuNnw+6OU8VfVrYE/lfxc9j0EQEaQlseEZ8u/Fs@lists.infradead.org
X-Gm-Message-State: AFq9FYLqjERrvlqZXxnTkcOg1BQBoELKcaz+jltMWHDQ7TJTnV1R85HX
	yHo8Ja85nTtor86LNtpm/9E0zjNLCaziwEgIDSozZFbuFubM5gHwG0H6
X-Gm-Gg: AYBFou3++JCKB9live7TaqX0n+xGjomIQM0wIBEkSzezEYFW+q9/eYu6Vi3+HsUtgk5
	XNdyCu3ETtJ63gzMqPgsBYXUqIb8uHt10406Or1lr7DQxR2WuN9ZVEO4u4knC16B2Ny0we/35rF
	mGIu6JhnvnLq0V9Q/UJe6NV8X+tnTQ8YhujqK9OYvpUJheCft8uOPxGJc4Kntwpj6Waz0McogXg
	oWA7vSXYoG8kQgFwsUAN4EFYuX8SzbCZPybb4liKLv8dnBxNVELKFQDsFTM3VNqfEI6qDEuXMGV
	0UlHH+jL2C8muZ2pQ0RW1im99HwEWTK5w1SEcIMEnvE4jAcBzoTm0UlxkAsw48QJYosd0dljUHT
	k7WnAJLZE9CX600TxydtOWp99rmMK7XlKo1phMf0ZlxntEd8rRSb49QKgosSSuQGJenGDxzrrcE
	0tQ+7nrTzwNFn4/t4CTMHvMfQ0T4qtn4KDcXJmGlQO0AqqHW3hjO5pe8a8LG4hTcj3OYx8cM+WY
	mmXYOUB/eMqAu3qWreZGrwdU7Q1ubOtMgjjZIZyIjjYnA==
X-Received: by 2002:a05:6a00:f04:b0:892:a8f1:c53d with SMTP id d2e1a72fcca58-897c76e25a4mr19506420b3a.22.1792112124477;
        Thu, 15 Oct 2026 17:55:24 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58416a5fsm311339b3a.60.2026.10.15.17.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:55:22 -0700 (PDT)
Message-ID: <b30445d5-c5be-485d-a935-8b574a7aedea@gmail.com>
Date: Fri, 16 Oct 2026 08:55:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
 <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_015531_892885_7A727180 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Andi,

Thanks for your review.

I reviewed the Sashiko AI report and will address two findings in v12:
- Disable the dedicated IRQ during transfer state initialization to
prevent the IRQ handler from accessing partially initialized state.
- Clear the wake-up control register if `enable_irq_wake()` fails.

For the other findings, I have provided the relevant hardware and
driver design rationale in my inline replies.

I will send v12 with these changes.

Thanks,
Zi-Yu

Andi Shyti 於 2026/10/14 下午 06:29 寫道:
> Hi Zi-Yi,
> 
> On Thu, Oct 01, 2026 at 03:51:00PM +0800, Zi-Yu Chen wrote:
>> Add I2C support for Nuvoton MA35D1 SoC.
>> The controller supports standard, fast and fast-plus modes,
>> and provides controller/target functionality.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> 
> to me the patch is fine. Sashiko has pointed out a few things
> that require device knowledge. Are those concerns valid?
> 
> Thanks,
> Andi



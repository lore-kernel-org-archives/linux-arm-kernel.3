Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD66F34C49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=; b=TqGJvz61u40UWYTpY8678NXB0T
	6bktRWBA1mnhjsfQ8CV+lgu/1SR6+As8GEPC61NxQB3bJFcRaiCCse/3ZnpV2m9yib1mrVnNjIvDv
	s1oUzbj2L1u8yyA8oUApTvuNo58vpkBV4ofQyXVhUgS4zR5Hlev1nK51KmgDw0ju/WHzjSw6DY3H6
	drIwYklh0x1aZMhCUbWaXLEL8qYsWjLf0ghIo21llN2kDolfZ5TRbFOoA45fgnMXc5JOlQYzVjfnU
	WjCjUlDB7esq9xzMfe3xnypyZBeyJuVhcW3j6V2N5UIMLgPI/PwJb81k19ZUwuS07ubJ4q1vPh4in
	VL6DS0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHnh-0000000FnQ3-3nN8;
	Mon, 13 Apr 2026 13:58:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHng-0000000FnOV-0GHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:58:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b458ca2296so8735345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776088682; x=1776693482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=R9HjcJU1jwXlZrJ7hkiJE/VSTW6pzG6LGBJbkRvCdv9ZGIikMBzjUyHTMgnoFNz5/o
         loXUW5VnvPXoMJahHxa77oJ04r5VszPykoxwTaJmr6X/U84hyGgpM8DpdYHLK6YTWCLs
         Qtzgu7SmB5PfpJIHKmESmthJyEwRxYeljb1+D4COMPw5r6ig7qj/WS83NIji3OA9TmnO
         7kBiJRh5KQmPdXSnvlMVZcGb01jmc19t/Z1B4qAFkuN7I8ncaCJplobpnJF3H9Y0oE+l
         vRZiv7e650Q6a6OYo8Qqr7cUlIacoqm4D1VejbEmJ8QkxQJvl7d68T4QIekG79Bbf+Hc
         enfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088682; x=1776693482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=FKKL3uU3lZb7RxQ39T/7VB/zwwdBupr9xQ3CaomDkFmqWuZALNLpsHUQ8cbBgpcBWH
         dDMG3+ztymNRP8js+6HS0++gaD9aRmvULfcJuDSmW6AMHhkvWfZUsv1kT5WTc6zI4XVO
         EMX2DAhfg/uEgwv+T8nkjyucrYoMHHHoPlXKw1N1bqhYLDV0M+Mm2fJG4i/1J/MzTk5M
         uVI2nPO7Z0Uk7a3/ArI07jVitA9UL/ags0DRxYAmj0uqgBPGb2hwYevlnjb1NwBvqyHc
         Ikxde0/uJ+jg2U2Le0KaO0WGkiwwcRImQTyWmfnqt9NwYlsrUuNxfqZCgxR854TYa7V+
         fQQw==
X-Forwarded-Encrypted: i=1; AFNElJ8ITtzV1E0TmrW7WtYHapSngGzImdk/WxrFAlgM9iCMqyOhWyYKmGaVmKogb+36Hb8LNNmaOZ4FNhIAWS5EZHIK@lists.infradead.org
X-Gm-Message-State: AOJu0YwOGOnbn28yZtfeL4ix9WrMqjuQWC18K/fQsHtGVp/+UrhfKYuc
	wnbhIOSpffRC91orYMUzdbwaAxzfwWgEJn4Q10afIpBkpuA7OCrwMoFC
X-Gm-Gg: AeBDietg3mJpr1l3wYjEchlgMt+cYG4UELe9prNLAGcCQStvRG8eVeeUvRS0O5V0YK/
	92TfpmRFNvlhu91YH69oWb7H5nsn+s4DzcQ/Wwn3L/QEzigXOxqmF7g30w9moKx/Jcfidmk+oa5
	CEaHHtNdrjhMVJPbEQNjCtqmYU7yOhQn5oe8I34Gd3frEj1DT1fcYbbaDRpPebvBJEmLKj1lSFu
	s8QzlO7DNzkhPxljV8kcdKd198daJ8VcMOUJIG8z+8qZ9fbaMbinPhM1zlZAcUXoGWp4EXind1t
	uDsLXnmai97SD/cViw0KFoOfOyzuI2g9ZAExOyZwkQbrJoJv4ksB3fRGo8n/n18iOVR/S03uAyL
	JQvR+TVcrgVDXCU0B6G1FS5pkemo81PBw7V9GbjjiVOiObS6EKVqvaAyCfdl9b3aT4HMWGT/fiw
	O15QYTPlN/rPw3VfTNL+tFCcIWGG6WWBQxZj5dtY1G8gkE4lwFw20+x+rbTN+f4apL/sMxPs/Cq
	sx+3Lg+BHw8Tw==
X-Received: by 2002:a17:903:284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b2d5a63d4dmr133027285ad.38.1776088681795;
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
Received: from localhost.localdomain (61-230-3-9.dynamic-ip.hinet.net. [61.230.3.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f36351sm113068545ad.69.2026.04.13.06.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: afaerber@suse.de,
	andrew@codeconstruct.com.au,
	eleanor.lin@realtek.com,
	james.tai@realtek.com,
	joel@jms.id.au,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
Date: Mon, 13 Apr 2026 21:57:56 +0800
Message-Id: <20260413135756.8796-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
References: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065804_107775_111CF12B 
X-CRM114-Status: GOOD (  13.64  )
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

> On 13/04/2026 11:23, Yu-Chun Lin [林祐君] wrote:
>>> No dedicated maintainers are shown for Realtek SoC pin controllers, except
>>> pinctrl subsystem maintainer, which means reduced review and impression of
>>> abandoned drivers.  Pin controller drivers are essential part of an SoC, so in
>>> case of lack of dedicated entry at least cover it by the SoC platform
>>> maintainers.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> This patch should go via Realtek SoC maintainers, not pinctrl.
>>> ---
>>>  MAINTAINERS | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 10d12b51b1f6..374ce55e4fb6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3373,6 +3373,7 @@ F:
>>> Documentation/devicetree/bindings/arm/realtek.yaml
>>>  F:     arch/arm/boot/dts/realtek/
>>>  F:     arch/arm/mach-realtek/
>>>  F:     arch/arm64/boot/dts/realtek/
>>> +F:     drivers/pinctrl/realtek/
>>>
>>>  ARM/RISC-V/RENESAS ARCHITECTURE
>>>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> --
>>> 2.51.0
>> 
>> Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>
> So James will pick it up?
>
> Best regards,
> Krzysztof

Sorry for the confusion. I'll pick up this patch and include it in a series
along with the maintainer updates and other DTS changes. I plan to submit
the series to soc@ during the v7.1-rc1 to v7.1-rc5 window.

Best regards,
Yu-Chun



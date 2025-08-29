Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4537CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=; b=BTrRo+t9uX+rPh6iSFowXddWuF
	7WDs7z97s8QzAoKJP78RGvtkuvn6QThHHlZ+y/NsUZF/B2/eQ27eKThSYbiHJ2RVwIpRWLoyuIUoN
	Sw4FpGJZLeR59XIid0fzJcgC5Uin6zTYi0/cb9D9Hz4UjkkMAi9SduChRAPYHmr/cRaAFGI8qzs+4
	MsJm5vy6sKgmCphLQZqZ2485TuAbruHIpnZoIPPMy63tqcMH0VjuJBlFmaspS6vuiuPc95GWmh8R2
	FVKFddEwGDsqp2nU8CK82dhWG8lH25oLCpHGS9Tefxm5U+ER8WdyS1OpYPlWzTF2CwhDFgpad3bLR
	jB4S7cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzlU-00000005yGA-3huN;
	Fri, 29 Aug 2025 14:07:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwu0-00000005Qef-2QO6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:04:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so2484500a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465455; x=1757070255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=;
        b=FuQYJJMmkl0JUkIUcrzLH9lTTKeIld/NpQOtGuZOsgzkoGuDoeO+TxrutnfE3UuNFM
         uKlMqlSwNDnPQeQQPE4FlW4ZR9ltHQoWcnfSjsFu1XNDvKXBphczxCN1pLqKWGQp1f7L
         jIldBYMhoV5vmJFO+Wrquzhw8xoA01LkWAahBFfmFuGnK3cUwveit2NijxPaSPPpoQ9s
         8w3guDEMk6LGA8FZ3reQbFSQ/jujZ2jr5G8J3LWuy7/JuzC1Kcq0HHWd7cW8fQaygXRW
         EPIfeIiA1wM67+2ZAsbHckiTTN1BhvO+zbWFdCKXTkFwuYFZQPqRCi3Xrs4yTFs8k5iO
         d61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465455; x=1757070255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=;
        b=hV28TDMo7dGqFh2HkXYmaO5u/7NjIeqPcCXFuzOX6FYGV/FmKP96kF9miico7vAmi8
         rBdkSUsDur7nAJ9G2pFD86wH/5zjlfI/PTOd0TzcM/mUTuwrlg3HK54slq61NhBgRN9I
         Ik8uDPBgS7rFpAYhun4z1CD9s+Hpmp6WEr/AiNnHg4wkyDOnMUkLvqI+Y6hkN2k7AIEL
         4UND06MjDuM7DEqx3mPnxc6nx4GWjLKkSBZ2OKmlmyxlRwvtpAj+R3Exp/+tfZgwsbq5
         hVkTWspXcDGdyPMrzI0FlagVGPSxu0XGLmIUbeIp2Wg96vS/iVo44EBAy67BrV4SuIij
         aUDg==
X-Forwarded-Encrypted: i=1; AJvYcCXEW7CgKbLTATNQv4pK2tKORiKD8DcJbTt8gRkZnKh+8hBdaV7cYvQjAXyKDxTZANIkycUbNVxjBrqLJdalSKXW@lists.infradead.org
X-Gm-Message-State: AOJu0YxvdcNAptlwuOI1X7TNDxGyvGBDxKfzsxh8sCpdKOM6B975JFEX
	VJ+Je3+gDSBYjpPxvRUiI1yLuDSXGGp1jhsAn8R7Dv/1Oy1u1zmQvGiq
X-Gm-Gg: ASbGncudMhlhKgljrLRfA+xK/Aw3bBypjzNfyAA3o28RIcw55MA7Ehe7z9O8bgEIgqs
	qxF5UuWVI+arF5CzwoGwWpnVCEh9OjF0f9RUhX4Grtz0ta/IrFSIF099ZDhywsr8NY+H+WSpdgJ
	E4YW6OJsdJFoIpzxaiUZh4DtC1LLPN8HIpcfLcYjpTMqNUPeZN6WgBoYYz5U9sKnx2rip7QutLn
	9TMhy/OrWEpaTTvPWdjUuRLHlnFwO1uJQk7zJm+rMhABa3Z+2ryqCkHyoDX7RWumLVLBe+YLEWE
	AhRiWuEGAv4g0WDMSxCz9uKIoZBgha5TM2j1JWvEMeX9VJ1N+0KuErn0EuahEOxH8SdG7Gh88wz
	+0V/jwnHKAgNNEjAThZQ245ys5HwpzpdIbvqqjhFCNKBcS049C8XHnXPO07cNcumUbR1u/eJ73Q
	==
X-Google-Smtp-Source: AGHT+IEpjEEgJGol2tfKPNp2RrC4QuVEgEoma55i3wFC08IDA/HB59gsPcVPdBdqybmcvNhiYLRoEg==
X-Received: by 2002:a05:6402:24c1:b0:61a:9385:c790 with SMTP id 4fb4d7f45d1cf-61c1b6f9d26mr19627870a12.35.1756465454626;
        Fri, 29 Aug 2025 04:04:14 -0700 (PDT)
Received: from [10.82.207.1] (212-5-158-123.ip.btc-net.bg. [212.5.158.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5572afsm1525721a12.50.2025.08.29.04.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 04:04:14 -0700 (PDT)
Message-ID: <7e14b195-f383-45ee-a6b1-6e71fc8fea86@gmail.com>
Date: Fri, 29 Aug 2025 14:04:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
 <31435f98-5701-4ae0-b822-11a99d1b2eef@gmail.com>
 <51240b84-b063-4b99-b755-cc958192fef2@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <51240b84-b063-4b99-b755-cc958192fef2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040416_624667_D956A728 
X-CRM114-Status: GOOD (  17.80  )
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

On 8/29/25 13:55, Krzysztof Kozlowski wrote:
> On 29/08/2025 12:40, Ivaylo Ivanov wrote:
>> On 8/15/25 10:04, Ivaylo Ivanov wrote:
>>> Hey, folks!
>>>
>>> This patchset adds serial busses, implemented in usi, for exynos2200.
>>> It's missing spi, due to me having troubles with reads when testing.
>>> Serial_0/1 have not been included in the patchset, as it seems like
>>> they're encapsulated in usi blocks, but are the only implemented
>>> protocol and/or do not have a dedicated register for setting other
>>> protocols in a sysreg. That'd at least require patches in the usi
>>> driver and bindings to add support for.
>>>
>>> About the naming convention for usi nodes, I've chosen to keep the
>>> downstream one instead of relabelling all to avoid confusion when
>>> cross-referencing the vendor DT and to keep consistency with clock
>>> names. They're labelled the same in the bootloader too.
>> BUMP - when is this going to get merged? I had a few other things
> OSSE25...

Ah right, my bad.

>
> You can help out by reviewing other patches on the mailing lists in
> order to relieve the burden of maintainers and move your patches higher
> up the list.

Yeah, sure. I never really did reviews before because I felt like mine wouldn't
hold much weight. But sure, I certainly can (and will). Thanks for your work :D

>
>
>> I wanted to upstream before merge cycle.
> You should have posted them already. b4 handles dependencies, this
> maintainer can read cover letters.

Yeah. I do things via send-email still, so rebasing is a bit of a pain when I need to
change stuff in previous patches. And I don't do new branches per patchset,
my hardware isn't.. the best.

Best regards,
Ivaylo

>
> I plan to clear my todo queue this weekend and close my merge window
> within two weeks due to travel.
>
> Best regards,
> Krzysztof



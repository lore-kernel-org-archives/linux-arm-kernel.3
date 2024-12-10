Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADC0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBU1UAuy5MjYfrWbZjh4/sgnYH98b4q96SgJM7Z+66M=; b=sJiHHW6/3JlHA8pCMS2Qvn+3Fk
	wVb1x/Mc0aBTnTavo1bMdpnca7XwCm7rJDeLDuugBBcf1zsXFsCRSeQJSWeEn01FKe/GuS/m5Gcyg
	VvDvhEiwsZ9D3QQDvUm1wNJKTUID7L3DzQXh/eQPlTpby4wHMnU18OoQlF/lavrm3M1tB2n/clZLW
	QOIixodXOguf+AJt31V8ORfnk3C1NtGmRGK9Z9DLwfSKFc1hus66YmerfulE8nbxn800CN/EGVj32
	XQg5mmfAGB/aAVtQpB9Q7b2ROQK57Ouv/sDv8m8jLdfqDe6pI7nNTKqkEn8gNSSMqdVyNGuq8vTYO
	InBdUiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsjr-0000000AH8Y-07vg;
	Tue, 10 Dec 2024 05:24:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsin-0000000AGr0-1hUw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:23:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-725aa5c597cso3820215b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 21:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733808224; x=1734413024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBU1UAuy5MjYfrWbZjh4/sgnYH98b4q96SgJM7Z+66M=;
        b=KQLsXjDWtwPULAuJIjwWao9KTfCzLT0HbZRCSo/VS74ZAs+e/d9GHkxuqPl6Js68JN
         6MYvGH9y0gzH/z+zlWND56iPrZZPDuOoV1Kp3fu2WTNK2O6/tgfw3RuJQHDIk0KnC1wC
         MRaZNNHaZBKnzq0+dKAgDjaSrpl2Kji7uv2nIyz0+EK9YFsSYrutlNJi9apznt3434Z/
         QJPLZL88WZUYExyoxfcc2Bi8LmZLqP7kjW4kJVCz94MXLxADVmEkPZMQN+3abnpQBNLY
         r6uGRKxl76xo0R9lBMsLdDm9DWKxJMteiN6mfDcIdtdrJBTaO62JJ91WqgVYXQClE58z
         m/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733808224; x=1734413024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBU1UAuy5MjYfrWbZjh4/sgnYH98b4q96SgJM7Z+66M=;
        b=klQ90X4aGRPYlXe15kPCfKpXTvEhe8FkdetS/J9MVUxeJglFKAy1p9oIKcAdfKb4XO
         5l+7sfYQnVtICw/BEkTgeGsNH1B/LoHKO3aTJxjeOs8n3zjuBdBBqnhMFgOjLO7dGl96
         l4JU5Ou/W4u0d5gZdqvT/78viuThvu8529OGr5PiExo4BvuwRJQQDXNWWUe2Fuu50CQw
         In8fuCMx0Somj9Ob9UyXaQA43FjnjxyxxH5tP/Idc/t7M5rrnry3PAnZGPQdVzS0lJhX
         B2ulTARdX0B2s1zffKN5FNywVdb19w8c76/GNkxWR5hKEitj0nKCuWIAAR/3BkAGfdfS
         qcdg==
X-Forwarded-Encrypted: i=1; AJvYcCXdlqyY2NCv7FsUFI26yLZeMISr4AXeeiT6T53o1S5U9BWkU8LMZfslFRIL5JF21nnPeWihe0TNoINVLtYghRh6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1bTLRVuqJhK1qfcafBtYEiQfmxbbIPa/vzOr3e5R4WQfivYcV
	llwqip8OABAX7zWMlGSKWf2/cSilQy2WD77+nyKOCCWmSg1EJdfgb0O4Gw==
X-Gm-Gg: ASbGnctgXG871tXeBhQV+v3fYKX6EmcQrri+ZlbkHy+tgFzHUnulQVQ/8fdXkwelX/7
	x7K5HVwAXSevgbSqQBvqaismo3yB8TbCQlTY5xzh4smJYCfRkAPf/UR6P/cl5iisIo8lk2gIvyo
	RYwoKPWyg5NeLYqNvwMpzRl4H3SjinDWJt5Ede0NqydaUn0gSLbfPlAqphWfxxxYS5KTha1Oska
	m3Uh8N5I4enG9JXUbWM+nCBuV+3VpD2zcF7d+3r3ddk3cCDs/dQ4/woWYRh7SqGhxYFem2XTTOO
	uQgKEtLLFFqTuI3cJC8xBqEWrWzb
X-Google-Smtp-Source: AGHT+IFRDtAZUHy67YBIFMjYuSZVAM9Ll94FWK+XfQgDXiw8IJ+uc/Rits4ApUB7XKhyFdVb7YNsBw==
X-Received: by 2002:a05:6a00:c8c:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-7273c8f4d8cmr4767471b3a.4.1733808224007;
        Mon, 09 Dec 2024 21:23:44 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cb065fbdsm5359995b3a.39.2024.12.09.21.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 21:23:43 -0800 (PST)
Message-ID: <274c7ba7-dd7a-4981-95a8-38ed953a7dbc@gmail.com>
Date: Tue, 10 Dec 2024 13:23:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241204021014.5083-1-mjchen0829@gmail.com>
 <20241204021014.5083-3-mjchen0829@gmail.com>
 <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_212345_443629_3831C190 
X-CRM114-Status: GOOD (  13.94  )
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



On 2024/12/4 下午 03:49, Krzysztof Kozlowski wrote:
> On Wed, Dec 04, 2024 at 02:10:14AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> 
> 
> Repeating same comment third or fourth time is a waste of my time.
> 
> NAK.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Best regards,
> Krzysztof
> 

I will carefully review the v3 discussion thread to ensure that all
feedback is properly implemented. Once I’ve addressed the issues, I’d
like to confirm the next steps with you:

1. Should I drop v4 entirely and submit a revised patch as v5?
2. Alternatively, would you prefer me to resend v4 with the necessary
corrections?

Please let me know your preference so I can proceed accordingly and
ensure a smoother review process.

Thank you again for your guidance and understanding.

Best regards,
Ming-Jen Chen






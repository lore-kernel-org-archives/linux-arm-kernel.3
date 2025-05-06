Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F61C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRedBdvWHewdGHc+8H5jFzCl3OWzRCEmeyqHhByRR8w=; b=KJjRXvth+BlZPWW19jts2ivp+Z
	KfFhNAHIEs3nbbW1Pg34yYe6mX+GFVvP2sU1yMXg9mWLay71qyQhBwq3L7JA1ewzGzDjUWtk9e0s0
	lrbSGaAckCDFCcTQFHVR75m2843YwtAZz4/F7Nnw3jA13B1TmAVjNqkJdhwWD3vY5Un2O0iE6qGzV
	4WhHUiESi0yvpHXt1PxqS/6rxIrIys9p58JIdpldlV55duwpyKqZ71uuzqO5RwbAa1abTTIKk0Rzy
	U9+P2SWCyM735Mk3GusI7iJ1tlrEv1G8WghDpwvdjl8xXtmWqSfl3KV4TcHJqbwQafjrNDfA3IIhM
	6okrnZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQkl-0000000Dar3-17UJ;
	Tue, 06 May 2025 22:27:07 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLrs-0000000CoxG-0CRG;
	Tue, 06 May 2025 17:14:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7081165a238so42733877b3.1;
        Tue, 06 May 2025 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551647; x=1747156447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRedBdvWHewdGHc+8H5jFzCl3OWzRCEmeyqHhByRR8w=;
        b=Yqv95DKQTLrJqly4Km1ayLqQZp9z0384yGMpnWaitaevV2+rg2KYrjQzTU01tcsrEU
         /cGRW+VGZtqSCG7qSytg6NKN00zJcQB6dEt+n0HBQp81maBtoCqKV6eJkbh8Qy+sgZmy
         kJwINwao5tTdBe6iv1EYiei/LvkT3tmSgAQYDYtzxfKnPsJori6swOxgAJ5sspYPXaWB
         W2H3428Nt8co5WYCQT4eFpIdhO3HSDa7X9Y7lvrsm/sd2+f0nP1zs6XKXpVIcIQwst0i
         NlT6zw5pZ+DvTt4WllozK7WPw/jWGO4qpNpxlyGN5fEYvw6o2Qj4pHMrh5sKMAAk4p6Z
         qzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551647; x=1747156447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRedBdvWHewdGHc+8H5jFzCl3OWzRCEmeyqHhByRR8w=;
        b=KwkVjAgW3GqaZx/H6mRFEAakZrurZivOpwDD2sbVyVUSk1Hpu3TfnywNCS03NPSc8r
         1zjdGr5psyMF5h4TQV8OrBLTI2y1y4bCOI4HpcST+gxDQxNRPe9aDaKBSOULyY3pcg33
         aZ1/7ThBTf3hvMClj6nyeRuzQmbUnYKX/usiGo0CY+mD1KqXmYohMRSlfTloIWWI0UtD
         aRuoRsRx7mqpS7zwaozZb+05dwh9UC6m2gfuK6DMqDbQnkeBBLFm70FIBAl7hY+F5UIB
         YSVDMfTjvI3S54w4U9dJCXj3AeQNYvVG4Px6VL2AvrV5+Es8JqqHahfj5JwtjfrcX/9d
         6iLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXWgap0bbgn4IZ3x1qMHnYZF7r3XebtNgm4MKTBhsJceMYZN+Pmkk5orDsK0VGhJWQl3nWrlCh7Ut/z6ioqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8eCQZRLdRk4j7zrnpu1gVUTOLyRwvEfJEwVWbKTbeFTDYup1
	kdgqgdhLLAU9gEYfby5zKlJqXh3lkebYQfPkAA1d/nzRPtyeltEV
X-Gm-Gg: ASbGnct4Kqqpr8N1dSWn6mhRWkOZdLX8UZ5t9aFGqBC9dasMo5YUdAPqf2qFKgHCB+z
	fUFQ3cnma/KsT/StjD0399CX2QFjn4BS06bitVVfkLwXSyC3cVSYwMg8fHQxgqBM+i+G5+5HFeE
	Kud+jEWiSqI0Gt0K4QLElzCq61mpnzrcApjjxz+QUM0Tp8OQYol76ojLg/wsrnyY8KuEh2SBrdC
	OO3tvq0WBk1VB0jaGY+Qri0i4BSR/rhX1V5UwsECZvBXkhGiBrxD5C5UgLyC+vSx6UlJxM9ttim
	PgepQn8347MkI7aPdwdABunLAgh1iSUybKMwiA==
X-Google-Smtp-Source: AGHT+IGbekAdUjGPTcZlU040LQUgD3tEix530NlthS43YkNGTWjhWN4j1EIfWmF30Nba4JZ16EQ9mQ==
X-Received: by 2002:a05:690c:6482:b0:708:c18d:e6ac with SMTP id 00721157ae682-70a1da36dedmr3095007b3.18.1746551647021;
        Tue, 06 May 2025 10:14:07 -0700 (PDT)
Received: from [100.96.0.9] ([104.28.237.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c4154d13sm27994527b3.58.2025.05.06.10.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:14:06 -0700 (PDT)
Message-ID: <043117e7-9fd7-4ddc-8fd9-433c5b8c5dc6@gmail.com>
Date: Tue, 6 May 2025 13:14:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add Luckfox Omni3576 Carrier Board support for
 RK3576
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
 jonas@kwiboo.se, frattaroli.nicolas@gmail.com, andrew@lunn.ch
References: <20250506114115.613616-1-inindev@gmail.com>
 <bb857b7d-97f8-4505-9d2a-1ba9d6319710@linaro.org>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <bb857b7d-97f8-4505-9d2a-1ba9d6319710@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_101408_090888_960DCEBC 
X-CRM114-Status: GOOD (  16.65  )
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

On 5/6/25 1:05 PM, Krzysztof Kozlowski wrote:
> On 06/05/2025 13:41, John Clark wrote:
>> This series adds device tree support for the Luckfox Omni3576
>> Carrier Board with the Core3576 Module, powered by the Rockchip
>> RK3576 SoC (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52
>> MC3 GPU). It enables essential functionality for booting Linux and
>> basic connectivity, with plans for future support of peripherals
>> like WiFi, MIPI-DSI, HDMI, and Ethernet.
>>
>> The series was first posted as v1 at:
>> https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
>> v2 at:
>> https://lore.kernel.org/linux-rockchip/20250504102447.153551-1-inindev@gmail.com
> You got extensive guideline what to do in my reply to avoid exactly the
> mistake you did ... yet you ignored the guideline.

I did not ignore it, I took this to mean:

 > Do not attach (thread) your patchsets to some other threads (unrelated
 > or older versions). This buries them deep in the mailbox and might
 > interfere with applying entire sets."

that I should not use the "--in-reply-to" on my git submission which 
caused the emails to be nested. I see now that you were referring to 
adding the urls to my submission.
I realize this is probably painful to go through over and over again 
with new contributors as they try to carefully follow all of the linux 
submission guidelines and I apologize for my ignorance.

> 
> I don't understand.
> 
> Are you going to ignore also Conor's tags?
> 
> Best regards,
> Krzysztof


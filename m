Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0CAE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nthmpXTtFMXj3N/ySisQvj0S19J6SBGsdVEyQ2k86vg=; b=2qgSuiXw3ay7jYo7HmErMy3wkK
	4fBs/8e/ESCQPuetpyLns3RWlSHnGYIlUH5Q84lUU7h/JjvkdOE5pxT/Gr8/pGizqT3b/aZlJCWkP
	vOwy8RYjr2qgKVdxz8QljfMPFql507c2vQlXyjL8fb39npTnzaGrqpVoKyXQSnWNebhwI8uYUupwl
	UDdUrBQz760KjY+V63jmvoYY5ub4YgPC3l5AAFOzVrIklqw4p2AHpGjuIjhvJu+21Gpmh/rvn7v3p
	OP4bBHZySi1SjsjsuiAnatOsob/RB2f58zgZBTVNIBLa54yGi1tFWWJCU92dAlZw597GY9MMAaGI2
	8kcfXpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSh5-0000000CfnW-0Wb8;
	Tue, 17 Dec 2024 08:12:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSg0-0000000Cfd5-0IPO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:11:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43616bf3358so5791665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734423090; x=1735027890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nthmpXTtFMXj3N/ySisQvj0S19J6SBGsdVEyQ2k86vg=;
        b=toBihtVZnyPwg699Wbl7S26a+D1ysNhmnPuHUpvTmBQct45Xa4Nfqofe9TeQSTJkYb
         GitHXOdmOg4ERlqUCcLYpz+3A++SunsavpQL/EErjFwO+EUX9ita0NS/5XRVuwEHS3cx
         0qODpLDcMQOd+AO0Ct5/atMGPRHDYtVnPXKVzvHAcefSLikrcIsnyikQDmO7lLCHodNm
         xGcJ0zA2sAABCb+ggFIynR61CS5Wat46HObDwA7cmk/5dPMWOMubb5H75HVr/h0eVryT
         ek16Cz3AOz+l++8YvWXHIDSw8C3YUGCCdD+FLGBTwcXQ6LXfnUsx0HxF8o5D0jo4NtBj
         s/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734423090; x=1735027890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nthmpXTtFMXj3N/ySisQvj0S19J6SBGsdVEyQ2k86vg=;
        b=gfZ/22l1BLodlGvHNc6rDJTd++KPQFXSSoeY6EzC++ai3dsDel7WnI39fSYLcq2RDA
         5Ve7LV/AR/3Mv+Qf4HBG1RmrTy3gxzNmOxle4FEfHGMFRS5EJl6rxGdUMYlTEo1w6Oob
         pGKAuLLgy3EZyWoPmdmtDwQvD+dYB1CtXbC8e5IBPO9v53zoJxtRCQah/wbLRM3nKWX5
         K0I5GeJtSIszI3PLwN72CWnHy+i7LY5INg4dQK3Q/deWdXKz4JuHsos9YRlXhwZikxn6
         IqUAtEOGA7xJpBvk0+1aHeNRjwLS96UnrvSQEnyp55q058Kb1r4v2ywEDCneJDno+hdt
         D9Cg==
X-Gm-Message-State: AOJu0YxjQbE28EHnIehiZAZpit4uG9qkxiHIxiEMV4VtWCFSxh+r4AIS
	mRqHGdQr/MMIR41wPliCcSCA8EdvscjeZqP11lgLyX7kl3gQTzfppFhlNUTHqFI=
X-Gm-Gg: ASbGncuDIuIIaIurdhp41PbEdeLPA7riXvHf6K46coZqU4Zc5/wGLyIjFAIdcvhX+jo
	2Qu1L8B3+cpm5prik40Inijr5XYJAE+GfBuURP9s/PU6MDonSn6e4un9bopWYWX8SDMjVwOX//2
	8FLIJSm9xhAwMEjXoGLhsBVP0IL1EjztztaAqur52Pe5MMa/VwVuABGjA638bXMXMVuMxv7FHPB
	sh7n0qSnrSH6vjoMV8f1PL4rEqfHLzFkmat3KqAp8QghHEKxieBmfbidMPsYAdVs59ZOCgSdtn2
X-Google-Smtp-Source: AGHT+IFNjMfCjYPMbwJa6u6I/a4umsR3FtryZ3WtTwR6Ct1skiAV9JApKQ+YQLcillNxT8neWTVriA==
X-Received: by 2002:a5d:5f88:0:b0:376:2e3e:e6d4 with SMTP id ffacd0b85a97d-3888e0acb25mr4663085f8f.5.1734423090293;
        Tue, 17 Dec 2024 00:11:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ad9asm10286086f8f.58.2024.12.17.00.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:11:29 -0800 (PST)
Message-ID: <07cc40a5-8b4c-4f5c-8ecb-cbc67b916858@linaro.org>
Date: Tue, 17 Dec 2024 09:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: defconfig: Enable STM protocol and source
 configs
To: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241101084558.36948-1-quic_jinlmao@quicinc.com>
 <e7ca1f47-8ccd-44b4-bfdd-707a1f8aef13@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e7ca1f47-8ccd-44b4-bfdd-707a1f8aef13@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_001132_124367_D24D9400 
X-CRM114-Status: GOOD (  14.06  )
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

On 17/12/2024 08:47, Jinlong Mao wrote:
> 
> 
> On 2024/11/1 16:45, Mao Jinlong wrote:
>> STM is used for logging useful softevens from various entities.
>> With STM and TMC sink enabled, there will be more buffer size to store
>> the logs. STM source and STM protocol need to be configured along with
>> STM device for STM function refer to Documentation/trace/stm.rst.
>> CONFIG_CORESIGHT_STM is already added as module. Add Coresight STM
>> source and Protocol configs as module so that STM functions can be
>> used.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>> Changes in v5:
>> - Update commit message.
>>
>> Changes in v4:
>> - Remove Ftrace config.
>>
>> Changes in v3:
>> - update commit message.
>>
>> Changes in v2:
>> - select ftrace config explicitly.
>>   arch/arm64/configs/defconfig | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> Gentle reminder for the review.
No need to ping for this. It's pending deliberately - on you. If you
want this to be merged, you need to funnel it through SoC maintainer's
tree. get_maintainers.pl (explained also in SoC maintainer profile).

To be clear: I do not object this patch, but I also do not see that many
benefits in having it in defconfig, thus no ack from me.


Best regards,
Krzysztof


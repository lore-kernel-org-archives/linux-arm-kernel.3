Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FEC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTGNxm9xYnn4cWmuziKMIalKHLj2jvSVwL5+1WZXiyg=; b=zryeJidjAtqHiFVw7AxAiutb1Q
	66Wn0WWfApu68W63xHZp/LmLZ4koRiFMwPqohepWGu8p2sYNirddh2scQSg/UuVWT0itZBHeo31pb
	EIx+9CZd4NXFpYbZDThZ2EP4rl+PhYsjPX1sRIbZtqoCFN1z/vTmFE2R7MMS1CM2wEDgxWF57RQlI
	VKrVDuPgJ/J/1tBKpZKxmKusvfQNxca+hxVvB+O/PDQMdb7F5dc8cGIeOgTWtFvUnGzDwPe3gEPvH
	ilegSdu53ZGFsNSzDjelgZw8RVwGp0t2avysrWFneREAiEJ9VgzEGwVmDMmX1grXem8BTh0Wlc8lh
	0quI38WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN3X-00000005nhc-3zKW;
	Mon, 13 Jan 2025 16:12:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMba-00000005hAP-3KWM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:43:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436249df846so30975485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736783033; x=1737387833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTGNxm9xYnn4cWmuziKMIalKHLj2jvSVwL5+1WZXiyg=;
        b=ss+zRzgcrq1vT/S17E3jBhSTWNYkEQMckf+WQYHezL6qQUBYlKod3w4eEfrhd32TDD
         fWWEm3vEDYI8yP9L0eIrakQxr+wP0UDxy3v6okS2X0OaZkbBEYXp4YrZ8h4ZiklAIidI
         nS27zAfCzEBUOzsmaqjz3LKgbGadfTS+BmyvY1Hu6+2UwCkPZCBnYN1jkcG7x8k3VAE+
         vVfk8XK+uLPNES5qqfSZ7YWGLscJDJ5xjHmdxSwFX6zD+6R5OHKlBeCdzddeBQwsYEkw
         UQ1OwATSDXY0rOqBDvIDmqksG7mFq3sH4l1WfXSDdQbXGfHsutOBVV83VuvjQ1NSUH3W
         HrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783033; x=1737387833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTGNxm9xYnn4cWmuziKMIalKHLj2jvSVwL5+1WZXiyg=;
        b=urPRTJXXmPV7DyjsEPwtXaVrByb6rs1UtijKRPZ9eGWyBf9KDG08n5GbAQ9Aoz8nGf
         rv2zMEFSpLQEdDTuS2lPWxeWGFzdCxlnQH2S7jgdIou1ByKYfnS05klaPfO97zFXvPOW
         hXfK0SdSH8aalXJunJtmu6RSQETtEPe0DVMYe5BRhMQjzsRuloguviCHvHRba0YC8VnU
         BootFJQvLs6GMMcODYbwN8FKunSsXHnQ1AkSWWvQCsqDyFvEKIqrlNUF1lwbgy8Ac4xH
         IRobUM8XQdolMwr095b/K6MWsznV2ITfmjTBnlmFV2/6CzNmEsjx0ulVbR8HHDrKd5Qi
         d0zA==
X-Forwarded-Encrypted: i=1; AJvYcCXs5+fvNerG/NROagInFoCpy0X64b5lcIokOxai2U+hCQvG+mjoZiX6Vs45DuG+ELkmTjoo1wDgwPlqr8osbihM@lists.infradead.org
X-Gm-Message-State: AOJu0YyPGkNlnww9DIwWU9ZbpedQHhfFH2hyLbgEjYLtUCr4ELm8s03K
	Sm9RYR1Pp1LCfEJuvXaKOVwMEeSJIIJgqYtAMiOoszqk6GPQQvxPGm9X+UdJYHQ=
X-Gm-Gg: ASbGnctaXPkTHK1EPUf3N/1Qu7moyIs8ls+9qdhbIQxeflssiAYsba8iLLD8+XJBcuY
	cQZsEPX3jw+uJwkQOW5xyvvWA0ZLTmYygMv5qDpFlbqwiPfcjVMX/lgnLitu2TxHdLK+S+49Xjy
	ovcvdL6sJfrJjDNZl5ii1/+9Be7EnfRplifqeFX/yK/PUJ/xQ5J2hpbNcxWqDg8RcClwmbU7uPh
	5SinWczWmh8ZpbM+6iz8kAXZceqqjs3Rm1xx1vJUFr6SI/KYqLxRRh+PdVmqi/l5nWB
X-Google-Smtp-Source: AGHT+IHYI0z58G3tmL4uSQ3a1JaItNifz0mtTDEQSbqhFfFgd11vVuTxyh8yF5a5Jh2ewY4Zed7z1Q==
X-Received: by 2002:a05:600c:4f4e:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-436e26935cbmr178745305e9.12.1736783033077;
        Mon, 13 Jan 2025 07:43:53 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62333sm144996065e9.36.2025.01.13.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:43:52 -0800 (PST)
Message-ID: <dcd3918d-feb6-412c-8f1c-b19e01241790@linaro.org>
Date: Mon, 13 Jan 2025 15:43:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] tools: arm64: Update sysreg.h header files
To: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, James Clark <james.clark@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20250106142446.628923-1-james.clark@linaro.org>
 <20250106142446.628923-3-james.clark@linaro.org>
 <1dad2a07-6aa2-4ddb-a337-ca3bba560f92@sirena.org.uk>
 <86ldvewx5g.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <86ldvewx5g.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_074354_832688_7C767FA2 
X-CRM114-Status: GOOD (  15.65  )
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



On 13/01/2025 3:28 pm, Marc Zyngier wrote:
> On Mon, 13 Jan 2025 15:07:21 +0000,
> Mark Brown <broonie@kernel.org> wrote:
>>
>> [1  <text/plain; us-ascii (quoted-printable)>]
>> On Mon, Jan 06, 2025 at 02:24:37PM +0000, James Clark wrote:
>>> From: James Clark <james.clark@arm.com>
>>>
>>> Created with the following:
>>>
>>>    cp include/linux/kasan-tags.h tools/include/linux/
>>>    cp arch/arm64/include/asm/sysreg.h tools/arch/arm64/include/asm/
>>>
>>> Update the tools copy of sysreg.h so that the next commit to add a new
>>> register doesn't have unrelated changes in it. Because the new version
>>> of sysreg.h includes kasan-tags.h, that file also now needs to be copied
>>> into tools.
>>
>> This breaks the build of the KVM selftests:
>>
>> aarch64/aarch32_id_regs.c:150:16: error: use of undeclared identifier 'ID_AA64PFR0_EL1_ELx_64BIT_ONLY'
>>    150 |         return el0 == ID_AA64PFR0_EL1_ELx_64BIT_ONLY;
>>        |                       ^
>> 1 warning and 1 error generated.
>>
>> since it's pulled over the changes in 056600ff7330 ("arm64/cpufeature:
>> Replace custom macros with fields from ID_AA64PFR0_EL1") but not updated
>> the test to reflect this.
> 
> Thanks for the heads up. I've stashed a fix on top, which hopefully
> will be in next tomorrow.
> 
> 	M.
> 

Oops sorry about that. I only tested the Perf build and hadn't done the 
self tests for a few versions.

Thanks for making the fix.



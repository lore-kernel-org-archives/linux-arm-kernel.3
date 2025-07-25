Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B223C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDMKZbsNj1pOigcD3OAknDIO20Ymz/IvNYLVkYnxKJY=; b=Gj2SnvW2W1TFHBbu7u/ObN00oY
	jY/We2D8QIHp+mAGuqa75qFYut/CgRtoNwIuStUNzEAdJBxV8KhksH8FlBDQtw93dtzgtQPCkUIfs
	v6PthPJGJVbb9loZlmMMDFlYhhRN2iWoAMBhOF/Ff7MNCe1lDT1FOJ+apGQD4060gUHGYHZbmEqoi
	RRJsTClJ4Md7Xqvogdwu8Q0Q0EcdL2NcezMNew9RvVMNxGwBPb81W14DkQywrfN6ZUKDiPZP4YEkY
	AfdnFGCdPd6yaNZMQls+5I+EmtHBELHCIuvcU5fgawmiF6ylWT+MZwXNqkC9+C+Fawq2AfZsPTBMA
	SS9ifSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEsR-00000009Sz0-1oSb;
	Fri, 25 Jul 2025 09:38:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEpx-00000009SqR-2KVE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:35:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ae0df0bb8fbso11770566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753436132; x=1754040932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDMKZbsNj1pOigcD3OAknDIO20Ymz/IvNYLVkYnxKJY=;
        b=sbxwbhrIp0NeABzo/NOULZmVL33vR4i5ENDXYOphMe4YytzCsWq2NS2/PlnziyqSY6
         k77S07tfT/CkSiQazG34uhy1uFZRxGKt8lrSRN3d5xTgXJ0Pk3PGom00JciTQywdVvKp
         2NMIGxvQQdbld2XRnNJUT+c+p7nbWS2umsoaRGp0x3/xMEYh5sTI/1Pz9hVOWGfx8RgC
         ZvRKTGvjLhPfniJuePxFxlnC+CKDyV5CgCj4FNJDr0ZqUmXVi7CePR7Fd6IA87i8PEHD
         a8YOlerD2tBVrIBOv6+SpRmK1BIp3/OUA9uWLMT5MWQ9k6ezgxBNX6k8VvEWy59lF38Q
         quxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436132; x=1754040932;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDMKZbsNj1pOigcD3OAknDIO20Ymz/IvNYLVkYnxKJY=;
        b=QTIzCSPqPvufeV+1UQulTntImrFw37+pU5vh+XSAJN+UZ6dK464Ii3uL36CLaiFREK
         wDhfLxcoODLhuMsVlAslTK3u7UgsKBgQerPsde74Pp9er2HGcd1kAy/wYVJmn/fQ0Qmi
         G5vUm3zTN1ncqkG6wly2+qsU23t807mtMyNBqu32CenMVU641s/LIHf1jwIVimRGFwM4
         5yDkYWS0uMdoyQTxO4jIkEUvFaZW/+TTBdKAhOM6w+9qYVjABin02NJfkLCA2Ks7uB53
         uaOKPth2I4PZKeGVWweOKk6cDvX0lkc4c15XIiJC7QZyYKSIDrVs0Iqs5ygzAqcW5T42
         TlXg==
X-Forwarded-Encrypted: i=1; AJvYcCWM9kGuZAvIrNw4249reR/7ys5E7Gs8NtgJIPFAwf0puqKO7y5fdge3jOYjzJWK68Sx1Fkl9jdHQOYJIsnSLhDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa5zKInB9W3wqcSgP00mguw262exgcX2a0JTntOeI4KChFPaaM
	oJFiTczJer73IYsWAcEgfFjNKO66g03LbGWGNZKz/gtitmvUJXw8vWwoTmfZl3EL7tA=
X-Gm-Gg: ASbGnctskH+iSUcyYkAeE+sTM04FOYlKnBZx4m5WSJoCjFx3F7NOcP9T+a451FFJf5J
	uYm8A/e92QAQ5HmmWdOgF6SKfDxY7rcHqNOo/5/mbU0d9WnithEFH9QpVHJLGPBlpkGfcI/Nig7
	GPTyhPPBFvzRBEbxdA++IQtd/xQNTYensu4LLnOJwWBJaVvwA9TKR9ZMAXIClZqdgJ2hr0HVvRA
	UTOiUXdRk1ScG3LDmDsyU0SfrzIQa3vvKO43vQKKXB0sF7VMYpvpRr6ZjEDw4e9U7UeRppP3qlW
	ZmbeZlA60PrD7+rtMZXKqxMDyAifFOh/mhqeUjdpbdSsLtbZxDbGiufwu6rrk8GIZzZhwBs4FqH
	yl5HVRiH/TPLb2UuKhQj68hPhwkhNch85rZg4OSTP5A==
X-Google-Smtp-Source: AGHT+IFjiVZZ32q3obKsi9AEKl2X0egSMuZxDmapd1JUsHMLJYh42zTLmdtEZlJiYpYiDguGWh7Mzw==
X-Received: by 2002:a17:907:3f98:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-af61d37bb30mr56205366b.11.1753436131668;
        Fri, 25 Jul 2025 02:35:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44dfa7sm244121366b.82.2025.07.25.02.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:35:30 -0700 (PDT)
Message-ID: <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
Date: Fri, 25 Jul 2025 11:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_023533_612525_9C57543B 
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

On 25/07/2025 11:28, Daniel Lezcano wrote:
> On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
>> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
>> support") introduced section mismatch failures.
>> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
>> mismatch from the module conversion") replaced these to other section
>> mismatch failures:
>>
>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>>    ERROR: modpost: Section mismatches detected.
>>
>> No progress on real fixing of these happened (intermediary fix was still
>> not tested), so revert both commits till the work is prepared correctly.
> 
> Please don't claim the fix was not tested. I reproduced the section 


section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
missed (although if you have warnings what did you fix?), means you did
not prepare testing setup.

> mismatch, tested it and figured out it was indeed fixing the issue. I 
> just missed the error because it sounds very close to the first one 
> reported initially and I did the confusion.
> 
> The driver is not supposed to be compiled as a module on ARM32.
> 
> The option tristate "Exynos multi core timer driver" if ARM64 is 
> misleading. From this change, the defconfig on ARM can do 
> CONFIG_EXYNOS_MCT=m which should not be allowed.
> 
> Before getting wild and revert everything, let's try to find a proper 
> fix for that.

I am not wild here. The issue is there since 9 days.

Best regards,
Krzysztof


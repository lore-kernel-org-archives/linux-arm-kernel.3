Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57D4C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wkf8rb/WvEcawzV/eYsPzEKfwzwmCl8b0fe0pKNAHM=; b=fRY263jn76BpUyZZg6vunaZ530
	YGvI/ZF6R19bBfQIWdeiDY15YMbEhSptVU3PEibHbExEMxab0LVWI5zvC3lKX3JNAM/wIdGm4ksZG
	3GgqqGR7S2tvXAQEIeQqrc8AzN9wzJDgURgnKgXw3O3aUlnn3qycj0aqTBEN5GjMlW5qeE5xsd5We
	XcAJ8EZwAPyPH+FpdWfenlQWvN/K4lMYO/kaJ2v7FP+Y/ccL3Rjt7Zv4K9QuzXHWEGX6nZvMExgPn
	xa00gmXZqpx5Ll7NeYzqqkxX/vV3kPzJD9tC1F8Ncrqo80XStO0Z1rX4Ya4h12Z+iQMfr8UM2qZk4
	R3h3DO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEp8-0000000Fir6-3aQK;
	Wed, 14 May 2025 16:19:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDUq-0000000FU63-2jkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:54:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5fd32c133ccso5512503a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747234451; x=1747839251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wkf8rb/WvEcawzV/eYsPzEKfwzwmCl8b0fe0pKNAHM=;
        b=wGT81Z+C1O9B8sR8E4I9kpcSjRQL4JOEZUrh+R/LggTiTADkZqutdcSDoifmG5tgFP
         /RGcKfXsGMS1JN2rb2Ik36usd3mwzWzr7x37a6fc+JY7ZWwJpyhVnmffw+788GWvEp/H
         wC+4YK+Rtzwf7hlDbAKtWbxnPDkL6hnjKJTKdy5J19knSLjV7zCQqaiplyLgNVH1o1qW
         nMuaTP7Xj45FOmhTAVpPlwqZMqqzLT0czq+QP6yUW352eLDP6K111ZZXJ00b0SsRc04l
         kNvOeX4ohvSHHuo/jeQB7Jx3FmORiilybGyLRD2SEks9BORn9FZYmHPuMx3+LIDJlDqi
         gw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234451; x=1747839251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wkf8rb/WvEcawzV/eYsPzEKfwzwmCl8b0fe0pKNAHM=;
        b=VcCMMXXIkBydAI6iPQGYAJHnQxBi7hyWL0rGMZIUshl4xPElOqSx7vHESfyv98z5I9
         DMzzXqQ1V0EuxB2RWbUksMUyPUjdznRvgSsYDwtJOfSMvLB8az1fOl+w+M86iceaG0Ds
         UWhHxXGkq6A2SEL/uSXdVqu1JIfpZ0ENmF6qMRI/P4jW994fQa60QDDPA42X0eeYIzwR
         /fZNOE83EsNGaRfVJwXCkHMYmG3LlcOWvCzrvWvAAJnIz17SZqq3mN/YkL6yqvgJFACk
         SS4CK5VtGIcC4X0rkm49iNTE23hiUxr8cD8XQwud2U8vYJd3RVt/ldzTkl+Hb0rfQUIW
         pM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXdZ4Okx26bR4w8AMODHqkZ5V7gQE0McamLqR2iVw/74s01k0L1HfeBrRZYF9MYHdkX4xUZW3qXF2PdzHHYonCN@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8BQ1pE7/Qmo11QAS+M2ujeMVi/Jjlnn2JcsyB6NTRG7lBAK7
	CnVNRpJK1oOQwxpWXPP/THJy28uDuok8FfycwwQv4Ruq8lPMYWGL2OVsP5fKO2Q=
X-Gm-Gg: ASbGncsnFn4hgmpFVt/GrC7Usxuyk70fIt8in6GvtWT06hMddmbYes9E4+txN8zWWmk
	xqmwlXC+IU3rNSOOHAWaCmYGDr1t0JrLWAJazr5jr/HD6WPplgmUa37aFt28kq1THlvTc0tVJPz
	lfPdaLrNsimSCP/79ChmLdLvf9/hLVct9uawlhg+dQEEXSmTleG9F4x5Tr0VSPzqnn+4t4AC1mb
	BO71IhhZsOUIdBioId6+dVcDhq9vGySYIS0tQC1xO+l7U/QsmcsjOlvJgYVD6nsy2B+Dy7bEUJn
	y0Q40gqjHtBz+pzJD1U5KLz8KvUrNsDJTfhmoiTqX8kmbEkN6QA3fNn7emndM715cyhZNW5cQwV
	6Og5tGF9eRA8k
X-Google-Smtp-Source: AGHT+IHisVoXhE3+Euo/Kfj1mcUaVq8+QWNTO5B+q59E7ELxOHelWmYLRUFGUoCsEikCXUP0Pehyfw==
X-Received: by 2002:a17:907:9727:b0:ace:8398:b772 with SMTP id a640c23a62f3a-ad4f7113f45mr438476666b.14.1747234450892;
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bde09sm944356866b.125.2025.05.14.07.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Message-ID: <bdbf5357-beae-4e01-9a9e-f02d21f30eae@linaro.org>
Date: Wed, 14 May 2025 16:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Alexey Charkov <alchark@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
 <aCNqCrBqGSxRGMKd@mai.linaro.org>
 <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_075412_701667_C02D5C09 
X-CRM114-Status: GOOD (  16.80  )
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

On 5/13/25 18:08, Alexey Charkov wrote:
> On Tue, May 13, 2025 at 7:49 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
>>> Rewrite the textual description for the VIA/WonderMedia timer
>>> as YAML schema.
>>>
>>> The IP can generate up to four interrupts from four respective match
>>> registers, so reflect that in the schema.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
>>> ---
>>> Changes in v3:
>>> - Added Rob's review tag (thanks Rob)
>>> - Rebased on top of next-20250506 to pull in MAINTAINERS updates
>>> - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com
>>>
>>> Changes in v2:
>>> - split out this binding change from the big series affecting multiple
>>>    subsystems unnecessarily (thanks Rob)
>>> - added description for the four possible interrupts (thanks Rob)
>>> - added overall description of the IC block
>>>
>>> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
>>> ---
>>
>> The patch does not apply.
>>
>> --- MAINTAINERS
>> +++ MAINTAINERS
>> @@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
>>   F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
>>   F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>>   F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
>>
>>          ^^^^^^ those bindings are not in my tree
> 
> This series is based on next-20250506. Happy to rebase onto 6.15-rc1,
> but these will result in a (trivial) conflict when merging the
> different trees into -next and to master. Please let me know if that's
> better.

Usually the conflicts are solved from bottom to top when trees are pulled.

If I solve the conflict at my level, it is probable another conflict 
will happen when the tree is pulled

Please rebase against v6.15-rc5

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


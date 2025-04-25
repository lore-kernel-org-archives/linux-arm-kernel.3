Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA1C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=; b=e3TfgxpjU2jq5iRPNmrGInE9cY
	M9EQ+RHc9c4eQOSRXxT8bM+Y5Fl4UzyQ7rgvs7BczuIpL2zKGRoUu/LlVfuu/6XBYP2z361mNwivr
	RrCf9r1YvFJEkoayRQLCPt7fmu1tBTUnREvgAQl6FkiH7G3ZOOVfHN6UY0S8I3dJB+MFe5IHSqRl8
	Jy047VjP+MKOUB+RSY+5H6LOs22jWrG/ecRPVM8IhFZek6U6ipONU4tlkK7hHllB738SuVQo/2q7H
	jGVi3TiwGZvH5GlIRrEckeQuMlE8j028+4idAK+QWq+rChXh9nK3anu7QFnZSErLgO7AcQ0Pr9h+o
	ol6EpjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HS4-0000000H0GI-44De;
	Fri, 25 Apr 2025 11:42:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FFm-0000000GWNc-2q9b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:21:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3238133a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745572909; x=1746177709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=rL5n5fEEaMgd1HKUYUAptnfET44ZcXAwR5DbavkxPb7cOkuxEQBmcPyWaOilGToQ7J
         H07aiTueO5+QpDd8/h6//eUSGwXTWertBFFhLDRDqcMXTP+U/siNJwG2pa5Fgig0EixO
         vLeYiR5sH/PasQq25Rs6kEbEToCj1pr/1cYVmzFOBGHwYkh85mXEqYgSxs8y8TMFiIJB
         hs3qNSBapQ5c5k406xFymUw0ZgHPJcMoer5ilpPLU9gNUBlezvnyoYUGkp4ItsEXPkql
         Ifsj5Bs71FpzM7UElvg6JRDi8Chc5OdiXh3OIWpZcULRXskJ5U3hVn4smGc1BnP/eJgb
         +/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572909; x=1746177709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=S5YJpetdepFqaMr/3ee43fhe7xlUAvb9NwXddIZlqc5E6BIYhdTV0IshYy4b3AFxMU
         0jtIZYqGUSitB/Ek1/KtNp2a4QIMhPgvAPLCvFZjeZX80+xLR+yCtUi7ZYOM0K/CoZK7
         8VSj5k5YRu42ttxRYx+JIfNPaQARtnQkOAImDpOJ4k9C6oXdCAh+jdWOwr8UCTXwedav
         AkhLEXDBdAHv+yQjV98Igfm4tlKJAFEuQKBBgDpgybnkAIV0T4/iW+MbQU8YU/KnAMw+
         VXtixQZMYwIs1WYIqbADakCDHn1JCekYWdR0bbPwKXolG8HxvpyEFSEstyGke8DJaFXW
         cWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXys7Owoo34UGbClziwYFn1cZqghtbDFRz9XftkySOYVwTLHCA4DkbAX6jl9sYl72lNwlGYZ8jfjWAty/4vnyGl@lists.infradead.org
X-Gm-Message-State: AOJu0YwXOb1ja+ziM2tj91YwikLMBVbfg7+n9YaZ9sYjxHXiNdHX+j2U
	AYCTHh4OTEWe1tI/LQaClSdCH1HHQFFqvaz84zFSea7Bdw5aL/3IEivGvq81Jnc=
X-Gm-Gg: ASbGncuOyqzkocV6wU96hKNvQYn8hcVVdyQTbRBfxmoFy7zOBsWHWJziqqVLXqB0XKL
	vwDh+w6ldlCEFhA0Zxkcq8qv94BN6qLwiJkaQjFD6I8NQAhyrd2mTea5M2CLMRids7NYEeMmecr
	tPMlv8Px0fWo6tdZ1dJds+eZDyEPlKy1K59jTeCyht0h2zmT86ylW84qHXx2epx475H5qtBgmXz
	sn3XQ7ez8dVFurh4wJaJFBubc76HRwEMyM3GC77OwM5VW7NIQFRfn7V2tcEwZI6pkTyTF9M+1Bp
	ob3pLfZIGHREtwwkorKWyZ2K65u8XPsIyOH1vzsUjYcHT0Kt8w==
X-Google-Smtp-Source: AGHT+IHN1tq8lZGPw+yObmv5OBFBiAlAdlprz4LzswEniu88fbB371A57pfYn5r7p7hN7qREYYhCSA==
X-Received: by 2002:a17:907:9721:b0:aca:d5e9:9ce with SMTP id a640c23a62f3a-ace71047947mr108851466b.9.1745572908825;
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e726dsm105543966b.40.2025.04.25.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Message-ID: <8b222d93-927a-4685-a44c-bdd5d7b34c74@linaro.org>
Date: Fri, 25 Apr 2025 10:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use typical
 np argument name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_022150_737551_F0EE30BC 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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



On 4/24/25 9:33 PM, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> While touching the lines, change the name of device_node pointer to
> 'np' to match convention.
> 
> Fixes: a8dc26a0ec43 ("firmware: exynos-acpm: introduce devm_acpm_get_by_node()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

thanks!


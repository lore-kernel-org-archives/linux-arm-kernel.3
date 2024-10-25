Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA61D0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWlbaIJ0hi4JFbHkI72bLaNDNUhZfU2viW5MR4J6woM=; b=BA5B+voiKkp7MWoVZedTBzd+zc
	t2Q9WpM8pMnW4xTP/oGb030mRUDsryciafNIBvV6isSO8Pwbhz9S0GQcGq5QawbtR33dV3/hq5DzS
	n7WH0cYRvvUpOlUHPRfFi+pJ49c8g1157rLESpMpmimOJOB/NnWMdMidG0Q34sf4zgSMdgZaUpc8u
	BoL5j3F/0Zm98aWZL46BMQjLnr+nCWuCRzpW8s4TkGKEvJG35oYDOhj4cJRxqPbAvnaW3mM6LT8d4
	bz8/ncIZi4Xxn9Oa0f8HaO8iBklegq3ecU0T1CEh+vyemHJlvGbDaWK3+GK9vX41i+HQ7EkvFgr2p
	pCq1n1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HDX-00000003ImX-0Dlk;
	Fri, 25 Oct 2024 10:06:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H7q-00000003HQL-1P0n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:00:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9932aa108cso280793066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850457; x=1730455257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWlbaIJ0hi4JFbHkI72bLaNDNUhZfU2viW5MR4J6woM=;
        b=PjvAOdbPWvuYhYBDw7rIsqqcXz7ifSapuYkZcQP0jEKlw5fTuSCO4tXIJFJrDwCqpA
         9XHUgOz/55rEIvnJ5Jq2pKo3a4gqKNh9IoB/s+7pNM8BAXHQKPcphmF7kLugXUy6AnFL
         Q1k6IigM8sBOnetSaMhGb1cLPCNyDjXK6WTMQtNbrqlh/Y148hrJBZ939WCAihi4ptci
         vm1st9YbKw/BCB6qN/5+V4NK+PvEpLTn19xTU23TXo+aBjuykJSRJ9ActyioHugNih38
         GCSaJqO3uUUVG4hgi3y87+qOVa6OaUb4YeQfK1K+jC6Y9srNUkBsraf+HgZ9AKWgUUXR
         d36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850457; x=1730455257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWlbaIJ0hi4JFbHkI72bLaNDNUhZfU2viW5MR4J6woM=;
        b=jB7P73bEfrtXfPWtplJmPxtN2XU5xCqPJbyKJjcg+o0KqP3XkBRubmWGNssDSK8zdK
         4nTijyRSYkwoOyyqOsyGN3nb0PF4ugbL75Fn79yF67BkQhxZMflXifYG7oyNFYyJEjwb
         vlfXTwc72nQ47znsf6t+X5xfXRQxpqwhLx63TscH0I8cjVOkZhsZGXxaUinG8GfGQ8bi
         Qak3tFUEditrVrkVqf/Gx3VaWOXsh0oVh95b/5Y1Xa4PMazStYCLpRbn7VDz9iZspBJO
         6bf3c+FCtvMix2IaXHoWSeTDHra2fpyXTv452sPToxU2yGydczkxmMYf0JbDQZhlrKHp
         JiKg==
X-Forwarded-Encrypted: i=1; AJvYcCXRL+Cw6nR3yMouoBias2XFi5RUg4B/wvIYxIbtAGUic9A5UbOMsv4aItIXDi7T257F+Gbt8bIi5Url9s1ZdCOd@lists.infradead.org
X-Gm-Message-State: AOJu0YzvUQEhnch2cH+GnqKLFD1NM38+CLFe60NKlz5Bg2/6nS43BreR
	KR69dv+yAn97rDWXHYZBkK6BYP2TQ7YzkR+uUkx8awHRPU/ODycl81y/MC7kq5s=
X-Google-Smtp-Source: AGHT+IFdts21GtnD76VhDCeCjho+8OH76wrvaoNYV2Y9mWY9mltExz6Sr41ezR5Fkxr73yIvhagmJg==
X-Received: by 2002:a17:907:6022:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-a9ac57f9ba5mr450700966b.2.1729850456437;
        Fri, 25 Oct 2024 03:00:56 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099df78sm50972466b.158.2024.10.25.03.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 03:00:55 -0700 (PDT)
Message-ID: <88800ef0-2fb5-41f8-a303-e149ade7ed47@linaro.org>
Date: Fri, 25 Oct 2024 11:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
 <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
 <d91109a1-532a-4b95-ad4c-3b9cf8e3dbbb@linaro.org>
 <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
 <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
 <855101b0-0102-4c77-b110-bdec12b28f29@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <855101b0-0102-4c77-b110-bdec12b28f29@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_030058_431047_97C14D22 
X-CRM114-Status: GOOD (  22.00  )
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



On 10/24/24 10:36 AM, Krzysztof Kozlowski wrote:
> On 23/10/2024 11:53, Tudor Ambarus wrote:
>>
>>
>> On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>>>> read/retrive the channel parameters from SRAM.
>>>>> I meany tx_base is always 0. Where is this property set? Ever?
>>>> It's not zero. My assumption is it is set in the acpm firmware, but I
>>> Where is any assignment to this member?
>>
>> In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
>> struct exynos_acpm_shmem __iomem *shmem;
>>
>> Then in:
>>
>> static int exynos_acpm_chans_init()
>> {
>> 	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
>> 	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
>> 	...
>>
>> 	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
>> 						 &shmem->chans);
>> 	...
>> }
>>
>> shmem->chans is not initialized (or tx_base). I'm using its address in
>> SRAM (&shmem->chans) which I then read it with readl_relaxed().
>>
>> I guess one can do the same using offsetof:
>> shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
>> 					      chans));
>>
> 
> I see, the code and the naming is confusing. Two exynos_acpm_shmem_chan

Noted. I'll refactor exynos_acpm_chans_init() in the next version.

> variables and one exynos_acpm_shmem. shmem_chans is used as an array,
> but nowhere pointed or indicated that it is array of some size.
>

I understand , will update. I added documentation for `struct
exynos_acpm_shmem` describing the array of chans and the number of
chans, but I'll figure something more, to be clearer.

> All this could be clearer if exynos_acpm_shmem_chan was packed, because
> then it is obvious it points to defined memory, but maybe packed is not

__packed shall be alright, but it's not needed because all the members
of the struct are u32 and the address of the struct is u64 aligned.

> correct here? Probably splitting all this into logical chunks would be
> useful. Like not mixing reading offsets with reading values, because I
> really have to spend a lot of time to identify which one is which in
> exynos_acpm_chans_init().
> 

I understand, will update. Need to figure out what other options we have
with the mailbox core changes first. Thanks for the suggestions!

Cheers,
ta


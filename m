Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DF1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlUtBVs7mVLIbrf7opyOhCkogChwruSdb2WYQaTp8x8=; b=kOXPpnYbvzocjcJ4MfI+PWP1aX
	6CO7+Cud/EWFkTzpM8nFTYKXqnalU0iSlX8pPIyjhv4oO+NFqaKYcPcpFZStbGuWh7p9Ity7yjFMG
	vfXOnJu61LgPOZrTJx9wrXz3HfgDv8Aw5pMeHxMKkZZbnFWu+EDyDpzRyZ7QHzW3ruOzBHd1l5IN5
	QdjVgJLkZgYSC5WHqRwmlBgXVaw9LJurDvCkKBb2hhmD2sTAvpQDrV7Kn2aszZIw/njbqSz4Ym7wJ
	TGu4v/EefqiXYXyl85Elb6PmjknupQ1GLfFS8AgPBCe17pFS6vuA1r/TDl0s9poKCOx34FqG0GX4H
	CSf5t15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueq2t-00000006fN1-3sOi;
	Thu, 24 Jul 2025 07:07:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepxt-00000006eoL-0jMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:02:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45629703011so3828945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753340523; x=1753945323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlUtBVs7mVLIbrf7opyOhCkogChwruSdb2WYQaTp8x8=;
        b=TwuqV79OGQcxd1avDALakCnyF2pA4trCiqIpSeClAlj4q5wl+bRsntIBAzENUBEhB9
         ct/MurQNtxV+ZqTV6d5fm79mfJOt44ITfCmOppL/UW27NCMP3Usdl3OmvkS59LVfYv8y
         ZodPku82/L0Hi3KME4x7mLRWPSS7KzbySCPSyFhy3pm5MgmM0xRTedXevr+/+7Jyr2Tt
         uFPZ1iiPjR8jJ9XIeoYQRhAZ+4DAk6Ijpqf4A18M19fTcDcLS8KurGhQz4KV2hwnwelU
         pGA2HoZb3waSEroOBKb21+pzMENjZAZqjQLpYjvm3rRL30bsmzyN2SHcuSoHsmh3+YRE
         d2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340523; x=1753945323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlUtBVs7mVLIbrf7opyOhCkogChwruSdb2WYQaTp8x8=;
        b=u9uCK+4stSOs7t8u0Wpff11hejnHkvjDO0RQdtAFIydyu2CiZKG6VafpI//2VQkyPj
         LC36EqsFdvxxc8Irt0HKeTkaxwGKGApqZK6iHsAOPG0wDVj7t1KaCWs8RBQ1FwX6wXES
         vp68Eegp5Porkn5mQvXlzmd15Bsnq216zP+B9FpuW0rmDdx14q55Nr5fmX+K2/QbizSd
         NTM2uZw9G+JqmbY8+PhZKLbLu+BJasgHy/m1wZKMYQivqIBKyhw1wnO0jlLycQJeZkw3
         ZbREa78MnDT8zSIDFQHz6aj0pIIhaaj8qq5clAoB43UKcFF4PGetlCNtxV5smcUnnpHE
         IJGA==
X-Forwarded-Encrypted: i=1; AJvYcCXuKiAhHXXqQOVEu2lkkWZ9kjB20WMFX6CkUpRAFuYioQ/d5yDz4yosiZP2r35+Cjg0wLYswHpj+1vKR8tOw20M@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu6hZyB3NvNsaTIFLgDkBq0yCIJ7n1y8x08je0iZ1uYVSql4Zi
	QKzdUX0s+AtRyxzQ+InEHGYFlvUM0fVlIIP/c2uuDfV9v6qHrrrBQ0XO
X-Gm-Gg: ASbGncuyhsRyBB9BaVk49tJ4yot/h9Tywtmscre9MmuvZbZrS1pLm0hRGyQzAcoYdJL
	+g/s8eDgAX4+WVJEiYmgnxB+CgREVZO+oF5vi+uJdQCw4Pb9SjyvDsg8fEnUGblr6BMVBWCH4UE
	pXSwpo6K0z/vDNgYFq9vNcv5dUmVad6TKEtrBI5icSniqRk0u6tVlxdT3ICZLBjaIHdKuF+MjKG
	aEln+lQXiLe6fRctP9aYelY+UVMWjdo3pTB0QSyuRyLixecWGTjZ2M4G4zQQXBuNxDBWceUrTWc
	fe+eOwESpCB7cmNezJ1Zd1J0wZK31JSCxwi6Inby4Y67fAghNEcDjuDmxghvS1z8VwAphuXujkJ
	2WC+EXeQfSr2eMC4F3jF7Ef0FK8MLDpf5uXQ0kJZ+/DTsgN6Bg+wPhzb/etD2WHp76vym6CftdA
	hTFXAih4ns4Qg=
X-Google-Smtp-Source: AGHT+IFGy6HODxEH7/PmTdmL1a3/zjPLMsIBH3rq+Xq0Tau9JAc9/MY1EEnrW2AphA2h+4ON6UFPxg==
X-Received: by 2002:a05:600c:a408:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45869e4b95dmr39641815e9.18.1753340522595;
        Thu, 24 Jul 2025 00:02:02 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec79441sm9982835e9.2.2025.07.24.00.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 00:02:02 -0700 (PDT)
Message-ID: <cf7030d4-a686-4edd-9698-1a9c301d1dd0@gmail.com>
Date: Thu, 24 Jul 2025 10:02:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
 <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
 <fbe025c9-2688-49f1-bd94-2cb0a1bbc8d2@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <fbe025c9-2688-49f1-bd94-2cb0a1bbc8d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_000205_215466_52A39D95 
X-CRM114-Status: GOOD (  13.60  )
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

On 7/24/25 09:56, Krzysztof Kozlowski wrote:
> On 23/07/2025 10:21, Ivaylo Ivanov wrote:
>> On 7/23/25 11:15, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>>>> Some device trees, like the exynos2200 one, configure the root node
>>>> with #address-cells and #size-cells set to 2. However, the usi binding
>>>> expects 32 bit address space only. Allow these determining properties to
>>> So if USI expects 32 bit, then why do we allow 64?
>>>
>>> Switching this to 2 means you use 64-bit addressing for children
>> I don't, but the main point was to avoid defining ranges for every single usi
> I do not understand your "I don't", because you do.

I meant it in the "I don't _need_ to explicitly use that, but it's _nice_ to have"
way, so I don't have to clutter the nodes with address translations in ranges.

Best regards,
Ivaylo

>  You change the child
> address space to 64 bit and switch to 36/64 bit DMA. That's the meaning
> of address cells 2.
>
>
> Best regards,
> Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0262CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na0sRM1JzNDX0cAD9RNRTd0BRFOVeZmTu9S+7uFIpUM=; b=KLtMSKN1nzOZ4SF1KX0PjGLdPl
	FI+3ZJAaUp/QHPVd5RWmiYSA0huh3N5TTLgYhcePZlVkn814Vln8sNEeVxhzI5N4X3CXWs9PFR3lw
	m28aalo730InWRjiINidw5OOoC/oUieiYRapqHBMrA4prJzbBZ9Ll5QOL0fAI6tmF2x2oGFhNybWa
	GurRel5XTc9TkbtobaVlQEy2tQv7gPXrKuE2TkAtp/ILM/gS9NfYhcmc9vwNyIZYmJoUqaiiMHTw4
	83O6Tzx3kGbKLFwJKZk474Hp9Ayvj75lk6Bl1h8Kmd7tELdMhqon38jySfnvTfBbLYQJahWmmqeIE
	kdv+nctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuA-00000008Bno-1hee;
	Fri, 12 Sep 2025 09:17:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzu1-00000008Bkq-3Rqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:17:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45de4ebe79eso2336485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757668628; x=1758273428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Na0sRM1JzNDX0cAD9RNRTd0BRFOVeZmTu9S+7uFIpUM=;
        b=zoZGEmmDlw7z0aW0itIyP2RWKoDzIws+W8KkeAEaMb7upY85dF1Z2qXRZiIK6hj8vY
         GBVKtlW2WXOgEtjO7+SwCNEnIGhw5NF5aNp0W6WddbBXQF/CrtI+K6+w8vjB2YZr+9sf
         1GmcgpUpwvMTcK2Nw/rbc6oIYWIod3yiXdM4mQtpUshkSmFj3tNU8gC5a32EVwQFnnNP
         wqCzWS366/0FUWkV2M6RRhmbDYFTpjhZ5K0RF89KGAYMfjHOFYTlsloJRuKfHkNsDyfH
         1h82SmEV10ftEbmWE9QU4FG6b4Ece8HQFwJFpQHYtgbrwtduDasSLV9c0uIxyu2ImNIl
         Yn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668628; x=1758273428;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Na0sRM1JzNDX0cAD9RNRTd0BRFOVeZmTu9S+7uFIpUM=;
        b=qRmPDSauoEBeMg27wS3j+EsRO2Ke+v2GmWs2PfM6QrmyD71I5gTxa33k1TrgFqASyj
         Gpxp+AJKwXetN17bnJzRpOLfCWd6vdIwVQTTsYUXVm1729MPsull+BYQvuTVZ2kicIul
         iaitVOjXYMGxsHgoGIUK9ELGlYvt174ozs6woq4vTjI3qnGijzDjPoW2zURnrbeRim2/
         5u5zM1+4bF+WxEawoMU2iQEQoXSFjX/L1lOqddDbbG5EJa0Pls/7/yQgF41U3jpl79KZ
         +mD8kKXW/KxkND232PqshMOpKK8ldhATxTPrM6FHJwqq0Iv4aevx5+pHetSd1Uwn+jPI
         wIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLurh0f8FtluIPrGqprIiiWguopbYQ/B97zc6HXH4MQx7fLROQuouNh/BUdIOuwFoqaHxGSvXlWWQ4oExOh5+K@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2aXrLO5H6HgV/4c4w8sRn5BK0Z4NOT1pQJwihSS5dVvanLhO
	09FSZJ/IaT1tPVfrmcmoqgfVOPoy2vRI5zBFX5bow9vEk3rOOqT3NBD0aYqaKDgTczU=
X-Gm-Gg: ASbGncty3RoLB6SRXrxGgKcad6+VKidXuZHAXzils1CjKMNSpcVapZAHUzA3DXgK8UO
	6iOyAyUgmaLc2Dmbr/Z7+TRXKmZBkuhVGpMFfKCNt0EMoA7Fn+1O7LVchcxrlxfSzGSCxr/nLmQ
	6Q1N9U27xL3hOSj08j7sCNbBUSh+iWw9DS0suYuwLXJwSiehWKRjGwvlaK1LESePqfcraNSbEq8
	vrMm2YFhsO3F66RhSW1mycvABB8C3IiRsKLtXDQiem7yEbLdpG7HPQt3RKBVwW4GsEbHvSWopbY
	LqWymGz4jmFY7AW10EmDmCFYIz/88PetqljDX66RdSRklWToTuabdv3B5ep4PCSeJuy9taiJp1F
	0Zpk2ZhK+HkMwzANZL08tjnHMlAlqhktuAg0PmpO/9jM=
X-Google-Smtp-Source: AGHT+IHTCW9xZs8Bgrgtw3py8hA8Nlqz8Jk0NP4ZX+1dPY2l87YZ77GgC3GQhGAE7LZOnnpcJM3huA==
X-Received: by 2002:a05:600c:c165:b0:45d:f7df:26e8 with SMTP id 5b1f17b1804b1-45f212095e8mr13275895e9.7.1757668627916;
        Fri, 12 Sep 2025 02:17:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm32051445e9.2.2025.09.12.02.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:17:06 -0700 (PDT)
Message-ID: <52714c33-5bd7-4ca5-bf1d-c89318c77746@linaro.org>
Date: Fri, 12 Sep 2025 11:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Devi Priya <quic_devipriy@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
 quic_linchen@quicinc.com, quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
 quic_suruchia@quicinc.com
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
 <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021709_900590_F5E863ED 
X-CRM114-Status: GOOD (  10.90  )
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

On 12/09/2025 11:13, Konrad Dybcio wrote:
> On 9/12/25 11:13 AM, Konrad Dybcio wrote:
>> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>>> provider and an interconnect provider. The #interconnect-cells property
>>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>>> the NSS ICC provider.
>>>>
>>>> Although this property is already present in the NSS CC node of the DTS
>>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>>> omitted from the list of required properties in the bindings documentation.
>>>> Adding this as a required property is not expected to break the ABI for
>>>> currently supported SoC.
>>>>
>>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>>> binding requirements for interconnect providers.
>>>
>>> DT bindings do not require interconnect-cells, so that's not a correct
>>> reason. Drop them from required properties.
>>
>> "Mark #interconnect-cells as required to allow consuming the provided
>> interconnect endpoints"?
> 
> "which are in turn necessary for the SoC to function"

If this never worked and code was buggy, never booted, was sent
incomplete and in junk state, then sure. Say like that. :)

But I have a feeling code was working okayish...

Best regards,
Krzysztof


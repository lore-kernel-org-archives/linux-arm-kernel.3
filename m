Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yKyuCdjvfHTZC/Lr1XyLH1f+wAtJ15tCU/+O5Qcke0=; b=Q+gDCagYfexCc5z/j8wlEfnMjh
	aMwdhh1xclfBgsed8cY6MwKTTvTZf0SzqKu4QFVE9XL27Cmis3awR2ss0c2ZegIXT7RH2RQ1ai4jY
	wdC3JezMHMoViRgv9Dna2NQ1TjzgkPloGAKfvf9gCq5fBBxH8b6A7XNKaj6kEgD52Mumm6yKS8bEK
	TxSlc9W6ACAPmFskoO/cS5sEdmkrDLs//GFiFEvCbRzwJXOjURmkdXu+jtqrlzzBNE18rLIqnhraz
	jAhSdcCVaetztXbjoAroFxHmO/hEj67QjJpsgKhva+MdEKUWsvLHQ/ieP3Kcfag8ou3MNtxt9d8ha
	r/JTQP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyg9I-00000009jba-0vyO;
	Wed, 17 Sep 2025 00:35:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyg9F-00000009jYH-335B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 00:35:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-267fa729a63so828465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 17:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758069349; x=1758674149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+yKyuCdjvfHTZC/Lr1XyLH1f+wAtJ15tCU/+O5Qcke0=;
        b=UsKdxkou0PXnBskzVHP6Ofw/Sid8V2xBi1ifCuCPooskOVk1fXdkXf4cydqkgTpuFg
         aKiYK9GAj0pmXiaxg6kCKv8y37BFDwvf9jzUvbHZg6NmLDD+c49lvX5NW8RxBg0HZ0Ao
         K/ng4BbG0cxxAoJYK3pmxSf0JqJ4yoFT2y/L+nV1CrhThwjQbDMbtqqa0si/PPgLmsRv
         0KAozQe/odYxikWDfuksRY2ppL+3hWztsMgdzV1FWhedjHWSc+ayyyzZ/eTU+978url7
         QK9STdUTZ8h+/ES6aA6PK4f1eAf0ejmgViIji6Cdg8ncQiaxt3DVPSNfKru4E6ZrWryM
         kQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758069349; x=1758674149;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yKyuCdjvfHTZC/Lr1XyLH1f+wAtJ15tCU/+O5Qcke0=;
        b=F7tm9IdA6C3Ub0kqf3iku/bGxQGL7sVUtVx18GK/K5XkM0iHO9rv8/WBVQpM603Ptv
         2wCir2CKUhfRaNG5LO/xyc+wyDwHtJjW3OvAdCqiywuN+UqJyhen7rlbCGN6nizD4QYb
         YWX8SixrCsOFbBRBE0Tae+/SCA+ZckaTK5nx9wL8RIJaMP9aScICk4Psto9r1cw7k9oM
         PrzaR7qyezWKU4OwlXC/dVW9nDoPk/zhsIypWNdS3gdLEc39eqZUOV0L9qLR4+9HQtLp
         ZhMlPnSwtvkchXq2C8I/zgDgoseJuMdnNBIvC+wonEpq0nGcYQo8EGDXy0nNRhM7h0Cc
         BDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRDpT4osMbtuxVO+87jzfZf6dK2NoSh6BXz8kYUnOpiJ9lUQKt8MYTYcvmjcFvs5fbKXuaN7Qa2DIILXdoqGtc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8PRXksH9igQcO1XN1U51+hhmSs7HAaQ4D5Pr22UUnWXM0VxG
	JjIx3sSiMKBjOXXxJXvZVgJ3p6b1TggBZ8T+V5ClhoZA6DkCOyGtSlmwJvKPe7+eDnA=
X-Gm-Gg: ASbGnctaRDlGA4aQNAJlcBEkuR3v5qTpQeI/akX/QZMVMvm4Xqw9GN4Yg9WDdKwUhNM
	0/CZB/Dp27gSUYmcG2INnUH/5ziBKeyVk6A2D5WNvCm+vgYsroMXSR6iI4R0imqs6KuWpd351to
	U/P7G5PvaLGp6DNRBTj8LoooiDnJrS1SE3zOKF3ZnHG05+/g8d0bgiY2mqem+/3ZyYtWU5PSIT1
	JF62lXe5RKPodOnV1beT5670PNPOzu7iBeJ5g5VDS/MUeekkh/mOrnVsManWeA09Wm6J40RZ4X6
	qKb2i6YA1R4eEcMGg+93iFyLYglpsF7F8I+oRVdQ5xJ9u3vMjhGM9wOzI94t8qHO9fQ58b+6iJx
	xN+evnwwRWlX/YyKbTGa79YzEd4gELPVod0BDT1p39ow=
X-Google-Smtp-Source: AGHT+IF390E63ZU9vuARjO+nw1ZUI7FtlCAawkFr1p8xl1+Uo1mLtRWneXPuNPAB/asviLaSXJOoEA==
X-Received: by 2002:a17:902:c94a:b0:261:500a:5742 with SMTP id d9443c01a7336-26813f75090mr1125965ad.10.1758069348416;
        Tue, 16 Sep 2025 17:35:48 -0700 (PDT)
Received: from [192.168.35.228] ([218.51.42.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25fc8285639sm118508945ad.134.2025.09.16.17.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 17:35:47 -0700 (PDT)
Message-ID: <e874339e-f802-4793-8c0f-db85575be8e5@linaro.org>
Date: Wed, 17 Sep 2025 09:35:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Luo Jie <quic_luoj@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <0aa8bf54-50e4-456d-9f07-a297a34b86c5@linaro.org>
 <1e7d7066-fa0b-4ebc-8f66-e3208bb6f948@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1e7d7066-fa0b-4ebc-8f66-e3208bb6f948@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_173549_813764_EF9512EB 
X-CRM114-Status: GOOD (  19.42  )
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

On 16/09/2025 16:03, Luo Jie wrote:
> 
> 
> On 9/12/2025 5:16 PM, Krzysztof Kozlowski wrote:
>> On 12/09/2025 11:13, Konrad Dybcio wrote:
>>> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>>>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>>>> provider and an interconnect provider. The #interconnect-cells property
>>>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>>>> the NSS ICC provider.
>>>>>
>>>>> Although this property is already present in the NSS CC node of the DTS
>>>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>>>> omitted from the list of required properties in the bindings documentation.
>>>>> Adding this as a required property is not expected to break the ABI for
>>>>> currently supported SoC.
>>>>>
>>>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>>>> binding requirements for interconnect providers.
>>>>
>>>> DT bindings do not require interconnect-cells, so that's not a correct
>>>> reason. Drop them from required properties.
>>>
>>> "Mark #interconnect-cells as required to allow consuming the provided
>>> interconnect endpoints"?
>>
>>
>> The point is they do not have to be required.
> 
> The reason for adding this property as required is to enforce
> the DTS to define this important resource correctly. If this property
> is missed from the DTS, the client driver such as PPE driver will not
> be able to initialize correctly. This is necessary irrespective of
> whether these clocks are enabled by bootloader or not. The IPQ9574 SoC
> DTS defines this property even though the property was not marked as
> mandatory in the bindings, and hence the PPE driver is working.
> 
> By now marking it as required, we can enforce that DTS files going
> forward for newer SoC (IPQ5424 and later) are properly defining this
> resource. This prevents any DTS misconfiguration and improves bindings
> validation as new SoCs are introduced.

So you explain to the DT maintainer how the DT works. Well, thank you,
everyday I can learn something.

You wasted a lot of our (multiple maintainers) time in the past, so I
will just NAK your patches instead of wasting time again.

Best regards,
Krzysztof


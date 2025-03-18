Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EB5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duoNyUPDpZ35AJzrwQXSbOfWB68wwqzf/wrWJgrnJcc=; b=TJfrnHbZv7o34mkCAK0LNdDktt
	vMIR7vwSSEHhDtBs8P+FdFF9cl/kz78XrtQ1KLnGabCyc21sr6yhukQWQg/GGVEYyQ5bF6vl7naQQ
	JY3Gxi+UG/gmc/DUYMSGkydoAbKKbTAiXMYq6O1rXYQ8cRF1zOx3w0/sfNB/ualL6w+fXz3LMMzL4
	izTaDwuGWrlRjq2CW7FBpaeP99wbBa+QH9ZGQF7hb1R7MqUOx5s7+LC0uEqME049Fcy07yd4enDi6
	agUBxDvSnTl/API131dpXziqPHCXK5PNVcWOUv9Np1Dhw/579S/glGjkHkMvLwxcNcVd3VHW7dbMJ
	Paitq9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueqp-00000007Ajc-0lu6;
	Tue, 18 Mar 2025 21:51:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuenl-00000007ABt-0YQ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 21:48:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso174461a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742334523; x=1742939323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duoNyUPDpZ35AJzrwQXSbOfWB68wwqzf/wrWJgrnJcc=;
        b=j+gLbMjzfOma9PkLppdxZvddprPYV06Bk83t3IA2J9ktiuYqdjKW1esyK0vZwE/h1E
         wQvPZT2pqLPckgo7y15ZRLrY7gpmG+/BvKBGwfzwJj0rzTlOUnx91eEXZko5RmAMcX5z
         0UOaQnjbQnFGeCEzt6pnCPkZQV+esO/y5PFamqwd1UwzxxOq+EldZnR9ESLoC29qabxT
         aIPSOVkL7n4goFLGNRpRi//ytdzfTNMbavvvEKnRyEmaOBOqWE03d4c4ixdfQ1iXKp2b
         vHcIf0RT0rKonXUUCWPIJCTne9nPG5tveM2KUpNV/wO30v+oyII9vI0uLqyrhVJcfBRh
         hHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334523; x=1742939323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duoNyUPDpZ35AJzrwQXSbOfWB68wwqzf/wrWJgrnJcc=;
        b=wLR5Sr1QCZVq9+YVzpedhK0Q16Q13PHRlgzCtM+QNP7MkDAswmE89gTCuRPjQUt4z9
         W6nuCNYGEQbCMB66g2Swk0uxz2vGaV3v2EsUSRDGNmjJHiTON0m4amBR5GIJTubmiT3T
         VqW81BoO5Lm7TUicKR98CSBT89vfCSmEhkpWeVrKm1o16d748j0Pimpb4hLaEE1gtj+4
         aeJeMhGUYcEziaYeyOo+bqvWSScS1TNMkaM0nSYn8XOa3ACmCdfSxQg4KkOQ9ar5NbWx
         zWHQgk+y1RvGcOWrvsnsNsx8dwsphg3srI/wC0RPjtJqPX88vACJtUNVF1tO7dcZvXog
         5RPw==
X-Forwarded-Encrypted: i=1; AJvYcCU63x8cdWxe9sqHHEUv2JJGWtHRHwNEZmaSlQJbiQ2W338Avjc3GOI21M3pDIhn1DtVNbCCJRL03lstg0XmMe19@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3WO05mLfsZasnvPznQxGFNezctsXVsXLItG2SwwDEaApWQzu4
	H1LECB86FYqm03MzBHmAhUWZUN+lR1tbSLQjQiarf7tBrCE/Jwv6QCYZWTNbGiQ=
X-Gm-Gg: ASbGnctT1x/0Nz73Fh1/LwwMBaA8pwYv6Yboi8wVsY8rgzYJrjGm0mUq3RR2z5eS//q
	faLyjOlbXs1/WCtTwuK/N3tEhb1P1XICLgjYgL07u2BpioN/9yoBBjIJJ8DUkS8sR0IfjMmLhaA
	hlyZDrDGm+QZsx5TDa/PNQelLMvPK0ARatleezrF5TtzIQvAk19xSpBkkhZfrX/TSVBM2V4vvCe
	/qZ0ql8LiV2IZCqeXDM15F7sMjJ7h4U3NtAJCDHdfaH+gWirL+ef4GBk/Fbabov8mr2gipvm7xw
	tOaXT9jH+nXEKtpml4O6LjqdQLpTKRuBQPBkpq/ElsY3i02ku84l75KmLatq+i+RWuQit5qpZrn
	FD8t3EwO/8pC+ekivNdaxCno9m04XQXeGCoe/zcqsKmVI8jdJxJySbBYw51F4fIxqLOO4NiHVVJ
	P9z69YoaobNpidc/CdwEF5hBn3mwGLZBU=
X-Google-Smtp-Source: AGHT+IF06W/HXbWDQcnvIov2Jj/jxhVUXmUlc3LWIaSEPfb9UpbLNwCGC29SRRaa+u05btkXLemWAA==
X-Received: by 2002:a17:907:f50a:b0:ac3:3e43:f451 with SMTP id a640c23a62f3a-ac3b6abe286mr34843266b.5.1742334522980;
        Tue, 18 Mar 2025 14:48:42 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ef34asm921171966b.68.2025.03.18.14.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 14:48:42 -0700 (PDT)
Message-ID: <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Date: Tue, 18 Mar 2025 21:48:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
 <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
 <66c35bce-c657-4c12-ad02-58c995ae385a@quicinc.com>
 <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_144845_186903_145FB1FE 
X-CRM114-Status: GOOD (  15.47  )
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

On 18/03/2025 07:16, Krzysztof Kozlowski wrote:
> On 18/03/2025 06:52, Vikram Sharma wrote:
>>
>> On 2/23/2025 5:03 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qcs8300-camss
>>>> +
>>>> +  reg:
>>>> +    maxItems: 21
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csid_wrapper
>>> Why different order of entries than sm8550?
>>
>> Hi Krzysztof,
>>
>> Thanks for your review.
>> I did this change to address a comment from Bryan on another series.
>> https://lore.kernel.org/linux-arm-msm/e152ff78-caa5-493a-88da-96a6670eb2a2@linaro.org/
>>
>> Please suggest if I should keep the order same as sm8550?
> If you chosen the same order as x1e80100 then it is fine, but that file
> is not merged so it is your responsibility to track any differences and
> be sure whatever you send is always in sync with x1e.
> 
> Best regards,
> Krzysztof

My mistake, I hadn't realised/remembered what we merged for 8550.

Vikram, please follow latest committed example @ 8550.

---
bod


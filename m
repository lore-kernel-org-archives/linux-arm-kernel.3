Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C350CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=; b=muSr11Vcv6ecXkZEpVwWt10L8r
	V+bFZ5j60UhxpUat293LDBRdnBMDnAl5X24QguWGXxd25FOpGRLTJNExln9oZ9TCOmZ7BYKHu73Op
	W3IsePPwjAtBq+lKLxiAMpw84Kex8oUpcaWD2DbAtZx3sAKTqgNu7OBKjlHAX9MtDoT32bns5XBhn
	5qc3k0t6Kw3GRKkkH2xBHmiVV8k0wkH0CGDi73+jD33ZcTmJLQA8MCDR21WMiExNpZD2zMH0s37Yz
	Ohe3Y/JL+ImLOpGQRO8CSCQcV+v+LGVvbMuuDUU8O8DKgXYU8G1s+/12JoDujw3bYx8K99+a4I4Qd
	w4STeW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPp-0000000EGYa-0jHm;
	Wed, 10 Sep 2025 12:59:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPk-0000000EGUY-16XV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:59:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so968655666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509146; x=1758113946; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=d22zSYUsVGneP0U2iua/V5v3l2yi64cGRvPuj+E0nAbt40/VuyExatwMANnWmV6qCJ
         i7Ta5K/EySl3kB8EvsRntJcxdp/frKpykRxzad5VWbgpQ4BBnWUjOqFruvIxuLk4tHUK
         g+SH7VTpJ+YbxJOzQKIDuMYLjK2fP/oQ/CvjTv/QBWyQLHygQNLSTvW6Y2rpu6H48vF7
         1ag2kXAID9W363QOgcysuXA8vPUvy73CNOn7rJjcogCQFmRwrKFMt9Af2Ls7P8hpljiN
         V5IZ9w/M6/dsdMAmzNbv7yhfKwZvm6tPAO4g0n5ANbWxfGYmvkaRHvd/6mWMzwnhT/k8
         3otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509146; x=1758113946;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=VeWOcoaLkZNMRVS+vJB9KEu7dtWvfBRUVewFcVyZTNfEirsTvT12xnd+3qxX6IW5e/
         5GAwxTEXOzgjqfg7j80EfIO8CTSiFrs7r0qrnuWwWcoLnKWNX2Y6KD9R12dxma3wJmJm
         BF+HXqxe0zj7eet6B0PlogUKQ78zAzuIqNj4f2TyWSDm+rcdH3XPkuQH+1H5Jjc16Xma
         gjM2PpSuvogi8hB1VIRvfJtDPB+RJt4EyHZozJPKcTTk5q6LSIvLSh1WoyAa/J7U7hqF
         cC4i7ZRsp/s5jZ62DHwnPl0ruaNLWb/qlpWbFmZqiZ64x+4pnaYF1898F7RIOMbOv5dU
         tTyQ==
X-Gm-Message-State: AOJu0YyuJE6a85IiFX3w+bFTCvJSUr8n+HsbI/CtzqWMiWpEXlJ1CjzK
	vvRNPe08bWvvups9+kySWGMw4xcAFPxGt9ZOUcDjopm+UvPDYWp+ap1gf+2XBrexPss=
X-Gm-Gg: ASbGnct13D7pxBFHsVp32laK58HRSDKC4RxiQCoiHcYdqrFYhBtv4AH7GOtKocdhPMm
	Ya0Z1PWoFJk+O/lkpeQLACiI8e+rtMZ9+gSE84PL0AH5ZM2a2iK/fW1B8xS2BmgEV/BK56p+m7/
	KkWiNTeds/0TkT1Cw54B1zwxXorb1yvSM7qiBioT5GIM2lGsunUd0P2FCipRkuiMPKiR5zV8utV
	6GSD3RDGoRBC9T7CZyr/SKKEM/Cc0xDqVDN866q5uWHJ/Zz9mCp395t9pCYLTD1qCBdUaSwcVWM
	qkX5kLI2mMenUvTt90CsWYy4RSSTooqMjlvb0og/PK8IIj6FLvJiHRy7/KfxSOn+auY3jSxojGN
	ZConPTyc+aaRkK9KadzEN4Jw1wz/ZA0i9eV0iuYhxfUus66NPUi0Sz79B2/Z2a7dtYPoq0Dkxyn
	jqAogdldWmQEtjin/NjcjqBqHtfG1DZT+uuiR0k99p
X-Google-Smtp-Source: AGHT+IHo42Ln/UQnJWBf+4snnXCY6UqBRGuJxVk3ykkRWA2Up2JqPWEeup1W5Piw4s3VUCTN4TNccw==
X-Received: by 2002:a17:907:3d90:b0:af9:eace:8a52 with SMTP id a640c23a62f3a-b04b1712177mr1353371566b.50.1757509146401;
        Wed, 10 Sep 2025 05:59:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830e613csm164708866b.46.2025.09.10.05.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:59:05 -0700 (PDT)
Message-ID: <8ea6406e-0312-4ecc-8527-3b3740c4c01c@linaro.org>
Date: Wed, 10 Sep 2025 13:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
 <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055908_330872_85F942C3 
X-CRM114-Status: GOOD (  13.30  )
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

On 10/09/2025 13:25, Konrad Dybcio wrote:
> On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
>> On 10/09/2025 12:49, Vikram Sharma wrote:
>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>
>>> The QCS8300 platform provides:
>>> - 2 x VFE (version 690), each with 3 RDI
>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>> - 2 x CSID (version 690)
>>> - 5 x CSID Lite (version 690)
>>> - 3 x CSIPHY (version 690)
>>> - 3 x TPG
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets. See also:
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>>
>> Please version your patches correctly, e.g. use b4 or git format-patch
>> -vX, and add changelog in cover letter or under '---' of individual
>> patches describing changes from previous version.
>>
>> What is v3.1? How to compare it? Try yourself:
> 
> This is a weird invention that some media maintainers seem to promote..
> 
> As a b4 user, I would also like it to stop, as doing anything other than
> v(integer) will open the door for unlimited craziness
> 
> Konrad

This is from me, I asked Vikram for 3.1 instead of a whole new series.

Anyway the fix isn't this patch its 
20250909114241.840842-5-quic_vikramsa@quicinc.com

---
bod


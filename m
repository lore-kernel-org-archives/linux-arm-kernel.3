Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617F3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYzIjw5m52Pb+IT0lkVGBcTiFW2c9Bpd7NnljROy9VA=; b=t/bXsseILDanqPLmXbwZdtr+6H
	E9OtvebKVPTwbhWsl3dO7KIDCyyLN6NH1MdDAMrBaiI+tce+IcL0QRWLtY+tYPIog5JiRtGJYdVGH
	aMagTaYtzR3qbektx//jcO5NmbwV3d4B6KRLd6aVpsV8swaaS7tDPhzMluIKhclmmsMYU5NrF2zzG
	pyQUq72sgXhZr3Mwqy+AWdJCxW7m78k1bCs/IzcdiFwSz6CVWDdpP29RmlnpstQ+NwtbhX/UfHBHH
	kXGfIzkxgRymGXesNSs97D4jBpkYpIDr/3sBy3R+/XWiQf/rPJml4XFW2VnTQo/DmlFbDmlWajZHf
	/4XN+u9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKjl-00000007jHH-2dAN;
	Tue, 18 Feb 2025 10:21:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKUF-00000007fGR-37r1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:05:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43971025798so16245955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739873154; x=1740477954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYzIjw5m52Pb+IT0lkVGBcTiFW2c9Bpd7NnljROy9VA=;
        b=E4/0zobrZiS1gapkkAzFHp4y0JPpCfTiRg228TzuAoFA8OW+VLZitKJoc23tTXiVRw
         VVthlwQU7Y6/vDE1smYbquKVdXytO+sGkynkinQnZ3HAYbH4S1Hxrft/ZsKwSFGJIhsW
         76tpESJqvPUqEs+zQa/Lo57BkCp9SGZiQmuHIIQRckKlkV9RcAu8TKoTggP32X4muVAS
         1akaJ1280wZOERYAkRVbYDvT6NJmxnASE3u3Zy6EE7WFrivRhp5qrca9ael1O9vwGEXZ
         2gf7/XKE+nWzYLBTgB7G+zMzMQ3VRDTkUp33Pb1UXWHJ/oJbOahvcF40xH6bmLdhb6RK
         U5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739873154; x=1740477954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYzIjw5m52Pb+IT0lkVGBcTiFW2c9Bpd7NnljROy9VA=;
        b=Vx+zR3osRAx01zTcNqoaHqOyxY8nezwAfFipGgFBEGuqXWd9YJ4sMnaKkDB7Owr5J2
         3L6rVj0GEPf+OokiTfJrwtDGmMlWrgo3Aq8Q9kwJaqNp/e+9bOfJWdxp69ONmfn4A1P/
         zEClhCyfC4VuM9Z4GcGbIjG5hRtX7LReK8CPfrUp7VYDMSgQSkkjrNJcsDEeyCtYQhVo
         uWjru4forN1gqIDROgSU4+qaoMoNau+50vaqGmPeBexw7rxEOSfPbyjhmF7/6uwFUv12
         H0canYj1dFHsiyLhjTRt8yI3A8YMOLHWrNaPVSqKKIwWuk4+npVnRul5/KS+XkQAJf4m
         sZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSiATkrQImb1HIk4YIdlmviAruXD4gqdTc3sl9LDkOw6j/Cc0Yo3ZMpR3+bHF/NGQ1yKB8mQoxTFYDC9qUbMWe@lists.infradead.org
X-Gm-Message-State: AOJu0YzPVGHHAbYZ9oG0HSjAOG9eJCxcBxA6xQznv4uwFtLAOa7WLCZZ
	5VDi6t9iTO7YR1yE6Jy94oEP1hNdG67uub8kXZ0w065kgx/LPbbJHEb5eCKFWK8=
X-Gm-Gg: ASbGncvFmS8Y09BOAeqPXY1ubenV4ug4A1rEIVg5LXnWnxgyHPO7wwwa8B6eGBwC+BI
	3rfH0bUs8xf8huKhPQ6GdGA21GpsFo66xASF8T9aumkmZhSBRPtBalgXjj4NGgR8mw6bp6WSJ0s
	z1aB9x17AOgxjp0nhGa5cFJOOycgbqqHxwGT5zxe+kJbQRNfDX6lLKItOnTSwDVQYDPIcuw3R9+
	p2KIz5D9WlQgBe70Bxw1GJaH3M4rJfdbrAbcIv2+H8+ttf9qeD77TdAEe5pAyQv0tDq2lphDPy4
	hIxiydKWcrGLnSnwJJvhUnfwSw==
X-Google-Smtp-Source: AGHT+IHgIFVIHEo609omEOPIL5QR94PggfZ8Q3TFUk8tAi1jFgvW0FkFC6iIanB2i61fvsZwwgB5Fw==
X-Received: by 2002:a5d:6d06:0:b0:38f:4cdc:5d36 with SMTP id ffacd0b85a97d-38f4cdc605bmr5085888f8f.43.1739873153792;
        Tue, 18 Feb 2025 02:05:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43992ad82cfsm18910875e9.37.2025.02.18.02.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 02:05:53 -0800 (PST)
Message-ID: <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Date: Tue, 18 Feb 2025 10:05:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020555_793970_A899A6D1 
X-CRM114-Status: GOOD (  22.09  )
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



On 17/02/2025 9:30 am, Jie Gan wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> Based on the trace id which is programed in CTCU ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer
> while other trace data gets ignored. The number of CTCU ATID registers
> depends on the number of defined TMC ETR devices. For example, two TMC
> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
> and ETR1 with ETR1ATID0-ETRATID3.
> 
> The significant challenge in enabling the data filter function is how
> to collect the trace ID of the source device. The introduction of
> trace_id callback function addresses this challenge. The callback function
> collects trace ID of the device and return it back. The trace ID will be
> stored in the structure called coresight_path and transmitted to helper
> and sink devices.
> 
> The coresight_path structure is created to address how to transmit
> parameters needs by coresight_enable_path/coresight_disbale_path
> functions.
> 
> Here is the definition of the struct coresight_path:
> /**
>   * struct coresight_path - data needed by enable/disable path
>   * @path:               path from source to sink.
>   * @trace_id:           trace_id of the whole path.
>   */
> struct coresight_path {
>          struct list_head                *path;
>          u8                              trace_id;
> };
> 
> The atid_offset mentioned before is the offset to ATID register in CTCU
> device.
> 
> Enabling the source device will configure one bit in the ATID register based
> on its trace ID.
> Disabling the source devices will reset the bit in the AITD register
> based on its trace ID.
> 
> Useage:
> Enable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the enablement:
> ETR0ATID0:
> 31..................543210
> ==========================
> 0000000000000000000000...0
> ==========================
> 
> Bitmap after the enablement:
> 31..................543210
> ==========================
> 0000000000000...0000100000
> ==========================
> 
> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
> STM device.
> 
> Disable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the disablement:
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0100000
> =========================
> 
> Bitmap after the disablement
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0000000
> =========================
> 
> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
> device.
> 
> Sincere thanks to James Clark for providing an excellent idea to handle
> the trace_id of the path.
> 
> Changes in V12:
> 1. Update the method for allocating trace_id for perf mode.
> Link to V11 - https://lore.kernel.org/linux-arm-msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
> 

I tested the latest change, looks good to me.



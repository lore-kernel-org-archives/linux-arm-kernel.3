Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeZsog2iIKuGpA11cPJmZ8pu44QO3rd34voFuR0wY1Q=; b=x5Cytuebs3t/+p/+Tw4RHaFZ/8
	GhsW6E16DGct7j7jzyo0JBk003Ldua1oPCDxBGzHIThhup2HiPju/ve3nxxaC5LmRMEVHk6CLLQU+
	jYxEYrQHepRF4QvC08gh4ictjbYBqFmbfHmcbVDijb4QrAJUnqnymWe3SbTN+DeLOlMhBPFUrUD5d
	gADwr6oziVP4JUNutPGcftPdXx88pOOhEJrmjQrLAc11ZZEQRqPgt791MjD/ZKm1ac4Q6X3Utgg/l
	K9T2OOmjoFGCmZ/bdyex1Hxepqt4p5ia6p0eE8oyebaCb4KzPCWhiatfigMU1UUyDVFeUxX/GR0+s
	KIkIibhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titdh-0000000Ed2L-1ZNx;
	Fri, 14 Feb 2025 11:13:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titb3-0000000Eccz-0iUD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:11:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4395817a7f2so12865175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531459; x=1740136259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qeZsog2iIKuGpA11cPJmZ8pu44QO3rd34voFuR0wY1Q=;
        b=lSIA/RpZQ4aIoc0djLm9ROlkLdHR0uLc8JQApqdWagQmdsqrbPEGp7uHSpp3mp9sSj
         J3eu/7Dgw7pA+5sb6e0nYnkBaDdH4FsReCcbIyMKfk+doHCphD9xcWZDzTPYDpB26jxC
         lUUBF3dnNhFPWKKzh3pmpJGGUcqgDwIS8GI53ZVHP2kQWnsr2qdLqauYDkjGnkCwcIsx
         ZHclVvEw9gR+CZg31s1tooKVKPblEd4gJP6vvtjdDIBLDvXFXd1xsOnvYK1dIZg+xo+1
         H8ImVoM3AYhHQioSykJTYKXKTZYIYXHdVCDmrUQDpVWcKyWiO41E14bMhP7fEeEXDVBB
         goHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531459; x=1740136259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeZsog2iIKuGpA11cPJmZ8pu44QO3rd34voFuR0wY1Q=;
        b=q67nADGJ8T4fejEEO59INdvqE/03S0TGfjRb/iGRB/FePy1eXTlEtcupslFq49fhXt
         Fizm1zuBVPyOKS7knTUZbKC/pj50JRjOZ+Jitc4NI/MvWNRtct+ABkuN7M07rruHUu+6
         Ee5hsZInEhWYpMWya+EPguLuEjMLFvOFQ1Zo0+wano7+vuHl47HKZtFzS3uYxd9ISYy9
         XPLsMrlk3E43u6GQnuU2xYHDwGhnHqesd+EumoDHdZ57u3ntCsowbvDJ7lNLY/IcT+Jf
         hLUsHY5AETB8X+GWWrBsaHWdidY2U56UFH92l9GZfqUtCECYnk++HE5/cFG/exSpGT2s
         M5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXuIsDO2fIEX+R+0QIcs31e2c0B+2/G0U8NvTqAyt2XguzR9Slpo5EzvkbGohZTA5Q8uYg+wZ9QcnHq5oa5bNS2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/eLyjeKKXXiuFx+Z6uvng1mfV0NvDKWvDFytkS8c9Q/YLIGQw
	Lrzz8o8Hm+ivdxKdcXrkl4WfPQLeqZZ5iIyNqbV8hNZDmg/1Bnt6ZDe5MPu/opM=
X-Gm-Gg: ASbGncsXb35SXf0fx3DLzVy10BrwoDelDtR40WAz5akvTyV/nHYB97XNprXJnWUzk6l
	lk6dajHPYhZrgcls9tjQmhBI8DCR8qSdlzrjUlk6qBODSagEjBw6aNcq0Er1Lxe/3vHZbBdM8Sp
	KwC3S/iZ7OHE6c4SpTBeSp7tnDIAUAwYGTMOSA+yNAw0BxZrQoZkj2DrNH7eQ8v7LtCZUbgj/0y
	6VW/zC1PTrEw2wmTEMtMHTcCTucvjpkGizB5+uE1AccIx4fULO+xiJkpfaTBZ9MRyR05JrhhVOd
	bMA1VgI8geFIXdvTn42wiVtEwA==
X-Google-Smtp-Source: AGHT+IG0FqoM1XNBiFLdY+14wrQsmMAdQi4bqFYD8ks4h0kO06myymwcWJElrH0RMxv71I5w/kY5xw==
X-Received: by 2002:a5d:6484:0:b0:38d:e48b:1766 with SMTP id ffacd0b85a97d-38f244d5466mr8728379f8f.6.1739531459463;
        Fri, 14 Feb 2025 03:10:59 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e92sm4398625f8f.66.2025.02.14.03.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:10:59 -0800 (PST)
Message-ID: <44123d40-aae3-4248-95c9-21fb9335020a@linaro.org>
Date: Fri, 14 Feb 2025 11:10:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250214024021.249655-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250214024021.249655-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031101_218013_A39390D4 
X-CRM114-Status: GOOD (  20.89  )
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



On 14/02/2025 2:40 am, Jie Gan wrote:
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

No worries! Thanks for working on Coresight too.



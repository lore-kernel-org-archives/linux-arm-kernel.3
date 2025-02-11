Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F43C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cUkixBgpYEn4aAeaI+o2I3hnF9EtEfIlYRTahALjTQ=; b=Cc3fjI6dcKkEiYuTE5qlqDu3WS
	tmo8kpxyojGZ+Kv+n/vd6YPbVz0PDsebFv8CATuiPhqjeKE8vLWj+EYdbc+xP9dx7VxOlicHyc1Vy
	5rXx6EjX/ggxnFYfTVWuR0Fmb0XMOlMkh9ObrEgcAgdqZ/lJICJopHS9TBeddZvUi/gO/NOppii66
	QOB612sBNqPfYVUTVMh4MYrovhhakND//v8snd6MP7JiZm01v2fLcGSYYLPng3gnobftjvmngmsFf
	0oJMzJqW2CzO3dOhj9hinrXWxECw8gPjF77ix0A05KKearX8nPR9/ci7oF/uZCmE6ChJpmy4O9Epu
	GzVPW/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnyV-00000003RpW-1Ubr;
	Tue, 11 Feb 2025 10:58:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thniI-00000003OYL-1E6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:41:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37025835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270516; x=1739875316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cUkixBgpYEn4aAeaI+o2I3hnF9EtEfIlYRTahALjTQ=;
        b=CY6GT6tBePnkJmHVKyIy7B8vwG0ZQW4RlRRoirAICYBMxyQD4zVNgDX3eLcc5bB5af
         GWgWfU8t0Wg9j018K3/BiQmI0Nj5JdpzfFi/gxvyAs/RZwwsQYFMUspyK/9vTDkBBUAf
         A8/eLbUMPUT4oeYEWhFX2IaZuuZvMJ/8U5IxfHiUYGSHBgOM4Igm7Od649unxnB0MicF
         ktMrXxYrgDyI30YabBKGljlYpfsPkHxmTqiNvLRbprzDpJLigjvgIqFfxA4VuCJQRKLm
         HpER4NKZRNRZ+yrqo8m1IK44KDPWT9VPwN6RWFACeYvRAxA+yTd/QU6yRQ9nMGhuf3jl
         CDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270516; x=1739875316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cUkixBgpYEn4aAeaI+o2I3hnF9EtEfIlYRTahALjTQ=;
        b=XEJ4Uu+3kLdggi4qQJIAqT1eeh4AIj8+grKG1Wr3LlKGFS6zrf8/f3Dc4J8MdhmVWu
         vkhJS/y2TXWhTpG8GRERw5LQOaEij2xJyJcPjLjROUTjMpzFXqXDQXYqY6786CLq0jKO
         URamQhFPr4qCbykTCAdcDERa6FtB2lfP850FKqDHRl/QYMo+UvbF4PG8KngttlvbMibv
         5bhMXOq54UhVwb73BpsIJLwB/naudofMV4ogPvbyONIIkGNpVmWZ5I67haapQZQSEZ6R
         D0NpWtfLMGWdQZWIWjkiyazB7veGIL61Nhi9kz58JQadljzeTf5ztN91jt9S9O15bT5m
         8LgA==
X-Forwarded-Encrypted: i=1; AJvYcCUj/3BNI/+3FbwJsX2Bxe0qprFG/h76kbszH76HdToiSnjsbjQFFcaWPtcZ6UYfuJoLqFQvf6p3nURfulz35DrP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo73FuJj2ceWZDoT+ZV1XrLbC6wy3/IF8IOMKNstHXMEsT/w4W
	x8n9hkBRAne1F34G0dcRiwRvgdW8ekEsmZu/8RpbcgC9O56H72+QeNJjgCYMMCs=
X-Gm-Gg: ASbGncvPfouPryD9bIEOvctD789e4mRE6NNc/yyr3JFGNaVZKDIltjseXEOt/QEMQJe
	HM9PxrcJqjbpnOAhISb2oYKDBMpMZx+PBJ2KWW3VHSx8GsQci+626WY5O1JFTb/z+6iRHfVh/gX
	zRh+QC4KiklwTFjOqW9sWQcdpq8AE4mrtwmqoEoHjxJ+4GgPQSHAn9MipQrBDun8T91ImwtS27O
	ZuO8fVO4jJuZPJ8JU/NtGRwmljWaipcHwUnSwLrYFJOJs8M0C6iTJUll1VPPpPSlcuTDQ4SISpV
	WRK35YnnrBh4mNMmXugEB0g=
X-Google-Smtp-Source: AGHT+IHiznFHRTCwShZbEfQSfsP4ZlgsTN5VR0Awq+vBQZzykOkPVdMDgz2P9LDFE6gk8RKX6JBiyw==
X-Received: by 2002:a05:600c:310f:b0:439:48f6:dd6d with SMTP id 5b1f17b1804b1-43948f6de9amr49946795e9.22.1739270516524;
        Tue, 11 Feb 2025 02:41:56 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43946bff4d4sm49091965e9.3.2025.02.11.02.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:41:56 -0800 (PST)
Message-ID: <ea5d18c1-0cce-44f7-bf7a-7c69ffb05bb6@linaro.org>
Date: Tue, 11 Feb 2025 10:41:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/8] Coresight for Kernel panic and watchdog reset
To: Linu Cherian <lcherian@marvell.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com
References: <20241216053014.3427909-1-lcherian@marvell.com>
 <da7dcddb-d407-41b2-8343-a0ec21914606@linaro.org>
 <20250204120216.GB1525185@hyd1403.caveonetworks.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250204120216.GB1525185@hyd1403.caveonetworks.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024158_335731_4E8302EA 
X-CRM114-Status: GOOD (  23.88  )
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



On 04/02/2025 12:02 pm, Linu Cherian wrote:
> Hi James,
> 
> 
> On 2025-01-24 at 17:38:58, James Clark (james.clark@linaro.org) wrote:
>>
>>
>> On 16/12/2024 5:30 am, Linu Cherian wrote:
>>> This patch series is rebased on coresight-next-v6.12.rc4
>>>
>>> * Patches 1 & 2 adds support for allocation of trace buffer pages from
>>>     reserved RAM
>>> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
>>> * Patch 5 adds support for reading trace data captured at the time of panic
>>> * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
>>> * Patch 8: Gives the full description about this feature as part of documentation
>>>
>>> v12 is posted here,
>>> https://lore.kernel.org/linux-arm-kernel/20241129084714.3057080-1-lcherian@marvell.com/
>>>
>>> Changelog from v12:
>>> * Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet
>>> * tmc_read_prepare/unprepare_crashdata need to be called only once and
>>>     hence removed from read path and added to tmc_probe
>>> * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
>>>     avoid taking locks  as its moved to probe function.
>>> * Introduced read status flag, "reading" specific to reserved buffer to keep the
>>>     reserved buffer reading independent of the regular buffer.
>>> * open/release ops for reserved buffer has to take care only about the
>>>     set/unset the "reading" status flag as the reserved buffer is prepared
>>>     during the probe time itself.
>>> * Few other trivial changes
>>>
>>
>> Hi Linu,
>>
>> I tested that decoding a crash dump of ETM1 (trace ID 17) from panic kernel
>> works:
>>
>>    $ ./ptm2human -i cstrace.bin
>>
>>    ...
>>    There is no valid data in the stream of ID 16
>>    Decode trace stream of ID 17
>>    Syncing the trace stream...
>>    Decoding the trace stream...
>>    instruction addr at 0x140c9afc, ARM state, secure state,
>>    ...
> 
> 
> Thanks for trying this out.
> 
>>
>> I noticed that once in the panic kernel Coresight becomes unusable, and the
>> Perf Coresight tests fail, with no obvious way to reset it other than a cold
>> boot:
>>
>>   $ perf record -e cs_etm//u -- true
>>   $ perf report -D | grep AUX
>>   ...
>>   AUX data lost 27 times out of 27!
>>   ...
>>
>> I didn't debug it yet. I thought it might be something to do with the RESRV
>> buffer mode, but it doesn't look like that should be the case from the code.
>> Perhaps its the claim tags and coresight_is_claimed_any() lingering, so it's
>> not really an issue that's introduced by this change?
> 
> 
> Is that problem reproducible without this series applied ?
> 
> Thanks.
> Linu Cherian.
> 
> 
> 

Yes looks like it's unrelated. I sent patches to fix the claim tag 
issue, and there is some other state that needs to be cleared too. But 
we can do it later.





Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF827CF8848
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlqEVS0+MiGt+zpPjfFggE/AaavkPH2p4yD9Xw0jlrs=; b=yA+dO/SlzWeZiwYOOUD1F5Rd3X
	zIM1chBJMvbFsmgBa1OokIRrMy4DMoHsmNXAa1pokIqJneRLmG3ZZFPagVXDTjup5dh4dbH0WxaxR
	R2f+zfWaX5B9suJXVVQ/U/guX75OCAtwyHYIdhzzhBB7+Yy26XluPwmOlME+RDIXk8W9pWwK/aIqV
	TkVqNn203V0Rvn0468LkCorUpFFQNeXCW/2P4UiNe3ZurOr9Mzt93bniSKjiRDIsQpqglnEPTOy4H
	cRWKybqAi0dlNhK+QUZPsZCe9TxZDxdIVtx8wPy2qB811f+FJt1SeuMujHQBvl7/kpuT0M9OJsWXe
	qrC9NvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3EJ-00000006bqg-3Fnn;
	Thu, 20 Nov 2025 11:53:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3EH-00000006bqD-3XAN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:53:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso671772f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763639616; x=1764244416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlqEVS0+MiGt+zpPjfFggE/AaavkPH2p4yD9Xw0jlrs=;
        b=BPiE40Oci6yRp0P/bJsuOVwHuqw6lyOK/Wc74jkys6rPTcJKoAe+5QnK65tnXtqeId
         8iFEM28Ec1Po0KhzT2evOXaNj5eDoDGcwd5W3wOo93wUQf6W6T7hj6KZfX6uJJxHFrZf
         VtE5uuE9SKgCPvbqukKsN21/xIZkwkpIY5JHyCboQYCC51Ze1bbzEh3mlBtOpJIEZsLG
         13pbp5OuoH1rk180nMtOuhdJGED9q8q/plch0Aah3b+pIdeCIPDfIY9dq1bosuF+t5Kw
         cqyZPs/juhG3XddKD7XATk7qh8mma2yEGwzRNCHCZtqPhkrB/8y7qzQrabMb7WU+g+26
         sAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639616; x=1764244416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlqEVS0+MiGt+zpPjfFggE/AaavkPH2p4yD9Xw0jlrs=;
        b=XXE4ugQfczMQQRgpL48I2Gb6yAuIExS3fyPybI3YzWqM6evF0ChzKBz7VY2ZHmRK1q
         KsC2e8uvDu9X+NxImv0Fr8Nwd97gmXvf58z/NSnOrePAufQ0p/rPglR+y1FtgLMz9KAi
         wIpa1keXCuGNjAvCjqzkKN+e/lKebNBbh+vRcR2S4/udRzUbvCuSCn8XzfhQmQMjU3nc
         p4rRJIu4W0QQ8RxmzdFj6vZiE4H2bwDnn1I+bZn0ttjHBrqiFDczG4tLer+LcXcgoAWr
         NAwLRUApsM/8/Fl6iw8Ygh8+N6Pr4Ihc1HWf9j8KhfxHVuSZkcfk7zGshfc1ZYt3jyYl
         dwFA==
X-Forwarded-Encrypted: i=1; AJvYcCXIMrEuyOgxSaAd+OMxOdDKlXSFWYFUvPCSfSsjOHssUgqegqjmGUqRSIAPSQce6qXuREsqPkHINT8DuLO7dU5o@lists.infradead.org
X-Gm-Message-State: AOJu0YyxLnBTo7tMxH9KUSEQyhdu+CVuOh/GlHv572BN4WfWNXhGL8Bz
	eIQZvdCldqco09wV3AFci17WsE1rDtU5fh9Qj6i3ZEajDUai9Fdo9E8ogFRuMweHDG4=
X-Gm-Gg: ASbGncuJloIA+xaj8I/OEKKK/ve5JK4ROsQ3SIdeJDG5t86h6GSfgEkiMVctXkYlpTk
	XNRxMJKdXOWIjV5t3m8ZkzMk2wvOtNDvMm9ecdEbX4LTTcrU0+deeRrK8lyGiP3DnRbIX6UOxkx
	vY09lP2pDwvca46nQUaGlmmSHhjTZEHH8WXuIKjmkDW5Ft7EJkPV5dY6CyksZcNR45z/0T06PZ/
	bVbShFqKtRbXS+RgAvUnc3lIB26/03023iKfRBAY/UtI5vvY2OO8MYH1Ze2l02lMSupak/QEqct
	aMFpwygUjvCzbDFadk9ThufzyjBDA934QfXxncSF3j/5xP3RUhhqDOubssTr1Xia1abVQWEHro5
	cb2RhTHT5yaohtBsirSaw9W4zpx6U+OKezLkTZB32AghUEE0RxcezHnBTxdqOpwhSvNa0GX7up4
	P9uOJBBLzHVFRBjiskagkcMvPlQew=
X-Google-Smtp-Source: AGHT+IH/clyUgV+SR1sU4PGc3WAKh6W0Xyw9krHbVPssxtnUzEeWpWW7mdUCix2QdK09ZVqc5ly6bA==
X-Received: by 2002:a05:6000:288a:b0:42b:3746:3b85 with SMTP id ffacd0b85a97d-42cb9a5c1c9mr2098192f8f.45.1763639615574;
        Thu, 20 Nov 2025 03:53:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm5584315f8f.16.2025.11.20.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 03:53:35 -0800 (PST)
Message-ID: <5f4a848b-af1f-4c5f-bd82-5e3ebe1e9dd9@linaro.org>
Date: Thu, 20 Nov 2025 11:53:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] coresight: Remove misleading definitions
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
 <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_035337_949588_EF43396A 
X-CRM114-Status: GOOD (  40.00  )
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



On 20/11/2025 11:21 am, Mike Leach wrote:
> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>
>> ETM_OPT_* definitions duplicate the PMU format attributes that have
>> always been published in sysfs. Hardcoding them here makes it misleading
>> as to what the 'real' PMU API is and prevents attributes from being
>> rearranged in the future.
>>
>> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
>> which is not the responsibility of the kernel to do and doesn't scale to
>> other registers or versions of ETM. It's not an actual software ABI/API
>> and these definitions here mislead that it is.
>>
>> Any tools using the first ones would be broken anyway as they won't work
>> when attributes are moved, so removing them is the right thing to do and
>> will prompt a fix. Tools using the second ones can trivially redefine
>> them locally.
>>
>> Perf also has its own copy of the headers so both of these things can be
>> fixed up at a later date.
>>
> 
> The perf version is used to reconstruct the control registers for etm3
> / etm4 to put into the trace metadata headers in the perf.data file
> for the decoder to be intitialised correctly.
> 
> perf_event_attr::config uses the ETM_OPT_* values, used directly for
> etm3 since they match the bit pattern in the etm3/ptm config register,
> and remapped for etm4 from ETM_OPT_* to equivalent ETM4_CFG_BIT* for
> the etm4 config register.

That was one of the parts that confused me. Just because the format bit 
positions happened to match the register config for ETM3, didn't mean 
that it had to avoid reading the positions from sysfs. And it wasn't 
consistent between ETM3 and ETM4 either.

That's decoupled now anyway, so although they still match there's no 
reason it can't change in the future.

> 
> The reason we do this re-construction - rather than read registers as
> we do for the other metadata - is that the register value is not set
> at the point we are recording the metadata - it does not actually get
> set until the etm is enabled, later in the perf process.
> 
> On this basis it would seem that any changing of the attribute bit
> ordering has potential to break perf decode. Probably safe to remove

Yes so we should keep the positions the same until enough time has 
passed after the Perf fixes go in. Although other than the timestamp one 
I can't see any of the format bits needing to be moved.

The timestamp bit now won't be passed correctly to OpenCSD until Perf is 
fixed, but I saw it wasn't used for decode anyway, so that should be fine?

> from this version of the file though, but overall, changing bit
> meanings in the underlying variable may possibly need a fix in perf
> and  potentially a breaking change for earlier versions of the tools.
> 
> That said, for this particular version of the header, since it appears
> to no longer need the values due to earlier changes.
> 

The reconstruction of the registers will remain in Perf, so nothing will 
change there apart from not hard coding the format bit positions.

I plan to define the register bits in Perf in cs-etm.c in the same style 
as we do in the kernel. ETM_OPT_* and ETM4_CFG_* weren't searchable 
because the the bits are already defined in the kernel in a different 
style. So I'll define them to match like this:

+/* ETMv4 CONFIGR register bits */
+#define TRCCONFIGR_BB		BIT(3)
+#define TRCCONFIGR_CCI		BIT(4)
+#define TRCCONFIGR_CID		BIT(6)
+#define TRCCONFIGR_VMID	BIT(7)
+#define TRCCONFIGR_TS		BIT(11)
+#define TRCCONFIGR_RS		BIT(12)
+#define TRCCONFIGR_VMIDOPT	BIT(15)
+
+/* ETMv3 ETMCR register bits */
+#define ETMCR_CYC_ACC		BIT(12)
+#define ETMCR_TIMESTAMP_EN	BIT(28)
+#define ETMCR_RETURN_STACK	BIT(29)
+


Then use the format strings to check which ones are set:

if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
	trcconfigr |= TRCCONFIGR_CCI;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &val) && val)
	trcconfigr |= TRCCONFIGR_CID;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
	trcconfigr |= TRCCONFIGR_TS;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
	trcconfigr |= TRCCONFIGR_RS;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &val) && val)
	trcconfigr |= TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "branch_broadcast", &val) 
&& val)
	trcconfigr |= TRCCONFIGR_BB;


This also highlighted another Perf bug that evsel__set_config_if_unset() 
only operates on config and not config1, config2 etc. That's also used 
for setting up the event so I'll fix that too.

Seems like the API goes through a lot of effort to publish the bit 
positions in sysfs, but we've selectively not used them which wasn't 
quite right.

> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   include/linux/coresight-pmu.h | 24 ------------------------
>>   1 file changed, 24 deletions(-)
>>
>> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
>> index 89b0ac0014b0..2e179abe472a 100644
>> --- a/include/linux/coresight-pmu.h
>> +++ b/include/linux/coresight-pmu.h
>> @@ -21,30 +21,6 @@
>>    */
>>   #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>>
>> -/*
>> - * Below are the definition of bit offsets for perf option, and works as
>> - * arbitrary values for all ETM versions.
>> - *
>> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
>> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
>> - * directly use below macros as config bits.
>> - */
>> -#define ETM_OPT_BRANCH_BROADCAST 8
>> -#define ETM_OPT_CYCACC         12
>> -#define ETM_OPT_CTXTID         14
>> -#define ETM_OPT_CTXTID2                15
>> -#define ETM_OPT_TS             28
>> -#define ETM_OPT_RETSTK         29
>> -
>> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
>> -#define ETM4_CFG_BIT_BB         3
>> -#define ETM4_CFG_BIT_CYCACC    4
>> -#define ETM4_CFG_BIT_CTXTID    6
>> -#define ETM4_CFG_BIT_VMID      7
>> -#define ETM4_CFG_BIT_TS                11
>> -#define ETM4_CFG_BIT_RETSTK    12
>> -#define ETM4_CFG_BIT_VMID_OPT  15
>> -
>>   /*
>>    * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>>    * Used to associate a CPU with the CoreSight Trace ID.
>>
>> --
>> 2.34.1
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK



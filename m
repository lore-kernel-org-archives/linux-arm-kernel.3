Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E648DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wjd617Zp3GVZXC6g1tCVr9c7LfRH3yKbPRrmHeFigCQ=; b=qrU1JxvQTaom/cKXOaC/gar1Pa
	xG5uh37KbqudIWDACql4kc0yNXYCFBXk+teQ0GTI5KLLccB09UkcHmPdLrKE+rg7pVf5rQw2erIXr
	myRObZG7qPNpc2z+o9cJO7ppi2qxjIQU2rxgBYorZkOoxuL1Cvh8SI5P6jvhPWR1uPj6I0B/OY3mk
	JvQOlrctswEQYfOxv0Q8PojECE/tXZWcYVWrn+QFVkStRKUrkJW8poQXTrQzNgeec2YL9MOncOQ3M
	7mamtbIAk/71cL5oLMGzfv+Ou735Rb3A2/8qJ7UwBBsqDoW5AybBQkr9r4GiajoPYDt9Z4UJwF8ho
	pzgghG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRL3-00000000Ei1-2nUR;
	Thu, 13 Aug 2026 09:03:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRL0-00000000EhB-3H19
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:02:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47de008b020so414038f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786611777; x=1787216577; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wjd617Zp3GVZXC6g1tCVr9c7LfRH3yKbPRrmHeFigCQ=;
        b=UUXgYzyeagNqes/HqeNUabvvHlHv1Ock6mF5Fh1T0XF0dixGsEdO7Jlda+c3SYmPEh
         F3RvT3vyLwbuvGLX/q2Ns0zkRITkBtIDij1jm52traOdtzna5QrvA5V2LRn63s7o/SV/
         OQle62Haf+IqXap9J39JTBV47CaXFnPccy/k0q4iv/zoDLQ8/rYUX0VOV/gFn1xcpf2q
         33EGPYa4D5XJn19jQK36cJT463NwNblr9M6xMSsjQhdWNiFwK1JB3c+gvCzPCwGXSH0N
         FArHECPex3Gfgvl9Vk1dLftpq7oCIeFTo4YJAHw2aELVuFjvJTA+HVVbt0VpofGb6O48
         4GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611777; x=1787216577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wjd617Zp3GVZXC6g1tCVr9c7LfRH3yKbPRrmHeFigCQ=;
        b=p4h9wNZcFyMiPgvrhBV92OhW5js5hFErwQdgGy0PSsGU6IpuYZd/8UPb1Nq3CVWKUf
         0PeDtY42bMCpscj5meQnsT1ELOEfFLbhx6qrbsgyjhYejfyT+6PSA5Z+O3mqfpEq22Bz
         gJfzUDEooWbI/QnooQV+YFZx/oZLq5K/pR9Pn+X1wrTcUvt24PP4wcr7QsxkmR46X2rt
         qSxn/RTmzHDTwWqUhoxzYnK4A1378MdelAMgohKxfiPEouxjxi3VdOsGYjizHXZmDhvl
         rEWc9C9GlteKgx/P4dKNJCkixL1gFhYac+qo0K1ZBnRby9Alh2Y+SuNc0N3JpYIkiXAV
         UOgA==
X-Forwarded-Encrypted: i=1; AHgh+RqxQUT63GAnCitur7c9OYd8R7Ri2rROTx3GjTw4mzCUJY8XRLuEvnxxZyVgfh81i99ZywNONcKk/cAvH5SAM4RA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzou38Yrn6ALm2AbGqmbf6qksBgNnaATRpamKudp8Zxrdx/z6IG
	moBrDGYlM/2lANNRqwjjRF6UlTkZtlY2AuBtoZ5ibFKdTOsHtX4rltby3uFqvTGesOg=
X-Gm-Gg: AR+sD12K6QGfDTvN3Rdk5T+wsp1QzgFPfXRrvJ5LBHVbaMjK1Ryih2luBauv5Yu4slo
	v7TBPyi4ej+yMuND2LEXWC9yB8SbFYUuguhjohZ/tVtHnIC4XzZKbGmsXRWWezmbGLsRJUhhu1U
	8nngzyjTyjfZw2u7U7ZoyQC01weel7ORPNKOvDeAWPCHvrnLCHbpMKBD9DgMcp30rBdImh5rIvj
	QzyE2CtuXACA1plpm/v/yQhGAVPq/HRs8jF/eDXzz2sWhKAKCZXs3SUXKNsLOHLduYN48Kgc+g+
	pMYoolSHLodfJYkgwQTe1n1Liimkq4MoTM9K5Au52BXlI+GZWfT7VtpGU9Np6WaVLu0RwH2vF52
	mZ87vYyjXMzH9Ld80LoRfcRZlrwnkoheyiNywvBK9U7LJD+qGJvPk7iiSLa5AMAFvTiDX8SQiGb
	G0XXKDJOa8v811pJLYXETmcrcBV5Hl2J3xf34WggBscCn2LmXt9d/rrNTtXID17IYMMdQ=
X-Received: by 2002:a05:6000:4108:b0:47f:8b0f:7172 with SMTP id ffacd0b85a97d-4815a4f9996mr4834711f8f.6.1786611776521;
        Thu, 13 Aug 2026 02:02:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a4fa54asm4815600f8f.0.2026.08.13.02.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:02:55 -0700 (PDT)
Message-ID: <282d74a4-a83f-404a-885e-5321299d9379@linaro.org>
Date: Thu, 13 Aug 2026 10:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] coresight: tmc-etr: Don't stop Perf cleanup for
 active sysfs reads
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 sashiko-bot <sashiko-bot@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-1-6aee7579f1dc@linaro.org>
 <20260812164532.GA313579@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260812164532.GA313579@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_020258_861525_14B5B871 
X-CRM114-Status: GOOD (  38.99  )
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



On 12/08/2026 17:45, Leo Yan wrote:
> On Tue, Jul 28, 2026 at 04:00:13PM +0100, James Clark wrote:
>> The linked fixes commit deliberately allows reads of an old sysfs buffer
>> while in Perf mode because they are separate software buffers. However
>> it didn't modify tmc_disable_etr_sink() to match this relaxation. The
>> result is that when a Perf event ends while the sysfs buffer is being
>> read, clean up will be skipped.
>>
>> Fix it by ignoring the sysfs_reading flag unless the active session is
>> a sysfs one.
> 
> I am not clear why this is relevant to per-thread mode, maybe it would
> be clear for me after reading other patches.
> 

It's because we have to track the enable and disable state accurately so 
that we can drop the reference to the session ID's task and PID on 
disable. Sashiko sees that we already don't track it properly so we 
don't handle the newly added references properly either.

I can mention that in the commit message.

> For this patch self, I think the issue comes from the sink buffer's life
> time - SYSFS mode's buffer has longer life time than a sysfs session,
> it is designed to allow reading sysfs trace data after the sysfs
> session, or even during a perf session. So the code gets complex for
> handling these cases.

Yep, plus the fact that we added ETR_MODE_RESRV which also shares the 
same backing memory between sysfs and Perf and didn't take any of this 
into account, pre-sashiko :)

> 
> I really think we should have a correct life time (or state machine)
> for sysfs buffer, something like:
> 
>    Operations                        |  ETR sysfs buffer state machine
>    ----------------------------------+-----------------------------------------
>                                      |  INVALID: Init state, buffer unallocated
>    echo 1 > .../tmc_etr0/enable_sink |  READY: user can read zeroed data
>    echo 1 > .../etm0/enable_source   |  BUSY: user cannot read as hardware is
>                                      |        writing data to buffer
>    echo 0 > .../etm0/enable_source   |  READY: trace is stopped, user can read
>                                      |         trace data
>    echo 0 > .../tmc_etr0/enable_sink |  INVALID: buffer has been released
> 
> With the state machine's help, we might even don't need to bother what
> the sink device's mode is.
> 

I think this is basically the same as now but more explicit. At the 
moment the same state is represented by the refcount, mode, 
sysfs_reading, and len fields. I can try the state machine and see if it 
improves things. There was one complication to work around where open() 
and read() are separate calls, which is what lead me to use the len = 0 
hack in the first place, but it might be fine, I just have to make 
read() check the INVALID state too.

>> When sysfs and Perf share the same memory in ETR_MODE_RESRV mode, a new
>> Perf session needs to overwrite an old inactive sysfs session by zeroing
>> len. This avoids sysfs from reading stale data because it has a separate
>> set of offsets in its etr_buf struct, even if that's backed by the same
>> memory as the Perf one.
> 
> This can be naturally resolved if we have a state machine above?
> 

Naturally resolved in what way though? There are only two options: you 
either block new Perf sessions indefinitely until sysfs has disabled 
_and_ read. Or, you erase the sysfs data when a Perf session starts and 
don't block. I chose the second one.

This will always be a special case for ETR_MODE_RESRV over the other modes.

> [...]
> 
>> +static bool tmc_perf_sysfs_shared(struct tmc_drvdata *drvdata,
>> +				  struct etr_buf *perf_buf)
>> +{
>> +	/* In ETR_MODE_RESRV mode, sysfs and Perf share the same memory. */
>> +	return perf_buf &&
>> +	       drvdata->sysfs_buf &&
>> +	       drvdata->sysfs_buf->mode == ETR_MODE_RESRV &&
>> +	       perf_buf->mode == ETR_MODE_RESRV;
>> +}
>> +
>>   static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
>>   				    struct coresight_path *path)
>>   {
>> @@ -1772,6 +1782,18 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
>>   		goto unlock_out;
>>   	}
>>   
>> +	/*
>> +	 * Don't use if it's shared and being read by sysfs. Sysfs may only
>> +	 * start reading (the cleared zero length buffer) after the first
>> +	 * tmc_enable_etr_sink_perf(), which changes the result of this check,
>> +	 * so it should only be done once.
>> +	 */
>> +	if ((drvdata->sysfs_reading &&
>> +	     tmc_perf_sysfs_shared(drvdata, etr_perf->etr_buf))) {
>> +		rc = -EBUSY;
>> +		goto unlock_out;
>> +	}
> 
> This is quite tricky. If someone reads the sysfs entry in the middle of
> a perf session, and the traced task is migrated to a different CPU or
> wakes up, the sink device may need to be re-enabled, however the sink
> enabling could fail due to the concurrent sysfs read here.

I think that's fine? There's no other way to do it is there? We do the 
same -EBUSY for incompatible per-thread sessions that migrate to a CPU 
with a shared sink. This only impacts ETR_MODE_RESRV anyway, are we 
really worried about concurrent use in that niche mode?

> 
> Thanks,
> Leo



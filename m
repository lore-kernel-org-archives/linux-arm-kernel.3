Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4ECA0EC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83y9HCM1NErNHhoDJvLNstKn3l9elWApgqOnhqoLDjY=; b=I8InJFsuVY+CCmsu6sssspzz6S
	qnoysXzwX0uGnZ7vFNWeYYt8dJLDrVT7tXYfBhmvfMUUGtYb+RWAkQIRY4YHeAV6OqNEYqQ4SN4kw
	+KK1yiai4W4Emy6AKzoI+KMYxgsrrnH48IkMl7QUU0SUsOl9VhO/Vx7M5fOJy0yQ1jRquSslPPCFN
	ov9ncEO8bzYufo3L06QMAqwVduJuXAKzcCQ7XINSWq8F228oJy7Wk1Gs6etNG3c+l2SWb44pxdy1c
	KdCbnuIU5abLVEtosYXFrDguUsaSkae83euw0j9kXIPOE+IroA8qyukz4neDwylIjlFvS6Gq6vh/N
	bk7gHmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1Y-0000000AyYO-3CFL;
	Mon, 04 Aug 2025 16:26:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixbl-0000000AwO1-0Zic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 16:00:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b783d851e6so3979145f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754323215; x=1754928015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83y9HCM1NErNHhoDJvLNstKn3l9elWApgqOnhqoLDjY=;
        b=gDBuOxVmUalzeQzzlFVydn6wXAzbH93rPIdbLRPL/9OCncPGdM1FfyYx4rBSUMf9CD
         RWKrMgeHLHmLxZCMbbp/t1lV7sPn+8U1jEKY+vSjYF6LjhofKSnwGDMAQRD1oF30daoC
         0uxuG7GqgYbaJB7ih07p7m3UXSXFKzlQPPZF430NFfdmEt1q0rItRe8hEsz57FsXlzVH
         +Vz2xzGJrKRChAhU9hL3i1hWRLbgA9lOA/0aLsqLYPtwGEFbQRor+jAeJd1l13D/orp2
         mvNUtvxB80RTY7eGFUmRqPo8sXNIiIwddRq6AVKU+Lroj6LrX9x4Aqk5XuLvBYvMhTg4
         B9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754323215; x=1754928015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83y9HCM1NErNHhoDJvLNstKn3l9elWApgqOnhqoLDjY=;
        b=WULYoSMUHsSz2XN5DxMgOcOZT+FyhrJsT+DUzhqTxkBhKURgrf+2XkMXbrnzulFK1z
         0be2HpPYPAt7arLCnnT/YT721dxuHb9NHty+YQ4sFQ/PthPt3uw8qPc8U58dg/8nVYF2
         AOXZ7/blmaVVvd38CC2oOsMycM2gYJ2Ms9zUg+8ogvOjcRCaIza+7bsx8723iP7ENMZj
         kFbBbUIDAKobBPYEjBGK0gaIG70LlOBnyaH6ItoJdnTHIay62yJMp3Rir1Tpa9ScSZCC
         M6mpVVJUqZ6/P7CsuWwte29jkD392bMZ1d6LaiKhqLzD+zKTelWP8DIHaTTOkBBvxnLB
         /4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVD3BadNrj55vr3vUz6XUR6LmNQj8hL9zpvMj/GAc/FJXKhj/rUWC12J+CCfYYfEXMWEAyazwzqB5ggLgoHYxZ8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv1iI0dh0p8/v/ubhQwYQe0/SizFpEoexXAa2sTAyDkm4fHK0h
	Km+HelkdGBhCe3zXCRpab7PVaUYrlbd9H5XzO50ziL0mQ1pipCnozmt9ikCDOMVO/tY=
X-Gm-Gg: ASbGncsbdFiYvJlVB3fUWziAV8b2jSxpThSo1ggZRiAmgSswRBvtTTmaJUFvRWjM8R+
	PW8Yef+k3aYrUlTjDLoWty76gk02w37nuu91pdffTI2IHNM/aZ8BEPTjAipmr+8p1x4CiDYjhDS
	uiFrXe3UPsn/X3gxTgnyI/WfnDUxVe70m7K33jB9257dI/wM2yK5k3GbEZDyngSnrmLtPeOwmf4
	v8VPlxysJ7rYumCQggGeisqTwVYu0M1XFJ8yEX95wM8pOPjWAkjHvhEY+f4Y2wJKapMf1iU8d4c
	xQX+aC1bRzuIYRgumktP9TaeCb0ldTSZQyYqO114ptPmr7T6hbzvmsm/YkUG+2kw7f0U+U6VTha
	mtuv/omIJ4wnG15Rjc3rtaPmkHsN4ca2SRPiIiw==
X-Google-Smtp-Source: AGHT+IEauvx9FJ2JC6u71NHBH4w0cTSo3NvU8GY9XFshSKS1MeESuBlXTRuD0jWRGjF7fGT+6taYMQ==
X-Received: by 2002:a05:6000:188f:b0:3b7:81a6:45c1 with SMTP id ffacd0b85a97d-3b8d946afacmr6958510f8f.6.1754323214722;
        Mon, 04 Aug 2025 09:00:14 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e9464f46sm1848019f8f.19.2025.08.04.09.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 09:00:14 -0700 (PDT)
Message-ID: <a492ccbf-6442-44dc-82c8-d2c8b1d5c56b@linaro.org>
Date: Mon, 4 Aug 2025 17:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] perf: arm_spe: Add support for SPE VM interface
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <aIzA632hiAldjJQQ@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aIzA632hiAldjJQQ@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_090017_183016_086DB0CE 
X-CRM114-Status: GOOD (  50.70  )
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



On 01/08/2025 2:28 pm, Alexandru Elisei wrote:
> Hi,
> 
> On Tue, Jul 01, 2025 at 04:31:56PM +0100, James Clark wrote:
>> SPE can be used from within a guest as long as the driver adheres to the
>> new VM interface spec [1]. Because the driver should behave correctly
>> whether it's running in a guest or not, the first patches are marked as
>> a fix. Furthermore, in future versions of the architecture the PE will
>> be allowed to behave in the same way.
>>
>> The last patch adds new behavior to make it easier for guests to be
>> able to reserve large buffers. It's not strictly necessary, so it's not
>> marked as a fix.
> 
> I had a look at the patches, and they all look ok to me, so for the series:
> 
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> I also tested the series by hacking SPE virtualization support in KVM:
> 
> - without these changes, the SPE driver gets into an infinite loop because it
>    clears PMBSR_EL1.S before clearing PMBLIMITR_EL.E, and the hypervisor is
>    allowed to ignore the write to PMBSR_EL1.
> 
> - with these changes, that doesn't happen.
> 
> - ran perf for about a day in a loop in a virtual machine and didn't notice
>    anything out of the ordinary.
> 
> - ran perf for about a day in a loop on baremetal and similary everything looked
>    alright.
> 
> - checked that the SPE driver correctly decodes the maximum buffer size for
>    sizes 4M, 2M (2M is right at the boundary between the two encoding schemes)
>    and 1M; that's also correctly reflected in
>    /sys/devices/platform/<spe>/arm_spe_0/caps/max_buffer_size.
> 
> - checked that perf is not allowed to use a buffer larger than the maximum.
> 
> - checked that the SPE driver correctly detects a buffer size management event.
> 
> So:
> 
> Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> While testing I noticed two things:
> 
> 1. When perf tries to use a buffer larger than the maximum, the error is EINVAL
> (22):
> 
> # cat /sys/devices/platform/spe/arm_spe_0/caps/max_buff_size
> 4194304
> # perf record -ae arm_spe// -m,16M -- sleep 10
> failed to mmap with 22 (Invalid argument)
> 
> (used 16M as the buffer size because what the driver ends up programming is half
> that).
> 
> I would have expected to get back ENOMEM (12), that seems less ambiguous to me.
> I had to hack the driver to print an error message to dmesg when the max buffer
> size is exceed to make sure that's why I was seeing the error message in perf,
> and it wasn't because of something else. I get that that's because .setup_aux()
> can only return NULL on error, but feels like there's room for improvement here.
> 

We could add an error code, rb_alloc_aux() already returns one and that 
calls setup_aux(). But the scenarios would be either EINVAL or ENOMEM 
and wouldn't give the user the exact reason ("need > 2 pages", "need 
even number of pages", etc). So I'm not sure it would be enough of an 
improvement over returning NULL to be worth it.

However I will add a warning into Perf if the user asks for more than 
caps/max_buffer_size. That would be a useful message and Perf can do it 
itself so it doesn't need to be in the driver changes.

> 2. A hypervisor is allowed to inject a buffer size event even though the buffer
> set by the guest is smaller than the maximum advertised. For example, this can
> happen if there isn't enough memory to pin the buffer, or if the limit on pinned
> memory is exceeded in the hypervisor (implementation specific behaviour, not
> mandated in DEN0154, of course).
> 
> In this situation, when the SPE driver gets a buffer size management event
> injected by the hypervisor, there is no way for the driver to communicate it to
> the perf instance, and the profiled process continues executing even though
> profiling has stopped.
> 
> That's not different from what happens today with buffer management events, but
> unlike the other events, which aren't under the control of userspace, the buffer
> size event is potentially recoverable if userspace restarts perf with a smaller
> buffer.
> 
> Do you think there's something that can be done to improve this situation?
> 
> Thanks,
> Alex
> 

It doesn't look like there's currently anything that can stop an event 
or signal to Perf that the event has gone bad.

We could add something like "__u32 error" to struct 
perf_event_mmap_page. But I'm not sure what you'd do with it. If Perf is 
the parent of the process you wouldn't want to kill it in case anything 
bad happens. So you're left with leaving it running anyway. If it's just 
an error message that you want then there's already one in dmesg for 
buffer management errors, and that string is a lot better than a single 
code. Unless these new codes were detailed PMU specific ones? Actually 
it's a whole page so why not make it a string...

It's not a case of the samples ending randomly somewhere though, you'll 
either get all of them or none of them. So it will be quite obvious to 
the user that something has gone wrong. Secondly I think the scenario of 
not being able to pin memory when asking for less than the limit would 
be very rare. It's probably fine to leave it like this for now and we 
can always add something later, maybe if people start to run into it for 
real.

James




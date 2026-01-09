Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBADDD26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E87lHJdowwtu3YidaoeJSfoS6xk/5FNJEHNpvmHqK4w=; b=zQQ8G1NzbW7msoNNE34tXE2CXF
	tBhISHqWa6vvEsTUGzI1kABddJhU80y63oRvflhEkUX3pn3EX8jC2d5dYDASYkX+2CWLF31dXfkSv
	FhbLy0jRr7Dc3w5jEiELHA653gszucbbVzJux9Vut5Yq3YuSlihU7ddblpxY1j0Qli0a2zzAM+ftS
	KPFIeOPW75J6ELxeb1/ZeaitvGsZ6YVgmqsszy8O8zdQ3BWVAeDQzC22QUC33fWAw4R+B3GMruRIa
	Izzu1dL/G2CkrIrEIgZoA1tue8vkCXk/RUDiHC4+0pUf7yd1rZtvi+tchBL7fPmsOuVNuiLulQD5p
	Kp8MFb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFMq-00000002cXC-05VU;
	Fri, 09 Jan 2026 16:29:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFMn-00000002cWI-0KTg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:29:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so36927995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767976175; x=1768580975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E87lHJdowwtu3YidaoeJSfoS6xk/5FNJEHNpvmHqK4w=;
        b=lBB5rY6YOm+ABrFKF4dJuYVqVAy3iF+BOW/cHpp9PRAvXy/XokD8R2Q/Lw2tyZg0tV
         VUo2WEUYQapw9kRJsgzVso0lqCOTiDFAAQLAaJqwk4JRiBYRxFojxBwALCa5d29EEMBO
         Ebz8H6I3LMdm9IN69JtunoxWkLSwny6ennkR6J6etvtgxZtRhJ/wr1ZtIXnVUubbUrbb
         B0t/hLSIqiyg/KvHZ0SmjxCjiTb23yQel1X334I+oJ5HbJMFp+uhK4CBeJlF3sDoKrvq
         gM4hhH1y8C81MWalteyicdealpkHViSAfV+ds9sNGU3vLKgZQTFIKyXmxh9eL61cTfVC
         WznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976175; x=1768580975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E87lHJdowwtu3YidaoeJSfoS6xk/5FNJEHNpvmHqK4w=;
        b=AMmVX6ULQZ9CU8In7n7QTHL5ktgBFjkIsscnbolHwxWEEGv80YSwznRScq3Lo5xjsr
         dQdmrrnpB0VttZ7XZ078Y3Ad7cDVq8r6JOfV51SisBJN0sSSFg2kTZ/YzAbRNGxKyj1U
         xzjOkx7DsQm7ZcAQ7NGpOnWslX2GV2Z5K39+J3RvePTgfaApvSxgoWpWRDCw0w8aoDpI
         bAJSb1YeyQ5oy0xMmmU42W0UfaIe2LObGKTIsss6005izaWP+ek9oBVvkZMxMXqLlLuP
         rMJ9IaHjZSNePa1AhvbWe1HvDahU70c/5b140vPCn6QhdPqbWDKoFf+9D/v82EeULS4t
         wLnw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3RQLxWmVh+xt1lNfnQJAoo3Sg9YyQc8Xr6xa6m5+7JyR/qlDicp7R1zwn6HlTIg/UVUF0JDLo8Ixpu5ZBtqH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyij+qMamamZ5bK4kcVF6jvgbALubECcxA4o0IWbZ55soPThsHG
	/1MPWXSJrSal/se3VUIgqRSgsFqALqq8SaY7XQBDLgti41mclNxv4y3v1NRSN7yvJxU=
X-Gm-Gg: AY/fxX4dqMmaAYyZKtDWElz9yq4mqyaTso8OcXu+Yh3GizRMJ7xCzpN88aoHvQHGqCm
	4G9pWDZVJsBC1QIf7fBnOX6/3xHrcrhx6D9td7C4s10ZJGtJG5i86xeOGK824OmSQmXn3fXAfLG
	PASotYBLn1NmWPoj3Ds/ycPo3foKyf4d/0AEmhuTNwSCQv/R8VHgP1LIL2VSNHU7XD2aoZgu7wI
	iEjzbnOCOTMBsY0Jl4ictb2jiK0SGYJ4fwQriXCUdy7sd/M2LawHyVa8+IrAnJOg5lKPW7QXxcM
	DWnhSg45rhEsLnHMjrsTa2FR3XwUC/swYX2rndEm0Pdfzkj6g/77gfhDxe/Lkgvwt3cQZG6K9Po
	YFJfEel6o1LCzrhU71RbxZNfgV+DMAfT6VIhX073BkJgX9iqeEV/q9l/rg24km5Exy9iGZebxpY
	UgOT5MT9BZkTCmDcIn
X-Google-Smtp-Source: AGHT+IGmzL1tXZl8ZPSvbm1DNjtYU9LFptg5q1JatUZDvK/eZmYzIHWMM1cUqtN42COJOMK1PRCMUg==
X-Received: by 2002:a05:600c:4e49:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-47d84b1897fmr112990735e9.3.1767976174573;
        Fri, 09 Jan 2026 08:29:34 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm213675025e9.13.2026.01.09.08.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:29:34 -0800 (PST)
Message-ID: <38443801-af4e-4ce1-a1c2-603eca8d90da@linaro.org>
Date: Fri, 9 Jan 2026 16:29:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 29/35] KVM: arm64: Pin the SPE buffer in the host
 and map it at stage 2
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-30-alexandru.elisei@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114160717.163230-30-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_082937_161059_24B98BA2 
X-CRM114-Status: GOOD (  20.62  )
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



On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
> If the SPU encounters a translation fault when it attempts to write a
> profiling record to memory, it stops profiling and asserts the PMBIRQ
> interrupt.  Interrupts are not delivered instantaneously to the CPU, and
> this creates a profiling blackout window where the profiled CPU executes
> instructions, but no samples are collected.
> 
> This is not desirable, and the SPE driver avoids it by keeping the buffer
> mapped for the entire the profiling session.
> 
> KVM maps memory at stage 2 when the guest accesses it, following a fault on
> a missing stage 2 translation, which means that the problem is present in a
> SPE enabled virtual machine. Worse yet, the blackout windows are
> unpredictable: the guest profiling the same process can during one
> profiling session, not trigger any stage 2 faults (the entire buffer memory
> is already mapped at stage 2), but worst case scenario, during another
> profiling session, trigger stage 2 faults for every record it attempts to
> write (if KVM keeps removing the buffer pages from stage 2), or something
> in between - some records trigger a stage 2 fault, some don't.
> 
> The solution is for KVM to follow what the SPE driver does: keep the buffer
> mapped at stage 2 while ProfilingBufferEnabled() is true. To accomplish

Hi Alex,

The problem is that the driver enables and disables the buffer every 
time the target process is switched out unless you explicitly ask for 
per-CPU mode. Is there some kind of heuristic you can add to prevent 
pinning and unpinning unless something actually changes?

Otherwise it's basically unusable with normal perf commands and larger 
buffer sizes. Take these basic examples were I've added a filter so no 
SPE data is even recorded:

  $ perf record -e arm_spe/min_latency=1000,event_filter=10/ -m,256M --\
      true

On a kernel with lockep and kmemleak etc this takes 20s to complete. On 
a normal kernel build it still takes 4s.

Much worse is anything more complicated than just 'true' which will have 
more context switching:

$ perf record -e arm_spe/min_latency=1000,event_filter=10/ -m,256M --\
     perf stat true

This takes 3 minutes or 50 seconds to complete (with and without kernel 
debugging features respectively)

For comparison, running these on the host all take less than half a 
second. I measured each pin/unpin taking about 0.2s and the basic 'true' 
example resulting in 100 context switches which adds up to the 20s.

Another interesting stat is that the second example says 'true' ends up 
running at an average clock speed of 4Mhz:

           12683357      cycles   #    0.004 GHz

You also get warnings like this

  rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
  rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-0): P53/1:b..l
  rcu: 	(detected by 0, t=6503 jiffies, g=8461, q=43 ncpus=1)
  task:perf            state:R  running task     stack:0     pid:53 
tgid:53    ppid:52     task_flags:0x400000 flags:0x00000008
  Call trace:
   __switch_to+0x1b8/0x2d8 (T)
   __schedule+0x8b4/0x1050
   preempt_schedule_common+0x2c/0xb8
   preempt_schedule+0x30/0x38
   _raw_spin_unlock+0x60/0x70
   finish_fault+0x330/0x408
   do_pte_missing+0x7d4/0x1188
   handle_mm_fault+0x244/0x568
   do_page_fault+0x21c/0x548
   do_translation_fault+0x44/0x68
   do_mem_abort+0x4c/0x100
   el0_da+0x58/0x200
   el0t_64_sync_handler+0xc0/0x130
   el0t_64_sync+0x198/0x1a0

If we can't add a heuristic to keep the buffer pinned, it almost seems 
like the random blackouts would be preferable to pinning being so slow.



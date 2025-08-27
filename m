Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FBECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQaihs8KVNFjFPci/gMTVwx/UBSLhwQ4KKodk3oOIf0=; b=EtmQIRKe0QmbydUAT0S6xExWO1
	ikDbNr+jizYCBMPgxP20IfOV1XvkKxukQit2TKBdg8RO4Y1X31HF/zQ1+a0SQb9446ITZXdoHHTnU
	xH70t+4rzkoyPTE0jGfLLFQnkB0VcrvdPhtH+uuFw3iOxbTEVKi4Fi6I4pIufULJJCXX5+4d0txgi
	N0uNF1i844N5WRalI+QTqNGW782IfpTqcZ+YCux/eJS/LWodInFUQzyk7P6iT80DublD8yZoiat9I
	yoONrPMJHQA4AZ4B+Uh+TENJEVyE2dpJJM28eJzv/LfEGGBFZ3Gyl3GYTNlh2YjuQ6J1whTt67ANQ
	v9J0sJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQP-0000000G0h6-4A9n;
	Wed, 27 Aug 2025 15:51:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEoO-0000000FMXq-30YW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:59:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afec5651966so104623966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756295971; x=1756900771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQaihs8KVNFjFPci/gMTVwx/UBSLhwQ4KKodk3oOIf0=;
        b=vWcxzKyq1v1FTZYZCg0xQUEUVleD2MkodOEM5hzsxSRFSJ3/3ZK8t39d6ZUVk4ZF9C
         0lbMCVSvXUsUdFVYYzNcnBxLc39jFokuvZs/EFGbcJmYx8POCBVcVltdMjmbXOLlAwGU
         vMRDfHFo9PWDpn0EbdPtRoXJEfq4TNhByzZm7omg+OAF1bg9MPFH4bqOGKHC8UHC12PX
         PLaUxmkDlRWu1P2sLOOnTb7u+TRWLukEDYEsWPTZji5oTa4WB06BNlmrJ4mMPC52QUce
         Xbd4VBs5IFnbE0cMtDzkGcdxISwckMH/fDruOXTf4g5k4Pgs6gB3xOb7gfEwbRTfeH86
         ucMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756295971; x=1756900771;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQaihs8KVNFjFPci/gMTVwx/UBSLhwQ4KKodk3oOIf0=;
        b=eCEG1N2+DPbc8h1QfyiB2zLalPNg3tGJAawn7cm6Pak/463XltrKYcy+eW/x7H+nzc
         NNhb8svPncecMsNyCv1HyXLC4DLLGXAmiLfXChPTdyuJ1q10ahbRXAaEgO08cHNNtbbP
         w3r2GsUGXbo0wlHgUahO/0TtaFA1AGOHU5WaQabA5hSkqB6MYlKMj4PZ6leunpA0tmZC
         v9+lkFE4VghGhqtPV9cmE5uHKK+vXifzh8UDN85KDnJYA/uAzWEJUypfFpUTK8gD6ae9
         b27ECtSH5O2lDYezl830GMc7L+I+70dmfNNq97Lwm71R+90wDOOeAuhyhznPHl/n53Bv
         0S2w==
X-Forwarded-Encrypted: i=1; AJvYcCWgbX4fwkK1LjuQorZzd7NlPYCWNEHSUitlc9tu3WJlxpQisZ8mZk4U/lU416UjuIAXOMZz9djwV08HxWHAgaLr@lists.infradead.org
X-Gm-Message-State: AOJu0YwVrAmnPPalf7meyFglAUVpXDLUq2nHwpTzuC6KalGvXi1e0+hx
	zHTxJvUMlcEQ0fzEgdghULUjKW6IHYFjm2HuiBMCZynU4hSlvt92D5tIbfqbsUcG2lU=
X-Gm-Gg: ASbGnctXNFTrY1o2fiGhZahp1Che/vgSiQKkHw7G6oPQPcsTB7PH9iuvKwp2fy03SHi
	1PFyHkaTq+Y3UyTO3RQjGHNyfqzPPLbW+HpZoM8jrotHPtYlpW8mWOM0IyO/WzV+UmoAaRwP4T1
	4EnsRqaLgJDiKMlNI7My3kMDNJmNPNyTKYjNzQyY/IZ28t+CawvmcWj/hDpjOd1LNzeIWo8bNvW
	KxN7KJmTIcshwoKnDZ/gFPGQqDXiVwQG7GieMkLGdiLrpiYNoFUwJ0k8W7p273Yqx/n4PiVynxw
	IrRNq1UySpG7vg+1PgLQp+iIWt72GeDG0Mln7M6f66BXnYxeiH/UhmeRneA/uBW6B6Sgrso4R+n
	9NW8oXEJkLf0DRgibS1AJ3u6cE86I8KmEuS1FtZml
X-Google-Smtp-Source: AGHT+IEwO9j0QYQ4ePdmBR/viBrOcw84xdsurEVIrUknJvIdTDPUSFSZhPjsQi8BtJA/2U4A7NMt3A==
X-Received: by 2002:a17:906:6a0e:b0:afa:1453:6635 with SMTP id a640c23a62f3a-afe294dce99mr1797221866b.41.1756295970665;
        Wed, 27 Aug 2025 04:59:30 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe9c908414sm413654466b.97.2025.08.27.04.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 04:59:30 -0700 (PDT)
Message-ID: <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
Date: Wed, 27 Aug 2025 14:59:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_045932_781103_928101C1 
X-CRM114-Status: GOOD (  45.81  )
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



On 8/25/25 16:58, David Hildenbrand wrote:
> On 25.08.25 15:36, Eugen Hristev wrote:
>>
>>
>> On 8/25/25 16:20, David Hildenbrand wrote:
>>>
>>>>>
>>>>> IIRC, kernel/vmcore_info.c is never built as a module, as it also
>>>>> accesses non-exported symbols.
>>>>
>>>> Hello David,
>>>>
>>>> I am looking again into this, and there are some things which in my
>>>> opinion would be difficult to achieve.
>>>> For example I looked into my patch #11 , which adds the `runqueues` into
>>>> kmemdump.
>>>>
>>>> The runqueues is a variable of `struct rq` which is defined in
>>>> kernel/sched/sched.h , which is not supposed to be included outside of
>>>> sched.
>>>> Now moving all the struct definition outside of sched.h into another
>>>> public header would be rather painful and I don't think it's a really
>>>> good option (The struct would be needed to compute the sizeof inside
>>>> vmcoreinfo). Secondly, it would also imply moving all the nested struct
>>>> definitions outside as well. I doubt this is something that we want for
>>>> the sched subsys. How the subsys is designed, out of my understanding,
>>>> is to keep these internal structs opaque outside of it.
>>>
>>> All the kmemdump module needs is a start and a length, correct? So the
>>> only tricky part is getting the length.
>>
>> I also have in mind the kernel user case. How would a kernel programmer
>> want to add some kernel structs/info/buffers into kmemdump such that the
>> dump would contain their data ? Having "KMEMDUMP_VAR(...)" looks simple
>> enough.
> 
> The other way around, why should anybody have a saying in adding their 
> data to kmemdump? Why do we have that all over the kernel?
> 
> Is your mechanism really so special?
> 
> A single composer should take care of that, and it's really just start + 
> len of physical memory areas.
> 
>> Otherwise maybe the programmer has to write helpers to compute lengths
>> etc, and stitch them into kmemdump core.
>> I am not saying it's impossible, but just tiresome perhaps.
> 
> In your patch set, how many of these instances did you encounter where 
> that was a problem?
> 
>>>
>>> One could just add a const variable that holds this information, or even
>>> better, a simple helper function to calculate that.
>>>
>>> Maybe someone else reading along has a better idea.
>>
>> This could work, but it requires again adding some code into the
>> specific subsystem. E.g. struct_rq_get_size()
>> I am open to ideas , and thank you very much for your thoughts.
>>
>>>
>>> Interestingly, runqueues is a percpu variable, which makes me wonder if
>>> what you had would work as intended (maybe it does, not sure).
>>
>> I would not really need to dump the runqueues. But the crash tool which
>> I am using for testing, requires it. Without the runqueues it will not
>> progress further to load the kernel dump.
>> So I am not really sure what it does with the runqueues, but it works.
>> Perhaps using crash/gdb more, to actually do something with this data,
>> would give more insight about its utility.
>> For me, it is a prerequisite to run crash, and then to be able to
>> extract the log buffer from the dump.
> 
> I have the faint recollection that percpu vars might not be stored in a 
> single contiguous physical memory area, but maybe my memory is just 
> wrong, that's why I was raising it.
> 
>>
>>>
>>>>
>>>>   From my perspective it's much simpler and cleaner to just add the
>>>> kmemdump annotation macro inside the sched/core.c as it's done in my
>>>> patch. This macro translates to a noop if kmemdump is not selected.
>>>
>>> I really don't like how we are spreading kmemdump all over the kernel,
>>> and adding complexity with __section when really, all we need is a place
>>> to obtain a start and a length.
>>>
>>
>> I understand. The section idea was suggested by Thomas. Initially I was
>> skeptic, but I like how it turned out.
> 
> Yeah, I don't like it. Taste differs ;)
> 
> I am in particular unhappy about custom memblock wrappers.
> 
> [...]
> 
>>>>
>>>> To have this working outside of printk, it would be required to walk
>>>> through all the printk structs/allocations and select the required info.
>>>> Is this something that we want to do outside of printk ?
>>>
>>> I don't follow, please elaborate.
>>>
>>> How is e.g., log_buf_len_get() + log_buf_addr_get() not sufficient,
>>> given that you run your initialization after setup_log_buf() ?
>>>
>>>
>>
>> My initial thought was the same. However I got some feedback from Petr
>> Mladek here :
>>
>> https://lore.kernel.org/lkml/aBm5QH2p6p9Wxe_M@localhost.localdomain/
>>
>> Where he explained how to register the structs correctly.
>> It can be that setup_log_buf is called again at a later time perhaps.
>>
> 
> setup_log_buf() is a __init function, so there is only a certain time 
> frame where it can be called.
> 
> In particular, once the buddy is up, memblock allocations are impossible 
> and it would be deeply flawed to call this function again.
> 
> Let's not over-engineer this.
> 
> Peter is on CC, so hopefully he can share his thoughts.
> 

Hello David,

I tested out this snippet (on top of my series, so you can see what I
changed):


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 18ba6c1e174f..7ac4248a00e5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -67,7 +67,6 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
-#include <linux/kmemdump.h>

 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -120,7 +119,12 @@
EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
 EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);

 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
-KMEMDUMP_VAR_CORE(runqueues, sizeof(runqueues));
+
+size_t runqueues_get_size(void);
+size_t runqueues_get_size(void)
+{
+       return sizeof(runqueues);
+}

 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index d808c5e67f35..c6dd2d6e96dd 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -24,6 +24,12 @@
 #include "kallsyms_internal.h"
 #include "kexec_internal.h"

+typedef void* kmemdump_opaque_t;
+
+size_t runqueues_get_size(void);
+
+extern kmemdump_opaque_t runqueues;
+
 /* vmcoreinfo stuff */
 unsigned char *vmcoreinfo_data;
 size_t vmcoreinfo_size;
@@ -230,6 +236,9 @@ static int __init crash_save_vmcoreinfo_init(void)

        kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
                             (void *)vmcoreinfo_data, vmcoreinfo_size);
+       kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_runqueues,
+                            (void *)&runqueues, runqueues_get_size());
+
        return 0;
 }

With this, no more .section, no kmemdump code into sched, however, there
are few things :
First the size function, which is quite dull and doesn't fit into the
sched very much.
Second, having the extern with a different "opaque" type to avoid
exposing the struct rq definition, which is quite hackish.

What do you think ?
My opinion is that it's ugly, but maybe you have some better idea how to
write this nicer ?
( I am also not 100 % sure if I did this the way you wanted).

Thanks for helping out,
Eugen


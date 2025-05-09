Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E5EC3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piveaIt51APJH/cy/5pKer1njMs8SNMZ9Efypy4VJ1I=; b=M6obuILnvXbU1BnA9ICupYJ/Vy
	qsyCgDjBP2aa7tjiFCtxFU3pCsPBFd1Up87irNECq7v4ceC+D/R4eOaNmkFkZr0ERmJnha7mzuI6e
	iSTU0bh8uz1suvtxW50nXiPFM7sfAv0ZkuyMI5lWQaykpcLhMbyFITtl74mBfxkpI5yxE/IRbC8il
	FktIxgqaGYrsfUnnftzpHuOH+226cxKxDXwL673YHhzZiuUf0CRVZyLMJCkgyO63zEPw4MLSZ3Xc2
	xk3VdJQQGxDjZJO8NiKi0QMf/EHDOrYYi33vQUkKF13gi8+308Zdm/iMEAZfqEKCdY/ua11lQJozJ
	n/fiGI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU87-00000004jQ8-3R8K;
	Fri, 09 May 2025 20:15:35 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPVo-000000043sj-1EG0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:19:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ace3b03c043so359193966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746803982; x=1747408782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piveaIt51APJH/cy/5pKer1njMs8SNMZ9Efypy4VJ1I=;
        b=B5MAMLBoWDFyoDNfy/TYMO+xjvjwdteKmZWAl877CIhv/xH7p5LoBNx4B1Gc7M06XI
         TYpWuNi41cKaTbrNDSFP8NiAO8CGLnotM6tXZ6v+8Se9HxdV/VkzQYbLYKqGXrF2P9Qn
         fPjirBYfV4D1MkCphAvJE5NjOYctiaLjrVQ2X8kIfG/qwRgnpjicaBoVOU1fdNwSzTIG
         9P8xDy1/XsZJs8hm+GiPcdfFZvN73h7KQkeXVPN87HfakWWfOymEMwn7ZYKqHdR8Zgt6
         1d9g6SnBKjqbPi5CCshzz9Ai9ODDvKUsCopGTnsX6/Ica6N1Y59kifYB11xsd2rpG78z
         ZgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803982; x=1747408782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piveaIt51APJH/cy/5pKer1njMs8SNMZ9Efypy4VJ1I=;
        b=lGzMT6azWJmkt56egrSIUKJ+/RBaSEj3xZ2RsRvVWo7qslO95h9s1jYBbhFK+OqNvb
         vBhEF5g6SU4uCWji1/HRs3x+/rw+SrHHFtnSfVMMXpVQlL0hKNjD7UcSj0cuFlrdoM5d
         TTaCP1A9UWRahq7Z8SuVEUoFl3fRuJA0375jb0qwWjSNrMWy8MTnd9dMwtjEZxC28slO
         6INQCdwaw+sedgO2ZG3XTtWU2cjoFzBTwHtNpqZvfC2BlggrS4ESyVumadKs+bDrP2wi
         DSwKPFncYQo06pnKcQMp4xU7Sb5Xkv6GISbpwjOVB7HEhp57TVSSJC7OuGZM2SSZNeNj
         2zAw==
X-Forwarded-Encrypted: i=1; AJvYcCUDRtWelT5OIQNpoRdAfzJnZ53+4PwXxDJkRIjCq2V3BVhjTaQFiZiMy81HLzP4RlFsV3m65JoJ4R75EZGL0OXi@lists.infradead.org
X-Gm-Message-State: AOJu0YxQpXSAnFefJBszgxmQ67QtligfDdTRxMdY9BvA8T4NkCs+25N6
	vumMVKjS44XNIZtcOgdGi/M3/4NNWGKf7BnFmSpvS+q+GlxIv6xz6qKw4xbllC0=
X-Gm-Gg: ASbGncvLTuHILKWvAOIJwwU+VcGJNeVqrGN7iyadT8UyQB0Jxts98IXpUNvd0sYL5Qe
	4fFvQhT6v+6phQvGqMfnR9OcuBZhfCinERBMB66zltRr/0/AJLG3SvL6Ek1n3WirkAnAZbLmQNV
	xFch84EvNdM8HHFzMGUh16pyXJLyNQhUc33yBpOlF3XT59q9gNCq9tU14RP3hITssp0Um+NXm2X
	AO/2zxm4PbMpM4MkVNvGlS/nrYpegqOUS+w3OsLUcUbYViZuZUzmpOExAUyCdAO1riNY4E1/6gv
	IwVxk8XPBK/m8sIHik3BvcOzY+Vpmsg5RKDbg5mY36Z3o3vy
X-Google-Smtp-Source: AGHT+IHT7wYtfS2u3TlvINr8fJyTrH7JNqE175qLt+rBrEgAFEQwhYwKbs1ehus30wxqNmhfrYAvHA==
X-Received: by 2002:a17:907:a2cd:b0:ace:caff:675a with SMTP id a640c23a62f3a-ad218e47c9bmr314645166b.10.1746803981845;
        Fri, 09 May 2025 08:19:41 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd4d3sm164125066b.132.2025.05.09.08.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:19:41 -0700 (PDT)
Message-ID: <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Date: Fri, 9 May 2025 18:19:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, pmladek@suse.com, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_081944_340235_951F9726 
X-CRM114-Status: GOOD (  26.07  )
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

Hello Bjorn,

On 5/7/25 19:54, Bjorn Andersson wrote:
> On Tue, Apr 22, 2025 at 02:31:42PM +0300, Eugen Hristev wrote:
>> kmemdump is a mechanism which allows the kernel to mark specific memory
>> areas for dumping or specific backend usage.
>> Once regions are marked, kmemdump keeps an internal list with the regions
>> and registers them in the backend.
>> Further, depending on the backend driver, these regions can be dumped using
>> firmware or different hardware block.
>> Regions being marked beforehand, when the system is up and running, there
>> is no need nor dependency on a panic handler, or a working kernel that can
>> dump the debug information.
>> The kmemdump approach works when pstore, kdump, or another mechanism do not.
>> Pstore relies on persistent storage, a dedicated RAM area or flash, which
>> has the disadvantage of having the memory reserved all the time, or another
>> specific non volatile memory. Some devices cannot keep the RAM contents on
>> reboot so ramoops does not work. Some devices do not allow kexec to run
>> another kernel to debug the crashed one.
>> For such devices, that have another mechanism to help debugging, like
>> firmware, kmemdump is a viable solution.
>>
>> kmemdump can create a core image, similar with /proc/vmcore, with only
>> the registered regions included. This can be loaded into crash tool/gdb and
>> analyzed.
>> To have this working, specific information from the kernel is registered,
>> and this is done at kmemdump init time, no need for the kmemdump user to
>> do anything.
>>
>> The implementation is based on the initial Pstore/directly mapped zones
>> published as an RFC here:
>> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
>>
>> The back-end implementation for qcom_smem is based on the minidump
>> patch series and driver written by Mukesh Ojha, thanks:
>> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
>>
>> I appreciate the feedback on this series, I know it is a longshot, and there
>> is a lot to improve, but I hope I am on the right track.
>>
>> Thanks,
>> Eugen
>>
>> PS. Here is how crash tool reports the dump:
>>
>>      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>>     DUMPFILE: /home/eugen/eee
> 
> Can you please describe the steps taken to get acquire/generate this
> file and how to invoke crash?
> 

Thank you for looking into this.

Next week, on 16th of May, on Friday, there will be a talk related to
this patch series at Linaro Connect in Lisbon. In that talk I will also
show a demo in which all the process of acquiring the core dump and
crash will be covered.
I will be traveling the following days, if I get the time I will submit
the steps as a reply to this email, if not, then for sure I will submit
them after the talk in Lisbon.

Eugen

> Regards,
> Bjorn
> 
>>         CPUS: 8 [OFFLINE: 7]
>>         DATE: Thu Jan  1 02:00:00 EET 1970
>>       UPTIME: 00:00:28
>>     NODENAME: qemuarm64
>>      RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
>>      VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>      MACHINE: aarch64  (unknown Mhz)
>>       MEMORY: 0
>>        PANIC: ""
>>
>> crash> log
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
>> [    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>> [    0.000000] KASLR enabled
>> [...]
>>
>> Eugen Hristev (14):
>>   Documentation: add kmemdump
>>   kmemdump: introduce kmemdump
>>   kmemdump: introduce qcom-md backend driver
>>   soc: qcom: smem: add minidump device
>>   Documentation: kmemdump: add section for coreimage ELF
>>   kmemdump: add coreimage ELF layer
>>   printk: add kmsg_kmemdump_register
>>   kmemdump: coreimage: add kmsg registration
>>   genirq: add irq_kmemdump_register
>>   kmemdump: coreimage: add irq registration
>>   panic: add panic_kmemdump_register
>>   kmemdump: coreimage: add panic registration
>>   sched: add sched_kmemdump_register
>>   kmemdump: coreimage: add sched registration
>>
>>  Documentation/debug/index.rst      |  17 ++
>>  Documentation/debug/kmemdump.rst   |  83 +++++
>>  drivers/Kconfig                    |   2 +
>>  drivers/Makefile                   |   2 +
>>  drivers/debug/Kconfig              |  39 +++
>>  drivers/debug/Makefile             |   5 +
>>  drivers/debug/kmemdump.c           | 197 ++++++++++++
>>  drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
>>  drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
>>  drivers/soc/qcom/smem.c            |  10 +
>>  include/linux/irqnr.h              |   1 +
>>  include/linux/kmemdump.h           |  77 +++++
>>  include/linux/kmsg_dump.h          |   6 +
>>  include/linux/panic.h              |   1 +
>>  include/linux/sched.h              |   1 +
>>  kernel/irq/irqdesc.c               |   7 +
>>  kernel/panic.c                     |   8 +
>>  kernel/printk/printk.c             |  13 +
>>  kernel/sched/core.c                |   7 +
>>  19 files changed, 1236 insertions(+)
>>  create mode 100644 Documentation/debug/index.rst
>>  create mode 100644 Documentation/debug/kmemdump.rst
>>  create mode 100644 drivers/debug/Kconfig
>>  create mode 100644 drivers/debug/Makefile
>>  create mode 100644 drivers/debug/kmemdump.c
>>  create mode 100644 drivers/debug/kmemdump_coreimage.c
>>  create mode 100644 drivers/debug/qcom_md.c
>>  create mode 100644 include/linux/kmemdump.h
>>
>> -- 
>> 2.43.0
>>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D1C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Uwdw45l2Wd3lmVq2PlME1vCAv/hhN+/r6aBXk6kpsw=; b=XZQv029H7dkUZYW0eOnweanbev
	bx5sDmR7cZXe9plq0dTTFGE+qmybhyqYXuwbjQ2Bahh0LQ3OSBeem0rfLsW/sfEEtHhAsil5z5CLz
	zQLPMhmZByzAdNDy0N9iWDt9wPRmbppEa/IWJxLdGOWp/GZJRPWj5BlDu4M+eS3+DIRMDvHgpUBgD
	zFaQl367stKCjRP0vMrpQ4TLwuL91IJ5dOupCNOggxTi6639FfJ/k428BY9lBANlGiWyaZteVDBPh
	VECFHb2L58b2FzILIyUEoKVOh5xtsfFbCeA/YyWV2qjHCRiWfP+Y3KqV/nKymHi+GOGd5Nn7+Hi4Z
	ZVNYIElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0r5-000000070oo-1qSI;
	Mon, 02 Jun 2025 08:49:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0ou-000000070eV-1vZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 08:47:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso40667225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748854018; x=1749458818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Uwdw45l2Wd3lmVq2PlME1vCAv/hhN+/r6aBXk6kpsw=;
        b=aJhtIg4gsTQdMzppVFYx+/tVbEyTHuGpqRk9rLdUD+v2veICAHoG5bxyfqgSMXLqN9
         b9bVDV+RQsdQMdX4uGfunwYZC5ZNRyV/S2tnyAGXVQ6/vBcAXoo3iQLYbfXusgd4ZDXp
         mPcV5Y2G7h7hdPnGwkJL81EnRr6ak/z6ZsjgFigjqOX4bIRC0Zfmu4V3tWOTZjgHb5KB
         xEi1xFAYhI5hOr3RwdXnuOlYqpHK2DZb0d7mOJseHpR85VixkUudtt6wqDJ9mlEt+jHP
         Df47SXH0uT0GtBfqHEG6J/aqROJGEslDQWaQ3Yn5cSQb4smhz1lXfNCPpRkLCbspzbzU
         8IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854018; x=1749458818;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Uwdw45l2Wd3lmVq2PlME1vCAv/hhN+/r6aBXk6kpsw=;
        b=R2SU+G1qDhU/79n3G2vfsEKWv8JURTnZYkQ+p6BkZ8rqNacM+QIa2Nug6mxHme9KWe
         xvyyJvn2NVuNn8m6kLM+y776NQebU0o9md5poa2+dNbV3l3a+CVT88DoUZ/tDTUaX2Hz
         fv71L0cvsvuQe/UqiirVu2d7IV9nQx58Y+XLbkWO8kU/ZlGkGhpseprp2m6/XynrhItN
         TFYG3QzFm7jMaIpSeTOhUQ5QliUx8B0/TfnFo87LI6acrF7LK2JTBy9FDM3vTZ1FQa5l
         uz8awKuUScYDAdExOh2iTVGCs8yP6PMvSGSG6m3plkBBTFEH4AWtsv5xn/cJx1dBBHkI
         KPzw==
X-Forwarded-Encrypted: i=1; AJvYcCVgT2Lo+RWzXbZeR/F32pYlbeKoCb5VtRigrqj22IvQTrKVjUoXkPye1sMHp5jeTTC1fmWMjuA8t7TySoUYrtzM@lists.infradead.org
X-Gm-Message-State: AOJu0YzITM3mYjgzm1v91ZzxAXQib+FfZmY7isbmPNCMZsBloVoCihzv
	01XX1jpo8AeuXMi7X5KzSVzC/Z+ctELS0izVe98BrIldU83C7ajDvA+uKgbcwHavNwg=
X-Gm-Gg: ASbGncvreivnLvMYZxT3x2+gpuOWTcszzXYBr76z/ToCuKl/P4rkXIhfQH17Rd/3woS
	JRMhpzHN/Cm93GMVSNKfJ9efp1TD+Gjo8vIU9yzCo3yFQ5Nn/rdAAkmn9UROjUkXw0fpptgj7AZ
	wlwCMG83inKmiQ/k8x0A+jnU3HnWqKJgNKwAxt07ODP3NO+1LvA+0wlf1R77C0VtuTzOixNGU3V
	bmFbHMWTCxmEk93LcgUeFzQdK/1Z++Zpt4EOEMVBmnuwje0D4juGk6JQ4fwl3UgDXU7w/hVRfmu
	5onJipoQl/X/G61Y1haFuaSXLos2HolDkLCybMqlQ7qyQF+JEYeF6L/KAuA=
X-Google-Smtp-Source: AGHT+IEh0w5l6ZvkklE6p3pCXfWDL7mfyAoXy0g7V6ae/93x0vL/tglEoXvBG+M280vEiH+X8ihstA==
X-Received: by 2002:a05:6000:420a:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a4fe393542mr5130183f8f.28.1748854018096;
        Mon, 02 Jun 2025 01:46:58 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f67sm13881885f8f.47.2025.06.02.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:46:57 -0700 (PDT)
Message-ID: <b8920325-51d2-4ac9-a521-ebaef5736d98@linaro.org>
Date: Mon, 2 Jun 2025 11:46:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
From: Eugen Hristev <eugen.hristev@linaro.org>
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
 <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Content-Language: en-US
In-Reply-To: <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_014700_513570_964678C3 
X-CRM114-Status: GOOD (  35.01  )
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



On 5/9/25 18:19, Eugen Hristev wrote:
> Hello Bjorn,
> 
> On 5/7/25 19:54, Bjorn Andersson wrote:
>> On Tue, Apr 22, 2025 at 02:31:42PM +0300, Eugen Hristev wrote:
>>> kmemdump is a mechanism which allows the kernel to mark specific memory
>>> areas for dumping or specific backend usage.
>>> Once regions are marked, kmemdump keeps an internal list with the regions
>>> and registers them in the backend.
>>> Further, depending on the backend driver, these regions can be dumped using
>>> firmware or different hardware block.
>>> Regions being marked beforehand, when the system is up and running, there
>>> is no need nor dependency on a panic handler, or a working kernel that can
>>> dump the debug information.
>>> The kmemdump approach works when pstore, kdump, or another mechanism do not.
>>> Pstore relies on persistent storage, a dedicated RAM area or flash, which
>>> has the disadvantage of having the memory reserved all the time, or another
>>> specific non volatile memory. Some devices cannot keep the RAM contents on
>>> reboot so ramoops does not work. Some devices do not allow kexec to run
>>> another kernel to debug the crashed one.
>>> For such devices, that have another mechanism to help debugging, like
>>> firmware, kmemdump is a viable solution.
>>>
>>> kmemdump can create a core image, similar with /proc/vmcore, with only
>>> the registered regions included. This can be loaded into crash tool/gdb and
>>> analyzed.
>>> To have this working, specific information from the kernel is registered,
>>> and this is done at kmemdump init time, no need for the kmemdump user to
>>> do anything.
>>>
>>> The implementation is based on the initial Pstore/directly mapped zones
>>> published as an RFC here:
>>> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
>>>
>>> The back-end implementation for qcom_smem is based on the minidump
>>> patch series and driver written by Mukesh Ojha, thanks:
>>> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
>>>
>>> I appreciate the feedback on this series, I know it is a longshot, and there
>>> is a lot to improve, but I hope I am on the right track.
>>>
>>> Thanks,
>>> Eugen
>>>
>>> PS. Here is how crash tool reports the dump:
>>>
>>>      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>>>     DUMPFILE: /home/eugen/eee
>>
>> Can you please describe the steps taken to get acquire/generate this
>> file and how to invoke crash?
>>
> 
> Thank you for looking into this.
> 
> Next week, on 16th of May, on Friday, there will be a talk related to
> this patch series at Linaro Connect in Lisbon. In that talk I will also
> show a demo in which all the process of acquiring the core dump and
> crash will be covered.
> I will be traveling the following days, if I get the time I will submit
> the steps as a reply to this email, if not, then for sure I will submit
> them after the talk in Lisbon.

Hello again,

These are steps to try out the kmemdump patches.

Once you build the kernel using the patches (you will have to change the
config to enable it, and the backend : CONFIG_DRIVER_KMEMDUMP ,
CONFIG_QCOM_MD_KMEMDUMP_BACKEND and CONFIG_DRIVER_KMEMDUMP_COREIMAGE )
Kernel firmware must be set to mode 'mini' by kernel module parameter
like this : qcom_scm.download_mode=mini

After you boot the kernel, make sure the qcom_md module is loaded and
kernel displays this message :
"kmemdump backend %s registered successfully."

After this moment the crash could occur anytime.

Once the crash happens, the firmware will kick in and you will see on
the console the message saying Sahara init, etc, that the firmware is
waiting on download mode. (this is subject to firmware supporting this
mode, I am using sa8775p-ride board)

Once the board is in download mode, you can use the qdl tool (I
personally use edl , have not tried qdl yet), to get all the regions as
separate files.
The tool from the host computer will list the regions in the order they
were downloaded.

Once you have all the files simply use `cat` to put them all together,
in the order they were dowloaded.
e.g. md_KELF.BIN , then md_Kvmcorein.BIN, etc.

Once you have the resulted file, use `crash` tool to load it, like this:
`crash --no_modules --minimal /path/to/vmlinux /path/to/core/image`

Crash has to be compiled with target=ARM64

To use crash without '--minimal' option, some minor changes are required
to crash tool, which I will submit to crash mailing list once I get more
things sorted. Meanwhile I could provide this patch if needed for
testing. (Also, there is a missing nr_swapfile variable from the kernel
which needs to be kmemdumped, and not added to this series in this version)

Please let me know how this works for you, if you experience
difficulties, I can help or expand steps .
Thanks for trying this out !


> 
> Eugen
> 
>> Regards,
>> Bjorn
>>
>>>         CPUS: 8 [OFFLINE: 7]
>>>         DATE: Thu Jan  1 02:00:00 EET 1970
>>>       UPTIME: 00:00:28
>>>     NODENAME: qemuarm64
>>>      RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
>>>      VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>>      MACHINE: aarch64  (unknown Mhz)
>>>       MEMORY: 0
>>>        PANIC: ""
>>>
>>> crash> log
>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
>>> [    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>> [    0.000000] KASLR enabled
>>> [...]
>>>
>>> Eugen Hristev (14):
>>>   Documentation: add kmemdump
>>>   kmemdump: introduce kmemdump
>>>   kmemdump: introduce qcom-md backend driver
>>>   soc: qcom: smem: add minidump device
>>>   Documentation: kmemdump: add section for coreimage ELF
>>>   kmemdump: add coreimage ELF layer
>>>   printk: add kmsg_kmemdump_register
>>>   kmemdump: coreimage: add kmsg registration
>>>   genirq: add irq_kmemdump_register
>>>   kmemdump: coreimage: add irq registration
>>>   panic: add panic_kmemdump_register
>>>   kmemdump: coreimage: add panic registration
>>>   sched: add sched_kmemdump_register
>>>   kmemdump: coreimage: add sched registration
>>>
>>>  Documentation/debug/index.rst      |  17 ++
>>>  Documentation/debug/kmemdump.rst   |  83 +++++
>>>  drivers/Kconfig                    |   2 +
>>>  drivers/Makefile                   |   2 +
>>>  drivers/debug/Kconfig              |  39 +++
>>>  drivers/debug/Makefile             |   5 +
>>>  drivers/debug/kmemdump.c           | 197 ++++++++++++
>>>  drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
>>>  drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
>>>  drivers/soc/qcom/smem.c            |  10 +
>>>  include/linux/irqnr.h              |   1 +
>>>  include/linux/kmemdump.h           |  77 +++++
>>>  include/linux/kmsg_dump.h          |   6 +
>>>  include/linux/panic.h              |   1 +
>>>  include/linux/sched.h              |   1 +
>>>  kernel/irq/irqdesc.c               |   7 +
>>>  kernel/panic.c                     |   8 +
>>>  kernel/printk/printk.c             |  13 +
>>>  kernel/sched/core.c                |   7 +
>>>  19 files changed, 1236 insertions(+)
>>>  create mode 100644 Documentation/debug/index.rst
>>>  create mode 100644 Documentation/debug/kmemdump.rst
>>>  create mode 100644 drivers/debug/Kconfig
>>>  create mode 100644 drivers/debug/Makefile
>>>  create mode 100644 drivers/debug/kmemdump.c
>>>  create mode 100644 drivers/debug/kmemdump_coreimage.c
>>>  create mode 100644 drivers/debug/qcom_md.c
>>>  create mode 100644 include/linux/kmemdump.h
>>>
>>> -- 
>>> 2.43.0
>>>
> 



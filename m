Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C10D2ECFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUmHX3uxcNc6yjpwU1CNhVsSz48eAE4qC1VWpnEVxvE=; b=rPPOZsrBIRWrNK/ZjWfU4ZKJVc
	0xgnYXBI+9nUTtOumj1429OB+IMyK+2PV4TEZk9fhG7DL4c21Y5Ico0pvv8HVVMbFAZ3yOhVzlpk4
	7VXinor0c+ozLIxJ/8eB34/3fDKbAj6Ir5iSNPRxvbAnmbJzTw2uHpMrGjRofoIvF2ozs6fmOSPU4
	UEfyN5Az1wEvMouxCVrpRx5uFv5u6PoFccYh6XiZgntTCVNGK7LLE8zZbMI3xOR6ry5KC/EKbn+dT
	akOS5PE5UhH4Y4SThbniziXNndUz9gVgFMCMR9oG2R/2QQU+3CZCcCQ86gpBQkQU5NhML62IapHDD
	jTTaegoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0lN-000000033QR-3nJs;
	Tue, 20 Jan 2026 01:42:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0lL-000000033Pb-0IJo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768873348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUmHX3uxcNc6yjpwU1CNhVsSz48eAE4qC1VWpnEVxvE=;
	b=S3S6ifGcrXqeq2KIo0/Xn+8JwsIUD7Gz4HrR7jHpSs2GVO+DZ6yYGj+ecpe5lGsn9Ylfz0
	hj3QRaGQPH0wRbpv1P/5DjedQGQmA514gnUusr3Lse+f5arSMW3e4z7BOFaiH3be7NQq05
	oSsoMrklmXbKtIEpmqbdh1SGc4XTu5o=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-BNlcUyh5NSi8Es04C0xPxg-1; Mon, 19 Jan 2026 20:42:26 -0500
X-MC-Unique: BNlcUyh5NSi8Es04C0xPxg-1
X-Mimecast-MFC-AGG-ID: BNlcUyh5NSi8Es04C0xPxg_1768873345
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52d37d346dso2477012a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 17:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873345; x=1769478145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUmHX3uxcNc6yjpwU1CNhVsSz48eAE4qC1VWpnEVxvE=;
        b=Gc4T/rr29YP8u8PfRqfdpXfiFc7J14j6VPa2ConJ4MAw8bPXZzYTa5/BEov6ezpK4K
         hQ79r+m7/yntsG5O+WRat+sR4pGeo3rs5JQySJnPDDhUiIk2oK58/IpSHu9tt1W/saMY
         1mxkPpf1wtP6SZSaL5iy+7G7HMWRXDe1S9bgFrrLKib5I/xWe08vQVtTD9vOsT0sWkzg
         6+AUrBtBHbG8eMtcvtBIuIEqq+mMIETcQ64I2FapDGBOtkjb4InJi21w9Dw+MWZvJDt/
         WfBITx6FWeQttGXOPxv1nskKLs7t1Dw7Hgv1PVJh8kDPAcG60PDJyAfsxz4IC9L/ur7+
         Hg9A==
X-Forwarded-Encrypted: i=1; AJvYcCVIDC1sNO/8gtNU5DOFp3FAeAK/8i21dVMH0FiefxEp4g4qwvAxqTwQvOBLRFkImzxCPLaxbfpPrXrtq7Z3Ngc7@lists.infradead.org
X-Gm-Message-State: AOJu0YwegvxAFLejDzCkeYGtE5R82md8Q5bKq1tYq0L50dQHuudK4fp1
	KYNTP8zo4G06h5/uaByZRPIfpLdL9T5fb2ZKq1ynmeKMQW59l3sQAmLoDky7pU9y2cxdw2Te1D2
	6NX1asZFrckYERheELJnokNqAWr6mJhd7eO9FrG3jn0WFBb+RE44/caaLQsKZn7cj1DIHUUIP4R
	n7
X-Gm-Gg: AY/fxX61BY0EoORVNnD4QUSsFFrhx9iCVWYbbGgEbcANQGXxdutZKZ2/9KpuFwgp19G
	PWWMjgPNVVIBQkeUqJsdA1zYo+2wFbQNGadFw04WoHcpwa9RRuzgtxGhoEZTsAfVw0sPz6m2lw0
	Au/A25Zw3QN1bbHjSF1o+vTyNZx86Jn89kec1y1MLiTge7iZmdAazrvMR4NMXoSfGn8wDcx+XZo
	/18T5n8CCznzmfpuF/fF2qUXetf1BXQf1+5QoN3PKE3NM++721e4ZOLrJt21sEFVQc/YSJ6PV4w
	3DB5tLQqGGuisZZfnm91SkOisxc8zDisPLOfrq1xQD4QxrlLvKKqdHK5H3UT5IebogHtmnoGE5z
	QoYESW0hRoE8=
X-Received: by 2002:a05:6a21:3943:b0:366:14af:9bd8 with SMTP id adf61e73a8af0-38e45eaca3dmr326357637.78.1768873345320;
        Mon, 19 Jan 2026 17:42:25 -0800 (PST)
X-Received: by 2002:a05:6a21:3943:b0:366:14af:9bd8 with SMTP id adf61e73a8af0-38e45eaca3dmr326343637.78.1768873344861;
        Mon, 19 Jan 2026 17:42:24 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf249fcbsm10600102a12.12.2026.01.19.17.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:42:24 -0800 (PST)
Message-ID: <02b41ff8-1373-493d-93ab-7eb78e0a57a1@redhat.com>
Date: Tue, 20 Jan 2026 09:42:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
To: Ben Horgan <ben.horgan@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-7-ben.horgan@arm.com>
 <12779ebc-1928-42db-8a44-ee97e2a58fd1@redhat.com>
 <20260115120923.000079fa@huawei.com>
 <eba5f35c-2edc-47e4-9c74-e60aaf7ab4ec@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <eba5f35c-2edc-47e4-9c74-e60aaf7ab4ec@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uKnS640kk8uUREJXWKgYoiueZ7XnqNHNh85aAfAmnzU_1768873345
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_174231_257870_22EFAC2E 
X-CRM114-Status: GOOD (  31.26  )
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

Hi Ben and Jonathan,

On 1/19/26 10:00 PM, Ben Horgan wrote:
> Hi Gavin, Jonathan,
> 
> On 1/15/26 12:09, Jonathan Cameron wrote:
>> On Thu, 15 Jan 2026 14:47:28 +0800
>> Gavin Shan <gshan@redhat.com> wrote:
>>
>>> Hi Ben,
>>>
>>> On 1/13/26 12:58 AM, Ben Horgan wrote:
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> MPAM allows traffic in the SoC to be labeled by the OS, these labels are
>>>> used to apply policy in caches and bandwidth regulators, and to monitor
>>>> traffic in the SoC. The label is made up of a PARTID and PMG value. The x86
>>>> equivalent calls these CLOSID and RMID, but they don't map precisely.
>>>>
>>>> MPAM has two CPU system registers that is used to hold the PARTID and PMG
>>>> values that traffic generated at each exception level will use. These can
>>>> be set per-task by the resctrl file system. (resctrl is the defacto
>>>> interface for controlling this stuff).
>>>>
>>>> Add a helper to switch this.
>>>>
>>>> struct task_struct's separate CLOSID and RMID fields are insufficient to
>>>> implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID) and
>>>> PMG (sort of like the RMID) separately. On x86, the rmid is an independent
>>>> number, so a race that writes a mismatched closid and rmid into hardware is
>>>> benign. On arm64, the pmg bits extend the partid.
>>>> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).  In
>>>> this case, mismatching the values will 'dirty' a pmg value that resctrl
>>>> believes is clean, and is not tracking with its 'limbo' code.
>>>>
>>>> To avoid this, the partid and pmg are always read and written as a
>>>> pair. This requires a new u64 field. In struct task_struct there are two
>>>> u32, rmid and closid for the x86 case, but as we can't use them here do
>>>> something else. Add this new field, mpam_partid_pmg, to struct thread_info
>>>> to avoid adding more architecture specific code to struct task_struct.
>>>> Always use READ_ONCE()/WRITE_ONCE() when accessing this field.
>>>>
>>>> Resctrl allows a per-cpu 'default' value to be set, this overrides the
>>>> values when scheduling a task in the default control-group, which has
>>>> PARTID 0. The way 'code data prioritisation' gets emulated means the
>>>> register value for the default group needs to be a variable.
>>>>
>>>> The current system register value is kept in a per-cpu variable to avoid
>>>> writing to the system register if the value isn't going to change.  Writes
>>>> to this register may reset the hardware state for regulating bandwidth.
>>>>
>>>> Finally, there is no reason to context switch these registers unless there
>>>> is a driver changing the values in struct task_struct. Hide the whole thing
>>>> behind a static key. This also allows the driver to disable MPAM in
>>>> response to errors reported by hardware. Move the existing static key to
>>>> belong to the arch code, as in the future the MPAM driver may become a
>>>> loadable module.
>>>>
>>>> All this should depend on whether there is an MPAM driver, hide it behind
>>>> CONFIG_ARM64_MPAM.
>>>>
>>>> CC: Amit Singh Tomar <amitsinght@marvell.com>
>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>>> ---
>>>> Changes since rfc:
>>>> CONFIG_MPAM -> CONFIG_ARM64_MPAM in commit message
>>>> Remove extra DECLARE_STATIC_KEY_FALSE
>>>> Function name in comment, __mpam_sched_in() -> mpam_thread_switch()
>>>> Remove unused headers
>>>> Expand comment (Jonathan)
>>>>
>>>> Changes since v2:
>>>> Tidy up ifdefs
>>>> ---
>>>>    arch/arm64/Kconfig                   |  2 +
>>>>    arch/arm64/include/asm/mpam.h        | 67 ++++++++++++++++++++++++++++
>>>>    arch/arm64/include/asm/thread_info.h |  3 ++
>>>>    arch/arm64/kernel/Makefile           |  1 +
>>>>    arch/arm64/kernel/mpam.c             | 13 ++++++
>>>>    arch/arm64/kernel/process.c          |  7 +++
>>>>    drivers/resctrl/mpam_devices.c       |  2 -
>>>>    drivers/resctrl/mpam_internal.h      |  4 +-
>>>>    8 files changed, 95 insertions(+), 4 deletions(-)
>>>>    create mode 100644 arch/arm64/include/asm/mpam.h
>>>>    create mode 100644 arch/arm64/kernel/mpam.c
>>>>    
>>>
>>> With the following nitpick addressed:
>>>
>>
>> I commented on the nitpick.
>>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>>> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
>>>> index 76f32e424065..15979f366519 100644
>>>> --- a/arch/arm64/kernel/Makefile
>>>> +++ b/arch/arm64/kernel/Makefile
>>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
>>>>    obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
>>>>    obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
>>>>    obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
>>>> +obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
>>>>    obj-$(CONFIG_ARM64_MTE)			+= mte.o
>>>>    obj-y					+= vdso-wrap.o
>>>>    obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
>>>> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
>>>> new file mode 100644
>>>> index 000000000000..9866d2ca0faa
>>>> --- /dev/null
>>>> +++ b/arch/arm64/kernel/mpam.c
>>>> @@ -0,0 +1,13 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/* Copyright (C) 2025 Arm Ltd. */
>>>> +
>>>> +#include <asm/mpam.h>
>>>> +
>>>> +#include <linux/jump_label.h>
>>>> +#include <linux/percpu.h>
>>>> +
>>>
>>> Nitpick: Needn't include those two header files since they have been included
>>> to <asm/mpam.h>
>>
>> That is a non obvious include chain that we should not rely on.
>> Please keep the headers and continue to follow include what you use
>> style (with exceptions when a given header is clearly documented as always including
>> another like some of the bit map stuff.) It is more obviously correct and
>> causes less grief if headers get refactored in future.
> 
> Keeping the includes here makes sense to me too. Gavin, are you ok with
> keeping this as is?
> 

Yeah, I'm fine to keep it as of being :-)

>>
>>>    
>>>> +DEFINE_STATIC_KEY_FALSE(mpam_enabled);
>>>> +DEFINE_PER_CPU(u64, arm64_mpam_default);
>>>> +DEFINE_PER_CPU(u64, arm64_mpam_current);
>>>> +
>>>> +u64 arm64_mpam_global_default;
>>
>>>
>>
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,
Gavin



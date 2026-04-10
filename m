Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08588E9905C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3Gk/iqagfgguFyW5GwgnbFlQO42N2sl+HGkMv0x0Rg=; b=qXw0sN2pGJ0dbninDe2ORRnlh1
	J0sWpN4PByCHKuHYz5DPAAgsLmxTA2UtuoMR+hFAE5APhk6ulWiiTvzS/9N1kUVySTmmKYlnE/gaA
	bJ/OFPzAVJHHsFgwQoP/qGC6zXMEFRidXwI6ZqrH5cLSF1HGb10YAUfUFgQHCaTPtXAyjfg9FNgsS
	W1FVLfdDP5DQncgfXVUSeaQwlwpd0zmHDe4APOIIC+GleGIj0uQx0MyQOtBRsRvZOhOybn48W13s6
	VLkYbH5yJ2Y7FnPOQmfxiJAX5pqLY37xEhnzOzFoqzaXwmq+q8HLh2wUgx+BvmzjA5IdeZTCofaKo
	Yq5/h9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7tK-0000000Bt9j-1rZD;
	Fri, 10 Apr 2026 09:11:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7tH-0000000Bt94-2zFb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:11:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso17806335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775812262; x=1776417062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3Gk/iqagfgguFyW5GwgnbFlQO42N2sl+HGkMv0x0Rg=;
        b=fmr30RHjZCX9v/dbD8N+XBgxg0N4RwxcjaDTMCVoM++kBAAwWXvQkJfQogIyXfqJc9
         rWhSJQd7DYO6if/nLUbPjKHAe6T6m5R8clIf4YyKCLomPFFI79JtZAJ2CsPZ34poVMAT
         sVcxeNkkTDk7Pp1bhywf/XWLhCWWQR65NOzNlpLEc3j5JwBDB+RFHG6HohQTtLxFbeF/
         YCjgPBvx36vY08wNBSCtdliiepGDHSRCZQo2imJWwi6h5x1wemXg68sNSIiRlTB+F3IO
         O3ttbZeYYUBXvhWcrUuh7eQ30GMT4C9hR1fv/Yj+PQIibv3f8qrwbtgnX4kj9eXVwg7h
         yDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812262; x=1776417062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3Gk/iqagfgguFyW5GwgnbFlQO42N2sl+HGkMv0x0Rg=;
        b=HDRGQSMvHRzQi38yHSpDStWxTcqnC3mRbT7Ic1s9VC5amDGMV/CDM4IYnUpK7GsJLB
         IzibBk1euHX+mwpGYx7i+ge8pM1bnokjT+ebfa+MUA1jSpVZgJkLZsBSwRhxFY28cEXt
         dPVVi2m5QU1r4dA5lG6239YeDhnut8xXTxsLjbPSUFjxsbskjoyQ84xnlwL9zhS0LQxD
         0Tcg4izdF+unYCDNC1s9dsRVST1GClP6DVvZ/HjvSsKqqkEMdB4wa/a9EIAYDcu30KVx
         9swajUngQkdrxgokP7wW/bH9vH4GStZc+elkV+kM9Vr/kTB/7tWWPtuWLgKyd6d5/oxE
         5BWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8dKjVb2IUe5F9UiCALKd2x9xRym/SJvWSkcx/x4XpoXkbeGJVLeDwV9IXbq7RKyXXgon6bfU5SHEyZbuhEjGz@lists.infradead.org
X-Gm-Message-State: AOJu0YyzAz3l8xCwEmktWpt5jlX5DSMpNgzbWemQSYaqdms3FtQAmTOE
	IWT9h1pXa/O5rx1npisRvUlaadjBiUDfpbqygyuY7ez3I66XWmANS6+GxEGTqsUItOk=
X-Gm-Gg: AeBDiesN94KNz0iyk8BicOzTp4BxnhPitdhFM+bULGZucBof1M9JcvLxfMDc1bUHsjM
	YYJsTDSZGOEO4NOibxc5S9zW8QIX7J4DjBKx6slox5Q8fhcVrAe7WatPCmugNELiPeejL4kiVF7
	ZYybdkShqnQLpm1Tv9mkrLmMf7uK9fGcDL8Bj+euj/w5/+VWmeIaNmTB4CRDz0iWLIAStK579VQ
	/A9f3Cf1yEQCW/8bI6Z6cfenN66ootBz/uUba3idVlEsErmZ6pWvpSyznCtTt2m6TDG2HqE2/Ap
	+ArZgmBu5DFVhYlZXkWyWcd7kc3Q8Ro0Yjnn+Fe+ocSW6L9DmFOoqb/uGhnFwz+kTa/adU9UaAj
	bqn7JSPkcvgAU+uh4hUyVNDeYxqNYS7wob7T4iqzcYCaP7AmQB7jUd9HBqnQ3ksEjhNZxj7m5ZZ
	kTzKrePtK5hAifOcOEKtxcpxJgoX9ZwygLK4MOQqs=
X-Received: by 2002:a05:600c:8585:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488d6822a0bmr20352465e9.12.1775812261713;
        Fri, 10 Apr 2026 02:11:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bf10fsm56934555e9.8.2026.04.10.02.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:11:01 -0700 (PDT)
Message-ID: <140ce684-b172-4e1f-ae98-4edd88d4ca8b@linaro.org>
Date: Fri, 10 Apr 2026 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mike Leach <mike.leach@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
 <f20b5a00-1d68-48d6-90c8-97dca2e279a4@arm.com>
 <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
 <20260409144949.GT356832@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260409144949.GT356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_021103_779547_8406715E 
X-CRM114-Status: GOOD (  24.74  )
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



On 09/04/2026 3:49 pm, Leo Yan wrote:
> On Thu, Apr 09, 2026 at 03:30:56PM +0100, James Clark wrote:
> 
> [...]
> 
>>>>> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct
>>>>> coresight_path *path)
>>>>>        if (source_has_cb)
>>>>>            return 1;
>>>>> +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
>>>>> +              coresight_ops(sink)->pm_restore_enable;
>>>>> +    /*
>>>>> +     * It is not permitted that the source has no callbacks
>>>>> while the sink
>>>>> +     * does, as the sink cannot be disabled without disabling
>>>>> the source,
>>>>> +     * which may lead to lockups. Alternatively, the ETM driver should
>>>>> +     * enable self-hosted PM mode at probe (see etm4_probe()).
>>>>> +     */
>>>>> +    if (sink_has_cb) {
>>>>> +        pr_warn_once("coresight PM failed: source has no PM
>>>>> callbacks; "
>>>>> +                 "cannot safely control sink\n");
>>>>
>>>> This prints out on my Orion board on a fresh boot because of how
>>>> pm_save_enable is setup there. Do we really need the configuration
>>>> of pm_save_enable for ETE/TRBE if we know that it always needs
>>>> saving?
> 
> Yeah, I can remove this check and always bind CPU PM ops for ETE.
> 
>>>> It also stops warning if I rmmod and modprobe the module after
>>>> booting. Seems like pm_save_enable is different depending on how the
>>>> module is loaded which doesn't seem right.
>>>
>>> Thats because the warning is pr_warn_*once*()
>>
>> I don't think so, I tested it with a printf instead of a warn once and also
>> tested modprobeing straight after a reboot.
> 
> I am a bit surprised that Orion6 hits the CPU idle flow, as I observed
> that idle states are not enabled on my board:
> 
>    # ls /sys/devices/system/cpu/cpu*/cpuidle
>    ls: cannot access '/sys/devices/system/cpu/cpu*/cpuidle': No such file or directory
> 

/sys/devices/system/cpu/cpu0/cpuidle:
total 0
drwxr-xr-x 9 root 0 Apr 10 10:08 ..
drwxr-xr-x 2 root 0 Apr 10 10:10 state2
drwxr-xr-x 2 root 0 Apr 10 10:10 state1
drwxr-xr-x 2 root 0 Apr 10 10:10 state0
drwxr-xr-x 2 root 0 Apr 10 10:10 driver
drwxr-xr-x 6 root 0 Apr 10 10:10 .


> If you hit only once CPU idle notifier, it is good to add a
> dump_stack() in coresight_cpu_pm_notify and print the "cmd" argument,
> so we can know the calling coming from where.  I am a bit suspect it
> might be a glitch in CPUIdle layer.
> 
> Thanks,
> Leo


cmd: 2


[    7.878456]  coresight_cpu_pm_notify+0x148/0x4b0
[    7.878462]  notifier_call_chain+0x8c/0x1e0
[    7.878467]  raw_notifier_call_chain+0x24/0x38
[    7.878469]  cpu_pm_exit+0x34/0x68
[    7.878472]  acpi_processor_ffh_lpi_enter+0x40/0x78
[    7.878476]  acpi_idle_lpi_enter+0x54/0x78
[    7.878481]  cpuidle_enter_state+0xb4/0x250
[    7.878483]  cpuidle_enter+0x44/0x68
[    7.878487]  do_idle+0x1e0/0x278
[    7.878492]  cpu_startup_entry+0x40/0x50
[    7.878495]  rest_init+0xec/0xf8
[    7.878497]  start_kernel+0x348/0x400
[    7.878503]  __primary_switched+0x88/0x98



  -> zcat /proc/config.gz | grep IDLE
CONFIG_CONTEXT_TRACKING_IDLE=y
CONFIG_NO_HZ_IDLE=y
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_MULTIPLE_DRIVERS=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_DT_IDLE_STATES=y
CONFIG_DT_IDLE_GENPD=y
CONFIG_ARM_PSCI_CPUIDLE=y
CONFIG_ARM_PSCI_CPUIDLE_DOMAIN=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set




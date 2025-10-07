Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59251CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLT7E82k3/nAzXKrTOeZcFcGHtQF2fAe7zUoeshkzjo=; b=DDvaguzJ7Z7WaNgOhBoIHYwgNp
	DCWrpVZ/IG4dvH6eLtMjrJ6iW5zDJv6DoXt4d4VVPUyx1fi3awy4G8kZke8mAS/uDbF4hUFr7NPDX
	5VcLaw53LAsRhaW0n6LdKIO9AnK7+fFk2HR/fNqvkDRZ/UIqLeW1/uQJtAd6q6BPwIlRRMgLAZ1Pt
	fafev1j9WlYOGAP3YrryTHi1y7BEOT8c1yhB5FJR8ChFyuYPgNcH7q/DjIDyQhNNWCXju0nFmckQL
	0p5WEtB7DxaBZV0yJ+O3kIvWe5gVPcGF60uapY130DvNfRYd/8I0UhGS5UHPZqf/cm47BTy02s6qd
	BNcsGOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67Lw-000000021LI-1FMg;
	Tue, 07 Oct 2025 13:03:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67Lt-000000021Kp-3Uts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:03:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so54890725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759842216; x=1760447016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLT7E82k3/nAzXKrTOeZcFcGHtQF2fAe7zUoeshkzjo=;
        b=DeozltC71EHPlMzHCtccPUas1O8MWlWiAbwFhoe08LgnzMMTXuhssKub0CnXbvKEsI
         y7vagmszyOAPJwWsxG9h3VbC99P2TA7GH+74xA8BX5rjv0GdZCgPd+owT3laNlhI67zM
         mtDbeWOfBJ+pUSZoEvs6kM4PTwXuaiK+eJ7KBAdNbwZ6oLIZdtZujF2+WERBPbpMiA02
         bmam8l+CiKqt+ps0INVdN1i9XUIA55r3bTLAHLnEA86Zye8H/R82HUVcIoTOAZhQKyV7
         Egmtde4E0LkYsZ4nY13sYrqUpP9BxGePakdFm6TilSM5N3GrVYgklViRLnJmtbtN6jPL
         4RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842216; x=1760447016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLT7E82k3/nAzXKrTOeZcFcGHtQF2fAe7zUoeshkzjo=;
        b=BjtzHXi8ORA70xx/TdMI4bjMKGTmlulKyPtlVFpJfAHrhPMwfsrWHTVEi+jMRlJCUj
         89TOGURnyuuDZoKXsg6e0B06wq5WIusgVS+EvD/zFoYvrUOIvdgID3vQ7a544ETKW3EP
         WSzllTgcYec23BgZI/nVGsmp68zgSWlBFEfMfpWt9TOjaKG3b5PaSWqHoPTS4Y9uaWDX
         wGgyy6p68qF8x0oChngOUt/wmYDR+POyRejsAqnHeAVtr3y37TvD1Fma6HQ33Zm0DlpD
         A5Q99wuemklIhd3D4PjZKIiCzQ5v1yQ4HysUIoFZDB0EoaNpUgzo2av8NpSVsLJhm9yG
         QNVw==
X-Forwarded-Encrypted: i=1; AJvYcCUuK6oP8YhPSAnMwudfmTd+v9ePzmcpJPE5hWYXXUpL6/r5ubyur2itkvriCSDPWwERFsUMej3d0Cbw97RgVIzo@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfyWh5ccZqCuLjWxLmcV6wH135UDwMp5Qcywt5GwKw5nSC5qJ
	p7EWIJTtyjdxl5N82AfLp+4Usbd4amlDq5kXQZ6Mo6LPEp0w3KYrrRhv+lmX2mSOCQA=
X-Gm-Gg: ASbGncvzssYEOyjJBa3RDnzj9HGVd704Zf8zk+iJGKuzKmCI7BJV8Znpq7dIYV9Mfcb
	mJmX3eSkU5ShDicJUJuMNlL8vqKyiEomDHsum1iRguuapHDQmvjefhpOtGYobBkIrWh8KjWLDnI
	rFflV+S155CekOPeej6DqpSksB3M4PxUd0kj6hQx/IrvznzlT/PCCfA+VHAeKAiFS/ckD7d6T1F
	aUqzG6I0yzKLhwzA67O/1OL62Pbe/1jTN1Cu2TDsymt0SKXYE3EajeEiNTJArG0/p/rw5+f96FJ
	eOtyLjwji5AGYP8tenEf+TqhlTJ2Ld/S9yMonBVDQ0DpAa8JJviuBcXBFCW9wcJjb7HluEQRtVU
	kdNlAEsgOGSbbFCp4oNAaklOHaM2LNNLVbKlDvPj28XVfnYfqsWDn5czlcJ9csqoCmvs=
X-Google-Smtp-Source: AGHT+IHFX05i3Bo2dJ+28Pz+jk8A6mCk8TTO90qEnzOD32VYvacywnD696sUpQD5H40myKc9rCtxJQ==
X-Received: by 2002:a05:6000:2312:b0:425:8577:9cd4 with SMTP id ffacd0b85a97d-42585779d29mr1421911f8f.54.1759842215757;
        Tue, 07 Oct 2025 06:03:35 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0170sm26201546f8f.49.2025.10.07.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:03:35 -0700 (PDT)
Message-ID: <5f04f559-9bc8-4ba8-b1e9-fc1ba5342acd@linaro.org>
Date: Tue, 7 Oct 2025 14:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/31] CoreSight: Address CPU Power Management Issues
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_060337_924677_FDA3B538 
X-CRM114-Status: GOOD (  24.26  )
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



On 15/09/2025 11:33 am, Leo Yan wrote:
> This series addresses CPU power management issues in the CoreSight
> drivers. For easier review, the patches are organized into two
> categories:
> 
> o Patches 01 ~ 10 focus on CPU power management within the ETM drivers.
>    These patches fix SMP-safe access to the mode, correct context
>    synchronization, and refactor the CPU suspend/resume flows.
> 
> o Patches 11 ~ 31 extend CPU power management to cover activated paths,
>    including helpers, links, and sinks. These changes move CPU PM and
>    hotplug notifiers from the ETMv4 driver into the CoreSight core layer.
> 
> Summary:
> 
> - Patches 01 ~ 03: Fix device mode access in the SMP mode.
> - Patch 04       : A minor fix for polling bit.
> - Patches 05 ~ 07: Improve the context synchronization based on the ETM
>                     specification (IHI0064H.b) and Arm ARM (ARM DDI 0487
>                     L.a).
> - Patches 08 ~ 10: Refactor the context save/restore flow in the ETMv4
>                     driver, in the end, the CPU PM callbacks reuse the
>                     normal enabling and disabling flows.
> - Patches 11 ~ 17: Move CPU PM code from ETMv4 driver to the core layer.
> - Patches 18 ~ 23: Enhance the CTI driver for preparation dynamically
>                     controlling CTI devices in PM flows. This includes
>                     device mode handling in the CTI driver and
>                     distinguishing trace modes (Perf or SysFS). Refactor
>                     the PM notifier and improve locking usage (including
>                     for syscfg).
> - Patches 24 ~ 31: Support save and restore context for TRBE and
>                     manages activated paths during CPU idle and
>                     CPU hotplug.
> 
> Verification:
> 
> This series has been verified on Juno-r0 and r2 platform.
> 
>    Stress test script:
> 
>    #!/usr/bin/bash
> 
>    echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> 
>    while true; do
>            echo 0 > /sys/devices/system/cpu/cpu2/online;
>            echo 1 > /sys/devices/system/cpu/cpu2/online;
>    done &
> 
>    while true; do
>            echo 1 > /sys/bus/coresight/devices/etm2/enable_source;
>            echo 0 > /sys/bus/coresight/devices/etm2/enable_source;
>    done &
> 
>    Test script with kernel module insmod / rmmod:
> 
>    #!/bin/bash
> 
>    modules=(
>            "coresight"
>            "coresight_dummy"
>            "coresight_replicator"
>            "coresight_tpiu"
>            "coresight_cpu_debug"
>            "coresight_etb10"
>            "coresight_stm"
>            "coresight_trbe"
>            "coresight_tmc"
>            "coresight_ctcu"
>            "coresight_catu"
>            "coresight_etm4x"
>            "coresight_cti"
>            "coresight_funnel"
>            "coresight_tnoc"
>    )
>    module_dir="/mnt/build/drivers/hwtracing/coresight/"
> 
>    if [[ "$1" == "in" ]]; then
>            echo "Inserting modules..."
>            for mod in "${modules[@]}"; do
>                    modprobe $mod && echo "Loaded $mod" || echo "Failed to load $mod"
>            done
>    elif [[ "$1" == "rm" ]]; then
>            echo "Removing modules..."
>            # Remove in reverse order to respect dependencies
>            for (( idx=${#modules[@]}-1 ; idx>=0 ; idx-- )); do
>                    mod="${modules[$idx]}"
>                    echo "Removing $mod..."
>                    rmmod "$mod" && echo "Removed $mod" || echo "Failed to remove $mod"
>            done
>    fi
> 
> ---
> Changes in v3:
> - Fixed building failure in ETMv3 driver (kernel test robot).
> - Refactoring ETMv3 change for checking CPU ID (Levi).
> - Fixed NULL pointer issue during CPU idle (James).
> - Fixed lockdep complaint for HARDIRQ-safe and HARDIRA-unsafe (James).
> - Fixed acquiring mutex in atomic context (James).

I did still see some lockdep issues, but only when the CTI driver is 
loaded. With it unloaded I didn't see any anymore.

I couldn't stress test concurrent sysfs and Perf mode because it's not 
working in coresight-next to begin with. When sysfs mode fails to enable 
a source, it will disable the sink even if Perf is using it and then a 
load of WARN()s get hit.

I also managed to make rmmod explode by running it while the sysfs 
stress test was running, but I don't think this is related to these 
changes either.

All in all, difficult to test given the current state of locking and 
concurrency:

Tested-by: James Clark <james.clark@linaro.org>



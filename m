Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUGibisXe9koRyEix8gofnKMJpigPW4QInNt2SqBk78=; b=RLRpFWomRPOCZ/nMxdBJqxJttK
	r0HgrawULgVgp+oSyDa7VhJc9pvXAySpk9KF7dKwVZ/QNlACZUdUTLi8UvIkM7U++bOv1LzeuNVl2
	u0ADyYdwtzdw2RyUITnUIHHFn5mo8581xg1A8Fykfn2VAvT7fbX8VIqKueGGwxz8AVC3ivHIKZz5e
	JUe4v8qPmn8NJ4dQrmQtBDTqFd83NreUWk/g+fMW78RFqvAGJavUlFGSY6Nr5uPZJpQb8KyZNE/Mz
	A3ODVkcoSOCFtZzmFYrida7BHVpT9urpIlS4Jk7SdU1UQyYTM6FZQcBy0sAoA0bbzl1JZkY88Onap
	7th6/1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITtp-00000005hVJ-0ebD;
	Mon, 10 Nov 2025 15:33:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITtk-00000005hTu-3jhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:33:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1256924f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762788819; x=1763393619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUGibisXe9koRyEix8gofnKMJpigPW4QInNt2SqBk78=;
        b=QQu1WxSMKpHSOsGdwUcyZS4gRoN1EPWwRYmPaon38FH7ay/X/TM3OLv9RNYJL8yPBQ
         YcqLs5JsuCfMKt6joqgyuyfwqMLVOW6adQ+tqljU/cw3ARxo4ipGMOuGBkAluhePPdw0
         1kifIs1b2dFL9EvT90Aqp7b7E4Ydc/I3QkKbTJcVYRvsYnDoX6Wa9dgcQdMCxtzG70MI
         Mj4bYegfYKnyNgt1xX1Fv+d+QqtWpOqO1bUJlv6pmFnufY1JJkYXg80LaOWFr2h6SvCV
         6rvky8Al0O3W9ZA+YGr1gBZKLoG/NI1iMPjnDM0kLNMP3T/0wlPGFEHzh8o+bku8bWS5
         wDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788819; x=1763393619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUGibisXe9koRyEix8gofnKMJpigPW4QInNt2SqBk78=;
        b=ojnYuMebWdbYMU9g+Xj101JazQelPEDh21byTwwZ11wLI6r92AAqZ6wGzulIp8cUci
         5u16jEQ2eCrUcDkpx4blWQgk9oMStT5NhBn+7BElHr1lj5rKHugFs3jrnEBU/zIq98YR
         U4BkTydj5+iX8me6xsbJ9d2b4CH4/IMKPqoj+xTXK4pSn3iBFE+RzSBn29p0Ruy4afVs
         r1JhsJMM4LLbuYFPj/sEcnOhHfnP2eMQJ04zw1i2M92wwRjSXOAzJO44NdEo6+tpCy0H
         EJsYcjPmwKtQGlWBbk9dwI9pu57BgoPRScZTcLHDrW2s6S2Ei5kjyafxxk3eiAEvI83k
         /0oA==
X-Forwarded-Encrypted: i=1; AJvYcCXKrhlHiIeESH1zo1FTxunrK6GVlqXJikqqxxP27qDwRk9yHWIRyyY9dM66vAtC7Ty1n5tmkQY1/rS1kcyFF4XJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/mvXBAIC5HKmPMD3UgwIJqa5Ge7n2TVN8XDIsRwdYC1f3JaL5
	hKDoVvlpw5RLYTEwnvhvpT+wIfKc1cj80SyVs2wPqSHobj+IVguJ5we4JY0nl6AJNm8=
X-Gm-Gg: ASbGnctB2+7Bn53wndb9QQWD49X3XP+K5lZbrRE3VAvaccGJQ+Fb3glyKCMH+akTa5C
	M19BT2R+vknGdKRr4VCaN6f7l7aXS5Iy6pJGyow8JflkBaYw51D8yJK41Xs47G0n8z7YY004H0E
	NE7nlKdUQHIz8NVTB/tlqKpQC/LpO3b+02HeXX9yNdeukIgPK1PQwFnp5F8vz9Q00vDfeVEPkxj
	j7BeI426pxWHZedClq4zM41RqJ7BEZFZWrM1i47c88tGpBExBgYqwzeZI0kkTBarb5nQCL/HGPP
	+HpJAN7pvBhQII0aVOoVxCYzeEytGNW6UnHGgPqQr0QLYtXYaAV9Xd/PXCMXgXHUa8bw4LVi6il
	C/w7umzcT7gakspkGY/uCUCQW/jZxl+703O2Nzc8A4CSp7e6Qs+uf1pLoxc8FaUNw/ciEsu9DDZ
	Q6KQLOOWZwOxVxlV1+
X-Google-Smtp-Source: AGHT+IFg/c4iBjITgfSH2NEXDg4UMr0VLqi6W1ILL0+RjfmyBvDTMf06Ygi51FcTwdYdkilkC6tivw==
X-Received: by 2002:a05:6000:4308:b0:42b:3592:1b82 with SMTP id ffacd0b85a97d-42b35922000mr4712784f8f.1.1762788816966;
        Mon, 10 Nov 2025 07:33:36 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2f7a0512sm15485880f8f.18.2025.11.10.07.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:33:36 -0800 (PST)
Message-ID: <54be24e8-2a11-4b59-ba64-a67eb34932e4@linaro.org>
Date: Mon, 10 Nov 2025 15:33:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] CoreSight: Refactor power management for
 CoreSight path
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_073341_004138_660B6A28 
X-CRM114-Status: GOOD (  25.11  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> This series is extracted from [1], focusing on CoreSight path power
> management.
> 
> Compared to the previous version, this series is updated heavily for:
> 
> 1) Dropped the global per CPU variable for saving path pointers.
>     Instead, the activate path is now stored in the source device's
>     structure.  This allows fetching the path pointer naturally based on
>     the source regardless of whether it is a per-CPU source or a system
>     source (such as STM).
> 
>     This improvement addresses Mike's comment that, later we can polish
>     coresight-sysfs.c to remove the tracer_path variables.
> 
> 2) To simplify the series and make it easier to review, the CTI driver
>     related fixes have been removed from this series and which will be
>     sent out separately.
> 
> 3) This series disables the path when a CPU is hot-plugged off but does
>     not re-enable it when the CPU is subsequently hot-plugged in.  This
>     simplifies the implementation and keep it consistent with the perf
>     session's behavior.
> 
>     It also improves security, as there is no risk of unintended tracing
>     caused by a CPU being hot-plugged after a long period of inactivity.
> 
> This series is dependent on ETM driver's PM improvement series [2] and
> has been verified on Juno-r2 and FVP RevC.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com/#t
> 
> ---
> Changes in v4:
> - Changed to store path pointer in coresight_device, this is easier for
>    fetching path pointer based on source device (Mike).
> - Dropped changes in CTI driver.
> - Only disabled path for CPU hot-plugged off but not enable path for
>    hot-plugged in.
> - Removed James' test tags for modified patches.
> - Link to v3: https://lore.kernel.org/r/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> 

Tested-by: James Clark <james.clark@linaro.org>

> ---
> Leo Yan (14):
>        coresight: sysfs: Validate CPU online status for per-CPU sources
>        coresight: Set per CPU source pointer
>        coresight: Register CPU PM notifier in core layer
>        coresight: etm4x: Hook CPU PM callbacks
>        coresight: Add callback to determine if PM is needed
>        coresight: etm4x: Remove redundant condition checks in save and restore
>        coresight: syscfg: Use spinlock to protect active variables
>        coresight: Introduce coresight_enable_source() helper
>        coresight: Save activated path into source device
>        coresight: Add 'in_idle' argument to enable/disable path functions
>        coresight: Control path during CPU idle
>        coresight: Add PM callbacks for percpu sink
>        coresight: Take hotplug lock in enable_source_store() for Sysfs mode
>        coresight: Move CPU hotplug callbacks to core layer
> 
> Yabin Cui (1):
>        coresight: trbe: Save and restore state across CPU low power state
> 
>   drivers/hwtracing/coresight/coresight-catu.c       |   1 +
>   drivers/hwtracing/coresight/coresight-core.c       | 273 ++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
>   drivers/hwtracing/coresight/coresight-cti-core.c   |   1 +
>   drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
>   drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |   2 +-
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |   1 +
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 137 ++---------
>   drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   3 +
>   drivers/hwtracing/coresight/coresight-replicator.c |   1 +
>   drivers/hwtracing/coresight/coresight-stm.c        |   1 +
>   drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
>   drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c      |  12 +-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
>   drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +
>   drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
>   drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
>   drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
>   drivers/hwtracing/coresight/coresight-trbe.c       |  85 ++++++-
>   drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
>   include/linux/coresight.h                          |  13 +
>   24 files changed, 425 insertions(+), 140 deletions(-)
> ---
> base-commit: f9ac95561513e18c2a2cf8905355dc5f0e030c46
> change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
> 
> Best regards,



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9656AF53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv8MhrekPermzw3nj2g6zJIRY3FVYL6M+HPHEHbOI+c=; b=azXQdgE73h7kVXUcgk9vKkEuC0
	8mRG8csDXOjTSddadeOV+9+9k4etBeOhoV7yjfv1erYGzuaIMfZSJgC3osFsQe7o+p9Wf+YveHkFc
	YLmvUpAUrVDhhNenVhjMkod1H1hoYWpyIioABAXdpCPA/t0Y5Tm5gD/roLq62GYPRdDrvVNHLTeGp
	fKUG/NC12yt0HM40QmCwaSqGzDGdvWcoBcKMZzlIbg/TgmCLK/WXH2fHtwWOhHSvQXaoWmokAuIKq
	zQC/LcWq6uhESWoNT86MUDJKc2NvAhXXq953uB38JRGJmfOshBryPYTVh8yVrr25u0O37Vu+buBXo
	qSmXUU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AUd-00000004PtK-2NpY;
	Mon, 16 Mar 2026 16:08:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AUa-00000004Psu-2eET
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:08:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4691532f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773677310; x=1774282110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vv8MhrekPermzw3nj2g6zJIRY3FVYL6M+HPHEHbOI+c=;
        b=WxdjVBd/WUAaRO3v8NU9QHB2IRRxPUT+f9NGUiQMBsK4bpVH0fffndAoM2G+g8kVDz
         t2hwJVwH8XJ6Rx7yyyhS9qWg5jznmUpi1YHX6Yl+JepJnt9/bgEKaYXpT2EgwGFTIOjc
         I8xooFytamlKVOr6W0xc/1CLksVzliHrcQFjUq/mrHXDIvMRyLRsOY8jOyNAMtF9ZVu5
         kOlYmh5Jn3fRGIIZz785NTXlB1nDChjfN6HAnHT4w1iQQZVtdYVZcSFZobKvKDu56+Is
         MR7Z+3XfZdVXmQyhp1koTW6y/ZYSWLfEta7RyKO+pouNJ2GquXOqA5epAQ5y6zGd/SSm
         g6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773677310; x=1774282110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vv8MhrekPermzw3nj2g6zJIRY3FVYL6M+HPHEHbOI+c=;
        b=lEvBmDrKlo+UdhW+YLEaOuhFdxquYmjNUE6RA9bRYphBPRAt2V1PKb2qgJzXVKl+Ci
         AJtpD0HMGb1vBxL9tomj/WW0AklNKoQ6Mro+8ZM+iZvitybtr4fs1V7nXVDOP+w1wWtZ
         T2EkmZNr2/w6R943RZu1WPzLyX18X4o+B/nslbAwRs2rafEg9uvb4xq8PqzbFUYFiAZA
         iNr0NdL4+lXbqe46ecJ6n6xCjk5gzcjEZbL0IOC5slaV/i5DdCxLx3uc2V+3Gjtgv08M
         WW/HeID6qddF1tl97guKZBoczYKW39w/oRperE+LKT5oG+X8KpvA6l4w6nO6zBJwRN3z
         XtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU78y/wpN3rWAx/nRgfrGjkmZ8Omw6jxzXy0DgkU8gw8M3QKAmv1xZTRrXQ+6BOsZ9HVslA6zcrcmeAIZRzIcns@lists.infradead.org
X-Gm-Message-State: AOJu0YwgBCOYg6vHH3un+Gwj8TBgH1K+zLxeXg6QQKWwufvmuEHYDuQC
	2yKgj6FcDDJ3Suq+BIqgAJ44E6Klv2njeWrDjr5Tk4h2pXCFKNr5yd6VWIrwc+ajAt4=
X-Gm-Gg: ATEYQzxLX2llASRMAuX0mCajWqcNo88qLCKIAE4vVDRwLo3R4TdfckPL+JKUAARAo+Y
	hUEJdQpZhyWoJQoPpDevYucuF7Ld1O3SbnPsL2+BADk4D18152YxZj864sp23M5eRlMs90f8xyD
	Z6ZvOp2ZiDFF6M1RT4nU78jLAaKzmAqXiq0aQRPo3yEaGk9s5HCEjPrrhMCgUyMJUXPJMP1jr0c
	lecY8mdplVm7J6hvPZtEBQwbRerkOUO0YbM765odJyoCggW+Uf9VmMf4xO9d2XZFGs3GyYLx5Xr
	p10KxqrHxXkx0YMwepJa4cbBfqlNdR8PsL5CkNOgrW4LA5kB3sy1eHYkwKPwF+5gJzo0aUkwYWv
	s+JfU7/doCqfiynJ090ptCQnS6bAMjiuQIBOffCSIX7huxgEwM6d6FdES6sSK5hyS0M4wTY1deR
	RjWSLpSz6Zk3uQ9hVS9GSmJ7Z4sjgC
X-Received: by 2002:a05:600d:6444:20b0:485:4388:3492 with SMTP id 5b1f17b1804b1-485566d8d8fmr163862785e9.11.1773677310284;
        Mon, 16 Mar 2026 09:08:30 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9c387sm2538015e9.8.2026.03.16.09.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:08:29 -0700 (PDT)
Message-ID: <b373b619-00b1-4f65-9187-e1c7214a6b98@linaro.org>
Date: Mon, 16 Mar 2026 16:08:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/19] CoreSight: Refactor power management for
 CoreSight path
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090832_709948_C6F18ED3 
X-CRM114-Status: GOOD (  23.08  )
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



On 05/03/2026 10:17 am, Leo Yan wrote:
> This series focuses on CoreSight path power management.  The changes can
> be divided into four parts for review:
> 
>    Patches 01~06: Refactor the CPU idle flow with moving common code into
>                   the CoreSight core layer.
>    Patches 07~14: Add link control during CPU idle.
>    Patches 15~16: Support the sink (TRBE) control during CPU idle.
>    Patches 17~19: Move the CPU hotplug flow into the coresight core layer
>                   and simplify the code.
> 
> This series is rebased on the coresight-next branch and has been verified
> on Juno-r2 and FVP RevC.
> 
> ---
> Changes in v6:
> - Rebase on the latest coresight-next branch.
> - Always save and restore TRBE context during idle (Will).
> - Use get_cpu() / put_cpu() when set the per CPU source pointer.
> - Link to v5: https://lore.kernel.org/r/20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com
> 
> Changes in v5:
> - Set the per-CPU source pointer on target CPU (Suzuki).
> - Reused existed enable/disable buffer functions in TRBE callbacks
>    (James).
> - Refactored refcount for source devices in SysFS mode.
> - Released path in cpu-hotplug off flow to avoid memory leak.
> - Updated ETMv3 driver when move common code into core layer.
> - Rebased on the latest coresight-next branch.
> - Link to v4: https://lore.kernel.org/r/20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com
> 
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

For the unreviewed commits:

Reviewed-by: James Clark <james.clark@linaro.org>

And did a bit more testing on Juno:

Tested-by: James Clark <james.clark@linaro.org>

> ---
> Leo Yan (18):
>        coresight: sysfs: Validate CPU online status for per-CPU sources
>        coresight: Set per-CPU source pointer
>        coresight: Register CPU PM notifier in core layer
>        coresight: etm4x: Hook CPU PM callbacks
>        coresight: Add callback to determine if PM is needed
>        coresight: etm4x: Remove redundant condition checks in save and restore
>        coresight: syscfg: Use spinlock to protect active variables
>        coresight: Introduce coresight_enable_source() helper
>        coresight: Save active path for system tracers
>        coresight: etm4x: Set active path on target CPU
>        coresight: etm3x: Set active path on target CPU
>        coresight: sysfs: Use source's path pointer for path control
>        coresight: Add 'in_idle' argument to path
>        coresight: Control path during CPU idle
>        coresight: Add PM callbacks for sink device
>        coresight: sysfs: Increment refcount only for system tracers
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
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |  65 ++---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 153 +++---------
>   drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   3 +
>   drivers/hwtracing/coresight/coresight-replicator.c |   1 +
>   drivers/hwtracing/coresight/coresight-stm.c        |   1 +
>   drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
>   drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c      | 126 +++-------
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
>   drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +
>   drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
>   drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
>   drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
>   drivers/hwtracing/coresight/coresight-trbe.c       |  60 ++++-
>   drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
>   include/linux/coresight.h                          |  11 +
>   24 files changed, 458 insertions(+), 274 deletions(-)
> ---
> base-commit: 9c5ef7a30d9044f8706bd02bfdc4eff7266f3e25
> change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
> 
> Best regards,



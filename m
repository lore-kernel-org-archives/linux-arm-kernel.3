Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5109CEBFD36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOLcEaHa7/zV1gsKgvu8VKSWds+w3vTjbV4Q31ijsHo=; b=Wia5yAqHWaQ5NxV5EXETojdxD3
	/giGeYGTJr0Mc2AUkF9xmBRW9xylGhAKQsW3m+8wPAfualFF72VyYCZxbfQxjlpV0SnTNkipjKL5d
	fWsfTRVMFlrJJEVsDcrchrwo9qBCC6A/tJlcS2cVE4FG6xOyAixUfDk79b+4Sbl0iyYBeADSjZ5fT
	Yd2OLYPgaO0W8e+4JISr2aseBFxnAdbHdrRJ7DqcVBwe9vYg4wR0eIbUeT1YjvuahgDQoZ/lS+tAs
	IO4z2w3RuaM2FncFGvOw6BkwKG+u+igCGkWZ5sgva5AUgMxvCpqQ2pQb1KOJcGDx4Cw6+XUO/0Hko
	Kk1ESHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEYv-0000000FUhn-02V9;
	Mon, 13 Apr 2026 10:30:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEYs-0000000FUhQ-0ErF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 10:30:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7vapv1616973
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOLcEaHa7/zV1gsKgvu8VKSWds+w3vTjbV4Q31ijsHo=; b=TAbXRthRtKlDnnyx
	fjV7BhXTn/8VZMy4XquP7B8XmuGJvx6qXefszEdyAseP2LERF5LtxpPU8zHm+PJN
	TXWuKY458x6pX0zhzzf6MPHFzMqbbYSrOthZTUv6YO3+fRTUN1tBWO0HxRmbV7PK
	5oLM76sFoQv/YZzBRcDwtbcOf6CMJ/wEUCe/ifl1LiRTRRTjAfBYsPZZNN8kfXZT
	VUmctNlOe4gfOeLczE2UVonXEWcs9bVL9IzVwd5zpY7ywPTJdBrFg/7MHaSWXsB4
	QP0YtbjMMkzJkzqVhW5Lu59jAgAIwBQIsr9hZ4KmeV9xzs9KdZ+CXjidV+K/f6zf
	XMqI0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmx11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:30:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c613194caso2185538b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776076231; x=1776681031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bOLcEaHa7/zV1gsKgvu8VKSWds+w3vTjbV4Q31ijsHo=;
        b=bj5Qu0LB3ekVWBTbcXjZzonOK+GjZykHVHsizcNcWiQqib70wLRC9ocfkcebtoZV8i
         Rv2UB8mauT75HwuZachnTSdWUPFGA2P5JWW2agqsTiSgv3v1WOhK00NA/n/591nmJFDN
         KQykyXUWHmpGszt5wDnywTKAuGx2si3mIufmqoDrnDKB7Wdkm72ab0uv6nv5zLs1quXP
         bBP19O13Y3sChA0iK96jtWuuAOx4hafqTNCsEdrCewtdozlouvRE00lUz3inIBAwnRZk
         EizKtVSjr8vofJ9OQw6LXGf6Fox9shENHqlRJj2Np8+RL/qzx8TcfChyHX2G7qgx18PX
         lmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076231; x=1776681031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOLcEaHa7/zV1gsKgvu8VKSWds+w3vTjbV4Q31ijsHo=;
        b=s8ooK3QDpjyJMmW7b0uNo80XD8mDx6icS3MyOZHGpxYOtbcvRjYKmmOS5hp0YaGYVW
         ZgOyxgQEyJ85L9se5nGyMeG9CDm2NqB8Kmjjzm6p/wxEViUxnUdjOAqIvBwMGiP/CLYG
         nEeJYLPrykuho1A8lCc/y0sHE/G/7DzZRHBuNYU5WNN13WiIccCP2n14KUzqRGsvF6S/
         o0O6ySGrz4Ba3KwXde8XAMXVqZALdn/Yna2/GjQy1DCsFjHZKO/JLhI4vDY/9rI5IHdc
         X2AG+UAbfFq6ILAJvzWVCkOFOSPWeogTqA1eN3Avzx2n0ZoMg2ixlkOMrXTt7u6dQk1Q
         NGWg==
X-Forwarded-Encrypted: i=1; AFNElJ9NAeRdnaIqk5WuLkTvgPOM6yO/pSED/ut5uqHfW0fQFjOVK2pcoIiCSiOrWAWvV67Do/AMDe7WZyNJ3TeYxb2o@lists.infradead.org
X-Gm-Message-State: AOJu0YxMCGk4lTX+TXx4ef1eDhkGwxOftydtuQUNGD2+mvUdOtWY307v
	/pG0ycGX3ZPfVxOc678hh4oElWe3hycbJGzWL8k25yv8Is+Z+UzSeL/rP8zarUYUoXUiW3p3Ppb
	gplk2IWJjQTkS2cJqRnlEgy9EGbCT8sGSAbenpo3cHsumcBaxu9h2hsD5V6v/Z0y1JkWZMWCZl4
	PNZA==
X-Gm-Gg: AeBDietrjFTqcgpnLYwMiX6p8Iblsig3ba6lIPoNrnvqIbPWooMB36Yrya/aI5C94wN
	g1ZBalvdRJnlMOzStnNBuoNxXL/D4Ar5wDv5LvdEhaW7Whta9woTnJJZ4lNvT7JP8/Wj/zsRJ88
	zDpmnoOigf0QdqU+uJ3dif1iQ3/yjLU+3hIqJ1V04xjYPsL8A2fhVD0I8gJBqvcCqqCx1IqUxhp
	GD3r672O2H8s3r5vFG9t2ED24OXb5+rrWbu3jdDYa2lCY3u3Uuq5zGulpfQ5lGSfaRRzeIX5dZ7
	HHSWwdlCDmoHBCEKwx6mj5pUjjP4OEyFBA5Yo0lNyClLj9KrCH+xbrGUW1q3hLLSH/yCn2O7AO9
	lI19ZJ6E/C4SldzrHo6NFBmz8rHc4k7fjYz/Keb2jdrCSeJPKwVo/j270gA1vUKVGAPanNR8uNO
	tTHAFiZ2C39A==
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr12751476b3a.23.1776076225895;
        Mon, 13 Apr 2026 03:30:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr12751430b3a.23.1776076225308;
        Mon, 13 Apr 2026 03:30:25 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm11753285b3a.2.2026.04.13.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:30:24 -0700 (PDT)
Message-ID: <0dd1c432-884a-46c1-828b-f3b22769d000@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 18:30:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/20] CoreSight: Refactor power management for
 CoreSight path
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
        Keita Morisaki <keyz@google.com>,
        Yuanfang Zhang
 <quic_yuanfang@quicinc.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcc5c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=wEFu3AWmQ15o74u3PhUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: rSdZgg6We91GeObX3GucjQfOM1hZ2K7z
X-Proofpoint-ORIG-GUID: rSdZgg6We91GeObX3GucjQfOM1hZ2K7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfX7jqEJf/v2FCc
 vScfLsm9RDPdHz4G3K0A8krFdkRZBNe8K1XO1ADSHNQQpg641HU042UJRTYhT/U42UO1kqs2/Nk
 gmDvwgpjq297D/hSnmV41EjlV/L9OaEGQwra6R/I5QfXw+CjoaX9WOnEkTjhsGaQs4zwzi+sqba
 r+Y0ztq6XjKoa5e/0coBEYluBfUvfWcaoQN9xkjT/9WxodfquWApm6PiapiVHdm/EbbUhksEcy+
 r5tFkQtQhVq4M6I3oxw4AiNwpHr29FjXbDwFrEi7aUNCbcliazDcTsjFT1dpUje0zLxyiWd8KI7
 enXzHqFvKgi/SUKI4EFJM4W445lcAqxY92QNPTa3ldifc6wP27zYcKyaVJjnznqPRAfCCNSRaNx
 AxeO7T9dTlVUA4urEYEzEuv/dk72E1zx+m/vyhSWfuJUapkEG0ZbpQrDPixi6819iIc5HRmgYOQ
 NU3byuyyYc5fwQpL5Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_033034_292966_CCC465D8 
X-CRM114-Status: GOOD (  26.97  )
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



On 4/5/2026 11:02 PM, Leo Yan wrote:
> This series focuses on CoreSight path power management.  The changes can
> be divided into four parts for review:
> 
>    Patches 01 - 04: Refactor the CPU ID storing in csdev, later patches
>                     consume csdev->cpu.  Move CPU lock to sysfs layer so
> 		   it is safe for later changes.
>    Patches 05 - 09: Refactor the CPU idle flow with moving common code into
>                     the CoreSight core layer.
>    Patches 10 - 15: Refactor path enabling and disabling with range, add
>                     path control during CPU idle.
>    Patches 16 - 17: Support the sink (TRBE) control during CPU idle.
>    Patches 18 - 20: Move CPU hotplug into the core layer, and fix sysfs
>                     mode for hotplug.
> 
> This series is rebased on the coresight-next branch and has been verified
> on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).  Built successfully
> for armv7 (ARCH=arm).
> 

tested on QCOM sa8775-ride:

=== 1. Sysfs mode: basic enable/disable ===
PASS: Sink tmc_etr0 enabled
PASS: Source etm0 enabled
PASS: Source etm0 disabled cleanly
PASS: Sink tmc_etr0 disabled cleanly

=== 2. Sysfs mode: repeated enable/disable cycles (10x) ===
PASS: 10 enable/disable cycles completed without error

=== 3. Sysfs mode: enable source with no active sink ===
PASS: Enable without sink returned error (expected)

=== 4. Sysfs mode: enable/disable all per-CPU sources ===
     etm0 (cpu0): enabled OK
     etm1 (cpu1): enabled OK
     etm2 (cpu2): enabled OK
     etm3 (cpu3): enabled OK
     etm4 (cpu4): enabled OK
     etm5 (cpu5): enabled OK
     etm6 (cpu6): enabled OK
     etm7 (cpu7): enabled OK
PASS: All online per-CPU sources enabled/disabled successfully

=== 5. CPU hotplug: offline CPU while sysfs tracing active ===
   Using source etm1 on cpu1
   Tracing active on cpu1, offlining CPU...
[   82.805359] psci: CPU1 killed (polled 0 ms)
PASS: Source auto-disabled on CPU offline
[   83.346033] Detected PIPT I-cache on CPU1
[   83.346114] GICv3: CPU1: found redistributor 100 region 
0:0x0000000017a80000
[   83.346283] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
PASS: Source re-enabled after CPU re-online

=== 6. Sysfs: enable source on offline CPU (expect ENODEV) ===
[   84.013788] psci: CPU1 killed (polled 0 ms)
PASS: Enable on offline cpu1 rejected (enable_source=0)
[   84.349558] Detected PIPT I-cache on CPU1
[   84.349640] GICv3: CPU1: found redistributor 100 region 
0:0x0000000017a80000
[   84.349811] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]

=== 7. CPU PM: trace survives CPU idle entry/exit ===
   Sleeping 3s to allow CPU idle entry...
   Idle entries on cpu0 during test: 35
PASS: Source still enabled after idle (PM save/restore working)

=== 8. Perf mode: basic cs_etm recording ===
SKIP: perf not found in PATH

=== 11. TRBE: check save/restore sysfs nodes (if present) ===
SKIP: No TRBE devices found

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>

Thanks,
Jie


> ---
> Changes in v10:
> - Removed redundant checks in ETMv4 PM callbacks (sashiko).
> - Added a new const structure etm4_cs_pm_ops (sashiko).
> - Used fine-grained spinlock on sysfs_active_config (sashiko).
> - Blocked notification after failures in save / restore to avoid lockups.
> - Changed Change CPUHP_AP_ARM_CORESIGHT_STARTING to
>    CPUHP_AP_ARM_CORESIGHT_ONLINE so that the CPU hotplug callback runs in
>    the thread context (sashiko).
> - Link to v9: https://lore.kernel.org/r/20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com
> 
> Changes in v9:
> - Changed to use per-CPU path pointer with lockless access.
> - Removed the change for adding csdev->path, the related refactoring
>    will be sent separately.
> - Re-orged patches to avoid intermediate breakage (sashiko).
> - Link to v8: https://lore.kernel.org/r/20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com
> 
> Changes in v8:
> - Moved the "cpu" field in coresight_device for better pack with new
>    patch 01 (Suzuki).
> - Added check if not set CPU for per_cpu_source/per_cpu_sink (Suzuki).
> - Renamed spinlock name in syscfg (Suzuki).
> - Refactored paired enable and disable path with new patches
>    10 and 12 (Suzuki).
> - Link to v7: https://lore.kernel.org/r/20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com
> 
> Changes in v7:
> - Added a flag in coresight_desc to indicate CPU bound device (Suzuki).
> - Used coresight_mutex to protect per-CPU source pointer (Suzuki).
> - Added a spinlock for exclusive access per-CPU source pointer (Suzuki).
> - Dropped .pm_is_needed() callback (Suzuki).
> - Supported range in path enabling / disabling (Suzuki).
> - Gathered test and review tags (Levi / James).
> - Link to v6: https://lore.kernel.org/r/20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> ---
> Leo Yan (19):
>        coresight: Extract device init into coresight_init_device()
>        coresight: Populate CPU ID into coresight_device
>        coresight: Remove .cpu_id() callback from source ops
>        coresight: Take hotplug lock in enable_source_store() for Sysfs mode
>        coresight: etm4x: Set per-CPU path on local CPU
>        coresight: etm3x: Set per-CPU path on local CPU
>        coresight: Register CPU PM notifier in core layer
>        coresight: etm4x: Hook CPU PM callbacks
>        coresight: etm4x: Remove redundant checks in PM save and restore
>        coresight: syscfg: Use IRQ-safe spinlock to protect active variables
>        coresight: Move source helper disabling to coresight_disable_path()
>        coresight: Control path with range
>        coresight: Use helpers to fetch first and last nodes
>        coresight: Introduce coresight_enable_source() helper
>        coresight: Control path during CPU idle
>        coresight: Add PM callbacks for sink device
>        coresight: sysfs: Increment refcount only for system tracers
>        coresight: Move CPU hotplug callbacks to core layer
>        coresight: sysfs: Validate CPU online status for per-CPU sources
> 
> Yabin Cui (1):
>        coresight: trbe: Save and restore state across CPU low power state
> 
>   drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       | 419 ++++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |   4 +-
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 168 ++-------
>   drivers/hwtracing/coresight/coresight-priv.h       |   4 +
>   drivers/hwtracing/coresight/coresight-syscfg.c     |  35 +-
>   drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c      |  50 ++-
>   drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
>   include/linux/coresight.h                          |  13 +-
>   include/linux/cpuhotplug.h                         |   2 +-
>   13 files changed, 566 insertions(+), 276 deletions(-)
> ---
> base-commit: ec687ba84000d7d50cf243558041f6729d1d8119
> change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
> 
> Best regards,



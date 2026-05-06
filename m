Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90EECD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOuFb+ByEHgxeRzxtQH/alALv56e2ocT5u4L3QypiV8=; b=F5naVfJOTFd5dKM1+4Mu5Z88M5
	yk8OfuzW7PNCN4XpUzp5K4PgdafrkKHi1hZfwow2z283dxyo4Tbd/pxTSb9ARrPFEcIy0dQPNLeuo
	wmbIwdwl8Y7L9O0TRYE+n1u1wCJptEAsEe4LueY01NRlLLntk1NdFgYgo81kDlRS0EOUWhK/dcvuN
	6P2jeZ7g0MHhtSlIECJ4KiwlZOpWZQogccC3fhTrrn8a1HHO1t9UI05IKJcYgrAzvUa+7nQdG/gkK
	FsgDt32N8fazRzVcZf1hDpiMzEkJWi/87EFe2G27ziRQk/EAR6f2a0Cnx1Bsc2cjBtp5QfwGfzOO9
	cHX0SsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWlS-000000002g7-3zgg;
	Wed, 06 May 2026 07:33:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWlR-000000002fU-3XYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:33:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465vNi6153474
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 07:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOuFb+ByEHgxeRzxtQH/alALv56e2ocT5u4L3QypiV8=; b=ba6EmG0JJiyqB2ZQ
	v/Y3QIaFvBt9+1ILVqzRipuIm56I1BpZgACotDiIjGXxxZfH2qKPaqMyPTBSb8/B
	T4Pk7S0I4Ft1qC0bVoFbCAzV0UVEERlvESdmV1Y4PYrkooLRjiJ86okzulhIHQDT
	5MMJDdLu7lfZiQVXnJN0zK+gQg1JCQ+o22w0pPGkDrr6fMUugNsVRP6yIfTlD6PS
	+GHRrQTWt0qA0X1AF7vzqitP7yxThzamWwgliNISZ1eAAWJ63qSZkG6brUxdobWV
	6BsjkWtmvingkYQLVDZdQvPeDnlsttEjZZqqSMGtOG8Yz/Wj+bUTfpAySv1bNoiA
	tluiMg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80bgf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:33:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso7473072b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778052825; x=1778657625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOuFb+ByEHgxeRzxtQH/alALv56e2ocT5u4L3QypiV8=;
        b=IgCgW0oVpS89ChhJSvxdIPyUGT04ehgMgH51MoSEJNoT3mYAgOczoWk1Hto4An9y2z
         c1P/p2AKscJPrUgWWZSMGyyTQwofvCCNHWDVrRIML1nbRXMvqcWhSwsXS3G/aeiD8pB/
         aDJgSvWnwMXMrkdx569hkKF1hNFBcA7bcg8UjeKxwwys74C0EMPbahAbAqc++CbYZF9K
         YBA3HZqkdd8aWsqmPOaN0HnAqOvRcwrpHa69RPXa2OAeznwUSJyxnIR/AFlkhCm/jjlA
         f51IjrEvcA9AP+F3hrBttN7li78oZ2dlcvInH+5O4GhgtRUSaQqbaJJJcr0kRalGRuzK
         eP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778052825; x=1778657625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOuFb+ByEHgxeRzxtQH/alALv56e2ocT5u4L3QypiV8=;
        b=LqHiwrP8ml/Dsr+dwMna9ilcZzcl/v8CLijUkr/spK2GcPNxzkTOBYV8NI5z+o0NiS
         UeN7MooposwFvguhT4EmJPTTJP/wu+trGWPrwTLiYsBH00CUxisLBlOO2rFQ+UYvE43H
         rUSOeolFKJpvwfuyhqnDDubFwtZqRPcV96NgFh4bNc2Vyqz2fBH3ZgoVanYeapiN5NTD
         5A5cdgMWx4fFUAWRXMEATdyMP57eT6exbOtDqzBDBSREjROSVwArotm2eqL3TYtJoCv3
         2S9z4S/sJpnj+yCS0L6OIgXnBMcO5TC9l6BO+DcBJIH33cIrV1OY32rA8Pz8TO6Jl95Y
         P7FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sv2zh3dvjpOYv2wVNQUP8zHtcA1rJwk+88lPDBUSLvPLCaFhrAOHyds33/Ld+IKdLkVbUzbKN+CSEya6ffZGa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6UBW2pLIbbdwujH9iyKVGTjpnYoZt/7EJ+Zp7oeIy56SdlfvG
	7NtyFjwhnbQ4RLHSRm7Kzd0vS94wrANO9bNttst1/K+nQrfazxS7zNvM3edM28A00gvzCMaZhO4
	zkDzxr91ddcNUKHL45G/PtPTsg0UdLi4chKI0Tv/urSuUT6Y4gafTq4n0PNnL+0ou341BjrjCKj
	5iWQ==
X-Gm-Gg: AeBDietsEdrbFd/ZYfHK4bvehHKh4QMfUEeuxoGHACv+TjFl8GNhrY8E2wRsRLrFnGu
	2C06ZkhCLW0Vg0nSyY/t1pHxvlnckO2cCPc1t1vSYAXURihzZ3BSdZA+9t0ZPecC5vaWF4v/qOf
	zIHnlZ94aT3rP4U/PBhR2OiaHgdEnTlDWaUlr4AP9f4dx7EwClB1jsDm5wraBnBr8SbTejbONyQ
	ggH+fQRQn/5SRtZayUpSjlG86tIzOpYk1p9W2Q/ZbfsxrIDBk2SV+S2mio4c+b2XIgu4Jf9ADrb
	qDPQo5N3zc0zzg05tOKAtckjKLd3/5zp+kfqdXyhzbnlGYYQTgvO/WJfInW6pPXeCZ3HB5qPJjz
	rcobcYKb28H9K6f3kaYShB8jCSb7Vtcne4FmKfEcCoJexqJRjEPiii++9Apfxip3E3Om3ByzcT0
	5ZGe/oXBM3EV1zlIsUxPZhAQ==
X-Received: by 2002:a05:6a00:27a7:b0:839:e27c:6cc9 with SMTP id d2e1a72fcca58-83a5e348860mr1855014b3a.35.1778052825203;
        Wed, 06 May 2026 00:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a7:b0:839:e27c:6cc9 with SMTP id d2e1a72fcca58-83a5e348860mr1854982b3a.35.1778052824660;
        Wed, 06 May 2026 00:33:44 -0700 (PDT)
Received: from [10.133.33.194] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c1bsm5511412b3a.34.2026.05.06.00.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 00:33:44 -0700 (PDT)
Message-ID: <e0fa7079-6f57-4b5d-8b5d-ff10264caf1a@oss.qualcomm.com>
Date: Wed, 6 May 2026 15:33:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/27] CoreSight: Refactor power management for
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
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69faeed9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Rg6frwBbQHgqRIZAXMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: vb5iZHeEjU10pqviDT_iwuna-FZWIXxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3MSBTYWx0ZWRfXxY1L/EGsKBy4
 NeNrKx9aCOIYWfeSDuS6S9OFcXso5SPC/teARNBdc6Az3IzMOSHgX7h4A19tnEh4caDiRKnEyvT
 jZ1Vs36gWt21a6Urz/SM/8a/4OWsLgGftwUSyseHsLG3H5eGBB+kFACdEQUOfy3tY2XZIiDspZo
 NxqKwcZpQKAZLdNOVjDJGcSiQV6SljElcIp18J2j5DIVLlYhEyebD9WFRS3kqUWzbGd2G0iQtMb
 NxUyTKcMGoXRHLq8wvip6rfd+VjmW7b36nPCIb/SrZ0kqPWThn6yIVoKzJfZzTJ82COf14C/175
 KRWUn5A58guAwDGTBW5+te6YR/9U1OoPZm0v1VhYUNqxEHvCoubnh+aWSnVBrBRlSqCmGVdNFFZ
 Hl31WgvwtjNLv8Weg2x4D33hPQRB9FdUVqN4eGZVsd/aDJp8mw0YeVBius4+0eOhUJ9czZpbZ15
 fNAxShfTceHEbJahBbw==
X-Proofpoint-GUID: vb5iZHeEjU10pqviDT_iwuna-FZWIXxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_003349_930427_732289D1 
X-CRM114-Status: GOOD (  26.46  )
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



On 5/2/2026 12:47 AM, Leo Yan wrote:
> This series focuses on CoreSight path power management.  The changes can
> be divided into four parts for review:
> 
>    Patches 01 - 09: Preparison for CPU PM:
>                     Fix helper enable failure handling.
>                     Refactor CPU ID stored in csdev.
>                     Move CPU lock to sysfs layer.
> 		   Move per-CPU source pointer from etm-perf to core layer.
> 		   Refactor etm-perf to retrieve source via per-CPU's event
> 		   data for lockless and get source reference during AUX
> 		   setup.
>    Patches 10 - 12: Refactor CPU idle flow managed in the CoreSight core
>                     layer.
>    Patches 13 - 22: Refactor path enable / disable with range, control path
>                     during CPU idle.
>    Patches 23 - 24: Support the sink (TRBE) control during CPU idle.
>    Patches 25 - 27: Move CPU hotplug into the core layer, and fix sysfs
>                     mode for hotplug.
> 
> This series is rebased on the coresight-next branch and has been verified
> on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).  Built successfully
> for armv7 (ARCH=arm).
> 

Tested on QCOM sa8775p-ride platform with sysfs mode:

=== 1. Prerequisites ===
PASS: Running as root
PASS: CoreSight bus present
PASS: Sink: tmc_etr0
   Sink is TRBE: 0
PASS: Source: etm0
   Source CPU: 0
   Online CPUs: 8
   All CoreSight devices:
     ctcu0
     cti_sys0
     etm0
     etm1
     etm2
     etm3
     etm4
     etm5
     etm6
     etm7
     funnel0
     funnel1
     funnel2
     funnel3
     funnel4
     funnel5
     funnel6
     funnel7
     replicator0
     replicator1
     replicator2
     stm0
     tmc_etf0
     tmc_etr0
     tmc_etr1
     tpdm0
     tpdm1
     tpdm10
     tpdm11
     tpdm2
     tpdm3
     tpdm4
     tpdm5
     tpdm6
     tpdm7
     tpdm8
     tpdm9

=== 2. Sysfs mode: basic enable/disable ===
PASS: Sink tmc_etr0 enabled
PASS: Source etm0 enabled
PASS: Source etm0 disabled cleanly
PASS: Sink tmc_etr0 disabled cleanly

=== 3. Sysfs mode: repeated enable/disable cycles (10x) ===
PASS: 10 enable/disable cycles completed without error

=== 4. Sysfs: enable source with no active sink ===
PASS: Enable without sink returned error (expected)

=== 5. Sysfs: enable/disable all online per-CPU sources ===
     etm0 (cpu0): enabled OK
     etm1 (cpu1): enabled OK
     etm2 (cpu2): enabled OK
     etm3 (cpu3): enabled OK
     etm4 (cpu4): enabled OK
     etm5 (cpu5): enabled OK
     etm6 (cpu6): enabled OK
     etm7 (cpu7): enabled OK
PASS: All online per-CPU sources enabled/disabled successfully

=== 6. csdev->cpu sysfs attribute (Patch 3: CPU ID in coresight_device) ===
     etm0: cpu = 0 (OK)
     etm1: cpu = 1 (OK)
     etm2: cpu = 2 (OK)
     etm3: cpu = 3 (OK)
     etm4: cpu = 4 (OK)
     etm5: cpu = 5 (OK)
     etm6: cpu = 6 (OK)
     etm7: cpu = 7 (OK)
PASS: All 8 per-CPU sources have valid 'cpu' attribute

=== 7. CPU online validation before path build (Patch 27) ===
   Offlining cpu1 (source: etm1)
[  146.339051] psci: CPU1 killed (polled 0 ms)
PASS: P27: Enable on offline cpu1 rejected before path build 
(enable_source=0)
[  146.689573] Detected PIPT I-cache on CPU1
[  146.689635] GICv3: CPU1: found redistributor 100 region 
0:0x0000000017a80000
[  146.689801] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
   cpu1 back online

=== 8. CPU hotplug: core layer disables full sysfs path on CPU offline 
(Patch 26) ===
   Starting sysfs trace on cpu1 (source: etm1)
   Offlining cpu1 while tracing active...
[  147.498731] psci: CPU1 killed (polled 0 ms)
PASS: P26: Source auto-disabled by core coresight_dying_cpu() on CPU offline
     Sink state after hotplug: 1
PASS: No kernel errors in dmesg during hotplug
[  148.365194] Detected PIPT I-cache on CPU1
[  148.365249] GICv3: CPU1: found redistributor 100 region 
0:0x0000000017a80000
[  148.365393] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
PASS: cpu1 re-onlined

=== 9. CPU hotplug: re-enable sysfs tracing after CPU re-online ===
PASS: Tracing re-enabled on cpu1 after hotplug cycle

=== 10. CPU PM: path control during CPU idle (Patch 22) ===
   Sleeping 4s to allow CPU idle entry (source: etm0, cpu: 0)...
   Idle entries on cpu0 during test: 49
PASS: P22: Source still enabled after idle — path save/restore working

Thanks,
Jie

> ---
> Changes in v11:
> - Moved per-CPU source pointer from etm-perf to core (Suzuki).
> - Added grabbing/ungrabbing csdev for device reference (Suzuki).
> - Minor refine for error handling and logs in CPU PM (James).
> - Refactored etm-perf with fetching path/source from event data (Suzuki).
> - Fixed Helper error handling (sashiko).
> - Added Jie's test tag (thanks!).
> - Minor improvement for comments and commit logs.
> - Link to v10: https://lore.kernel.org/r/20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com
> 
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
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> ---
> Leo Yan (26):
>        coresight: Handle helper enable failure properly
>        coresight: Extract device init into coresight_init_device()
>        coresight: Populate CPU ID into coresight_device
>        coresight: Remove .cpu_id() callback from source ops
>        coresight: Take hotplug lock in enable_source_store() for Sysfs mode
>        coresight: perf: Retrieve path and source from event data
>        coresight: Take a reference on csdev
>        coresight: Move per-CPU source pointer to core layer
>        coresight: Grab per-CPU source device during AUX setup
>        coresight: Register CPU PM notifier in core layer
>        coresight: etm4x: Hook CPU PM callbacks
>        coresight: etm4x: Remove redundant checks in PM save and restore
>        coresight: syscfg: Use IRQ-safe spinlock to protect active variables
>        coresight: Move source helper disabling to coresight_disable_path()
>        coresight: Control path with range
>        coresight: Use helpers to fetch first and last nodes
>        coresight: Introduce coresight_enable_source() helper
>        coresight: Save active path for system tracers
>        coresight: etm4x: Set active path on target CPU
>        coresight: etm3x: Set active path on target CPU
>        coresight: sysfs: Use source's path pointer for path control
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
>   drivers/hwtracing/coresight/coresight-core.c       | 530 ++++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
>   drivers/hwtracing/coresight/coresight-etm-perf.c   | 268 ++++++-----
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +--
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 166 ++-----
>   drivers/hwtracing/coresight/coresight-priv.h       |   6 +
>   drivers/hwtracing/coresight/coresight-syscfg.c     |  38 +-
>   drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c      | 133 ++----
>   drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
>   include/linux/coresight.h                          |  15 +-
>   include/linux/cpuhotplug.h                         |   2 +-
>   13 files changed, 833 insertions(+), 472 deletions(-)
> ---
> base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
> change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
> 
> Best regards,



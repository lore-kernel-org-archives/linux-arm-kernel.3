Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B16F531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrDAyQjmrzRHfoqf36bIkubSlaPyvL3UBenwMvzZgJk=; b=s+usG2BusEJUY4dKDlyXt2IAz9
	Ur4AKhP9Z/yTgSLxH22XYDzSFr8NYYRyFTAwBXSX3RomdXpa/hpoWz2voYeWGUKbwRhLvQST9J5Yr
	ejpQockHv1JieOVYIbl5FGN+rduSEtLTyU3rH9skfOGOCjtNoZ9Zk7Bo45G+kumTpCSc8pP2q9dee
	YzCfXTQuICjyhOfkKP3weTlWuI8Sx17nOxcu1a9fHQrOhV9bLzembjad8aPMaeKDf+284gkUUJ7JX
	V2oTCMjuPjxk6ja/kxq7+lLzpLWntx506IoX9L+FdnZNWFUdA8Ca/GgssDtw9i/nX7PSTSp533SqE
	tjIlr9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUUG-0000000GeEt-18cD;
	Tue, 14 Apr 2026 03:30:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUUC-0000000GeET-2rfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:30:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBRfF3158073
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mrDAyQjmrzRHfoqf36bIkubSlaPyvL3UBenwMvzZgJk=; b=ZNvMxHN1Ll+BPb+7
	w3eVcGN0m2nfchafDM3Qt181gV6FTAY9XpgAuIypi+f3vuq40eQ9u0zvCyzRYUvl
	jDNyIf6u4wM7QKcK1E2iZ5eefuc1brGzHbBgEzZ+gjPbv8wYqjOr0irNiYTOjL0L
	Xj+Oi6lI59vdxL9Lv0G/ArM002NQZ3S4NclwBUQUFLjxyXsz28v8g/b+zlCDJ6xI
	FI8nL0mliOuBJhGCoPC4Nbk3l5U3ENHTDaHII80d76Mv2QNbRYKVNh86nrsqwgmp
	B2ohZKbd4J3SmCfpdvcCR3rfogKHX6APPL4g40dZLApatHnDdYbkQbmglrsn3XXs
	/CilIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b8tx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:30:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so72553635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776137446; x=1776742246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrDAyQjmrzRHfoqf36bIkubSlaPyvL3UBenwMvzZgJk=;
        b=gen7FLOjVK5sWQKRyJ/p4pARo54HFfOFtoddtrM3QRq67CTy8L0uq+iSf26zdKQHAG
         Q/Njf4bDtyjYsWUuSYB9oSGI9WrePqylITC1P+Qsa7sHJh3/BOaG2ioVXDXFQKW24WyE
         p3Gs/efInAO3+plghR/+V0juRzcpWHh4OsmSx/ozQL5/iC4hwUOGBxg1RTYaHcTEOR2h
         NwPYtPSn+32YwHyR094MKMtgb+miHwbYmcWenkfCylKyZcOEoIfBNss9Kcgdlex/jv5Y
         SSDDjiWx4OgOLtL09Og8x+F44ijv1Upi8YsiUN4R46EeoMJK6SyQL/nnsMRcALvJpn1N
         4cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776137446; x=1776742246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrDAyQjmrzRHfoqf36bIkubSlaPyvL3UBenwMvzZgJk=;
        b=kNhlK1RZVxs/+16SkbvlEABkaec/jNnU5bk1fcLBHXMb2nEaKaPvQv8Duw7+u2Hk8o
         knb7DUsrpfblJa9ecXd2QHnoIhj2CbSz3oFnXWopMZKIYPWnHheXWu0Em3yvtXjw80Kv
         WsbUXNrqhYhcwMO+CI3udSoqAPbPlvONB6sUN4gS0uPNSAURoCe02J7BYnEJK0aE4m9i
         xo35rrt5kEjZ/VKX6KsP0O0Ef9ocwXdLGqDrQ7X/4c0Nj5BcFrALImQS8dw47MW569RF
         oQmX5Nx6jadbcgILwzmapTE93HHUAUmmNN4RJehuS5U/bTjLrvmEwvDqg8oou/7zUIhj
         cCVw==
X-Forwarded-Encrypted: i=1; AFNElJ8evRNLQHd53jgG2G8qL5L7GBMjGOaZobx3xcDpje4Af775NpvRzl8UPcuVE5wqrxrXpyXT5TlknG9SAJlc1ubo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz03ctYDoH6tC18bbRjU2fG0bnaepbAZgQt36+ctxIpgt9dfL7U
	1wYIYL7nMQilz40HpSGeVVm84rzmap9WedBGlCAFtEVEkzbUpkOc/WAiSKhb/x3DGuKqHulN08j
	w/+khagJZHnbY2OapHWr+7RlFTVYT6sNESSZ7hVAf4eAGvn9+x7eXlhdTiuYABDRWdppLYES/t6
	pVRA==
X-Gm-Gg: AeBDietFyWlgniPfwHGYguHjkiKAz5L8mTEZhMt7SZD5h/6LZKtEvhQiNRwdj7u657T
	2p4cZvkMF+Ej+owC30ujdinK3utg244DvTOWdVKWWDqaNg2aja1RGnxquFiv5QTlUJbU77buYbR
	RhSh8yXNcDSg2haUURk4+R37OYv4oxx7SGnKuKKD+PKexqEFluA5BGWGE8aTDigtkkI4Hz8INNe
	JSN5JM4+tD7IOh5yiXjwSSbxI5ZNW5Y4RPKY5Y1lxmoOa2Q1EGDbdjvJxmRBcSsZPbG+7vb7agW
	furtlx4seC3bHyfPiDHlCSFx5xp6jaB8fMasYG6rjl0tW25uHB0d66li+FFGJHzaYxn4jiRpZwU
	u+T0M2uktsyDGnrQItNsREepBFOjbE4hRfP2tuex3uB0E+9/yRye1odR4kia/JbACLmjeIpWjna
	CjW03oGweK3A==
X-Received: by 2002:a17:902:b588:b0:2b2:4c92:c389 with SMTP id d9443c01a7336-2b2d5a6e445mr122236355ad.34.1776137446237;
        Mon, 13 Apr 2026 20:30:46 -0700 (PDT)
X-Received: by 2002:a17:902:b588:b0:2b2:4c92:c389 with SMTP id d9443c01a7336-2b2d5a6e445mr122236145ad.34.1776137445741;
        Mon, 13 Apr 2026 20:30:45 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45f192203sm47088025ad.23.2026.04.13.20.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:30:45 -0700 (PDT)
Message-ID: <633b8a0e-5e78-4c4d-83d8-d4c8ea71bf15@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/20] CoreSight: Refactor power management for
 CoreSight path
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
        Keita Morisaki <keyz@google.com>,
        Yuanfang Zhang
 <quic_yuanfang@quicinc.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <0dd1c432-884a-46c1-828b-f3b22769d000@oss.qualcomm.com>
 <20260413163130.GC356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413163130.GC356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMCBTYWx0ZWRfX+AnunbVN799l
 mDM76Wrq0w3N19nzf6zoxMakmOLEwJDQwGmlbIBS4mjKcJA1Vzzg1P8wmeVV8PLVn9578levf+Y
 0MximOZXs1b0ASlNTc1F2NoHcmg1KSFHi+9sfWtOwqpp2IRo5jvWfNS2iZ4Zv3AxgOnO3b2g3ij
 VX34SZNR1SdEpF0zl2j7TM4ATD+XwD8j5x4zxTpZ2GnogLq72G0tNmuiFa5p7fATHX7plH190ku
 M/uuAAy+bp5a1nC2zvZOFYalS/GLrFnUDaHc6ZJdVEGkNGBQ9+pGv/O0F6XsQj6cUXAxR3j76yl
 5IvcplxJTqvyPYWkXPmfWfx6IRpWG1V2WnL9TXxal2EAol/tNpwJH31gPiZLPs5OtKr8eQVB8MW
 HPmln0hE1qawxRk+oizPc6J4U/6hvAyg+N3Qr919TmUu7FgDzOMv7S/O+TavzGWbjv2mloUxcKg
 PR/enar+PvCCcbLZQtw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddb4e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Df_EovFRAG85CX8HyKMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: XnLBK0AiWoaQ5N3BbYAnO4BxXsL8qiCy
X-Proofpoint-GUID: XnLBK0AiWoaQ5N3BbYAnO4BxXsL8qiCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_203048_847888_1E61CF2E 
X-CRM114-Status: GOOD (  20.68  )
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



On 4/14/2026 12:31 AM, Leo Yan wrote:
> On Mon, Apr 13, 2026 at 06:30:18PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> tested on QCOM sa8775-ride:
>>
>> === 1. Sysfs mode: basic enable/disable ===
>> PASS: Sink tmc_etr0 enabled
>> PASS: Source etm0 enabled
>> PASS: Source etm0 disabled cleanly
>> PASS: Sink tmc_etr0 disabled cleanly
>>
>> === 2. Sysfs mode: repeated enable/disable cycles (10x) ===
>> PASS: 10 enable/disable cycles completed without error
>>
>> === 3. Sysfs mode: enable source with no active sink ===
>> PASS: Enable without sink returned error (expected)
>>
>> === 4. Sysfs mode: enable/disable all per-CPU sources ===
>>      etm0 (cpu0): enabled OK
>>      etm1 (cpu1): enabled OK
>>      etm2 (cpu2): enabled OK
>>      etm3 (cpu3): enabled OK
>>      etm4 (cpu4): enabled OK
>>      etm5 (cpu5): enabled OK
>>      etm6 (cpu6): enabled OK
>>      etm7 (cpu7): enabled OK
>> PASS: All online per-CPU sources enabled/disabled successfully
>>
>> === 5. CPU hotplug: offline CPU while sysfs tracing active ===
>>    Using source etm1 on cpu1
>>    Tracing active on cpu1, offlining CPU...
>> [   82.805359] psci: CPU1 killed (polled 0 ms)
>> PASS: Source auto-disabled on CPU offline
>> [   83.346033] Detected PIPT I-cache on CPU1
>> [   83.346114] GICv3: CPU1: found redistributor 100 region
>> 0:0x0000000017a80000
>> [   83.346283] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
>> PASS: Source re-enabled after CPU re-online
>>
>> === 6. Sysfs: enable source on offline CPU (expect ENODEV) ===
>> [   84.013788] psci: CPU1 killed (polled 0 ms)
>> PASS: Enable on offline cpu1 rejected (enable_source=0)
>> [   84.349558] Detected PIPT I-cache on CPU1
>> [   84.349640] GICv3: CPU1: found redistributor 100 region
>> 0:0x0000000017a80000
>> [   84.349811] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
>>
>> === 7. CPU PM: trace survives CPU idle entry/exit ===
>>    Sleeping 3s to allow CPU idle entry...
>>    Idle entries on cpu0 during test: 35
>> PASS: Source still enabled after idle (PM save/restore working)
>>
>> === 8. Perf mode: basic cs_etm recording ===
>> SKIP: perf not found in PATH
>>
>> === 11. TRBE: check save/restore sysfs nodes (if present) ===
>> SKIP: No TRBE devices found
>>
>> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Just heads up: since Sashiko [1] pointed out a corner case where an SMP call
> may fail when disabling the source device, the per-CPU path pointer
> might not be cleared.  If the ETMv4 device is then removed (e.g. if the
> user unloads the ETMv4 module), CPU PM notifier might access the stale
> path pointer.  Though this is a rare case, we should handle it safely.
> This is why the series was not picked for the v7.1 merge window.
> 
> Thanks a lot for the testing, Jie! It's very helpful, and I will add
> your test tags in the next spin.
> 
> Anyway, please expect more iterations.

Noted, will run the test cases on new iterations.

Thanks,
Jie

> 
> Thanks,
> Leo
> 
> [1] https://sashiko.dev/#/patchset/20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be%40arm.com?part=5



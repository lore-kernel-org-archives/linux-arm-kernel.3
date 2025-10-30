Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C6DCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=; b=ugMdJbU0BwHcArDN1oMD4ncVxP
	McAnKsP0cczMBKtfrDndwOBk+vK3pzN4/Rgu4f1m7hn89hXPX/etIRh9Yawhf7MJJywAYkk9fCCWL
	84aLN46crPn741EeW0LvwHsHWtAgzCA2wAxJjhUDhj/I/pgexREKq14Sct/aIgOL3GqRgRdhDTv8Z
	z8ITGtgNKiZTOmUyhzwKAaO9LA511ZBTkyfV/i9VzB4XxxYkI81C+x4JKbyFd/rMi1G9Fft/eUM7s
	NuZ5COHCIOZHePT4LdBcjd8/3OC9ljuhzUA0Tlc6WT8g3S+EhB3waBBtz7dAg23SAgZKSXi/W5eNt
	a8EYYWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENRv-00000003edB-0WQV;
	Thu, 30 Oct 2025 07:51:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENRs-00000003ecF-0Drd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:51:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7Vn5p1599392
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=; b=cyx8e05WnxRBwgfw
	exRBlP5QlJ1O6c9fi0iOiLb9tvTW2Mf324u44AQqJKols4lewipUG4fATOi9y6Gl
	4an5GeAmZoCVtib3H8aM7zsvVC79I0lYKjaM4JlOEMCjnq81vRVrEfr6jT9LoLig
	1CXEsRJlCE4sTdYUygslR3tQVrc4Dn6gK1SF309zmrw9vivZWiBh+kVrgiaJDOTP
	0mxOeGTgD2kQVFCUZSILqJBPP9pWTIdFcV5bJwqM1edOB9Cebd7m686nRrHG4HLD
	DRH+7uzrrRO7j9kLXi8lkPmLEyB5uf8xlAegTDNdy6OH+s8ACD9IsMYxx8ySd/qf
	L+OuLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7sjw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 07:51:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340299cc2ecso915777a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761810713; x=1762415513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=;
        b=QwPEJ6FHBQ4wmFC1PbHtROHwoWHZ+24G2twVtUlu8kYFwH9mI81T+Pj7OkINWXi775
         VjSYI3QNSmUGBUz8+WGiRkg/A22y9//wmWFvU9uuDsr3+z9zUU17oXLBnOCSUQJ7YMmz
         ske0DLbGeuyfeH0G03nIACrXpFxmPhY7hKT01YZyymGTi3bPNzqwEhtvYSiXubYhQ5NF
         TsG3VD0/oTnEcpcw/q8hLKXq4X8zXy/EDeIHU4jIFlZC1REBf+FqNa+s3wYu1b6QDCmL
         FJP5c4sih4Id7hNlEI33MG/tl0sYs8RUH4/pjcNVc4W7ptTENMgeO2cWY19XsOlJSwDU
         PTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810713; x=1762415513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=;
        b=AvD3ByCx6X+YTbkE0xX7AR5d+i1XiCSKLmiejlrLdvPDqWJi9nInVPCHQMxRI2gThO
         dTgDSEMBqSCf6O45Ef+u868stmfmf4ou36g3QjaKOd5+rc3W3NHfGdurxS0JHzYyAeiN
         Ap8wnGo/vW/kcKTx5iuHLYbcRJx8hZ4F4jEcpnWkrYMFYWgFoUfZpfJRxuJSLaAhM33b
         E+cyydk601pB478gHwlr/D4MtLEHY3ufruXxScHOMBMLOhbOg0CeHxX1nF4KJmkU68HA
         c2IhBsxdCuymYgTSz3aR1wq40F1t+y7+bG6J1KLRXlvcQ4GnSYfgxoWmNll3DwWeLIvU
         hHUw==
X-Forwarded-Encrypted: i=1; AJvYcCWUY6EQ/9Kxe5j/EVD9sl2rWo328gh0unLPzM7vIklyeAITm1nsAPvimaAOGq07lYGuEvV3qX3Zj9LRjeLlb4du@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNlVzR7RTxe1zvU6Lb+6j3l4i7PHQi43m7G8Y/ymXfGgsgMUb
	jf1fD9MqPt6vyh1DK9n9KttWiAw6AqKdgneRMY1jslaT8YRlboOOS73d68eZtTj8QnECeaydpCr
	6nAlEVg0C9go0CiUw+CUgS4VZn8KK1jMDARt/Bs8cxzhi2fe/IXSEtBDrJqHcmWUwDydg883f1g
	i7/Q==
X-Gm-Gg: ASbGncsZreQTb8UfNE6VhDqXiZojoheG4+LehEiNsxNpqVFtZwoY/d9qtycnYI0IEGF
	9WL23RLjvEiDWcO2p8SHJp3n/ACwPkjacIYmyQ1ZcyyHQAdz+8lTpvedVQynyse2OB/qLR0E6LU
	D0cEmo+EFrqEobP3K0l6mkttTZReK7BYVmXQ/01lRd3YykZfRbhM+EKK+gZaxJcNZIpSi5H2fas
	2xa/5BAkZSqy8Fn9H8LexPgWl3GyOo4eCvpluvMpYAsgID9Jj3P34X7/E9uB/37yl1zQ5+ykaRd
	wsY6zfAyIeJ9XY2oYQBmYoQPuO4add1TzJ8kcl49joyZbKCbYVBtAwEbZY4X1kBtUqN54AEOyhn
	MXd3yYweswsOUk7XaerQJkvcYIPr2asZwZwMmCzmoLbQgq4BzQWI0g+9EB0kQy//b1v0oKRPcIQ
	==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr2679902a91.13.1761810712583;
        Thu, 30 Oct 2025 00:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzKJe1UiPLX/c5XJWRrXE7vIIVW3HA3Z3R5jK4wS0osT1fw6s5ES3OfZ7Gi+U6xWT5LUGFvQ==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr2679880a91.13.1761810711983;
        Thu, 30 Oct 2025 00:51:51 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050980cd2sm1614729a91.3.2025.10.30.00.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 00:51:51 -0700 (PDT)
Message-ID: <7451a3ae-2b3f-4e07-b93c-0507436d0f33@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:51:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=69031919 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2kWKyKxqX19wIr5gW_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: ODypyCrDmzOgcJH3HtOZRJ5_YcGAnH_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MiBTYWx0ZWRfXwUx3cRdF9ZbO
 1kaurBa+7MI4+n6tbNQACh+UYaXHlew+U7GXuTroZSqpRHDd2NTxFBBQeXOEVdPYigNQblb6LBm
 wmmyrsmgjpl8Sna8FfqR7a+pEcO3qNF0XIeZB0MWTKuDo9iy8R6wwfz6Sv9gdRLu4CKIPSGcBCa
 g3IUu6QFKxv90fkqzTAXHK6E0U4JVc5wVWPDhtP+GNi4k4TO72BGx9vqBJs20nxhpDO8XotyswS
 /tGSjLRQyZZVnl1/ektuBkaG7LdJh285KtQhHtDBATYssgkQc+iUC2DYqGi05RydAbXDFj6SQjj
 p0nir1ig1DNPV8PZuKdWd7WMGr5csHPPggXClV5ED3x6ObMc2TwL5XDl+vtiAJsM89SxRoaQYko
 VCtgNK6tznZ9eP3EufGK9O9sJEdVyQ==
X-Proofpoint-GUID: ODypyCrDmzOgcJH3HtOZRJ5_YcGAnH_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_005156_209088_1B4D4470 
X-CRM114-Status: GOOD (  27.78  )
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



On 10/29/2025 7:01 PM, Mike Leach wrote:
> Hi,
> 
> This entire set seems to initially check the generic power domain for
> a list of associated CPUs, then check CPU state for all other
> operations.
> 
> Why not simply use the generic power domain state itself, along with
> the power up / down notifiers to determine if the registers are safe
> to access? If the genpd is powered up then the registers must be safe
> to access?
> 
> Regards
> 
> Mike
> 

Hi Mike,

Hi,

yes, when genpd is powered up then register can be accessed. but have blow problems:

1. pm_runtime_sync can trigger cluster power domian power up notifier but not really
power up the cluster, and not able to distinguish whether it is a real power up notifier
or triggered by pm_runtime_sync.
2. Using the power up/down notifier cannot actively wake up the cluster power,
which results in the components related to this cluster failing to be enabled when the cluster
power off.
3. Using the power up/down notifier for register access does not guarantee
the correct path enablement sequence.

thanks,
yuanfang

> On Tue, 28 Oct 2025 at 06:28, Yuanfang Zhang
> <yuanfang.zhang@oss.qualcomm.com> wrote:
>>
>> This patch series introduces support for CPU cluster local CoreSight components,
>> including funnel, replicator, and TMC, which reside inside CPU cluster
>> power domains. These components require special handling due to power
>> domain constraints.
>>
>> Unlike system-level CoreSight devices, CPU cluster local components share the
>> power domain of the CPU cluster. When the cluster enters low-power mode (LPM),
>> the registers of these components become inaccessible. Importantly, `pm_runtime_get`
>> calls alone are insufficient to bring the CPU cluster out of LPM, making
>> standard register access unreliable in such cases.
>>
>> To address this, the series introduces:
>> - Device tree bindings for CPU cluster local funnel, replicator, and TMC.
>> - Introduce a cpumask to record the CPUs belonging to the cluster where the
>>   cpu cluster local component resides.
>> - Safe register access via smp_call_function_single() on CPUs within the
>>   associated cpumask, ensuring the cluster is power-resident during access.
>> - Delayed probe support for CPU cluster local components when all CPUs of
>>   this CPU cluster are offline, re-probe the component when any CPU in the
>>   cluster comes online.
>> - Introduce `cs_mode` to link enable interfaces to avoid the use
>>   smp_call_function_single() under perf mode.
>>
>> Patch summary:
>> Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC devices.
>> Patches 2–3: Add support for CPU cluster funnel.
>> Patches 4-6: Add support for CPU cluster replicator.
>> Patches 7-10: Add support for CPU cluster TMC.
>> Patch 11: Add 'cs_mode' to link enable functions.
>> Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
>> fix build issue.
>>
>> Verification:
>>
>> This series has been verified on sm8750.
>>
>> Test steps for delay probe:
>>
>> 1. limit the system to enable at most 6 CPU cores during boot.
>> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
>> 3. check whether ETM6 and ETM7 have been probed.
>>
>> Test steps for sysfs mode:
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
>> cat /dev/tmc_etf1 >/tmp/etf1.bin
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> cat /dev/tmc_etf2 >/tmp/etf2.bin
>> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>
>> Test steps for sysfs node:
>>
>> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>>
>> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>>
>> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>>
>> Test steps for perf mode:
>>
>> perf record -a -e cs_etm//k -- sleep 5
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>> Yuanfang Zhang (12):
>>       dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator support
>>       coresight-funnel: Add support for CPU cluster funnel
>>       coresight-funnel: Handle delay probe for CPU cluster funnel
>>       coresight-replicator: Add support for CPU cluster replicator
>>       coresight-replicator: Handle delayed probe for CPU cluster replicator
>>       coresight-replicator: Update mgmt_attrs for CPU cluster replicator compatibility
>>       coresight-tmc: Add support for CPU cluster ETF and refactor probe flow
>>       coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>       coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibility
>>       coresight-tmc: Handle delayed probe for CPU cluster TMC
>>       coresight: add 'cs_mode' to link enable functions
>>       arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug block
>>
>>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
>>  .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
>>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
>>  drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>  drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
>>  drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
>>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
>>  drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
>>  drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>  drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>  include/linux/coresight.h                          |   3 +-
>>  14 files changed, 1912 insertions(+), 182 deletions(-)
>> ---
>> base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>
>> Best regards,
>> --
>> Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>
> 
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0C6D6E2AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=; b=ZXWlLWDw+VC/fFEcJN/X0cDsUF
	XLrN0CAGxcKaEBb5vAXG9TPryOEPD62Qzge1jfU2uPVQXeRdMPEemoq0z7iZ1WiO/tSWdRM4eddYi
	noJgV4L6EsunngvvJQj4mMZtkxEJGeXtxibJBwu/dZORO/vEHX0VH1/8Y8e6nMYK1NGHdfXOcaBbP
	ujcu3tclJC+P02sVtJgBy+NUVMzDXu3V9vPwOq++RQbA/X1nvekCSLNzzXM1OfNhYyBQfjgS5HitT
	3EfE+M2l9Ftv7XwptoJMJKLmn1PlzAd9vtg4nIf/SQDyphtRJ1Mk0FH3tcwYw7BOfX7ITlejdmrCo
	36nUkyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiC-00000008nPp-257v;
	Thu, 18 Dec 2025 16:18:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiA-00000008nPS-2A8x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:18:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9EtSi174386
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 16:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=; b=ELNv28mxwbt59oVf
	g2vH9JQvwMnss0etRZW6ftQap4CpS4Dx0MfkLJYGSxRZRu6wzmFFLRtiu0vWL+mf
	dPeumAfMu/Zo0JX9Q+atBtR43Zd3uuSgjFpkWpL8R0fXb7vgAZF8l0/65KW++73e
	jRiM0znuYjpqAlSu0ffmtBQGnayMVURY37VBq7Jkz1DumOfBiov0xdL8oNHugmGk
	RU4nYbH7J44LdW5UZz2S34DW91O8o4HQ0/Zd3ozb6peiu2wi+sg6sOWKuA/1eRiq
	FjRGYhxVxxv6derc+9XDA54OqQudLndGfugrxpVBDSkgqtnEZ+WoLIAgX5VJd2Xa
	nINu8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmuam3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 16:18:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a089575ab3so11086805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766074720; x=1766679520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=;
        b=MteSKUCicHr7pFiL8IStAWzOoxVyk81q6XWi/tQ9meODu1vFH8rEitxuhvnHRzTx4l
         1BzFzYHAiCIT5hXVzwtXJrjEtmoVR7vFe5xmAKrhvXb2+3CjD70H5ZHLs93x+4ms17mf
         wHAzkMdeljQmw9pEy53itpeYRXYw618VQ222/XPE4JvzrEkiYtO+etJMSk48LPqZ5uqd
         OVf1g/573n3HJ+mOQFlCNiOCM0gm/Xr4m+TUkn2Gvw2nADmIvVCdm7AgBpSak83PFYIr
         pw67JGSeQLMcbfg9cbRcBy8CAm38FAAPPr8IF+PdVSmhmA4+jZGhwbCVfT4UHjFzyF9L
         A5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074720; x=1766679520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=;
        b=oVZ4vb3afkkpSyIrwrTThGc8xcxko7LMEP2w0veGY7X2GCB0ogFR9zZvr0DgsVeK19
         qfsM4+cmck0n7+8MVl3GegnG1Z9O8j5OAGBc/hVuphlIf+W//1fmKxijtLRfgFGj+cyq
         ece3D3p+5JGjpoBYMjoi8rUhq1m3KXe/I9ftQ6UqfuCRcDybUVm2FX8Ufy+zJjVhjhdP
         7w1ebknTzo07bMxFWcXljqnkWYuZ3UJC6+KJ7fjZ82yzjyIZFYO22Jca+qkXSEOtOJwQ
         D9xEWFz84UBewYLLWySNaekWnf26uI+Ru3CoiqgWZ7DHaf5XjizeAbelFM0G06ABBD4a
         rkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgqyhHgWt4ZV2TMkbLuXwL3/a8jfUfOutpTcCq4qSdo0xL8/gP/3oF0uwZ49IogEHECjthbjUY7sHzNwGLezpj@lists.infradead.org
X-Gm-Message-State: AOJu0YzR2bRFXj0XYUa4kaW6Xc3/jEie1LzhhRqe0/7t9CGXQGlKQ1lf
	Uq2z3dgWNxQe+YFxD1kATeu11Oq8dmzIY+udx1A+6k6oD6Hmks86rk4o6a9SFhasNDzUV45y0KF
	j7Vup8xjtJUKO33Emak0RqrHLRapGH6C4Gp5DS/ayO7qCM/1XflU4VCO3da7fxalzJR6z4mUGOy
	18FA==
X-Gm-Gg: AY/fxX6RjV44+DUCgEzEAF0psQppkfLQcckQQhqnywg6hHSM/xNopYrCsWqGbh06NCy
	WWas/bSIP0IkKnDLk3kKdu2rJqfRkroaRygqGPlv4I+IaZkQtWqrLZkOXcZ9hnYW/UZemPu7f/N
	7jEgcTSW5Znq8ZuYVPbg2GbvozWcr3Hp32scrgAoWCb70qqQc7DU7PrveHzcmZr1LDHsKFDsdKh
	CbwV4mnruTj5rvHcrMEIrePZ4y5235voIxjn+OY1t3xVbQMr0IALnvGw41Pucydpw6KhBcjk6Tj
	YaKN20pMFQEnfcMG4M7BHmJaebBnhtMqdAyPuSMeSeRBek1JRhM3JnDs/T/fnOPwUUhGtmyI2sr
	JSdWE4UZB+27vSF2dxi/v6yLiwj8luuUroHL7879jcAn9LqGzFoO4SL/Qsr3cOeFkeBJ9NXqCD4
	3Q+iI65r6e
X-Received: by 2002:a17:902:e804:b0:29d:975a:2123 with SMTP id d9443c01a7336-29f23d26f90mr168085775ad.60.1766074720095;
        Thu, 18 Dec 2025 08:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh5u7nqq5MOGjpt/BJtl//yyvyTmIozQTr8L7eklbEPOpymsqTOe2aOb1H/oKVEEJWLJfxLA==
X-Received: by 2002:a17:902:e804:b0:29d:975a:2123 with SMTP id d9443c01a7336-29f23d26f90mr168085475ad.60.1766074719461;
        Thu, 18 Dec 2025 08:18:39 -0800 (PST)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d1926d0csm29852265ad.71.2025.12.18.08.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 08:18:38 -0800 (PST)
Message-ID: <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 00:18:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pXX7dib-mH1fjbTQepQ_Y4g4pFmb_wFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzNSBTYWx0ZWRfX8ZQ4Pau1bdwk
 o5T9+3+ysHS7Gv+uvTmJwOUcYLU27u5RF8Y/YIiGwFaJxtA4F1eCDjrvnehEO9xasOLOKv29jO8
 2qRk6OxGvUIwhLkrkjDPq/woMZ09k+R6ZE12cd3Y3A25ZTCySTr4TToQMvu0jqCedvIYqL7eVqS
 bcsWc6ofAGEYst+XSNBeRkHh1hdp/A4myMVZc7uF2KL5iwTpt8YkrLck5QvVkleEApgJNbL/WSN
 XTHBtvXsnMZHo8RKND8+CofDnTJ9tapDiLWTFhqm1Y+goohc2xfgMDaobktO1DcO3hLNAJZQF1F
 cpC1/zYK11Li2rux8flutQhUAsh93JoAR/Q5yDjS6TSn2qtGNtSDdKOyWOCegX1KWqk3fNxpHJT
 JNac0QCGkWn89QH7hoOs3B7M02r6ng==
X-Proofpoint-ORIG-GUID: pXX7dib-mH1fjbTQepQ_Y4g4pFmb_wFU
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69442961 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CQXatAnIE5CuAcsigYkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_081842_567477_9AB78B82 
X-CRM114-Status: GOOD (  23.66  )
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



On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
> Cc: Sudeep
> 
> On 18/12/2025 08:09, Yuanfang Zhang wrote:
>> This patch series adds support for CoreSight components local to CPU clusters,
>> including funnel, replicator, and TMC, which reside within CPU cluster power
>> domains. These components require special handling due to power domain
>> constraints.
>>
>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>> power domain. When the cluster enters low-power mode (LPM), their registers
>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>> out of LPM, making standard register access unreliable.
> 
> Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
> and that can auto-magically keep the cluster power ON as long as you
> want to use them.
> 
> Suzuki
> 
Hi Suzuki

Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
cluster.
It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
the upstream Kernel.

Yuanfang

> 
>>
>> To address this, the series introduces:
>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>    device tree property.
>> - Implementing deferred probing: if associated CPUs are offline during
>>    probe, initialization is deferred until a CPU hotplug notifier detects
>>    the CPU coming online.
>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>    (initialization, enablement, sysfs reads) are always executed on a
>>    powered CPU within the target cluster.
>> - Extending the CoreSight link `enable` callback to pass the `cs_mode`.
>>    This allows drivers to distinguish between SysFS and Perf modes and
>>    apply mode-specific logic.
>>
>> Jie Gan (1):
>>    arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block
>>
>> Yuanfang Zhang (11):
>>    dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>    coresight: Pass trace mode to link enable callback
>>    coresight-funnel: Support CPU cluster funnel initialization
>>    coresight-funnel: Defer probe when associated CPUs are offline
>>    coresight-replicator: Support CPU cluster replicator initialization
>>    coresight-replicator: Defer probe when associated CPUs are offline
>>    coresight-replicator: Update management interface for CPU-bound devices
>>    coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>    coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>    coresight-tmc: Update management interface for CPU-bound TMCs
>>    coresight-tmc: Defer probe when associated CPUs are offline
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
>> Changes in v2:
>> - Use the qcom,cpu-bound-components device tree property to identify devices
>>    bound to a cluster.
>> - Refactor commit message.
>> - Introduce a supported_cpus field in the drvdata structure to record the CPUs
>>    that belong to the cluster where the local component resides.
>> - Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com
>>
>> ---
>> Jie Gan (1):
>>        arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
>>
>> Yuanfang Zhang (11):
>>        dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>        coresight-funnel: Support CPU cluster funnel initialization
>>        coresight-funnel: Defer probe when associated CPUs are offline
>>        coresight-replicator: Support CPU cluster replicator initialization
>>        coresight-replicator: Defer probe when associated CPUs are offline
>>        coresight-replicator: Update management interface for CPU-bound devices
>>        coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>        coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>        coresight-tmc: Update management interface for CPU-bound TMCs
>>        coresight-tmc: Defer probe when associated CPUs are offline
>>        coresight: Pass trace mode to link enable callback
>>
>>   .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
>>   .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
>>   .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
>>   drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>   drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
>>   drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
>>   drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>   drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>   drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>   include/linux/coresight.h                          |   3 +-
>>   14 files changed, 1902 insertions(+), 169 deletions(-)
>> ---
>> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>
>> Best regards,
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F21EBFD21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wvi947uo20FA69I85LYvzZQOo4Tp7LaD0OliYhKDrw=; b=KO9ZvxFZthL+msMFLyZoZSNw9n
	DJ1W75SrrZpOwSZ9rvEQvwwT9GTMhQ95T4xs6mQFjc6NqR0P1vw/ZbhrUC9KgAWKHPAeIkDW3+tAk
	07o849QtDcsQ+s8yO8n+dbE97e70CMgQRdbA6WlhCfGWpz/vvRUiG19cDBo0GROTPgFP3hWuLwfdC
	VesdpW+fbIgtaF25ZB3EbyVBRF1K6XDGFiq6s9b2Qell1CeQ3cMR+drHKsAX6gq3JQYMcdq0cpG30
	qHEJzc9RFFyusBv1Alc6xUDwRA6cZKmeeD9q5MXRDwJ3hEGFQFJTb5Sj6npN7gjW9Qp5joBDxndn7
	TWpDhSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDa5-0000000FN1d-3fWg;
	Mon, 13 Apr 2026 09:27:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDa2-0000000FN11-4AHt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:27:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6P1xp1121575
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wvi947uo20FA69I85LYvzZQOo4Tp7LaD0OliYhKDrw=; b=cgJ5fjq+5mwJc68Q
	zssl32vNnvSktud/HYdxp6fFfAjOl26aW4QMq2qAFN9oZVBwQWV8Nb4oTXOx4X0t
	8MqgIW8gu3PbVI4CqL125LkBflf7ljWFyc+WloVJuPOTEcHiWLy2XwPgyWCjeGFw
	j40LRA2htIrG7LUuy8pjlnynnSz08c1pPYeLp7JsjTVCDbnz6yhYuv1O8oBGVNJi
	Hh0f2OsRICTfBL6JZrRxAjlwqczs920JG2OnAJymaFj/F7xupOI9JIWQzekQuNQN
	mmpumTUldIOpEWW7bmnrNoIzrmiKt7rnPsUf6W4ntho1FYV7LFCVaTNByrjL8HU3
	qbCi5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvkxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:27:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6906e35fso3082155b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776072460; x=1776677260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wvi947uo20FA69I85LYvzZQOo4Tp7LaD0OliYhKDrw=;
        b=KXOCIkj3gfgxqdbBJ5lCia+hKgjWhSDwKbZqD5hVNS9C8IRc35DnWy/ZjbejJjusE/
         O9g3Wav9tgOrsj2oqpDT8bRMdFyf5wxQ7W3BieAgQg/Kb2PKQOJT/lvw/D5Gh/uFWko8
         vxviiodNxEY4F1Z7Bi1tDnJ9C4icRfGQD57Ld3H35kkgvYjR8oP0+nCTub4LgtPp7aBa
         qFSUMHpvBPSR9hiLBicFg0qd2861yMFH5HBrlmHzU+A3mPWolK1T5VxLiBo+PoWsmy9m
         uPWuWJvf5/61r0p7Cm54a1IyFJcFBoedzT2wnYAEWloP+s/cfgwxzdOQbdgR42nhyJZh
         gtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072460; x=1776677260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wvi947uo20FA69I85LYvzZQOo4Tp7LaD0OliYhKDrw=;
        b=k5BnGxD2+waZC/3igy1uDt+wyUO5aj2YnpD02TukWSklsZgRPEnAbZcMiixYpU6gn2
         LKdn4hE/UYYC3cjVsg1dxuisTzI7TSSVG+Zwx+ZvgTl3JXTg5qPyY+8LNrfVkhDP4eYG
         FOdQhe/tGo9syy8+FgzxBU7AaR38+tN+vBWxhrlAQLHjPzv3Q/6IhbrZaVF2tGkgMK7B
         1ynV0oL4dbiAwWsuBXqf1iDDGlBVIVvam5Zquu7vgyQBINyst/YcdbbLCgfY5kpjFnDz
         DlxsecgZS6wuRb9i94VLnpodXBUroTQyUh6mk9MMk5ayvnNt7aU/hiao6+mPtebz8n9i
         AEMw==
X-Forwarded-Encrypted: i=1; AFNElJ9vYiNDzXZNK/hqdl9a/4aoJVJvN601VrNcVCAM6RTqsl1WvsofOSceOrgUu4oFfi7aKNGYHbtqNLEt3IFhGcxz@lists.infradead.org
X-Gm-Message-State: AOJu0YzBkrptfS1nMwuTf8SA9OpGkfUeJ2l5ieJABoI1r/xmp/3/ZHJS
	QDVa2G18+wiUTqg2geqQwntX98KAk9r/8Y+TlRVGVoSeQIlXB5IiIL3HML64XX2BdzUVA1fExGK
	29f4GQsj5ujUNz6lLEp7i3bcO536QDRxtIEliWjx4oARJVkj+1JRhEan5Nb1lL1oLwd87MTppht
	R0Tw==
X-Gm-Gg: AeBDieuQIwNdUsZp3FGV4ifBszHA4Aubo8h730eXyYGV3TuNPOBdUbpqhDApUKaKiJP
	LbkreugzQU7chP0gxGJYmkAplYNXSZHINzslHNLehZnLDPOPf9EpZGRH+HWbZvZz8MJGH9VzM7n
	hhXFycEVWTkf//Y77di1TOMVEQ9YVVA/VMDrnGcQqzCQpayNVj3oCrgxRF8qAPWZlOGmnXob4rX
	Ca6qVgBYWxOVsPwkE1M+jFymz6lLI1IPjV1PJg11roGoknHAmyfRjFjBtvJs1JbShjyOC+EPs6v
	SIEjoJyjnahg0pA4mcV6Fy/nK0EIdzjQYJS0szYdM71bYgoQEsLDXedbC4xanOTDC6frEU5PP+q
	04BOfrLX1Y73Nv3QNYZCkoWQbBk1mdDBFp03BuThhcQ0be7/l8FtqE4J9g+Abu/XYfE9rWAT9uU
	tUfAJZIWI5cA==
X-Received: by 2002:a05:6a00:9515:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-82f39dfdfb2mr3665740b3a.8.1776072460449;
        Mon, 13 Apr 2026 02:27:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:9515:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-82f39dfdfb2mr3665718b3a.8.1776072459961;
        Mon, 13 Apr 2026 02:27:39 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e1a2dsm10921102b3a.44.2026.04.13.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:27:39 -0700 (PDT)
Message-ID: <597f5dec-2339-4e12-81fd-d808e6d0d363@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:27:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
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
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <227b77b9-5232-4cff-b26a-458477e9eb32@oss.qualcomm.com>
 <20260413084833.GA356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413084833.GA356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MiBTYWx0ZWRfX35KvTp4oc3On
 eZ3jiJHAA98/K9UqjkJ/+Tpj02RupvWawY3NSP8q3bHLhSBY5Y6Zz0wUel8+gaq2KfJBZR23eY6
 DB3XnRUanT4fUNRn7DFcUIR+jxOh7mu/FglNRDeSmVBqLEbQUDSfYPIElAkvhkMl4FOP+vbSW/c
 Ll7yv0oBMtl89SOCD/GIHD5sv4o/w5x3Br993W3Pv509iDnWc7bCjor3Ago47xp61zVafE7gJ5S
 YBLiAxZDvIRq5B1u+mPwOix5saYvf6xEQnYfRExR+++798Nw3KrttbwWxweIRe85Of/4mujgjuH
 XMmog8S0Tei/W0wEFGjs78rUSfnnmLPVJcPLkce9Tu/+8+U1SfvUWV1Y0QFQBLTCXPvnq4fDvXU
 3bSADuY3cz6I9qAEgwcqL6Ajc+CCWSteVgiDLNsdiPir08XKw+4PfZFDev/T6Hq2maBnD7myPGy
 ZfMtsRVlU+LfHjH5bcg==
X-Proofpoint-ORIG-GUID: 6epUOIS9Bpg4q40RNmzhyF7Wvcw9RnKs
X-Proofpoint-GUID: 6epUOIS9Bpg4q40RNmzhyF7Wvcw9RnKs
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb70d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YxUyXSWcmWsRzNVEdBIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_022743_308545_578E4518 
X-CRM114-Status: GOOD (  26.31  )
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

Hi Leo,

On 4/13/2026 4:48 PM, Leo Yan wrote:
> On Mon, Apr 13, 2026 at 01:45:50PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
>>>    	to = list_prev_entry(coresight_path_last_node(path), link);
>>>    	coresight_disable_path_from_to(path, from, to);
>>> +	ret = coresight_pm_device_save(coresight_get_sink(path));
>>> +	if (ret)
>>> +		goto sink_failed;
>>> +
>>>    	return 0;
>>> +
>>> +sink_failed:
>>> +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
>>> +					   from, to))
>>> +		coresight_pm_device_restore(source);
>>
>> I have go through the history messages. I have a question about this point
>> here:
>>
>> how can we handle the scenario if coresight_enable_path_from_to failed? It
>> means we are never calling coresight_pm_device_restore for the ETM and
>> leaving the ETM with OS lock state until CPU reset?
> 
>  From a design perspective, if any failure occurs in the idle flow, the
> priority is to avoid further mess, especially partial enable/disable
> sequences that could lead to lockups.
> 
> The case you mentioned is a typical risk - if a path after source to
> sink fails to be enabled, it is unsafe to arbitrarily enable the source
> further.  We rely on the per-CPU flag "percpu_pm_failed" to disable idle
> states, if ETE/TRBE fails to be disabled, if CPU is turned off, this
> also might cause lockup.

understood.

> 
>> Consider we are calling etm4_disable_hw with OS lock:
>> etm4_disable_hw -> etm4_disable_trace_unit -> etm4x_wait_status (may timeout
>> here?)
> 
> This is expected.  I don't want to introduce a _recovery_ mechanism for
> CPU PM failures, which is complex and over-engineering.  CPU PM notifier
> is low level code, and in my experience, PM issues can be easily
> observed once CPU idle is enabled and should be resolved during the
> development phase.
> 
> In many cases PM issues are often not caused by CoreSight drivers but by
> other modules (e.g., clock or regulator drivers).  The log "Failed in
> coresight PM save ..." reminds developers the bugs.  As said,
> percpu_pm_failed is used as a last resort to prevent the platform from
> locking up if there is a PM bug.

Thanks for the explanation.

Thanks,
Jie


> 
> Thanks,
> Leo



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115A9C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=; b=nK3ZZbVTL8rpLKZ92ReoZI4Fhy
	KyFsiPJrZtV9YqyGA90zQQMnHG5UjcXOOLfaJRqpVldjA2zRwpMPtK3qll0NE5No9Upp+1mXMUZDz
	U2CUcC2Uuz0/6p5k1fmDoq247SwM0UtVpCcHc/93Kbnq+F+4RdJuH4PEVEPI44ZyUSnzDX58BlG07
	Lv1FvqFLqGB3rnx7tgPqROzQuuhpUTFsf5sQ7CROfLS+ngFFo3SbJJoaaIckt/fj+JelJ10NEtc6T
	ZmFWjHtKJD6pF2kDuTQTME18TnuIERgWS5bl9K8T02vTKo4sObK4KAGUYw3sj0QR9Tlm4zTfKoe5C
	yt9o5PhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0x0-0000000CU0V-1YWM;
	Tue, 06 Jan 2026 06:53:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0wx-0000000CU08-2zSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 06:53:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649fpW2255371
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 06:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=; b=dlO1LUbPxmsaRAuu
	FL+r6cFGVvagauwL1+pAXA4LGvyyHuxsyW8b25kOSjdJ+Ct4scqIWy8+EPW8QkoJ
	jAXDsfE6ZbtOOL0umemoCFTizArEbOoRq1sLFhWDcY95LLDo51bF2ziKpnu31EKD
	LMOOP48jdAJ9KV32Zdh7xWx/Xc3kb1c0AR1yGKMu4uy9w/Lo9Yhkhq4oBgvRolJS
	zppLxWRnEIwYmy0GDFUbLqs8iSx7k27OJDBng8ncGHmmKMHdA1lC0ArV1YUtawzw
	dRxankVGSevc/y613wq5KwdM7/R/dBI3i0IPun77L5XNz3wZrFxhz2eH2Qtd0i/W
	SLyXYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420dga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:53:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so18323515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 22:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767682428; x=1768287228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=;
        b=ZW2xRCnNMjEOiAt391gmQhshT2X9PNby24JuujuS46g5YvdOUVeD6tfoc3N0eqiwi0
         YrlH0ySKasVOcuKU44CvhyCw0TVd5zfGvjEXL3QuXqrzBUL9tlsZxZ+vVitIKrEvWMIY
         Vo9gTCvJlWHk/sXFn7pSagVzjxSqAX+J/DFMwB+la3fuY91UcametN9aJRmMMwnimxR5
         Px2nXCervS5R7e5NhC3CdQMyHcitktU+x1sRBi/UlXgELZUHJqQN8q7nU9jWqF6bWZp6
         RExFzTyF2O6kdY/2+wCvq/Iv4imVmxqzL7fDArhLAh6qhrh6Vl8AMsaoQajzbV/td30e
         +eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767682428; x=1768287228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=;
        b=fe8H/U1JBJB7yywXioNc3UUbSUb884cQ4oMyAJkIulUJMDhb7VvmRxN3pQBMrN33uS
         YoHCPm3EiT1TS5yjQ60tjxuBuEW3WB1xHKDc2E58Ur9JyHCUVagXJm8PL8sj5FgbkPF1
         2bRUh1KyFkYxMg+jnrmdUKWnw7BlLgVHujfkKPIDiXLqOF5Ny/bnMMtmrdmQAaxJl9wo
         tWQZ1RxAVTDl4CID8GZ4K/NsD4Ttpj6pkmjBJz8VwBtIjiz2mz3+uu7ck7JtEBmWdrSw
         f9cWmMQgMQxiO+J3n/qgUg/BPsXEVME1IjkrftJB4WOrG615PekMCClu5vFNTRqFkGZV
         zn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl+DYAHZNsumyYlL/2wE6INxaMrRU/4T8CswbL3cEazExg/VsUEafwLU0fKdrN3UTH7GpYw4VbD8+LtQOHISaS@lists.infradead.org
X-Gm-Message-State: AOJu0YwzuSdTJqthIjJ5Ay75aYaB7AXRk3G47DPE25h1/EwXincbreGg
	LwtNlNQFBlKk/5ud9S3ZPU1nENKH9tf3wYwXUWWPqMk39VXN5Pm6deuHthrEDsJA+LUX5Igiu92
	vwp3zTKNe8Zv7X9BrR9iStrFyyn9OMuCj45/ck4jCFYMFvfAigNTJE8mu00xBWF5YXV/T+se+QW
	vRcA==
X-Gm-Gg: AY/fxX4IkjHEeGVyi9YoodViEzspzLUN7iA83KjN5AbpF8ktFuQZyJMfuPMdmbB7eBf
	o2sFkB25o5nkEoIz6LI5y/0mQrDIfqX3dTGXY02KlVsvvK1fiB2wRTxfz0WwHz401qmhcfEXjRI
	nZQtQRN3ECYFczKqyoD0crAYWqDPpipyrqyZ2W/vBYdFzZXQ2IIFzwlyvOTVR+P816pHo++3Dqe
	S2pedEv0iy6ASeHNZrGeyLUsWeOV/Q+RRBihwheffaeNObfJ3VYWH/PAA4N+623vRrkIhxKmR1h
	PI2ka2F4sCfkn79rptt6GKLvdrjJ2jGHJXJLa8FDhXCxdpe42YqhelN6QKB035oD8QNs7umznen
	ZGWsKp0e2Jdf8xSlRzW4/k98yBOOK2S7GZGEXfQ62cR6pLBpOq34Qpv+Nu+0oSq92QgA2ImsaA+
	B8uz1ZerlQ
X-Received: by 2002:a17:902:e784:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3e2e0a9f9mr23473515ad.47.1767682428498;
        Mon, 05 Jan 2026 22:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxkOoXJaSScdNY/v/x1jUmLWmfL4JRhrDppDdxUMNHNMa3JnGa8Jd7THWX6J1mTgz5q5j4iw==
X-Received: by 2002:a17:902:e784:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3e2e0a9f9mr23473245ad.47.1767682427967;
        Mon, 05 Jan 2026 22:53:47 -0800 (PST)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm11886175ad.14.2026.01.05.22.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 22:53:47 -0800 (PST)
Message-ID: <369eb42b-22ef-42ad-8530-a7bf2e594a99@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 14:53:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for
 Interconnect TNOC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@arm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cb17d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: e4SZiw7wzawqrLsUAM7jIhiXDNjuvCM-
X-Proofpoint-ORIG-GUID: e4SZiw7wzawqrLsUAM7jIhiXDNjuvCM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1NyBTYWx0ZWRfX1i/YhkzcDtI9
 5xb/3u1wyhbVNiXJRz1Mx7PyTCnCZZABZtrjyszD7J0dJV2KId0JcG0UcP+E4WA5jeSsdB+o+5q
 ubR7asDESCRvbqjGSvzkvtR0j5Oc56126GZBcxsVxQlQcybseZWvW0y+tvuCM0NOBHTTs2PLpk2
 dBBcwfZ3ZR6bnPiVTqzFAf8VERJIr7NirT63i4g4lveJIGa+RrHUWN6TJzFD5w2lH2TAKURDqzb
 xcBy0gBnh8sAvMbDJlh1Je0kUKIXz+7lfMuN2TR1sQeufmlwwxo6eGc/RywlvSwwe5KmHvF/LM9
 PqyqlqtpIYWTFLb0ZxLlQBKRGBoJHjqmlyTZEUFuxS5SZ5wqP1oy7OMst8XA+Bf186iVYS3GxSk
 mnBhZPWk1cHgruR+ipYvkv5Yst8gSmG7sg67LozP+y2xeNAYghPqraxlprjGgzahTKXqxzTB1mM
 yL10uaGGl1IhNebaRTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_225351_876115_14BD719D 
X-CRM114-Status: GOOD (  21.96  )
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



On 12/4/2025 12:43 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Gentle reminder.

thanks,
yuanfang.

> ---
> Changes in v5:
> - Add the missing review-by tag for patch 3.
> - Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com
> 
> Changes in v4:
> - Fix unintended blank line removals in trace_noc_enable_hw.
> - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
> 
> Changes in v3:
> - Add detail for changes in V2.
> - Remove '#address-cells' and '#size-cells' properties from in-ports field.
> - Fix comment indentation for packet description.
> - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
> 
> Changes in v2:
> - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
> - Dropped the 'select' section from the YAML file.
> - Updated node name to use a more generic naming convention.
> - Removed the 'items' property from the compatible field.
> - Deleted the description for the reg property.
> - Dropped clock-names and adjusted the order of clock-names and clocks.
> - Moved additionalProperties to follow the $ref of out-ports.
> - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
> - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
> 
> ---
> Yuanfang Zhang (3):
>       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
>       coresight-tnoc: add platform driver to support Interconnect TNOC
>       coresight-tnoc: Add runtime PM support for Interconnect TNOC
> 
>  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
>  2 files changed, 215 insertions(+), 11 deletions(-)
> ---
> base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
> change-id: 20250815-itnoc-460273d1b80c
> 
> Best regards,



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499DECD5BA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=; b=Ix05MNLUFIVEYjAdK8S1TMm8D5
	MxbZy2FzPmoazz+OEEMQ2kC2IorVFpxGmrdXeZENIGrKGBYKFTATUWVq73Jpokw3RlZJiH8RvsL3c
	VSBPk3PWGYXBMX22lO14KiTwzYW/XAG5hkWjr/CERXEFiuWg4GP36YvDHMAXrlGbANOn2M2T5bTrE
	7TP5leNa3J4PV789o8v8KlFQlLRZlzKpZhndc22z8szaxg7NyrW2bJhXJlA77i2fgA5s+JiWu8rDc
	O5jWCS+DhZ3bRGnd3cj7wafuC/OPTvx1IAcIwxQKHwD51p8ZKXp/g7+QM7y9b82bJbNIzoXKbI5d0
	EltfDIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTAU-0000000A9Dz-0URR;
	Thu, 13 Nov 2025 08:59:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTAR-0000000A9DJ-251t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:59:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8YdLJ2993638
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=; b=FGYsqAmVJ91Sm7TH
	DutOPdwu+77i+E/LtYnIJJzBPx486I817RtREncP/Qr1BM6eD1LfnOIXMaiMXeIX
	G+qwtR5Mmy9oOohqtrSkydhHo1eEUovPv870xZGRj63f3lkXbom4NFXnnYXbBoaL
	fCYi645gOYSLwCkEjGiekb1i7a4IMWlmaNtS+Ue1wZn10BX2lFTg4gtOXK5XDW0g
	osnFt4QMdiEq8yc2s4wI99ERamW8FLWzhszDgUEl5DiZ2U5OwPfE5WFWLYWygMbO
	3O03qXhAcL1ebRgYAf/5b+/tY6jzMumlyC5K8wm167zrLkCs1aima/cbLrWATLOA
	o4YuOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jhhv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:58:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3418ad76023so1464873a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 00:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763024336; x=1763629136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=;
        b=VCVdFnxUx24udybFnT2gAs0oOYuj1XgBhND7STEVnC6ahcP6l4gtNUYDs7S75k4qIH
         25tZmWJuYLDGH341VfLiw6xXAn7Emven+x25+sO3N4f4imkblrQ33xN72OhFaGh3XH4C
         fViQTaOPk0rOU0P3KUOVQouomIUGSrxA4JtFSNr+jLi5n22Ku9BBu0Rn6NiIbrZUUj8U
         odB9vlD+IPS1dCCNuBScSj5S//Dl1hk8Jv8doFWoQiEVfj2vjntBUOP0R7kTdrOE+SQY
         6LUsppZYk2gjyhnv2S6knS7XMp9OjCmRGdzo6wKT5sgwP+mRc/+nrkV9W7F/TC8v57ow
         P5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024336; x=1763629136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sROjm0GfKSzH5SLU/NEBWTltDSLd9LFgr/GT0GVKZ6c=;
        b=T0FLmG93fPbgYhrQgkjGkgFJOW+KsXLiJlBw54zSSeW/q4rxidcxjFYnzSHmGnG6D/
         ozRvQ2SMcI6UqfYqfs58xyVvtSvOxD9Z8VVComEw1HBg9MK0S+HKP7dgEiIN69nvvYGp
         I5+lCPLFeEGIvJY+3IWCZOYHVrqMe85p1xDCQL69xodToFoGzB5CNnito9C2WMC72SRh
         sDeTsrxarhNCCZ96tzguvQObVWAXIvynzY7y3bLGM+SVuYvxC0Imm2yIQMzAAYniFNc3
         qBHUHzCjDZzYRhgvAErrbK8WIOZjWRvPbg9urIwjqtq/IPssu9A6KeXvcIGaMp3OnlhN
         +e4w==
X-Forwarded-Encrypted: i=1; AJvYcCXfW5lelSvIoI1eSp6S/htux891HU4RG6Lir18cigMzvETbnS7aVXVjb1pyGatbv82RLpOkfWKTevemzHyYr2e+@lists.infradead.org
X-Gm-Message-State: AOJu0YzSFSYv00oSYbqEJD5Jgzdl2P1o+mqUqn+1/0hrRhq7IBEJdd1j
	9Vvyms8WTTcz57nGGTQioe+Y65T9S8aEs2RmwkopMaC7xnwWpPOcO9xajISqNKEil+ooK6u/lvz
	Ux+Zak6+2T4sMYvlHdf1DQieHp3cE71Z5H8rv6XjJasNwKK4uuxWJGb7eio0kzO/Y6A+sH4qSjA
	5mog==
X-Gm-Gg: ASbGncut3NvDRxNzwEDFXYwY7hqXYv63TqGy9DoFD2PyR//PyQDPsYdnapoHuIEbzqo
	HpnKQKjCx7cJHfS8y2UVxY0NsBmXi2r7kItiiAFDAg2JGnubndentPTqPeLcisN/DIbCrXJkGWv
	FQ0xh/GJYRXZ61NYABevV5Yon0UjQ92eo5uQciB+Abp80GlFVZq37ZECgwrYHyVj43DuNhM8AIf
	26jhEHNS+9qSDsWfcKBH8+V0SOB82slemF9GlGwGc/1zapIwFd2QABQV72NmfY1MY9QoanO0cDN
	LJfGyHN6IO30snDjQOLSkWTP++AFk0XKwNr/2F0nS7V30kcd2SMfy6lDkcumGMTSJYlkvppTGXG
	vJ1+z8bGw3kX+I26eyu76RAe+ebKkn6SUANCZQQWHnMgg3g4qi92XuP0RPbhh9ZjowN7BFTI3
X-Received: by 2002:a17:902:e5d1:b0:296:ec5:ab3d with SMTP id d9443c01a7336-2984ee3523dmr75868765ad.61.1763024336337;
        Thu, 13 Nov 2025 00:58:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzgUlzNtw8/rYEnIQrkWBFku2DIdKphkHqn6UbV00gDuOF+BZfctiwr/Qw6rkA2ESsI4XQ0g==
X-Received: by 2002:a17:902:e5d1:b0:296:ec5:ab3d with SMTP id d9443c01a7336-2984ee3523dmr75868465ad.61.1763024335662;
        Thu, 13 Nov 2025 00:58:55 -0800 (PST)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccc03sm17458615ad.109.2025.11.13.00.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:58:55 -0800 (PST)
Message-ID: <4d4fad1f-aa89-4aae-a856-b032ebc4ea9d@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:58:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
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
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2NCBTYWx0ZWRfX8h9c9P2j28jL
 otsUcSW3onOawICkcHbqYr6isItGd38EdkOTJSfwQt1KB5YlCixr1Npm/lKpeNjUof9jLqTj82J
 JB54ZlUX5+gitlROm09J2fV3GcIYBldcYPbyNQFCWkRgJ85BvTkAmSDrZ/qEEFrryOSre087ucD
 kdDITFCVcxBSt9Kvoy7j6IR6nX/dVJ9ldlTl98cTkI3WUpI2U1yd6Dc0kJRVo0qFLLfnqwhLgOb
 8ven+rmmQLot9pHPTcH519H17Udxrr0HDKR9Hqx1wRWkHJ/NT8ptgmKDRS60+9bxWtVb3PeNMZY
 XFX24+UnXphjKLiJrUR/sDMv24qeRrshuk1jP1MyM7dPFhvQzYpq+9JuMilUMiCEGlW8ImXxPXJ
 GV9fe2RDJ2XV0YleJPxQXCca8NE4Uw==
X-Proofpoint-GUID: KXOZ3N2zqtWHVYQA01YvELB1zl_kBzwI
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=69159dd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: KXOZ3N2zqtWHVYQA01YvELB1zl_kBzwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005859_690778_77BAF2C7 
X-CRM114-Status: GOOD (  21.11  )
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



On 10/16/2025 1:49 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
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

Gentle reminder. 

thanks,
Yuanfang.




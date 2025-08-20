Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4769FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo+qBFSuOCOdT4196vaFitQ277UyoAlgWb0yHJHAlaY=; b=l1WVP4Xew72K1YJui3vGtEq410
	M2ieniJcO/H1z4cMHwG/4pBsaCZVvYnREeNXHp3xhIShMzNQ8Lez32b0smj+aM5SmueFEjWzEsBIk
	G9gG4ZVpj26rh6oPr0JPyssj4PuRMe0n7zYBl10XNjKYKOthf7TzwwLuVVBrw2SKOz8faSfHJ4aOf
	pj0ldR8U9ebx3kR3ZpDII/+mYC+pIMOcQDBlt3+WQabatGdvuXKJds+mk/q2kx9nI3McFi3VPMdXr
	l77iEOKKX1zJ8dwTsGgN1MG0hshUykhxcjW2Ybmzn011W+FLJtpOMj2L9crCIAl1GupUfmkcfNL24
	lh4NHyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocAe-0000000CUKZ-00TS;
	Wed, 20 Aug 2025 06:19:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoc81-0000000CU7i-1KRH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 06:16:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oevK010469
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo+qBFSuOCOdT4196vaFitQ277UyoAlgWb0yHJHAlaY=; b=GG5buEa9LEnTmScR
	pHefOJkgG5kNp36UZ+Bu4OR5AavLXm2tVsKFDlurPDgcHmpNNoJEgBiRu5T0exaE
	TK8tc+EDTmo1O62xXCyeZ5cwzsrUVO8GI0RJ+GS1MIZgOYuv0WfvnfG+F42ctT7N
	5OCNa9Vs/tkI588n7pD8jpAR+C9UaLhs9N6y4Aup5R9DidI7OuI3+t4GMFdUFay6
	Ru1APe1uTqzv71Qj9G9lJgk00kvYA8gFRP8kOiGxeriwnkW/EQvESROxmf0Q58ke
	AfhqOV+GY4aibLmLu3J3L1RwRZDEoJT6uEvdHo+EV8d+OHEnEbfx5UKaMPEU4UVh
	Knqlgg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bgm5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:16:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47538030bfso1658584a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 23:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670616; x=1756275416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo+qBFSuOCOdT4196vaFitQ277UyoAlgWb0yHJHAlaY=;
        b=v5UFaBkuHe9J5qtw37Bc81+HAnKT2SNs0myVnvrZl2tuee5hvx9HPDXcxpD4z+WkWk
         TDRUPSeu8gDKhwimZPHjwQlbJk+gsro9PAa8qnEKhB/+mmoqq2RAsP3cG1FhQuqH3mOp
         syztX/nvok3GIVztezFXvj1mAyDqHSNYWEkHozBXOATefIUrI8NLV3a1Mjisw60pY4JR
         tpoYG7vsP9QvKEiox+4GhZBTpQKPP3ip1mnA7EzPy+ecEaS60sRPq9hTupRhiNIZndVB
         lGQzXd5AQ84oP19qniZ4M3zUfcjKVMfQkmjbg6tnhdxUPjkkgPOrQ4wxqAiN+2fAH0+d
         hWOA==
X-Forwarded-Encrypted: i=1; AJvYcCXJco1ojg5DJu0edPwYyQwtVC5uyVUIAN5/tGi93Qcon+zhpPMx7FMN4L+RiouXbX40fyIWtowzaoH6kxrdwF9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzLfw/YM8s4yyX9ZIYkdjK27g1tVlsfGnU9PSuEzkFJIkQITP7g
	/OFdx4os8liEYK42qNUEvH8kh3zEQMESF2H42bEEnf6iqJWzrFUydOUWSh73hui0uSFTLp7zVSK
	XOQfPbWIEpbNI6ZCeOQxQ45zAHyXaQDow/WPiHxyFLr/t8YhW2anF91icTejwxT2OimsBRasFTd
	fVjYcyoJyge+PV
X-Gm-Gg: ASbGncspEW/tbBXmcMuafQXUuGU94NOlh2izyCLBpKbruWgSx/vbYe6loAguKmL0Blx
	rY/xheet9xdx2MBHYY0HyPs+lN30/58Ncyoojy8LrX+WJlqDS64ysl+YmyW1/kuOoCb4x6oRxCR
	R38Oq750TUaZ96L7nmNV4o2wN3SIy9KT8PyvNk0j3uSfpUWVI057C4q6gzuWsfVwlUxwtCQnCL9
	GbuYfV9emMrZpUbzgyyyhH4wBDkw6k6nCgb2SKUt2lnBYGSobc0areDledW5hd5GwWyclVBuSQv
	oitQY4u0ruLculTBNtxnGMZTEqpefu5h4WjDymhkNHfjwBLj5DANojiSIWWwV8Ev45ZJQQmWe0M
	GZf7Tk9UU/qBukTfwfJ91syCi9MbTrv/2
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2689097637.25.1755670615714;
        Tue, 19 Aug 2025 23:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkuHrM5J+SA+TshY0ZVvPXqmiE0Q5IAuZ5MDZKibUhiwTCZup0o87PAGsuKT1kaJi+7h4VLw==
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2689069637.25.1755670615271;
        Tue, 19 Aug 2025 23:16:55 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbe626sm1356125a12.6.2025.08.19.23.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:16:54 -0700 (PDT)
Message-ID: <45bad7a0-119a-4375-887d-28aed2b0ee20@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:16:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        kernel@oss.qualcomm.com
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
 <175560674472.26193.14154235220441518996.robh@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <175560674472.26193.14154235220441518996.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8dxtHp/MICoI
 fTzO7w7lKwUONtoh7ZF5WoMuPj/kJbKM3lNzy35V/g5p3Dp55YPGABPIIk9dh30jctAwc1NxlRN
 XhcFITriJqCA5XdE+zxXFcp1Pg3zyd1bJ6DmoqbGPGSjYBc3phqnuXenGzCwgGMKzCPPg6QbHN9
 7NN3Bhe98W91KH5pPmClqsQQx3qPUGAFPtdWAX5WeBTNloqW9jHb197+kRq/xtkR2RqrdjZQ1ki
 vRzbqAoCVmrWeGXh8Sr6wyJh++51z8cZilRmA4Bf2Uo/m24Logj5Qfcr7As0LZOqokblJM2jhs+
 wjPpMUk4QHL/HUVQn/V4gW4IAMWakfy4my4wbGebFUX4quM3dy+aOvq8oHOJm1S5pkYsz1YS1HN
 SY8a/37VksquB5eac2rxy1HmHZDrLA==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a56858 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=SdGosrV6Qt3YffhYJa8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: U6ieHhWD39_tksHt1fmYvRPBH0B0hPXN
X-Proofpoint-ORIG-GUID: U6ieHhWD39_tksHt1fmYvRPBH0B0hPXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_231657_367857_43F88C95 
X-CRM114-Status: GOOD (  21.44  )
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



On 8/19/2025 8:32 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Aug 2025 03:27:43 -0700, Yuanfang Zhang wrote:
>> Add device tree binding for Qualcomm Coresight Interconnect Trace
>> Network On Chip (ITNOC). This TNOC acts as a CoreSight
>> graph link that forwards trace data from a subsystem to the
>> Aggregator TNOC, without aggregation or ATID functionality.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


Below is my dtschema and yamllint version, They should already be the latest version.
Name: dtschema
Version: 2025.8

Name: yamllint
Version: 1.37.1

I ran below 'make dt_binding_check', don't get any error/warnings.
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml




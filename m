Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuWagmTY53K4UMZcNoJDgZaHuW65CRzMCzLTTEmpep0=; b=cKUgwB07wqKc7bsVEcpTW1DvPF
	OyfObWnpdRZTBcQ1kdpQUbdoyCPIJ8LigmOl0jPDp8IbIAPETzU7lEqzNigvKjblyDfjnrZmqAbqR
	azstulPQeNO47By3gkq00fw9UmEl0NKUomuTJZh1aiBJD/IafQE0yCy9Ub1LaEbdbNSK2V4/e9Zpb
	nRaT+9cQBp3e8+GicWdkLC/V2qIP8905LJWvhUUd3U2B05PnetdPyahqvI3D0GRLgtal7h5Dzyncj
	aMhG1WhMpm4BnNquodGtjEdbOQ8WgsoQbZ6bssYMcqJd4n5WnCzLK0mK5wIi3z1Ezf04fWvsIRPxC
	vJd0Q6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQfS-00000009Wmf-020h;
	Sun, 05 Jul 2026 17:30:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQfP-00000009Wlz-1bPx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:30:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KaLDv3956484
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QuWagmTY53K4UMZcNoJDgZaHuW65CRzMCzLTTEmpep0=; b=Aq6CIbCtrhCA/El1
	h0nab73x92pzq/+E1hRrRMj7yUAF16qsmoYepj4xqr+weMH+9mxauNOjXNXZnfj0
	ePzlTp6F1GrNa9O63Jo+Bo8FVgGBYmCqPnmEENSuCFjCtEEZK78pHuSCmY0LSagw
	FAmmveOre+b9YMmNd+wzvs+A1eIrdMgV2+wPxKtnkQfhFyNZGU0WMR8uoGo8hOL5
	RAdycGWEEsFEKHHMK1kYN3CGlYQlck5gNh6kiW2PhYGuwAspzZ/o+PXoiKexgyX8
	ldDYnamSCV2gW6GItYFToElhLEpYpk79M44YkPk5l7PfOGozXzTq0ZirABLablxf
	4+A/yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk322-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so250535685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272605; x=1783877405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QuWagmTY53K4UMZcNoJDgZaHuW65CRzMCzLTTEmpep0=;
        b=geM5rRNFM81vYP8rCPUSHDJrINouQqwZPKstHssSVJJ6wtDGn27wiROEUXjIz6ySNH
         sECS6wOOKFYqxbOSeVsmz1jtujG3Up8ENeBGpdSgDokuyQQFi1HJtOUdo1haBkNouuy2
         ciTS0wCzQLj6Fa1vp0EFdqPFZXZAmN8WlM2+ktr7nVw3LcXVyFkQS94wEQyOtBOv7IWE
         SG2QZcGCPD/Fqe2pSq0FTXIKFzWJkZfVFM5/OcBCv7HVN/3njZJ55vYQpyCwFy1SzKq1
         /NcGwRo9VFvLDk2lPnrgDycfRclDm2kAo8ZmZntm60F8ImKm+hWmHqmPJvWDHJsuUSt7
         RTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272605; x=1783877405;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuWagmTY53K4UMZcNoJDgZaHuW65CRzMCzLTTEmpep0=;
        b=K0rRJu0v4jSWPNwpEIO2wkYIGsLdhK6mqQyTV5Dvt1RjMoAC26sSi8lvxKH9bO1An4
         WB0OSmdCE0kOFc4VCnho2Wvr5pqyeJsfJZ9kGCr7aAd9ROjEmEZDFdnovHF+DTUlPvSW
         /W5MX4vG+PWln42wU0eVBuqjeptRu2NzoMk8fwDDJ+XBD0/1aiEifsRvb+obIL3utQji
         6v2vBoqgqmsVIi6tEaZp1dVYQVfkKpx21KuFe1h3D2YYT9MqA+SsHeEzy8ePIQCT813y
         THTCXPQUeXrouZ02vZ9YJe/wxAPUrlHOPsP7LM7Xs/Wm7kqOs1UH/HbxGbhsj5wwRtJt
         9ocQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkzJWX5mzjDeiA64Oe6Gc2R/JtnOylFE7cGxBfdqrxZznHgV1hK8SsBl1H1CpBzvS1uhhK3D+lfqfYndG2RQu3@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/iNslxEAG+iQQCj9EE51yG5lKOJFGPSstgCRhY32qQB5Nifr
	3d1ZEr3Qn+ueDf43NB97ah28++qaX9TXoKfKI7VMB5P5KkhQ0NB8hH6W2nFJ7iyG3Ogeb+GcKGM
	ayN9+zteUnhoE64L8gcWZYHZ6aQsSS18IdynMfZfit/yHvIWSytNZ740rWrELN8Eoc4UhbOl+2U
	nWt2kn01tr8A==
X-Gm-Gg: AfdE7ckuzrtW4L1lOnVLQVapgqpDuzM+l2QSLO9kL9JhWJ9O6wMkS2KFnSHpMebjAnh
	ZCCINtVOcmTPgtlQWu+75h9JU6zsB3F3GILgjwLkG5nOns/4MWO3gFm8axqyoSojPnRJC+jWRR6
	DK4oBjMF2VAlbYU+09Vm2S8Kcir1ANsry2XvmK0dWrbz6HDyJPeBtZgp1C70bXnKRJPT8ZAF2N9
	fZJcsAteFv2vzQWKJGOr8+TszPMQO6hel471isMkmydosdu4FV6Yu7pNPA8yH3hTFARX3vNlELv
	rAkIhY0EWO8B3/jISZfd1P8CJyQSLrY/P1JtOLOEOQ0fApSMXXKVdFDRR0DFM8CMuEnMqUiWdHI
	Yyh24BCdTt7uy5ssAie6qsTcSr7raM5NA5K+Zs3y9
X-Received: by 2002:a05:620a:4624:b0:92b:6805:eae3 with SMTP id af79cd13be357-92e9a509939mr991754385a.64.1783272605198;
        Sun, 05 Jul 2026 10:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:92b:6805:eae3 with SMTP id af79cd13be357-92e9a509939mr991751185a.64.1783272604709;
        Sun, 05 Jul 2026 10:30:04 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm498126105e9.13.2026.07.05.10.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:30:03 -0700 (PDT)
Message-ID: <2cacf4a8-bd67-4036-91cd-2bdc49632657@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 19:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tnoc: Constify amba_id table
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260705172418.119142-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705172418.119142-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Ah1iM2QKEAk3FoZ-2bCuIqVI1bw4bbB
X-Proofpoint-GUID: 6Ah1iM2QKEAk3FoZ-2bCuIqVI1bw4bbB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfXyrQoQrI8BXms
 huy/Zt3S/fYdiFUYUUUB+M7T3B7C0Q0GdJeA9XffA5hvQ33r1KDfqIuxze+K/IEATY3wLhtyKtr
 1gy8x3PxCSDKjwm5NBbUHniTngSEudI=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a949d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=x1tD_wC-dm1gN5sX_W4A:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfXyx4QxzkLj7Qe
 wZOJX4kA77z+AhPBCFUTcUm6eOHOinYRjUiOdghrnngdpoS1QDqoTjE0ojzWn2p1TSPbplcsVJ7
 hQHamWEwmazbf95b/DjxPAXqmwFbHzgIQuZcAplGKrQSeRTGOBIniJPJGsQHkjnQWZklq0PIqel
 xJVjqv/AaJ2hGbSXffbZlpx6OkH0hMBAYIPvZoboci2aS69UKfkQB4A9U/zamUQiHVL0Kbf5F9Y
 k1bOiR2cR0CiIb6jBCE4iIyi++omeswrgYPhqR+5RiXiWoR/d20iTyuyYf3p2idxsl39Aes0Lh2
 Oirgmhq9PkSJ6WRrLtMqe/XCn4xPqOc5mtvTgxJYT9vYVNTjkoOigpRHkhqmbTgDLOatIfAq8+n
 RhXrvBPOyl8pqsMlMijKespIwqH+0vCno8EU2yQGRiGUsyxrv84BEV7nbv6uHmFQHJT2+kVolze
 wrBtKwkPq0lAhBro+aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_103007_538941_A96BCE25 
X-CRM114-Status: GOOD (  11.54  )
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

On 05/07/2026 19:24, Krzysztof Kozlowski wrote:
> Static 'struct amba_id' table is not modified so can be changed to const
> for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Apologies, duplicated posting, please ignore this one.

Best regards,
Krzysztof


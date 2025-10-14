Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94908CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0qtfAcbRRGVp6DETyBKrSN8epuMBuJtgVuS3PjeKqI=; b=xNXVGlE0DsT8+JUL0C5qIFWQto
	Kxb/OtW0dlGPZKEbPbLYPP2Bl+1PC+FIdKpSBlxcDQACvMdwK3m4l8iK2jQpeXtzOm+WnTADnZl74
	GMTFfXKRg0Ff7dgrq0HYu6oKpeWr5fKfWYTGMKnKCInhf+dRibyXfBI1pBR3JRGXwZmxAXGtQOhvX
	STxsWuB+hkttkz4IwhyOAItkWn4DV655Jru/BLB/hiFwFsJ6y/6apnkH/Z1QftjqlpSYANVU9p5Fc
	nbL2wQGi6Kuv7jLCQ8IYYPOdvfveaNlua+7k5AKgH5AzL+toU/k51oavl5P67e0ra4bJfPdt4f1Zm
	S23boKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZpD-0000000FVS9-1IeW;
	Tue, 14 Oct 2025 07:52:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZpB-0000000FVQh-0Nbj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 07:52:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6KwkW031376
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0qtfAcbRRGVp6DETyBKrSN8epuMBuJtgVuS3PjeKqI=; b=lYHdlgjgVr3qv8Sr
	r9abvsgc3pQ4XkE88OpfoSkvoSxnwgnq3EQCFOEcict/bDXTXPhPhy/F7eBZAX4T
	MOJtDnXSS2rpptGgc7JVR+g78VVF6GlP9HJ/r9vuICrmV1t4TVgik8K9LEDa31YO
	D9710R0JAzZtGR6M3Dh/Fo43smDEkIzxezLPfyU88ZDZ7Egra4CuQbBwdb3Q/3gV
	IQb77YbMcpZHtAFiA/ToVXsPYzmLZMoDSadXFIVdgDwxo3EwxKMjT0h6zerz28Ah
	2Z4feieEebgzHTZRYwnvSyOViqF41zyByI0J8uwyiCHdHEU8JdrWZ9+eP53+Home
	wdgeEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfyg7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:51:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85696c12803so371900885a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 00:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428318; x=1761033118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0qtfAcbRRGVp6DETyBKrSN8epuMBuJtgVuS3PjeKqI=;
        b=PUDUzjJSJqF/9JrIFh0QqVcoNpdEGcFCkNGHf3KaawRQ0kmk0pGZyHEUYQN5ZD5kUz
         +8ld+/xXwwdOFkSsMCcyt0rYeo2N2QBv8H8mckZ5D4Nh9/LkFz5oQZgmTAhSpS6JVM1u
         j3+GNLZ3/dZ/YdktWki8SSQeb4rpeKMHpfK1a78Uf2L3MrkwQ03U8fjwcSUACEf02c4v
         fhfQ37W9tI3d4Cb5RixTBKv6jVoX1rzRii5VsOGNILvvZvrNZxy/7AMjTDQT6OM0Z8eL
         4kDH4AR8O+G0a33QlAvCvAN7ZHiJnHx3nZ6JBzZou98PpMX97EacdSzdMG9vuj1qOlpa
         qXZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUPTuGMuATZDZsjljxJiXiJjsCR5TKpx5BDHoOaHzxgeyK1+aGd2EiQVhfovvUrXjoQLxX9qrmqFi2jwHXmTDo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyln/DNlx2vwSgc8T5QjdxglohzrrmsINlEqs0c5EqNRolxZIYY
	fV/gfsC7Ur19Jd6hVA2HZ8vMs889jmvhXvUn8/YONoHhMpOgsLlK1SYKRUr67auQfJ04FElCbgx
	mIj4+EqXCHLQxjXXN5UJ063xUY5pMmUG7OCx1/lK9TJVIMQASHCWv6afqXvTZ/LoHaSzPm1nlm3
	JluAI519aPrw==
X-Gm-Gg: ASbGnctZISE05f31QQqByT20/q60WEV1iExOAgtntI/5phrBJKQOf3seMDItZPrNrGV
	DfgzyDu88n51ZAyL48zwYhNSmeicy5ojs+DYBYSmSu8k3M+cf+TGOrMe2WkXu/Plnia41kjVpWy
	vK9A++4pS3kbnW9BIy0pOBlxTl7LUZW5Fq9GeoBocOyWTIS4fKulGb66GxXxEPxfq8ueV9fqzA0
	Q8Kufu6puLzp7776qV8zWltMljrdK8FgT+/7iNzBy/Mwr9DHkQ6QAeHgKnaYwOqMzjBNivQp2/a
	PVl9Fnrr0tlclB2UKMNAbBMKpFOVcZGv9lXz4p6L8W1Jq5VufLzjCJMKHw+MHeZArdlApW558S/
	HDyeiDJGi04G3IKVSw1NAmg==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr2177175485a.8.1760428318084;
        Tue, 14 Oct 2025 00:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7dAVG2/lTAN89xViTE07+yt5E2ydVjSGhDeAoedXXt8eICGnDvQLJoPAGhJh54cblZhK0ow==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr2177173985a.8.1760428317632;
        Tue, 14 Oct 2025 00:51:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124b3sm1123874466b.55.2025.10.14.00.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:51:57 -0700 (PDT)
Message-ID: <98b2bd9a-19e2-44f5-bdf2-fdd8e6c31815@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, sudeep.holla@arm.com,
        cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+fMi/ArrWhQ1
 DC+YGXi9wduwRWZZeN4u0t6Uq81E95TqNqvHTUr0nLWliF6t0/pPp3bQ9totpsfo7d73AjJ/SC1
 gADoTtI29NnE9rlrE7PRdYBxDs7muIaB5i009IWcZuVylzvMJ+H+vb7y29ZnxR5teCNlBtHKZHN
 sTUzCaQ4ZqufgEsMH0us30XMVG6WPuXT8E7bSfsj3nIDSeiMnrs1ubwN1g5tQQ22URpSfpLk4Qy
 5pEgQJgjdhoPemw957o1HV81BYaPilN9TKW2tY6Xb24XM6JNdI+D0de3gz60Z5Cxatn33y1kLsW
 FAE5mBJk1TpIW5qKKnGQpzD0MTvYcqXgXXFKgRxzSCpMM24tcvJSlG52//v4GkH+45WHxB96Vbs
 7l+lFBsHau+CZcI/MmUty7aj517hug==
X-Proofpoint-GUID: pKfHia5XTOUMVyBbs60I9IcKFvgED3LS
X-Proofpoint-ORIG-GUID: pKfHia5XTOUMVyBbs60I9IcKFvgED3LS
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee011f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yHBzqE6aYKRmK_OBsYIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_005201_134417_3753FF1F 
X-CRM114-Status: GOOD (  10.84  )
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

On 10/14/25 9:34 AM, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


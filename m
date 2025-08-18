Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9A3CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=; b=isYbdzX4io+xmXlXsSaM1sc69N
	z0c65GRe2NKJHfbLKUv9zU8exm1mKH6s7HOED609AR4ePysbs5+BM8Y8tCCUC+4pRLInE52patQ6R
	CYxOkxBt343IhKtLzjI4qvy2ItMJy85BiZRjtnhVNSoRL/uKfSxtS7iTpwwKje6g/81nQjkkIsjza
	UjCGWylPNnnkPNB4iorQG5bA4BK4jsS8Zt8QgxLSYBFaDcHth79l4zcP0+mIisejmrIQNlA9vJyJm
	ZO62JimeJtgi7jjeSndeI6Lu049o5U26z1xT8n/tyk9Z0zrjSSF9VgvJ/TEm3ZtRXCdZn1fOgbkQj
	bUT3Zccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03W-00000007UWJ-3tOd;
	Mon, 18 Aug 2025 13:37:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvO0-00000006xPi-1rzB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=; b=MTlSlV86fwtfXhzkVK5q8wfYMb
	HZCn87ORDo0KSViA7ennw1gAOHlXfRhh+8PckYvuGWMEZUpiVqyc5f1vZ0l0cO0AsEz/mKCQX5esc
	9PQUvmBwlJ7jAqYpRsKLPpVUxCpHQ2S/xW9inTYYv9E61Y+Yh6l7K5ABlhw4ZuSHkcqWumvXL37r2
	ZCaI+R8ep+sfcmlfab/gsQhh/6sDBMBpCgHHZ3Z7LMNvqrm7Lx9PhdUViu4cG3HZwucDiNNjN/Byj
	CPGNzXWFjpiaZdhxZq8DbSqSJPv+37o60G26LDKSSeUp2h2qm0wcmDJSilmSDYPJLlXDnxEc4XWLb
	Jv1yJFJQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvNw-0000000HKXs-3J0C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:38:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7xnJY010740
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=; b=eP8x2g+3WBYupLeO
	z86kgWbHPJb9clVn+brIPaR27lH/NVYQbmb4zBiF+QxIyZwuqrek3FeYsvS3//Vs
	exRuy9ufDoi+pL8PMTi9XcU+h58wWRqPvpaaqbbkSI4k+lQmQgbj8w+zLZZPsvsM
	A8R/43Beq1orMsnl93CBsyZPqxBO6AW2GYGGHTSyUbzw94NECzlGtWfhOqXGm2V0
	iaHlOc6SZaA6erjtSkVMl1njEH2uHedcGNxcNK3sgckPnptZ1DTEqmYaOWqK2AVV
	Az+1LkzNWH738cUMhkNO87M3VKy6WDLbXBGtzOd90d3tZTF44OIKn0PdkLqlXVvf
	iDGgyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh073yhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:38:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2eaecf8dso2973344b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506307; x=1756111107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=;
        b=wupcZXiVNb0hpDEAcsygd/fM9puVraOpo6X+mNqt1DOnyezQWyaT4zu07DikgX41Mt
         ffT3o+JsBLjgifx/Qw8quKAq8hEVO9r6hqtFLxcpJVOVSny715rIjfXkQ8J5yqwBGIW4
         X6JNQwgmvFknUsRpnLzH4RZFJszbezR+uiuE0lvfj6U7wpO8pVeY6pRP8XJhcOFKJqUa
         YsxRm03zkI5aQz+w128fqktTL9v774IzzjyLV477dhp/q+ambbwp5Uuco5JGlndF0ZPy
         rbeeVBmspsxooAvotymaBteNufzsVXDdwrb8dw8sTU0tX7tTjce6wfCZF1KQL+chJX+q
         aoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcjUQ0TGCfIElcCgHBHUxzRzDEZvXN11N4+vUkos2VDd7JDdXPpe8fwfWJAuTZ7bX6xoB7ee+MIbhTPewl0y2R@lists.infradead.org
X-Gm-Message-State: AOJu0YyeMSm9Sf48EygRX34IQbSM3QxD4msjhoiw4QUbbFy9BjMx+XgJ
	B4AYHgluPzbw/pJPfjwjcxbKiQY8i4RX06As/tTflErU1gwXzI7rzv33tfKeB02tuzPoTxJlGU1
	/r8AhNzPJdktjdaR10rZk4SdPH+atbbm+2W7EC69ulejAM7gYlb4ePZfchVrAenTuBbo1YoxJ8T
	Aa/Q==
X-Gm-Gg: ASbGncsFEICcSBunPsCSoAzXQrM+8Fvwye24bhl+mbpfLQ0ZMf6xDYTm1Gv1Lhjvoc5
	cLLLZklosG5/ufwiCIO8GqzNJS0xSGlgE6KETPDgr+yuT7CbE+7HSr4WESawGjGtwalkjvhSSoe
	Pwme+8kQz1BzwJY6AHCFoqvr57f61GXAPWtVvDg7HFx7H4nTHpqwhJpUumYT1D5KJ55Scwpmi2Z
	Te75ZI6S/u2112aMylCrWhZVzwI33CWbE2RunI7JVJJy4e3d+HShjNSqBPnk6w08gBSvhluKNXF
	fFam9++/eR0gzQiXx1wbW+9tWhhlxgqzYML9fJk8hsxicR1fncWJ01bXdTwwybAE+2F52QnO5FV
	T/ZZchNhK1ZcOg0+6tgxpxtsnKP0UxY9h9A==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr15383868b3a.20.1755506307015;
        Mon, 18 Aug 2025 01:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvGdpW4BvmgJvwA220VJKl26q0Ske15oZJchuSMBJI+GJMNDoy8o/+l77TsIoRB1+4K01lCw==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr15383839b3a.20.1755506306610;
        Mon, 18 Aug 2025 01:38:26 -0700 (PDT)
Received: from [10.249.31.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45593060sm6615636b3a.86.2025.08.18.01.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:38:26 -0700 (PDT)
Message-ID: <e13b4b1b-92b3-47c0-aaa6-7cfb759d1de4@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 16:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
 <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
 <77067ec1-4f1f-45d1-8027-4c7a6f66ecff@oss.qualcomm.com>
 <14ea3a7f-003d-4893-9c43-c21bd2e7f922@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <14ea3a7f-003d-4893-9c43-c21bd2e7f922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rWwwWMqnL5MCaxocoXFY07rkv-hrP0ZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX/Qsp849eGXy0
 AVnkQOqBiNfaC3oGTUPPOg0wemSUkOnL1EOE0/YFRUXDOoyiq2SS+xoWrA5GvUBhZc9Yfaxrmuy
 euKEMiKbxY68ZLfuPTyyZBQa+b8vA7FoqdQI/jblyj505sANfm/Yx3S/JaD9bgrQn2Zbfjk7mW2
 Hm9fSpwtTZHovApKqVtCAagzS0inDg2078pI2WLBbe07sXQR1omZNKbo4lY5WnSN831fUt9QdGi
 5xSCVk5RR9F8YRACZNQQ8bov51v47a3pvty3GytysGd+rLY+2ls4JRTsFCQ/aHwlk1hFkgQiEvd
 MszCbTciz11YPr/iKIms5+RF7CFx7GVY2Gd3ymPaOOOGaxlc7mgEwkNikzQMo/06iUgUgmKhr4N
 /EhQZyOa
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a2e684 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dcxJtuKkVfpdsdCNSmEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: rWwwWMqnL5MCaxocoXFY07rkv-hrP0ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_093833_164841_8D19BD87 
X-CRM114-Status: GOOD (  19.19  )
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



On 8/18/2025 4:02 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 09:10, Fange Zhang wrote:
>>
>>
>> On 8/18/2025 2:33 PM, Krzysztof Kozlowski wrote:
>>> On 18/08/2025 06:41, Fange Zhang wrote:
>>>> Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
>>>
>>> Qualcomm QCS615 Ride
>>>
>>> You are changing defconfig for all platforms, it's not your personal or
>>> company defconfig.
>>
>> Thank you for the feedback. Yes, The change is intended to support the
>> Qualcomm QCS615 Ride platform, which is now upstream-ready and actively
>> maintained.
>> I believe enabling it as a module ensures it's available without
>> impacting other platforms. While it's not currently used directly in the
>> kernel, having it built as a module allows flexibility for platforms
> 
> Hm? Not used? So this rationale is incorrect.

Yes, still not used yet, but we're actively working to upstream full 
support for the QCS615 platform, and this change is part of that effort.
(see 
https://lore.kernel.org/all/20250818-add-display-support-for-qcs615-platform-v6-2-62aad5138a78@oss.qualcomm.com/)

> 
>> like QCS615 that may require it in future use cases.
> 
> No, we do not make defconfig changes for future.

Thank you for the clarification — I understand and respect the policy.
That said, would it be acceptable to consider the defconfig change 
together with the platform support patch, once it's accepted?

> 
> 
> Best regards,
> Krzysztof



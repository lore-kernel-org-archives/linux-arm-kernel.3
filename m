Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F84FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDjR+QnaSGppNI8qcVMUT2dKaPtQ/kTLxQK50E6D+fw=; b=j+y0JlJcw9zTwg6LoG2rNnIdc6
	2MIt9QTZm3lEbO2nB/XlBWHs+YzsVmMesRj7ss6RN/TWiJrwEYLfi3pQTs7UZJ+1UsoZF6LnCq7jz
	R3WzNVjMiFlti746IZZ4Kh6teAFsYKG+oeP3vuUOW1iGImnpY+fCUmkbFXOiA7LT+T72IuZzrce/h
	tfM2Q2BTQDTr7/FyaNrYQACDYDdYL0demplDmEGAtf0jhn/g5sAWMcLh9jm7cXgTWvhwMth5DEIJe
	zXk5CKv1ONoXi5RM5oaPF31UOTaHCFWBcPgk2KvccPENAREa3ttOw6t5DPLsGjYOatmtpWRLKld/y
	UGbMpEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZ4C-0000000CDuk-0yfW;
	Wed, 20 Aug 2025 03:00:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYzM-0000000CDJd-2qph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:55:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ov31009495
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 02:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDjR+QnaSGppNI8qcVMUT2dKaPtQ/kTLxQK50E6D+fw=; b=nvNMWxUnlvBXLmiu
	5T41vztnuyL6NBCpJ5MYhcDnR2gorbOWJ3jHboMctCHqggEChYhBLVjjv3vSBkRl
	wbnj7CueIRrjm4XVz682M2k3KFJEtHxx9CKBk9Pz9bRHQFCTks3d/5ewXH0f4tah
	ePyZx1/FYmwuzum5tnGeoy0ScGSoewAY+l1KKcQu5M0Tq6IcKW4P3MvKFRCpMmlR
	OODD6IpnOSdjXiWv7v9M1mKV10CCh2MzWxL0LGyUD/vrT7OcfWignkUET24dFDZ7
	hiqS8hoNK4K+vSxHiMQWkcjknH8F8oJJL1EFfesfaRuAzAc9RnC4tkzZa9/aMnT0
	r6EqBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a04ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 02:55:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so72964475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 19:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755658545; x=1756263345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDjR+QnaSGppNI8qcVMUT2dKaPtQ/kTLxQK50E6D+fw=;
        b=BB7wfK4/p0hIaQKn9fiJMfPDzhuNmvmxgCr7emeSJcYI4t0CffqIAdZbyXqdCCGqX3
         jmG8P8xaVxGNi7N3409+HJV+rkuI7C5oSN495mRZ96Zbw5Me0Wp8Eah1VrpEM4FXyfas
         Zc1s0ybchQizxy8Jer9ihYKdFB6JNAoKdSTX9W+30rbxX9U3ZJB9+qnSQ2kt0kzC420X
         WIRgXMf2ul0WxfevP7wo3IzJUPbY1WR5I+p4HeTFNRDpKhDvrHPm5uu1cmVQ7TKCymIT
         6rdiZppIv+2Bf+Ua605vrjr8nmU0lnTj0i6qtLYfLmMLJHw6LpY3gI1GLq1fjH5iaKir
         xoYw==
X-Forwarded-Encrypted: i=1; AJvYcCWg2egUEatI7I6OA9MtnnudwssisRc7A/jnMKsN8InJyvxrorc9/XIqHywUlMvt0P8wjc9qLinuab7LjEGFjXXw@lists.infradead.org
X-Gm-Message-State: AOJu0YwgNtL4YbzK7d9Eb/z/ToQ8+U3NWsUqM3mPvCytK23XeeEDXCtk
	69Li/Q+pNaaOUn7CZsw09RbiaDA/8DUTCDW7Susl5UmOsZQNGMFwEr20l1AtHNYYSigYmi+bevX
	a1Xfj9xJr7jfgyxgVXjErgUrH7eMLhLVOwPHv6wdQcfy+i7m9drhsHSxS36SDlapXuFFCdmfosC
	AtPg==
X-Gm-Gg: ASbGncvq+Mb/pQ4wRLZ2Hd9cQ1zgDS6cpHkswfWtbUMbpg2P7dEG4rHV1UjQgcR8tfj
	6HfV1FqDFSNg39KLQQ5e7sSq7VPtZ9RQfbrKVzf0ZgdG5RCLym7J8LQ3+EPfi3dDIPQrRsMtlMI
	/i9Rsz3l8id+yYmaIYxC/jRtlr/R558JHEAtij8v7ixCVRI/4BMXPigSB9RgVyZdzHxbpTjdFrh
	/BZL4oBL+GIjvICSuDhPvjingk1hKSDMf55ltkYZSQwamsai87fdd2iDRC13aigK0sKTosWV1kq
	8QXIRLjKq3lFdRb8QqjkNc8pGLIKYDNyl7zsCgELOkIEFp87mwPo6hgBS4aVIrmB4wKsgYRNHSG
	FC9ZOVnQLvlF1mTBKs0/oCYbPbTNIUQ6vo5I=
X-Received: by 2002:a17:902:e743:b0:242:9bc4:f1ca with SMTP id d9443c01a7336-245ef2a827emr12434435ad.57.1755658545043;
        Tue, 19 Aug 2025 19:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYWiwV5y8RHJF84lWSVJjKu3Owq0+l/8s5e+spsF//U1keVzXap3hJwWNCadNua0rlA41efg==
X-Received: by 2002:a17:902:e743:b0:242:9bc4:f1ca with SMTP id d9443c01a7336-245ef2a827emr12434095ad.57.1755658544591;
        Tue, 19 Aug 2025 19:55:44 -0700 (PDT)
Received: from [10.249.23.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4f7b77sm11170125ad.117.2025.08.19.19.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 19:55:44 -0700 (PDT)
Message-ID: <aae972ca-5b8f-4329-ab32-12da1522e01b@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 10:55:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
 <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a53932 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UVvxqbSGffHEz0aJwqgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oVT_9u4syzOLU_k-BzPlF3tvGcV8cBke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0GBxAiXKl5E0
 EB6cTKZn3J3A0Y1CHZ+lV/v8WqsKlvEp0PYTlPcrpe/bmEJtqBvXIbBXC8Uakm1ee2O8yKPeoTb
 AHZgUE3VLy1dD5fOCQ+6GiClI9WqpTXvBkE9N88aBwVguPQ6kpVLWtfeeCX8LmjvMxJifQjkRYZ
 2k/8riKc3xvt056PgkrVzeJThHpqsp2sDzHnS+k51SLpqegfOJASMoDOZgitGEg0lpPtHyOLPY2
 mvouhAYXBGcL9yYEbJbfzlCUF2yb7HAURYZtm1uXwh0Pe5JMuiKgadgqcCGS3WKS2bb7uUgVPP1
 Jf3tWxgqOymXFFaYCi0GlGbLiCkINShiZXkhUQNyqtFgynC7G5DfS8fQPCa2aKhtGBoaQXFROsn
 NZQzclOVdm2rS8K8qjiv2qKSU8pESQ==
X-Proofpoint-GUID: oVT_9u4syzOLU_k-BzPlF3tvGcV8cBke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_195548_722827_702B4D99 
X-CRM114-Status: GOOD (  18.21  )
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



On 8/19/2025 8:55 PM, Linus Walleij wrote:
> On Mon, Aug 18, 2025 at 6:41 AM Fange Zhang
> <fange.zhang@oss.qualcomm.com> wrote:
> 
>> Set PINCTRL_SX150X config option as a tristate and add
>> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>>
>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> 
> Fair enough!
> 
> This patch 1/2 applied to the pinctrl tree.

Thanks

> 
> Please funnel patch 2/2 through the SoC tree.

Hi Bjorn, Konrad,

Would it be acceptable to include this defconfig change, or is there a 
preferred process I should follow to get it reviewed and accepted?

Thanks,
Fange Zhang

> 
>> subsys_initcall(sx150x_init
> 
> I seriously wonder about this. It feels like this driver should
> be a pure module_init() device. But other users may disagree.
> 
> Yours,
> Linus Walleij



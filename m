Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C713CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4HjvNLFnxwD9vnohYLriZQRWeU4vT3slKHfceRLugE=; b=kiRvXzbyQ5ZhESnu99tkp0076A
	45tmw/LOpF1X8ZPh+sxY86ONl46KvH+jLTi/n+2J+Xww8SENqmdk7hgQ+qzstyUk7dR8E9CJ17h7B
	DhzI5/qdUhIMpRrrTqSTPTA65MTc4ACAw39q2eijPKyJVYsKeTkWqpa98vDlGL1cBRgeV7qKtD2QD
	4/75cnQ4actIAqUG1gNir01vHeUaPKyI2vlf4CrGxbUQtjvdejFoutSadrQeqISqoscH8apJNcHQ1
	sO2TvLAbKPdj/tXDM7EK7MVFqrMAM9g+odJ5Rqtr/9SSqOc3UPpdLn/SmsC+luIMUkqveOQBGrm/G
	QYZrUioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpjd-0000000ElYM-2gTl;
	Thu, 06 Nov 2025 02:28:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpjc-0000000ElXy-0GqR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:28:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KEqvT1784518
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 02:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4HjvNLFnxwD9vnohYLriZQRWeU4vT3slKHfceRLugE=; b=gfyB/A77rdK/rR7m
	G2HiP9vbY+4yxLE7NYhgk1Q9EuTipDXeJtvD79eWwY4UkIGJ1eg258D1Zvn4xopY
	CiolNFceVi/lGFB+C3IGRHkNE3CWFztKV1aMLsiAdgW9dbkFiKyKmkRkyKgMIBd8
	1BT1boIZMVhxaSNBU235uiqwNRsro1+6WEUa1/ZL+Va721krqCi57+5UzfPngPS8
	QOXINlPwxahekH//93wrncoD+Jbf35SE+uMW0tZOntLuugnnRgiR9goRHOcsw4Ke
	hw2xTOqdFYymOaKZgcRHHJS4sLYdMs7kQwFoOSrrf8yCIreyEllzPXEjZVf3+TNy
	zTedqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx9fbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 02:28:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341661973daso569992a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762396103; x=1763000903; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4HjvNLFnxwD9vnohYLriZQRWeU4vT3slKHfceRLugE=;
        b=hGVMgKI2joAFFEdELpXXGslhwFbKu0TDcFVO+u1ViT9HHufgl2CbfNLmVZnKcQsxeC
         ZnGo/g2VINXFzQjh16ItcOJ2Oj9cvl90ZekrunI48liH9gp7aObeNU1AIwwKdglZczW1
         1QjulyjpWfhjcyXWzZjse3ty2iYAoN68ZIjO169Zq+QLMZyiYgBMH6DuvbGSayyRhJqk
         ztd/a4afNcP30A4B98yhjDq1hhPLIvCSlaW4YEqMIbsDpV7uS0uqbOInA86YzKQ2+8DL
         UsQqgYSRoPjPs8+PJ+EPfkOlbpZiq/6b+llpb4CxjP2yUXxTek8yKdIfqFaD4jj+OMi5
         md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762396103; x=1763000903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4HjvNLFnxwD9vnohYLriZQRWeU4vT3slKHfceRLugE=;
        b=YdqZdqmKi6gMwGCDIlZkLY+lPr3tJ179O0f148vsEao05sxgROwX9AmKM/Ng6zQZO2
         6WszeiGoXxhCPZkRruMzwPk9ADwCABCEe+6K5bA9a2DYczhZNCApWrm9w0qEy9Wrleqq
         LE0551On8GLmsRr8B2HMnxehcTzgtbFV8iHI3IhRlGHrE8lTbHzS7dSvst47WdrQUYcS
         UJCIMa8Izi/M7cm2+nnkrG+N0WMiQ2Ro1aEVh6V7/TAi0A3ObD0iP7Ca+o4vYl2t9Gbb
         YkHQpOTAFZQkhDYatPYvFyhyeL/qLxhSLbFkCpXUksnGEugr5rcZHkdw3kB6vkG8b333
         verQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWet26D+jNX0g86LZdF5b9gsxu9WU2Dg9VZTvyyA+vAEBmZitCb71XvI8hEUDNJmmbISlq1XS+EenW4AXvJ7Zd@lists.infradead.org
X-Gm-Message-State: AOJu0YyQeEYFsgz6ghG5002qRyPLblnTjPQoboLMsan48JOc2LnCUuH4
	8z2pK3NEdhO3GK+YeYmSeUKLjvcgLxM2WZ4Ukia4cLoMS4/g5Sp9ynHtwnzpNkjRo1ftDsh8VsD
	ISDeTovyL575YC0nGsih0SO0p20hIgum1wrHHi81/SOaFeBqecSAvfk2oJAyna1Vi7VQG0X7zlP
	VIKM5w084n7A==
X-Gm-Gg: ASbGncuYk4oHcpsX3IHPZrlj0EiGefnOBgwtzrTtZq/9l/r3zjq7CLfMAuk2xFi3q6P
	5rh0tVdeGwUVsZodcC12T9PVm3wU+PJBVMO1TWlfuc9bDll6ZRrZt0d1cHFKHKX/zMSEyqv0lbV
	qmqA/W1OwdINprBZJMgFNlqn5bPWzBlQlLUOLBxHdkKR6rDRaOhj40vYDajTc/wvl8a5awiAaob
	3NqussfcStwfrq3xN2Imb9ISBIf36u+LpBJGIwSkPdVkMlrswmrmnY1ALCYJ1XEmkAv5C+XeTQP
	71xkdUd2h6/eLyuONyHAWtrnk3Wl9uQc/OCFT/CCgz9nEw0VP6mfO25M24Jl7XR2BcVbJ5sGKLq
	twF4xax4VmHV5sYhPjTC63EqPZG5djIMc4W9hN8KsM6klmvcOMqzGP1TJUiLv9JMQi+StSQ==
X-Received: by 2002:a17:902:c40d:b0:295:fe17:83e with SMTP id d9443c01a7336-2962ad1c9a2mr79751885ad.19.1762396102780;
        Wed, 05 Nov 2025 18:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1oBFOtqzUwUW+AAZsojfog5/ufDjnphy5RrmbFpT6Iop14NvlZgmut0SAAChl4RXD+SpEwA==
X-Received: by 2002:a17:902:c40d:b0:295:fe17:83e with SMTP id d9443c01a7336-2962ad1c9a2mr79751515ad.19.1762396102308;
        Wed, 05 Nov 2025 18:28:22 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682b4sm9362535ad.12.2025.11.05.18.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 18:28:21 -0800 (PST)
Message-ID: <47c055ae-c3da-4a9a-8a09-b567b1a80628@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 10:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
 <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
 <746b292f-fc3a-43a8-89b1-76f61ccc0630@oss.qualcomm.com>
 <7ba7e32b-f00a-4f77-88da-047126a8c3f9@kernel.org>
 <b9e7f8ba-a629-4316-a6dd-d765ed0037ee@oss.qualcomm.com>
 <17c3ee70-66e3-418f-8c79-926c8a139d16@kernel.org>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <17c3ee70-66e3-418f-8c79-926c8a139d16@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vPzItyMgEj4sJtIDAMa1olYUZFVbiTWw
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690c07c7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=k5NQ7owp_J2c5NZ3w_0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxOSBTYWx0ZWRfXyNrj+T0iHCUX
 Xc15RTlT9Jd6WK1M0TSydA9ZEsisn00Wyz6rZSBybxTyrO84RsEXBL8skYH6c7zGTisehS/G0RL
 fZQNtD7MmRcdqzEpirXW5SIqrzBmVvlxmaYFs2FFrxy+1FzTqYRpa9lErCnnfBoejpIKemyU77u
 tONKNGctHJ+zF/4lkOHehwZJhaTvEOWB9QahdaijpVKSJI5pTScqsYXN3MGrX3VUjsisuDHNlP8
 fdCrhtHMWozZgVpBaCit9CQjRvsIb1pBC/oNNZn5QiH4wFrqS8mHXXYqIrmjesgbn7cDGMkmjdG
 Pp33f/bKZ9ix3J/TzI3hCiKEKSsxx4RqBhQcyqlNwc0+UlUD1l0CDvuJOvzYV3LVpKmrhIVK9nw
 D6vox7BRN8hAbzcqN3RZL1Lu+XN8gw==
X-Proofpoint-ORIG-GUID: vPzItyMgEj4sJtIDAMa1olYUZFVbiTWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182824_120936_FB1626AA 
X-CRM114-Status: GOOD (  18.60  )
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



On 11/5/2025 5:06 PM, Krzysztof Kozlowski wrote:
> On 05/11/2025 09:49, Songwei Chai wrote:
> 
>> Once again, I apologize for not including these modifications in the
>> changelog.
>>
>>> All qcom coresight bindings are called coresight and I do not see reason
>>> why this is being changed.
>>
>> The reason for removing the |coresight| keywords is that this patch
>> series was not
>>
>> accepted by the maintainers of the Coresight subsystem (as explained in
>> the cover letter).
>>
>> Therefore, we decided to make it a Qualcomm-specific driver.
> 
> Use standard email paragraphs
> 
> not
> 
> broken
> 
> by
> 
> two lines each.
> 
> Anyway, above discussion explains nothing about compatible. I might be
> missing something, so please quote here Mike the part where he asks to
> *change the compatible and hardware name*. Please quote EXACTLY that part.

  "this component is primarily a part of the qualcom proprietary QPMDA
  subsystem, and is capable of operating independently from the
  CoreSight hardware trace generation system." -- From Mike

While he didn't explicitly ask to "change the compatible and hardware 
name", from his above remark, i think he doesn't consider this component 
to be part of the coresight subsystem as it can operate independently.

That's why, in the latest version of the binding, i've removed the 
coresight keyword from the compatible.

> 
> Best regards,
> Krzysztof



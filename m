Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94420F43682
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfELObkOOanICF63Ijgm6+zg/NqF754KDKPUD2nRVCc=; b=30/Zs+saGxXbRSmiVvC2I6P+b2
	3zYt+4OiGR7xZQb3fJmvUeE4xb5g7DrvZF3f8NjtKqU310ILlRr5gEwJgdYg5A8ed0Eta1fssrVY/
	WjteFVGeZuqpSGVoivOvpsu6vaTbM1MLODL0C1CbgVXSuGSJbWE5Th6IrtiBQGT5N8UYASqY3tjzm
	J7tpdSNodQVh8v17as8xCRUWvv3iXAy8C/Hh5jHM/R8VcliXRQbeT0IwLUHSyIPY8rokaxSKQCu/L
	xZXdwCKH1EjP4h04v1re6wF+SWgnhZSMEI3VKCsEsBu2s1kl8EeXvRCoJ2FymEUW7QOL6tW41nPwD
	PX5ntleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDev7-00000003iDA-2JFJ;
	Fri, 17 Apr 2026 08:51:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDev4-00000003iBO-1UvI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:51:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H83DeE4018563
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfELObkOOanICF63Ijgm6+zg/NqF754KDKPUD2nRVCc=; b=DTMlWHQZ6+IgVl+B
	PNPeHAwSBu+DGLWcFdxvpGo71gIRKsMdCEjV41t4haZ1vmjxkMH1bIjh3VJ94beu
	yVGlCLXZ+XLvN1ExapV/zjxBs8gyyTASQ8QrNkShnZ/AoSed435XbjBVRH6Wkiwk
	HwvWR9vE2nR7Gsy9nEbzo0pglbPeYDfncEx9BaoaoHoTdVrWuIPkycbb/hYnRhWC
	ImtQbmTQ+oTTgiXfX7/famikK+Iy20BkpcDr1NCjbH2oYtw5P7LW0Ldh7JBtRUBS
	cLytm40I+ZDcZDvjPzv7p7pkfWTWhoRClwA7TIO5zd+f/zSRwVq84Er8Gkv1QDDE
	OpvpbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk11rbhwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:51:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so344339b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776415880; x=1777020680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfELObkOOanICF63Ijgm6+zg/NqF754KDKPUD2nRVCc=;
        b=ALWej661IwpnEsNbOeyErE2S4cCjGVYEJOa2qp9sdl+0LFwepYZMPN/vXGJcSos5kJ
         ENgWV/QoswfO03PCXxhtB2wsdj+vwPRHTlEzqdZ5E2qxWg6KRrS1kYHnZ1Pe4UL6os7K
         2eIZSJvP6JIeMii61trusDZUtl43i+qQ5c4D2THJFqUEUkEbl2H8VObYHVU+w7ZI/RPz
         TRL4IsLk/IaE/ZpCrkdsF0Px89l6XNucSxH3q6R90j4l4j2kCBpA0NAxAY2y0lXUQlRE
         qRnSx6z6XXFKlnJxim0FPZ81u1VTqUpCsCz0N2X26/npiA1aaaiYjVChDbLLywJeMfbZ
         lTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415880; x=1777020680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfELObkOOanICF63Ijgm6+zg/NqF754KDKPUD2nRVCc=;
        b=TdkCc86gSTJ7r4UD2J4wXxWO5yrM+Jwnz5i5J6JYRpRQXN4IXUVWAdr0A2TTw9BoOE
         VjsDhWdTnzZbsz2EHwlPDj1evtD8c+CYXYnbNi1u5Bh13TWJpsyYwMMIa+rqBzhFllyk
         bTFOmq/E7aJJbzz67KCuJpn2sUMOsnHvfPwVrWO2YFAnVzx3zxHhy6a0vGJBUZ6CsVX/
         OODkFU9ceUIwio8aPTBJDfuQfkqOjSnBUeg7x0qUdcv7QPgD3921QVRALSqky9J8DyEP
         RjxJWRiZzsm0xV2bf8DyJI9FuXjOqAwqm1Ti69U6kGjhagGn4tTeF5/QTqO1SlGWuf04
         kM9w==
X-Forwarded-Encrypted: i=1; AFNElJ+FNcmKMg/sa/HTbNrz9qg1TbPk3g8qnUty7fM4zZWdWXlH2WkydOBh/GWk9AySgSddSbxtSca8EYCtDJttJB8O@lists.infradead.org
X-Gm-Message-State: AOJu0YxfTZAqBBWmFtC79txsmTkHqJJFO8ZRUNuj9mWK7RQfReQUmAVK
	Cc7v1iH6ihVcn/sCvll9g4CKYnxsUl0rZg7ilZcB3McaScpv3Xomb14DmolUagNZBSu6RmEnDJA
	3IiFrf/2Z1eWG9GpsebbK9lPmbxr+0tiMebGyccrUdxQYR+XF52hRjImcWwEYGp8GZHimlt4QOA
	XHpHYfHyp00A==
X-Gm-Gg: AeBDiescEoY7LIAFEcoAacdg7cx/E7xjyaYZelPhs3LUG9wUBvQhNkhKu4N7v2hZerx
	LprMm7VDzwd0m3C3wu6li0Z+uCBcDOFpFXoH7Z5EqRkoTPQav4zpHiTfWkZ5TscD3MtyAplJEvQ
	vAups7tnhzKvjucJaiDD6WiqPBJrelyRetqbm024KgXtPjofDhhFN3c+wK9YyH+wPo+OMYz7zX1
	uYfmaqn3ZfrXOzTb3NXuPQKvs5KR040gaXuaeybLRRCuEStT20fn0sS1toB86vqVD2kCf55N8co
	5DHAYnhEUIU9stIAPPYBDEUTXCoDRJ6Q2+Tt7Q3RGRgRKnxtqWQUaBElkFLwZPJOG74GR+dNIc/
	1qznY9Ghtau+7F+9oLH/Sf36uN550KvUdI/T7LOC5bJ0AMAJuYWRuWWNx/nJRxnoXIWznyqp6sG
	p8WxeL/QKUeC5o4YzMcLGs
X-Received: by 2002:a05:6a00:3315:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82f8c2a9ed7mr1948602b3a.0.1776415879975;
        Fri, 17 Apr 2026 01:51:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3315:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82f8c2a9ed7mr1948575b3a.0.1776415879510;
        Fri, 17 Apr 2026 01:51:19 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981c07sm1637995b3a.1.2026.04.17.01.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:51:18 -0700 (PDT)
Message-ID: <61c957b5-6072-4936-a37f-84e9aad8f5e3@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 16:51:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
 <e994bf83-a66c-453e-aee6-c15b6888499c@oss.qualcomm.com>
 <20260417084118.GP356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417084118.GP356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4OCBTYWx0ZWRfX6A1DRuvSJmQ5
 9KG5XMFrF5eXMx3LFdzr5Z9W5J6W5B5c4yJYnkI28Mz/wcYEcUcyR6KEdDU+BmwuIs5U0MXmOf+
 XtNORWjm0SS8emxGj46iYP1EYkGfl5oazcAhZpU4Lmjzg1X1l0PqovDq3bPdn19737VZmVWFGkl
 lTMKsDN5f79IBce2uGMGXuB71zwxuCaXI7hpGJJLL/Dgg31Y+OLN+5XpXSMw/F3rPZCI0Sh7T3M
 63weh1tDAHlmFfSL0cBZOC8lOqboXdHGuMjJFuzUGppNGCUS5eoMOEH4d8GRWHXkelY772pUmtr
 2Qtd3kCsGC0bexYqw2s/8191e3kFMFcfn9068icrSIL2FHTLHQgl38ZLrMMBKCXNQHIeEvNOuhD
 ajB1o17aVMr+6gpX+dqdVosDJSHpIXnJKFFDcAHG5sIAmch+M3nhOn7v2IzN0EI15fqPO429vZU
 I0XeXPxqWAdl6xBl10A==
X-Authority-Analysis: v=2.4 cv=ZPznX37b c=1 sm=1 tr=0 ts=69e1f488 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SV0BbDEl0i7SrRYoWUoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uQUNgVDc-MX7mfM9LmTy3RnRLt20JChj
X-Proofpoint-GUID: uQUNgVDc-MX7mfM9LmTy3RnRLt20JChj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_015122_430203_E532C2A8 
X-CRM114-Status: GOOD (  16.92  )
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



On 4/17/2026 4:41 PM, Leo Yan wrote:
> Hi Jie,
> 

Hi Leo,

> On Fri, Apr 17, 2026 at 09:01:17AM +0800, Jie Gan wrote:
> 
> [...]
> 
>> ... we still need support static trace ID allocation in parallel for
>> the dummy sources and we should not break this logic in future refactor.
> 
> Just confirm what is the reason you need to use static trace ID for the
> dummy sources?
> 
> I am wandering if we could use dev->devt as trace ID for dummy
> devices.  Since the device's MAJOR number is non-zero and occupies the
> upper bits (see MINORBITS), it is naturally separated from the hardware
> trace ID range.  If so, we even don't need to bother ID alloc/release.
> 

The data frame is generated by the dummy source(static TPDM, or some 
other static devices, connected to a funnel or replicator, or TPDA 
device) automatically(contained pre-assigned trace ID) and the data 
trace is enabled by default. What we should do for the dummy source is 
enabling its connected port in driver for outputting the trace data to 
the connected device(funnel/TPDA/replicator etc...).

For this scenario, we cannot dynamic allocate trace ID for the dummy 
source device. Because it's pre-assigned during the hardware design.

Thanks,
Jie

> Thanks,
> Leo



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE4BD47CA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=; b=tzmEHJGy1jSIeBZPV2PEgw8XB+
	ZW1bVwkEAa9LVIpeTYvPnW9IfPsW8eWWkXVavQLMJOZo6PjdhU5CDXPglhak5Obx/xtDjkync5+24
	Jso4JfxIMhTthXjQgZ7kiSCxSGknmwmzJnkR02l3d8TFUxgUm74xQNL4QhzqrT4yBAmCkKjclMOYu
	4vVQjFz/ZUKfK7KUJl6KEhINHrh6EqJo279p7tTzc4hFYv8Y1xZ1AYWaEFoHk0FaxkTADc11Jj2Tk
	iZLdmhN4VDCpvfnfym9nJaCBH2Cp6u8lf0g9FV+CNqr3Zz4/zPRxR9vfr2oAy8arrg9rbbCzytygy
	ew+emDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgX7r-0000000DLIF-2IA9;
	Thu, 15 Jan 2026 23:51:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgX7o-0000000DLHs-39oJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 23:51:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbbiO3596353
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 23:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=; b=fAkGSITdOLVDSZgw
	uInoMR/a8vKztMCydd1E1+Z4IXXnkaYXJz3XbhKMDlw/sguh1SFICxOHk+bpvQtt
	gXQ2KH/zro4A1A84uc6/hid70Uxlzi3yKf+j5XlPEcdq+7G96l8Z8pwUi9uTg0IR
	i84J20OQSCoPzQZpA00SiFY8AK89vc4UVRQ9+A6yynrUFUCMCPcQHiOEFkpQxf9g
	oVrvavsRGWVTVGtj5oAID5pjdS7KzNtMTptP0vpG33G3Ty5qmYGjcZ+V3erLgPon
	2rIxRlru+8oL+40HAcSdtVaUqcufNd9m1PT50iVGGhPZPW1wMeI2aNW+1sCTnWsY
	mzAFgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rr4vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 23:51:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac363a9465so1765506eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 15:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768521095; x=1769125895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=;
        b=hTfiSV4qFcPYDqp6g6CCTtqfj/XdFArOuXB2czIZ/mhHoJjXOIkZ8ka8C9FKE4fKjo
         f/2wOMYT7CS/rS2GBLmgUUco62SiisPoZ8Bk0nz8z+xhLigz1fKUk5akBcLaVFy6S9FB
         BeWfEagXdabXbFcNcVNIHvu5lFlQgM/HgOeadnf1hheQqiYGnEWwVM7xaSxBuByRl93m
         j8MilYRFKOv5Thg/48S2V0RcO2dhlHp5KJczDzJVsvoukvQ6liSqkzWQg6ducN1xFbnH
         GwzA6uyuwIqOAYhSpBm6yporjmI1Trt9Mf9PFXsNumRSXFhOmv+xl7kxoLT8lkSDXb7s
         2aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768521095; x=1769125895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=;
        b=may2iYfIqsb4Af/lqE4UJn+IdrSghNRunRbP1rMbVvMFLzveUdsWlDtIrAfqIRoBFc
         kEq71rIPN0kQ5KNNu5o6k5FAl084/LB1jrcUlSTkwbsh7HQf7G5g+os7oQJ1jCjJbNNI
         xc8gf841dqBfN/Xkemq+Zrn6hc5KJLbWz0C4IFB95Je8FPq8VI6eYrhhge2bgjb+hsZ7
         PxyMeCI7I96U5AsmG0cb6ee81uezloe16LEFeP16sEWOu7+YkXexrVCfrdE3HOvDXCCk
         lRcOe9JaOODIoGEnqAEzXPC12yc+wiavAj3BoZ6DUSWVA0AqQWYDmDJ7bUaXSwGtFE/L
         ph9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3UrI1LgcHuMS4seo+sR93vEgizHa/IDvagHI3uMGWPzUYaY34IPvNu0zwQXQlh2EBdSjiMdi4uq1qRb0TbSlf@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqrnL0zRjxanrzezdlUo2HrN/OLyK/dEfyxI5hy78+GgHeMfL
	FQl6EMHOZVrcJnXPSeAZXlpMjez3C+UdGDe8QJejLlszTenQl+obI12jxH4lMSJ5DPtNrk3kCLl
	BDk96Rc8lAy5n5qvdF7+BMgNsKQTd6sFuI3wYFTffZjAr72IwhhYIRs6scKuMXSiHcLkbu6lu8T
	rygg==
X-Gm-Gg: AY/fxX4rGO4LiVM5N/rNpKE34Ps5QsrjL6yq7b3zWQT/KHUGehgQtFlPXqKSKzMF9FV
	iGQqLk73CUMr0NI9M9J88JpNSENIe6ZZPk7PVri1ox4S2P0xOAJ5+HVrFbvMQryV1S7asncM1w5
	lGyhSHrQodU7RVeaD9q0Zk4k9vN7T5Xj6kZVyNOgrsBA1Evsmd/gMTNJC+vIcZ1QU4wBbI6Pxlc
	7+T+y3iuhtCkVM//c/Ami/DgyBto/SlxmMd7f4x6O7KHedujzva4/yuBD0K4s9TWVZr/0ciZDta
	jrFsJFEJhGSsmKKIy+fRN0vD88pehKSIXTVPf/4NLQuhaBoMlDSU+A4mgFUiEGPUdKBwM7e8XwV
	tCd3BGaZwzt0ZUp6MurEautaZmvhNc1vQw2tExaK60FR7s6R37EP5bpSQd4n7
X-Received: by 2002:a05:7300:ec0c:b0:2ae:5a13:9e3a with SMTP id 5a478bee46e88-2b6b412acafmr1004548eec.40.1768521095112;
        Thu, 15 Jan 2026 15:51:35 -0800 (PST)
X-Received: by 2002:a05:7300:ec0c:b0:2ae:5a13:9e3a with SMTP id 5a478bee46e88-2b6b412acafmr1004533eec.40.1768521094447;
        Thu, 15 Jan 2026 15:51:34 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b351e38bsm747551eec.14.2026.01.15.15.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 15:51:34 -0800 (PST)
Message-ID: <dc26dc7e-a0c1-44db-b719-1d8f34c2470b@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 15:51:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4OSBTYWx0ZWRfXz7ol4gL8jjSF
 4jIUA/97rj6fjHNIT/fbatU8SSPcFxmvmcbBQL7tsq7u1q3CPJh4TPDZCRMIm4vhymdgT3Wzs8k
 gUAHDRXr56hWhv1NfJG6aJz3uv+3AFQDBy6A9qfMEA/77gb50ST0j4OJ79pPAwa3LHaK07K89NF
 bF7beF2L0o646RAc8CIHVqfxIEhhHQ7Wj0xTtn9NJtnnZO/XjVZ04sR6swlReEcPcZjGlt8Z+de
 SJnhXJx0ozdMn0JyEO57JNNEuNFyeBmWHuFzewAyjNmoS3u4/6p8W3CX9fzHCI5jiFj3i2Okma4
 bIp5EPMsZi23VcHgP4j1teyOLey9BI2BeeebIAwJdyc15k+7oiZgHtiueFqaQtXQZKKHzl6J8DW
 rfZHyOjS71dJpcRLvpvYrkBadzImToZ4bczt1uaer5mTgRPZhQQSo2M9WzyZMlK0tRW9WmIaSHz
 BSoUNX1qMSXxuMyl0dw==
X-Proofpoint-ORIG-GUID: RFjJmGgX0PdMN9rTgbOktN8NOd82dpcy
X-Proofpoint-GUID: RFjJmGgX0PdMN9rTgbOktN8NOd82dpcy
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69697d88 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=ZFde01yRvqAbkRv1oOAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_155137_189551_EB4386E7 
X-CRM114-Status: GOOD (  39.16  )
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

Hello Dmitry,

On 1/15/2026 12:18 PM, Dmitry Baryshkov wrote:

> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Sudeep,
>>
>> Thanks for the feedback.
>>
>> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
>>> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> Hello Sudeep,
>>>>
>>>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>>>
>>>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>>>
>>>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>>>> disabling it and using the OS-agnostic SoC information interface provided by
>>>>> the firmware.
>>>> Would like to add some history here. Vendor interface existed [1] even
>>>> before
>>>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>>>> which
>>>> uses the soc0 interface already.
>>> True, but that's not the main point.
>> That is one of the point which needs to be considered in my honest opinion.
>> Vendor driver existed from long time (v3.10 Kernels) in Android
>> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
>> and lot of user space entities in Android depends on soc0 which is not just
>> limited
>> Qualcomm user space, but also, 3rd party ones.
>>
>>>>> The presence of this interface strongly suggests that the
>>>>> firmware is designed to support multiple operating systems or software stacks
>>>>> that already depend on it.
>>>> That is correct. We started seeing the issue with user space when our
>>>> firmware
>>>> started implementing support for SMCCC SOC ID recently for non-Linux based
>>>> product.
>>>> As the firmware remain same across OSes, user space is broken on Linux.
>>> What exactly do you mean by "firmware started implementing support for SMCCC
>>> SOC ID recently for non-Linux based product" ? Does that really mean that
>>> you can change the firmware for Linux based products ? I don't think so and
>>> hence we are in this discussion.
>>>
>>> 1. Either it exists in which case deal with it by disabling vendor driver
>>>      and/or fixing the userspace.
>>>
>>> or
>>>
>>> 2. It doesn't exist which is not a problem.
>> Allow me to add some more details, so far, our firmware hasn't been
>> supporting
>> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
>> started
>> to support the feature and same firmware is used even on Linux Android
>> (android16-6.12)
>> based product.
>>
>> I would say, firmware started supporting the feature on our newer product
>> instead
>> of firmware being updated on any older products.
> These are two different cases. But as you explicitly state that it is
> only for a new products, then you can fix the userspace to check all
> SoC devices. Broken userspace was never _shipped_ on those.

Though it's a new product with updated firmware which supports the SMCCC 
SOC ID,
Kernel & user space remain same (Android16 based) and shared with other 
SoCs.

>> Now, as the user space remain same and is relying on soc0 interface already,
> Why does it have to be the same for new devices?

It's a software stack composition where Kernel & User space is shared 
and expected
to have no changes (shared with other SoCs / Products as well).

>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>> into Kernel and takes precedence over vendor driver which is a vendor module
>> in case of Android.
>>
>>> The userspace
>>> tool seem to have made a wrong assumption and can't expect the kernel to
>>> magically fix the issue here.
>>>
>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
>> Sorry, at risk of repeating the same thing again, the user space was using
>> soc0 interface on Linux Android products for a long time base on vendor
>> implementation. While I agree that, user space had some assumptions based
>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
>> should at-least have a way to disable it (via cmdline) based on vendor
>> requirements.
> How will that command line parameter be set and passed to the kernel?

Either from Device Tree or Bootloader.

>
> A better approach would be to fix the issue where is is broken:
> - Add a switch to the firmware, letting it ignore SMCCC SOC_ID calls
>    (like it was beforehand)
>
> OR
>
> - Fix the userspace
>
> The kernel was never broken, it is not a kernel change that introduced
> the regression. Why are you trying to change the kernel? If it ain't
> broken, don't fix it.

Sure, if we can't do anything in Kernel, we will explore these options.



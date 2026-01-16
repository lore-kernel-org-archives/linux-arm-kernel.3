Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A12FC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=; b=nddMK9jxv5g1iqg2cA4cZZLP1V
	KyvRqhP9QGMObcNLdQTdKcw6u2ZULX+pLQC03nAHWGOkSlolda7TWrk+9oIBxMW47EuNIK+AXtInw
	mSA4Msa34tOkXMFQavhlg/Tlmwm0CHEzKQwKB7MXZd6hrt3edl/fIEma+y68JicGK9DNs9Pb4i7x0
	hS1OysLniCArKkRx0KrcSxt+w9x9Ks6opqO4hWVAIjumemi0Ynok6KuoR3uVg0oLsFSyrVpvAv7Fb
	NwhMrVwZEC1Bo5IcHVToDFpdhsnm+Xhb7/baWRmz3GEOFIhkwPx7FvdW4pJ+o79mqrXlvyQupjbW2
	Rl74QxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtdy-0000000F1ts-34ef;
	Fri, 16 Jan 2026 23:54:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtdw-0000000F1tX-03Gj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:54:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDbjp166382
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 23:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=; b=HfxGdoj4K13IWN2a
	js1Std+bNsExY2nGfagxetRhQHpbR46SWM5m5in8yrkdUQJlbbROP2zHUB4a65er
	tkWeF2jJUJ6c/6GvZzZvTgDAhdSXhFMJKJT+nop8xfkHbJu2apJSd9G0TuKaypXx
	W0PlgYr251V2Yub+pFwKY9lYIQNZIbqSyFc4DOOhzHI9bc+DYllGmfG+NZUvKdaj
	rTARa9natVj5TB+uxZk9XIAkxeEC9SHfAjtR72hHt46ZsyntVAdFK/YcG/sI9V6T
	w0Lw32X/Ch1JX1J60bFC3SGc3Rvh8cXQMVuR+GXGynnv3HUWJ8oFGRg8laLrP1om
	5+g41A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqved0d2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 23:54:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso2778251eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 15:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768607654; x=1769212454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=;
        b=ZOzJGvg8KmVD/iJEv3iJqCFpEUt2tsp3yZLXemYwNALsUx89ET9i+2DHP1sK/nqAGW
         +OmGaxFidwGWObQurOqeN03hOxpP0aWNtBALsQHb371Mcb6Kzk7yfeRSsMKRIqIWB+CG
         dC0/ATD4g55wINfmELystqBkJVHWdbsYOcIGRxjPssoqQzsosC3lNLq3Kmt31u26wjbx
         ca7Qd9HoFTTtWmfL2QAbKz0p+peNHyQaoclSETBfjnn/6YuHmi/qmYWRjMZWAovAh52D
         xkW4f42OgyUQpAU7KUuhpgTlS2LcUW036RZL87u5iTw0bNl1iyYxPbndY648CStP/tE3
         y0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768607654; x=1769212454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=;
        b=EOm5I85CWstpMWasnYCqbaOH1hkNwvjtVff7iQmX422hVfTrSzvqBr9MD4FBx5fxXl
         kRAx1Q0r75BW2HAa12Iob78JZEtIDaUeNubfWBc6ore8LpYNhuoyjaHHu+LbH0aunj1Z
         +5nWyNbd13hACU9n5ic4B6/e/kLqJxjMRIriE69xzIAm4r5DZ1ey9EtRe/Ex1qBpaLpo
         arWqkbrfu2E+MesE8x4Fepa1H6BIQloPn5UMQAOHywDaOMfOi16d4fT/t0KRN7AynBHS
         OdqHFsfbt/nx+s30+jnwysyCsKroDFGGJPZ84pus7+gHTtWrQ9v7lewkBZutiJnJvyTV
         Aumw==
X-Forwarded-Encrypted: i=1; AJvYcCWKInsohVRIeOKiZUt/Leh3PPDk3s3OWDR5FtzzK5czG9Y8AdonbwG5tIdTf8SeVsojwiJuRCMLnmH64GCn02te@lists.infradead.org
X-Gm-Message-State: AOJu0YwSXfEDdq6mJS29h0MbK3k2s898nW8QhyuXwpHOOpBqzaWR7fEb
	i9k0gCoD/g/S4IO96hXLFckPiZiW2u6jpBtdbS8NwSHb0FKZa7L2TnUb2holgoCMo/ubv+GZZzV
	JpBmkoM2XU/zKfXsF21e+a+2RLb1fgiXVpZw7G+0OdFEDEo4/ub7HOqJU5TwEORQD1kf7wvEmfF
	4t+w==
X-Gm-Gg: AY/fxX5/FgBTj83Ob+EVtumQufzqW8kIa7R2BEJ9Gnfoqlh7H4yHYU3sQHDGbJG63i/
	fM8Z88oh0TwLW26Q7Vfnzw5LxTviy4VbAjOzbc/0cfjvqi5Pw2RSq/TVH6rr8aTiKuwxrtjl1Hl
	53EnzvA4sGkGKkHNJwgr9NoOYZIbWD5pst16+UcZ6dJr9f1yQ53shpCpHgqXzGuDtukfDtBdlNd
	RuG1Zfygv+iLyszkrIRVe9b96RP2gc0ASBwIyc60UDvvr0qZSUzr2oEbvlng9ArFcfekAhJZFBl
	LUleWCnfvm6pVYkHmytYcssPVsDHhbN1zMVWv9GTY+Jsg0pd9dPmekp16n3vl9oiunLcP1765CB
	iqyw2VovCWPrJiH4lba8Tra+4495LShtpvDI1xdHNwFUSKd6mIOH4bjkO2i8+OpZ5onQv
X-Received: by 2002:a05:693c:40c4:b0:2b6:bd8c:48f4 with SMTP id 5a478bee46e88-2b6bd8c4caamr1984976eec.10.1768607653732;
        Fri, 16 Jan 2026 15:54:13 -0800 (PST)
X-Received: by 2002:a05:693c:40c4:b0:2b6:bd8c:48f4 with SMTP id 5a478bee46e88-2b6bd8c4caamr1984903eec.10.1768607650057;
        Fri, 16 Jan 2026 15:54:10 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm3885943eec.23.2026.01.16.15.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 15:54:09 -0800 (PST)
Message-ID: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:53:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0aWR87vITJ9dgDu93w2eCmafCe7k2pk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3OSBTYWx0ZWRfX0musO5RFd1Df
 ZAb/aOc1uptgXYRNSxR4z1gX2xaqwroEJsZ6wGLjc9VXxqqNvBNJSZUJUM68GP87EOXUKL7Zjij
 gU8s13wAAm2OJe89HP/tp0dsI7cR3wN0sM6ZVydptg2FhJb2L/h4ph91B57goDptruk0ogXssNI
 6hQlCKUIju478J13GfHlag060eg8i+ZEbRnTRKo6EMXB6EZQ+WKwLUZgG1H2KwO71ljsu2LLIkb
 HeKKiNMMywEtg6MTr0c6ThZUF6bf81GTJQSvLPwK+M5vec6UZI7GfYQI4BXHzmWEN8xbG/KIBYe
 HjiTrPe8QeDryTZL/L3ve31tV7zgcswOkh8MZ5E5vJX4X2iY+J50SrHt4dNPQLxmYIzusMrYx9d
 dTxiznQh5JurDZUC8i6Mk4K/SPjBAryUH6wPrXW8CcRNz2murMq339msRpIbxyHGB1TKiHTRdsr
 AXLrgcfyTFx/oORLk/w==
X-Proofpoint-ORIG-GUID: 0aWR87vITJ9dgDu93w2eCmafCe7k2pk8
X-Authority-Analysis: v=2.4 cv=aMv9aL9m c=1 sm=1 tr=0 ts=696acfa6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=91vdWaX_6ZDrg8W_R2AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601160179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_155416_078544_9AAFF4CA 
X-CRM114-Status: GOOD (  41.99  )
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

On 1/16/2026 12:53 PM, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the discussion & feedback.
> 
> Wanted to check on below possibilities to disable the SMCCC SOC ID at the vendor end, can you help comment?
> 1. Introduce cmdline option
>    We are trying to pursue that in Android Kernel - https://android-review.googlesource.com/c/kernel/common/+/3912874
> 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry
> 
> If any of these other options are agreeable, will send separate patch.

You broke the replies by top-posting here. 

> 
> On 1/16/2026 2:39 AM, Sudeep Holla wrote:
>> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>> Hello Sudeep,
>>>
>>> Thanks for the feedback.
>>>
>>> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
>>>> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>> Hello Sudeep,
>>>>>
>>>>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>>>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>>>>
>>>>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>>>>
>>>>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>>>>> disabling it and using the OS-agnostic SoC information interface provided by
>>>>>> the firmware.
>>>>> Would like to add some history here. Vendor interface existed [1] even
>>>>> before
>>>>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>>>>> which
>>>>> uses the soc0 interface already.
>>>> True, but that's not the main point.
>>> That is one of the point which needs to be considered in my honest opinion.
>>> Vendor driver existed from long time (v3.10 Kernels) in Android
>>> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
>>> and lot of user space entities in Android depends on soc0 which is not just
>>> limited
>>> Qualcomm user space, but also, 3rd party ones.
>>>
>>>>>> The presence of this interface strongly suggests that the
>>>>>> firmware is designed to support multiple operating systems or software stacks
>>>>>> that already depend on it.
>>>>> That is correct. We started seeing the issue with user space when our
>>>>> firmware
>>>>> started implementing support for SMCCC SOC ID recently for non-Linux based
>>>>> product.
>>>>> As the firmware remain same across OSes, user space is broken on Linux.
>>>> What exactly do you mean by "firmware started implementing support for SMCCC
>>>> SOC ID recently for non-Linux based product" ? Does that really mean that
>>>> you can change the firmware for Linux based products ? I don't think so and
>>>> hence we are in this discussion.
>>>>
>>>> 1. Either it exists in which case deal with it by disabling vendor driver
>>>>      and/or fixing the userspace.
>>>>
>>>> or
>>>>
>>>> 2. It doesn't exist which is not a problem.
>>> Allow me to add some more details, so far, our firmware hasn't been
>>> supporting
>>> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
>>> started
>>> to support the feature and same firmware is used even on Linux Android
>>> (android16-6.12)
>>> based product.
>>>
>>> I would say, firmware started supporting the feature on our newer product
>>> instead
>>> of firmware being updated on any older products.
>>>
>>> Now, as the user space remain same and is relying on soc0 interface already,
>>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>>> into Kernel and takes precedence over vendor driver which is a vendor module
>>> in case of Android.
>>>
>> See below example of lscpu and HMP.
>>
>>>>>> Aligning the Linux kernel with this
>>>>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>>>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>>>>> userspace to correctly parse and consume this information.
>>>>> Agree. Updating entire use space would need time and we are looking to see
>>>>> if vendor specific interface can be given priority over the standard
>>>>> interface.
>>>> That statement simply doesn't make sense at all. Your product took all the
>>>> effort to implement standards and then you don't want to use it at all.
>>>> As per your claims it is not even broken(in terms of data from the sysfs
>>>> files), so I don't know what to say here, sorry ?
>>> As mentioned above, the requirement was for a non-Linux based OS which
>>> impacted Linux Android baseline.
>> Read that again and think. If other products can cope and are made to cope
>> up with the new SOC_ID interface, why is Linux so special not to follow that
>> and fix the userspace to start using new interface. If just getting ID and not
>> name is the main issue here, consider moving to the updated spec or patch up
>> in the userspace.
>>
>>>>>>     Given these
>>>>>> advantages, why would this approach not be the better long-term solution?
>>>>> As mentioned above, existing user space will be broken and fixing existing
>>>>> user space is going to take time. As the feature itself is "optional" from SMCCC
>>>>> specification, if we can't disable by default, we should at-least have a way
>>>>> to disable the feature by other means.
>>>>>
>>>> The data given to the userspace from the kernel is not broken.
>>> Yes, that's well understood.
>> Thanks and that dictates the direction of these discussions.
>>
>>>> The userspace
>>>> tool seem to have made a wrong assumption and can't expect the kernel to
>>>> magically fix the issue here.
>>>>
>>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
>>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
>>> Sorry, at risk of repeating the same thing again, the user space was using
>>> soc0 interface on Linux Android products for a long time base on vendor
>>> implementation. While I agree that, user space had some assumptions based
>>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
>>> should at-least have a way to disable it (via cmdline) based on vendor
>>> requirements.
>>>
>> It was the case with lscpu too. We didn't disable HMP just because lscpu
>> didn't understand or just read cpu0 data. It is exactly the case with
>> the userspace tool you are mentioning here. Kernel is not providing wrong
>> data.
>>
>>  From the ABI document in the kernel, it has been marked as socX since its
>> initial addition in 2012. So clearly userspace got it wrong and no one
>> realised it until now. There is no argument that data provided from the kernel
>> is wrong in these discussions. So I have nothing else to add unfortunately.
>>

I believe that point(s) we have not touched upon are following:

There will be thousands of Android applications using the native interfaces
in the playstore in various regions like US and China and so on, which relies
on getting the SOC_ID to understand the product and enable / disable some features.

For example, benchmarks like GeekBench or Antutu may also be reading these
interfaces.

There are apps. in certain regions which are still not updated from "32-bit"
to 64-bit on Android yet as an example and there may be no way to reach out
to those developers to fix but apps. are still used by many users.  

If we need to move all of these third-party applications to this new interface
then we have to "break them" before we fix them. Do we want to have such approach?

We should not have enabled this feature as "default y" in the first place and should
have kept it as "tristate" or kept it disabled in my opinion.

---Trilok Soni



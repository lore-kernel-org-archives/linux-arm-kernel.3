Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCA6D46606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=; b=yDTGzRMbPEzqWLIhaXnrLgXm1+
	3ZKvS4XAORBqiuccWcLDzSlplXVzSzjsqGzsYenPGuwOQPJC771W7zhyhLIbKzvE4Z+DobeqZKN+K
	VSb/VWA+8lqxJMG+iFN8wFISt2UAfEjvhIyJy/eUf6ZSCqOCuuU4Qy6vitFVjVmFS1OOq1sCY5LWu
	lox6z+WyZhxPh4JeQCnZqyETsOc+QhJV/SYpbzt+OQeouwh48CwrhV0QNPdsL5CUB9d5+uecHmuwn
	NustkvQyuQ/YQbPSzQB+gObqEFcdR/QOuTWhhp3DQzuN4QdbzXLw6ytfLln3r5iIv0rYXxt/LTk++
	+ZH0rSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSJ8-0000000CzXM-3PbA;
	Thu, 15 Jan 2026 18:42:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSJ6-0000000CzWY-0VvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:42:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYXRY2981359
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 18:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=; b=DVxeKx+PG/wGcanv
	lvXtlqW+Y9py0z9vXnvtQ+wbXDb/54ml0GN5hx8K/R+HL6Dyqa7adjO4LdUvtGqm
	eWh0Gf9JCnqVszh5L2CDw/MO50/DcspDfrodQoYtUKzRvF3i08Hiw4CPVTLtzFmR
	7c1qx8NfheYH/XqudzjENBw5Z4o5YSzChpd9VL9LgDTxR3X/Yqcq91lNtFI6bURt
	Z9b9L1siQKPWCs0Z6aMd6s2apjFSAr6Q120YSWymMbiLmxjTkUWuESl7eCwOk5UO
	WOJ+rGzhC/539X7MNN9eH+iRTYlbB9ITG71J2AGAZzFCJw1B3JCtUVvTQMhX9lKn
	WLbhkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej2jec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 18:42:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae32686ed0so7971371eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502574; x=1769107374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=;
        b=Ien4jUzVwz8xdIOTt8TQII/Km3XihjcxecAPFYAAe6Ij4Wi14UQWxy6H/9BYNmDm1q
         fQNerIO5mslZzy3d9ajO8Jr+NWjtVdpXm3suf0a6FZ8tVen1V6Gz+n2yOTxkdm/+f2nJ
         2pS+3Kw97W+RviTvL4w8vWSCFIDhtM8PjtAegdoh5+b4FIhqLM3xIdw1OCebtrWWdwge
         C1duEFUWaffMum4sWRVtavPAZ5cmjqTRFcEW51iwCEJvsaV3cZCzQjHkE1ECreH47yXR
         lHdEL1IfRDVhCPDtQt1MI1Za0rjITx/ygqxf4K0Zon+hiGBySaLzOC0uCXfj3fvVPmA/
         iihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502574; x=1769107374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=;
        b=fZybryt59Kg2ZbG8EOC1YQ4n0K4mjq9bTLxs/Pdb1k9bhABKhYt29kZDU+TQo6+czb
         LnPZ7ud5QeA0WRvin8acMQgaWdjjDM8h92nNw7PSUH3wlF3k7y8T/i5OnOzTtvC5bYR5
         +XGxinKTJJwgc/rkBdC/ur7agQXOApe9YwJhjXOB0zSlf6h4dkc4+AOfuUXAuOa8R9W9
         NYnwfN005+i2m0vKzTbSiN7DGydeJjE66g4kDTxzc4GeMESSrzbN/RdEWrOLO31KdlpN
         V9lH+Jc6iNah/gY+0yHYK0Hi6h48p4hjNXVs0hSV5stWjWvtW7AyPxwy5whzN1JoIcTS
         Jqfg==
X-Forwarded-Encrypted: i=1; AJvYcCVSW6T4iBHRQ2Hd3orVfQkgAfUMJnFvgJBFZC+J93944TGH5XupVpfVdiRMJ3E6sYI3exfa6MuGzVetsSyZbC2X@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4iiNVT0WYIxWZHDjR5FxuZWy5MCBh3eQ4SEJaSweD3RAgnpYi
	SMBxVMVwaC3wQtb4N0TqaBMWEFY77v/85jx1QCdE8nbnihfuU8hJshRJnIMkBDnV6POLaMuBXn2
	M+p3+bar6Ci30EgHVRKwq5AQOO41qIBPOVZ5+CVXMwG3CrWp69MfHvvwANS7Vtvp5dSnRV1/WMj
	VWQ0QfTG3LCg==
X-Gm-Gg: AY/fxX7VNtE8iNwXlIAHZFENpy5udTkcMaaZSIih5dmksrjPrFmVT6KYDAsrjy29Ruz
	8ZN5ugRJlVHTo/3KkoPXYJd3Ux1h2PFBBO3h36h211YS818Rf+URWAH2keX8oY6vob4RuV067iB
	uFwVzVk4MAT/J1eZx9KjDnSPNoUxZ8WM7ZVhcMbJdql82vfGaS6OEVrTQcsTcRkFcQpiJ5hzFrs
	zKpPpS3bJXTN9892fCEL8dnG41ATJzgSIccCd/h8c6ut7b1ufCbJ7x8xNZKHwsEqIH2PDxN4bce
	O/hwCLjPNw9KLrtcaBbdBDZPPP7wXG/sPVRa/jHpX6St86KdhWbFnFtUJFR/aD5fqmyR98dkQaB
	3MSh3rzuh9Y0Zz8Rt4j9LGIvi2NKQ3fULgyBvanJR8hkRIoUmwNHMCGXIwcO0
X-Received: by 2002:a05:7300:7493:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b6b3f2266bmr519157eec.6.1768502573600;
        Thu, 15 Jan 2026 10:42:53 -0800 (PST)
X-Received: by 2002:a05:7300:7493:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b6b3f2266bmr519106eec.6.1768502573024;
        Thu, 15 Jan 2026 10:42:53 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5c9sm249302eec.22.2026.01.15.10.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 10:42:52 -0800 (PST)
Message-ID: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:42:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com,
        satya.prabhala@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWgEDAlglnGrzdR4@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX/rhiCRS/FVbL
 qdoLbWJBECcPjrpvjYvh2mofeiE17lRqI+gTNBFRfnBFROp+FQBksr9qkDUUh7Bbgfw3hWccnti
 7LaLodVV8ajHqhgx/gynCQQjsHbdLPuSynjsMHXFOJ8/DenatMFBlSwJ+au0yH+K8DJ2c9T6TSI
 8wmfi8ysZhnawup6lvLPEZpO7+9dpCIpb0oTWE7v3FEuPPuw6o0+AV1JvPrzkiOciQVlDqUYL82
 ZmPY6laNchivksA/4JQHHBgjxmPkCQ9hWfnSN0RwCwnGMeXxpGgkA7RZS9l+7ssxihu7LNiV7cf
 EkdsX07k/sFyi4hZmBatbJnTrIrNWZHYcPXTFHansM+stBVVKiARund9rGhNolOk2m4V9GgefTJ
 i5hRSrgLuL6moHfLkpXcK7xFdmtCpIdKlw7VCiundOJFo9XElk1FMyTFcGBCt/qDq415V/0IJRC
 KRKIaflV1pYEMSWYFbA==
X-Proofpoint-ORIG-GUID: w-LLHi-9JloAxrYzvOEq5dXrqFHeN8EI
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6969352e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=ccGef3cnkq0f9B4bJY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: w-LLHi-9JloAxrYzvOEq5dXrqFHeN8EI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_104256_182725_C393108D 
X-CRM114-Status: GOOD (  36.95  )
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

Hello Sudeep,

Thanks for the feedback.

On 1/14/2026 1:01 PM, Sudeep Holla wrote:
> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Sudeep,
>>
>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>
>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>
>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>> disabling it and using the OS-agnostic SoC information interface provided by
>>> the firmware.
>> Would like to add some history here. Vendor interface existed [1] even
>> before
>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>> which
>> uses the soc0 interface already.
> True, but that's not the main point.

That is one of the point which needs to be considered in my honest opinion.
Vendor driver existed from long time (v3.10 Kernels) in Android
https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
and lot of user space entities in Android depends on soc0 which is not 
just limited
Qualcomm user space, but also, 3rd party ones.

>>> The presence of this interface strongly suggests that the
>>> firmware is designed to support multiple operating systems or software stacks
>>> that already depend on it.
>> That is correct. We started seeing the issue with user space when our
>> firmware
>> started implementing support for SMCCC SOC ID recently for non-Linux based
>> product.
>> As the firmware remain same across OSes, user space is broken on Linux.
> What exactly do you mean by "firmware started implementing support for SMCCC
> SOC ID recently for non-Linux based product" ? Does that really mean that
> you can change the firmware for Linux based products ? I don't think so and
> hence we are in this discussion.
>
> 1. Either it exists in which case deal with it by disabling vendor driver
>     and/or fixing the userspace.
>
> or
>
> 2. It doesn't exist which is not a problem.

Allow me to add some more details, so far, our firmware hasn't been 
supporting
SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware 
started
to support the feature and same firmware is used even on Linux Android 
(android16-6.12)
based product.

I would say, firmware started supporting the feature on our newer 
product instead
of firmware being updated on any older products.

Now, as the user space remain same and is relying on soc0 interface already,
user space is broken as SMCCC SOC ID enabled by default which gets compiled
into Kernel and takes precedence over vendor driver which is a vendor module
in case of Android.

>>> Aligning the Linux kernel with this
>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>> userspace to correctly parse and consume this information.
>> Agree. Updating entire use space would need time and we are looking to see
>> if vendor specific interface can be given priority over the standard
>> interface.
> That statement simply doesn't make sense at all. Your product took all the
> effort to implement standards and then you don't want to use it at all.
> As per your claims it is not even broken(in terms of data from the sysfs
> files), so I don't know what to say here, sorry ?

As mentioned above, the requirement was for a non-Linux based OS which 
impacted
Linux Android baseline.
>>>    Given these
>>> advantages, why would this approach not be the better long-term solution?
>> As mentioned above, existing user space will be broken and fixing existing
>> user space is going to take time. As the feature itself is "optional" from SMCCC
>> specification, if we can't disable by default, we should at-least have a way
>> to disable the feature by other means.
>>
> The data given to the userspace from the kernel is not broken.

Yes, that's well understood.
> The userspace
> tool seem to have made a wrong assumption and can't expect the kernel to
> magically fix the issue here.
>
> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.

Sorry, at risk of repeating the same thing again, the user space was using
soc0 interface on Linux Android products for a long time base on vendor
implementation. While I agree that, user space had some assumptions based
on vendor implementation, if not disabling the SMCCC SOC ID by default, we
should at-least have a way to disable it (via cmdline) based on vendor
requirements.

Best,
Satya



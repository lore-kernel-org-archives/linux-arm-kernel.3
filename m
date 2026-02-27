Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685ACFEFB54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB1hUUJOIzNr85bsuyrnsBL1jpuDOE9kcLxF5cFHKu8=; b=hYAj0CmyR2TUilfhWezT+I6UWX
	czRxmnT/jB1xyUxadYB4wjOdoLbIJQjo0Ul6AJemLiPTPoGckIeBOFLkhE4BrBYHxpoyZS+uK+9Ys
	NTlU3rTO9UWEjA8QSnMO4k9lgyId59OetERh+JPSKlk84rqfSeIGUMZk0+ivRJPlGsZMzGlW0EAmr
	AcTNy+BuFCGHV1ck5zwBpXioBllnThiICpsI3zPC0dSobV9WMC2Y+n4TWzYpTcef+6MLo+OxQjji2
	Yd879+KeWPdJmOSPIvFFYXFInTpJK8nBjQY8MlKhwzL63RfRIeRqZ1yqDPm1Zho1x89LpKr9LpfFE
	NvUBuvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzBa-00000008WFJ-2jrr;
	Fri, 27 Feb 2026 14:51:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzBW-00000008WDv-3XqG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:51:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REaB2x3627654
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 14:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iB1hUUJOIzNr85bsuyrnsBL1jpuDOE9kcLxF5cFHKu8=; b=IQeXUN/A7wu3z09I
	vgKGkItlMJ77R+FaDc6A8KIy/nXofnWiKk3B3s5cjFMaIsBMcZQP1Or22DVJkR30
	9UrobXTF9pjTn5lX/8diBBG5+WZrfV/vzn5Vq5/8t3vVb18GpEG+/x0nOKftkh8d
	9u/LZBGmWOz5+HJ+pXbfCKyJ4vDgmyFvWY6WnXAr9uwSe+HdFkEFsMr26R9Ja6fY
	WGSHKAsQsJsUWQ/vo0U4w/OrmxlXSQ0UgHwPGW4m24+eebEyaSDqMLuwVEUflbej
	cC8CWzkNOZBVjDeMFnBXOp5JPKkkN3J9G9jdHS0R54WBXONyNgwK5Zb9ImYZNB4B
	2hT60g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q19kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 14:51:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso1940521685a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772203876; x=1772808676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB1hUUJOIzNr85bsuyrnsBL1jpuDOE9kcLxF5cFHKu8=;
        b=awgIU+5yqI4THJlYdguDZOfVgfp1OpIyu5QKCc2nNTcUdQssYhGfSOP9+YcAcvLHe3
         hvcmBJUUX46Vj+IAsz0BbVxEnuLD6yKlaxHhc8TDQD3PK+BHOG2qCxn5+J2nx2wPDVNr
         +c/4B23yoN1Y8c6Va5KDvjhfCjoGWN894DzWzHe7fJpdQ2qqZK1V7vidqYkT5eZmOry9
         eauKmfrRjCKaELTs4nLeOrqhkVOcQCH/xg40xhp7o/AOshnGtN4WQ5QtP06C8PysuFr7
         OXoKrfP0JpidYNh1teX7Ofr9dxYis7aBIrg7fOuuA97tjQn4z3ydbOqQ8fZ2CGa9gyfN
         4YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203876; x=1772808676;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB1hUUJOIzNr85bsuyrnsBL1jpuDOE9kcLxF5cFHKu8=;
        b=L5dEvqwaG5KGQqIr+ecga8/Z5+GUPqMIMCe9wxYWUqB4fR/1RlUNq9P41E2Hy8wjeK
         TG+o8uqwg2OZg2LxIj440I6pjOot5gpHwXRRwr3QQb9m+SCYb6DEx3tWDaKEQR8RNmtY
         1WXpaUahfwiogjOQj1X+O41V54BbgFWT9VMxV0+8XV01Fw4Dd2UR6W6YJnGlN7y0svjq
         3gRgccxzaaRGti7k3m60tGSIjC/5NpyJuzQ0glvRzuPvUZs6U3u6SkPylyPyixCxUTij
         fpM6m3VFKwTbaB0o8zpCur2bo28zzaONoEJEoTRL50bOFB0rSMhnibgkpOZ2yqXGoiHJ
         vDjg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfQMY8v+hfliZ+6j4fNT69JG+cGWQRORyJeAB7PC4doFSf3tHctf0Is6Gpmpz5gk6CHgLQ1g0x9LCRmHaDAX4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6JluJyBvolkxMXFcyA3rudUIJ0gEKvhcR8Rj93BkockpW2CBn
	/6pn8OLJrvcp1ZTLTK6vjAkdgSHQQgBeIHQMLtvTAUuC6TD1AKWTr7B/xgtWAR+MdC2KKXmBIvl
	ywk9v2mePY5z26p2bqLV8nPJSI2UfOAyVO+KKleiMuhhagGq3r4eYqh8sERE3LrZLZy/6N7x+Az
	qF5A==
X-Gm-Gg: ATEYQzzeV7AmvKp/dfaWobbm5quFXePnRvLYNK4oS5bhKf/jXbhIxVT7VGtLgn6lMbn
	6te61HD8QuVknNo2gZ/poyObT5IgIq0Js4q1QJ2+lqFgg4WsqqPrjFRoCn3q5Fe+3C3+WsEa+hb
	ti9Jc2gVGH00Lb2wIjj2McdENp1ThT5skU55CYrttDdUuIrXqoYKp/s/+qu4yb3VcsGX81qByqr
	w/IOtpUfHeh7e/+yZNMCLs+dkrzSE+siIVBD7+cWYwRsP96DLZfIJ9QKvAMIck1pVer4EecBuoR
	d54SQlIHuY5jL2l4ZKZlOF9Gd94uLVXYsA1xxIZotbRnCd2ixcFnH8BhuZsyt1x3NTwdvFGPslo
	1oZTB/8HDsBXMRtoSoFIMQY5kbkIHT9Dx5xdCaobWbk8YKTN+UA==
X-Received: by 2002:a05:620a:7115:b0:8ca:305b:7481 with SMTP id af79cd13be357-8cbc8f363a0mr370034985a.61.1772203875952;
        Fri, 27 Feb 2026 06:51:15 -0800 (PST)
X-Received: by 2002:a05:620a:7115:b0:8ca:305b:7481 with SMTP id af79cd13be357-8cbc8f363a0mr370031085a.61.1772203875401;
        Fri, 27 Feb 2026 06:51:15 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae95114sm159166066b.49.2026.02.27.06.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 06:51:14 -0800 (PST)
Message-ID: <18f3f73a-9bc6-4518-b3e4-730fa0793146@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 15:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm_mpam: Force __iomem casts
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <7b5e4218-5961-4874-bbb1-89770cd2c744@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <7b5e4218-5961-4874-bbb1-89770cd2c744@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzMSBTYWx0ZWRfX7BINEACg4kE+
 86ZaMTEtYVdhaZOC0CwH0Si+dsrsySY9xdCRRcDF0mu2vv+WsYrJbhaZ7FctHzttZxMysz1DWAO
 O+GOx9/spieH2EIQlNMDx6hEG9kuwbzKpO1aXcdncRyeFNNbCazHYYy19mvnT41xt4Sl4mHAJj8
 drLuFzM0HH4PkNUtg30qZ4V/I3QorbYbf89FIjbqScTGVh5ydofS0mfdE742IE/1IjMxnrIPQ5X
 MZJMk43O9oti3luS7AeQXPVbwjRJpSTuANO5aLGaGRC+ulQfyN2IbSE8qTbjA8FBTsVncSTDduR
 yuYCV82hkUhv6vJj8JbpdU6Ckea5mB+mzSind5Km9LjgPFnw+58lTCUVtwp524MCwJfWLh19t+M
 C4u5n+rVVfhQO3CkvFOUB5gtA5yLKoSOb1VD/bCb9hiExOa5sRImYDPw9CWDb6+hg9qDnUDh54B
 xAxEDxyd9zCOAcwxAiw==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1af64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=0JN81gmDEfperBWzToAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: oiP7x85OwZI5XbR_0PNy7l3hydUUZrd0
X-Proofpoint-GUID: oiP7x85OwZI5XbR_0PNy7l3hydUUZrd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065119_004322_F8A31CC4 
X-CRM114-Status: GOOD (  26.46  )
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

On 27/02/2026 15:06, Ben Horgan wrote:
> Hi Krzysztof,
> 
> On 2/16/26 11:02, Krzysztof Kozlowski wrote:
>> Code allocates standard kernel memory to pass to the MPAM, which expects
>> __iomem.  The code is safe, because __iomem accessors should work fine
>> on kernel mapped memory, however leads to sparse warnings:
>>
>>   test_mpam_devices.c:327:42: warning: incorrect type in initializer (different address spaces)
>>   test_mpam_devices.c:327:42:    expected char [noderef] __iomem *buf
>>   test_mpam_devices.c:327:42:    got void *
>>   test_mpam_devices.c:342:24: warning: cast removes address space '__iomem' of expression
>>
>> Cast the pointer to memory via __force to silence them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/resctrl/test_mpam_devices.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
>> index 3e8d564a0c64..2de41b47c138 100644
>> --- a/drivers/resctrl/test_mpam_devices.c
>> +++ b/drivers/resctrl/test_mpam_devices.c
>> @@ -324,7 +324,7 @@ static void test_mpam_enable_merge_features(struct kunit *test)
>>  
>>  static void test_mpam_reset_msc_bitmap(struct kunit *test)
>>  {
>> -	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>> +	char __iomem *buf = (__force char __iomem *)kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>>  	struct mpam_msc fake_msc = {};
>>  	u32 *test_result;
>>  
>> @@ -339,7 +339,7 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
>>  	mutex_init(&fake_msc.part_sel_lock);
>>  	mutex_lock(&fake_msc.part_sel_lock);
>>  
>> -	test_result = (u32 *)(buf + MPAMCFG_CPBM);
>> +	test_result = (__force u32 *)(buf + MPAMCFG_CPBM);
>>  
>>  	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
>>  	KUNIT_EXPECT_EQ(test, test_result[0], 0);
> 
> 
> This change looks good to me. As sparse is more broken I needed to use
> the patch from [1] to reproduce this. Copied here for convenience.

The branch from Al Viro was working fine at that time, now merged to master.

> 
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 2b30a0529d48..90536b2bc42e 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -14,8 +14,8 @@ struct vm_area_struct;
>  struct mempolicy;
> 
>  /* Helper macro to avoid gfp flags if they are the default one */
> -#define __default_gfp(a,...) a
> -#define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,)
> GFP_KERNEL)
> +#define __default_gfp(a,b,...) b
> +#define default_gfp(...) __default_gfp(,##__VA_ARGS__,GFP_KERNEL)
> 
>  /* Convert GFP flags to their corresponding migrate type */
>  #define GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)
> 
> There is a kernel test robot report [2] and that asks for these tags:

That I did not know. Anyone can run sparse, as I am doing every now and
then, and find issues.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202512160133.eAzPdJv2-lkp@intel.com/
> 
> Acked-by: Ben Horgan <ben.horgan@arm.com>

Best regards,
Krzysztof


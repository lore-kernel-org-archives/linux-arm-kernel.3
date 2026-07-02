Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 01:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=; b=AFD2HdNrD2X3xGWga3JUPrWrt5
	0MwGJXaJyDLU7g2drYRD8wXtjVuiBqQft+BlgbKrbI3iV7eLIxRmKxqeS6IMN842KqrZJ6pSiVOMo
	pwRUdVQB9ONperhtzZPPahOnX7dw6jdermkB+u3wxH4KjGAwL+6AzG63T2Fz7i33n62XTh0S0KsbF
	2nnkoa+K2nuL0H7ndMFB62jvyWEusGx4n5pe3sB+aqMwWWULOiLYKUW081C5T6NmIdI2R0Je7iG7d
	9SycXPYb9RIKZSKjJpz1Lvkyuzk/DhkTEVcrTl87c5otG0FBMPPHXLM8VSLfNqg6ywcajqYPgU0Eq
	tt4wmE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6f1-00000003Nui-399J;
	Thu, 02 Jul 2026 01:56:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6ez-00000003NuF-0L9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 01:56:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KSAd2957684
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 01:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=; b=U8S8x3i+7rLUqeZ2
	fcYGN7jlpBH43ZIl62Oabjx2cKNzdogm2KVS1A/ejwPaYqnyG77UTQ4b5jY4gUlz
	kU8bfzFOO69nQbo4KZz/V+s9nk66ev+4ShSwP1zGx84gtQt1FQrCk3HCLewBIgnM
	VXe40fPPFnIf/zg64zo6gMaeBqqmxOYw2Fz3Ip68zAh1jmdsuZujStqIPYN2gGeq
	gb7RwdSTDp5Odw9hIYknk1Y0ORgKN52ff+O3mHl0r/hRfFILKXMdZvxJ1WJbO7uH
	lHK//YfP95Y4EMEwo1q8KeMDRRn9Q9RHKJKKuGjK6VR3NXcIR3EBOweMjMI1o/si
	BfFydw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630a11g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:56:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so1290460a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 18:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782957372; x=1783562172; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=;
        b=ZTjmbYFGuSWajif+Nwo7slMl+xOd6Bos4gunWIte+zAH6biD+ZiRrQBkm7D25X4j3T
         AWRvKplrbBWYs4UO0bB/knYhAjhJnF7SR8xii6UkUG4CHoq7xUS3POWtDuzv+yJxJ4IS
         3GJ6QskA6OvbWb4uMaQcpbRZ0wuSboojCvg7VtRHgvO7oM/fvTb/nQ5rSvQGDi/EHdGL
         4AbOD9AH6zz4QUas9dj7zv+1QtboJsP13FOIj12/yvhlf3RUMND2S5ir+v6M0xhPSBSt
         YKEbKuGjvp+3h6cJwPvUvTdAP0rXC5vWg60J3y1swA+Xkofk0VatDzfZYqrh0lI+qUEE
         +a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782957372; x=1783562172;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=;
        b=OQ/udw4PdIRQGIEOHqI3l0tMz8J7uFxHv4DI/GWuFgrweo7/dP8atJUnqAd6If/wyZ
         NWuTlIh/LxMTm8FqVsihoTgD4/OOiW6DGkkm/Cb2xuBP7HtKIh1OLAbL/7EC2epGTIs8
         ElLZiwawS0JesdYEuubbBWx5AeZH5dg259C/dAAx4Lmhls74EydFAKR+ogeVVutTRirZ
         ZILQAbQc1Cex0QKowVMHbU3zwxyAnp8IIzuB9hPItlL8mkFJJEJnX1e+GZe6YJdA0tih
         qIIZx6Ps1SRCyjl9l10otU/YOgAsU2YdGX354r0GI3Da1/H/mvjYzDrnSaf2brI8qzvt
         bhfA==
X-Forwarded-Encrypted: i=1; AHgh+RrFbckYw4pKMoHw4LsQE9NNNbX4xUDAjGobdfhXqzrDeL2ZqOMLM3HTTiPKGtzpEPKWi0qbc49Boc8vUIgcP7ld@lists.infradead.org
X-Gm-Message-State: AOJu0YzmH7Fdg8a5rU0PkvS25BcQdrYsOk8jP5WJQr8fVBgiF0qZr9Gw
	uk6DhFXL08C92zDsEJ5H4P0gaJdMEbHoxDu+cbwGvqyTqG99SHlS7LqIpM7VgGK7RDwHOp+rO9n
	6tLlYsR/9hm96Ga/a3y8gJ7YjNdcKHKamJqkGYe7qAPAdl8u15p4WoNw7rAUq/r2k0mqlIywn0X
	EA8Q==
X-Gm-Gg: AfdE7ck7suP562QGVVwyBKIQPjm5AJiYi6lSKA8zm1jbRYwd8vltxlEJbWnmqlhdn21
	Xv9MChz17O9IjccL1v3zQgM9oPDBG3R9G7Q3ZweJ1t0IS2Qrh1NbN8xyHAj0/S7DkzKMPlJpnaU
	Zcel/Z5axbbrMYvl6SOp0V6dSyZz5FUw6ab2r5oRZ/nyhQBzxpUWO6cEs4tSwDTJHmitssIDHT3
	hPvb/h7vZtorCLrhsrNiUfiJiDqMnVVJycEcc8hECFvywuKBQLMtU9VtEtb3hVaRQ70F/BQJ9Lm
	/Xcvg8JpA2NhbzuHMO7XedFpwpcfQM0HHSsaKNcvbqW7+OJ15oYEQa4eT/RzdNSboIS+t9/Z7xr
	JKGgUctGhnmyDlZ8OPjdL7NhJpDczBzIV3VZJIpnENXOueDyNuRomOMa5U1A366jprobfyKqBF1
	RR
X-Received: by 2002:a05:6a00:982:b0:847:9585:73bc with SMTP id d2e1a72fcca58-847c0673ea7mr3875188b3a.1.1782957371522;
        Wed, 01 Jul 2026 18:56:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:982:b0:847:9585:73bc with SMTP id d2e1a72fcca58-847c0673ea7mr3875162b3a.1.1782957370821;
        Wed, 01 Jul 2026 18:56:10 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm567315b3a.3.2026.07.01.18.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 18:56:10 -0700 (PDT)
Message-ID: <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 09:56:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
 <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a45c53c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P5EO7plK2hrSIlTIuPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAxNyBTYWx0ZWRfXyY1e5/PWkezS
 T2K0h1xVOCB+L596+qi4Rl5JgJ1P3WAfU7mLC5thFpySY1PpiQJzq7W6kdU93pQF/HwfDFeK/aK
 O7DRX6H8MkUXwRUsq+NZCI7fIRz68bs=
X-Proofpoint-ORIG-GUID: YrmAWr2BlGJLQEUEYMtuf6XRVGInTAXO
X-Proofpoint-GUID: YrmAWr2BlGJLQEUEYMtuf6XRVGInTAXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAxNyBTYWx0ZWRfX491ZTZ1r8MtA
 zDjbytSQr8mwRFlDWHZxiZSOEDWdh+WQN3FPd2oKme91N2WJw9+r6ofbjn2Uha2ifIa/YPVlYZN
 iUM0WQUw+oqt0s5RHHeqdhNGmFqVv0WgeRFQAXt65ru32ctmurRMTcF0SwH5K2/U3H0aMVi0RxU
 bZQ5p0pwx2oBnupA/K7Cu6BXaqEDI4TkJ3TBV6g8MFhxwppGVjtyJVbU7yw3BNJ5mmDQOVUI8JN
 XKpk6mfFCzDCUb17vkx3TtCVw7kuKMFLmkz4W5+NySTCZEvVbSj25YI/+VMZqSCdBpN8nfy+05r
 VvzPko9OhQ8RkNtYK2YDsGSWbANldL636vtejLxq2sofNgXcoASK4GahQNRvm1GX72U+LIEvlx6
 GpyMnDkAEgBhW2fGLLHhIS5eo4538TS9bXCnCW6BWlGQBvQUZy1o3Ge85AiWdjw75iD1UKSDUMf
 ggR3oolzmQTppBlL8Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_185613_174407_307448FF 
X-CRM114-Status: GOOD (  28.69  )
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


Hi Leo,

On 7/2/2026 8:59 AM, Jie Gan wrote:
> Hi Leo,
> 
> On 7/2/2026 12:23 AM, Leo Yan wrote:
>> On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:
>>
>>> After probe, pm_runtime_put() allows the device to suspend and the
>>> runtime suspend callback disables the same clocks. During remove the
>>> device is left runtime suspended, so pm_runtime_disable() freezes it
>>> with the clocks already disabled. The devm cleanup that runs afterwards
>>> calls clk_disable_unprepare() a second time, underflowing the clock
>>> enable refcount.
>>
>> Thanks for fixing the issue.
>>
>> The problem is that if the device has already been runtime suspended and
>> its clock has been disabled, afterwards when remove the device, the devm
>> cleanup disables the clock again, resulting in clock count underflow.
>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/ 
>>> drivers/hwtracing/coresight/coresight-funnel.c
>>> index 0abc11f0690c..4c5b94640e6a 100644
>>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>>> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct 
>>> platform_device *pdev)
>>>           return;
>>>       funnel_remove(&pdev->dev);
>>> +    pm_runtime_get_sync(&pdev->dev);
>>>       pm_runtime_disable(&pdev->dev);
>>
>> Let's use the funnel driver for the discussion. Once we agree on the
>> approach, we can apply the same change to the other CoreSight platform
>> drivers.
>>
>> How about the following teardown?
>>
>>   static void funnel_platform_remove(struct platform_device *pdev)
>>   {
>>          struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>> +       int ret;
>>
>>          if (WARN_ON(!drvdata))
>>                  return;
>>
>> +       ret = pm_runtime_get_sync(&pdev->dev);
>> +       if (ret < 0)
>> +               dev_warn(&pdev->dev, "failed to resume before remove: 
>> %d\n", ret);
>> +
>>          funnel_remove(&pdev->dev);
>> +
>>          pm_runtime_disable(&pdev->dev);
>> +       pm_runtime_set_suspended(&pdev->dev);
>> +       pm_runtime_put_noidle(&pdev->dev);
>>   }
> 
> This proposal looks good to me. I forgot to add pm_runtime_put_noidle to 
> drop the useless reference which created by pm_runtime_get_sync.
> 

I dropped the line to check the return value for simplifying.
Here is the final version from my part, can you please help to review again?

  static void funnel_platform_remove(struct platform_device *pdev)
  {
         struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);

         if (WARN_ON(!drvdata))
                 return;

-       funnel_remove(&pdev->dev);
+       /*
+        * Resume the device so its clocks are enabled again, balancing the
+        * clk_disable_unprepare() that devm runs when the driver detaches.
+        * Then mark it suspended and drop the usage count taken here.
+        */
         pm_runtime_get_sync(&pdev->dev);
+       funnel_remove(&pdev->dev);
         pm_runtime_disable(&pdev->dev);
+       pm_runtime_set_suspended(&pdev->dev);
+       pm_runtime_put_noidle(&pdev->dev);
  }

Thanks,
Jie

> Thanks,
> Jie
> 
>>
>> The idea is to first resume the device with pm_runtime_get_sync(), then
>> perform the remove (which is safe if they need to access or clean up
>> hardware state), and finally clean up the runtime PM states. I mainly
>> referred to drivers/iio/adc/stm32-adc.c.
>>
>> Thanks,
>> Leo
> 



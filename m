Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC57DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 02:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlWnFHyggt+QPo001qL3ii9DznQukGteQloItUUkzOI=; b=J/4jlzzzdP2NjDMpbARMogQlML
	RQ8BSVNCA8sDPYrUbL3MZl7C3A74AJF18Wo003YuQS+s0Llp9w8+ZbmcmhvTM9js0K4uko+TcyUCX
	HGCT9i0aeLmoZquEapEAVEpyBGvC3p+xqUDPSHEzeB/QzsCodOAKpM/ne0RwDCILuBCktp2aD5dX+
	YII9PPCHkge8xjxKG4/AeBqy54jQuQEwv8g3GsTriaTXFiLjOiQbAPLU59YDURaJLTMUVWi8kPTm7
	SNteCxh3JbHZL25TQ2fJnwtw9YjAaTfngPAWI3gIYtuK/zLv8fGyS42TH82Uka4eliVg6D/WKXFNL
	7IzBCgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PYV-0000000919j-40x1;
	Wed, 23 Apr 2025 02:09:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PWc-000000090z1-2CFj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 02:07:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAOM014551
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlWnFHyggt+QPo001qL3ii9DznQukGteQloItUUkzOI=; b=J0nQqqSvy4Inu5+A
	vGVAporgg9Ddy+H4mLy6ucsK5r+dTqnxE3P11aOas8IHFg4BacumqJNDoemnTq7D
	Nh29aMwmG05/rniUigEGdWcMEmriPhvvzHW9P6sYy9CU9OffmDdKFAjz8JAcUIRu
	5RmTt3FmGhWSxBKAh9XEywOGECpfoJy2YbhfrjWWibfkow6d/lNySQ0GbU0jYLWh
	o0WO44Ug0MZW6puAA8dL4OWXIW81aXVd9n0IMU5nJyuirOrUzR9lxUaoSnZNGzJY
	+0KHJMVDoCC/masSRSQzyAZ9D/G+hbarFpd41HLqHff24s50lG/iIo4kiemmgfud
	cVxZuw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ghhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:07:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0e0c573531so2560426a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 19:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745374057; x=1745978857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlWnFHyggt+QPo001qL3ii9DznQukGteQloItUUkzOI=;
        b=ufNafQtsHVFrME/pFZnw2MLVRjnqzIuTlTr2ci3oTOneBrf9Ber+jCDI3HScsr5zWz
         ntoM+O1UTsi7PyslwqLGRkodTc8LUxG5GP7Ff3A/21xPe+4m/MyK4eghCCJNnkbTcgYu
         UJ/RlO+hTbDwobp2PuD+0DRZSVr0HmZQRYxeZSTxQlLuc4QzMwZswqcPTIh9DMTXDzfM
         jjrT6F2pEz84QLtjAmYG4gsT/5p28do7fss6BAylLlamcskAWCjwNh7GeoL+W7Q2v/tb
         Juxmp3U0Qid3PZZCWTvQHZ1bzgrZ4m/lIpfxE6ou4eGwxiRuJ1MXrQvuLoS4AWrE6QfO
         jKGA==
X-Forwarded-Encrypted: i=1; AJvYcCVP6uqnPMr8uutKm+1il2YXjq3JJewMgyWkLuto3erpUje/caMGSDC+B18YMZZEuzGQgcLLbBeO1ovu1iOJCzXN@lists.infradead.org
X-Gm-Message-State: AOJu0YwwPbYCx66BIa+2gAT0jzJu4zS8/Xna8HiQT6R9GGkMSMr+RrQV
	ImguKWVdRiqnHYmvp3/qbDK+5XU23nY78QiZBpn43K26rybjLUbNhfJHnjJuD9JHzumBOcLsAeX
	JPwGFUTMmcIHh3mKE+fZZPi8mpsNBMHAZ5UCWI8KVK+nC5KAuX7eYbzAUNLNCCGvsPuvTFV515b
	eB3S0ePw==
X-Gm-Gg: ASbGncvT4KEke1ZG1aVUI9EPLJAPyJ6XcoeL2CnpREGuU7gAqZ4I/2kX0d+NcVsMBG8
	EK52tnxRC/239ZvrypdyIILs8qm3+VVl0Ztv4FgWsoBMnEHKFTqCKT5bibRHfknP23Ob995wCmz
	hILIUyC4JeuWV6TboGlCSdTGoUMsb1twzeMvpjKzfv+XSCqR50Jp+AJFcogK3/PsfHZohdVjoub
	XNhmHuTakru3RdM/k1SgBfpUyhOzKYot+95NQB9o2+90KStvNMYo6oANFSKb33YgnFWE3OkL82R
	7X1GMC6DWR/p3zjqPIUyeOM5S82HRznRPtR4OTXBvMvWjWsbAYtG/tFXuhkZlimgXWoJkRPv
X-Received: by 2002:a17:902:e847:b0:223:35cb:e421 with SMTP id d9443c01a7336-22c5362087bmr272836835ad.49.1745374057199;
        Tue, 22 Apr 2025 19:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjSKzHitU5aLA4r5CloLulzEMNbdHigKl7eVk9IICwgD7fbWUwzh5pf8w1MfIfcVjF45Faw==
X-Received: by 2002:a17:902:e847:b0:223:35cb:e421 with SMTP id d9443c01a7336-22c5362087bmr272836505ad.49.1745374056673;
        Tue, 22 Apr 2025 19:07:36 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda70esm93022785ad.15.2025.04.22.19.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 19:07:35 -0700 (PDT)
Message-ID: <54a505c9-b313-40f3-a69f-5f99835a510d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 10:07:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] coresight: tmc: refactor the tmc-etr mode setting
To: hejunhao <hejunhao3@huawei.com>, suzuki.poulose@arm.com,
        james.clark@arm.com, anshuman.khandual@arm.com, mike.leach@linaro.org,
        leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        jonathan.cameron@huawei.com, yangyicong@huawei.com
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
 <20250418055820.3689408-4-hejunhao3@huawei.com>
 <49992acc-076d-429d-ac07-092d2fffbcb8@oss.qualcomm.com>
 <ce34c289-2ffc-426a-8b9e-6c8cc9e5e7bd@huawei.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ce34c289-2ffc-426a-8b9e-6c8cc9e5e7bd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Gda8CqD5StVsTRBnZdF6hy9rG9wMfe5
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68084b6f cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=BTeA3XvPAAAA:8 a=eMscG2cWfzpx6jt4w84A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=tafbbOV3vt1XuEhzTjGK:22
X-Proofpoint-GUID: 2Gda8CqD5StVsTRBnZdF6hy9rG9wMfe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxMSBTYWx0ZWRfX1jpa51Lro/+w x+ohpZU2JbAcgjvLSwN1dCmHWV1b8nFkofS9245SoEn41AIcex7ktHidM6cpHm1/VeUNfJ+5sdI iYyHOUgdvY5ob3llXbat8cnUWMsnKaE3nQ30MuLQcFGaCSUf0hDxjSlSH9j+DMW3oH6tT/7ZrG/
 6fIyWv4LAw+vaF76UJBfL9eaZmoQLI9jwEeFixmr4QWxZS4uRRUGAZFQW6wGNRcuizfiJd9C+hV LVyzXElv6LbLxCxEgwFLb7jaq7UKvelaQvRUL9q7/wHinS7APOx0fWjcKqKlGrBs12h4TXQphis opLiv1/Zkt0GIQ8TNu8YeU1D9i7s7QwbhbotfUDMslmy/J7aCSejrLqO2Uc8fUbfPJbMGieGrHZ
 sKZeayrAIzlXe8d4QdQoes4j3u0x5jMSFOH4n/MWEL1cyxX3nOdZtNIS29xGQ5kKawRxRPHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_190746_704629_4614DE31 
X-CRM114-Status: GOOD (  32.26  )
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



On 4/22/2025 8:52 PM, hejunhao wrote:
> 
> On 2025/4/18 15:12, Jie Gan wrote:
>>
>>
>> On 4/18/2025 1:58 PM, Junhao He wrote:
>>> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
>>> in tmc_etr_enable_hw() is triggered sometimes:
>>>
>>>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/ 
>>> coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>>>   [..snip..]
>>>   Call trace:
>>>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>>>    coresight_enable_path+0x1c8/0x218 [coresight]
>>>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>>>    enable_source_store+0x58/0xa8 [coresight]
>>>    dev_attr_store+0x20/0x40
>>>    sysfs_kf_write+0x4c/0x68
>>>    kernfs_fop_write_iter+0x120/0x1b8
>>>    vfs_write+0x2c8/0x388
>>>    ksys_write+0x74/0x108
>>>    __arm64_sys_write+0x24/0x38
>>>    el0_svc_common.constprop.0+0x64/0x148
>>>    do_el0_svc+0x24/0x38
>>>    el0_svc+0x3c/0x130
>>>    el0t_64_sync_handler+0xc8/0xd0
>>>    el0t_64_sync+0x1ac/0x1b0
>>>   ---[ end trace 0000000000000000 ]---
>>>
>>> Since the sysfs buffer allocation and the hardware enablement is not
>>> in the same critical region, it's possible to race with the perf
>>>
>>> mode:
>>>    [sysfs mode]                   [perf mode]
>>>    tmc_etr_get_sysfs_buffer()
>>>      spin_lock(&drvdata->spinlock)
>>>      [sysfs buffer allocation]
>>>      spin_unlock(&drvdata->spinlock)
>>> spin_lock(&drvdata->spinlock)
>>>                                   tmc_etr_enable_hw()
>>>                                     drvdata->etr_buf = etr_perf->etr_buf
>>> spin_unlock(&drvdata->spinlock)
>>>   spin_lock(&drvdata->spinlock)
>>>   tmc_etr_enable_hw()
>>>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>>>                                  the perf side
>>>    spin_unlock(&drvdata->spinlock)
>>>
>>> To resolve this, configure the tmc-etr mode before invoking
>>> `enable_perf()` or sysfs interfaces. Prior to mode configuration,
>>> explicitly check if the tmc-etr sink is already enabled in a
>>> different mode to prevent race conditions between mode transitions.
>>> Furthermore, enforce spinlock protection around the critical
>>> sections to serialize concurrent accesses from sysfs and perf
>>> subsystems.
>>
>> Is any issue observed during this race condition?
>>
>> The etr_buf is checked before assign it to sysfs_buf or perf_buf.
>> In my understanding, the warning raised to indicate the etr already 
>> enabled with sysfs mode or perf mode, so terminate current enable 
>> session, right?
>>
>> Thanks,
>> Jie
>>
> 
> The sysfs task is executing the process to enable tmc-etr and has allocated
> a sysfs_buf. However, the sysfs spinlock does not ensure atomicity of the
> entire enable_etr_sink_sysfs() function execution. In this scenario, the 
> perf
> session may preemptively call tmc_etr_enable_hw() to enable tmc-etr.
> 
> Consequently, during race conditions, perf always prioritizes execution, 
> and
> the sysfs_buf remains un-released, leading to memory leaks. Then this 
> triggers
> a WARN_ON(drvdata->etr_buf) warning.

The pre-allocated sysfs_buf is stored in drvdata->sysfs_buf. And I think 
it's fine to remain unreleased until the ETR is enabled with sysfs mode.
The ETR will not setup a new sysfs_buf if drvdata->sysfs_buf already 
exists. But in other words, it definitely consumes some 
memory(especailly allocated a large size of sysfs_buf) for a while or 
forever if we dont enable the ETR with sysfs mode in the future?

I think this is the issue try to address?

Thanks,
Jie

> 
> This patch also addresses the issue described in [1], simplifying the 
> setup and
> checks for "mode".
> 
> [1] Closes: https://lore.kernel.org/linux-arm- 
> kernel/20241202092419.11777-2-yangyicong@huawei.com/
> 
> Best regards,
> Junhao.
> 
>>>
>>> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation 
>>> function for ETR")
>>> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
>>> Closes: https://lore.kernel.org/linux-arm- 
>>> kernel/20241202092419.11777-2-yangyicong@huawei.com/
>>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>>> ---
>>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 77 +++++++++++--------
>>>   1 file changed, 47 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> index a48bb85d0e7f..3d94d64cacaa 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> @@ -1190,11 +1190,6 @@ static struct etr_buf 
>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>           spin_lock_irqsave(&drvdata->spinlock, flags);
>>>       }
>>>   -    if (drvdata->reading || coresight_get_mode(csdev) == 
>>> CS_MODE_PERF) {
>>> -        ret = -EBUSY;
>>> -        goto out;
>>> -    }
>>> -
>>>       /*
>>>        * If we don't have a buffer or it doesn't match the requested 
>>> size,
>>>        * use the buffer allocated above. Otherwise reuse the existing 
>>> buffer.
>>> @@ -1205,7 +1200,6 @@ static struct etr_buf 
>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>           drvdata->sysfs_buf = new_buf;
>>>       }
>>>   -out:
>>>       spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>         /* Free memory outside the spinlock if need be */
>>> @@ -1216,7 +1210,7 @@ static struct etr_buf 
>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>     static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>>   {
>>> -    int ret = 0;
>>> +    int ret;
>>>       unsigned long flags;
>>>       struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>       struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>>> @@ -1226,23 +1220,10 @@ static int tmc_enable_etr_sink_sysfs(struct 
>>> coresight_device *csdev)
>>>         spin_lock_irqsave(&drvdata->spinlock, flags);
>>>   -    /*
>>> -     * In sysFS mode we can have multiple writers per sink. Since this
>>> -     * sink is already enabled no memory is needed and the HW need 
>>> not be
>>> -     * touched, even if the buffer size has changed.
>>> -     */
>>> -    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>> -        csdev->refcnt++;
>>> -        goto out;
>>> -    }
>>> -
>>>       ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
>>> -    if (!ret) {
>>> -        coresight_set_mode(csdev, CS_MODE_SYSFS);
>>> +    if (!ret)
>>>           csdev->refcnt++;
>>> -    }
>>>   -out:
>>>       spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>         if (!ret)
>>> @@ -1652,11 +1633,6 @@ static int tmc_enable_etr_sink_perf(struct 
>>> coresight_device *csdev, void *data)
>>>       struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>>         spin_lock_irqsave(&drvdata->spinlock, flags);
>>> -     /* Don't use this sink if it is already claimed by sysFS */
>>> -    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>> -        rc = -EBUSY;
>>> -        goto unlock_out;
>>> -    }
>>>         if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>>>           rc = -EINVAL;
>>> @@ -1685,7 +1661,6 @@ static int tmc_enable_etr_sink_perf(struct 
>>> coresight_device *csdev, void *data)
>>>       if (!rc) {
>>>           /* Associate with monitored process. */
>>>           drvdata->pid = pid;
>>> -        coresight_set_mode(csdev, CS_MODE_PERF);
>>>           drvdata->perf_buf = etr_perf->etr_buf;
>>>           csdev->refcnt++;
>>>       }
>>> @@ -1698,14 +1673,56 @@ static int tmc_enable_etr_sink_perf(struct 
>>> coresight_device *csdev, void *data)
>>>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>>>                      enum cs_mode mode, void *data)
>>>   {
>>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    enum cs_mode old_mode;
>>> +    int rc;
>>> +
>>> +    scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>>> +        old_mode = coresight_get_mode(csdev);
>>> +        if (old_mode != CS_MODE_DISABLED && old_mode != mode)
>>> +            return -EBUSY;
>>> +
>>> +        if (drvdata->reading)
>>> +            return -EBUSY;
>>> +
>>> +        /*
>>> +         * In sysFS mode we can have multiple writers per sink. 
>>> Since this
>>> +         * sink is already enabled no memory is needed and the HW 
>>> need not be
>>> +         * touched, even if the buffer size has changed.
>>> +         */
>>> +        if (old_mode == CS_MODE_SYSFS) {
>>> +            csdev->refcnt++;
>>> +            return 0;
>>> +        }
>>> +
>>> +        /*
>>> +         * minor note:
>>> +         * When sysfs-task1 get locked, it setup the mode first. Then
>>> +         * sysfs-task2 gets locked，it will directly return success 
>>> even
>>> +         * when the tmc-etr is not enabled at this moment. Ultimately,
>>> +         * sysfs-task1 will still successfully enable tmc-etr.
>>> +         * This is a transient state and does not cause an anomaly.
>>> +         */
>>> +        coresight_set_mode(csdev, mode);
>>> +    }
>>> +
>>>       switch (mode) {
>>>       case CS_MODE_SYSFS:
>>> -        return tmc_enable_etr_sink_sysfs(csdev);
>>> +        rc = tmc_enable_etr_sink_sysfs(csdev);
>>> +        break;
>>>       case CS_MODE_PERF:
>>> -        return tmc_enable_etr_sink_perf(csdev, data);
>>> +        rc = tmc_enable_etr_sink_perf(csdev, data);
>>> +        break;
>>>       default:
>>> -        return -EINVAL;
>>> +        rc = -EINVAL;
>>>       }
>>> +
>>> +    scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>>> +        if (rc && old_mode != mode)
>>> +            coresight_set_mode(csdev, old_mode);
>>> +    }
>>> +
>>> +    return rc;
>>>   }
>>>     static int tmc_disable_etr_sink(struct coresight_device *csdev)
>>
>> .
>>
> 



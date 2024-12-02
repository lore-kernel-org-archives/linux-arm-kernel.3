Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3177D7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFa/x6NqebHX6NhaPtqvNPNC1BHQhGJS+uZXTpQZhTM=; b=EiI68gp2tPRZKFLxrEK1keP511
	UMLoWslG1fSJhlI1cIkm4BKHHrgiTVXEwMUyT1Pb7ntspLgcg3FnTRq/RyLfj0nzI+vOoZ0YS6qzR
	YOhn2nH9n1vXWc3anK1jDCozTuHBYIYW6FFBGqW6iZDpQFA5qEp4oATK3V2DfFTBPptm2ICVWkRRc
	Me+ssfRmb6nq7npz15F5+iK5glKhRUW1t+TUqhgw169NHOe5eRnwiIiSeIHKUDhVKo8MxznDQDKBy
	mToiy99HCGPBq1QtBiUleIqni4XAyeK3ToWwg/znUb7nqCeJZ+UngpqUCnpGdb4VXeNryYGO90VcL
	XfFgqidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4e5-00000005uDN-1Uhy;
	Mon, 02 Dec 2024 11:31:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4SU-00000005rPZ-49c7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so5012009a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733138357; x=1733743157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFa/x6NqebHX6NhaPtqvNPNC1BHQhGJS+uZXTpQZhTM=;
        b=tFYzQKqCtZ1Pxr8Z6gQ0hFRNrCl2Vi46CwnGXhfvnKLJIEPLCXIOGtieYFpU3CKujF
         ymAoQCQ0ekuHegz7U7jBy4ky6X/E9w5Otl/3q1slurcuJrv3Fdy5UXEb8nNJ7ThJQGEE
         dN36nUMggwoXF0hIZpO94Ih3h7di8XEVitdP/cnV1CDWEJ0Um389woNqRsX0yuO9CsBU
         UrxP5+IkyjbHbu0fAXHmqnLcnptlciWen1pGnEFHfYzfIloUU27MPn91nT0yT/B7DGMA
         58Y2gkNekYjLjxhAt2mzo7ps/OUysI7sBn6etSSaUUYIJPZwe9GmULVQQbesiw8rTxx1
         uo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138357; x=1733743157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFa/x6NqebHX6NhaPtqvNPNC1BHQhGJS+uZXTpQZhTM=;
        b=pS5tRJwWxbiseEQhFbF1R+CoYKJpzxokJGq163FG9LgZkFCulTmi51KxVKU0K7gSX/
         4O8N7KdMVnwg0YG44YU8xhSFm92m02cT2Wf4GFsJxnTX36JjXQt+eRgLZJOJd+O2V3z3
         Qei2mixia1Svp30KgiKOaD68ti+jPiwEJV14EJ78TZnTroMpaBQtC27o//iDaLCNY2qt
         pN3tjwnorH84zLzPGRk5/CtN+hj+apV6WTfcZGO5lGN6wV39t2n9RUlD0SjX0+W2MHNp
         x8Etv0YIvtJkFwpVnVCW3yBEk+J6ZBw2xPSdlfOB60oXczpTZSoQcYaEV4uizzZqK3od
         ztTw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZqgWPO7HsEzpSdNjdyRPh85vyxmltBXyNISsGPPKbOHtTwgZ9C+jvtRuJo1S7rlvPcQygynyfsPu7D2NV6Ym@lists.infradead.org
X-Gm-Message-State: AOJu0YyzkPbSHeiNUywp6oxsL2XD1Iet8fbuYcYGbbDMsEbb/zMTCUIE
	S41XXa+DMDnJ/XA0qQiBegYzkfs8t7rvgnc2vqQrBLr19BXFaogJf9LdeYzMyLc=
X-Gm-Gg: ASbGncu1UTfqdp7QaC2K5wFGf/u0srGQWlKjMKpoagMDwnz+sXsePesyukTDqz8eLdO
	4YxOwGGuC0GlpVTZXqrjj78aEPIRUD7GRGoTFG7FJZk1ShQUgSmG4RmukBldQLo9ViKAw+JlAjl
	PHdiQxc8wsGEOUgjvfno7zNTrzFGUnitJmO/CMeoB491Z1tl1TTrCmOvDxoJ8oOQ/spr9VwqiHA
	JkVE99CYA6ohFUKJWKzMJ+LfrmpUYhmTcH5gX3dAO52TNR6t+zC1P2o6rLK
X-Google-Smtp-Source: AGHT+IGzoGPcMCigjC8HL2Vqs142wtWQUzUekPYvt9/T6UGvGp+oWi8DTXFtntMUU65u26iWQRcZuw==
X-Received: by 2002:a05:6402:270b:b0:5d0:e560:487f with SMTP id 4fb4d7f45d1cf-5d0e56049bdmr5767480a12.11.1733138357316;
        Mon, 02 Dec 2024 03:19:17 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996de7fdsm496598766b.54.2024.12.02.03.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 03:19:16 -0800 (PST)
Message-ID: <ca63ed33-f9ab-484a-b846-9e00a8d1d1ca@linaro.org>
Date: Mon, 2 Dec 2024 11:19:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] coresight: tmc-etr: Fix race condition between sysfs
 and perf mode
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Yicong Yang <yangyicong@huawei.com>, mike.leach@linaro.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Cc: jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com
References: <20241202092419.11777-1-yangyicong@huawei.com>
 <20241202092419.11777-4-yangyicong@huawei.com>
 <62f5d1c5-05bd-41b6-8703-baacec3e2619@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <62f5d1c5-05bd-41b6-8703-baacec3e2619@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031919_089820_DFB68485 
X-CRM114-Status: GOOD (  29.45  )
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



On 02/12/2024 9:46 am, Suzuki K Poulose wrote:
> Hi Yicong
> 
> On 02/12/2024 09:24, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
>> in tmc_etr_enable_hw() is triggered sometimes:
>>
>>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/ 
>> coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>>   [..snip..]
>>   Call trace:
>>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>>    coresight_enable_path+0x1c8/0x218 [coresight]
>>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>>    enable_source_store+0x58/0xa8 [coresight]
>>    dev_attr_store+0x20/0x40
>>    sysfs_kf_write+0x4c/0x68
>>    kernfs_fop_write_iter+0x120/0x1b8
>>    vfs_write+0x2c8/0x388
>>    ksys_write+0x74/0x108
>>    __arm64_sys_write+0x24/0x38
>>    el0_svc_common.constprop.0+0x64/0x148
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x3c/0x130
>>    el0t_64_sync_handler+0xc8/0xd0
>>    el0t_64_sync+0x1ac/0x1b0
>>   ---[ end trace 0000000000000000 ]---
>>
>> Since the enablement of sysfs mode is separeted into two critical 
>> regions,
>> one for sysfs buffer allocation and another for hardware enablement, it's
>> possible to race with the perf mode. Fix this by double check whether
>> the perf mode's been used before enabling the hardware in sysfs mode.
> 
> Thanks for the fix. Some minor comments below.
> 
> It needs a Fixes tag.
> 
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 30 +++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index ad83714ca4dc..d382d95da5ff 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1230,6 +1230,36 @@ static int tmc_enable_etr_sink_sysfs(struct 
>> coresight_device *csdev)
>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    /*
>> +     * Since the sysfs buffer allocation and the hardware enablement 
>> is not
>> +     * in the same critical region, it's possible to race with the perf
>> +     * mode:
>> +     *   [sysfs mode]                   [perf mode]
>> +     *   tmc_etr_get_sysfs_buffer()
>> +     *     spin_lock(&drvdata->spinlock)
>> +     *     [sysfs buffer allocation]
>> +     *     spin_unlock(&drvdata->spinlock)
>> +     *                                  spin_lock(&drvdata->spinlock)
>> +     *                                  tmc_etr_enable_hw()
>> +     *                                    drvdata->etr_buf = 
>> etr_perf->etr_buf
>> +     *                                  spin_unlock(&drvdata->spinlock)
>> +     *   spin_lock(&drvdata->spinlock)
>> +     *   tmc_etr_enable_hw()
>> +     *     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf 
>> initialized at
>> +     *                                  the perf side
>> +     *   spin_unlock(&drvdata->spinlock)
>> +     *
>> +     * So check here before continue.
>> +     */
>> +    if (coresight_get_mode(csdev) == CS_MODE_PERF) {
>> +        drvdata->sysfs_buf = NULL;
>> +        spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +        /* Free allocated memory out side of the spinlock */
>> +        tmc_etr_free_sysfs_buf(sysfs_buf);
>> +        return -EBUSY;
>> +    }
> 
> With this in place, I think we should remove the check for CS_MODE_PERF 
> in get_etr_sysfs_buf() to avoid confusion (which I believe opened up 
> this race)
> 
> Suzuki
> 

Is it not simpler to set the mode to SYSFS before allocating the buffer 
in the first place? Then we don't need to free if it races and can't get 
into the intermediate state where it's a half initialized sysfs mode. 
The lock doesn't need to be held the whole time, just when setting the mode.

Or maybe to make it more consistent with etm4_enable() use 
coresight_take_mode() outside of the lock.

And then also clean up the perf mode check in get_etr_sysfs_buf().

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c 
b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..29c07832127b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1219,13 +1219,17 @@ static int tmc_enable_etr_sink_sysfs(struct 
coresight_device *csdev)
         int ret = 0;
         unsigned long flags;
         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-       struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
+       struct etr_buf *sysfs_buf;

+       spin_lock_irqsave(&drvdata->spinlock, flags);
+
+       if (coresight_get_mode(csdev) == CS_MODE_PERF)
+               return -EBUSY;
+
+       sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
         if (IS_ERR(sysfs_buf))
                 return PTR_ERR(sysfs_buf);

-       spin_lock_irqsave(&drvdata->spinlock, flags);
-
         /*
          * In sysFS mode we can have multiple writers per sink.  Since this
          * sink is already enabled no memory is needed and the HW need 
not be




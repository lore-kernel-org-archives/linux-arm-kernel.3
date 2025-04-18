Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA2BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4GPwa3rOttTjk9BhltNeomN5VRSP0W6yj5JFw3g3/w=; b=0H5p7MdPvohW7HPUqqv1u/hrr6
	Sl8C0P2hXOVXuLG3Y5ryz5K4DiymmPXAkM0tQYbsXvsHwRv9tZ2oN4aEAlnQC7VXnWStetog+t+xO
	zQ+maKCCvW1J4baoZ8N/szdhyuUi0B2C3uOSRIaXWJigvFrnwdbRDb8RI27Elo66Lic55QoXUL/WP
	nI4fW7Fa2RVC1GkFIlRRYLQZWRhDuHxUIpcsqmU0Ga1eXW+a8+OQ2zufA4LsRUi8hlH22aEIDqDgw
	RDkKop0ex1kedG11yURuqeIjCN6/ECXwDLMZgRm3KaYYeUO3jfdKhl3Ogm0xQzFzNgQp0y+FMNIWJ
	ZlJBZ8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gGI-0000000FUTG-2zEl;
	Fri, 18 Apr 2025 07:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fts-0000000FRD0-2kHS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:12:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2I1Qw013186
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4GPwa3rOttTjk9BhltNeomN5VRSP0W6yj5JFw3g3/w=; b=ifdn8eeg1HQnWbe+
	mitXYyUEkdIuSXtSuZl/qlf26yYNAMrJVzUk1LmkCTAK3G87160vT8zdJJ68bxgS
	fTfEOQ1aW13v1Ge8nwhWcJcxAsuwgNvntR6Bz5ppSQfIxcwL6ZQTuhkTwOWY2dqb
	3Qh/njb9HVwgobuy/ZLYKw3Xqi5SSuQvfAfxsEpTpy/143xM9/2I0V3jUkgqaZ+A
	/3mtmkxXv+7lyuGal4UZMOMsXFtSgSXx93Y1MwB8lO0ssXeCts61iFnvW90Tq3p4
	p8vFxJP3AC0gkCE1fgMTlMfp0+x4+tfseIqekSEXpQXqwdiSj643O2gq9a2ru5fb
	JNEtZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjs5mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:12:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so26279485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960353; x=1745565153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4GPwa3rOttTjk9BhltNeomN5VRSP0W6yj5JFw3g3/w=;
        b=eGHGwUDoOg+LWeTUuqSXHyyfyuaE0Eu63p55subCX+EvSQTsmpZzRDA8+s+J9hgiLB
         87xYhdVUqZYGCOl2SiSznPiQ1TCRibJq+M4RBkbOFV6AGJWP+bh1YPu0cXxOxxlfH9XI
         7zTcqtp7ex+rkuit7RYrejy4W5NYczSwQi3Bvt9IsBhdxc93tgFKoYQjaZE//Qovk8/N
         /SmJveRs5ruawQSD8+DsDAs9t8ZXv+djifZULARgB7YEQoUav+hJrS1yEyNk+pFO8lwN
         uD4fOHJQ/NPHqm4UqeMqz2M0Z/wDVIrkqlBCd5HvjRxE04Cs9TSk1lxohrxd801KtHCY
         H/hg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4JLQ/cCdCoEY9ghVQiYKjYFKq6ZFKrXspYUdNr+kU7DTIP/bzo6uvCV9r0fxb9ZQ+SQ7q4qnYRZjwynFig0p@lists.infradead.org
X-Gm-Message-State: AOJu0YyUdPpOq4r8WFSJTYuN7Rfw4aqcUawToOjHi39WbC1K8tcsuI5d
	zJD+d7xv3d6rUq+SpooNTeWX3Ej8j2EdCESyzR+17QrK6yXBSppC61jLIuPgzeBbGj4ah1d0G9v
	zcRtT7WA9vEv9nYNSenMjvrdzDTjk6MUc/5zJhDUm3EMxbMz+RjHeOFwboPnZwx2OKIyKWoR+Ap
	X+bSsHBQ==
X-Gm-Gg: ASbGncvXxiAaT4pywRpVUymAqHEab15+7GomZSk2GmClWeW8xunDirQH2A5uvEpIh+m
	3vlKUoYWs/AGsV8Rhi8uFUWMIDYYj1S2HHFm04koIbnn7aOaYuv4rfc8cIL9pDNLYCUsgBZXZW4
	DT0jI6uux9R7oGQexIjJzZDZgruOYYQ+04cVkX7Qj+zBhwfb/Cu3qTc0X79wwhW5XcuFuaNpvIb
	3b7qyyR7SBN2tv9zbEwub8gLuZnFOTtPhIlyyizrBoUpfk9XnVFJC+FGutCwr0TnHshp68eX/pJ
	5aVcrNneTW6AEkmWzBqyeQJL4bV4MCRsJA5WwM6mwxbBdGisTB03AAmkT3ppS4uA2C7KwSaF
X-Received: by 2002:a17:902:d4cd:b0:224:910:23f0 with SMTP id d9443c01a7336-22c53642323mr24544065ad.49.1744960353059;
        Fri, 18 Apr 2025 00:12:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK3BDrDi2+yGoZkhPK1RtGGnjlU2PeSWcXGdwchHAFw25hNGVJt7YK9kn7mNxItQvr5s+TCA==
X-Received: by 2002:a17:902:d4cd:b0:224:910:23f0 with SMTP id d9443c01a7336-22c53642323mr24543745ad.49.1744960352534;
        Fri, 18 Apr 2025 00:12:32 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3ebcsm11150885ad.83.2025.04.18.00.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:12:31 -0700 (PDT)
Message-ID: <49992acc-076d-429d-ac07-092d2fffbcb8@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 15:12:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] coresight: tmc: refactor the tmc-etr mode setting
To: Junhao He <hejunhao3@huawei.com>, suzuki.poulose@arm.com,
        james.clark@arm.com, anshuman.khandual@arm.com, mike.leach@linaro.org,
        leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        jonathan.cameron@huawei.com, yangyicong@huawei.com
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
 <20250418055820.3689408-4-hejunhao3@huawei.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250418055820.3689408-4-hejunhao3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b0UX-kdbjTNQEx4IvRZcAg6GYvd4EKiY
X-Proofpoint-ORIG-GUID: b0UX-kdbjTNQEx4IvRZcAg6GYvd4EKiY
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6801fb62 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=BTeA3XvPAAAA:8 a=AXOI0KVg4ztHe0c8KJwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=tafbbOV3vt1XuEhzTjGK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_001236_833371_7214FED2 
X-CRM114-Status: GOOD (  34.03  )
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



On 4/18/2025 1:58 PM, Junhao He wrote:
> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
> in tmc_etr_enable_hw() is triggered sometimes:
> 
>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>   [..snip..]
>   Call trace:
>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>    coresight_enable_path+0x1c8/0x218 [coresight]
>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>    enable_source_store+0x58/0xa8 [coresight]
>    dev_attr_store+0x20/0x40
>    sysfs_kf_write+0x4c/0x68
>    kernfs_fop_write_iter+0x120/0x1b8
>    vfs_write+0x2c8/0x388
>    ksys_write+0x74/0x108
>    __arm64_sys_write+0x24/0x38
>    el0_svc_common.constprop.0+0x64/0x148
>    do_el0_svc+0x24/0x38
>    el0_svc+0x3c/0x130
>    el0t_64_sync_handler+0xc8/0xd0
>    el0t_64_sync+0x1ac/0x1b0
>   ---[ end trace 0000000000000000 ]---
> 
> Since the sysfs buffer allocation and the hardware enablement is not
> in the same critical region, it's possible to race with the perf
> 
> mode:
>    [sysfs mode]                   [perf mode]
>    tmc_etr_get_sysfs_buffer()
>      spin_lock(&drvdata->spinlock)
>      [sysfs buffer allocation]
>      spin_unlock(&drvdata->spinlock)
>                                   spin_lock(&drvdata->spinlock)
>                                   tmc_etr_enable_hw()
>                                     drvdata->etr_buf = etr_perf->etr_buf
>                                   spin_unlock(&drvdata->spinlock)
>   spin_lock(&drvdata->spinlock)
>   tmc_etr_enable_hw()
>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>                                  the perf side
>    spin_unlock(&drvdata->spinlock)
> 
> To resolve this, configure the tmc-etr mode before invoking
> `enable_perf()` or sysfs interfaces. Prior to mode configuration,
> explicitly check if the tmc-etr sink is already enabled in a
> different mode to prevent race conditions between mode transitions.
> Furthermore, enforce spinlock protection around the critical
> sections to serialize concurrent accesses from sysfs and perf
> subsystems.

Is any issue observed during this race condition?

The etr_buf is checked before assign it to sysfs_buf or perf_buf.
In my understanding, the warning raised to indicate the etr already 
enabled with sysfs mode or perf mode, so terminate current enable 
session, right?

Thanks,
Jie

> 
> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 77 +++++++++++--------
>   1 file changed, 47 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f..3d94d64cacaa 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1190,11 +1190,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		spin_lock_irqsave(&drvdata->spinlock, flags);
>   	}
>   
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> -		ret = -EBUSY;
> -		goto out;
> -	}
> -
>   	/*
>   	 * If we don't have a buffer or it doesn't match the requested size,
>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> @@ -1205,7 +1200,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		drvdata->sysfs_buf = new_buf;
>   	}
>   
> -out:
>   	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	/* Free memory outside the spinlock if need be */
> @@ -1216,7 +1210,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   
>   static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   {
> -	int ret = 0;
> +	int ret;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
> @@ -1226,23 +1220,10 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
>   
> -	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> -	 */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		csdev->refcnt++;
> -		goto out;
> -	}
> -
>   	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> +	if (!ret)
>   		csdev->refcnt++;
> -	}
>   
> -out:
>   	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	if (!ret)
> @@ -1652,11 +1633,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
>   
>   	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>   		rc = -EINVAL;
> @@ -1685,7 +1661,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	if (!rc) {
>   		/* Associate with monitored process. */
>   		drvdata->pid = pid;
> -		coresight_set_mode(csdev, CS_MODE_PERF);
>   		drvdata->perf_buf = etr_perf->etr_buf;
>   		csdev->refcnt++;
>   	}
> @@ -1698,14 +1673,56 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>   			       enum cs_mode mode, void *data)
>   {
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	enum cs_mode old_mode;
> +	int rc;
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +		old_mode = coresight_get_mode(csdev);
> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
> +			return -EBUSY;
> +
> +		if (drvdata->reading)
> +			return -EBUSY;
> +
> +		/*
> +		 * In sysFS mode we can have multiple writers per sink. Since this
> +		 * sink is already enabled no memory is needed and the HW need not be
> +		 * touched, even if the buffer size has changed.
> +		 */
> +		if (old_mode == CS_MODE_SYSFS) {
> +			csdev->refcnt++;
> +			return 0;
> +		}
> +
> +		/*
> +		 * minor note:
> +		 * When sysfs-task1 get locked, it setup the mode first. Then
> +		 * sysfs-task2 gets locked，it will directly return success even
> +		 * when the tmc-etr is not enabled at this moment. Ultimately,
> +		 * sysfs-task1 will still successfully enable tmc-etr.
> +		 * This is a transient state and does not cause an anomaly.
> +		 */
> +		coresight_set_mode(csdev, mode);
> +	}
> +
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		rc = tmc_enable_etr_sink_sysfs(csdev);
> +		break;
>   	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		rc = tmc_enable_etr_sink_perf(csdev, data);
> +		break;
>   	default:
> -		return -EINVAL;
> +		rc = -EINVAL;
>   	}
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +		if (rc && old_mode != mode)
> +			coresight_set_mode(csdev, old_mode);
> +	}
> +
> +	return rc;
>   }
>   
>   static int tmc_disable_etr_sink(struct coresight_device *csdev)



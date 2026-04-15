Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C911F41996
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwBet7bCW1wD+xetcr91fdOTEjQ1zx9HiPSuxCPkglw=; b=Qc1pU8eEbxAIrlYeaXEOGyli1w
	m5ZVprg5tVhCKf2nySYWAUcOp04T/g/tD/qz5SSkGISjSa3HQ2ouaa/pfr5vO+WgiHEPehabN+yjY
	wpYEY9B4IiAzaEfScZSfrOMsedXCUZvhH6dcHy/kczkaaiVTht7c2TuAYV7XRnKEzwbBy+lPybuG4
	gkdC6anY+QegEDPJLlv/1NTGMLU0Q0Km9I6CjIABLL7U8wtozI8v3jlIuBwA+8fxlPi927J7Ch/31
	y0WCbuWyJrK5Aa1o8aaww+IMVFKBX0Jc357Er8FHk9QUE4s7iHfnQd9ft0vSLF0nHWfiXIiaLD+Ic
	w3Er0y+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyzg-000000015w3-22xO;
	Wed, 15 Apr 2026 12:05:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyze-000000015vE-0dSH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:05:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9ICjV1566849
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MwBet7bCW1wD+xetcr91fdOTEjQ1zx9HiPSuxCPkglw=; b=jPz3LLVthE6+CGE/
	gy7uP4dKxMIqzoJ7+O8aofe0Ze2FgwRvwfKGr9WWT3VLxRmTVt9p3byh/i0F/ptf
	MI/ZzD6Cqw6d9Ko+kMAIJEttWUrs+gxzPiOBSA34Pd+6zBLlCSIJBZ7+guo+D8xi
	Mhk4+PxH62HNZi73yG/2rGiRVS9lYFg1cqS9TeQiRqcvqiVro73pN0NAZeCGr1dL
	CNwDYsER9B708PCZjtbLGztR+EZBP41bfvhpYC9f5SJKkB0Ij4C9uHs/jDj602NM
	Y27GXqmjyKnutAY5M9yzLBW+bghAeNIknBKvKJucm1YWW1gI81kWRGN9bJ2KOjCE
	WRKgLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv0j8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:05:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24e9b4d82so55588265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776254715; x=1776859515; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwBet7bCW1wD+xetcr91fdOTEjQ1zx9HiPSuxCPkglw=;
        b=WU8T2Jql8UrdN8OHQuVxQy+exVpKvQi5MgejEOCBQyUhRHfE7h8E1OgfGJcZbI9CzK
         4voiOYkPVAlayLay7aiJlJv1Wzl/ZQVXz+jJOZgs2o9iBz1TAMapGfF4rMbyXOxNMu+x
         /5qmZlWU4/RmC5XrIQvKCDiEKD1Wzo+vf/oAVR9T/bOIQpEMkBKOIF04P4dmjnxZCgNe
         xrL4seywTwwxFX5ge2hDNL2BHONZfBxmdvg8Rf/oamGmnZPXcK5Csg7Ol6sSqrNSZN3U
         85/MEy8ZpRNgDthHuKTgrACjl0nRkDbKeKalnRBUl2CmCnSqvpqWkG47LBrGxTb1Clkc
         jDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254715; x=1776859515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwBet7bCW1wD+xetcr91fdOTEjQ1zx9HiPSuxCPkglw=;
        b=RwJvF1dU6Kby1CBmj/YQ3/t5yyMJXExyz7PjvxsIaadRpykv+qamXUgmxJ0HqoUcOu
         vCmAJYJZY1EQPn9skfcDSbihkXUg4+i2qJX/ycCPYoReftXAJq/kBL4mi0vws8XqsigF
         HT80ztqOfxQPSwCYY1Yu0xyjFeqlVEFifrD/5W9LA58Ql18usxFOl2pr2Uju2s2AKekx
         ZU6Ui3NVdmP+lQWSJJhGyFAuwE/KpKw/N+lyDQcC4PnDOiBXAtS5E1ScIRfYuL/6WJ7v
         L44PEhIJ5WQo3PxfPbPKAikZquWaZ+kuv3N36sx8YBN0y2FOXDSks+JrKcmVSO6g0r9d
         EIbw==
X-Forwarded-Encrypted: i=1; AFNElJ/+7suSbiak1rLuRQk6DI9XOLpIvn0jyRFxk43onM+1ca27rF9MdnPNQT/roOH00lssgYRKqCVvMtQH7Fc2CQP3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr2hLnCNOGrUYOdI6d6QUQTUvOnf8L6mNG7orLZGdIFmH8MzV3
	zlic6KId1FvDwl7L0dLB6w+EPxYQ1Z0AOoBw45+KHLTOtGDo2c/DIsrhcCvl5fUDw6SIRPokjKU
	Ib+6lSop78dO2oEFcK1CacMtewO+Zqzb6YEtEDgH/ejFV/+HHuT7xggG7RHs4weUgHlb596bcEJ
	0o4TUG3gnBfIpj
X-Gm-Gg: AeBDieuxSmKpWUA5wz9WYQSTMQPabnJYqc4eDvGgWyL9BLsvsw34VBbbtrRslNSnpLt
	Nz2ATCEhDD59frhKmHvwQ3YLJbV8eFdmpzkgGS5oBQhTJ6oiFBtgw4I9apKyXXSZu7I/58rTy+D
	9xV2mZGl17Of+r0AjQzJtjkhfY1cAa0NuwbOhZ2kmPogF0gHBn3jXQinRVRAX3CLgwQ4UfualFu
	zlEH2WfIc1/qXMZiN9ReOG07SEydjB7oirlL8Lpy/Zsa/SnaBHZh8gHJt7v+XY1tVrTo5Lrgrh2
	SkIRRHUOJqXu5KHq39jnXWg8gPl64SxJd2Aj7nFySjyIb1BBvQoctP7RptrL1Ca8GoZ6MpRJS3b
	KikmgsdcLuMpWszsO05ziv6q4C/3x1Xcscz1wWym1Cd7Hi8pXmh4DTA+MfWFntDxLbkpSmYPL3m
	aWyOKNCuwnxQ==
X-Received: by 2002:a17:903:2acb:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b4612213ecmr86207255ad.21.1776254714391;
        Wed, 15 Apr 2026 05:05:14 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b4612213ecmr86206855ad.21.1776254713476;
        Wed, 15 Apr 2026 05:05:13 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780ef673sm22165245ad.17.2026.04.15.05.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:05:12 -0700 (PDT)
Message-ID: <c8db21cb-f02c-4628-8f38-f85fe5abdaf1@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 20:05:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] coresight: etm3x: change drvdata->spinlock type to
 raw_spin_lock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-7-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-7-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YtxYO9gv7uWQ-hL6FJC9MrPGuxwIlB2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMiBTYWx0ZWRfXw3gAKSvjRaPm
 ALo4ShWRhQ66t8uDL/rWkC+j3hToG1KX1QtSkYA33Cg0OvWx/ps6UnWbDfViimdOquIJEo0Tv1h
 oJjjoUnnmIptEiLF/ZqWYQdMpsnXlu4Zy0r2Hsv1TTGEgiBvWixYyKvPRaxYqGVUshh+IUiIGPQ
 AFTyyct86nX0E36eJ2ua2Wq5YyW30+IUHeuPZNuqBJUtJmwel//CObSO4bjtRoLONZQeEr1R43b
 CRGqTdMN1UpGSYN4Mh1FVJ7ijDe5tgwYUq95rBDUGwlDYFg7Q8w6yuPo9FUcq5ceFNGG8rGLnZy
 y2/OfROdzsqofz27leOtEXLkeiD+DD6SYAYSIPXcRpirp4UjMzD0wUJfjB5humjscxmBo21boXF
 h0XyG3fgVopVQAMb4S9sewotOJXu17HfO7kI6NQlyMSr22ggXG+Nvzd3oG9PJyMYQoxo850nH2z
 6qPSdQdkaZfOTT6Gi4Q==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df7efc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=_2Kl_f2i-WPWCSh5FmAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YtxYO9gv7uWQ-hL6FJC9MrPGuxwIlB2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_050518_345351_E63A8C13 
X-CRM114-Status: GOOD (  24.00  )
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



On 4/13/2026 10:19 PM, Yeoreum Yun wrote:
> etm_starting_cpu()/etm_dying_cpu() are called in not sleepable context.
> This poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> 
> To address this, change etm3's drvdata->spinlock type to raw_spin_lock_t.
> This will be good to align with etm4x.
> 

LGTM

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm.h   |   2 +-
>   .../coresight/coresight-etm3x-core.c          |  18 +--
>   .../coresight/coresight-etm3x-sysfs.c         | 130 +++++++++---------
>   3 files changed, 75 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index 1d753cca2943..40f20daded4f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -232,7 +232,7 @@ struct etm_drvdata {
>   	struct csdev_access		csa;
>   	struct clk			*atclk;
>   	struct coresight_device		*csdev;
> -	spinlock_t			spinlock;
> +	raw_spinlock_t			spinlock;
>   	int				cpu;
>   	int				port_size;
>   	u8				arch;
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a547a6d2e0bd..4a702b515733 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -511,7 +511,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
>   	struct etm_enable_arg arg = { };
>   	int ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   
>   	drvdata->traceid = path->trace_id;
>   
> @@ -534,7 +534,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
>   	if (ret)
>   		etm_release_trace_id(drvdata);
>   
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	if (!ret)
>   		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> @@ -634,7 +634,7 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
>   	 * DYING hotplug callback is serviced by the ETM driver.
>   	 */
>   	cpus_read_lock();
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   
>   	/*
>   	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
> @@ -643,7 +643,7 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
>   	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
>   				 drvdata, 1);
>   
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   	cpus_read_unlock();
>   
>   	/*
> @@ -709,7 +709,7 @@ static int etm_starting_cpu(unsigned int cpu)
>   	if (!etmdrvdata[cpu])
>   		return 0;
>   
> -	spin_lock(&etmdrvdata[cpu]->spinlock);
> +	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
>   	if (!etmdrvdata[cpu]->os_unlock) {
>   		etm_os_unlock(etmdrvdata[cpu]);
>   		etmdrvdata[cpu]->os_unlock = true;
> @@ -717,7 +717,7 @@ static int etm_starting_cpu(unsigned int cpu)
>   
>   	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
>   		etm_enable_hw(etmdrvdata[cpu]);
> -	spin_unlock(&etmdrvdata[cpu]->spinlock);
> +	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>   	return 0;
>   }
>   
> @@ -726,10 +726,10 @@ static int etm_dying_cpu(unsigned int cpu)
>   	if (!etmdrvdata[cpu])
>   		return 0;
>   
> -	spin_lock(&etmdrvdata[cpu]->spinlock);
> +	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
>   	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
>   		etm_disable_hw(etmdrvdata[cpu]);
> -	spin_unlock(&etmdrvdata[cpu]->spinlock);
> +	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>   	return 0;
>   }
>   
> @@ -856,7 +856,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
>   
> -	spin_lock_init(&drvdata->spinlock);
> +	raw_spin_lock_init(&drvdata->spinlock);
>   
>   	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
>   	if (IS_ERR(drvdata->atclk))
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..42b12c33516b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -49,13 +49,13 @@ static ssize_t etmsr_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
>   	pm_runtime_get_sync(dev->parent);
> -	spin_lock_irqsave(&drvdata->spinlock, flags);
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	CS_UNLOCK(drvdata->csa.base);
>   
>   	val = etm_readl(drvdata, ETMSR);
>   
>   	CS_LOCK(drvdata->csa.base);
> -	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   	pm_runtime_put(dev->parent);
>   
>   	return sprintf(buf, "%#lx\n", val);
> @@ -76,7 +76,7 @@ static ssize_t reset_store(struct device *dev,
>   		return ret;
>   
>   	if (val) {
> -		spin_lock(&drvdata->spinlock);
> +		raw_spin_lock(&drvdata->spinlock);
>   		memset(config, 0, sizeof(struct etm_config));
>   		config->mode = ETM_MODE_EXCLUDE;
>   		config->trigger_event = ETM_DEFAULT_EVENT_VAL;
> @@ -86,7 +86,7 @@ static ssize_t reset_store(struct device *dev,
>   
>   		etm_set_default(config);
>   		etm_release_trace_id(drvdata);
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   	}
>   
>   	return size;
> @@ -117,7 +117,7 @@ static ssize_t mode_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->mode = val & ETM_MODE_ALL;
>   
>   	if (config->mode & ETM_MODE_EXCLUDE)
> @@ -168,12 +168,12 @@ static ssize_t mode_store(struct device *dev,
>   	if (config->mode & (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER))
>   		etm_config_trace_mode(config);
>   
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   
>   err_unlock:
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   	return ret;
>   }
>   static DEVICE_ATTR_RW(mode);
> @@ -299,9 +299,9 @@ static ssize_t addr_idx_store(struct device *dev,
>   	 * Use spinlock to ensure index doesn't change while it gets
>   	 * dereferenced multiple times within a spinlock block elsewhere.
>   	 */
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->addr_idx = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -315,16 +315,16 @@ static ssize_t addr_single_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EINVAL;
>   	}
>   
>   	val = config->addr_val[idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -343,17 +343,17 @@ static ssize_t addr_single_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EINVAL;
>   	}
>   
>   	config->addr_val[idx] = val;
>   	config->addr_type[idx] = ETM_ADDR_TYPE_SINGLE;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -367,23 +367,23 @@ static ssize_t addr_range_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (idx % 2 != 0) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   	if (!((config->addr_type[idx] == ETM_ADDR_TYPE_NONE &&
>   	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_NONE) ||
>   	      (config->addr_type[idx] == ETM_ADDR_TYPE_RANGE &&
>   	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_RANGE))) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
>   	val1 = config->addr_val[idx];
>   	val2 = config->addr_val[idx + 1];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx %#lx\n", val1, val2);
>   }
> @@ -403,17 +403,17 @@ static ssize_t addr_range_store(struct device *dev,
>   	if (val1 > val2)
>   		return -EINVAL;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (idx % 2 != 0) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   	if (!((config->addr_type[idx] == ETM_ADDR_TYPE_NONE &&
>   	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_NONE) ||
>   	      (config->addr_type[idx] == ETM_ADDR_TYPE_RANGE &&
>   	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_RANGE))) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
> @@ -422,7 +422,7 @@ static ssize_t addr_range_store(struct device *dev,
>   	config->addr_val[idx + 1] = val2;
>   	config->addr_type[idx + 1] = ETM_ADDR_TYPE_RANGE;
>   	config->enable_ctrl1 |= (1 << (idx/2));
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -436,16 +436,16 @@ static ssize_t addr_start_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_START)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
>   	val = config->addr_val[idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -464,11 +464,11 @@ static ssize_t addr_start_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_START)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
> @@ -476,7 +476,7 @@ static ssize_t addr_start_store(struct device *dev,
>   	config->addr_type[idx] = ETM_ADDR_TYPE_START;
>   	config->startstop_ctrl |= (1 << idx);
>   	config->enable_ctrl1 |= ETMTECR1_START_STOP;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -490,16 +490,16 @@ static ssize_t addr_stop_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_STOP)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
>   	val = config->addr_val[idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -518,11 +518,11 @@ static ssize_t addr_stop_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->addr_idx;
>   	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
>   	      config->addr_type[idx] == ETM_ADDR_TYPE_STOP)) {
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return -EPERM;
>   	}
>   
> @@ -530,7 +530,7 @@ static ssize_t addr_stop_store(struct device *dev,
>   	config->addr_type[idx] = ETM_ADDR_TYPE_STOP;
>   	config->startstop_ctrl |= (1 << (idx + 16));
>   	config->enable_ctrl1 |= ETMTECR1_START_STOP;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -543,9 +543,9 @@ static ssize_t addr_acctype_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	val = config->addr_acctype[config->addr_idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -563,9 +563,9 @@ static ssize_t addr_acctype_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->addr_acctype[config->addr_idx] = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -601,9 +601,9 @@ static ssize_t cntr_idx_store(struct device *dev,
>   	 * Use spinlock to ensure index doesn't change while it gets
>   	 * dereferenced multiple times within a spinlock block elsewhere.
>   	 */
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->cntr_idx = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -616,9 +616,9 @@ static ssize_t cntr_rld_val_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	val = config->cntr_rld_val[config->cntr_idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -636,9 +636,9 @@ static ssize_t cntr_rld_val_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->cntr_rld_val[config->cntr_idx] = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -651,9 +651,9 @@ static ssize_t cntr_event_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	val = config->cntr_event[config->cntr_idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -671,9 +671,9 @@ static ssize_t cntr_event_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->cntr_event[config->cntr_idx] = val & ETM_EVENT_MASK;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -686,9 +686,9 @@ static ssize_t cntr_rld_event_show(struct device *dev,
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	val = config->cntr_rld_event[config->cntr_idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -706,9 +706,9 @@ static ssize_t cntr_rld_event_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->cntr_rld_event[config->cntr_idx] = val & ETM_EVENT_MASK;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -723,11 +723,11 @@ static ssize_t cntr_val_show(struct device *dev,
>   	struct etm_config *config = &drvdata->config;
>   
>   	if (!coresight_get_mode(drvdata->csdev)) {
> -		spin_lock(&drvdata->spinlock);
> +		raw_spin_lock(&drvdata->spinlock);
>   		for (i = 0; i < drvdata->nr_cntr; i++)
>   			ret += sprintf(buf, "counter %d: %x\n",
>   				       i, config->cntr_val[i]);
> -		spin_unlock(&drvdata->spinlock);
> +		raw_spin_unlock(&drvdata->spinlock);
>   		return ret;
>   	}
>   
> @@ -752,9 +752,9 @@ static ssize_t cntr_val_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->cntr_val[config->cntr_idx] = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -947,13 +947,13 @@ static ssize_t seq_curr_state_show(struct device *dev,
>   	}
>   
>   	pm_runtime_get_sync(dev->parent);
> -	spin_lock_irqsave(&drvdata->spinlock, flags);
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   
>   	CS_UNLOCK(drvdata->csa.base);
>   	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
>   	CS_LOCK(drvdata->csa.base);
>   
> -	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   	pm_runtime_put(dev->parent);
>   out:
>   	return sprintf(buf, "%#lx\n", val);
> @@ -1012,9 +1012,9 @@ static ssize_t ctxid_idx_store(struct device *dev,
>   	 * Use spinlock to ensure index doesn't change while it gets
>   	 * dereferenced multiple times within a spinlock block elsewhere.
>   	 */
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->ctxid_idx = val;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }
> @@ -1034,9 +1034,9 @@ static ssize_t ctxid_pid_show(struct device *dev,
>   	if (task_active_pid_ns(current) != &init_pid_ns)
>   		return -EINVAL;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	val = config->ctxid_pid[config->ctxid_idx];
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return sprintf(buf, "%#lx\n", val);
>   }
> @@ -1066,9 +1066,9 @@ static ssize_t ctxid_pid_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&drvdata->spinlock);
> +	raw_spin_lock(&drvdata->spinlock);
>   	config->ctxid_pid[config->ctxid_idx] = pid;
> -	spin_unlock(&drvdata->spinlock);
> +	raw_spin_unlock(&drvdata->spinlock);
>   
>   	return size;
>   }



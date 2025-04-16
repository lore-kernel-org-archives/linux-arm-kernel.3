Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj/rTloHnxQSrvDgVjeBoV7XS1AGsT5Fe0oxAW/yXzs=; b=KABwVxVC2NT65aU/xoKyj7+eIe
	dD76nKlsG2WHtGfrzoTUW+Gg8UnZtZMqGfFXgBBS6cJ1vX2tU9+f5Yn/1fIKJ8DkSQxPDCeWpOb91
	9+nM1VV0EfDHHoQq59XYlLtqw37JETnF1OqH8cCysghY+M5PhzL8HL9DkT7JtbTLpnK0tfrQDFnqq
	LwFqK+nicKdhqFFR9lHLdJ4xkHCzpqMLDrcAl32rTo6+e5M1z7uoefJdPhOrM4XLmMRelVyWCMT+4
	Kll236/ILjdMC3rGhippumYs5sVU0RuTcpi+l+GnZ289Dk7ByGzgX1lObRcJufcnaSM6CKxDwK0/P
	E7Clj4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rBI-00000007k9J-0tuR;
	Wed, 16 Apr 2025 01:03:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r9N-00000007jbl-2Bbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FCVV6C010175
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nj/rTloHnxQSrvDgVjeBoV7XS1AGsT5Fe0oxAW/yXzs=; b=Eq5sJEg84oZ+NF70
	6++dM/sTv9aCJlugsei/i6nHXv7CiZL+ZQl5ngAVFwmazDxPBdt/sn/R+Hqelf8l
	u9TT+kq3wg0izYn6iFmSnBeAlwCYcpVsjH1uxLaYW+wXTdzNfTu8B1bGnDnGCyJS
	1iFo6e7EAV7Qwtqu+Evuv8Ypjk+bDbYBKgHIV0jN4LC/PxM1Qa23EI53x95s6G3k
	80pRipiAWcW2rLq1WgSLmSM/Ng0I3olq+PpwlNkWCTg9JvAInRKP8bPz3m8QU04E
	MA7stB/QNRGktJZR/n7aMLNE4CGlUHcYqGkMRJnB8wWK/GJOh1Um7fPZJx1XKXLE
	ct5hYA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69su7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:01:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso7076297b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765269; x=1745370069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj/rTloHnxQSrvDgVjeBoV7XS1AGsT5Fe0oxAW/yXzs=;
        b=atGYGXygcKPHdVJJ/iddKFINHnJXZ2aI29pt1SBjxpyn68n1EVb3KOwWrdXM26YUvs
         2DBx0xAapDEhgQUH3Y41sW9FneZaOjK48KG2pVFWgWRMrYMWiJhixVNLgjfVw49CCHzm
         dTtKz4fEamV2F9RobjtI6scs0RGxQklGlvHgHireOQyqDKCiwIqKySMq4aqPHi8EHGpe
         ZPZmN219H0pANQUwHv6PTg8qQMCwkXikZw6j+GyLk7FZBMHomohDRFQzn0AXq489jUo3
         LVMLa8BcfUnezrURb2hBzxxPXvzdLQsoqTX3tCLS8HsDb6xiEvksCJrz0b1lE3KBlHd3
         V5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYRkgDkd4P6AZhXQAorzMEpNIyotLS5nOM9hxkT/Qx2RO9rM10ewjss9fzitJZyOaCDO0uFWMEfZjmsnXPQZR@lists.infradead.org
X-Gm-Message-State: AOJu0YyhlVd32auAup8c5FTsqFLkAjfcuYhuaq0MA85j2zjcvvIyGirt
	+q/tkHi6q/i230lgSEVt+EN/Ndb14/yFyidz790SMAHD2Q99rpu/4tW1V5ZgdUqBrC2gENV63aA
	rKZv/O+HjA/K/61ByUeP4HQ6pf/ry8rNNByxJ1gU3yETSdeOWjipadkQdOEnM4ui9hLW0A3TVhg
	==
X-Gm-Gg: ASbGnctTbp+aL7sfmY2veim8iqWTQXF+zsCxvn6yOeu6o9iQldUAzVWXxNcfOKpQiX3
	PKsstMMzpK4+lDc4uzotOX29WysqSYd6nJq97xu05XfKgVonWeG70ru9897tyhbTErz32g+0I9Y
	zti2mFSDDaMmw+tWt2wkIJqeSVFalr+Eg/CPdPGH6Gybpka8oKKtVV2dSZGtmkureAFrCrt1v5I
	XznVSnDRL//OShLM1LjI68ylT0Zb0riMVO/4PEIssaj6vX+oWYyY5H6pYm0SuwN20bINA/AIYl/
	Q2mYhju6HL6rEdEIO3HH4XzfgWtIYBc2km7xY5sv5sKQxxR0yLmbgIhjTGVe5uXiOlChQLiW
X-Received: by 2002:a05:6a20:7343:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-203ae069c09mr1649036637.32.1744765269559;
        Tue, 15 Apr 2025 18:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk09CwkXT7w7wlLQOSiJeGUhYgI24m8nRcTkG97Bnl/2JmuGeHu4jiXxXu7muiyS3UtQjv0Q==
X-Received: by 2002:a05:6a20:7343:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-203ae069c09mr1648999637.32.1744765269185;
        Tue, 15 Apr 2025 18:01:09 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219d98bsm9494017b3a.11.2025.04.15.18.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:01:08 -0700 (PDT)
Message-ID: <3f5cc8ff-9770-44f0-ad46-046488fbb328@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:01:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-2-yabinc@google.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250415184649.356683-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8V4uUfZduxky1vTMRF5zA3rxXcPOpbvO
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67ff0157 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=hItIS0sIXTpyHXqPC_IA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8V4uUfZduxky1vTMRF5zA3rxXcPOpbvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180113_707904_7531026C 
X-CRM114-Status: GOOD (  29.76  )
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



On 4/16/2025 2:46 AM, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>

Hi Yabin,

You missed the reviewed-by tag. James gave his tag in V3.

As well as another patchset.

Thanks,
Jie

> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..3909b562b077 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>   	return rc;
>   }
>   
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
>   	return rc;
>   }
>   
> @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	dev->platform_data = pdata;
>   
>   	drvdata->base = base;
> +	raw_spin_lock_init(&drvdata->spinlock);
>   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>   	catu_desc.pdata = pdata;
>   	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;
> +	raw_spinlock_t spinlock;
>   };
>   
>   #define CATU_REG32(name, offset)					\



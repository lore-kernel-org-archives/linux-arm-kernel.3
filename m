Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEA5F433C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 04:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1Z4zrndv/0iQBsD4yH07AAxm7EVA3gZOU+lMyyMdH4=; b=n4dipRfY0+yy0x102HU2Z7IJPS
	cUfBmWPpLStDv1P4oQSyIuRS8AlMHwXBsHTYikuq+lK7hWuVSNctthm8XFOiZLwgpJBBepwSgbAhs
	ZVv1zETeAAxsk9smv6s7pfFeGYgiTOhQtQJAZm6oazGBidRCdFPGb852vYcC+wsBfHzIskogWe8ep
	FLSZAfxB1ce8kJGTOhfwSajP+0yaPafv2UgPKFSCsbcTlpc0thcGthtCN5r8mXDztDoG0zvragv5B
	iCpJvOKp+pZd2kRhgrcreVoZ0VCcG3RITMKK4iD3KUIf6a5te8Pl3cdoWuAMG11uPK+fqMEozkvzn
	SAwNiH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDESP-00000001xee-12xW;
	Thu, 16 Apr 2026 04:36:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDESN-00000001xeH-1E7b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 04:36:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0PWT82972580
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1Z4zrndv/0iQBsD4yH07AAxm7EVA3gZOU+lMyyMdH4=; b=Wx4JxlJ5z1SGVk8j
	qWs7e4CtOAz1y7kf8TF0kvQAxPo8xDdetr/DMgMsHBi0QXrC7JfhdYSGQ4KGnukl
	o567uQuhSAQrUephy7rh/vv1m56SF/LO3pNg8VA6etJyo2+dIAtIht8pLFBeV5v0
	hTqjjrsz0Q9ktdkjit3ELXbxIYW66jZil9luro+mHlk3C2VNsx8SAaPJvn4hvloA
	JF8Y+fB9ujZAHUfIpdGiSsilCKAllUKxux2ftVLTfwlz2ONTjQ4WFsWH1+WnZHTS
	nh/lOr4LL2ZYBSYhsW05tEKVlhcB7mZHlyOEe5QrS0T0I0v8sR/LGWt5AxkANQNw
	rQt+7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74gbp54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:35:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso7666840a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776314155; x=1776918955; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1Z4zrndv/0iQBsD4yH07AAxm7EVA3gZOU+lMyyMdH4=;
        b=ChhZ+8gdfjeDIzT6qZW+c4mdGkWGjErgYxjAm+qAMDr/cwARUtq8cffoW3usewR/MG
         fB/obgwg+poj4k3NV6zQiSV1Jf8d/uXi2nRVWKGbPWj5FVIIjCBKLW6MIOWY6+bjr4Cl
         NWcHm0QZoGDhNyBvKUeXkYhDM6envFWDHmtxQDWilVi2BLnwcLPSQZSrXaWa2QuPprPr
         SSq5OLAkOHOiNQtV4qu705RcbE4TriFTaGX944v3MYNi0zchCh/h8iA0Ik0GQCCLhbmy
         sL350fKBR92vCnXye6aNM0culIOInhu60mpnFAHQ7p812CMaLySLJHyn4NWbueOpzfKe
         n26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776314155; x=1776918955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1Z4zrndv/0iQBsD4yH07AAxm7EVA3gZOU+lMyyMdH4=;
        b=m1+GPjTNFqUxuN6H+X9agwSbOfVCtahgKMb/njaThx9uxtaXgcVLToAbc68erGTEzQ
         QdT0HTkJTu8Ru1IHTXHN7v1QQPv5rJtmQzRZFeyYDQvMA1kpzylyhVG6NbFCkTZdQ6kX
         tMSIWUGoF49znUGU8EYVOTjCQs4aKKCj4fuSP7zfq8s7eWwxgnaAwxQ9wkVmAvp4Wnib
         WpYmMDs3oEcvUFzdYkz45G7Qz7wp6h6G6mvbS9Xm+J5/N0tZCJ+0KWySUWeYth+wjngL
         7ohlL5mrX+EyJcG65yhBZNDioeMja3/pV37X3dzMlTbyqqm/1ZDo5Y71pv3kHQVI5EJK
         uD7w==
X-Forwarded-Encrypted: i=1; AFNElJ8i7W9TVLYX5LeISheWk+O8o+HD/eXAM49Y95uN7hIQzXQGP+6kCgfnll7+8ssE9j0Vod9yc3NDdbXAZN/A2Thf@lists.infradead.org
X-Gm-Message-State: AOJu0YydWMhHNqjvN6apQY5UrC7nku6e3FIjPkQm5v4j/oQmwYPa2bU7
	1j+ttHjGYikmLZvXbbVSIJwNCJXri+0Fz/xovC1OzGdpJIbQDJCt7rJTEnvqzZCH5prAWfhuLsK
	x/1HB/3YFMKf8sZTM0hCjwEuu9mjd8/xmZqopFppnK7OPUX+C9Zu/EIAHR+cuuOx+98mbsQhHB/
	e+SQ==
X-Gm-Gg: AeBDievR5h14mQLetTbVL9vJSpu8668JBZEfSl3EYD7WXBIa7SLNeP0LvjtA7e+4wNF
	Jaf9bB2VLNzX1jVRx+2fEm/TjX+Q2SF3iWcaz1ZbP4mYuYCN8HOnCLshyCMrbqwjyi+NqJX/9g0
	FSXEdnuGf/pWITDGeZKqBwQua4+h7t3E8kztxpegFZqlcd7xQ5Lmr69HdTwhBUko91PFXgKLWT4
	HBv6srrot2IIFlNT+In+UmIhsHsG4mcuUhX0V9nD8MC+czt82UcruR2TSAg7wd1eReXrocKhMVY
	goTxWnq10mwsmI/rG1WO449rltaZUiZaWKh7PR9hBePvDB4FrfZh3NKhIA2toFyhfButbbR0gtn
	S9fcoqtqy4jEC/LDRScsu+LHda4CEmpBLN2EdWKgC7zFeCiaDltrrueC+C/UOPeftt6nvV6vsHk
	pKCvvALnKpNsc=
X-Received: by 2002:a17:902:ce0f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b2d5a2a1a4mr273077775ad.29.1776314154549;
        Wed, 15 Apr 2026 21:35:54 -0700 (PDT)
X-Received: by 2002:a17:902:ce0f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b2d5a2a1a4mr273077525ad.29.1776314154009;
        Wed, 15 Apr 2026 21:35:54 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782ace42sm48196185ad.68.2026.04.15.21.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 21:35:53 -0700 (PDT)
Message-ID: <b9528488-b0c7-410b-b91b-b05c21fd0c08@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:35:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with sysfs
 configuration
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-8-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260415165528.3369607-8-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA0MSBTYWx0ZWRfXz4Cn8btVB+sN
 JKy45xJrEaAubglZ+HemIMvlIVoXuiP/rsoEzg5JRBiLnSlnPlBLC/IE4N8HLeEi1xG90NMg477
 vz43u8BBQR2TwRQnkOgScOhaPgtT1s/fIk1EENvuvJhZ9P3bND5pYatNjZOg1Y3dwoZCQUObUyq
 mK48LAn7hQAwvAREOe8cEu1yjRHjwo0fiFNT5lDZQk+EsxQZLKtsf+G4GajYZWqNMqsnnEdBvr7
 QOaPHCZ4xItDDVE907GapMCwGUimxTuQlRcX2vE/ZQY3LhUzr00bD97T732SotMVbHK8xWEWRjW
 Jc4osCTrJdJJhhkC5m5lxJvWqD+/lfV26nWsr1giLQfN0P99+3JRktc2Mim+mAOG5MFxVxc7WIU
 dj9VMGkUVJfoJpFPjpDxBWGnwIQMQG4mmv+GIRu77l5Bpi1ab74h8TRMW/8dnAdtQswBtl0XOKc
 k1VtevIJxhaM+rQ4hvg==
X-Proofpoint-ORIG-GUID: POfgv6vw2F7GB1MA2XIEVJwGGm4GAdfv
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69e0672b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=rqivyBB3Y2tn8cSkOZkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: POfgv6vw2F7GB1MA2XIEVJwGGm4GAdfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_213559_482534_E2952894 
X-CRM114-Status: GOOD (  28.17  )
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



On 4/16/2026 12:55 AM, Yeoreum Yun wrote:
> The current ETM4x configuration via sysfs can lead to
> several inconsistencies:
> 
>    - If the configuration is modified via sysfs while a perf session is
>      active, the running configuration may differ before a sched-out and
>      after a subsequent sched-in.
> 
>    - If a perf session and a sysfs session enable tracing concurrently,
>      the configuration from configfs may become corrupted.
> 
>    - There is a risk of corrupting drvdata->config if a perf session enables
>      tracing while cscfg_csdev_disable_active_config() is being handled in
>      etm4_disable_sysfs().
> 
> To resolve these issues, separate the configuration into:
> 
>    - active_config: the configuration applied to the current session
>    - config: the configuration set via sysfs
> 
> Additionally:
> 
>    - Apply the configuration from configfs after taking the appropriate mode.
> 
>    - Since active_config and related fields are accessed only by the local CPU
>      in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
>      remove the lock/unlock from the sysfs enable/disable path and
>      startup/dying_cpu except when to access config fields.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

<...>

> @@ -618,23 +624,45 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   static void etm4_enable_sysfs_smp_call(void *info)
>   {
>   	struct etm4_enable_arg *arg = info;
> +	struct etmv4_drvdata *drvdata;
>   	struct coresight_device *csdev;
>   
>   	if (WARN_ON(!arg))
>   		return;
>   
> -	csdev = arg->drvdata->csdev;
> +	drvdata = arg->drvdata;
> +	csdev = drvdata->csdev;
>   	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
>   		/* Someone is already using the tracer */
>   		arg->rc = -EBUSY;
>   		return;
>   	}
>   
> -	arg->rc = etm4_enable_hw(arg->drvdata);
> +	drvdata->active_config = arg->config;
>   
> -	/* The tracer didn't start */
> +	if (arg->cfg_hash) {
> +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> +							   arg->cfg_hash,
> +							   arg->preset);
> +		if (arg->rc)
> +			goto err;
> +	}
> +
> +	drvdata->trcid = arg->trace_id;
> +
> +	/* Tracer will never be paused in sysfs mode */
> +	drvdata->paused = false;
> +
> +	arg->rc = etm4_enable_hw(drvdata);
>   	if (arg->rc)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);

needs disable the active config in error path:
cscfg_csdev_disable_active_config(drvdata->csdev);

Thanks,
Jie

> +		goto err;
> +
> +	drvdata->sticky_enable = true;
> +
> +	return;
> +err:
> +	/* The tracer didn't start */
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
>   /*
> @@ -672,7 +700,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>   	int ctridx;
>   	int rselector;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/* No point in trying if we don't have at least one counter */
>   	if (!caps->nr_cntr)
> @@ -756,7 +784,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct perf_event_attr max_timestamp = {
>   		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>   	};
> @@ -918,40 +946,29 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>   
>   	/* enable any config activated by configfs */
>   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> -	if (cfg_hash) {
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret) {
> -			etm4_release_trace_id(drvdata);
> -			return ret;
> -		}
> -	}
> -
> -	raw_spin_lock(&drvdata->spinlock);
> -
> -	drvdata->trcid = path->trace_id;
> -
> -	/* Tracer will never be paused in sysfs mode */
> -	drvdata->paused = false;
>   
>   	/*
>   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>   	 * ensures that register writes occur when cpu is powered.
>   	 */
>   	arg.drvdata = drvdata;
> +	arg.cfg_hash = cfg_hash;
> +	arg.preset = preset;
> +	arg.trace_id = path->trace_id;
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +	arg.config = drvdata->config;
> +	raw_spin_unlock(&drvdata->spinlock);
> +
>   	ret = smp_call_function_single(drvdata->cpu,
>   				       etm4_enable_sysfs_smp_call, &arg, 1);
>   	if (!ret)
>   		ret = arg.rc;
>   	if (!ret)
> -		drvdata->sticky_enable = true;
> -
> -	if (ret)
> +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> +	else
>   		etm4_release_trace_id(drvdata);
>   
> -	raw_spin_unlock(&drvdata->spinlock);
> -
> -	if (!ret)
> -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>   	return ret;
>   }
>   
> @@ -1038,7 +1055,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
>   	int i;
> @@ -1074,6 +1091,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
>   
>   	etm4_disable_hw(drvdata);
>   
> +	cscfg_csdev_disable_active_config(drvdata->csdev);
> +
>   	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
>   }
>   
> @@ -1124,7 +1143,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	 * DYING hotplug callback is serviced by the ETM driver.
>   	 */
>   	cpus_read_lock();
> -	raw_spin_lock(&drvdata->spinlock);
>   
>   	/*
>   	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
> @@ -1133,10 +1151,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
>   				 drvdata, 1);
>   
> -	raw_spin_unlock(&drvdata->spinlock);
> -
> -	cscfg_csdev_disable_active_config(csdev);
> -
>   	cpus_read_unlock();
>   
>   	/*
> @@ -1379,6 +1393,7 @@ static void etm4_init_arch_data(void *info)
>   	struct etm4_init_arg *init_arg = info;
>   	struct etmv4_drvdata *drvdata;
>   	struct etmv4_caps *caps;
> +	struct etmv4_config *config;
>   	struct csdev_access *csa;
>   	struct device *dev = init_arg->dev;
>   	int i;
> @@ -1386,6 +1401,7 @@ static void etm4_init_arch_data(void *info)
>   	drvdata = dev_get_drvdata(init_arg->dev);
>   	caps = &drvdata->caps;
>   	csa = init_arg->csa;
> +	config = &drvdata->active_config;
>   
>   	/*
>   	 * If we are unable to detect the access mechanism,
> @@ -1446,7 +1462,7 @@ static void etm4_init_arch_data(void *info)
>   
>   	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
>   	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> -	drvdata->config.s_ex_level = caps->s_ex_level;
> +	config->s_ex_level = caps->s_ex_level;
>   	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
>   	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
>   	/*
> @@ -1692,7 +1708,7 @@ static void etm4_set_default(struct etmv4_config *config)
>   static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
>   {
>   	int nr_comparator, index = 0;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/*
>   	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
> @@ -1733,7 +1749,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
>   {
>   	int i, comparator, ret = 0;
>   	u64 address;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct etm_filters *filters = event->hw.addr_filters;
>   
>   	if (!filters)
> @@ -1851,13 +1867,11 @@ static int etm4_starting_cpu(unsigned int cpu)
>   	if (!etmdrvdata[cpu])
>   		return 0;
>   
> -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
>   	if (!etmdrvdata[cpu]->os_unlock)
>   		etm4_os_unlock(etmdrvdata[cpu]);
>   
>   	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
>   		etm4_enable_hw(etmdrvdata[cpu]);
> -	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>   	return 0;
>   }
>   
> @@ -1866,10 +1880,8 @@ static int etm4_dying_cpu(unsigned int cpu)
>   	if (!etmdrvdata[cpu])
>   		return 0;
>   
> -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
>   	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
>   		etm4_disable_hw(etmdrvdata[cpu]);
> -	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>   	return 0;
>   }
>   
> @@ -2255,7 +2267,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>   	if (!desc.name)
>   		return -ENOMEM;
>   
> -	etm4_set_default(&drvdata->config);
> +	etm4_set_default(&drvdata->active_config);
> +	drvdata->config = drvdata->active_config;
>   
>   	pdata = coresight_get_platform_data(dev);
>   	if (IS_ERR(pdata))
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index cbd8890d166a..9b50aaa368cf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1069,6 +1069,7 @@ struct etmv4_save_state {
>    *		allows tracing at all ELs. We don't want to compute this
>    *		at runtime, due to the additional setting of TRFCR_CX when
>    *		in EL2. Otherwise, 0.
> + * @active_config:	structure holding current applied configuration parameters.
>    * @config:	structure holding configuration parameters.
>    * @save_state:	State to be preserved across power loss
>    * @paused:	Indicates if the trace unit is paused.
> @@ -1089,6 +1090,7 @@ struct etmv4_drvdata {
>   	bool				os_unlock : 1;
>   	bool				paused : 1;
>   	u64				trfcr;
> +	struct etmv4_config		active_config;
>   	struct etmv4_config		config;
>   	struct etmv4_save_state		*save_state;
>   	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBFFA0C22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 04:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DZx9OY8lmpYKIAqzgqUoG+97imZ8CZhlT8ahlh/X/4=; b=1GJ7thF7m0yEB8O9H6diIRVYFh
	sSBdg+nlJTjgf9DUkvci7Qv+1GOpf+NH0v/QDwhX15awFoivUI0mckE6Ju0HWfPnSKIBAMz6uCmbw
	YZKavYddyzpQK5g3R8qFxOo9otl918I8wMg2dLH8/mIAAXobBOt7VqiQ2H6ehoycGfiq0hdQuutaf
	3gzUq0OCPqpiiY/ZU6/99otSxbBMLTo9GmG/mPAQOk55qoUbYapuQ/z5nm2ptL6/84afboKq6x3cz
	gi4ualffExNhxVGwOOWZSDD1Pn8u0T6X/3mMU5xgGBnHCyPDJvJUEGaKibBLR54XGUkLQPAQOdmo4
	isjlxXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCroW-00000000Z1f-2I3T;
	Wed, 15 Apr 2026 04:25:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCroT-00000000Z1K-2a7v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 04:25:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2hxxU1779160
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 04:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DZx9OY8lmpYKIAqzgqUoG+97imZ8CZhlT8ahlh/X/4=; b=bhm4DD6MYGcbqjuO
	Nr+Nik4l7FIrkZMvpSjFsxPYFwj3xmnmexBuYrUGg7e7ujfE8ZjLC8feSz7nYnH4
	jwHUAz40SWKQ0ztnFge5PAGKn1T+0PlXHHJWuddU51j3pB9FU3kO5h5W004Vubog
	udfXWgbs08f+ry//cpJu5tWXtDE4MAsBv3/p4hz7z2Q0BwpFWHZgrcF9X9gsjl2t
	QrtxDFEi/3iTSNqwZUJnHE/MpkLvBbzkPdgN0Ay4GM72oqYQoAwO1erR8fWDpzjZ
	TPs8wE9OOdHg9vpkBC7u8xd4u9l9hY04k9pY4VIhbqFvcyY/kICn6s40fHDZubCd
	F83rTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw01ygh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 04:25:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b250d3699aso128946215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 21:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776227114; x=1776831914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DZx9OY8lmpYKIAqzgqUoG+97imZ8CZhlT8ahlh/X/4=;
        b=EBD0sxizLkzG6K19MonMI8Jv7ewIsS8GP3/lvYk2XvvXX8Gs5JtdXnvZjLFmVTlI5N
         A0o9n9TAlz8v2BMiyTaZPXbNgdzL1BmVvfb4fMVpqB0602ZGv1ty3cniSag0Fxvc7cd6
         Ok7b6Ow9val2uaPd8Q3l0zeOQmeF3AS/8iB6SpHle+YB+hQOvvh3At090R+Y968SO+HF
         gqNQ8mADjXehdGcLfaaTFkfh1TqxtxYjQzNM3KAW+WuqurKKoImsfRzKTC5PXdWaB/Kx
         0z8KcFJuQBa+z6ktNIJSVz8IiAa8114wEE46ydF1tTquQzLpMyFs5emKp36k9HNN/M6I
         dv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776227114; x=1776831914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DZx9OY8lmpYKIAqzgqUoG+97imZ8CZhlT8ahlh/X/4=;
        b=tSbFiKYf8mSDufFx3MOqm6YrmPW3dKVD/Jby2X75lG657BBR79jksGh7w7ILxwz0V1
         j1mjT0JzTGWYFZPOI6rjmotGl4ypSQD13mUqjX7YwuO4RF4QI/0tdBdkCcwwdKt8w++6
         t/aE2MwIan4u/EnDKiBKza1+szwj0mxD3tci3vIWwMF9R+XhhpGY024KHyQBFkcB/B0V
         0t5BG8GeMpMYk1hu9heFGHKJ0UYxznF+1m/n943NTkLYgiOWT3fEcDJbYfBDJLxSllU7
         HNerTqhXKEFFNj/syDnizTmSMUgDNejl8I6ov4E8dgHc20qHPF5LHMmLfBMhW2fUEJKH
         K1gA==
X-Forwarded-Encrypted: i=1; AFNElJ/HTRS+3ZrwRMxXJWDFbx7yLV8oWrSR7TadbnnF0k3m1Xc1V8BOR0SoV7Kkzg7z12Ea/1KQEVYwTOvoDf5dJJVp@lists.infradead.org
X-Gm-Message-State: AOJu0YzYVXQqMzeeBbab7ZZBnzxYSX0loyn1khlKtnzY507FJkQVc+X2
	35z2RR8vlqaF1ZQqkZ1GvDZQoTCWJZnN2SurbyVh0KLLPeYUxI7v25mJiCPXQs+KJLOEQnNSC5r
	HeIeiLPPRhaYLnIwvXPFxM0BI9pcwSzAZ+AmWlKFHCJdphqNGTYTN2YJ4OGH5Zbwq/oZyP5G0hn
	V3EA==
X-Gm-Gg: AeBDiev9g+t4VRxWJZCLM3N2XcUxSdMq2AlEN8RMZsKDRJ6gZcc9ypl9VzfAPAcyb8y
	0tG9NzRzAsOk0HX71rpNQyiFIt/h6D9hdXCUzNBkuqXKYTeBG60C9oGHcMH2mQwVHff4wTOpk85
	dQ9IIGCnRRJgCLGSR6zjL1O38ijEqOljmGQjW/BLJ//4/Zh/VJ7Qg/OjIu0g2fsKTyXmucFb8VP
	ol+/7k74tZX46s5ymN3rKoiBq0XaNHNhQoogM3aWg/q8TNZTXfPMPcErRKk+ayzSE3JLteoP19y
	AslXTP7uhhrxNJul5Up+KIcRq4XVltwfvoi4Lup+y/3hrihebqLqCtmmWGZvzHwJNLYvQCxg9Xc
	X7/TaKz7KvwKojPcly5922UmuvwczqLHyFvArQJUk5xQX8rx9G40bUnKRltMrkDk+ZSAvQH9pgO
	8NGN+kNka2kO4=
X-Received: by 2002:a17:902:b213:b0:2b2:5503:1b8d with SMTP id d9443c01a7336-2b2d5938b1fmr155164445ad.6.1776227114314;
        Tue, 14 Apr 2026 21:25:14 -0700 (PDT)
X-Received: by 2002:a17:902:b213:b0:2b2:5503:1b8d with SMTP id d9443c01a7336-2b2d5938b1fmr155164205ad.6.1776227113686;
        Tue, 14 Apr 2026 21:25:13 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782a93c7sm5440315ad.62.2026.04.14.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 21:25:12 -0700 (PDT)
Message-ID: <d1b42ecb-3275-4399-8537-b6a4844002cf@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 12:25:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] coresight: etm4x: fix inconsistencies with sysfs
 configuration
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-5-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-5-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ar7GRNWYtWemRmOMPA4Py5VpuA35ox6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAzOCBTYWx0ZWRfX3iOj7qtAPo/e
 ANK14huKoCm1gA3LOIlM7ui0Gc+NES5vllCJRnhaInRjUF0Rip6yz318tAU29+spTx7LzdEAeHb
 PifDdbWNzXzu4PHrksUfIYVQlaxk6jP2rvnNcIKvLkawfxg2d0leH3K25LKG7G78ln3/WgNXSs9
 Zk4GeX9l0JvLYjcriPWAVUZRwF6C1kr0j41C4m6cOOUbSDw9K/ymtcJ2ot5LlyBXVFanuleIQ0H
 AZmq9JL/DwGrL1Pj8NDh0VEwSExRdwEf2/KbR1RhQOmc+7oEsPN80mAj1h0ffGXvL6PuDOY4sRh
 cj5SGkOD9s3M7GALS6m0K93avbMFZCfC/gbY7Ki5BaOY2YfFCQS82qqMFwBSkXF3nsVDFrxEgp4
 2cDeLa70q1CXu+eRCxHXdhcMnLcnaBcynXLfp9DeDqmZKrYh/82hQGCrCfIwwh5N7pgN8YvQkLH
 q+3BxaOv/R12Ajw0/vA==
X-Proofpoint-ORIG-GUID: ar7GRNWYtWemRmOMPA4Py5VpuA35ox6k
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df132b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=bZ0XY3ee3ZOhc1Ytu_MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_212517_714861_D1383FA8 
X-CRM114-Status: GOOD (  36.06  )
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
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |   2 +-
>   .../coresight/coresight-etm4x-core.c          | 107 ++++++++++--------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
>   3 files changed, 62 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index d14d7c8a23e5..0553771d04e7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>   				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
>   {
>   	int err = -EINVAL, idx;
> -	struct etmv4_config *drvcfg = &drvdata->config;
> +	struct etmv4_config *drvcfg = &drvdata->active_config;
>   	u32 off_mask;
>   
>   	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1bc9f13e33f7..01099689525b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -245,6 +245,10 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>   
>   struct etm4_enable_arg {
>   	struct etmv4_drvdata *drvdata;
> +	unsigned long cfg_hash;
> +	int preset;
> +	u8 trace_id;
> +	struct etmv4_config config;
>   	int rc;
>   };
>   
> @@ -270,10 +274,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
>   static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   {
>   	u64 trfcr = drvdata->trfcr;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
> -	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
> +	if (config->mode & ETM_MODE_EXCL_KERN)
>   		trfcr &= ~TRFCR_EL1_ExTRE;
> -	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
> +	if (config->mode & ETM_MODE_EXCL_USER)
>   		trfcr &= ~TRFCR_EL1_E0TRE;
>   
>   	return trfcr;
> @@ -281,7 +286,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   
>   /*
>    * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
> - * as configured by the drvdata->config.mode for the current
> + * as configured by the drvdata->active_config.mode for the current
>    * session. Even though we have TRCVICTLR bits to filter the
>    * trace in the ELs, it doesn't prevent the ETM from generating
>    * a packet (e.g, TraceInfo) that might contain the addresses from
> @@ -292,12 +297,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   {
>   	u64 trfcr, guest_trfcr;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/* If the CPU doesn't support FEAT_TRF, nothing to do */
>   	if (!drvdata->trfcr)
>   		return;
>   
> -	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
> +	if (config->mode & ETM_MODE_EXCL_HOST)
>   		trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		trfcr = etm4x_get_kern_user_filter(drvdata);
> @@ -305,7 +311,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   	write_trfcr(trfcr);
>   
>   	/* Set filters for guests and pass to KVM */
> -	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
> +	if (config->mode & ETM_MODE_EXCL_GUEST)
>   		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
> @@ -499,7 +505,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	int i, rc;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct device *etm_dev = &csdev->dev;
>   	struct csdev_access *csa = &csdev->access;
> @@ -616,23 +622,46 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
> +		goto err;
> +
> +	drvdata->sticky_enable = true;
> +
> +	return;
> +err:
> +	/* The tracer didn't start */
> +	etm4_release_trace_id(drvdata);

[NIT] better move this error handle to etm4_enable_sysfs.

smp_call_function_single possible return before call 
etm4_enable_sysfs_smp_call if the cpu is offline. The error path here 
cannot handle this error, breaking previous logic(handle all errors in 
etm4_enable_sysfs by releasing trace id).

There is no harm in not releasing the trace id here because ETM can 
re-use the allocated trace ID. But it's better to fix the inconsistent 
logic.

Thanks,
Jie

> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
>   /*
> @@ -670,7 +699,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>   	int ctridx;
>   	int rselector;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/* No point in trying if we don't have at least one counter */
>   	if (!caps->nr_cntr)
> @@ -754,7 +783,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct perf_event_attr max_timestamp = {
>   		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>   	};
> @@ -916,38 +945,24 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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
> -	if (!ret)
> -		drvdata->sticky_enable = true;
> -
> -	if (ret)
> -		etm4_release_trace_id(drvdata);
> -
> -	raw_spin_unlock(&drvdata->spinlock);
> -
>   	if (!ret)
>   		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>   	return ret;
> @@ -1036,7 +1051,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
>   	int i;
> @@ -1072,6 +1087,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
>   
>   	etm4_disable_hw(drvdata);
>   
> +	cscfg_csdev_disable_active_config(drvdata->csdev);
> +
>   	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
>   }
>   
> @@ -1122,7 +1139,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	 * DYING hotplug callback is serviced by the ETM driver.
>   	 */
>   	cpus_read_lock();
> -	raw_spin_lock(&drvdata->spinlock);
>   
>   	/*
>   	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
> @@ -1131,10 +1147,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
> @@ -1377,6 +1389,7 @@ static void etm4_init_arch_data(void *info)
>   	struct etm4_init_arg *init_arg = info;
>   	struct etmv4_drvdata *drvdata;
>   	struct etmv4_caps *caps;
> +	struct etmv4_config *config;
>   	struct csdev_access *csa;
>   	struct device *dev = init_arg->dev;
>   	int i;
> @@ -1384,6 +1397,7 @@ static void etm4_init_arch_data(void *info)
>   	drvdata = dev_get_drvdata(init_arg->dev);
>   	caps = &drvdata->caps;
>   	csa = init_arg->csa;
> +	config = &drvdata->active_config;
>   
>   	/*
>   	 * If we are unable to detect the access mechanism,
> @@ -1444,7 +1458,7 @@ static void etm4_init_arch_data(void *info)
>   
>   	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
>   	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> -	drvdata->config.s_ex_level = caps->s_ex_level;
> +	config->s_ex_level = caps->s_ex_level;
>   	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
>   	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
>   	/*
> @@ -1689,7 +1703,7 @@ static void etm4_set_default(struct etmv4_config *config)
>   static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
>   {
>   	int nr_comparator, index = 0;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/*
>   	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
> @@ -1730,7 +1744,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
>   {
>   	int i, comparator, ret = 0;
>   	u64 address;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct etm_filters *filters = event->hw.addr_filters;
>   
>   	if (!filters)
> @@ -1848,13 +1862,11 @@ static int etm4_starting_cpu(unsigned int cpu)
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
> @@ -1863,10 +1875,8 @@ static int etm4_dying_cpu(unsigned int cpu)
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
> @@ -2252,7 +2262,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
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
> index 8864cfb76bad..725e6360a8b9 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1071,6 +1071,7 @@ struct etmv4_save_state {
>    *		allows tracing at all ELs. We don't want to compute this
>    *		at runtime, due to the additional setting of TRFCR_CX when
>    *		in EL2. Otherwise, 0.
> + * @active_config:	structure holding current applied configuration parameters.
>    * @config:	structure holding configuration parameters.
>    * @save_state:	State to be preserved across power loss
>    * @paused:	Indicates if the trace unit is paused.
> @@ -1091,6 +1092,7 @@ struct etmv4_drvdata {
>   	bool				os_unlock : 1;
>   	bool				paused : 1;
>   	u64				trfcr;
> +	struct etmv4_config		active_config;
>   	struct etmv4_config		config;
>   	struct etmv4_save_state		*save_state;
>   	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);



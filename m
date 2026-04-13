Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FE9E9380A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 02:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgCGMrITMsvQlNVC3mg80gzZ7uOyka7TfasvEs9wxIA=; b=vkDv/dzIWaWiywkO52KgGKHNbT
	SHLeWFxMefJ1KopCND8J1kFVOWm55o/piqC3psZ2XhVrSwJU/V6pvpiNZbsv3gulltIMyPjcSAbA7
	D2R+62EknTeZFzrNm8n516E33Qo9UZisno8STL/+ZjvZmj2Y1rz9IhTbJ44f0+dE62mRYk8Cgmtcu
	0ay0ti+VgL8E/7XU3Mu7bwMjqtOl+qPf9wYf9CfeBFoAVBw5Lf74N3SDbUAhbhG2cQoGEgVporol0
	KzGLGj8sZus0c3ySns35/rw/jX4JcYmVshZ29FqXq/NwmkS0FMMFLChnRe8JkykSQGC19TJIvo/hO
	/byMfKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Bi-0000000EsZm-3DVc;
	Mon, 13 Apr 2026 02:38:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Bb-0000000EsZM-3S0q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 02:38:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5Svr1122217
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgCGMrITMsvQlNVC3mg80gzZ7uOyka7TfasvEs9wxIA=; b=CeL85N8ggsjFvzjE
	GwXVHAJq9CZuSUy/AUinWkf5g5krNSBR3qms9O4EczqrS8Pd6UX/mXOOPC9qsbm/
	LT6b2SDlsf3iahza9bdKTh2lpxSxgiKIWio96pfBTkjFodN4B/xiH4ac2DYcPqD7
	5xpXIEGkTDsu1Ywe8qtQaKoND5/3kY0wopOd9lIE9mDh7Jr38psSzQFeJMjACUmH
	L6sKP+Q5Vx554e/OwavfgJuzwYowLh7zV7QfFZqwr4B9iRIb0vV/v98rM0BPJC56
	wO3K8SiylX/VIwP/5c7FGZpr8w2dPCDYC6VDMLcf309ZGbsLMQLpZHWpdDz2SICD
	Uy1tMA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jucgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:38:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f3eaf4b9aso185735b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 19:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776047881; x=1776652681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgCGMrITMsvQlNVC3mg80gzZ7uOyka7TfasvEs9wxIA=;
        b=gETBEvhdX+v/Q4fX+4plp6CbmC0Q2A3+WgrjniQBI5vhWTbs4rDYU0aK6oHQkmZG/b
         1YJGJ5Z+BM8GuoX+lUFr3vsy8+m56ZMuv9hhBi+f5W8yPWTTou7acIIulaofYN4Phpeh
         yZshKDvxs/qltollUJykt4scqC5CNSfVZCEDEYNsvZC29eJGn9tCB80/TZmqmq/J9JDS
         LyLFup65OVO71/UnSBQAAorUPcvFZ2EGtZZouQo7XI7gqy2WtbXzkmzqcnUf3V6C7xAE
         nEjMYrWImhCWir8ds/wsxvdbJDFpW0qXZf0gr44YEpTHzu93sMPHHSwHh6fPIR9Tct6p
         l0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776047881; x=1776652681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgCGMrITMsvQlNVC3mg80gzZ7uOyka7TfasvEs9wxIA=;
        b=ZXFulWpNnvaxeVMN0X1k5HcjXs5JupXiREj9rfN2DVrLaot5L/CUfpb1MbN1VH0fSf
         Brke0IU0epbMqd6Mj6TzBQd+Y/9wnRfHI1Hh7/ovq1EhrE7Rsxw6h5TfMjAOewOjnng8
         B9CjXa6/RQv/ru0hEANgcPdwKxuxWoWHHro/lOLdBF5YPHclaQl6+pe8qc9Gxuf4Cbk0
         CQOkCNAOZpYLu8iXa7b6uo4c7KDKOk0E9N2sgH6VqXrZsNXHwSFl+wPky7kAvfvz9sxU
         ZrCCzEv2j/LVQWqGjSaHBB8pKbx7+49Stm6EEjFUG4EgqGuonVtU/qc9pdXhxH7j9IRn
         t9ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+zP2JGYl4q8lSUeg5W4ehdIoaF9DTgMysG3axpz4rb4pRTMX7yauVvcFkEbGvm3h76RA5kLaLeyJMwG9h5ho/J@lists.infradead.org
X-Gm-Message-State: AOJu0YyukKbLBocEFrYjNnoH/nf382OcqMzrNx4koN7unf0sYV/nWKzj
	2d7aq5pR9kg4uGRFDaD7bPif0haDWpwVuq+vWWG4E2tA4tcSB8xufdorMMmNzKytqnkmr9NOz97
	hSrxK9jt9fOaYdq5LGfd/Cvuw5oq6RF/3yUAdtrJDUNPdazDkqJj+r3yOu0MM67ms8s0mB1Pkhn
	k7fA==
X-Gm-Gg: AeBDietiZjo1/1Dx2kuTnixeseTM3SFyzsHPs4sImER4xar+q8DC4AzDAt4I8+7Y1hd
	ZPunIrC/PSahhMYnlBLZLWbcvJNK8ULM2ZVkBzfnq0G/7saN2biGBhaHO00HcrugDZj58L7gSb+
	MIz2Bi1GZmYREfsOMLByBDcTPwZtR+x7h3m8+O84/TKf6JldR+n8vKWfexOP6z7UPr2zOw+HMIY
	QByPd9wWrIVPt1DrRg923vxSk0+kjUWFz/tsORooEAmvg3hX93b2KZKZepTkRwuYHYVaLvLwZIN
	St/PapWQCd7W0MMGutqzCKJvxg9IuX2ea/8FE7LnHtowTxDCRY82xQitqnvHakZRcVDSXXjfsqA
	NZIpZ7CgnxEljDGKIQ3zzz3RF33wUf6CSaoZ9Oe3vIfqysDH0E8Sez7Ypb9/KtqWxTv1WHMaNcf
	Z1X9NP+5bu2w==
X-Received: by 2002:a05:6a00:bd85:b0:82c:225e:63c5 with SMTP id d2e1a72fcca58-82f0c28198dmr11495487b3a.18.1776047881490;
        Sun, 12 Apr 2026 19:38:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd85:b0:82c:225e:63c5 with SMTP id d2e1a72fcca58-82f0c28198dmr11495466b3a.18.1776047880963;
        Sun, 12 Apr 2026 19:38:00 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm10486616b3a.13.2026.04.12.19.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 19:38:00 -0700 (PDT)
Message-ID: <ea457326-f81c-47ce-abf8-a66bf13f19cc@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:37:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] coresight: etm4x: fix inconsistencies with sysfs
 configration
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
 <20260412175506.412301-4-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260412175506.412301-4-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAyMiBTYWx0ZWRfX7ujTv/60Cu67
 a+WB7Y3MMKtqnP9VqR5FwavAbvrpFAtVa8wc+tyAYIMHpRxXhhn8CaKRWQS5HXJCgIUyIpi6rlP
 IFcYHYYyqRQURZYDDdQDG2ppGBDpNvUazSDoolKASJllXbMtkC1yej1RmZjqmwNe/ncHlffIeWJ
 aGe8r12LXbS2Bt2NkvJxkedow+b4Ch575KMZgQk+rxau5YqbS6dp1EIiYxH8D6pej/JymrKKdQM
 76MyEVEHOS+1IlpfFILOMbov4nhZbesgWrWEpkBYxjJ04MmUi3VDIpyD1tyod7aeg/TtFzL0qrZ
 zqmelrlNfmrn0mAyZVGpexfQtilfTm8VNMIgTuwdbHwcKzGUEAy+0KR91D6yXH6NtjXVowNlwfI
 6V2F6KNed7AqOEK0Ap4lGF5nFwM3cfIkly4hPBLd9Vrt8PptR629uapkcqkZPkXJmmXuc86XWh0
 ysvs+Oo2ecKymfgmBLQ==
X-Proofpoint-ORIG-GUID: M9dshu2dCB5XXNbGgAUJ9nXjlqJdTery
X-Proofpoint-GUID: M9dshu2dCB5XXNbGgAUJ9nXjlqJdTery
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dc570a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=ZlLZKcBJAC1nrxKUbvQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_193804_011913_1D4E20DC 
X-CRM114-Status: GOOD (  33.75  )
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

Hi Yeoreum,

On 4/13/2026 1:55 AM, Yeoreum Yun wrote:
> The current ETM4x configuration via sysfs can lead to the following
> inconsistencies:
> 
>    - If a configuration is modified via sysfs while a perf session is
>      active, the running configuration may differ between before
>      a sched-out and after a subsequent sched-in.
> 
>    - If a perf session and sysfs session tries to enable concurrently,
>      configuration from configfs could be corrupted.
> 
>    - There is chance to corrupt drvdata->config if perf session tries
>      to enabled among handling cscfg_csdev_disable_active_config()
>      in etm4_disable_sysfs().
> 
> To resolve these inconsistencies, the configuration should be separated into:
> 
>    - active_config, which is applied configuration for the current session
>    - config, which stores the settings configured via sysfs.
> 
> and apply configuration from configfs after taking a mode.

typo in subject:
s/configration/configuration

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  2 +-
>   .../coresight/coresight-etm4x-core.c          | 74 ++++++++++++-------
>   drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
>   3 files changed, 49 insertions(+), 29 deletions(-)
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

<...>

>   	struct device *etm_dev = &csdev->dev;
>   	struct csdev_access *csa = &csdev->access;
> @@ -616,19 +621,36 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
> +	drvdata->active_config = drvdata->config;
> +
> +	if (arg->cfg_hash) {
> +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> +							   arg->cfg_hash,
> +							   arg->preset);
> +		if (arg->rc)

we need reset the mode once enable failed before return.
coresight_set_mode(csdev, CS_MODE_DISABLED);

Thanks,
Jie

> +			return;
> +	}
> +
> +	drvdata->trcid = arg->trace_id;
> +
> +	/* Tracer will never be paused in sysfs mode */
> +	drvdata->paused = false;
> +
> +	arg->rc = etm4_enable_hw(drvdata);
>   
>   	/* The tracer didn't start */
>   	if (arg->rc)
> @@ -670,7 +692,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>   	int ctridx;
>   	int rselector;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/* No point in trying if we don't have at least one counter */
>   	if (!caps->nr_cntr)
> @@ -754,7 +776,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct perf_event_attr max_timestamp = {
>   		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>   	};
> @@ -916,24 +938,18 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>   
>   	/* enable any config activated by configfs */
>   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> -	if (cfg_hash) {
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret)
> -			return ret;
> -	}
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   
> -	drvdata->trcid = path->trace_id;
> -
> -	/* Tracer will never be paused in sysfs mode */
> -	drvdata->paused = false;
> -
>   	/*
>   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>   	 * ensures that register writes occur when cpu is powered.
>   	 */
>   	arg.drvdata = drvdata;
> +	arg.cfg_hash = cfg_hash;
> +	arg.preset = preset;
> +	arg.trace_id = path->trace_id;
> +
>   	ret = smp_call_function_single(drvdata->cpu,
>   				       etm4_enable_sysfs_smp_call, &arg, 1);
>   	if (!ret)
> @@ -1034,7 +1050,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
>   	int i;
> @@ -1070,6 +1086,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
>   
>   	etm4_disable_hw(drvdata);
>   
> +	cscfg_csdev_disable_active_config(drvdata->csdev);
> +
>   	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
>   }
>   
> @@ -1130,9 +1148,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   				 drvdata, 1);
>   
>   	raw_spin_unlock(&drvdata->spinlock);
> -
> -	cscfg_csdev_disable_active_config(csdev);
> -
>   	cpus_read_unlock();
>   
>   	/*
> @@ -1375,6 +1390,7 @@ static void etm4_init_arch_data(void *info)
>   	struct etm4_init_arg *init_arg = info;
>   	struct etmv4_drvdata *drvdata;
>   	struct etmv4_caps *caps;
> +	struct etmv4_config *config;
>   	struct csdev_access *csa;
>   	struct device *dev = init_arg->dev;
>   	int i;
> @@ -1382,6 +1398,7 @@ static void etm4_init_arch_data(void *info)
>   	drvdata = dev_get_drvdata(init_arg->dev);
>   	caps = &drvdata->caps;
>   	csa = init_arg->csa;
> +	config = &drvdata->active_config;
>   
>   	/*
>   	 * If we are unable to detect the access mechanism,
> @@ -1442,7 +1459,7 @@ static void etm4_init_arch_data(void *info)
>   
>   	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
>   	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> -	drvdata->config.s_ex_level = caps->s_ex_level;
> +	config->s_ex_level = caps->s_ex_level;
>   	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
>   	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
>   	/*
> @@ -1687,7 +1704,7 @@ static void etm4_set_default(struct etmv4_config *config)
>   static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
>   {
>   	int nr_comparator, index = 0;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/*
>   	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
> @@ -1728,7 +1745,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
>   {
>   	int i, comparator, ret = 0;
>   	u64 address;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct etm_filters *filters = event->hw.addr_filters;
>   
>   	if (!filters)
> @@ -2250,7 +2267,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
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
> index 3cc1ca76c933..b943c28c9c71 100644
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



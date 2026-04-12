Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89516E937E4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTcVGv4apLzvR0+Y73Al9/aJbgw2Thmz3b36Gg8Kn04=; b=qnzNgFqM3hHprps4f3AJUBRxxb
	9QCWBDbqFf3GzyENglWKjdJirH+bSZ5B78BL0GD4UjzmRYhUiqzpj+FhxQl8rN4+qChOAw6Xjjuyu
	kZruiaxwm3hAw+cUdFcZh4EUE8jxHU6a1R4C+Z96pq6+m/Qm/V7uIpI78BeMr5zghuR51beOcVvTV
	L5cb4VN/SS2sjp6Cdaf5VbV8aRivWuiIqo9VP23hzwZjl4HhZdy4JeBPQLMhRNfKGRb6nCMEJtS1/
	rSyHtCq88+sOH2e8IaNH/DJo1hXmHWUhUrB5rSnn32OfHfwF5i08uOkIGIE0VEc8ip0+/N6r+OBhy
	5THPZ52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvhN-0000000EN6Z-1Zqc;
	Sun, 12 Apr 2026 14:22:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvhK-0000000EN5b-2iwk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:22:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4s8C3561252
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTcVGv4apLzvR0+Y73Al9/aJbgw2Thmz3b36Gg8Kn04=; b=OcmhPOi2VyKQQ9Ea
	CMC8gSH4S1EYKb+S53ogd228I7ePNGciZaJ3DwT3RTycoeoNef2YFxcLmR8idMlC
	o1/lpKZTcQIFPK4uveJiBLn7knAiEF6V1zV3bPUf77DBXMC5DsQ8qbhJDliVUAvI
	oy5w+tmie4CsczYmpVP5kiQh6eFm6xxMp/1/rtBhGvsu9PVRd014PrfHO+Qyu8xT
	W3i52EmOxX2WfZRaUQO4LX2kLiLnYYwTpuOUOwuvp0r6AX8quxoOr83idxYtTsTx
	Ew6cd2JXcUPkzWqE4RTaHoPwpIVAJLmqAIZ9QJ08FRZKdSMuWgUFXUS0KkqYSLJ1
	MwYEQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jehw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:22:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so6888005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776003720; x=1776608520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTcVGv4apLzvR0+Y73Al9/aJbgw2Thmz3b36Gg8Kn04=;
        b=Q9Lw/i/7l/o8/qnYLUnsZO11bKldjTHsDrno/hgM3Mt2GFrDrtPZI7WJavvrjhDPsV
         7g9C0ZgMTPCTA4ArW5DmdkgInKWQWQuUWgHAEqYhMpUeucUL0gpVSV0Oj4hXGMnvD9jB
         m+0tRxwJSCXNQ40bkHtpTYdDjuqg7auFvg3ZkItLCXGzQ34L+vQQA9PwtSqcTEHhGiGi
         JHUZ2OUO9KIwTM9dyblZC4Bo4L1VbtUackRWkJQq0dMDp2Yl0zR2Jf8Numq3ZkB0DCY0
         aVOmC48PGbRvPTmQq0uNSLivlEg21x4uxHPXWLNOb4qDGWGA8ZTWp5wYsjYKMPoF0fnn
         ibFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003720; x=1776608520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTcVGv4apLzvR0+Y73Al9/aJbgw2Thmz3b36Gg8Kn04=;
        b=CqSMIbdBlTGqcE66BPaX5ejplsLnI+YqURHErQyvL3/99RxDe8C/hsMH8AUpb2Vh4s
         E5cz6SVNS6/9KXeY+L7MeBhH3bZXf9xU9rNO49ctKXr4bcn4dmbabCORF6K6jk0ga9xv
         S2qaUXWJfuIw7bvuajL21AXXacKynLScafpQzzPTVAmY2CJESk1M5HeeGh+el72r0yjS
         fsnfK7mkAQbDNLBs26eClML3lC762xvTfXTtCmWwqtezDSi/zZKyGLY/yYQAG4ZTXhiJ
         uITy0QS4YOSu7Yfwa2JAnSossq7+FP1nreblVRw3SxATKJrguwDR54RKkQ2X10mZUSxb
         Ydiw==
X-Forwarded-Encrypted: i=1; AFNElJ/uSNWVjABZqyG6El1ZuE8SzjH8S+9KPloAbcaPcPylxYwInyVapEq5GUwqMAke6BbXBAhKqScbzBz3RxFoUppS@lists.infradead.org
X-Gm-Message-State: AOJu0YxOkytf3ww4C4d78shLqx6awS03Ul+OPfjtsEEavQawwv3daNSZ
	kQQvNzcAeLeJLm/2evuoXbKY8MJnItEBBq2XP7teguWfwki61yAUhlf2GXDMTdbdBlZ/2fq9mhg
	xidXjm4YM9Hne4Gs0AQHcIQBndDGZirwRC6gbq/kVXazU+SmpCBEwpYrc4SacMjgru+/9WMEe8D
	l2jg==
X-Gm-Gg: AeBDiesa2F2Ibtjk6U5EeAExRkOeVixUknl7yC4oc4RojxYvZthfBOyo1LagGYpVZsJ
	Hgi/0ULF5/sXmijII6KL6LiM5+svr7yD39PY5zlsoohBWZhUNYtOL2Y0Oxd9m7IdYIUoV02X9E+
	lvQ/0alD5ibaza2x8Yc+kZPkv/62q0+wmLXYTRT9pn/bjD5ZOX+apoHGsi5x4gx7NY+ZyAsgEIe
	JjwtOnCHK1a6lxJxuClVYDPX9VbX4ZVb1KFAeRelGIjVGTpDy02ccVMSKf1dPrggjhNxwwb1h5P
	wA2bSeu8nywCRHnn9WT6JtCaHK+xHmsjR22qG9hFlJUVPKQFp4hdLlKNnN+DBUq7qsN9HpR5eQ/
	BOdTpxKsudQLk9jFWGBddUVXG0lm+KaKcrgb4ZaVe/wVLJwjKvLSg55vnF+aJUDOKrUDrn+7f4t
	wxW3zAliiRYg==
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr85328015ad.20.1776003719717;
        Sun, 12 Apr 2026 07:21:59 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr85327885ad.20.1776003719210;
        Sun, 12 Apr 2026 07:21:59 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d066afesm9055195ad.8.2026.04.12.07.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:21:58 -0700 (PDT)
Message-ID: <4feaf157-4015-471e-accf-d588e2345c13@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 22:21:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] coresight: etm3x: introduce struct etm_caps
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-5-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260410074310.2693385-5-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbaa88 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=pXV8fNaFAcaORdBuSxcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE0MSBTYWx0ZWRfX5pPuTh+5FXRu
 DmwQONeCRvnB8dmZqTyvwcLUT5+bsGU1TgXm6QVldqbYOOO7mzpvDZg1UnUU9mBcjK+oYXBmnwZ
 Q0iNRhzjQg0odQwJurHCAEIVep067GQi9ykOWRb58I71EkcO/f7vvwl9+yBk3XAAolRhEX0vh+8
 Ok46YgzwDStT4BiQCOt6/7jLlxr8FuGxzWRBVfU5AvRmKVgx6SyGkYEcyKzlLeG4WTYlUD1YKWX
 z4OoATQaVU6I4UwYYmvxWgOLFcfob/ir5FdCVY4lkdrZ4kmeowOxYFj3wLFvWsz1SXAjO0lnU1T
 3oDdHH2c0N+ahXHm69FIYJ7fNtRQBj2Bz470JvowhPSZrShQB1nx9DtML8GB1HAAz38ylqmf6Y8
 DbkHpk8sRz8aNIzbajzXwa4Uhy8z10/sBSHf/EEq8TtDXXO/M7IIGlNf1QnUtBgUGKtgYY5zOI2
 Wf6in6FXzHcXGBmjK+A==
X-Proofpoint-ORIG-GUID: JMsYXKrM8xOXNR186d39w3X7mYWDPsk9
X-Proofpoint-GUID: JMsYXKrM8xOXNR186d39w3X7mYWDPsk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_072202_750882_E805C5F4 
X-CRM114-Status: GOOD (  30.53  )
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



On 4/10/2026 3:43 PM, Yeoreum Yun wrote:
> Introduce struct etm_caps to describe ETMv3 capabilities
> and move capabilities information into it.
> 
> Since drvdata->etmccr and drvdata->etmccer are used to check
> whether it supports fifofull logic and timestamping,
> remove etmccr and etmccer field from drvdata and add relevant fields
> in etm_caps structure.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm.h   | 40 +++++++++++--------
>   .../coresight/coresight-etm3x-core.c          | 33 ++++++++-------
>   .../coresight/coresight-etm3x-sysfs.c         | 14 ++++---
>   3 files changed, 52 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index 1d753cca2943..6fda26039db8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -140,6 +140,28 @@
>   				 ETM_ADD_COMP_0		|	\
>   				 ETM_EVENT_NOT_A)
>   
> +/**
> + * struct etmv4_caps - specifics ETM capabilities
> + * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
> + * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
> + * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
> + * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
> + * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
> + * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
> + * @fifofull: FIFOFULL logic is present.
> + * @timestamp: Timestamping is implemented.
> + */
> +struct etm_caps {
> +	int	port_size;
> +	u8	nr_addr_cmp;
> +	u8	nr_cntr;
> +	u8	nr_ext_inp;
> +	u8	nr_ext_out;
> +	u8	nr_ctxid_cmp;
> +	bool	fifofull : 1;
> +	bool	timestamp : 1;
> +};
> +
>   /**
>    * struct etm_config - configuration information related to an ETM
>    * @mode:	controls various modes supported by this ETM/PTM.
> @@ -212,19 +234,12 @@ struct etm_config {
>    * @csdev:	component vitals needed by the framework.
>    * @spinlock:	only one at a time pls.
>    * @cpu:	the cpu this component is affined to.
> - * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
>    * @arch:	ETM/PTM version number.
> + * @caps:	ETM capabilities.
>    * @use_cpu14:	true if management registers need to be accessed via CP14.
>    * @sticky_enable: true if ETM base configuration has been done.
>    * @boot_enable:true if we should start tracing at boot time.
>    * @os_unlock:	true if access to management registers is allowed.
> - * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
> - * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
> - * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
> - * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
> - * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
> - * @etmccr:	value of register ETMCCR.
> - * @etmccer:	value of register ETMCCER.
>    * @traceid:	value of the current ID for this component.
>    * @config:	structure holding configuration parameters.
>    */
> @@ -234,19 +249,12 @@ struct etm_drvdata {
>   	struct coresight_device		*csdev;
>   	spinlock_t			spinlock;
>   	int				cpu;
> -	int				port_size;
>   	u8				arch;
> +	struct etm_caps			caps;
>   	bool				use_cp14;
>   	bool				sticky_enable;
>   	bool				boot_enable;
>   	bool				os_unlock;
> -	u8				nr_addr_cmp;
> -	u8				nr_cntr;
> -	u8				nr_ext_inp;
> -	u8				nr_ext_out;
> -	u8				nr_ctxid_cmp;
> -	u32				etmccr;
> -	u32				etmccer;
>   	u32				traceid;
>   	struct etm_config		config;
>   };
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a547a6d2e0bd..b7e977defb1c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -367,6 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>   {
>   	int i, rc;
>   	u32 etmcr;
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   
> @@ -388,7 +389,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>   	etmcr = etm_readl(drvdata, ETMCR);
>   	/* Clear setting from a previous run if need be */
>   	etmcr &= ~ETM3X_SUPPORTED_OPTIONS;
> -	etmcr |= drvdata->port_size;
> +	etmcr |= caps->port_size;
>   	etmcr |= ETMCR_ETM_EN;
>   	etm_writel(drvdata, config->ctrl | etmcr, ETMCR);
>   	etm_writel(drvdata, config->trigger_event, ETMTRIGGER);
> @@ -396,11 +397,11 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>   	etm_writel(drvdata, config->enable_event, ETMTEEVR);
>   	etm_writel(drvdata, config->enable_ctrl1, ETMTECR1);
>   	etm_writel(drvdata, config->fifofull_level, ETMFFLR);
> -	for (i = 0; i < drvdata->nr_addr_cmp; i++) {
> +	for (i = 0; i < caps->nr_addr_cmp; i++) {
>   		etm_writel(drvdata, config->addr_val[i], ETMACVRn(i));
>   		etm_writel(drvdata, config->addr_acctype[i], ETMACTRn(i));
>   	}
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		etm_writel(drvdata, config->cntr_rld_val[i], ETMCNTRLDVRn(i));
>   		etm_writel(drvdata, config->cntr_event[i], ETMCNTENRn(i));
>   		etm_writel(drvdata, config->cntr_rld_event[i],
> @@ -414,9 +415,9 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>   	etm_writel(drvdata, config->seq_32_event, ETMSQ32EVR);
>   	etm_writel(drvdata, config->seq_13_event, ETMSQ13EVR);
>   	etm_writel(drvdata, config->seq_curr_state, ETMSQR);
> -	for (i = 0; i < drvdata->nr_ext_out; i++)
> +	for (i = 0; i < caps->nr_ext_out; i++)
>   		etm_writel(drvdata, ETM_DEFAULT_EVENT_VAL, ETMEXTOUTEVRn(i));
> -	for (i = 0; i < drvdata->nr_ctxid_cmp; i++)
> +	for (i = 0; i < caps->nr_ctxid_cmp; i++)
>   		etm_writel(drvdata, config->ctxid_pid[i], ETMCIDCVRn(i));
>   	etm_writel(drvdata, config->ctxid_mask, ETMCIDCMR);
>   	etm_writel(drvdata, config->sync_freq, ETMSYNCFR);
> @@ -572,7 +573,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
>   	/* Read back sequencer and counters for post trace analysis */
>   	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
>   
> -	for (i = 0; i < drvdata->nr_cntr; i++)
> +	for (i = 0; i < caps->nr_cntr; i++)

caps undeclared.

Thanks,
Jie

>   		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
>   
>   	etm_set_pwrdwn(drvdata);
> @@ -754,7 +755,9 @@ static void etm_init_arch_data(void *info)
>   {
>   	u32 etmidr;
>   	u32 etmccr;
> +	u32 etmccer;
>   	struct etm_drvdata *drvdata = info;
> +	struct etm_caps *caps = &drvdata->caps;
>   
>   	/* Make sure all registers are accessible */
>   	etm_os_unlock(drvdata);
> @@ -779,16 +782,18 @@ static void etm_init_arch_data(void *info)
>   	/* Find all capabilities */
>   	etmidr = etm_readl(drvdata, ETMIDR);
>   	drvdata->arch = BMVAL(etmidr, 4, 11);
> -	drvdata->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> +	caps->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> +
> +	etmccer = etm_readl(drvdata, ETMCCER);
> +	caps->timestamp = !!(drvdata->etmccer & ETMCCER_TIMESTAMP);

caps->timestamp = !!(etmccer & ETMCCER_TIMESTAMP);

>   
> -	drvdata->etmccer = etm_readl(drvdata, ETMCCER);
>   	etmccr = etm_readl(drvdata, ETMCCR);
> -	drvdata->etmccr = etmccr;
> -	drvdata->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> -	drvdata->nr_cntr = BMVAL(etmccr, 13, 15);
> -	drvdata->nr_ext_inp = BMVAL(etmccr, 17, 19);
> -	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
> -	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
> +	caps->fifofull = !!(drvdata->etmccr & ETMCCR_FIFOFULL);

caps->fifofull = !!(etmccr & ETMCCR_FIFOFULL);

> +	caps->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> +	caps->nr_cntr = BMVAL(etmccr, 13, 15);
> +	caps->nr_ext_inp = BMVAL(etmccr, 17, 19);
> +	caps->nr_ext_out = BMVAL(etmccr, 20, 22);
> +	caps->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>   
>   	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
>   	etm_set_pwrdwn(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..0d8dac29d055 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -111,6 +111,7 @@ static ssize_t mode_store(struct device *dev,
>   	int ret;
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	ret = kstrtoul(buf, 16, &val);
> @@ -131,7 +132,7 @@ static ssize_t mode_store(struct device *dev,
>   		config->ctrl &= ~ETMCR_CYC_ACC;
>   
>   	if (config->mode & ETM_MODE_STALL) {
> -		if (!(drvdata->etmccr & ETMCCR_FIFOFULL)) {
> +		if (!caps->fifofull) {
>   			dev_warn(dev, "stall mode not supported\n");
>   			ret = -EINVAL;
>   			goto err_unlock;
> @@ -141,7 +142,7 @@ static ssize_t mode_store(struct device *dev,
>   		config->ctrl &= ~ETMCR_STALL_MODE;
>   
>   	if (config->mode & ETM_MODE_TIMESTAMP) {
> -		if (!(drvdata->etmccer & ETMCCER_TIMESTAMP)) {
> +		if (!caps->timestamp) {
>   			dev_warn(dev, "timestamp not supported\n");
>   			ret = -EINVAL;
>   			goto err_unlock;
> @@ -286,13 +287,14 @@ static ssize_t addr_idx_store(struct device *dev,
>   	int ret;
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	ret = kstrtoul(buf, 16, &val);
>   	if (ret)
>   		return ret;
>   
> -	if (val >= drvdata->nr_addr_cmp)
> +	if (val >= caps->nr_addr_cmp)
>   		return -EINVAL;
>   
>   	/*
> @@ -589,13 +591,14 @@ static ssize_t cntr_idx_store(struct device *dev,
>   	int ret;
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	ret = kstrtoul(buf, 16, &val);
>   	if (ret)
>   		return ret;
>   
> -	if (val >= drvdata->nr_cntr)
> +	if (val >= caps->nr_cntr)
>   		return -EINVAL;
>   	/*
>   	 * Use spinlock to ensure index doesn't change while it gets
> @@ -999,13 +1002,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
>   	int ret;
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	ret = kstrtoul(buf, 16, &val);
>   	if (ret)
>   		return ret;
>   
> -	if (val >= drvdata->nr_ctxid_cmp)
> +	if (val >= caps->nr_ctxid_cmp)
>   		return -EINVAL;
>   
>   	/*



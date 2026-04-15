Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17870F4199B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5bGj8dg6sWT/8Qx4G1y0lgYu9LMndadv5vBd8WeOPM=; b=WHmNdp9Lbd9I6psuFAMtmHWn4w
	t+yZ4QMIREiYPmwgdiE2PQvUAIHZYdaGFSgqPKUqnwMvQH34Olkb3Kh32c8wUBkzFa64Ie+Ub1DCf
	aN/F7YUb7aZtoO/0PP3B+oi3lg0Raw2iNEWGcw/8kIKoZMOMgzNhhPRkMzJ0lrICrVUpwd/I+6YNv
	VrSvNOM9TK91SmGIF/ZQ0qdkabwyWRBtx66iE9ZZOvTOHm79cCwLiOK2WK6pb64vKKCsUbsMVu9Mh
	L6RrWVol+i+cjOFaT1HumD5IBZ/HLkbJ/yi73z9K5SIWkmdnzZYK9POI+POMaiHBwsQNsTC+Zq7xU
	VljtK+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzBJ-000000016z3-1JW4;
	Wed, 15 Apr 2026 12:17:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzBF-000000016yi-1oWB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:17:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tSCv764267
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5bGj8dg6sWT/8Qx4G1y0lgYu9LMndadv5vBd8WeOPM=; b=EOxEasfaNj7VvZkG
	mYZM6izf6UyR1dYdzUHfnc85APL/PX8t3veCcBSnlqyOF+z2qV3MgnHhViy5+7eJ
	1Zn0nqublNuzOfar7inslLPd1w5vnX4ZoZjIwyKraK1AQRflyPv/G8zUaxc1Ze4t
	1UfgSv11Hx4f/2w081Qjt3OrA6MV/TEu3SZrFsVQOSx1G8WMC2GaHAl8b63WoEOL
	Rn0yYJAAEiFs7hjziwuz9ga5B2wk7M1fmroUzDFNT0cSDoixtTHP8bdpKt3R6qbg
	XOcCr+6I0DbRt2IKmQJghxaL56kxPyf4jN+OAGlE+RXTvVNYMsFJw0uPJiEqQQEH
	mu4tyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7ry38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:17:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e06219cbso47837715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776255436; x=1776860236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5bGj8dg6sWT/8Qx4G1y0lgYu9LMndadv5vBd8WeOPM=;
        b=SYnSKkmPfRVYj2zA0qUbWSkW9HvDaj8Brhf67+TolLEhLr3g/uI/rRLgJNQq9ohsYM
         Djyodf+2Z3Xz6/RoT5Gkxb4GxENw9Mqhrk+He29nE/rOGdwDllw9yI2pWx1CjW9PTcfk
         x/T6B0xMFVTNEKc1332BbsFc+SwQbuDKImVvtY8dRASgaJ9U+7MQV2NA5k9Iako9uekc
         SDyy47dTIa1OnWd8losnkUET6hmuJCesQ+b50RKU+GMpW6R88BEIdo/8NT+QWc78IRo/
         +XgM7TRzpDsLupCSJD4wp89t0E1OYN8pukN7dN81O9qNGq1sPtTGceZzaroyPfaSlzJs
         tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776255436; x=1776860236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5bGj8dg6sWT/8Qx4G1y0lgYu9LMndadv5vBd8WeOPM=;
        b=pd9GUf11PD47PbyJu1vjw7q5FVLjeaYo2xLUMETi2IIqBhRLaqG5rHNJd34JdzcR4a
         20BSiTWRhSHh8OPw8CNKoYZNPJ1+PGio3YHWqMdqQ0qF+UM6pY2LQvM4KYTvbTuAwbIl
         jY79q4kvhQ7OSa/R9AAvOu3EnjHItuHF4sZW8n6ifk13r8DtsaGf7cXfPQDFdh7gnzv6
         0Rk8LgWiQxGIbRX+Fn/a5sHNCsbA7lrM+BcodcqMm+xubwEAxRbwCkQd2Rt12w6KalbT
         tSk6Hf9G8TrTx9ReEUxu8mWZi16S5iHa6nMUSFSHWhwbUyHufT86/miZIOxnKN1bt7Ut
         4bxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qg/2UwwGKFzjFY2CofEzW1Rw1rRmXz5OwsJZD9RYktsc3Yz4RpCmegFDPeuB2MAmPtEcIIqnLQXHQIHUwhMCG@lists.infradead.org
X-Gm-Message-State: AOJu0YzxnQw2JjBJ3B7nCaq4znYgnfOujKlz95ivFZ7CitOLXRCXrn+i
	UX1Hq7fUqSvPlcvXYd0hMB5kUrQkPAFmlc+8S0X5SlAEhRQJx3QGBQOUDTmK7rq4JO/EvbsbfEV
	0/Z3TPPz7hJVtWRnYRf9DO/xfm+Ep2bx1V5SIvnsshXkQ6+u1kHL5qFyt79kArhauK7x+0CmBY1
	pf4w==
X-Gm-Gg: AeBDieusr/Nsg2EMrTHlRpYt5IV0K6jNrxHYYoZqURrzsQMYoIPr0dIVjDlk97YMQJx
	0hIvYPvXkgGkMffIC5/HsG7qjouUi9NjyXxku4SpwbauNkRlNPI7eHip2s4ljuk7B7J7pJA1Dvu
	HdFs2i558Y96mZC2tZp933UVF3zA1ynMI6fiFcUsIYWZo7oKkQr8/h81aqQEGf45+iW0OukbGCb
	6VFI3vS3CmTjJNUV7kA7xjpiHLFuJY7buw92kgIejA9gSPNvBaGcfIB28cYHzz59Q7XwX8W2kbg
	kOevlu3GlP4UWckL/hmz+yTmBKKPS9rV4WRPHGGSbMfGVNt5D1Raz6aIn929zW+9lFcAxk8ykwa
	pdCZMyJiS5+2ojgLphYwn1ZY9xRCOn7dd1TlbuOXj504qKHSJFkbvqztTkm2ut29H0nFSGFpXZw
	hcv9R/il2VzQ==
X-Received: by 2002:a17:903:2492:b0:2b2:45b7:307f with SMTP id d9443c01a7336-2b2d59434admr163728045ad.9.1776255435453;
        Wed, 15 Apr 2026 05:17:15 -0700 (PDT)
X-Received: by 2002:a17:903:2492:b0:2b2:45b7:307f with SMTP id d9443c01a7336-2b2d59434admr163727795ad.9.1776255434820;
        Wed, 15 Apr 2026 05:17:14 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6704sm29299375ad.75.2026.04.15.05.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:17:14 -0700 (PDT)
Message-ID: <585280ea-8395-482a-8a3e-7527fce20539@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 20:17:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] coresight: etm3x: introduce struct etm_caps
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-8-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-8-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df81cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=QzKTikuh-o1KtyWUvv8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: fVSuhrwJepOOIzFSNl3h2nNwkNaUJ9Xk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMyBTYWx0ZWRfX/KWNxeKfHKzr
 yfE0QB47KhVToedfEICtezRcKrLRdVt20rGjiQQJ3S40qD+o0ss1/iJmPjIZuL1yaW+Rapb+q48
 1hmxxcYBWebfM1uMsR1HMxwg3XUQRgybTd23JcGma+Ka1x08zruZN0iIlhUWrAQSuBlTVcRUp7C
 MAvroJ2RBPz+nd4dhUS39EhIi6jFzIKNYrst64f/D/AuJKTIR+mnA0LcIVQRhXjenQkgwcUtcLV
 3NNSkgVtmcyWouiRBmh4oD6YDh0n+njjsEhOad/m8e+C6k63en8ot5zvZD3uOW/n5f7SQqAMfvc
 FljsV2TePKaC90CxhxenkiMK4bGWcqLf61qFyx0HXDt5mAbe+trGHHyN5OAu4bjtXDLld2w/fhQ
 NSQEQehHsKKT2BizKDcs2rhsErgWDGOqeT1q9Q0zGv19UblagfZTjPSLKQb9mq4/pNzYSr7zFqp
 dLoYiKgOvAmtLlqQs5g==
X-Proofpoint-ORIG-GUID: fVSuhrwJepOOIzFSNl3h2nNwkNaUJ9Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_051717_530349_B1845DEC 
X-CRM114-Status: GOOD (  32.63  )
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



On 4/13/2026 10:20 PM, Yeoreum Yun wrote:
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
>   drivers/hwtracing/coresight/coresight-etm.h   | 42 ++++++++++++-------
>   .../coresight/coresight-etm3x-core.c          | 39 ++++++++++-------
>   .../coresight/coresight-etm3x-sysfs.c         | 29 ++++++++-----
>   3 files changed, 67 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index 40f20daded4f..8d1a1079b008 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -140,6 +140,30 @@
>   				 ETM_ADD_COMP_0		|	\
>   				 ETM_EVENT_NOT_A)
>   
> +/**
> + * struct etmv_caps - specifics ETM capabilities

s/etmv_caps/etm_caps

Thanks,
Jie

> + * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
> + * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
> + * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
> + * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
> + * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
> + * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
> + * @fifofull:	FIFOFULL logic is present.
> + * @timestamp:	Timestamping is implemented.
> + * @retstack:	Return stack is implemented.
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
> +	bool	retstack : 1;
> +};
> +
>   /**
>    * struct etm_config - configuration information related to an ETM
>    * @mode:	controls various modes supported by this ETM/PTM.
> @@ -212,19 +236,12 @@ struct etm_config {
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
> @@ -234,19 +251,12 @@ struct etm_drvdata {
>   	struct coresight_device		*csdev;
>   	raw_spinlock_t			spinlock;
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
> index 4a702b515733..e42ca346da91 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -308,6 +308,7 @@ void etm_config_trace_mode(struct etm_config *config)
>   static int etm_parse_event_config(struct etm_drvdata *drvdata,
>   				  struct perf_event *event)
>   {
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   	struct perf_event_attr *attr = &event->attr;
>   	u8 ts_level;
> @@ -356,8 +357,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>   	 * has ret stack) on the same SoC. So only enable when it can be honored
>   	 * - trace will still continue normally otherwise.
>   	 */
> -	if (ATTR_CFG_GET_FLD(attr, retstack) &&
> -	    (drvdata->etmccer & ETMCCER_RETSTACK))
> +	if (ATTR_CFG_GET_FLD(attr, retstack) && (caps->retstack))
>   		config->ctrl |= ETMCR_RETURN_STACK;
>   
>   	return 0;
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
> @@ -563,6 +564,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>   static void etm_disable_hw(struct etm_drvdata *drvdata)
>   {
>   	int i;
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   
> @@ -572,7 +574,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
>   	/* Read back sequencer and counters for post trace analysis */
>   	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
>   
> -	for (i = 0; i < drvdata->nr_cntr; i++)
> +	for (i = 0; i < caps->nr_cntr; i++)
>   		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
>   
>   	etm_set_pwrdwn(drvdata);
> @@ -754,7 +756,9 @@ static void etm_init_arch_data(void *info)
>   {
>   	u32 etmidr;
>   	u32 etmccr;
> +	u32 etmccer;
>   	struct etm_drvdata *drvdata = info;
> +	struct etm_caps *caps = &drvdata->caps;
>   
>   	/* Make sure all registers are accessible */
>   	etm_os_unlock(drvdata);
> @@ -779,16 +783,19 @@ static void etm_init_arch_data(void *info)
>   	/* Find all capabilities */
>   	etmidr = etm_readl(drvdata, ETMIDR);
>   	drvdata->arch = BMVAL(etmidr, 4, 11);
> -	drvdata->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> +	caps->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> +
> +	etmccer = etm_readl(drvdata, ETMCCER);
> +	caps->timestamp = !!(etmccer & ETMCCER_TIMESTAMP);
> +	caps->retstack = !!(etmccer & ETMCCER_RETSTACK);
>   
> -	drvdata->etmccer = etm_readl(drvdata, ETMCCER);
>   	etmccr = etm_readl(drvdata, ETMCCR);
> -	drvdata->etmccr = etmccr;
> -	drvdata->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> -	drvdata->nr_cntr = BMVAL(etmccr, 13, 15);
> -	drvdata->nr_ext_inp = BMVAL(etmccr, 17, 19);
> -	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
> -	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
> +	caps->fifofull = !!(etmccr & ETMCCR_FIFOFULL);
> +	caps->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> +	caps->nr_cntr = BMVAL(etmccr, 13, 15);
> +	caps->nr_ext_inp = BMVAL(etmccr, 17, 19);
> +	caps->nr_ext_out = BMVAL(etmccr, 20, 22);
> +	caps->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>   
>   	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
>   	etm_set_pwrdwn(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 42b12c33516b..f7330d830e21 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -15,8 +15,9 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_addr_cmp;
> +	val = caps->nr_addr_cmp;
>   	return sprintf(buf, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_addr_cmp);
> @@ -25,8 +26,9 @@ static ssize_t nr_cntr_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_cntr;
> +	val = caps->nr_cntr;
>   	return sprintf(buf, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_cntr);
> @@ -37,7 +39,7 @@ static ssize_t nr_ctxid_cmp_show(struct device *dev,
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	val = drvdata->nr_ctxid_cmp;
> +	val = drvdata->caps.nr_ctxid_cmp;
>   	return sprintf(buf, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_ctxid_cmp);
> @@ -80,7 +82,7 @@ static ssize_t reset_store(struct device *dev,
>   		memset(config, 0, sizeof(struct etm_config));
>   		config->mode = ETM_MODE_EXCLUDE;
>   		config->trigger_event = ETM_DEFAULT_EVENT_VAL;
> -		for (i = 0; i < drvdata->nr_addr_cmp; i++) {
> +		for (i = 0; i < drvdata->caps.nr_addr_cmp; i++) {
>   			config->addr_type[i] = ETM_ADDR_TYPE_NONE;
>   		}
>   
> @@ -111,6 +113,7 @@ static ssize_t mode_store(struct device *dev,
>   	int ret;
>   	unsigned long val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	ret = kstrtoul(buf, 16, &val);
> @@ -131,7 +134,7 @@ static ssize_t mode_store(struct device *dev,
>   		config->ctrl &= ~ETMCR_CYC_ACC;
>   
>   	if (config->mode & ETM_MODE_STALL) {
> -		if (!(drvdata->etmccr & ETMCCR_FIFOFULL)) {
> +		if (!caps->fifofull) {
>   			dev_warn(dev, "stall mode not supported\n");
>   			ret = -EINVAL;
>   			goto err_unlock;
> @@ -141,7 +144,7 @@ static ssize_t mode_store(struct device *dev,
>   		config->ctrl &= ~ETMCR_STALL_MODE;
>   
>   	if (config->mode & ETM_MODE_TIMESTAMP) {
> -		if (!(drvdata->etmccer & ETMCCER_TIMESTAMP)) {
> +		if (!caps->timestamp) {
>   			dev_warn(dev, "timestamp not supported\n");
>   			ret = -EINVAL;
>   			goto err_unlock;
> @@ -286,13 +289,14 @@ static ssize_t addr_idx_store(struct device *dev,
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
> @@ -589,13 +593,14 @@ static ssize_t cntr_idx_store(struct device *dev,
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
> @@ -720,18 +725,19 @@ static ssize_t cntr_val_show(struct device *dev,
>   	int i, ret = 0;
>   	u32 val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etm_caps *caps = &drvdata->caps;
>   	struct etm_config *config = &drvdata->config;
>   
>   	if (!coresight_get_mode(drvdata->csdev)) {
>   		raw_spin_lock(&drvdata->spinlock);
> -		for (i = 0; i < drvdata->nr_cntr; i++)
> +		for (i = 0; i < caps->nr_cntr; i++)
>   			ret += sprintf(buf, "counter %d: %x\n",
>   				       i, config->cntr_val[i]);
>   		raw_spin_unlock(&drvdata->spinlock);
>   		return ret;
>   	}
>   
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		val = etm_readl(drvdata, ETMCNTVRn(i));
>   		ret += sprintf(buf, "counter %d: %x\n", i, val);
>   	}
> @@ -999,13 +1005,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211DAF4198B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOPyBVh5wkfcpmshMahRfP5h7T0g+jp8/1ZUrdWzWmM=; b=wCsOUGKBHSIVjefAZb8+3yKzJc
	+x+FRfpqF0XoCJsMRH1jXOGf/NR2yuPaIhKJ+ajTd+JRWXn03/Fdmr0bmMLJDPgH3E2Pen/NNcfyb
	d6vW0fniUfBWpeurm6dmN0+naNjcAT2nmCmUqQy2MAXuHIziolNMi8kxyJwig8ZcXACiSppaGMTK+
	s6MVUy5KfTViiX/ZZWbnBVZ6Ye7S3n298VUBk6pz0dpiJjpXSwGG78t4IVs1Fb9anMkKcMmSnNXv6
	s0dHxmp8Ejg54PuuYlRDW9HJuChFQqj5rucZmTChq42HLJHG2zGM9Em+f0ooCztN807mbv1N2F4zK
	Lk3aY8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyuf-000000015gX-0y3W;
	Wed, 15 Apr 2026 12:00:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyuc-000000015g7-3FV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:00:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xH8A2772654
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOPyBVh5wkfcpmshMahRfP5h7T0g+jp8/1ZUrdWzWmM=; b=cEfc8eAuH+Y4A5Lg
	SSdtA3pec/wgHTjuNDycjo/I5MYM1Kl8bpc2ChLzm19PDSzQfm39PhgKczODgKSF
	miJ0XwU/Wi/f6VIjQwme+8mrRLWIfHy0gMRIsFoi3bqkIO/ddbiJZcZ5n3EJRGiI
	r6KvPtVgPpEY3MsD0QDbtmyF+i55n+/onCNQMEbdg0xp/QejxzMiK5wBu+d5PEBL
	HKjqmvzdDwI7u9oyzJABMMcInm1HOPjYJ+9Vr6pb1HZnms4WA8rkGgyFcDM+GtT8
	wbgS5lZhufXJGbIozzpTnURw38clPixkUxuVr2xMBUuXY3JOOZJ1wLh9tOePd7Vu
	OGAx4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v19c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:00:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso6915211a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776254405; x=1776859205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOPyBVh5wkfcpmshMahRfP5h7T0g+jp8/1ZUrdWzWmM=;
        b=EQIs0vNe4Dc3SaH2g2pJfLxOyoEkF1uEVFXBHj2TAvGfPVC8V0AlOJ2AzzS7fcFvsU
         +okqTxxgUY5lt+JZ6bcjBHFPM73X7c9LXANh0ZK+n/2xl1uisrHiScfXvalqxmryoreF
         aWo8yc94yPykFgCknKeZrgZtioY6bRBDt6fCEnXuyPYUaiBI13Bc45Vhq7cf8PG0M5Si
         UsPLHyaN0TicvQCVJ9JfmdnX0hd1fQRG8e6XeAYKpI6ljKSxvAVzyTjHjhNg0MzTvsaT
         TLDVIWKsTqmaYp+kDJ7jW7nVuhPJNRTsNSdmIToWKIxhTXi1dTjoj4MpCZ354mQit6Gr
         3ytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254405; x=1776859205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOPyBVh5wkfcpmshMahRfP5h7T0g+jp8/1ZUrdWzWmM=;
        b=jWmvX+akweSIjFdXhJjbg7dYekr/HFvnLA6D7C4g97BiPtIEagNSdQ7T8IcGK1sZpw
         9mFDy+/j0RbFL+QR27ryPDr5rPT+gWU9yeFHhtnsIqLmeEygQOhuFhEgRoDtZh6tixKi
         9Qg3V3FHO8/LPaGxrbmlkX+E5ncD+1cpLOakHW9a9WKBTjnr8ea+pX6QbVMkwY7DMkXY
         zyjSQgeac0IKhutEsNHSS3qEwYXUl2MRLDFCUI0brqqNNOLf0WjN6H0H7zvvW7EmErke
         10/MZ5fJltd25sL40YLGJ45VqKsJJxRbxxsr+zhUJAeasm+B5mffBm4+/uBasnktsSOI
         zLYw==
X-Forwarded-Encrypted: i=1; AFNElJ9MCwhrMc1oMt6EbiMTtfCY8WjEp9k9JoRoPGvCXuZb+2rQ50+cqXE4UM87aSVOk3eQ5Hte8i62ByJZboAMiVlk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0QcheFlNrygMT8hP1LpSh+j1NWjrk8hfQPgq4Lkm4fybV/HCp
	CziKmpyBFVshQZmxa6nzE7S+5++wPBeG3eVg8k7DcQsgpnl70WRu5JdsHr87OnM1qnnwLM72BH2
	h3gAVKNxpQ2eaOMG7gp8MOeZrfenNfAEUgW68G4dJwuPgO9glALeYQ2vTN8cFvYO2QiEcMA+vmP
	y0mA==
X-Gm-Gg: AeBDiet9gm4nh7ONN3B2tRPESkGA5fZERaqFDfqgcBpD1pP4M3jNZp+yTYEn2yH0LDh
	IeOYr6Z7u4yZJozaDLKIcxg8xIJmL3Uri9Qe/Tc81lI6HeYkRLbhYXFfKJ7yyNFkTgsC9DUwZLg
	4DR73qyGIOVJ0n/YDCNKPtXb3sSR7BCR1Zuuni1iSy1/j9w79A7JvZtSrrXr3SXgRIGjGNqPHA0
	S7xnt6HUL74FdP9khd/af+kfFRUchyCevhHnG0M9Cw6vK7AYInAtKiGF88Kj2jxIU0z9YX/yCGP
	xymkcZIzzft6P+vpZ3ePg42S5FsAartHexl5KOtOARoWz2027OQW7G2kd3+htqDE/9DKpLfuK/G
	4wLqYEg+3kNzGvrJ/XAzznpiv8OtTbS23LMk1IjfGPwhCtxvpSt7SKrcrxOuT/mwPQnHyTiE/t2
	huySrPg282dQ==
X-Received: by 2002:a17:90b:3c85:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-35e4278b922mr20254120a91.3.1776254405239;
        Wed, 15 Apr 2026 05:00:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-35e4278b922mr20254083a91.3.1776254404746;
        Wed, 15 Apr 2026 05:00:04 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957eeb35csm1569622a12.12.2026.04.15.05.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:00:04 -0700 (PDT)
Message-ID: <cd4978d2-4040-41ce-83ee-008d50aad37b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:59:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] coresight: etm4x: remove redundant call
 etm4_enable_hw() with hotplug
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-6-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-6-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JUvKNWz6YbOfgi_s4GkjHxd1-tK3iaXl
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df7dc6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=vHEE0SP3H1NCSIy07DoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMCBTYWx0ZWRfX4kUfgdpU6/zc
 ytBM7jl1YS/T8NV+48zPELeW+u3nidEOjPus2aJ6DXJhKx8LODmbJuC2qPXDtUh8NTTgzjFa8gE
 sNrYZ1rZYaqml7Kf+nt3RjgR9YYOo+1IwfTk5lx+h7V17UGZ07h/eZbNQvpW+kB7J6htIpJYCm/
 OANInteW0Hhhiwl++75wCNrxd5SUwKhundfqk5BG6kpuOruhznCXDYNse3zj7LfjslHGWvKU1L6
 Lym9U+1ZuQBcCmgiVrQ0LDAeslYg+hSpyG5ky2Vc+sJeULDHtAxv3uPV43RA1Fz+AdJBLdrEDCS
 zXU/aA/6QtoKJiIbQRLLnm3o3YzSTrCBSqGvqHouLDnt59WvVdeTt8S6lgPSHo9aeQIhWVCe453
 YtyUSf+4Ki07+m0AJSDE8EBJoBuVhmlnoWFpc2aPXBJj8RwuIhKfonVJd80KPQvS/3zaw6IRPGx
 ZBH1AsBjUTNR34kEPqQ==
X-Proofpoint-ORIG-GUID: JUvKNWz6YbOfgi_s4GkjHxd1-tK3iaXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_050006_835511_07AAE26F 
X-CRM114-Status: GOOD (  19.90  )
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
> The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
> In other words, if etm4_enable_sysfs() is called between
> CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
> etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
> and then executed again in etm4_starting_cpu().
> 
> To remove this redundant call, take the hotplug lock before executing
> etm4_enable_sysfs_smp_call().
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 01099689525b..facd5a306228 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -959,8 +959,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>   	arg.config = drvdata->config;
>   	raw_spin_unlock(&drvdata->spinlock);
>   
> +	/*
> +	 * Take the hotplug lock to prevent redundant calls to etm4_enable_hw().
> +	 *
> +	 * The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
> +	 * In other words, if etm4_enable_sysfs() is called between
> +	 * CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
> +	 * etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
> +	 * and then executed again in etm4_starting_cpu().
> +	 */
> +	cpus_read_lock();
>   	ret = smp_call_function_single(drvdata->cpu,
>   				       etm4_enable_sysfs_smp_call, &arg, 1);
> +	cpus_read_unlock();
> +
>   	if (!ret)
>   		ret = arg.rc;
>   	if (!ret)

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>





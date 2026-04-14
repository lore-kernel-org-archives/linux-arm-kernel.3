Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C69EED7B86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNl+WzeBVQZNuIoq360g8EtxDOpGB6/PAFoObHglOZU=; b=mYOAM9Xa1cntp1CaY6uukLO5HV
	5XXN4y+5kZR9fCk/5GHNCjT1O9gxJax00ahWR84B9rY7QrMtoqeOewNVGSO4RWDOBxnwqPvKQQC8I
	72MS3DjDmU1/KxZ8BZnVUgP7pe7Xr9UKs6qpuF/CgwLHakN+WCyk3bil+ECfmRDFbAu2YxaLle0cv
	YcilD2BZDeUenYTi3SZ9FCe7Q58hT5DKkOaC83qFbMWCfJXMEyO9AlsQAse5kpOFd/SiLgDrHssV8
	4ulOPePNRT6FajSadAzSs6kUsMHcp/EoeT2WjpXg6UBDlAj6n1GUeJAaxqUlFwyLD1e6xAg5T1TZ7
	e1xLYoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYjT-0000000GwAC-3QHg;
	Tue, 14 Apr 2026 08:02:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYjO-0000000Gw9r-35zM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:02:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6tehY3681505
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNl+WzeBVQZNuIoq360g8EtxDOpGB6/PAFoObHglOZU=; b=kF1NPtLp6H1uPZ4Z
	YRO2UjL0prX2GggTDD0tUalQ8qFSXfvDB9YLODPCivoK29Sg98rmz3APolX59Bea
	tnKiK1sDUlW5vRiZZHHDsbl7NQIUdS2LsZcaE10BUUvDAN1VE/ATVNaRKqxBOIST
	MBGJW51BGlu/1285hqZDhlsR8E3rnCnsg4hS6QfQwDxle1cg2jkdhTmTBussuNZu
	NXG9Ic4pOUINPIcNXs3QQb0EMnLy/EO+NJTr9WSolFT5R/hniwL99sr/KEpuv8mg
	TWYLVtcB8R2fS/IVg/zBgnTX3O0OTkd7GR0QlIAgO0CGjt/jpnNlM2F8+RXe2IJd
	uC9gyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1ny8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:02:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so1987673a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 01:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776153765; x=1776758565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNl+WzeBVQZNuIoq360g8EtxDOpGB6/PAFoObHglOZU=;
        b=QSwZRoMT6yh3TMGG9HW9sjHIXBVaFhL+3GzTCQgystZWFJMRjiYQM3YszxAJARLJ/D
         DUZB1KJc05jk2sXS+hakvDmKaD3llqwn3e7EcUEiYsIlXp+hjVFSgycSsqEi3EeVxcVi
         8kkxlpD0JW281jyBAk0/bdABWhUVPyvstiJe8qKNSfpVxNwqGRJku34PVtrCQ31c3YOr
         J5Ait99MAvp2AHLGjG21YQdTQqAJoerqQguRgSdyPZZZalS68/JY5HwqQ5AWavuNPdab
         TmEI/w+o4onQIUBlVyaso9O8dwFIAjuiHLfQidEyY6R3pWYgyE1nv0nwUI6wGmQSzTaY
         I5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153765; x=1776758565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNl+WzeBVQZNuIoq360g8EtxDOpGB6/PAFoObHglOZU=;
        b=Uiy6QGTPOkz8eDzQK2YnMKxS4IXyrW+qIxRMhn7llJPxTVy5zyHu3AttqjmnIOowWI
         OyiejHFptLXydtlX/wtNEezKYrnG3DMHFPTG0WEoLYA7Vi82gRZdndWGFvANl5aAyGEA
         NAtU5zwBGv7UzJJpdDVGGK5dBU/SmoRB9op5iRYZXsWm9ilitYEFOx/GV8bjZQtLJRIN
         /DTGvQmmpOb9CqcOBvgUkkUVnnvk18ZuKo0tCpN9Ea1uwE5JOwAqiAE+5cPLftx+y3n2
         gaGBKHkZbPvfuwHmPNiVnSArbKoiPvaht4SQY96g16lK1n6Nk0LkTTgG+buE88xRNe1i
         5cig==
X-Forwarded-Encrypted: i=1; AFNElJ9b5hkwpGN2jVr/lnheHL+Pg041CjiOtgB4V5bkffZ7vm2+ZGxDU2QTFvuyEdQafMg7yieQuUkC5CsyTeo/YNoG@lists.infradead.org
X-Gm-Message-State: AOJu0YzSU5s3HWtGr/efpWuMsqP1KPrcGQCYv1C+R2ZmRNdRlCTv4ze+
	typt1VxiCQnG2pc8TrOEjJ3TFuOvWKfEVUHghcyKreYepr7aFZaCV3zWpVOtXGV5stjJrHjKoeZ
	hIBGeS1BjZRavgzjs2DkjoNymlC3KdSc9qHGaCrWRoCkFuGgSvsqM3XkH3iVeauWuIPgA7ocju/
	qStg==
X-Gm-Gg: AeBDievFSFuxaVVlNAD9m0PASkLyultuKPMTIJYjDjzseolKAa34/lqp/NcPHtaxMup
	xcTNeQHa5RA6fLpnI9UK/DQeOo512wMAGRytYxB/OvtJZ1JKKCzbLcZkYHcfhO84jjwgfnWiOxH
	n17Bg+UqshI7rhJLPzRL/28LpoauHEnQHAoTBGoKuir4bizorPz0YtuWqPwS5BB3REOtCIweKiM
	tJGjVlOsZviskFzAttoy5hAPIRGYrV8zGxoCC4eEvguTZyd+/P8OCtcfULubof3UrYJzAwtNPtv
	tgzxRM500omqKRv9Sga9mfflQppieI6tEhP9rqyrFktwJIXaFaW+lK3uGny7UhZqpeTpFuREnUm
	L3rW3FovBnjLxeaaiiXKF7C4ulNsNI9Eeth/KtkSZlHTOGgd6fU0vwvXQ2u1YCBdLagf/ZG+KOX
	YLLkzoA/r6PQ==
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr16118649a91.22.1776153764497;
        Tue, 14 Apr 2026 01:02:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr16118600a91.22.1776153763923;
        Tue, 14 Apr 2026 01:02:43 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f3b299sm170512095ad.73.2026.04.14.01.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:02:43 -0700 (PDT)
Message-ID: <8532e9ad-225f-46c8-899d-e5a6b1e50bbb@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:02:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NCBTYWx0ZWRfXz3Xu12qo1i+K
 HRg1o2EcJnPxMng6vSweqOgcod87eBBpqMBmnpAcZQNR4tpQQwjZrz0B2I82eW3pRyT4ro4c/+K
 dPgGrrdUyzcPqVTfDARWNBQ+8/8/CflFRdZm1g/h1fXYdGQ7sS2jm35UdSaVXn5ak7kByyUOHfY
 ktOJgImuxaObJuTSt7ilwdIfHxHjE0zUEERBy3FAwPl0K4DB3zjYbxVNA4Js19s945DTr7SJTX7
 TvkmlRffFMXGcXPYi2JXdhutbfYxymekHh46yxndoD/KZB57KsFSOdVEqClPM1lGXqfed6Ysn1A
 Wa0lqejoDahs3cjf7vpV8QKT8JzkIabY6H1Npfx+5zqgJPfAsqVPlEl1ne1zGxXEiAV5xiY78rc
 lukjGjcZABWZiXt2XlCB6hxppl9EQG7ZhqMv8cOH64fIJ04x8DxRNKC6T7eWKhQdtsjxTTy84BD
 WVgJcin5DZP/5VoLAww==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddf4a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=BRZUhdLeOCknMCWa-HcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 9e2Z-D96u5cuwRO6EwuY4oMJ9xC6wkAZ
X-Proofpoint-ORIG-GUID: 9e2Z-D96u5cuwRO6EwuY4oMJ9xC6wkAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_010246_933856_8AA74661 
X-CRM114-Status: GOOD (  29.48  )
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
> The purpose of TRCSSCSRn register is to show status of
> the corresponding Single-shot Comparator Control and input supports.
> That means writable field's purpose for reset or restore from idle status
> not for configuration.
> 
> Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps.
> This includes remove TRCSSCRn from configurable item and
> remove saving in etm4_disable_hw().
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c  |  1 -
>   .../hwtracing/coresight/coresight-etm4x-core.c | 18 +++++-------------
>   .../coresight/coresight-etm4x-sysfs.c          |  7 ++-----
>   drivers/hwtracing/coresight/coresight-etm4x.h  |  4 +++-
>   4 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index c302072b293a..d14d7c8a23e5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>   		off_mask =  (offset & GENMASK(11, 5));
>   		do {
>   			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
> -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
>   			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
>   		} while (0);
>   	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 6443f3717b37..8ebfd3924143 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>   	const struct etmv4_caps *caps = &drvdata->caps;
>   
>   	return (n < caps->nr_ss_cmp) && caps->nr_pe &&
> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> +	       (caps->ss_status[n] & TRCSSCSRn_PC);
>   }
>   
>   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> @@ -571,11 +571,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>   
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		/* always clear status and pending bits on restart if using single-shot */
> +		etm4x_relaxed_write32(csa, caps->ss_status[i], TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>   	}
> @@ -1053,12 +1051,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   
>   	etm4_disable_trace_unit(drvdata);
>   
> -	/* read the status of the single shot comparators */
> -	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		config->ss_status[i] =
> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> -	}
> -
>   	/* read back the current counter values */
>   	for (i = 0; i < caps->nr_cntr; i++) {
>   		config->cntr_val[i] =
> @@ -1501,8 +1493,8 @@ static void etm4_init_arch_data(void *info)
>   	 */
>   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		drvdata->config.ss_status[i] =
> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		caps->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		caps->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>   	}
>   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
>   	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 50408215d1ac..dd62f01674cf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1827,8 +1827,6 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> @@ -1839,10 +1837,11 @@ static ssize_t sshot_status_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	raw_spin_lock(&drvdata->spinlock);
> -	val = config->ss_status[config->ss_idx];
> +	val = caps->ss_status[config->ss_idx];
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
> @@ -1877,8 +1876,6 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 8168676f2945..8864cfb76bad 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -213,6 +213,7 @@
>   #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
>   
>   #define TRCSSCSRn_STATUS			BIT(31)
> +#define TRCSSCSRn_PENDING			BIT(30)
>   #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
>   
>   #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
> @@ -861,6 +862,7 @@ enum etm_impdef_type {
>    * @lpoverride:	If the implementation can support low-power state over.
>    * @skip_power_up: Indicates if an implementation can skip powering up
>    *		   the trace unit.
> + * @ss_status:	The status of the corresponding single-shot comparator.
>    */
>   struct etmv4_caps {
>   	u8	nr_pe;
> @@ -899,6 +901,7 @@ struct etmv4_caps {
>   	bool	atbtrig : 1;
>   	bool	lpoverride : 1;
>   	bool	skip_power_up : 1;
> +	u32	ss_status[ETM_MAX_SS_CMP];
>   };
>   
>   /**
> @@ -977,7 +980,6 @@ struct etmv4_config {
>   	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>   	u8				ss_idx;
>   	u32				ss_ctrl[ETM_MAX_SS_CMP];
> -	u32				ss_status[ETM_MAX_SS_CMP];
>   	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
>   	u8				addr_idx;
>   	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];



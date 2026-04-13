Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709DE93805
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkI4dSza7+hYmnqfpBrsZ+kgGDJBguJz0a0nBnJa1Vg=; b=UBa/41U8+ZZBBOLYaXUfeI7EW0
	h/wpFA2Q2yL4YFD/YWvQV+oJZYv6JnQTtoGBldCc5bOmNnx1yEW6Rj/oxr3WUKpCN0ekvrTyOSejv
	AyFmGCf3i1eTtAIc32j8ncKv5wUBfkET/x3DsFj9X1lGK2Z9cQ7MPilUD2qrEyL0S6MMUS1/s0hs9
	o/gL+p4WJODCkminCKbtTCOE8XBQqLVHJEWz/VKnV9slc9H+Vz3t9w2Wna1cNQfOxClhLnfZOiJHW
	5Ttayxxs15ujCIKjsZxgPRoQ0NIPJEw3yq9QWHyW9UqHNohIIN3rPBPj60D/Cl3U4c74QuisJ/4g5
	OVEg4fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Wt-0000000EutC-1RdY;
	Mon, 13 Apr 2026 03:00:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Wo-0000000EusO-1IfS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 03:00:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CJq3F93362382
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkI4dSza7+hYmnqfpBrsZ+kgGDJBguJz0a0nBnJa1Vg=; b=Fv7mCbNWC3uraU5D
	R0wV3Wcx0VSdkrI5PIgxmdBs11UZt4NtliJgb0IjyRIuJz3O34+lEit8VNLTmMtv
	MbLVIXG3tWJlXxF+DxX85FlI8GTjdZDPAkZHaWJjvEH2F7hWbVRAyFPJ2REUdOFU
	kNH6FbtZ0l/ya1jRj/RkG6gpduYJasGTGhsgXliixtCY0VUjbvDh/GZlzzaYp4cb
	bsP+ZSRgD9sY1sOVxA0sGzmNV1YiIs4z4/VNqSGwdPBD1Pd1Nw/VVeptxom2thF9
	dMEi0x7I68Iq3nLz9xf/DcLjh5LQFs6yma4UKycvJzAQ3ZBYj3diPrWtPnoFbDK7
	GfMEfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcuemq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:59:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so4048733a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776049196; x=1776653996; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkI4dSza7+hYmnqfpBrsZ+kgGDJBguJz0a0nBnJa1Vg=;
        b=S4RuG//VP0xEg3g34XkxOadGQxD8sMDxYCvlYzs99hPUAyXW4OTL4qwArXc/YgM7uX
         VEgzy7XmGlFQvqa7czx+d5IYgJEWNlf+MlLvHUS9/KdlsrwnGTWbykXEBzy0Za+Ahw8L
         n9EdqpGj8vXNrad7dH6Gn1/mhqubhLuuz0XY7j+CHCtjVayucymFK93o3G2hq/8iKA9S
         C6wmvrbfMbcq8elyobbq/CSRW30+jgW8BSeyDrsVEqmKCtf6A93z2OBr4pB6z2YiEIws
         e9V6OXzB/h6KETb+6wpUmZM/b2pzs3SgI/LzoDeicdtJltWDAEGValb0wj0oCo3PcUwW
         9pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776049196; x=1776653996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkI4dSza7+hYmnqfpBrsZ+kgGDJBguJz0a0nBnJa1Vg=;
        b=CNAmAa5qxva0+VTAEsNxuy/xjj/TvATGJl4apCKVOTmJ+GkX9KWqAoyRhCw3App11r
         FqC5XmCCnuvTud/iz4kFuvVO4DnzXPdDrAmzMyOmOS+vKkOqxa2nwM2PO70kxiqKTElo
         pNJXh6YE0p4rlJHRjTjLiDUkIJ27axyR1EwdM24MQ6fK6gyotlMocFxxLlTszhJ6zvXW
         SeeUDlZuke0RyCQcm8wmmtTsbdGI5trgw/k2q3EcFfPqbQUqXEKxLfmk5B2xlf6yiA25
         D+rHiUSSQPnCQlP+h2eM0GAKL9rGnNQgQZLLPts3k/t869mdrGZqfcChM0+vbYzjmWEi
         Dshg==
X-Forwarded-Encrypted: i=1; AFNElJ+g521qoz91El39RIia3NVU02p42FFvr5+lvZ/JniM0tBYJkX4p2DjEV9W7OfoJG2pKjekZzM4c5wGHm0n1mNa1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ayNTEYlbupUzQuFAdjttCtF+0g/nSUNE1w5nl1F/HAUw3Y3+
	aMrYDZu3qkAxLj/1QJSEk9+SK66GfiCRpffemADxqO7ajApPw7ic8Lkxk1pIk3k65+O6DuY8wlB
	Q/PQjnc3hwJFswkxn8U7XfREdpfn11Q1/m0pKwPvXR5uF+IBIzGBZBQVhMkGvNnRBL7AjjJHCnC
	9Lt+iMovcGdj5X
X-Gm-Gg: AeBDievam/N0fXldgrrql9VXozZh7rOZeBvb7jrl+ND747T3FqAg+0D4rXIwDVQw/1s
	BTy+287EIuc4IqDliep1YzOshn2VsTMSzREzR2NoUKf7mbrkTNvNxXYMiPhXJPXeO6Iu8xg44yU
	KaF26+D42HGYSewBfXtKvlQ7nFJtoWH8Rwi8ZlsZOd6f/arGUK2TrYP/QxHlmTDdeIvtl1OtTGZ
	BML8o2IF4MKi9pZOZ/HHMLNoul6U+0rh6DfReccPCoTVogrXf/1Qs3MMiTExUKg3GN7EIrmERul
	7N5P0RF2kVTK1BakBHYa4XknvQX6wSzb8w8SApC8WQuEIFxMhYRFZjJFNV0qU1RhpNYalmwVQsw
	06uaDrQDRpKqmAMm/2naF9xCnwy35OqU4aTY360OHPdbSskZKhZtEsGnNJLkV5C2AH3PCZlZW7T
	JXpznWiA16kw==
X-Received: by 2002:a17:90b:2692:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-35fb4c19506mr1897435a91.13.1776049196071;
        Sun, 12 Apr 2026 19:59:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-35fb4c19506mr1897408a91.13.1776049195560;
        Sun, 12 Apr 2026 19:59:55 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fb567f63dsm1998851a91.4.2026.04.12.19.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 19:59:55 -0700 (PDT)
Message-ID: <f426ea8a-58ac-4d0f-b56c-c21f88eb863d@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:59:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
 <20260412175506.412301-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260412175506.412301-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAyNCBTYWx0ZWRfX3BcHXo3HfGfu
 cl+/RQmIKK6joTJeURRbwfYNwE6Uyhmyhko/HlgTM5wFDsMIiMDCo2dxFJ1Z/FZAkm7Uc268g3o
 hggvErVLBSxRsxZULCOWPD2Bu997lfBpyxhWeylNz4mPILwvK6GPv3jGukpk4441xSiXKnZg1o+
 YkGDzwqlzAItZyyXnotc2/xx5EDN+K9sHBGBOgbfJ6JL8H1d/EfmuQyf+CGRLl14qs425junjyy
 B4DSrIkRa74czbBk3n2olEGsW/5igbeJsWJxAVnZe6Zj6VNZODed4a+UEdIpQKbaVeHljPvFGpk
 xHfGdWkjrgXbGtfv3dgaSrlXzG+N7QCQ6ZbDFSut/hohY1jyXzMkiL/2O6kwxJUQkg90w+iSlGK
 Avs+IUWwovI+ch9YcEnN4Q5twvmR96H3ZVsXZ+0wMaJqpM3807xxjvAiVrgfsl7Z6wfzNfCeDqx
 h0IrYUP4gV/XDIXbc7w==
X-Proofpoint-GUID: 8Z_yLNzUd6YvBJHGE9vDHINfJDFXD_CX
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dc5c2d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=BRZUhdLeOCknMCWa-HcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 8Z_yLNzUd6YvBJHGE9vDHINfJDFXD_CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_195959_415105_5E6D1096 
X-CRM114-Status: GOOD (  27.90  )
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



On 4/13/2026 1:55 AM, Yeoreum Yun wrote:
> The purpose of TRCSSCSRn register is to show status of
> the corresponding Single-shot Comparator Control and input supports.
> That means writable field's purpose for reset or restore from idle status
> not for configuration.
> 
> Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps.
> This includes remove TRCSSCRn from configurable item and
> remove saving in etm4_disable_hw().
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c  |  1 -
>   .../hwtracing/coresight/coresight-etm4x-core.c | 18 +++++-------------
>   .../coresight/coresight-etm4x-sysfs.c          |  7 ++-----
>   drivers/hwtracing/coresight/coresight-etm4x.h  |  3 ++-
>   4 files changed, 9 insertions(+), 20 deletions(-)
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
> index 8eebb83fcaeb..3cc1ca76c933 100644
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
> @@ -898,6 +899,7 @@ struct etmv4_caps {
>   	bool	atbtrig : 1;
>   	bool	lpoverride : 1;
>   	bool	skip_power_up : 1;
> +	u32	ss_status[ETM_MAX_SS_CMP];

Needs kernel_doc also.

Thanks,
Jie


>   };
>   
>   /**
> @@ -976,7 +978,6 @@ struct etmv4_config {
>   	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>   	u8				ss_idx;
>   	u32				ss_ctrl[ETM_MAX_SS_CMP];
> -	u32				ss_status[ETM_MAX_SS_CMP];
>   	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
>   	u8				addr_idx;
>   	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];



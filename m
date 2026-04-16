Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581DF433E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 05:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F6Azec1WYo+9bbBakMF5My1/jTHBTGlfYnF5W0e0X0=; b=L+2gCttNrw17oW/NP1pUr+jDfK
	j426r20hoJc6ZN+DhBop7pAy2XHM6cth7Bq/SAImLUxzJToHkG5tfN4BjonkQbs1czsBTCkm3dffe
	/DIlNyNeazRBMMLZ5SxSrH4QTBUkBYF8fzEL5MvhafsZfx7HqlAXEl+t3FDyuUfeHtAIGIp3ysFeL
	BvwGr1Q0UuFYnTl4D762zN2o+8Hj93tni0RDrg3lZ/jXXWCn7LYLTSukJnLTjOgrQORSaIWgaKDkl
	BygxVInpnL1Ojgi86tl/aMq+N26JJLYnJXLlVb81SIk8d4fOtdFE9JJmZJjULYJmXenCoyHjvOg2l
	nxJ856wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDFV5-000000020f9-3PLd;
	Thu, 16 Apr 2026 05:42:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDFV2-000000020eo-3jRk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 05:42:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G275X51792394
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 05:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8F6Azec1WYo+9bbBakMF5My1/jTHBTGlfYnF5W0e0X0=; b=G2Bqbrjv/0/L5Qvg
	rwdOFCPgjHuK/trUWLgs0jKHP/az2Php/mdXUhSnwlwNfdRZbIvX4uvolBaEIvf8
	+DCfjpz6D9m7VbJq1s6fzv9tLttfpvAmqPb1rlIaspQIZKzKCSAN71TDHiSUtxQA
	C6XFMh12jLUhzbx9eIZ0mxzQqeYTLR6vfiaQXH7mbPcj9YgcdMHRBOPCCb1IKQII
	HCLtj8tt2sYRGaVLt6khPnXAVFiSTkJbFmq6/V03rRLcvJlKX4gVslGqOvC/5yyz
	3r/TkOhGgV8pfqvzDBFKNXNvovQFILDjXEnc9gSSqtfCZ8Rf+sHaQ1lMklqsvs0+
	NaTKQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd5ptdgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 05:42:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f220f1dabso2981999b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776318166; x=1776922966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8F6Azec1WYo+9bbBakMF5My1/jTHBTGlfYnF5W0e0X0=;
        b=ceS3nWk2oWB/gP3jATf1jpq6desFIiwkVUTqrApKuFlVc5SWrrv64mru7iwWtyYnUU
         HbO5J7PtJs3+TOVqPw8uwnPNstXSFkp+8SiGqzCJR98dmdSQicaJMuMrVCTAYQMfxAoO
         38f6dH7y4T9tuZu9BBFY1TPR7o+m40lHgLcp4J+uLEVCgDl2nfJakNIsTFieTuVwtZki
         bYIOJPgZyu/3c9vismfxTRaxEa93UMbaoERlN+4OjcZX8Z7EBtHJcg7+CKnNX4nKowSB
         z2o+F9CYFvmDdALrBPOLGT0zf47pzJdxB3y5rT3rougLqF/VELq48vMh+sxHdxlhiQ8V
         nOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318166; x=1776922966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F6Azec1WYo+9bbBakMF5My1/jTHBTGlfYnF5W0e0X0=;
        b=Ovs+9g63Ob//92mP7Hhrns9EKxGl1v5DDpUOlQwtzsG99gbBv3X0ZKZRfcQYIqNGrV
         NvtZk6U9AmyeB/3mYhqDNqruE7LUoMTjSY0EA8ZwV5bphVN9hGneT0LW+ydsASWUh2eg
         MQiHQ9ErZKCIIZRn7HVCrXJ1ci7g0Rxgn6eMtfphlG3ZohhlaV55r1ci0cXQuKKEJq/B
         eWwZ5Us6d8+o7iF8vM4oku5gdY3yMrcbZUzkkovks9cQRFGyRH3C65+mfP1V1KJHT+T+
         5psYLUarUTFNjPBdgGIdt42Y8or6VlO3Fze2YpN2tA6/RoU1JtImaCwD1qn3W5BXB2Gn
         kYQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+G7W0ajoYGwVLVgLzrbL/A/jgZo4QwFLTQIxlwYy0pvlGEC4PLNlBognxP+Pv3CUyh07uz0t4YAWuU3BS8DEzt@lists.infradead.org
X-Gm-Message-State: AOJu0YwS775MeIx/vAJSSdt0grHyeCfgdFhLboB0aoiELiSWzs2OD5vi
	YK5JTP0kbn0I9RWW/zXT3y8rFgpuesWNsT8M7U/DPd84nCXLMb/rGQLYhHTMTBaSuhhhqYIQ0Sp
	dt3jH0Hq77H/O0uRrxxFdz5F9rjCfCKOc2uJZ7jGAHqdP0xstY05uuAmSAatyOrNzmxzLJANDWu
	Xozw==
X-Gm-Gg: AeBDieuZGbp1ndE/Y8nDyLdP2g/oirOBSxkD/AdqEoP1DEJOwO1ZLpSK7AEjU/LnE8D
	kPLq1ECDxcfGIKOEsq6RrWhPkfKyH9fqBpCyXwgIJUOqVKIyh1jE9XTrT66NrpsLLUTxnHWS9Qr
	cvuUg/Hw6gN+dr4uQvQsJd0wJyUyZCSfCNEjsX9rA0GIlNNt2I5FaDseRx/reOiAnIefDQTa/uK
	4KTN4GIgzeL4w/jUhrUGhIPP1iUQhMJH1uiAAQlG7KwDpQPfKp0X1dzPmrOk2lxZskAVDYRlInb
	OgiCs5T1BlQisPuj5SCyhWjTe7fj6FnRyX3yBetq3aDQ5LOQKHK9hcKNySCcm8Wk2O344Aho4cp
	eLdniMMeaQUdlaRIw+haJ0Je2DQR70yfkzvvXW4QcSDqbp/sRP8rUsOE0/NwKoDL47+piKmVm71
	rkaJQ7/KUKs7A=
X-Received: by 2002:a05:6a00:12c1:b0:82c:e1a3:986f with SMTP id d2e1a72fcca58-82f0c324538mr25650496b3a.43.1776318165431;
        Wed, 15 Apr 2026 22:42:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c1:b0:82c:e1a3:986f with SMTP id d2e1a72fcca58-82f0c324538mr25650472b3a.43.1776318164847;
        Wed, 15 Apr 2026 22:42:44 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744c923sm3959387b3a.52.2026.04.15.22.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 22:42:44 -0700 (PDT)
Message-ID: <778a826b-918d-4f7c-95a9-1cdb013618d8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:42:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260415165528.3369607-5-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: agOVtpQiV02EOO0Xcvg1oOFyprbj2eKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA1MSBTYWx0ZWRfX91r340ueCv/O
 NK36ULG3KYTobSwKOu3lSc/Yxav7yK5jYssn2eZ41GgetOh468KPQs5th1tDRkLfhL9R82feZBR
 8UlAs51hMCwcJG9+NCUHN5tRH26MQqa0lOByL+NkGw0/2tImtcVXtmmjiCt/vWtKOrJtM1uRQkm
 Wq3lnkmRffvil6adO/2IDyLwvHsqAAIE+6/2IdLEzQmNFmYnf3Is1UJwtfZJ4ikBi2FiCRfsPRI
 qil6tJnKZsDl1OQbNrXv4jbTA8CfB/k6eyej1SjddVMDJCWcJOf74B9fa5vXYa+vpnAx9tjduF6
 dY7R2zsu+clCj7CuojL4sLdQ/7DBFipNjgVWWqem6pzK8uNdvAoR8TJS/Gak5Id/cteqhU+TEz1
 KNtjoL2RnjpBw2jDyQOzzwnQgZlZsJkK2HtvfiONAcqt+ZWdhU0pFR6I3yKSQp8Tcb2iEfbIKYR
 X5iKyqa9zoAU/gslDqA==
X-Authority-Analysis: v=2.4 cv=AcmB2XXG c=1 sm=1 tr=0 ts=69e076d6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=LI8sGVgq26al4nlOv0QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: agOVtpQiV02EOO0Xcvg1oOFyprbj2eKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_224249_052495_0825CD6C 
X-CRM114-Status: GOOD (  31.92  )
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
> The purpose of TRCSSCSRn register is to show status of
> the corresponding Single-shot Comparator Control and input supports.
> That means writable field's purpose for reset or restore from idle status
> not for configuration.
> 
> Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps
> and rename it to ss_smp.
> 
> This includes remove TRCSSCRn from configurable item and
> remove saving in etm4_disable_hw().
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  1 -
>   .../coresight/coresight-etm4x-core.c          | 19 ++++++-------------
>   .../coresight/coresight-etm4x-sysfs.c         |  7 ++-----
>   drivers/hwtracing/coresight/coresight-etm4x.h |  7 ++++++-
>   4 files changed, 14 insertions(+), 20 deletions(-)
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
> index b2b092a76eb5..f55338a4989d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>   	const struct etmv4_caps *caps = &drvdata->caps;
>   
>   	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> +	       (caps->ss_cmp[n] & TRCSSCSRn_PC);
>   }
>   
>   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>   
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		/* always clear status and pending bits on restart if using single-shot */
> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>   	}
> @@ -1055,12 +1053,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
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
> @@ -1503,8 +1495,9 @@ static void etm4_init_arch_data(void *info)
>   	 */
>   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		drvdata->config.ss_status[i] =
> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		caps->ss_cmp[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		caps->ss_cmp[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> +				    TRCSSCSRn_DA | TRCSSCSRn_INST);

Just re-go through this patch and had a question here:

I’m not sure whether this new change should be documented in the ABI, 
given that the TRCSSCSRn_STATUS bit is masked. In my opinion, this 
change breaks the existing ABI description.

Description from the ABI document:

What:           /sys/bus/coresight/devices/etm<N>/sshot_status
Date:           December 2019
KernelVersion:  5.5
Contact:        Mathieu Poirier <mathieu.poirier@linaro.org>
Description:    (Read) Print the current value of the selected single
                 shot status register.

Thanks,
Jie

>   	}
>   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
>   	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 8bd28e71d4c9..5e26c2ec8f7b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1829,8 +1829,6 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> @@ -1841,10 +1839,11 @@ static ssize_t sshot_status_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	raw_spin_lock(&drvdata->spinlock);
> -	val = config->ss_status[config->ss_idx];
> +	val = caps->ss_cmp[config->ss_idx];
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
> @@ -1879,8 +1878,6 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 8168676f2945..db56c4414873 100644
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
> @@ -729,6 +730,9 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
>   #define ETM_DEFAULT_ADDR_COMP		0
>   
>   #define TRCSSCSRn_PC			BIT(3)
> +#define TRCSSCSRn_DV			BIT(2)
> +#define TRCSSCSRn_DA			BIT(1)
> +#define TRCSSCSRn_INST			BIT(0)
>   
>   /* PowerDown Control Register bits */
>   #define TRCPDCR_PU			BIT(3)
> @@ -861,6 +865,7 @@ enum etm_impdef_type {
>    * @lpoverride:	If the implementation can support low-power state over.
>    * @skip_power_up: Indicates if an implementation can skip powering up
>    *		   the trace unit.
> + * @ss_cmp:	Indicates supported single-shot comparators.
>    */
>   struct etmv4_caps {
>   	u8	nr_pe;
> @@ -899,6 +904,7 @@ struct etmv4_caps {
>   	bool	atbtrig : 1;
>   	bool	lpoverride : 1;
>   	bool	skip_power_up : 1;
> +	u32	ss_cmp[ETM_MAX_SS_CMP];
>   };
>   
>   /**
> @@ -977,7 +983,6 @@ struct etmv4_config {
>   	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>   	u8				ss_idx;
>   	u32				ss_ctrl[ETM_MAX_SS_CMP];
> -	u32				ss_status[ETM_MAX_SS_CMP];
>   	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
>   	u8				addr_idx;
>   	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];



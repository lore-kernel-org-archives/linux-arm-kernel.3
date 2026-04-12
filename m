Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BFFE937E4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl0CUq8ky86KPwyUSthJVabhU5b5BVjiqFrGVLMHUhk=; b=3HH/8VaylaUic1PvJaAJFrsDK6
	U/UIP9mou1u5+/zd7ec3BOjUREeUXctua7CX3rk14VAWfiM8kOcxfRqJ5Kbr8TVAzIQ+LhYnhRHX/
	p+vmFDnKSMmpmSlALJPrD+Y6urvGGtIkyL4mhwL7rATP+a4PfCSPUzfcHbKEkzxUNKzfT47r2wvFF
	k6TaWfcVC8CIqGmySHEaBT0ityD1kizMrLgva4riOIn0PCAvU+7MVn4UdCWzrkFtbruCMMoth0zeW
	qIqQ+pnC3bboI9r6eHGNqLm4IKgpF/w+HLRv71DF082cnx6fDF/4vRFm8yFkB5oEHlvaEVP/RNYU9
	Y7tA5pgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvz6-0000000EOnG-3RYR;
	Sun, 12 Apr 2026 14:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvz3-0000000EOmu-41Wv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:40:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE50iD543238
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl0CUq8ky86KPwyUSthJVabhU5b5BVjiqFrGVLMHUhk=; b=Hy+g8nAY3P3dN8Sb
	EzLmJUzqFbLaO+TFCpmLBpnbk8lT4kt+Zb+zSvVecxPf8upU7yYBnyAjnu/FUfrW
	ILYX1f93QP10U0wZht/CpiapN+exsTlJBlT9AxVD5DzbQTmGeusf6Xk3Ievbm/c8
	Fl98UKsX/3hG0tqTxrYha2TwcAeS4/0dI5dRN8WazbBHu6Hw9ULTdD22kxNMWyUa
	4EEM24i3NS02r3Mi88cpl/Ofs5aeGlup71MBaytZl2fh/SN+l2243B2wc1Nfbm8Y
	J4C28IHKh4c5SvJIKQl+l88RVhcSuvZLU+XKy24M4njAwjmnpLNQr2I0Sp5vMvCp
	04n3ug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexftg7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:40:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so2363107b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776004819; x=1776609619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl0CUq8ky86KPwyUSthJVabhU5b5BVjiqFrGVLMHUhk=;
        b=ZezyQOmauhwis5tT71rEPAh06103wrv5o03aE4m/Lp0bhAdA+rV2XQesdobME+saIi
         6iYk3agr8TXaauNnrVQcCqn2eUaRsGCTWwXQWvgUoQeruW1sH4znJmpwsZ9c3LFNx+0K
         SKWAEicU7QPly/6TzepBO8voKhu+hu+RkcDAUaiaMXgK/Gw13L0Jtk0tSDnAQk2rVyGa
         B+h05fo/WvaUVueqdBDND7zvpe4C2QH7505vQKWXup0IRkiWaYKfxbLwEOkretvCckvV
         uuoZfGnarf/IYSFdQ2RGUvxQB/H0VbxUuyqDFU9pH9LudMvjsvklEXm/3ioQ7zvSTkjD
         PoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776004819; x=1776609619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl0CUq8ky86KPwyUSthJVabhU5b5BVjiqFrGVLMHUhk=;
        b=IJCT1btQxL3tMo0recRGOGE/ahm+3W4zhchJlaryS4pFaun0TsvFJ0KXQIK6uT/1ko
         51/aT/WNo2XmJbJPgOWndsDH3r+jHuQ7eOlLDQJ++VDkIwqCBVxywapL0xS+trrrfyON
         NmHsqIOccrbLceVYZIeoqJafrcu+cj6Oueeh82/bOiAkF2+rihZzNPfZIcq8s3Nnxo39
         DAOLmBt2ndzhR5QT2jruhlRl1SIjxaDnDA7pnOnitqjfJk9xSMQNrGvMV0lAmZ9yh3WZ
         Bwqb1Wy/unwCFtkpMavprFulemtqoQAz7IV5EWjFELS9s2ztG1pCzBrn/WoxIs94hu8L
         CvNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZyxANCarQYBW8o1xMCnbn2Xm8J5C+HbzWmVS7YQ0QUPE7hUysBAb10EKd+uqdHGKxwh84ge5E+G6sUgCBiPQe@lists.infradead.org
X-Gm-Message-State: AOJu0YyBGaLOTgWLxQ7xpdCQteraOv2rKMeRF2HtiUyHb8aqbPvYp9Wt
	AOJcvWTdoHgY2UV3K5IzfHOP5RV0EvzLywEabvR2EQuWNTa+g2LI8FDjPMCYbukU2d621LxyYsr
	4kpn70sKhurAxAUSrLagt7QnQc2WjsnJlGTuWtGZlMqW0IxxvvfXJgo0rfTesUHjn+5s/xz+lwf
	78rgb7aIhoDitm
X-Gm-Gg: AeBDieuFjc5HWrvr6VCXmCo1Hn5/GQnvOhqckk4XWAJ10s8J+eF1LU37BtMlUrEGL3F
	pVOvG5W61FaHSVVQsYGB0Gj6vSbTC9PtYl2RKLFg+bFIJbKfsnuP2WRQKwAoYK+bkLc5dcwwPsa
	9dJFFEt6EW4kweiUFVC2svNiUeSIgJnKebxzE2wVctYPxN4klHo8m+Fv+8XT2U06ZT7TpxzK/iF
	DfyUVEG52YEseS/wE7hOFrHBfQLxmASPl441oB75EZy0N65sCdWZuKsw1elDMZdg4ot2jhYv7yV
	c2SB3PoY78z+e0D1t2Tp/cFxAB8G2rlIoAOgRsXsEzPpG1NMqPkCQskR/JxGNUcm3FFdQ/6ulXX
	+1HdOKUdJpSzMhqcyk84lwGtyr3y8ce9u60/qp/cqvTxIadT0icUDqV15Le8UWcRKXUtTfllz1j
	f3TGl7EFSqcQ==
X-Received: by 2002:a05:6a00:1898:b0:82f:3733:2fa7 with SMTP id d2e1a72fcca58-82f373336e5mr1930723b3a.34.1776004819216;
        Sun, 12 Apr 2026 07:40:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1898:b0:82f:3733:2fa7 with SMTP id d2e1a72fcca58-82f373336e5mr1930708b3a.34.1776004818643;
        Sun, 12 Apr 2026 07:40:18 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm8221643b3a.58.2026.04.12.07.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:40:18 -0700 (PDT)
Message-ID: <a8d11f92-2af8-46e7-9098-18a835c6ec8a@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 22:40:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260410074310.2693385-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e_PT-KCpEhL6G1owXIRufYOqJm-SirWy
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbaed4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=BRZUhdLeOCknMCWa-HcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: e_PT-KCpEhL6G1owXIRufYOqJm-SirWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE0MyBTYWx0ZWRfX/SfGVy+gM650
 XQlo4+EEZsz7/tiLKw3ZHg6ErFRLB9A8n/VkWRTZdtUmTloHI61QaEjazPQuRo261jSciXMsIpJ
 0eP9tW+jRCT3AYiWgTnGPFVs9jXH4wxaO/rWl6xFV6+WkHzRrKz3oclxRe4i9TNLwYkh5PaRKMF
 Nj6azIEXdGFOYmN37txatzU42afqQkCNsTF0IErtYZmS+u5P3aZmGXKH2+5o534NfBPAffEQno8
 uXCbm0ElBYcHJoIHVbOMSXJScXvL0DA2DuwybBOZfzE6CHTEimwN/2KCCkzg3I04soFTKlrvKir
 7nEQ31IhhPhZvGJs5GQW0AT94djAjNZYERBLSHkEmDhGn+0+c+XAgmP2jBoLs+fnOS21zfIwgsd
 0Jtn/YHRpldmk9FaXFH4E5QK5yaofrPD7l7z6hLyH4+F35RMn7xWfp56yavjsxaSEtcCm0HrACm
 gsWG846LGH7J5A29NIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_074022_151450_B724E3DF 
X-CRM114-Status: GOOD (  30.22  )
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
> index 6443f3717b37..b7abb171f523 100644
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
> +		/* always clear status bit on restart if using single-shot */

the clear step for the status bit has been removed. but the comment 
still here.

I think we cannot remove the clear step. The hardware requires the 
STATUS bit to be cleared before re-arming a single-shot comparator; 
failing to do so means the comparator will not fire on the next trace 
session

Thanks,
Jie

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
> index 3d5f343130bd..c794fc9de5b6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1832,8 +1832,6 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> @@ -1844,10 +1842,11 @@ static ssize_t sshot_status_show(struct device *dev,
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
> @@ -1882,8 +1881,6 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 3e20561672dc..57508d301327 100644
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



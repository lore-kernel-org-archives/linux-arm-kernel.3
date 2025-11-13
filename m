Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CFCD5BA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=; b=HOCHfYtVRWhGxFb9lFrMWHjezQ
	PsDPQ02H9SJK8YU9DfQ8St3ECWuWWffy07CcRASbyZLiETsORzWwfD3iSXUIwOXuw/XtPKqWpZQz8
	D+vZoXJQUGSSMo6iyTvyMCWhRDdO/fo5hRI3rTzrRZi/ItX3FMMODCFuT1gA36ZgU5fHSdOjtuchO
	GnOYkvMZiIMKv1GxOksCOj4QlTx3OHqxbPkeXnrf8E5+YoobAxr7e1TpRXqlrX6m3AXr30NzaP+W9
	E05xASMZkXt5cOK9gIwGJAAjGK8qDF+gKxRo1mUYGmJ062PYP2NyyDAw1nJP9ON4tZTAhQY0g+S+I
	c529fDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTr5-0000000ADoI-1yzJ;
	Thu, 13 Nov 2025 09:43:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTr2-0000000ADnq-3K1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:43:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6qc1l3873621
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=; b=UA1XHHHd06fGc5oj
	UDE+8yWJZUDMpUakkDIBVnZ0jGSLIw1/LrjbR4g9fysnT0ovoqWOW3Ndpc7EpCbb
	HGdAgKMXxXnmD+Cc2QrNEqE+ucptu0uYQ0uHQ1xWmVTsw2TL6sAFykqfnhw2w9T+
	KjDzxSIR32k7vnh1wz1Rlhi5UvNBFaYzkMed/JBioNpx3Tf3bq6XtX3O925XHiML
	7Lm4wL6pT6JfytKQ5RepsV03igwJVXDuZGar3glhxLxtkhNoBYuSFs8VMSF3BTxJ
	yadKRTeBB63jFiY3i/ojJyr1bMOmIm6W8Kvmkf7oRVSYdY8akmubSoVY/UdiKZYN
	L06QZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaeurhdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:42:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823e9c63c6so2060236d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026979; x=1763631779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
        b=jOcVhA2f+nqUUooXmdo5gZdXboGLDMDE56p7X4LOXholQfjVR6dIIvH3p+qCMAebkG
         57jSAtVHXh7+D2JK1x8KDvfhxfj6HbaCjvhmtlok0nJjXraUeMrXS374JnaMif1IY7TB
         hcW5rSL8/Cxu+RJ5rtNlPsc2TQzLIxwLN/lxiabdVm3Q+6BkFU4B5zBzT9z88FRTGJ1f
         RMC0d/LKQ9qJVVtVHVpmQ05IEHkmS3UFlAnAVuuL7GPrT+KPKTzUadxDvcyeacoc/Iml
         PkOFo8tJOprLD+NdYjR9PaSzUHyGelx/YrZ132pzoc9Cj8RPo/HlfQhdjKRtOlyikjpN
         L4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026979; x=1763631779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
        b=OVFyid/VUVVqOtpd1rtH8MSNLeHzzSiOPmSbzJYZDte7Y10btXFXExnl5JW6qAvYbA
         uMPGkhEhQRrOeAenCPMGj9ZKJQFl74fnublNknQgAJUnfTgYQrYm2MrDn2W3xSYrNsPp
         FOGCOXtdE20wRhWgjGtCSC8S2iR5mdC7ZfOKQvyIbYKa03a+7B64fjElrMUaOthpjzKB
         5pOeGjh+KAJ7J1bBZhJd0P8RleUBpoaCJH6JiECFYnpB59vcFmNgb9N58OyhuYBwl4/a
         3OpT7dUAyOX8dEdHpIqb8eUTQULpdf5LIxCTQaarkDAU8KnKAG56terH6hfzX7USTAzb
         hCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR2N3IHdk/3FFk9IK8/9tswV1eGcBm0rBkCjwUL05sJsytytQlf4uY5+zOjSWKWbJgw/8WgQDIqW0TZl2jmLtb@lists.infradead.org
X-Gm-Message-State: AOJu0YzOLUYyyH2vDeKWI2Iezm+uOm6PfQiSbKPVZDoMJOmy0mSpfX2D
	w8CAgRRXPjYVOHUj7c3YLXJ9Jt1WexsoXFvjDV1rj5SEHP9+3yMz6sHR3KNSJvYdGYkd04Ueuki
	sRy407RdKye/8CNcRAaBm5dWDfvRstQ1uu7i0NrQLmyeZyRYjZWPBkXt9VqslaatcdVal1jCZMC
	LN7Q==
X-Gm-Gg: ASbGncsk5LqPKKF/V/vVUXqkKO9d+Ajd1SW8O9ZvdCBJVpPN1EWyDEVs5gMwAEbVHdE
	BVLoL1JzNYfa1xgR2mJNKUImxxl636mHV7feGrzzy+lfWZO+vTXwg7sQgnW1baxNwhyxIfOWD7g
	6EW6kinc8CY7EqLgsvdt8n8McmLwEoVnfm45XivmpCvPqZ733+UKk8dRf4pchIRCAYWHglr4rlU
	o48JgvFp8taOOACYpfJYAinETDDFwfi+9BrKFMZrN+t5Vi/A7FnCd9TEv3AqzvSxtWdQRsZ2X2T
	uXr7EKVijwb3g1caxVZzDJWCl+W35GZiSub6bNRx75nXPgocRALrvWc+6E/58nqifRQGijI9REA
	ZC5it8KxJv98KxdOrFqxh4AYeOu1k8IikGQTQ0ksU3FjfH+Y8CDSuBpwo
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id d75a77b69052e-4ede2845978mr28815961cf.9.1763026978839;
        Thu, 13 Nov 2025 01:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvKWw3IiL7wkrQy/+jmFVdR2o6TRc+eiHUU5enpTNDh4j+/qHBb66cMr9ZJ4pw+AV310uIfA==
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id d75a77b69052e-4ede2845978mr28815661cf.9.1763026978200;
        Thu, 13 Nov 2025 01:42:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac667sm124168766b.58.2025.11.13.01.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:42:57 -0800 (PST)
Message-ID: <fee56a54-5da0-47a4-b8e3-7ec01e2a1559@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] drm/msm/a6xx: Share dependency vote table with
 GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MZhG_Ka4rePSmdXfXiLdCZhBGtyYaXaz
X-Proofpoint-GUID: MZhG_Ka4rePSmdXfXiLdCZhBGtyYaXaz
X-Authority-Analysis: v=2.4 cv=JPI2csKb c=1 sm=1 tr=0 ts=6915a824 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DqcpYa4PS6cT72Y9dlEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3MCBTYWx0ZWRfX1vzZdFY8KxNu
 EBV248F/TqgjuTg4WPvDpCdqwRnp9RHvEnpDy2qjRWpS/dtrwtwywnXO0cF6lQGmrJB+Bc7gX1F
 kgTPTBtscx+cGYn3ik/PXbTrxVerm2SY6LvDYQXxdinU2lHDGPrNvvcyu/iCjRpx3opyr7f1fmO
 JP8QfdvKUJZ27Y5Cyu3FxZ0VfZkHsa6OqI2ryG9EToZxI6sEFXGy56nQKgRuaap2u7oC+nXQIJR
 W/iMy6zYjxX0Ker1BrpCLQsk0aYzNw5+9oqcNu/k653e6TNADqB8a/ykRWgcHzX1bJ32tpycIas
 HbTz5iueIOmA90mWIGOuypG7+rgjrjYiq7FIZZPiUK1Af6AfiQoMPgHfb5CsN1hnYIY5/eB/dEp
 9fZXMYeMdyWBclg4VX4FZfJGLbEL9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_014300_852299_62859C1A 
X-CRM114-Status: GOOD (  26.03  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x GMU firmwares expect a separate vote table which describes the
> relationship between the Gx rail and MxA rail (and possibly Cx rail).
> Create this new vote table and implement the new HFI message which
> allows passing vote tables to send this data to GMU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8597d7adf2f7..396da035cbe8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1591,6 +1591,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>  	return 0;
>  }
>  
> +static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
> +		unsigned long *freqs, int freqs_count)

Checkpatch should be grumpy about indentation here

[...]

> +	/* Construct a vote for rest of the corners */
> +	for (int i = 1; i < freqs_count; i++) {
> +		u8 j, index = 0;
> +		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);

nit: reverse-Christmas-tree would be nice here

> +
> +		/* Get the primary index that matches the arc level */
> +		for (j = 0; j < count; j++) {
> +			if (mx[j] >= level) {
> +				index = j;
> +				break;
> +			}
> +		}
> +
> +		if (j == count) {
> +			DRM_DEV_ERROR(dev,
> +				      "Mx Level %u not found in the RPMh list\n",
> +				      level);
> +			DRM_DEV_ERROR(dev, "Available levels:\n");
> +			for (j = 0; j < count; j++)
> +				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
> +
> +			return -EINVAL;
> +		}
> +
> +		/* Construct the vote */
> +		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);

FIELD_PREP() + GENMASK, please

[...]

> +static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
> +{
> +	unsigned int num_gx_votes = 3, num_cx_votes = 2;
> +	struct a6xx_hfi_table_entry *entry;
> +	struct a6xx_hfi_table *tbl;
> +	int ret, i;
> +	u32 size;
> +
> +	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
> +		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
> +		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
> +	tbl = devm_kzalloc(gmu->dev, size, GFP_KERNEL);

devm_ only adds overhead here, there's not even an error-return path,
go with regular kzalloc/kfree

> +	tbl->type = HFI_TABLE_GPU_PERF;
> +
> +	/* First fill GX votes */
> +	entry = &tbl->entry[0];
> +	entry->count = gmu->nr_gpu_freqs;
> +	entry->stride = num_gx_votes;
> +
> +	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base+0] = gmu->gx_arc_votes[i];
> +		entry->data[base+1] = gmu->dep_arc_votes[i];
> +		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;

This is essentially struct perf_gx_level with the ACD field recycled

> +	}
> +
> +	/* Then fill CX votes */
> +	entry = (struct a6xx_hfi_table_entry *)
> +		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
> +
> +	entry->count = gmu->nr_gmu_freqs;
> +	entry->stride = num_cx_votes;
> +
> +	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base] = gmu->cx_arc_votes[i];
> +		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;

And this is struct perf_level

[...]

> +#define HFI_H2F_MSG_TABLE 15
> +
> +struct a6xx_hfi_table_entry {
> +	u32 count;
> +	u32 stride;
> +	u32 data[];
> +};
> +
> +struct a6xx_hfi_table {
> +	u32 header;
> +	u32 version;
> +#define HFI_TABLE_BW_VOTE 0
> +#define HFI_TABLE_GPU_PERF 1

Such defines usually go below the field definition, not above

Konrad
> +	u32 type;
> +	struct a6xx_hfi_table_entry entry[];
> +};
> +
>  #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
>  
>  struct a6xx_hfi_gx_bw_perf_vote_cmd {
> 


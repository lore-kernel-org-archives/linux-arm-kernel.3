Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B51AFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 01:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=; b=Sj2vexWYBShvtc0jW+9+flxOM0
	xGudn/WJ/OQhAQ9gF+B6lqduSsLw9HUviMeAy0heoYVzOU5/HWVxmklF3pQBMNS87upnXiaJiyxkW
	iXAKpDiMygv7oMMqQl+8mUcTwWL/KZagSo19bQIHSk+etcX3p+LbCjhHv3+Dbv+gMLUIVVWKtPrdo
	febFwLmCOAqvCUYztprKWlOCxgqNCO9Fjoi1wvfb1h7D7UEFX7hxZDLzKKWqBHzKbzGJDel06dMc7
	sieSKR2AIjNk8Pv6cWh95OpbSFdJyTw0shf9rNgIwV7WFKdwa5NobQcFLjPo1+1osVNk4eIltb9Nl
	3LQg/5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHB5D-0000000G1ko-3ViD;
	Mon, 27 Apr 2026 01:48:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHB5A-0000000G1kO-3nHj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 01:48:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKfCte3561000
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=; b=JDDLvQgKjeLByiC0
	+MbdNXKomnjUXBqW8pQ6t0HF++Z9xzh0e2OZdve1qdbEG9GviviveuEpwy+Pk6TR
	+9oI85cNri2o02XuAUMJBcw1tCt1JlzLU7GsSgXRNqEwIjy13TvJiHTW5QJHFg5F
	K6FuZjpnhxATZaUTvJ+P/kdpaS9xSNa1rtC+49fXf/zVYukSqpUaIAVq4E5n3Q13
	OaEMMBT+0vdUojIcSIMD4hsOokuLvTkfh1/aa+PVsuK899JG/Zz5ZtrTwwlQsDUG
	wXvRsgjFdDX0yIxnw5rzU+wxpblnqlfCyvXan1miuwiblma8DEbhtYxMS9Ib0hJd
	hFcNkw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3y3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:48:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so74299125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777254497; x=1777859297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=;
        b=J11h1x0/ALhQb0R43+WNkei505bJUeoWD5I/DlwG4aHg8xlkkS4oR9aWiTeqirRczn
         Z1Vk5bt5CZTAxIs5z1gzTOWIhD//Lym130bCbxrwYo+0hwtsLHkExh0ocyprJYYxeroG
         Dchziy3fE6VieqHwV2HDsPdYid1n3oeABE7SNU1HJM/NrISZmzRaUbjG3MNl4Bee9nb0
         kof5VaiUmIxyWBCNQXk13C4LPnVuTpAjnEBXZ/TKG4UIJIA34Cnz/aS7LJvk+9sluAoH
         E9TLuAvp0JAhLVL5xIqcndGm8wc1aEOLN/7KCxt1mtQ0KgpXRthdzjFuV8pvfw717rJE
         5zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777254497; x=1777859297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=;
        b=aE7oBAbHMGeu5tvsbx175lEocV8HoPoQ2mlO38SDCtEHF3iKBxa9rlU0/Fm6d3+LTx
         sClY9nGQZ7KmMbZEXraskU61Soya1UOtbBqJUqX4YeYtP6Kw3sn/w4HnfGpcoyuofY83
         Rv+y7jta5MB8hymjGY1M5S8c+nzDsui4c+pn7jM/say+fgziITqUHbD/dHPYwW+5HBeS
         vAWzyxWD03tpZylptyebxUyiXRU8+2D8VySE73xOAgWXHQWw314Jd27c2Zz9xVQEv0rL
         H7hiDMU8RAQpv/GL+LjKobbMYb/x4HBL9jvISx45ctpqiHNo4v/jym/S45Lh6tWC/5lF
         oBZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JZW8asamL/q5AZcMNkG/bAudcBbvWGhdT/peDYxAfkSIe0k107o+YVwYjVCGp3BOKF7Xiz7SqcRpBF1ddu/cW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc00ImDBQngzmhXn3re12fzvMKlZTH8buipwgNa4NHKvV1JfUl
	gwuG6WkgjWpeEb7Wf+A7UCahlBFaIL1KPnCE2vpd7tktZVFYLIXJ7PgUxV3UD/TtN7wZQ5H+EuE
	JB/z9vs7OGxWYNOwYBrKms8K0DsWf0O2w1TyIe5j+XzIdALDYI22uF92cSjhknYy6bzOamOPPTp
	TpSw==
X-Gm-Gg: AeBDietUKkZgu6lyRNj2BOay3WCmbs7QKO2zhXsmKiHHy2B2AkW+3N06Gnghrb0O1gk
	zxeAr0TDqw8KhNCcvzbKvlC2lf9IPTbyLLGyt0z/xy5sTaRu4dsK+oHRHG3XrxHktLXo+5cBsoB
	WGjfLYT2r/hrk1CKBMwZ4wscN+Fa9Ynp1rgtBznYGlGyjYQhAu1f+KfHLb/5BSPDko+IT37IG5J
	iSOiPWHUZQgbNQUKQ8vunj7p7PCwYk6ww35jVB9p2OPEMHLv0dLTDMysRyboCbYrLSplG996Rsu
	H9GFck4EUHHNSgF3tD7jw7IZrO3pRttdv6KusO+5lRd78JeQWUXQYakljklek2lNVsJstsfIypd
	C6KDuwrbtPh1TVt7jMpxr8aqBUfJTFdMe5UQ1HnDmRCHSd7Qu6IoWwp4wPj6+a704n40KzP92OG
	GhqJYR93yU/K1Cc/IWxoVd
X-Received: by 2002:a17:903:1450:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b7a3505063mr163890035ad.10.1777254497102;
        Sun, 26 Apr 2026 18:48:17 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b7a3505063mr163889675ad.10.1777254496415;
        Sun, 26 Apr 2026 18:48:16 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0caf1sm304225505ad.42.2026.04.26.18.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 18:48:16 -0700 (PDT)
Message-ID: <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 09:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNyBTYWx0ZWRfX/xxdnd54NR2E
 JZqtqPZjiAQsIbt1ZSk2+1v6kTb00mbuAwXBomrSAE8NyWYMzhpJrjIAAmSZX2VIlTwGIA8rA46
 GiR2INblxg1k9AM6T3fO0TUvLVCmIHP9x1pFUCsixydXG0fvUsDSlopiUMIyAjIEUCGUTRh38cn
 hw9NOENxMrQeNnf2s7jfOzE90E2hzKhlBQaSD4UrT+GM0TyrFknMo70V8MCMFDaAaytGijI2rI0
 gmIkVgQYTcE+7mVeP+nbw1LkWDLyz3nUr6usynQCRbtUk9GGQVh50ynieXklmTcXLD2LDjthOVu
 uN6A1yY7RG7acoebSUfxPqcLvAWreFwu6vDTXGyaRmjJGzQ0mLSUWsD6CMuXYO3cwrvIE5xQV3p
 RmzwZ3sHJaq/PSXGAGVWY2Q/aQOII6g6XUO45oDpbHVDcGRjLpNLO8ILguEi9t6rzJ25sfQ6KZh
 zQLxwhE9xPh3L6MDAMg==
X-Proofpoint-ORIG-GUID: 58tyepEwDgXdixNk1-nLuJQG3-fQJ4gC
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eec062 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aOqihR9C_jEbX6RSOTkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 58tyepEwDgXdixNk1-nLuJQG3-fQJ4gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_184821_089625_5AB89880 
X-CRM114-Status: GOOD (  25.85  )
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



On 4/26/2026 5:44 PM, Yingchao Deng wrote:
> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
> structure with dynamically allocated bitmaps and arrays. This allows
> memory to be allocated based on the actual number of triggers during probe
> time, reducing memory footprint and improving scalability for platforms
> with varying trigger counts.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 59 +++++++++++++++++-----
>   .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
>   drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
>   4 files changed, 76 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 2f4c9362709a..4e7d12bd2d3e 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> -static void cti_set_default_config(struct device *dev,
> -				   struct cti_drvdata *drvdata)
> +static int cti_set_default_config(struct device *dev,
> +				  struct cti_drvdata *drvdata)
>   {
>   	struct cti_config *config = &drvdata->config;
>   	u32 devid;
> @@ -181,6 +181,26 @@ static void cti_set_default_config(struct device *dev,
>   		config->nr_trig_max = CTIINOUTEN_MAX;
>   	}
>   
> +	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_in_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_out_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_out_filter)
> +		return -ENOMEM;
> +
> +	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +	if (!config->ctiinen)
> +		return -ENOMEM;
> +
> +	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +	if (!config->ctiouten)
> +		return -ENOMEM;
> +
>   	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>   
>   	/* Most regs default to 0 as zalloc'ed except...*/
> @@ -189,6 +209,7 @@ static void cti_set_default_config(struct device *dev,
>   	config->enable_req_count = 0;
>   
>   	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
> +	return 0;
>   }
>   
>   /*
> @@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>   	cti_dev->nr_trig_con++;
>   
>   	/* add connection usage bit info to overall info */
> -	drvdata->config.trig_in_use |= tc->con_in->used_mask;
> -	drvdata->config.trig_out_use |= tc->con_out->used_mask;
> +	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
> +		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
> +		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
>   
>   	return 0;
>   }
> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   {
>   	struct cti_trig_con *tc = NULL;
>   	struct cti_trig_grp *in = NULL, *out = NULL;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
> +	int n_trigs = drvdata->config.nr_trig_max;
>   
>   	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
>   	if (!tc)
> @@ -242,12 +267,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   	if (!in)
>   		return NULL;
>   
> +	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!in->used_mask)
> +		return NULL;
> +
>   	out = devm_kzalloc(dev,
>   			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>   			   GFP_KERNEL);
>   	if (!out)
>   		return NULL;
>   
> +	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!out->used_mask)
> +		return NULL;
> +
>   	tc->con_in = in;
>   	tc->con_out = out;
>   	tc->con_in->nr_sigs = in_sigs;
> @@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   {
>   	int ret = 0;
>   	int n_trigs = drvdata->config.nr_trig_max;
> -	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>   	struct cti_trig_con *tc = NULL;
>   
>   	/*
> @@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   	if (!tc)
>   		return -ENOMEM;
>   
> -	tc->con_in->used_mask = n_trig_mask;
> -	tc->con_out->used_mask = n_trig_mask;
> +	bitmap_fill(tc->con_in->used_mask, n_trigs);
> +	bitmap_fill(tc->con_out->used_mask, n_trigs);
>   	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>   	return ret;
>   }
> @@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   {
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *config = &drvdata->config;
> -	u32 trig_bitmask;
>   	u32 chan_bitmask;
>   	u32 reg_value;
>   	int reg_offset;
> @@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   	   (trigger_idx >= config->nr_trig_max))
>   		return -EINVAL;
>   
> -	trig_bitmask = BIT(trigger_idx);
> -
>   	/* ensure registered triggers and not out filtered */
>   	if (direction == CTI_TRIG_IN)	{
> -		if (!(trig_bitmask & config->trig_in_use))
> +		if (!(test_bit(trigger_idx, config->trig_in_use)))
>   			return -EINVAL;
>   	} else {
> -		if (!(trig_bitmask & config->trig_out_use))
> +		if (!(test_bit(trigger_idx, config->trig_out_use)))
>   			return -EINVAL;
>   
>   		if ((config->trig_filter_enable) &&
> -		    (config->trig_out_filter & trig_bitmask))
> +		    test_bit(trigger_idx, config->trig_out_filter))
>   			return -EINVAL;
>   	}
>   
> @@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
>   	/* initialise CTI driver config values */
> -	cti_set_default_config(dev, drvdata);
> +	ret = cti_set_default_config(dev, drvdata);
> +	if (ret)
> +		return ret;
>   
>   	pdata = coresight_cti_get_platform_data(dev);
>   	if (IS_ERR(pdata)) {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 4eff96f48594..557debbc8ca4 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>   		goto create_v8_etm_out;
>   
>   	/* build connection data */
> -	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> -	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>   
>   	/*
>   	 * The EXTOUT type signals from the ETM are connected to a set of input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* Set the v8 PE CTI connection data */
> -	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>   	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>   	tc->con_in->sig_types[1] = PE_PMUIRQ;
> -	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>   	tc->con_out->sig_types[0] = PE_EDBGREQ;
>   	tc->con_out->sig_types[1] = PE_DBGRESTART;
>   	tc->con_out->sig_types[2] = PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* filter pe_edbgreq - PE trigout sig <0> */
> -	drvdata->config.trig_out_filter |= 0x1;
> +	set_bit(0, drvdata->config.trig_out_filter);
>   
>   of_create_v8_out:
>   	return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>   	if (!err) {
>   		/* set the signal usage mask */
>   		for (idx = 0; idx < tgrp->nr_sigs; idx++)
> -			tgrp->used_mask |= BIT(values[idx]);
> +			set_bit(values[idx], tgrp->used_mask);
>   	}
>   
>   	kfree(values);
> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>   {
>   	struct cti_trig_grp *tg = NULL;
>   	int err = 0, nr_filter_sigs;
> +	int nr_trigs = drvdata->config.nr_trig_max;
>   
>   	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>   						     CTI_DT_FILTER_OUT_SIGS);
>   	if (nr_filter_sigs == 0)
>   		return 0;
>   
> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +	if (nr_filter_sigs > nr_trigs)
>   		return -EINVAL;
>   
>   	tg = kzalloc_obj(*tg);
>   	if (!tg)
>   		return -ENOMEM;
>   
> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
> +	if (!tg->used_mask) {
> +		kfree(tg);
> +		return -ENOMEM;
> +	}
> +
>   	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>   	if (!err)
> -		drvdata->config.trig_out_filter |= tg->used_mask;
> +		bitmap_or(drvdata->config.trig_out_filter,
> +			  drvdata->config.trig_out_filter,
> +			  tg->used_mask, nr_trigs);

The error may be silently ignored when a memory allocation error 
occured. I think it's better to add a log print to tell user what happened.

Thanks,
Jie

>   
> +	bitmap_free(tg->used_mask);
>   	kfree(tg);
>   	return err;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 3fe2c916d228..2bbfa405cb6b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
>   	int nr_trig_max = cfg->nr_trig_max;
> -	unsigned long mask = cfg->trig_out_filter;
> +	unsigned long *mask = cfg->trig_out_filter;
>   
> -	if (mask == 0)
> +	if (bitmap_empty(mask, nr_trig_max))
>   		return 0;
>   
> -	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
>   }
>   static DEVICE_ATTR_RO(trigout_filtered);
>   
> @@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_in->used_mask;
> +	unsigned long *mask = con->con_in->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   static ssize_t trigout_sig_show(struct device *dev,
> @@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_out->used_mask;
> +	unsigned long *mask = con->con_out->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index c5f9e79fabc6..ef079fc18b72 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -68,7 +68,7 @@ struct fwnode_handle;
>    */
>   struct cti_trig_grp {
>   	int nr_sigs;
> -	u32 used_mask;
> +	unsigned long *used_mask;
>   	int sig_types[];
>   };
>   
> @@ -145,17 +145,17 @@ struct cti_config {
>   	int enable_req_count;
>   
>   	/* registered triggers and filtering */
> -	u32 trig_in_use;
> -	u32 trig_out_use;
> -	u32 trig_out_filter;
> +	unsigned long *trig_in_use;
> +	unsigned long *trig_out_use;
> +	unsigned long *trig_out_filter;
>   	bool trig_filter_enable;
>   	u8 xtrig_rchan_sel;
>   
>   	/* cti cross trig programmable regs */
>   	u32 ctiappset;
>   	u8 ctiinout_sel;
> -	u32 ctiinen[CTIINOUTEN_MAX];
> -	u32 ctiouten[CTIINOUTEN_MAX];
> +	u32 *ctiinen;
> +	u32 *ctiouten;
>   	u32 ctigate;
>   	u32 asicctl;
>   };
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE19210A62E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=; b=ifask2tZGCp4Id3KSZ9OTmZ/wM
	krm9vfyOA57wJ3Rybk1Oru7XKlkQ/NoAtZJylLGZtqeI1uWfrFdD8TpGqEYRjFFZG0D6NsF8xtIw9
	vnnJGQcuewNnuftq286W722r6CxoM+q2BN24n0VdNFMR/IfZ/T3CPXy0i0obBCUaUaPPeA+1lxV7q
	l44Xt2pI81RHdpMjT2Gqv1jA0JfUQVFwR6HNhdTc3xgGZe8mi7oqn1M87hg4Jr/W+b1vqlCh7TqRt
	1LRhpcNra7QUrNtBFamSYeWDNDW8R+2Iu/lRe9AWpwNVdrdbbmSkryjflmUSfz7mWrEMxt+9CtmQG
	H9ygqFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wuO-00000006YDz-3voi;
	Fri, 27 Mar 2026 02:26:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wuM-00000006YDd-2sqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 02:26:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0gRYi1658473
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=; b=ijogxYkhf6qwDB5+
	/7dSdUigh31q/DPbluTSlsNhWatnX+ngR7VuOJCykV8ZKzwZU0PRpdw4/bkyFA5d
	Cl30M4iUrEiCiuRXXlL0HAJp9TdHIC71gcKU6n0KKuAUHxs0sytMSQxZR9+wxpop
	wgr3rFZEOunWKbJ5TxQ5wJmIJuc1cR4Fpg0ofjWJfG/l5jpuVWs/23673zJeHzI/
	gEIYGKEkxjovsXeeqPuvQXilzLNm4qAQTEC6yl9b5+4aExUMPStvSdTJvMHHHbKa
	UYCSPJCTxcsaZpg3Fk977KgeMssTx4jjnf7TsQQ/IZ3MuDGnIYqWgi5PAo/P29In
	qlXWmQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1qcbqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:26:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a782029b7so1271863b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578405; x=1775183205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=DgBQvZRUCCSmEIumtCj+xSisqsSJs5lJ/4YDSS7aY8aUkfUmWnigGshcty20YR4LFi
         AP7GAD4t8c+PODBtv7yEGUTLDKeDmMNPFg/QhtpVlMs7vn1DyeOQImWWSjnDvPrecH0x
         6uTAs/h8uVo2o/keXQlZX/FBM6kIdyS6lxhyOliYv+T+kE2qn+o+c7ShOagcJAjg6Tki
         rnBVsOIdyfMnQXRVz96ESDYMHhTUz3ztJBVFFJTxzjb1qQXS78HlFfuD5ZQeU0iyBNxr
         WBRBI6wisVM+G6kAr3fYyxo5vjsSeEyeLUWr9ml+keEdTnmQhHG1Si+570bfKzj55e/N
         SWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578405; x=1775183205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=fuffuO56ad6T4D6w05jYZAVgohxa3/ab3g0swfM7Xk6risIH4Pey3YNhdlo0PMOZ3u
         I26yUA8SgMzCs85UPXL95R1Rp8nr2Z1Fe9ScForvxwRU02iKVBRFnGuV+HiLS1nAg1ux
         ehHDp4/rh4cdgOQ2tzw5Pcl9ZQidnXLZP6FHHeaDdTFT2HRkWkqAVMRnfKtcLUlueF4D
         axOV1oMyyupI73OZP4EOtSDycperWg8NOtisI4i18eCuMXsAsfjIIgxo1NfB8hXdbuNW
         oGSEyQEAgyXMxP7Dshg7IFwDKFfQXCNbR4sG6RkSNg4frwJV59GDDSdj8RYCvHYy5YTO
         ZT8w==
X-Forwarded-Encrypted: i=1; AJvYcCU+bh+ciyKLb3+W/pAQGBPWf7ZbhebQkYChREBCBoG8qJfuoUTWnlfBmYaHSHHYTtzbSsC3G24GaDJ6C/7FXqBE@lists.infradead.org
X-Gm-Message-State: AOJu0YxoFDUyOOuHNpy9DKkRA8/B58pp/XgE1PjYU77FtZMio36n4elC
	Wx2dzehbjvvCt52UZegizlcDb3Ef8JXinLkh7AnCy4ZXOqkSZIgqAc1A3Z8ZKo/tYQSMRSN+AJe
	FopDQWb7h4eupff3mkyrMUNtcG5r9JXstin0dfYcmaTzid49sHyIYyxJ9SNFSRTJrxzC0iAGPOb
	37hA==
X-Gm-Gg: ATEYQzxUcn/sk4ro2MgV0NMXpn8wVHAetgUji514qmtCzH8hxxtf+keO0fvYiAEEt5R
	hAgHKD/L7JIHIrnfPw4S5YV/j+mN8p5+x98j1A84lVoz0otx5CTDp/1XEQn9rvAQMtOTB3X2Gv+
	9b7ypNhihbvKT4rHfgfUsU8ckp7PW6GL1VAsy2f4MqCrrkQImH0oFBYCILWWudHaKVlHdVP+63k
	TMdOcLQY2hdHGVkRlh7uQcf38PeAWIuznRu7nWEdsY4Ok0F+FpMN3u5w4psDDiJhjx4T7Dz6DhX
	jrr3X04CkMVI8KdktSUzRFbbz7jkeUJbi31zpPukk5yzcHV51ICO6hCKPv3L/m31NImP8p0u7qw
	zGt4lFxWAMSq/V52MHt0+MsTCkz2a+4YI1yDuutLEIIlkkISrjKtCPJmv8a/qiAIg8Sx7MOUnQe
	jYt/z82TimiA==
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688669b3a.49.1774578405318;
        Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688629b3a.49.1774578404805;
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e6a15sm4696446b3a.1.2026.03.26.19.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Message-ID: <65611581-97c6-41ae-8b20-42c194c31915@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:26:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GIodgFLMMFQHdP3JRcpQ0McIwKYOmQ9Y
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c5eae6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BNsjwqSjcop3XK1me6cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNyBTYWx0ZWRfX9WKhlG3bSPit
 ymEKKGgIdigPNM4+d+2dvYFHfKyFeUXQUzlglCBotxb6BmH5i1QT0YqMehuTKUcLUQD4LQVaXE1
 32i3p95lR897B3n+pThrD7HL0I7OoJe1HDrncxvw5jsAWE8WvmvJCXBf9EEs11VWRCDbVUgNYTV
 3QqwhL5cQ2fZXjYFlC+KxcIAFNwd2Jaakhk+3QXuUibAEjGhKWWqcf03eYdkiZLOIsXkas8/H1E
 jzn7qccQdw2XdVqJPaV6K43edVspYxQ7NiR8jhf/nCOhitKO4zHYFE+3R6T1LA1apjzW709RBCc
 8v9wP1oYrPPl3kdPqJFYtiQZIYX9hx/fpT/tHDqiN8mpaozqwszBNygOGyI6kIFyYH2JG3SSBhF
 KtHjTInrsOKvN/KhrA3KCPHeLBlhiKgS4uIM+2thaCEQkQZZos7EHOqspPLGnvBQiluokiGDB1y
 9z8548xpPb5b36isd4w==
X-Proofpoint-GUID: GIodgFLMMFQHdP3JRcpQ0McIwKYOmQ9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_192646_736978_735203C4 
X-CRM114-Status: GOOD (  24.68  )
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



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 5370882333bc..1dcb8fb71cd9 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4539415571f6..e28e6d27cf56 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	bool need_pm_put = false;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		need_pm_put = true;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);

need_pm_put flag is not set when reset a enabled device. I think we also 
need do pm_runtime_put after we did tgu_do_disable for an enabled device 
because we have pm_runtime_resume_and_get while enabling it.

Thanks,
Jie

> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	if (need_pm_put)
> +		pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   



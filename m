Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F96AFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=; b=mUe6mqJQAql/kZibhz4ptkMIPz
	mD9yRwh1q06zdpqP+C2sV/9LG34EWPWH1xuCmjE0Vlr9C1Lpe3aDo1iqg8jnY7XCJvzHqgYxoLCQ4
	CAENctJLsdia0hBwlj8n6SVEYw0QuWEMm8C9mOeIOC5a2zgxwqfV6tQoQIZVtctidQp6ub22xVPNj
	sg3+qgMXjmiXQ+4PSuZT2jyWJuCZNl6JxoZGpOexP+cwdGPizGgcmAkbKyQQkcIawULOnF1yPC7R0
	rlBBrOjMR5p3c/2Ukptr2ThP+GjZLXn5H9hC7KusVxiVrYUGtT2b7SCS1iykrM4l8+bCyfcTHBKH5
	3EIHsxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBbz-0000000G2z6-2cjm;
	Mon, 27 Apr 2026 02:22:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBbw-0000000G2yj-41dA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:22:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMANRY2728442
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=; b=MmIraj8GAO1mpWPt
	kSBLYFlrum5V9BfXxCNRRvUKfDAZa1J/WJT+sfAjraa/DPpYBmjkqPcdcrE+qGam
	ELwMO35UiRDMTty43LXWtdp+xDGFQ4YGB7UDgD7nF5o3cGU7RZqCXFEvq2XevC8k
	HcMwOCclUBBq0D9eksqfqRcdQWylKANipaDpGebDpkMnZlGfSlaG0JdX8Mw6cBtQ
	aJTIGNwfW0kcFoWN0f56YiqVoCIVhySlZQtsgRfzyEVdDnSXn0J04gy+NJlpmhMs
	40rgLgBf7oT/1SzF/BhTYPIJEPUSWesR0YGc/jrw7hSd0ogH3h/WTMPafBZC3nKr
	fEdpFA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxc242-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:22:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so17982795a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777256530; x=1777861330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=;
        b=OOmJ3DUVHcCuRaeaFpu7AWXIQsvb5DUp8d5e8cC60oj1MUe22TVb/ywkuXjToKepJG
         X/YLxaimMy7ncDsnIOtODwr6BnTF/NOE+zoewA9FZ5RufmkNCiYX6KQPxULX4+RS8Qzj
         YA0GDOU2s6oIvOPioWvmxS4fbx6F3nhuQMtkD1FwPwVuf23m4rLKL4JSBE5UvumTQJ8r
         +VpRAy+vEm0r00Xo9E2z6QRLR1zfhIH/SdPhARhyDG5K6owMUmqFUsu31Opc7YnR2u6Q
         1vi7hz3k2am5Nfs8r/9RSJeYQ5MkMfmeKX5oBvgy3WQHwemtxTUcNGVBbnBsSXWtJvNt
         PvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777256530; x=1777861330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=;
        b=bDbshoUezlDaETtR9U3+8BHhoF35CxFRPUslMpcDFhMmKU893ZTQZC6WWdaw3xOC9R
         E3rZoJ7RrpGDcVs7sHYrBAERvHMi8+38fGb7uUwEW/TJwledbX+yF0CKIixc31xiHfhk
         1xFcJf68b8gWoMa7OwaAQytrTb+AVSbuS542pAFMtoqjDexhqHKnxAVRTJm6CayobTkR
         qdRC4jbVDGG6ndPC7Nn1muq/utI9IN8r+TYoyzcg2W/q8sd20r+/uL/papyScDznKHMx
         jOOMQKvyHzn7t+yDs0fOq3zu+ArVm0JEiHmpgaU2yMAXWo8uiuNukowLEEaiF9uNFdM4
         FYtw==
X-Forwarded-Encrypted: i=1; AFNElJ9CY8HPBKlrlWPUjujPpCqPw5fXvfThhc3KnvagZ/XAv/h+ySJecxiw+1VOCJ1Vu5uaCimo4BM03WlXS88H8Iwq@lists.infradead.org
X-Gm-Message-State: AOJu0YzeobpX45NO/YU72esVzrG31iPNBs/UXG+FQ0V9B2pICwwTZfe4
	7nFci0VpYmRILn7gWZkK4OZQzYZUA+dNPcLY2uYhzL2AWRwWO9OYHBZq8XZP9ym4Lxtc/jLAOOP
	h2djoJ5/KlA/eLwkxsUdIraUhbZ1nCM36Beg8m+iHc4votdOucwhSurxpVZHpBsYClPlr+nEYLE
	KVNQ==
X-Gm-Gg: AeBDiet53rKlLlc1ZLz0kyTMqcGQLa9iDVaCC5ojYMpQ8zP7sYWmbANtdWEuezy8nTG
	gIHKzlu2ISj1lPpq8j0rsSuPEiQjoxcLJYMGPbRW4e7a/QTPDYjIxqtJWXj/DouEBBnmhMVxiXx
	bbO3lR7SPLh97bfZr/NrtNL+x8OMCbFAGampIHVJnCOp/74KY7OBL623GKG7ANVpkEavyLtlplG
	GKdXtObUuRjF7ldxUtHGt7LSchSdemKtlbhUqvsQ9aN7x4xObslLWAimGXMjDdfynQKzbbBwK5C
	JMy0e3lcyV05kEXRkuB2TPVYsmnqKhkRfTVSWEBTi2bV0rXX9jCOEYnLRKyWiDVB2hfYAXdShBq
	TywMSyUqkz0ys7Idyc+kc+75hv7y39GreWtVnywsgnhVAYoL5gnK+8Athf8Rg9DMycY5MvlNMsd
	aV3GKEmmziEN/xZ/kg9b9h
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr44522087a91.11.1777256530286;
        Sun, 26 Apr 2026 19:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr44522048a91.11.1777256529729;
        Sun, 26 Apr 2026 19:22:09 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7cb5sm30265606a91.9.2026.04.26.19.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 19:22:09 -0700 (PDT)
Message-ID: <11376a1b-923d-4bee-bdc6-fecea43a256d@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 10:22:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
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
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g29WDhFcbpVkRH7OyphZqjVcVyzG9OeK
X-Proofpoint-ORIG-GUID: g29WDhFcbpVkRH7OyphZqjVcVyzG9OeK
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eec853 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rOvziGV0-G4P2_swbT4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyMyBTYWx0ZWRfXyWei6KM53fC7
 Plc1phrF8rGmlPzdwkcwMnwayayZAlfi85PyHQTAZStjoWGRgRFcsvq/4TXxRMm7CvxHxlF+p8b
 aqbz+dscY0hkLgzYK6p0kJnGVumwzGsiMwHgcAbvIjPlkBQKWRvJI16cxngTU6+hdiVOxWPF0Ti
 8CH4ykgfJUPL/PxkvfdnyBenBfv/8W/v6iwdbQB7gXRvEIi0hvKcf+0cz50sViv3KlkNOu+XMhR
 ddk3WOdg7zVa+vU91w3Cp+9u9Gc+OD1l8xXi4NmY1g1Y7Uhd55E/FkuUWDuSJvrtIqs0+58L6YF
 JxyKVEjNK+jU2xtpeSGmSwD8h5TKO2AtJGLrXcggnhjYjIED7mpg19bcplIzN6EJf6inpeSVKyH
 Ztkbx+SpvWa4BRtfLpMy7h6HJS7qd1E6fpV1ocm+YtnB218kVrTdSTo5t9x0N54bvalXewz0XcM
 gpSzE5TsOA96nO6ij4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_192213_130352_B5EFB677 
X-CRM114-Status: GOOD (  27.32  )
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
> Introduce a small encoding to carry the register index together with the
> base offset in a single u32, and use a common helper to compute the final
> MMIO address. This refactors register access to be based on the encoded
> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
> support variants that bank or relocate trigger-indexed registers.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>   drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>   3 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 4e7d12bd2d3e..c4cbeb64365b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>   #define csdev_to_cti_drvdata(csdev)	\
>   	dev_get_drvdata(csdev->dev.parent)
>   
> +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)

u32 reg would be better.

> +{
> +	u32 offset = CTI_REG_CLR_NR(reg);

No functional error but a little bit tricky here.

CTI_REG_CLR_NR(reg) will produce a offset for the bits[0:23], but in the 
comment, you mentioned the base register offset ranges from [0:11].

With my understanding, all CTI register offsets fall within the range b 
0 to 0XFAC, that's why we have bits[0:11]?

Thanks,
Jie

> +	u32 nr = CTI_REG_GET_NR(reg);
> +
> +	return drvdata->base + offset + sizeof(u32) * nr;
> +}
> +
>   /* write set of regs to hardware - call with spinlock claimed */
>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>   {
> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>   
>   	/* write the CTI trigger registers */
>   	for (i = 0; i < config->nr_trig_max; i++) {
> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +		writel_relaxed(config->ctiinen[i],
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
>   		writel_relaxed(config->ctiouten[i],
> -			       drvdata->base + CTIOUTEN(i));
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
>   	}
>   
>   	/* other regs */
> -	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> +	writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
>   	if (config->asicctl_impl)
> -		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +		writel_relaxed(config->asicctl, cti_reg_addr(drvdata, ASICCTL));
> +	writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, CTIAPPSET));
>   
>   	/* re-enable CTI */
>   	writel_relaxed(1, drvdata->base + CTICONTROL);
> @@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
>   	int val;
>   
>   	CS_UNLOCK(drvdata->base);
> -	val = readl_relaxed(drvdata->base + offset);
> +	val = readl_relaxed(cti_reg_addr(drvdata, offset));
>   	CS_LOCK(drvdata->base);
>   
>   	return val;
> @@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
>   void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
>   {
>   	CS_UNLOCK(drvdata->base);
> -	writel_relaxed(value, drvdata->base + offset);
> +	writel_relaxed(value, cti_reg_addr(drvdata, offset));
>   	CS_LOCK(drvdata->base);
>   }
>   
> @@ -344,8 +353,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   
>   	/* update the local register values */
>   	chan_bitmask = BIT(channel_idx);
> -	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
> -		      CTIOUTEN(trigger_idx));
> +	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
>   
>   	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
>   
> @@ -365,8 +373,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, reg_offset, reg_value);
> -
> +		cti_write_single_reg(drvdata,
> +				     CTI_REG_SET_NR(reg_offset, trigger_idx),
> +				     reg_value);
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 2bbfa405cb6b..8b70e7e38ea3 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -386,7 +386,7 @@ static ssize_t inen_store(struct device *dev,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, CTIINEN(index), val);
> +		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
>   
>   	return size;
>   }
> @@ -427,7 +427,7 @@ static ssize_t outen_store(struct device *dev,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
>   
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index ef079fc18b72..dd1ba44518c4 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -7,6 +7,7 @@
>   #ifndef _CORESIGHT_CORESIGHT_CTI_H
>   #define _CORESIGHT_CORESIGHT_CTI_H
>   
> +#include <linux/bitfield.h>
>   #include <linux/coresight.h>
>   #include <linux/device.h>
>   #include <linux/list.h>
> @@ -30,8 +31,8 @@ struct fwnode_handle;
>   #define CTIAPPSET		0x014
>   #define CTIAPPCLEAR		0x018
>   #define CTIAPPPULSE		0x01C
> -#define CTIINEN(n)		(0x020 + (4 * n))
> -#define CTIOUTEN(n)		(0x0A0 + (4 * n))
> +#define CTIINEN			0x020
> +#define CTIOUTEN		0x0A0
>   #define CTITRIGINSTATUS		0x130
>   #define CTITRIGOUTSTATUS	0x134
>   #define CTICHINSTATUS		0x138
> @@ -59,6 +60,17 @@ struct fwnode_handle;
>    */
>   #define CTIINOUTEN_MAX		32
>   
> +/*
> + * Encode CTI register offset and register index in one u32:
> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
> + *   - bits[24:31] : register index (nr)
> + */
> +#define CTI_REG_NR_MASK			GENMASK(31, 24)
> +#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
> +#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
> +
>   /**
>    * Group of related trigger signals
>    *
> 



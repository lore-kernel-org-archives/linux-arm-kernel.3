Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20655E784A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 05:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=; b=bOuo2+Mk4m/Cz0oaXbVCAQwbtz
	SgVMqslx0be3CuIYoTvDvN1L5b34g+4CwJ9th8/Fc0CLmaYu9Fl45sE2SnaasoFMlko2nl0IOq1eI
	LYmnZUiOjk9IazvRuQZeBu4v3YZ1WyvAvYR9FAcYnZQOz1UG3kpqFgBmWkkOwnqtuYUYdmWwt1yjF
	HwSPa+jyrE0R5j3MYQAkRg5U3lCA8pE8OcURcyXPFavZldf3D4+nxaY5YNAekQ66EUArYz608Mnrv
	/9DK/0YNhC9XL+Dw8luiqN5mq42R6EIJu+op7YWAcCIIPrbwjMmqKsh4yhdtbMvBFJdiSV2pYdKYV
	5JlKdZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeLA-000000006f2-2XfL;
	Thu, 25 Dec 2025 05:56:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeL7-000000006eh-42Rz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 05:56:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP4tMe3866078
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 05:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=; b=auOw+fTVvkEoNTdG
	Fl/cx6fON9zhqMMb4KKVsXuRMJIZgKQPFF2S/Rg0ROgfRpIzMzXxqQL7LNiPflnl
	qAczousgYRljsS08/9xVfKe+aOqUcalsEH+RtiG73jYxo9P1iRJfksVaIbpdsun7
	iNy2rwze3VecmRjOWGG2VjrvQFHDyYZknjaE/XBZdVaPI/ItlKkdBYyY8vvB/4hm
	pKbq4lfEK4myDDkP+zElLWn0GbKUvWLs9QvH8U0iaS+0tvAth6nhmSg1IxsYz+rF
	Wec7Q4K+Vk+KZY9f6qai/5DSl8Sw+mjW82o+1smJYbqeEAdbkiNYWS0szS7aZU7f
	G7R5Eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xn282jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 05:56:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e952f153so201897155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 21:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766642205; x=1767247005; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=;
        b=EZeGXQABx2hxBF/jOajqoa4EjiP7BYxkFOLv+QjlFOUqkyewZ4AhKsp5jzWvcbiSJf
         NaBUF8I+XgULovE4zGwveqyQQe/aSs7PPBhTq7CwBGNsr7Ujoua2oCHI3ABFgSBiG2Ut
         gby7fiAIbmV7ZXYf4qeMXp+YuM/j86INssD3zA5+smFkDjzzve4gXZ90CObO4z4FgH5e
         MpaTrLHgfz88LzQHyX8p5tEy6uCzFxLd+yJOB8Drz9NXE/FZdRqGuPYx+TWzwT7tww8q
         8cTN9Ovd92k3gxHbZBQh+K4rcmi/u83Zc06lKu4MW+ptn5w1PEgbBS+aTZIqG08k9WrT
         5jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766642205; x=1767247005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=;
        b=LMEgx1McLFPiapQMyMVqVjlPsXXyFT7eJS+Pzxq0LL5GfxfG/Pnh+rJIJPGk1+HZP7
         N1uPOKPs1kun6HpQjh7u17BheirrQItGY3559SjvURhh1RxwVEXzVDXZmfbP8DhxtSQT
         pTdf60yxrT5zR+7Yll4nDxZCF59UlDaJh4xDHlqPIVEiTlu7H3q3hiRmKx6UvfjHcufj
         tfX9aqGy/OBsTxPzuewy1V7qR77RndHI4uyNMcMLwirGd8TQxSY0DMe0dSkdroI+pO79
         PXq0T5Rq+ALtvNk8gXCqG9bJeiBZGBFp+hUuATez/uEEv6BLQ2XgRajqXlxo3nSwrPd6
         hxfw==
X-Forwarded-Encrypted: i=1; AJvYcCW4fl8htJBZov7xj4FCDP44uvXCPLunUO80rROPhr8VX/5FkuODS0KUTuUrvvsIkFmoyXpcuwVIpRMojDLeV0QK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9Fb3IwoHB02ZYJuHvgneBluAf5YV3igDbZEnbfMv3+NSLKDR
	XQaTAOVnnP0rBaNBb+KlRQV6G3WSxvsuiwEHwXDOh8Uv3ELlr/u9Gfn5Lq0p1J32XIjvSx0pPCN
	6lX8cd4mTaTOmjJe17K/+jLf526vD4aRb0nFyJfZEoyrucUprItuAcIXCYT/PkK5X5Hyh0257Fh
	rJxA==
X-Gm-Gg: AY/fxX4ir8+Eo7hSxjD5+ojENm+wtRb2jQ00JT7P7FeAZJAL51+ThdNbEItXXiyJv95
	asLVdEmzaXz2l63KdGCK7zUJziyct2Y0/A9Z21IgsnJ7kpnB1uymLhzp3QcJQvCQ2cONxMwx8PU
	Cswu25QpQK+1PtB9DgJrfq+cLQGeqRxMC/7yTt56R8mtynblVUbWn1ov/jV8n0doLX3nS+Keyzk
	Uom9fE2qhAkwDcO1yaFNc1vAlxdfHLTvlc3R5Msgw7CnL5Ch/Z08yj3060LHEubEICj+a1SBG1S
	sMOvUg/17zU4BVBZ+bU7nPaZJLRVZrXvJmP87ZHS/GKTZg/8x1n/PotuD+OL7ZYzAfvBFeFPhLN
	V3U953uoszDjM78/+9P47ZtHHpgN4CsZXw+73YnZ1a71GqyLfecZ5Mt1WndikzcS3BVP/oP4aSK
	I=
X-Received: by 2002:a17:902:ec90:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a2f2737be9mr202743275ad.35.1766642204680;
        Wed, 24 Dec 2025 21:56:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOpd3ErX7V5aJYRRI5TL4DpQGZJpZBgxbrQWzYR4JqWoT65p5BJeiqgHuYn/z8G3K4or7vgw==
X-Received: by 2002:a17:902:ec90:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a2f2737be9mr202743005ad.35.1766642204191;
        Wed, 24 Dec 2025 21:56:44 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm20085890a91.16.2025.12.24.21.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 21:56:43 -0800 (PST)
Message-ID: <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 13:56:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA1NSBTYWx0ZWRfXwA98K+9Mya0o
 p/w9yfcYLdNVPWlEeEH2wksZRktp0Ihy4eQyyl1Al0N90HrnPeYJWYnHu2zVm3ybb8LGFCoJD4U
 gG71bJ9P/SfYOazEyvCHYLx0ZT4Q1oeKY/NVfLKmi+PQeDi5BARA7crmTyuADTmUy1fIqmGa3Df
 kdOZwxOh0olWbKDjWiXtmcjxyy2TNoL57uf8BOp5hr+9NxEVtiWb0bPJsangfSbI9VQ0VmHREok
 ciL6vk4SR6gtDXCj7b3c0b7QggAZWTtXWb38GKgi8dAV/6769Fz/1KMnW9uU9vMApvadX62MFyU
 BbQv9mECkzdqEJqrNsTVkVcGse7sl2Kc+hOb+KWd4ksDCEou7pG3eXPUF7uwK6WzsQ/l0jvi5JV
 0pXYzyLB6naku9seUgs5jrETem4IgnC2MkRW/J1ljnRUjwJAE7RWnlBmbY70GhLDhnRfPjfpB5C
 9gnnv62Ma4AqxAy6iiQ==
X-Proofpoint-GUID: u1yyOv4oTWBMev8O62X-Ja0ywZNAthLW
X-Authority-Analysis: v=2.4 cv=Cp+ys34D c=1 sm=1 tr=0 ts=694cd21d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JNGEfTUsO65A5MKw78gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: u1yyOv4oTWBMev8O62X-Ja0ywZNAthLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_215646_059773_67D7D0F6 
X-CRM114-Status: GOOD (  23.19  )
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



On 12/19/2025 2:59 PM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 010eade0a1c5..0733b3e07b45 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	6.19
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		December 2025
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index d4210869556e..5a8c6af9b719 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	unsigned long value;
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value == 0)
> +		return -EINVAL;
> +
> +	if (!drvdata->enable) {
> +		ret = pm_runtime_get_sync(drvdata->dev);
> +		if (ret < 0) {
> +			pm_runtime_put(drvdata->dev);
> +			return ret;
> +		}
> +	}
> +
> +	guard(spinlock)(&drvdata->lock);
> +	TGU_UNLOCK(drvdata->base);
> +
> +	writel(0, drvdata->base + TGU_CONTROL);

Better move TGU_LOCK(drvdata->base) here

Thanks,
Jie

> +
> +	if (drvdata->value_table->priority)
> +		memset(drvdata->value_table->priority, 0,
> +			    MAX_PRIORITY * drvdata->max_step *
> +				drvdata->max_reg * sizeof(unsigned int));
> +
> +	if (drvdata->value_table->condition_decode)
> +		memset(drvdata->value_table->condition_decode, 0,
> +			    drvdata->max_condition_decode * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +		/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < drvdata->max_condition_decode; j++) {
> +			drvdata->value_table
> +			->condition_decode[calculate_array_location(
> +			drvdata, i, TGU_CONDITION_DECODE, j)] =
> +			0x1000000;
> +		}
> +	}
> +
> +	if (drvdata->value_table->condition_select)
> +		memset(drvdata->value_table->condition_select, 0,
> +				drvdata->max_condition_select * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->timer)
> +		memset(drvdata->value_table->timer, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_timer) *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->counter)
> +		memset(drvdata->value_table->counter, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_counter) *
> +				sizeof(unsigned int));
> +
> +	dev_dbg(dev, "Coresight-TGU reset complete\n");
> +
> +	TGU_LOCK(drvdata->base);
> +
> +	drvdata->enable = false;
> +	pm_runtime_put(drvdata->dev);
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



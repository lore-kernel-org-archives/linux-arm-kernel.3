Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B81ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/5t8BuizRagaIaJmirkWNDHgWBpxUxE/MXsx3vZo/w=; b=B63N3DEsIO2LeEAo85/1aOwZUS
	KCA0Rwwd1id+IAxUYaQL/mVlhtpM2os/KE9b3ih+xihATb/NhBchlUfL9XNzl/nqVGKGLevg7sri8
	mLUandYRDYa62n0uaS51zmokNYID/zrzMgISUoxJ6tscLUZkG+HFMw6RaaHFGjdPXQL4STDpj/70q
	pBWcJgbfdJTQ+NYf0XWOheWLhZV4mKiStehzXzfcMFcm51DFCg2oB6SFDVfht1r8lEUQBFEiZh9+b
	q6KtnO06hkiO5T/Pw+R9C3Sb3No9kwklv3Y6hVU6J1hQfDBcMctj2m06CLysvP5Rgb60jBbWhufV6
	dIcnv03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHJ9-00000009kuO-3ON1;
	Tue, 19 Aug 2025 08:03:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGom-00000009gTa-0BxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:31:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INVbbv026366
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/5t8BuizRagaIaJmirkWNDHgWBpxUxE/MXsx3vZo/w=; b=ZSx45hiTEp53shwW
	4GGT8kbPMkKdH/UzM1W49QYD3xFH9q1Vze3BxZ4druZ/S5TI9w8+Pyp0mfLRBK9Z
	bLRIGcThdtgjmlrk78fh3G3gmaYlevXPj+NZ3TjseiNzyZRxyjNMCXbmAezpzOT4
	nyHgcgGPaVoclYYwRz+jtXTKlkB34j+6ZzLbHOh7/QpO4lwB/03RGBGn0SedzcOT
	Wjr/L+E92CI2T9zfAVh+CqRBxEdQPJYg3YF/PF7BpKr+CJpV1WJH4ilhbINK7uK8
	++EoZ98pCgjZiFuZWQCsRBHC7lVUYUaagG/N0HE4efYh49gWinCMJ2X2EaOF8jly
	LUq6SA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunuv3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:31:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445805d386so54440885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588698; x=1756193498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/5t8BuizRagaIaJmirkWNDHgWBpxUxE/MXsx3vZo/w=;
        b=enHwd6gGM+/nK7crXJyM+Ni0Mr+0JRIiqPWz0xUYoX4qK/l31piR8C+hYvuYDpLqZj
         hV+5+4WMaIBCQ1Yn1KQD7h6Qo15/C9IzS+zvW5Rhzfd/OWSRiSHh2e0Xc4CncuXDp4zP
         FNV9xEHNKZHwkxmQiufHSQ/ppRYQsj6jDJAG8iKeq9ShdI5BaXhc8PwWIUAH9stdXXra
         TTwHVSyev8bBIJqB2MjinCyxxcR/70vb/VooWhpdvaSKUP+F/uFuIOZC8XTdxDcu0sZT
         Ga9PuHnw2Rh23RTW85HBrcdWLZXFk72PpA16UNgp516McffVTt00qz/rTndRl5pWAaoM
         WRZg==
X-Forwarded-Encrypted: i=1; AJvYcCUfFTU+IaF0EQQUdcp7v4ZR4hzEYDgip6kqjeSrkA/klrePyWKpLuKmhIr4GUDdtdoVqbbVJHyNJKWnTiSh8JYK@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLKgqeGPDv8s5YYxni3ux5PacdMZYOn8T4JNagxaUVvYiwxXk
	9bjzzhR8npWE/+kOi/mnsBUkj5J70oF/xN33FXtyyuJ0jKbwQ76FbxqOAHIPeLQaTZ+amiIkznJ
	J7PhpfcVJdOXpgjYdmFPKmctu3ThsjH7NEFFoYfbhnrQtTbUIF2+UIKkR5FCmoG1YufIh+KVrfJ
	Ef+w==
X-Gm-Gg: ASbGncswInUY/Y/y+ZruP2qGRKpRh22sLfHmM317DABP4/iJEcuFMdCb6VJhJWlNW/f
	/7GO14JRqo6uaG3lZEz9Wmgi19ovDT9j+itcbfknARCt//FuDg8x5z1SoEMA8Gy3w1ncodjqiOI
	32zKoXSM1CsOrc64x1pGCrMOu84WTS596iCSA1MuFGLNf3RMQYHHbmU3BIpVlql/ehRxdaIwHO1
	uTQXSg0AkumUiGyDyeY0vxluE5fYjXCmLo1vTfsr5sorDbidb1ucdMLq/vlYb0OkUgqxCpmGJ3F
	p5q5c/RECqqJiia9uvijxPBmSZlVRCzTQ5OTjycmiae6zUJpjsshMUxmAAaU27E1nNqL5tKiczD
	Mx66IbgEB8WiHLl1j22bq5Wo0HtquOuRc
X-Received: by 2002:a17:902:f542:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-245e02e6404mr21339565ad.15.1755588697593;
        Tue, 19 Aug 2025 00:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUC59usn5BICBgrQVO6S4T7O4TqzqEE4hnv1ocermgR8WZzZPykg1VxbPyswM9WQXAHiLH9Q==
X-Received: by 2002:a17:902:f542:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-245e02e6404mr21339015ad.15.1755588696978;
        Tue, 19 Aug 2025 00:31:36 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d510774sm100620245ad.88.2025.08.19.00.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:31:36 -0700 (PDT)
Message-ID: <51f2c3fa-ea6c-42a7-95eb-7737e75ef6db@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 15:31:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-2-62c8e4f7ad32@oss.qualcomm.com>
 <20250818142759.GA8071@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250818142759.GA8071@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vUA6QlwnJuE6EV54R0R9o5n6wEq8si38
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4285b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=3YXEkSkIQhp2_XkERTwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfXwDoJOH4ETxxA
 57DrYgNftKywmNXgRD9Dk6DXtz1o5wcGrS1TtGnYBzILiKfBZlQTWs1d+DgjBYPNGj6zHYdLmzA
 p+bCFDUiZD8QpTt8zG1eSSxb65NO9tf48ZumFmbNxm/cxHqKXqN8LnG6Ezt/GHMYGpX4rkJLoV2
 z8hmqlYrvGAR1zEmSASKeZsdZ99Zhd8VY9jsVxPT8CEPsa/s3l4ZGrKV+P+GiUAtHx3b7RJLP7E
 eP+Xucj/GyMuA4RXE1VKwbNULyg/R4yElOMCU1zVg9PlJ0lpotQkZ+JyAO1ozUSZNLjpi7le4R7
 oERalIHz35HceX4RI87NBD8gW0pucCHM0sNxZOzkj6T3ZFVgZsOvT4YpUcp2bGtLvI6t+rVbTHh
 aSRMihGz
X-Proofpoint-ORIG-GUID: vUA6QlwnJuE6EV54R0R9o5n6wEq8si38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_003140_214796_D5E4E9FC 
X-CRM114-Status: GOOD (  45.54  )
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



On 8/18/2025 10:27 PM, Leo Yan wrote:
> On Fri, Aug 15, 2025 at 06:18:13AM -0700, Yuanfang Zhang wrote:
>> This patch adds platform driver support for the CoreSight Interconnect
>> TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
>> from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
>> it does not have aggregation and ATID functionality.
> 
> Such kind of driver is not complex, it would be fine to had sent driver
> in one go for support both AMBA and platform devices.
> 
>> Key changes:
>> - Add platform driver `coresight-itnoc` with device tree match support.
>> - Refactor probe logic into a common `_tnoc_probe()` function.
>> - Conditionally initialize ATID only for AMBA-based TNOC blocks.
> 
> An AMBA or platform device is only about device probing; it is not
> necessarily bound to a device feature.
> 
> So I am suspicious of the conclusion that an AMBA-based TNOC always
> supports ATID, while a platform device never supports it.
> 
> Otherwise, you might need to consider using a DT property to indicate
> whether ATID is present or not.
> 

Unlike the AMBA-based design, ITNOC not only lacks ATID support but also does not
include PID registers. This is why a separate platform driver is required to support it.

>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 153 +++++++++++++++++++--------
>>  1 file changed, 106 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index d542df46ea39314605290311f683010337bfd4bd..aa6f48d838c00d71eff22c18e34e00b93755fd82 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -34,6 +34,7 @@
>>   * @base:      memory mapped base address for this component.
>>   * @dev:       device node for trace_noc_drvdata.
>>   * @csdev:     component vitals needed by the framework.
>> + * @pclk:	APB clock if present, otherwise NULL
>>   * @spinlock:  serialize enable/disable operation.
>>   * @atid:      id for the trace packet.
>>   */
>> @@ -41,6 +42,7 @@ struct trace_noc_drvdata {
>>  	void __iomem		*base;
>>  	struct device		*dev;
>>  	struct coresight_device	*csdev;
>> +	struct clk		*pclk;
>>  	spinlock_t		spinlock;
>>  	u32			atid;
>>  };
>> @@ -51,25 +53,27 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>>  {
>>  	u32 val;
>>  
>> -	/* Set ATID */
>> -	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> -
>> -	/* Set the data word count between 'SYNC' packets */
>> -	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> -
>> -	/* Set the Control register:
>> -	 * - Set the FLAG packets to 'FLAG' packets
>> -	 * - Set the FREQ packets to 'FREQ_TS' packets
>> -	 * - Enable generation of output ATB traffic
>> -	 */
>> -
>> -	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> -
>> -	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> -	val |= TRACE_NOC_CTRL_FREQTYPE;
>> -	val |= TRACE_NOC_CTRL_PORTEN;
>> -
>> -	writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +	if (drvdata->atid) {
>> +		/* Set ATID */
>> +		writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +		/* Set the data word count between 'SYNC' packets */
>> +		writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> +		/* Set the Control register:
>> +		 * - Set the FLAG packets to 'FLAG' packets
>> +		 * - Set the FREQ packets to 'FREQ_TS' packets
>> +		 * - Enable generation of output ATB traffic
>> +		 */
>> +
>> +		val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +		val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> +		val |= TRACE_NOC_CTRL_FREQTYPE;
>> +		val |= TRACE_NOC_CTRL_PORTEN;
>> +		writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +	} else {
>> +		writel(0x1, drvdata->base + TRACE_NOC_CTRL);
>> +	}
> 
> Change "atid" type from u32 to int, then you could set it as
> "-EOPNOTSUPP" for non-AMBA device. Here:
> 
>     /* No valid ATID, simply enable the unit */
>     if (drvdata->atid == -EOPNOTSUPP) {
>         writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>         return;
>     }

sure, will update.
> 
>>  }
>>  
>>  static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> @@ -120,19 +124,6 @@ static const struct coresight_ops trace_noc_cs_ops = {
>>  	.link_ops	= &trace_noc_link_ops,
>>  };
>>  
>> -static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> -{
>> -	int atid;
>> -
> 
> Don't need to remove this function. Just check AMBA device case:
> 
>     /* ATID is not supported for interconnect TNOC */
>     if (!dev_is_amba(drvdata->dev)) {
>         drvdata->atid = -EOPNOTSUPP;
>         return 0;
>     }
> 
sure, will update.
>> -	atid = coresight_trace_id_get_system_id();
>> -	if (atid < 0)
>> -		return atid;
>> -
>> -	drvdata->atid = atid;
>> -
>> -	return 0;
>> -}
>> -
>>  static ssize_t traceid_show(struct device *dev,
>>  			    struct device_attribute *attr, char *buf)
>>  {
>> @@ -158,13 +149,12 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
>>  	NULL,
>>  };
>>  
>> -static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +static int _tnoc_probe(struct device *dev, struct resource *res, bool has_id)
> 
> As a result, no need the parameter "has_id".
> 
sure, will update.
>>  {
>> -	struct device *dev = &adev->dev;
>>  	struct coresight_platform_data *pdata;
>>  	struct trace_noc_drvdata *drvdata;
>>  	struct coresight_desc desc = { 0 };
>> -	int ret;
>> +	int ret, atid = 0;
>>  
>>  	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>>  	if (!desc.name)
>> @@ -173,42 +163,61 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>>  	pdata = coresight_get_platform_data(dev);
>>  	if (IS_ERR(pdata))
>>  		return PTR_ERR(pdata);
>> -	adev->dev.platform_data = pdata;
>> +	dev->platform_data = pdata;
>>  
>>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>  	if (!drvdata)
>>  		return -ENOMEM;
>>  
>> -	drvdata->dev = &adev->dev;
>> +	drvdata->dev = dev;
>>  	dev_set_drvdata(dev, drvdata);
>>  
>> -	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, res);
>>  	if (IS_ERR(drvdata->base))
>>  		return PTR_ERR(drvdata->base);
>>  
>>  	spin_lock_init(&drvdata->spinlock);
>>  
>> -	ret = trace_noc_init_default_data(drvdata);
>> -	if (ret)
>> -		return ret;
>> +	if (has_id) {
>> +		atid = coresight_trace_id_get_system_id();
>> +		if (atid < 0)
>> +			return atid;
>> +	}
>> +
>> +	drvdata->atid = atid;
> 
> Drop this change and simply keep the code for invoking
> trace_noc_init_default_data().
> 
sure, will update.
>>  	desc.ops = &trace_noc_cs_ops;
>>  	desc.type = CORESIGHT_DEV_TYPE_LINK;
>>  	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> -	desc.pdata = adev->dev.platform_data;
>> -	desc.dev = &adev->dev;
>> +	desc.pdata = pdata;
>> +	desc.dev = dev;
>>  	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> -	desc.groups = coresight_tnoc_groups;
>> +	if (has_id)
>> +		desc.groups = coresight_tnoc_groups;
> 
> No need to change for groups.
> 
> Just return "-EOPNOTSUPP" in traceid_show() if drvdata->atid is negative.
> Or, you could use the .is_visible() callback to decide if the "trace_id"
> node appears or not.
> 
sure, will updata.
>>  	drvdata->csdev = coresight_register(&desc);
>> -	if (IS_ERR(drvdata->csdev)) {
>> +	if (IS_ERR(drvdata->csdev) && has_id) {
>>  		coresight_trace_id_put_system_id(drvdata->atid);
>>  		return PTR_ERR(drvdata->csdev);
>>  	}
>> -	pm_runtime_put(&adev->dev);
>>  
>>  	return 0;
>>  }
>>  
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +	int ret;
>> +
>> +	ret = _tnoc_probe(&adev->dev, &adev->res, true);
>> +	if (!ret)
>> +		pm_runtime_put(&adev->dev);
>> +
>> +	return ret;
>> +}
>> +
>>  static void trace_noc_remove(struct amba_device *adev)
>>  {
>>  	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> @@ -236,7 +245,57 @@ static struct amba_driver trace_noc_driver = {
>>  	.id_table	= trace_noc_ids,
>>  };
>>  
>> -module_amba_driver(trace_noc_driver);
>> +static int itnoc_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	int ret;
>> +
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +	pm_runtime_set_active(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = _tnoc_probe(&pdev->dev, res, false);
>> +	pm_runtime_put(&pdev->dev);
>> +	if (ret)
>> +		pm_runtime_disable(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void itnoc_remove(struct platform_device *pdev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
>> +
>> +	coresight_unregister(drvdata->csdev);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id itnoc_of_match[] = {
>> +	{ .compatible = "qcom,coresight-itnoc" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, itnoc_of_match);
>> +
>> +static struct platform_driver itnoc_driver = {
>> +	.probe = itnoc_probe,
>> +	.remove = itnoc_remove,
>> +	.driver = {
>> +		.name = "coresight-itnoc",
>> +		.of_match_table = itnoc_of_match,
> 
> You might need to set:
> 
>     .suppress_bind_attrs = true,
> 
sure, will update.
> Thanks,
> Leo
> 
>> +	},
>> +};
>> +
>> +static int __init tnoc_init(void)
>> +{
>> +	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
>> +}
>> +
>> +static void __exit tnoc_exit(void)
>> +{
>> +	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
>> +}
>> +module_init(tnoc_init);
>> +module_exit(tnoc_exit);
>>  
>>  MODULE_LICENSE("GPL");
>>  MODULE_DESCRIPTION("Trace NOC driver");
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org



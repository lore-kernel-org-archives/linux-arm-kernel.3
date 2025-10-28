Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr8+i4dieCUMhOFBhZ6AFD4YLUnBtGBf1ti60Ls8B38=; b=I5LVcRswLz01Nan/9Pr6WJxqqi
	wfxDABtck/OZrTJIvjJE6QuMzK2XrHOs28ssCMx8/zt3DxO/GV+vpUvtdqWhsgGxDfuZwaWEuO51Z
	C7s7RO0WdDHvsWzPVQtAkYN8h1BP/v9HwqfsAAZ6dMPFFQ6cJE0FZlefy/KB7xjSrFR79F8Gl1/aR
	Sw/EzhmDnwvPnKOgmR2w7PKQjHtIW52Lz09fu9hWOuIj7ar6piC3wlknTELybxM38XEc/5GSmcpD/
	igxB4LorfspBn+m+0uC/8IGWJjdkZSOi2xqXNsqPrk1Q4sLtU9+JlACynWYznXk21TfbTkJJd1a4a
	yJxEX16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfE6-0000000FYo5-2piT;
	Tue, 28 Oct 2025 08:38:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfE4-0000000FYnF-0BZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 08:38:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7CCXR2546697
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr8+i4dieCUMhOFBhZ6AFD4YLUnBtGBf1ti60Ls8B38=; b=NHe8njQDuF3hHAed
	RaAr3nr7k8QfMiwgScJgWkZgbK4Ieo/ZokOyyPGNDJT7zYf2tkDeuNxS9YLtdn0k
	SuBJNMiVT5V2Lv1y02qS82O7UUMePtR7Z+9FNldPu/33BhkAmMZTc50YXv59eq5H
	2QTH/Ho+10u9OgmPWP7HaU0NbURv9uC9zCn1l7qSJ4tixUM6RiQ8P6pc8+uHH7h3
	wYTWEKCELDy+hzZmJ5X73+86hfQJnnBU5sbaSPvKsZqmXGtX8MKbCgMS/oheU+A5
	XltOBSl2rZDsJxiMEK4XcJN6u2ti7YSuYyunpvo/JoLd8uViCsN9i8SEgfUzS3u/
	YyoAZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2kemc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:38:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294baa12981so20334485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 01:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761640721; x=1762245521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr8+i4dieCUMhOFBhZ6AFD4YLUnBtGBf1ti60Ls8B38=;
        b=T/Wl01BdIXqfFPIg2edayUkeoJdRa9QoIfBwEvBXW+RlfAnAtJ9ySKlWlvhDUAsSLa
         fIVArpOw2i4qmkbjvURJZTtma0RA2jVztCjbcBeELALU7z6T64ggNiC/mvFfOXq2O96F
         ejNEwiXLiXQ/9f9g75vwYA7NqKBrx/fbON6+R4Ltm3HkRjl5Rayl7jeQGrjidwcQt0Mc
         rbomKC4b/nLKZy/yt1Rek2a4n7vnV5+GCCuxPYrEUUBQch5ENObVrCoYivioPArO3mcL
         QOeZoTAOJn1jYjRpOQruWAWIwh41OnIdIlRzgA73aEd2/9EzRCPq2tPCADvSnWJO2gXC
         pZhw==
X-Forwarded-Encrypted: i=1; AJvYcCXjLuhB7h5olyZ6JLoPKgKuxqaMdjhXgfkFlzfXDtyszA2/lb7eqsJBJbjwyfd11oFlSw7ITpBCi72vu+4xpuCb@lists.infradead.org
X-Gm-Message-State: AOJu0YzfpsqvKs8fyqL9rXdyG7HeN6Fwv8P7kTE6SqZ4iTO71KzuYabX
	krgcxfLShKtAfFBsB16Vs7rPEaL/FfITpZIXpKLjDXP1E6BrpxcBtcUAE9keemoqyE2BNmRtjcj
	ZWgkBHAAHWKZobwMTnkdT6/bLljEsQhIhSAkMe3B/wNotV9qATZrRxqtdL0opODlrIqXVoLaC8Y
	FFPA==
X-Gm-Gg: ASbGncvF6J5uG5tAyLZNQcLhiLFVT+uTTfl6/mY45VEOPDUyl9NZfnxdGR1p3VfYtC8
	QpNrUHqo6x4bU8AqPKJzmYFzehRA7iRSLRZA14W3Hx3a1z88D3bcnDCSmUjA/sDWpkci6Du75/+
	fUN1+q4kuSNG98JzyKYP/V8W+jF9An1e8KYgiRYGLv7aBUQpjpUDG1fRUs93JGzp9YQ3SOo2K3K
	Cn1GU1yLxIBidZeTJwnxcctIBbQSB858GlTbysXQ/atsy30apmJSzKV5CTMF3CZ0ETM5qhoeV36
	H4ULMtw7h2GUV3CPQHsCaemS7US85xYHJjWYGvAMUvZAyMxfEqIFgrMg9EHDFD1Fo6I4zbphcWW
	2omye8RrE9fi0pxWzNVhqkh6mDLu/l5nRZfwwC1v/+r8IH+dmEphP
X-Received: by 2002:a17:903:1a67:b0:294:9132:75d2 with SMTP id d9443c01a7336-294cc76659cmr25411335ad.25.1761640721257;
        Tue, 28 Oct 2025 01:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsiUHXuoFI2lMXRyC2KpD8nA8h3YvJAfAf8TZJLyassjBfe7izxKv57V5xxmVd3TZ5NRK17A==
X-Received: by 2002:a17:903:1a67:b0:294:9132:75d2 with SMTP id d9443c01a7336-294cc76659cmr25411075ad.25.1761640720407;
        Tue, 28 Oct 2025 01:38:40 -0700 (PDT)
Received: from [10.133.33.253] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0996esm107206015ad.28.2025.10.28.01.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:38:39 -0700 (PDT)
Message-ID: <6dcf793f-6f1c-4900-82e9-a6b53d45cdf9@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:38:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] coresight: tpdm: add static tpdm support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
 <20251013-add-static-tpdm-support-v3-2-a720b73e83db@oss.qualcomm.com>
 <7386e009-2d53-4a0b-8c83-a84f51b4b79a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7386e009-2d53-4a0b-8c83-a84f51b4b79a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8l_xfrbt_caMGRhzP4UE-IfnLz1RPWeQ
X-Proofpoint-GUID: 8l_xfrbt_caMGRhzP4UE-IfnLz1RPWeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3MiBTYWx0ZWRfXzr5IgPFzquWA
 G3r0P8UmPgjtBsHCNrTQgKy8hCDxewLIAZyhA15E5JxgBkD2junmuauewl1Gv/Jyl3Y3QId7me0
 grsGpZDu0TPO8vuPjyN5JShe0K+gOHilzwxEuAmubbMIJbGvHM3TQqctAbp8ujzzPTZYpKjrSv8
 z5vHbZWC7YRwydB5aRPPMphs3XcQg6Oskoth4JslH0tef7D2CahgQb6w3WPhgAMsHrdXr9bW/d3
 oF4OdmQMWU8gat3bycA4LUOereK1bUwYVrMgV36dOPzkpPuawqzTwfu7PrbTVMKBLovAJKo1ybr
 BqD8Sy01TBkuMw3a3fqdLIt9eGQu2DQ0crQCsaxJYRqOsK1fJeFu4nnv4MUCY90F6keC9Ni7Td9
 zsHWbbtB3pvThkzQGuBw+o9sFwF19w==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=69008112 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bEI7897pd3NgvWUkXe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_013844_207610_C96150D0 
X-CRM114-Status: GOOD (  29.66  )
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



On 10/27/2025 5:17 PM, Suzuki K Poulose wrote:
> On 13/10/2025 07:11, Jie Gan wrote:
>> The static TPDM function as a dummy source, however, it is essential
>> to enable the port connected to the TPDA and configure the element size.
>> Without this, the TPDA cannot correctly receive trace data from the
>> static TPDM. Since the static TPDM does not require MMIO mapping to
>> access its registers, a clock controller is not mandatory for its
>> operation.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 +++++++++++++++++ 
>> ++++------
>>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 ++
>>   3 files changed, 131 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..4e93fa5bace4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>       int rc = -EINVAL;
>>       struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev- 
>> >dev.parent);
>> +    if (coresight_is_static_tpdm(csdev)) {
>> +        rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +                          "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +        rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +                           "qcom,cmb-element-bits", &drvdata- 
>> >cmb_esize);
>> +
> 
> This doesn't match the "dynamic" tpdm case ? We mandate that static
> TPDMs have DSB and CMB. I would rather set the appropriate flags in
> 
> tpdm_drvdata->dsb/cmb in the TPDM driver for static tpdms and not
> let the "static" vs "dynamic" creep into the TPDA and other users.
> 
> e.g., in TPDM driver:
> 
> if (static_tpdm()) {
>    tpdm_data->dsb = has_dsb_element_bits_property;
>    tpdm_data->cmb = has_cmb_element_bits_property;
> }

Well noted, will fix in next version.

> 
> 
>> +        goto out;
>> +    }
>> +
>>       if (tpdm_data->dsb) {
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index 7214e65097ec..1766b0182819 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -495,7 +495,9 @@ static int tpdm_enable(struct coresight_device 
>> *csdev, struct perf_event *event,
>>           return -EBUSY;
>>       }
>> -    __tpdm_enable(drvdata);
>> +    if (!coresight_is_static_tpdm(csdev))
>> +        __tpdm_enable(drvdata);
>> +
>>       drvdata->enable = true;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -551,7 +553,9 @@ static void tpdm_disable(struct coresight_device 
>> *csdev,
>>           return;
>>       }
>> -    __tpdm_disable(drvdata);
>> +    if (!coresight_is_static_tpdm(csdev))
>> +        __tpdm_disable(drvdata);
> 
> minor nit: It is much safer to do this check in __tpdm_xxable() and
> return early.
> 

well noted, will fix it in next version.

>> +
>>       coresight_set_mode(csdev, CS_MODE_DISABLED);
>>       drvdata->enable = false;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -1342,10 +1346,9 @@ static const struct attribute_group 
>> *tpdm_attr_grps[] = {
>>       NULL,
>>   };
>> -static int tpdm_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +static int tpdm_probe(struct device *dev, struct resource *res)
>>   {
>>       void __iomem *base;
>> -    struct device *dev = &adev->dev;
>>       struct coresight_platform_data *pdata;
>>       struct tpdm_drvdata *drvdata;
>>       struct coresight_desc desc = { 0 };
>> @@ -1354,32 +1357,33 @@ static int tpdm_probe(struct amba_device 
>> *adev, const struct amba_id *id)
>>       pdata = coresight_get_platform_data(dev);
>>       if (IS_ERR(pdata))
>>           return PTR_ERR(pdata);
>> -    adev->dev.platform_data = pdata;
>> +    dev->platform_data = pdata;
>>       /* driver data*/
>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>       if (!drvdata)
>>           return -ENOMEM;
>> -    drvdata->dev = &adev->dev;
>> +    drvdata->dev = dev;
>>       dev_set_drvdata(dev, drvdata);
>> -    base = devm_ioremap_resource(dev, &adev->res);
>> -    if (IS_ERR(base))
>> -        return PTR_ERR(base);
>> +    if (res) {
>> +        base = devm_ioremap_resource(dev, res);
>> +        if (IS_ERR(base))
>> +            return PTR_ERR(base);
>> -    drvdata->base = base;
>> +        drvdata->base = base;
>> +        ret = tpdm_datasets_setup(drvdata);
>> +        if (ret)
>> +            return ret;
>> -    ret = tpdm_datasets_setup(drvdata);
>> -    if (ret)
>> -        return ret;
>> +        if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> -    if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> -
>> -    if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>> +        if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>> +    }
>>       /* Set up coresight component description */
>>       desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
>> @@ -1388,34 +1392,51 @@ static int tpdm_probe(struct amba_device 
>> *adev, const struct amba_id *id)
>>       desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>>       desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>>       desc.ops = &tpdm_cs_ops;
>> -    desc.pdata = adev->dev.platform_data;
>> -    desc.dev = &adev->dev;
>> +    desc.pdata = dev->platform_data;
>> +    desc.dev = dev;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>> -    desc.groups = tpdm_attr_grps;
>> +    if (res)
>> +        desc.groups = tpdm_attr_grps;
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>>           return PTR_ERR(drvdata->csdev);
>>       spin_lock_init(&drvdata->spinlock);
>> -    /* Decrease pm refcount when probe is done.*/
>> -    pm_runtime_put(&adev->dev);
>> -
>>       return 0;
>>   }
>> -static void tpdm_remove(struct amba_device *adev)
>> +static int tpdm_remove(struct device *dev)
>>   {
>> -    struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev);
>>       coresight_unregister(drvdata->csdev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int dynamic_tpdm_probe(struct amba_device *adev,
>> +                  const struct amba_id *id)
>> +{
>> +    int ret;
>> +
>> +    ret = tpdm_probe(&adev->dev, &adev->res);
>> +    if (!ret)
>> +        pm_runtime_put(&adev->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void dynamic_tpdm_remove(struct amba_device *adev)
>> +{
>> +    tpdm_remove(&adev->dev);
>>   }
>>   /*
>>    * Different TPDM has different periph id.
>>    * The difference is 0-7 bits' value. So ignore 0-7 bits.
>>    */
>> -static const struct amba_id tpdm_ids[] = {
>> +static const struct amba_id dynamic_tpdm_ids[] = {
>>       {
>>           .id    = 0x001f0e00,
>>           .mask    = 0x00ffff00,
>> @@ -1423,17 +1444,76 @@ static const struct amba_id tpdm_ids[] = {
>>       { 0, 0, NULL },
>>   };
>> -static struct amba_driver tpdm_driver = {
>> +MODULE_DEVICE_TABLE(amba, dynamic_tpdm_ids);
>> +
>> +static struct amba_driver dynamic_tpdm_driver = {
>>       .drv = {
>>           .name   = "coresight-tpdm",
>>           .suppress_bind_attrs = true,
>>       },
>> -    .probe          = tpdm_probe,
>> -    .id_table    = tpdm_ids,
>> -    .remove        = tpdm_remove,
>> +    .probe          = dynamic_tpdm_probe,
>> +    .id_table    = dynamic_tpdm_ids,
>> +    .remove        = dynamic_tpdm_remove,
>>   };
>> -module_amba_driver(tpdm_driver);
>> +static int tpdm_platform_probe(struct platform_device *pdev)
>> +{
>> +    struct resource *res = platform_get_resource(pdev, 
>> IORESOURCE_MEM, 0);
>> +    int ret;
>> +
>> +    pm_runtime_get_noresume(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>> +    pm_runtime_enable(&pdev->dev);
>> +
>> +    ret = tpdm_probe(&pdev->dev, res);
>> +    pm_runtime_put(&pdev->dev);
>> +    if (ret)
>> +        pm_runtime_disable(&pdev->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void tpdm_platform_remove(struct platform_device *pdev)
>> +{
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>> +
>> +    if (WARN_ON(!drvdata))
>> +        return;
>> +
>> +    tpdm_remove(&pdev->dev);
>> +    pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id static_tpdm_match[] = {
>> +    {.compatible = "qcom,coresight-static-tpdm"},
>> +    {}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, static_tpdm_match);
>> +
>> +static struct platform_driver static_tpdm_driver = {
>> +    .probe        = tpdm_platform_probe,
>> +    .remove        = tpdm_platform_remove,
>> +    .driver        = {
>> +        .name    = "coresight-static-tpdm",
>> +        .of_match_table = static_tpdm_match,
>> +        .suppress_bind_attrs = true,
>> +    },
>> +};
>> +
>> +static int __init tpdm_init(void)
>> +{
>> +    return coresight_init_driver("tpdm", &dynamic_tpdm_driver, 
>> &static_tpdm_driver,
>> +                     THIS_MODULE);
>> +}
>> +
>> +static void __exit tpdm_exit(void)
>> +{
>> +    coresight_remove_driver(&dynamic_tpdm_driver, &static_tpdm_driver);
>> +}
>> +
>> +module_init(tpdm_init);
>> +module_exit(tpdm_exit);
>>   MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.h
>> index b11754389734..9f52c88ce5c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -343,4 +343,12 @@ struct tpdm_dataset_attribute {
>>       enum dataset_mem mem;
>>       u32 idx;
>>   };
>> +
>> +static inline bool coresight_is_static_tpdm(struct coresight_device 
>> *csdev)
>> +{
>> +    struct device_node *node = csdev->dev.parent->of_node;
>> +
>> +    return (csdev &&
>> +        of_device_is_compatible(node, "qcom,coresight-static-tpdm"));
> 
> Why do we have to go check the firmware table all the time ? Could we 
> not cache this in drvdata ? Or even better, we can use the csdev->access
> 
> by using :  coresight_device_is_tpdm()
> 
> return (coresight_device_is_tpdm(csdev) && !csdev->access->base);

That's much better than mine, will fix it in next version.

Thanks,
Jie

> 
> Suzuki



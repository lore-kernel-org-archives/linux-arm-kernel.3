Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA85E6F07B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rueDqM5R/QJzu4XQ07WkZ5PUKgVruLuJrOOv/52SRXE=; b=nIwGYQdSfF3X0OCJG1WbbQJA9A
	LTgK978yiNDQtk2UpTrOVBHGCy8rUfgr60qDP7DwQ3FqTieVgogds2KrbCO0TO7AIIWj7P7Yoy2Hs
	hoOW5nv7YdDOylETkU8w6QvV0c91ghC3pABR//ueNWv8xIdldZqZBD650PpKSiv3AMFtFW/kiyRme
	xOuNBF5FGbUao0ATwSZD7G/xQUzXdJDNHYj4bwjCyGuIXBeRwm2J1EAcP5je1Tipbu+V610Ld6mPU
	Gknmud9F3xLCUfNZ3wHPvilLAIKufDINLY3rWoO+Clxdx3PtDMr4ez07Zqdm4N+aTJ6zJ77Jd5XOe
	tAPj5/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz50-0000000EnVb-3HiM;
	Tue, 23 Dec 2025 09:53:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz4y-0000000EnVC-1UAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:53:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8td4t2748481
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rueDqM5R/QJzu4XQ07WkZ5PUKgVruLuJrOOv/52SRXE=; b=W3BZKMDgz6qDfs2A
	ImINVOVBVssM9H+CCD5ziScGxEHvzMA6/DmfqZB+U+ue1XX2oABCLq5gfdmZVUfS
	ggwGRZ9xJrTkLdGVfqf+mxBQCt5jW8i3WFpnO3mGkbGQJx+9iaIrOi9fmtTD4+a4
	XBSt6jzAwBEpsw8WzSMEjg1hNJKnzIxp68VJX+LE9Z8ZVa1AGjXdYqeucVYfMpDH
	ASM5UCALH3g6ssmmYtPhWFxnh6klSgtk37hpBynMDyz6XEPoYgeUHKan2R0dtFZJ
	oGk0JDdkH89iCfQbq7Hl3czpGcgQi1BJHMTlQW3wPndvdgZcwx5Ai/BMUABw5+75
	5Z/GDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csm8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:53:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso107910195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766483599; x=1767088399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rueDqM5R/QJzu4XQ07WkZ5PUKgVruLuJrOOv/52SRXE=;
        b=MW3KHC8xCTAwvusCmX7W0p359/lpg0FaYKD1G9V1KpRvO26ubXhfyDPE+NylLi7zA6
         DUVwcfVQ14FrULyHiL2V3y/l5xNIjsD/RRkJFI2aUSpaeGnAYYKhxpT0uNnDaPet25NL
         tx1Os9bxo7oac1mo7YOVlGKLbFepBQli88nk8CL4w5ZJj26XcZ/nKDm6cwa0oFLDHFsM
         +zelWk2Q0K9fJY+JqiDO0UyNaA/wsG3UHkMKd86E3tCTS3uu5sTtDb6xSMynXW1GNBrV
         4GYMxfncOwGz7ZbUhp/+/cBw2qoe3rkl/EDfnvMKEdLgmHoyoFzmAE89gSPqJaC4SVY7
         hRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483599; x=1767088399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rueDqM5R/QJzu4XQ07WkZ5PUKgVruLuJrOOv/52SRXE=;
        b=nuqQhQvTjYc1jKKa37jFZOYX9Gm7fcZmM84QwExnH762EBe9mg64+np5Q8bwPga48M
         w2beTwfdy38g1L7rD36S9H4Xr3Ni+gnyau2FXBQvESBubLWJulC94sCHIm8QLbMp4gVs
         nGamkosxM0aBsj3B0fs3bE8yOLPgbIi345D45QYVDD8Of2am5wdpHWH0BBJEJeDL7wdm
         AZUWrYpxGR/5ntr1xQ2rCK8yXPpqr6BNIS3U1kWRdlsl6rCTonvau2z+vzrUMpCUskAz
         FE45QDoecFUEnhCqpyK1FgT/BQRbHca1RqS/XlmHqBMyCWG+rgmEQsnvAWbme2+P1K4g
         B9oA==
X-Forwarded-Encrypted: i=1; AJvYcCUBWd8Z3pgY63UJrWWIrMWN0Qdy++ckhVVMbNmyYfbyXjX/Q3UnhFeCrhl0D1ZeRpN+KtGgIpAsT+RMSamKopNI@lists.infradead.org
X-Gm-Message-State: AOJu0YzpotsbvG4NwX1HyTy728/UyvumJT1FmugEGuYpEec0U7McBjlQ
	XSoZUws7VkIjvtnUbUTvxlyYaju2RsjIC/0aXazs51/hieyVK5gVob+bE9JPU2LDgok08qFs8+K
	j6DG/NnFnPbFLcm8pKHOzujp4uHJ5rrj9K5DKvcoqMblzhOwZi3apHIdh7xy0DB8bpfUaNbB06h
	4evg==
X-Gm-Gg: AY/fxX5FKAs8sktss5grBOvY1Zn0m/1AFrTyfXGXJUdwTYeUMxz1ehA+dKupslsTIJW
	3V6h9Yccjm27zSsRtAiAkBsUz9q5H2VT5FyZKCjXGxMoIadQ9kVnRjrDyi+JG/C0JjLy5oRKn13
	bksIAGLqhNYbrajLromi2SDMts+IdvpI7L8Db/xMwalMkfvuolXENQ9JzbJDde+zhIEOvnwWVWc
	vZx/dxIrA6S++FTVMaSNvY13Cssqssj7yjnpU8z8wAvuLSHqrBsM2FjJBaPsoSertMiKniDwlWT
	sFp6nXBKkrWFgXcTRKaRUrGmYwW9cQ8x9eW+kCRxTINvQ37REccsWdxdffYJe+HhIwDOf8hudj8
	vvXiImnuUrsSLPO+KelvpJ4iNJHdgwDbI+sxx0+nH0riB2Sd/8NHce2IqYRJU7d3iqH1qnkvqGc
	s=
X-Received: by 2002:a17:902:e803:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a2f2a420e1mr140856995ad.61.1766483598981;
        Tue, 23 Dec 2025 01:53:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNt7A8ugJxNnv6i4qUo7cz7Q5h/AKiyqpJFPuFCzO3I1pykcdS9W5estsBjuHvSKmn24d4mg==
X-Received: by 2002:a17:902:e803:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a2f2a420e1mr140856825ad.61.1766483598453;
        Tue, 23 Dec 2025 01:53:18 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223aab0sm12603184a91.13.2025.12.23.01.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:53:18 -0800 (PST)
Message-ID: <23737351-e254-4b2c-a3e3-bc7eebb1c025@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 17:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
 <20251223-add_sysfs_nodes_to_configure_tpda-v7-3-db4e6810047c@oss.qualcomm.com>
 <ab53c4e1-e0a2-4a6b-840b-a84e9b236e8f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ab53c4e1-e0a2-4a6b-840b-a84e9b236e8f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3OCBTYWx0ZWRfX094Z0xZn1Si2
 G8j42xioi6pWJS1OmESeFNqMmyuajYftdMF1bonQX6w0jZsQI2IAwyUHRlvZNt3sF5LN1KSEITz
 h+HOzwWDmhTHf24nAWtwxBuDyERcXPEjAD76EwGvWPaWKzB5WqFOEZDnUCx3AuZTQvz2ewVLCcd
 DsyAiMgLq8VN1FNIHytNJ7D+aUIzz4ZPDYB9ghUEPann+7Kuv6iBAKmX8qrAw2eTtFLnY7MXmq+
 i/zazkd7ziaIe0o42ruPF/iYUV4oMtogSWwzMsYxELWzfAzR+s/8aXcSnkcf8x27OL0aF0YcYNY
 lJqgTLM2zEsDqjR268CS4MwQv6itYmxVR2mmBor9MRRP44GVh0QDMLeWVukQSxPlX9FCUqqYjCd
 R0SWVGahoQcIik6v5BPJnpB2UIg2Jwqy0kQpdnF/hT8WRUu4ore02dCsWJUGbNA7EP61iu7n2YH
 iZ3wEAabPWqWWOve/9w==
X-Proofpoint-ORIG-GUID: oSrhzNFXh6n3KKR-jbPtctMN4jkLBlzf
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a668f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ftp70H-Omfm4tq10K7kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oSrhzNFXh6n3KKR-jbPtctMN4jkLBlzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015320_437915_DBC5B655 
X-CRM114-Status: GOOD (  23.66  )
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



On 12/23/2025 5:49 PM, Suzuki K Poulose wrote:
> On 23/12/2025 08:41, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> The TPDA_SYNC counter tracks the number of bytes transferred from the
>> aggregator. When this count reaches the value programmed in the
>> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
>> tools to accurately parse each valid packet.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 18 +++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 90 ++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       | 10 +++
>>   3 files changed, 118 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index c8bc7b19ab25..c989eea1ef59 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,21 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>>           global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/syncr_mode
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set mode the of the syncr counter.
>> +        mode 0 - COUNT[11:0] value represents the approximate number 
>> of bytes moved between two ASYNC packet requests
>> +        mode 1 - the bits COUNT[11:7] are used as a power of 2. for 
>> example, we could insert an async packet every 8K
>> +                 data by writing a value 13 to the COUNT[11:7] field.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/syncr_count
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set value the of the syncr counter.
>> +        Range: 0-4095
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index d24a9098f1b1..8283e16ec400 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -163,6 +163,20 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>        */
>>       if (drvdata->trig_flag_ts)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>> +
>> +    /* Initialize with a value of 0 */
>> +    val = 0;
>> +    if (drvdata->syncr_mode)
>> +        val |= TPDA_SYNCR_MODE_CTRL_MASK;
>> +
>> +    if (drvdata->syncr_count > 0 &&
>> +        drvdata->syncr_count < TPDA_SYNCR_COUNT_MASK)
>> +        val |= drvdata->syncr_count;
>> +    else
>> +        /* Program the count to its MAX value by default */
>> +        val |= TPDA_SYNCR_COUNT_MASK;
>> +
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -385,8 +399,84 @@ static ssize_t global_flush_req_store(struct 
>> device *dev,
>>   }
>>   static DEVICE_ATTR_RW(global_flush_req);
>> +static ssize_t syncr_mode_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val, syncr_val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);
>> +}
>> +
>> +static ssize_t syncr_mode_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    /* set the mode when first enabling the device */
>> +    drvdata->syncr_mode = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(syncr_mode);
>> +
>> +static ssize_t syncr_count_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    val &= TPDA_SYNCR_COUNT_MASK;
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);
>> +}
>> +
>> +static ssize_t syncr_count_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf,
>> +                 size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (val < 0 || val > TPDA_SYNCR_COUNT_MASK)
> 
> Checking "val < 0" for an unsigned type is invalid. Simply keep the 
> second part.
> 

Sure, sorry for the mistake. I forgot it’s an unsigned value here.

Will send a new version to fix it.

Thanks,
Jie

> Suzuki
> 
> 
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->syncr_count = val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(syncr_count);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_global_flush_req.attr,
>> +    &dev_attr_syncr_mode.attr,
>> +    &dev_attr_syncr_count.attr,
>>       tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>>       tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>>       tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 1cc9253293ec..56d35697303a 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger global (all ports) flush request bit */
>>   #define TPDA_CR_FLREQ        BIT(0)
>> @@ -36,6 +37,11 @@
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* TPDA_SYNCR count mask */
>> +#define TPDA_SYNCR_COUNT_MASK        GENMASK(11, 0)
>> +/* TPDA_SYNCR mode control bit */
>> +#define TPDA_SYNCR_MODE_CTRL_MASK    GENMASK(12, 12)
>> +
>>   #define TPDA_MAX_INPORTS    32
>>   /**
>> @@ -52,6 +58,8 @@
>>    * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>>    * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>>    * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>> + * @syncr_mode:    Setting the mode for counting packets.
>> + * @syncr_count: Setting the value of the count.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -66,6 +74,8 @@ struct tpda_drvdata {
>>       bool            trig_freq;
>>       bool            freq_ts;
>>       bool            cmbchan_mode;
>> +    bool            syncr_mode;
>> +    u32            syncr_count;
>>   };
>>   /* Enumerate members of global control register(cr) */
>>
> 



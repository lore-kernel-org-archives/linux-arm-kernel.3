Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF03CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3ZmNgPMfhfr75Jy+s9Ep5b6gD2yM6Jzf4SvrXiJ2Lc=; b=hgCzvS/Q20JMEushMlLjs5pAsb
	Xf0kdCioEm5sCpqK3iL3bvFSwstzYOssq07H/Ccw6fun6wSKGJyDE6qek+mBzAZC4AF76qXJEurgO
	O3Q1Ryzi/sEBERCPOlve1kEBrAO/Ve+nJY4VpqB1HLtRQAwl6ZUzUpy+4Txf0zltDwF7gxLQ1VFG4
	rWhYgaGfRsgEPzH/Rq/zrzz+RXlE4hUC7a8dCwRwXuKjmisNBFI85XPBPnENbNguA37Lz1kii0oDP
	0sYanVccKEZkM/fgRwL4tnemb2rtZbK3e+MPQz9qsE8EPIGhxWW+zGXqHvTPTgIJBtQSGqrRTKyDT
	hXaoEe1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzm-0000000F9uw-0dVB;
	Wed, 27 Aug 2025 11:07:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCIp-0000000Eotr-0RSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:18:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kIMW029319
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3ZmNgPMfhfr75Jy+s9Ep5b6gD2yM6Jzf4SvrXiJ2Lc=; b=A0ZDD+165l9r6he/
	0mWHt472B5s7FWBMG7a9bmindEt4NPoSB4zXk8JSX4wmpv1dKRcjbCUIsOZCtdHT
	6Dzwl1XUzJ+QLFvoiczD3gwMiRuteOc2kXvQwwDO1O1P//gAGoDk68ItxKthnWwv
	X8nTNXE4qtvxSrSzn8r+CGaCTwOp0SJ93IW6bSt4Nj5WZ3XQNcH2ylnCMSb7nXBq
	HCGXc1rAVIAG8iGi7wd6N9Z3dBvXsh7TbhgNDi+sl2q+X85lebnQlMzO3P5MUwmg
	qpIqI8wWtOaJ/Kr37N3PWvC8SEHeiGzAo+CrAkdIYEskvmoPKuQJPjufmV12Mouc
	FXX6hA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2v920-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:18:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246a8d8a091so83596175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286325; x=1756891125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3ZmNgPMfhfr75Jy+s9Ep5b6gD2yM6Jzf4SvrXiJ2Lc=;
        b=tizlbThjJQIyX63h9JilE4ZyzRHKcyBaDesbiRq9+hR15nyTZ2h7LqIRFlb3l5raNG
         6ZPN69TTGBhJX7xu9k/yYYWm/m2UZR2C9qThpkkRUgDiMbUD5ZAAt+/Dy/SqhJHnbhYE
         CvHucXmLka8k7W6NEvZaMjYzqt1LdJmQ7acoG0iKJywACkkfomINQoaz8MF+SLm7tKDa
         l+R7auj/hf9h2zYFEpGLdpEwzmIghountVfyKY2iR6/rAaP6/Px52lz6QKo2jQxyiTeo
         KTuGUQSWJ+cdsWl107vSX2ko5JlHekYKlR3+Mgilk5iDikaUS0YuXqwvl1RElLr+Ztsg
         bnUg==
X-Forwarded-Encrypted: i=1; AJvYcCV63A7qSuezZriI1AEn6ByRKRLpIQD9qKE9ht+TxsBDYDYXdPrjW+Fc09OgwPbj1UY3Cz4UJNBBiEg7/GthYCCj@lists.infradead.org
X-Gm-Message-State: AOJu0YwGqeKs76v0XlqOqX9z2b3ixz3sJnyCN9ZCvyB3+9YWCSPIy1Vq
	D4LbZKmkXcFj+f83wBGcjg3oM1LtCMfnlWSHII3oxcL/04TPjBehksOUK2o0tdbzpQGfPcijNvC
	NjWk28/SUvn37BMwYDWJuJhhp/w6fcsykDpdxHhk4Xzgbi7ViHN8AvyAuC12+PC+JQwhZrjKntP
	BK1A==
X-Gm-Gg: ASbGnct5Vcw4Xv6+bfVKbYv599O1pSYgaUFpM8aITKjLLxj8oVFUT7Lo1+KzNH+xEcy
	U/xMGa1c94JgBfbz2E1jm1OSs/pG6KwUtS3rlHs0HyisrCcso6R2X6Mi4jIiyjwME9ZXb50um+B
	kEOCNZtE2atCzkgGgQqG+8MlQcHpnHtQ7rFFuoDtKbVl9QiDNBAZZ7lFr/ocNtMxWkTXlhGbCk1
	+Z1d8ZzOKSIA0/Z1kdKUmPEYPA3VxgzeUeVa+Gj08dmVHm4oY6fsvNPugzhLWtGZO0mG24vcI8B
	YXSt/TGPaqr1qbordbWIp/Ia7dmZPyu7YBkyOYNs9LZYi5/fj8KvSoLtB2DIXEsQBiueNutlubY
	aTyUjjj9uSw5eHa4LMO7fqaXO6FT5Qg==
X-Received: by 2002:a17:903:388c:b0:248:a1d1:28ae with SMTP id d9443c01a7336-248a1d129d7mr14311235ad.39.1756286324810;
        Wed, 27 Aug 2025 02:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5/6oHGHXze6Sp8tZZFAPJM4F1BeCYoxBde0pV4H8aBjDQSfR/ZYTsY9gz+mOb8HWOUU766A==
X-Received: by 2002:a17:903:388c:b0:248:a1d1:28ae with SMTP id d9443c01a7336-248a1d129d7mr14310795ad.39.1756286324256;
        Wed, 27 Aug 2025 02:18:44 -0700 (PDT)
Received: from [10.133.33.198] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f11esm116975865ad.150.2025.08.27.02.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:18:43 -0700 (PDT)
Message-ID: <27282f8d-e27d-45c9-b616-28d2c62a4e09@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:18:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-2-jie.gan@oss.qualcomm.com>
 <5acf3562-e69a-49b0-8cb6-9e57c5ad4368@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <5acf3562-e69a-49b0-8cb6-9e57c5ad4368@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68aecd75 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=OiUlF2ysgpT-6eO3SmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0NjrjaBZIllV
 2fYouwh8MJYhAaI5zURXFrS/yZayTV7UhtznNNIRhXQiXQJMzw2/MHkwwEs2Yuit67aas1X+ELl
 PhoN5z5x2SL5Of5cFruPYKM6jYJTHDVpVIyK7Z9Hjbujt6HQzJlmD2qiXiDofmPgVKFWG5YMEhF
 LQjFHC/KobUdF2Osegno3RzrmoxqdWKrxcGvOZM5/JPG4a5HkYchmFJmeGcS82OeLK9jRH/DR6s
 iQEsGdh0BcV7v8yleYb+fTtP3xN72RvcDE1KOY0PpoLaXcIYXVzuSfW6QBkZE1lZ8W06X62UMS1
 kuKhTz5mA9Jqaxi+hZrxp5Ni3u0gCG4leQr/+VF/7v8UPq3vT9EE90nlpGVML4TeMsRxz7ObZLK
 MjaiX1W3
X-Proofpoint-GUID: Shp3QFJGsOVqcXle7lXs0vfBKtxLv0mh
X-Proofpoint-ORIG-GUID: Shp3QFJGsOVqcXle7lXs0vfBKtxLv0mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_021847_159440_075D3DB1 
X-CRM114-Status: GOOD (  21.58  )
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



On 8/27/2025 5:06 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 227 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++-
>>   3 files changed, 296 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..fb651aebeb31
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -0,0 +1,43 @@
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_async_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger synchronization sequence 
>> interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FLAG packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FREQ packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>> +        global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>> +        Value 0 means raw channel mapping mode. Value 1 means channel 
>> pair marking mode.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 4e93fa5bace4..647ab49a98d7 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>       u32 val;
>>       val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val &= ~TPDA_CR_MID;
>>       val &= ~TPDA_CR_ATID;
>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>> +    if (drvdata->trig_async)
>> +        val |= TPDA_CR_SRIE;
>> +    else
>> +        val &= ~TPDA_CR_SRIE;
>> +    if (drvdata->trig_flag_ts)
>> +        val |= TPDA_CR_FLRIE;
>> +    else
>> +        val &= ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val |= TPDA_CR_FRIE;
>> +    else
>> +        val &= ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val |= TPDA_CR_FREQTS;
>> +    else
>> +        val &= ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val |= TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val &= ~TPDA_CR_CMBCHANMODE;
>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>> +
>> +    /*
>> +     * If FLRIE bit is set, set the master and channel
>> +     * id as zero
>> +     */
>> +    if (drvdata->trig_flag_ts)
>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -274,6 +302,203 @@ static const struct coresight_ops tpda_cs_ops = {
>>       .link_ops    = &tpda_link_ops,
>>   };
>> +static ssize_t trig_async_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
>> +}
>> +
>> +static ssize_t trig_async_enable_store(struct device *dev,
>> +                       struct device_attribute *attr,
>> +                       const char *buf,
>> +                       size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_async = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_async_enable);
>> +
>> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
>> +}
>> +
>> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_flag_ts = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>> +
>> +static ssize_t trig_freq_enable_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
>> +}
>> +
>> +static ssize_t trig_freq_enable_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_freq = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_freq_enable);
>> +
>> +static ssize_t freq_ts_enable_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
>> +}
>> +
>> +static ssize_t freq_ts_enable_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->freq_ts = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(freq_ts_enable);
>> +
>> +static ssize_t global_flush_req_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> I know in practice it's probably only either 0 or 1, but this should 
> either be decimal or have the 0x prefix otherwise it looks like a mistake.
> 

You are right. It looks strange here and I missed this point. I think 
display the value in decimal would be better.

>> +}
>> +
>> +static ssize_t global_flush_req_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val |= BIT(0);
> 
> If you only set bit 0 do you only want to show bit 0 in 
> global_flush_req_show() above? The sysfs files should be divided up by 
> function rather than dumping the whole register, otherwise tools need 
> their own copy of the fields to interperet them.

Got your point here. In the show function, we only need read the value 
of the bit 0 and display the value.

Thanks,
Jie

> 
> 



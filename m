Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA7FCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnqFYdYnAI6qy0g/lFT7xy643I4OKYgE1hSB/nvF0PE=; b=Ucqc2sEqBhk3405AISvNUrWwy3
	G2ka62PuxsaJWSUP9S3KNKNk8XHF2TSusvohHaIwcQUhEFeQO5R+Q/rYi1w4lHf8m+5LbfAHftnum
	on6dnG2c4cPdIbNkxBBRZPQaG0nBjZ3G08ZUJo669cBUynQXu2rw+yHBNZ+NxD/WsIwLMG3TBhkhI
	wNcDGGzPRNhCMdPCtHrUNVCs2Adz0WOPxlCsX54dWDJ0YwNDbfHRPnG3aKeseKYgQzo2vX3oZ9LYq
	eQ07fXJrAkWW1BOejimOKXfMD4ZbNg6ZX66sfyXN0k3kHxtAQT73VZZybtFc598W2BN0VEMrKky6U
	NmW5YeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpif-0000000BGKZ-3uDt;
	Tue, 26 Aug 2025 09:11:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpfx-0000000BEwv-0bXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:09:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q98lXs018862
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnqFYdYnAI6qy0g/lFT7xy643I4OKYgE1hSB/nvF0PE=; b=SIcHIoW3+e1+hl/u
	sASIDqWB3f3IJt7xZ5Lde7MNp6yztMLqJNkwpKkMRkWXAP0VL4PtOS6BLE03xgVF
	1iP3VkaUR+yBxLstLefwCpb46u1UYu5LefP6WYikuSxWIw9a/55w25yaqieGXCmI
	LGNCblRpW5Od5YtyLHw/HjMbTE6U104B3r/edPhhPxVF/dUd33iEaYYYHjXKq+pX
	oyRZa3hjGgxkvkyfCUk1TnIQOqnmdgC3SDjpqKV+36QneaybvZrs4UCiseF1+O8T
	OFCHzowfEvtKC+KOsAd/FON3CGQoB2nf3/75NJJ3U9N9FQbRyJprwXEdrt7wC4rT
	1QvzhA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xprb9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:09:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174b3427so3867613a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199347; x=1756804147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnqFYdYnAI6qy0g/lFT7xy643I4OKYgE1hSB/nvF0PE=;
        b=dS1XLE6mgWliShi+heuA5+RxDHngqw6uYlEU2g2qH7NAbnA/fwVAY94czI+WuBWBDQ
         P3EFPC92qdYRRDjPivHDtVxBl50O1Db+vTDscMYaWmqObR4h2284Dg2KF4PPdlx0HJ/2
         ewuO+uJ0QsfeOlNGv5XBzM6S8gNsDugF+4KWVkM2+GUntJlZe4FshvBNBWoGHTuyp3oe
         vs2gWsndtE3YVf995OZACOhH2oBFt0UTE8zSqHgjbhssCllAef/UDky0oUekON5RK/51
         qH4xcaonhOKgHg54uQq4QVZokztoH607gy5HGAkSIMwupgK2iXFzEUyeN769bx6OdKw6
         ZebQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXE4o1KZX4PWGpoNNuY9MgbGfHAmYkPUT7f45VjYK+ieU0Dzis4+mlSNcrK32QtT9ok6iMO1Fbypk9Ql0YPQmR@lists.infradead.org
X-Gm-Message-State: AOJu0YyRkcZH8eb62vSu3ZojCeivyljhTjAAuqsoNXAxhg5iQGwm59lk
	dTa1fq6M1aGkCtlvu5QE/p4RrSnHaMr6QnBT5fGO+hfyKkcWl3/NMFidGtN2/cmueS/8FJE8XYI
	L3v9RCdrEM3hPtqzjM4lSosbSZHOvXu9C+a2rhdqMoiPURr/3PkSMMBQy9AgDC7yLtqsfEcIKtw
	SXTA==
X-Gm-Gg: ASbGncucEzlHn9NMm9fiAolqeWRknoPVXyl2EbWlxtolgaED9GJD8WehsbehdSx37aP
	vyHZof8bom6yr2bQvw63ZaZsFjP7lNAr8wj/zDddbh5LDVkP1x+vbi1Y10CloBHblZJucqEtBhN
	9hoZU6NTknFo5qX6YPPlxURXYFPHd2wVHvv7qXaYvg3JzRxWGnBbc+Sf7kMbLgOVUD1kp55STI3
	Acw1lG/4ri8/I0uItmHMtg/DGeAGnXvUIzEAmZmlDaMK8H/KwZyxRV/wG8jgfXww7Xr5K79R/Se
	S9+CrEmzgaMko1Jhs5HGi9Q6W6RvJSrmqwz4fbJAJRNoUguUBdloeVSpCXq9Ew8eJNpIZ8IqHVs
	Pu7BKHWm6gyNPmpVxUeFY2o9GMktKuA==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id d9443c01a7336-246a4e655fcmr129648655ad.56.1756199347494;
        Tue, 26 Aug 2025 02:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLZ8gUKGZgRJzBkCDuupy84GZojcoMPPNal4p4dIJ5QE6b2n42WRNgvPseXrP/6XDjI06Fpw==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id d9443c01a7336-246a4e655fcmr129648195ad.56.1756199346865;
        Tue, 26 Aug 2025 02:09:06 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466886474csm89596705ad.76.2025.08.26.02.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:09:06 -0700 (PDT)
Message-ID: <f6f6f295-114a-4622-ab2e-36619b3bc6ae@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:09:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
 <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ad79b4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lBpSeHXHZXHvFma1IaoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Cc5VLWW2d7V_axtSBcuI1hbt0McfWOmY
X-Proofpoint-ORIG-GUID: Cc5VLWW2d7V_axtSBcuI1hbt0McfWOmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/WiAQWWhTC84
 /hi+5g9Px0UNzwW0zeb7s8ftkuD1WEUy4AKy73MBnh003ktxUh+eWMy7wD9t1KUAk7auz0q1a0T
 +hZhOWRKewsjwo/RNV3tGDBWanqWg4t/a0OavUng/rSnSNEFsN/bS3H5ErU4Rs8YwcNTomRWDx7
 BdYj7EJr5AAMiXxOVrwwtnmvrbDSAy02nhQSs4V5vyZj3ilJLgzzBn1myJicb4GunsGeZcIU2+m
 N41zE7cbN/0TwpLD/86hk+55FNzrFH3v6NDou61hXJaVMI+HbHE351aPFawcB6+T7pqlz9oAoYt
 QemM3a9yZgg+l/d0cqwvxRa3k+89Zsnli8QCRUMY/pIsLbvD/rScUGIzc4VY55YqdOSkNsZvDys
 rTHilU/T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_020909_194829_DB3C801D 
X-CRM114-Status: GOOD (  24.69  )
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



On 8/26/2025 5:00 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>>   3 files changed, 311 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..e827396a0fa1
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
>> +        (RW) Set/unset global (all ports) flush request bit. The bit 
>> remains set until a
> 
> I don't think you can unset? global_flush_req_store() only does 
> something for set.
> 
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
>> index 4e93fa5bace4..cc254d53b8ec 100644
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
>> +        val = val | TPDA_CR_SRIE;
>> +    else
>> +        val = val & ~TPDA_CR_SRIE;
> 
> val |=
> val &=
> 

Will update in next version.

>> +    if (drvdata->trig_flag_ts)
>> +        val = val | TPDA_CR_FLRIE;
>> +    else
>> +        val = val & ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val = val | TPDA_CR_FRIE;
>> +    else
>> +        val = val & ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val = val | TPDA_CR_FREQTS;
>> +    else
>> +        val = val & ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val = val | TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val = val & ~TPDA_CR_CMBCHANMODE;
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
>> @@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
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
>> +    if (val)
>> +        drvdata->trig_async = true;
>> +    else
>> +        drvdata->trig_async = false;
>> +
> 
> drvdata->trig_async = !!val
> 
> same with all the following ones too
> 

Will address all codes.

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
>> +    if (val)
>> +        drvdata->trig_flag_ts = true;
>> +    else
>> +        drvdata->trig_flag_ts = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>> +
>> +static ssize_t trig_freq_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
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
>> +    if (val)
>> +        drvdata->trig_freq = true;
>> +    else
>> +        drvdata->trig_freq = false;
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
>> +    if (val)
>> +        drvdata->freq_ts = true;
>> +    else
>> +        drvdata->freq_ts = false;
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
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
> 
> -EPERM doesn't seem right, maybe EBUSY or EINVAL?

I think EINVAL is better just because the TPDA is not enabled yet. Will fix.

> 
> Also don't you need CS_UNLOCK() for reading? I'm not 100% sure but I 
> found one example of it in debug_init_arch_data().
> 

Sorry about that, I shouldnt miss the CS_UNLOCK&&CS_LOCK pairs.

>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    return sysfs_emit(buf, "%lx\n", val);
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
> 
> if (!val)
>    return size;
> 
> Check this first, no point in taking the spinlock or checking the 
> refcount if you aren't going to do anything.

Will fix it.

> 
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
> 
> ditto for -EPERM

Will fix it.

Thanks,
Jie

> 
>> +
>> +    if (val) {
>> +        CS_UNLOCK(drvdata->base);
>> +        val = readl_relaxed(drvdata->base + TPDA_CR);
>> +        val = val | BIT(0);
>> +        writel_relaxed(val, drvdata->base + TPDA_CR);
>> +        CS_LOCK(drvdata->base);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(global_flush_req);
>> +
>> +static ssize_t cmbchan_mode_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
>> +}
>> +
>> +static ssize_t cmbchan_mode_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf,
>> +                  size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    bool val;
>> +
>> +    if (kstrtobool(buf, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->cmbchan_mode = true;
>> +    else
>> +        drvdata->cmbchan_mode = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(cmbchan_mode);
>> +
>> +static struct attribute *tpda_attrs[] = {
>> +    &dev_attr_trig_async_enable.attr,
>> +    &dev_attr_trig_flag_ts_enable.attr,
>> +    &dev_attr_trig_freq_enable.attr,
>> +    &dev_attr_freq_ts_enable.attr,
>> +    &dev_attr_global_flush_req.attr,
>> +    &dev_attr_cmbchan_mode.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group tpda_attr_grp = {
>> +    .attrs = tpda_attrs,
>> +};
>> +
>> +static const struct attribute_group *tpda_attr_grps[] = {
>> +    &tpda_attr_grp,
>> +    NULL,
>> +};
>> +
>>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>>   {
>>       int atid;
>> @@ -289,6 +528,7 @@ static int tpda_init_default_data(struct 
>> tpda_drvdata *drvdata)
>>           return atid;
>>       drvdata->atid = atid;
>> +    drvdata->freq_ts = true;
>>       return 0;
>>   }
>> @@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       desc.ops = &tpda_cs_ops;
>>       desc.pdata = adev->dev.platform_data;
>>       desc.dev = &adev->dev;
>> +    desc.groups = tpda_attr_grps;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index c6af3d2da3ef..b651372d4c88 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -8,17 +8,34 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Packetize CMB/MCMB traffic bit */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* Mode control bit */
>> +#define TPDA_MODE_CTRL            BIT(12)
>>   #define TPDA_MAX_INPORTS    32
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>> +/* Bits 13 ~ 19 is for mid value */
>> +#define TPDA_CR_MID        GENMASK(19, 13)
>>   /**
>>    * struct tpda_drvdata - specifics associated to an TPDA component
>> @@ -29,6 +46,11 @@
>>    * @enable:     enable status of the component.
>>    * @dsb_esize   Record the DSB element size.
>>    * @cmb_esize   Record the CMB element size.
>> + * @trig_async:    Enable/disable cross trigger synchronization 
>> sequence interface.
>> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request 
>> interface.
>> + * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>> + * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -38,6 +60,11 @@ struct tpda_drvdata {
>>       u8            atid;
>>       u32            dsb_esize;
>>       u32            cmb_esize;
>> +    bool            trig_async;
>> +    bool            trig_flag_ts;
>> +    bool            trig_freq;
>> +    bool            freq_ts;
>> +    bool            cmbchan_mode;
>>   };
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B49CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rJ7RQ7iMaxrweLuf0/TuG+nG9I0o3A0GkBWILSS2Jw=; b=NN7NfYwRMV9isE5KPCL6egT0jy
	GpioOc3KWRk+ZXLHyCxwdCxIM3mV3un7feqVG48AmLJiTS4rDZJ4GPxQ1xvjkbfdUowRYt8+lW9X2
	BZyPQ9XzEoFB600cmYZPtbjzpFENvDIJWCRheP5Tg2faaTzViZLE/xiqEQWnAv7oKtD1F9OLdbRm2
	t8MrTWA6eKPtEhnfqFQqF55fQlDDKBabPRnRnf0j9Z7GB/7RymGh4wYfYBoSM5E2KF3d1f8UOAMTA
	vlFTs6xdsyz0zJy9Hp6smoT2+/K6HZbsQ7u8yw3Q/r7jX3I18MuuDUlBFFF//syaBwTu0AjxesA/M
	34kZkmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqxx-0000000BdIV-25EZ;
	Tue, 26 Aug 2025 10:31:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq9U-0000000BSxq-0lO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:39:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4FWlp004580
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rJ7RQ7iMaxrweLuf0/TuG+nG9I0o3A0GkBWILSS2Jw=; b=N6UacdCJtMrZGCof
	zoNYCnmYk6/hYjF0l1xbh6YE8HE3vY9pjnHT7erwmcEtd2BR5COTc6lms08za4h9
	jgqwt6nYb+fFPqMYcMkvlpMATIFBLNJHsevjjrG8BADUXEFe1e2umfhnJSFzDGkk
	wBePtKKG81c14C693XKDw9Pk9gUGHeVhlPEPYakaulYvSQ7Fu9aQZonxWDnnmvv/
	3QPDIK6JoxwTiYABG/lMNdWP+NsqEHJbv7KpqwgaEi+i+CQdBHZVzt6ed89UoP9D
	e9ytboSINW0gpLkoq9WYaz1tRtC4e8DozZvFMnUDhd2ZRLPfJJfEC96nhlPKt02K
	vwANHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um8d5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:39:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so5409670b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201179; x=1756805979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rJ7RQ7iMaxrweLuf0/TuG+nG9I0o3A0GkBWILSS2Jw=;
        b=po7ni5NJVzZ2aAnWdCOHyRL5zhE63GeKrX6lVvfLuGhnJvhLlB30EdnHlB6tzxZJ/q
         rp8+SJBzRCvdITe31Ea3U3EFiQZgJzKrKQsYMjlNG8KcdieBu+TcyK/ZiNR1Up6Dvg++
         aua222AdU/FYHQsM9bzmlskHiiQx0NNFJumVt/Y6YIgIfeGvuDN1D+Vge3gy3kZ4GK3m
         uahs8oqmFF3puk+nu/9FmggXkntgrwtPJop2iX3D0OoHrjJa4bV3NZc+z+2SdBXgwtw2
         r+T1T3s2XMS8CBRlj1W+4Ij7LyiwNxm1bg7zziMCAxeYzDovNbvKpB1Emt9YPpBfZZDO
         Ws6A==
X-Forwarded-Encrypted: i=1; AJvYcCUMzXRy5F02HxDuEHt0/unjfNj/WOzKYgcthIVKN7/gXMmO1NcAJEzF1Gr3ULUWoaXuafLaNe3gYMlt6zd5ZRLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxT5VQ1u5q7PObQf4YON5Xc0iok4vcswSbhM6DBDSsrfO10Gi6B
	c4sS3OxSoIBUpS6l83YSr0ApheHNJIZ3NzautMoPUhtsIm5YkcXovKI/G69xdNz3pxDGTdtinkl
	jP5IaK9ro7lFqQXoxnA6oGIFwrzcxwOubim/eEKtHVcagVEPrjpJ9C3txJkdsO8uflQG8xTMmd2
	T4Hg==
X-Gm-Gg: ASbGncvOnx3WvCd79Gt9N3F787WNSRPfZRLQqHZkkt/lhBLDxjWzLyD3mBzEINk0k3n
	6bsZFZhYl4RP4Aw7bW1kLDeTux7JALQXvU2ikvkqQm0PIb2Ft+KobYEuWWULnrdBbJKHPihoEvt
	GqwGnLANkpqNzIDNUXRRHBXXY95QYB/q1jfc4bSmoPmY5zJw9U+pMc5ik1DGJEcBLupryo4mqgH
	rymF/hfq5vCqSKM7RqjzbIoM8ly31OV/ivemW2T6HatNZ4sK+M5q5lEmIZKcf6M9jf5yD++n4YY
	+zoJzhf4qZKsK39kv5AO/GQXtApqA72GLCayfIHSB8BVqKdbt4VhnCYqvBkbHOOp6VoNQBOnAvw
	U/b3et4zp6nJ9qbkNLQ==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr17441217b3a.3.1756201178661;
        Tue, 26 Aug 2025 02:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpC1NlqUJbgFKkBeK5Cltifq2zeEdvWBJDY78r30KUUeQbyAMv/BePEb2dXQpg6uS1/KyxCw==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr17441190b3a.3.1756201178152;
        Tue, 26 Aug 2025 02:39:38 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm9889294b3a.79.2025.08.26.02.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:39:37 -0700 (PDT)
Message-ID: <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
 <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ad80db cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=sjPE1cIhIzOb-vUN2KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX7RZ2cg8iEYyz
 ndV99nDC9a4BAEpnZ/fG8OkcTSnVcWmEZ+quX5JUmitHoXG9ayeuGM9Kkl/ao/iYtXPzDsqjoCG
 3mrd2HYfNTFJlE1l8mvl/Ct0jt8HUmphOnlIMw5hqoeaXa9p9WWWV5akm/MtNfOAQoYCYKhcrmV
 7EGiJ2Ed7gGleQbZl/zIxpq07wcBPWtci2HEQORvkggiFqAJ6Zc5YRzeEtgPmr/qsrz62jH8rwn
 fPH+htfGFgy+NWxlVGSi7TMGtWGivCXcc75b4beh4HEf/bHtTwQgP/cO+xjI+xTiobXsk8kT2PO
 dy9vpGHGQN7RikIG9KefvMOivyQQfMfHPWZhRgzhIbPA5bMu4uW7k/B7KT6g54votcZTlu7chnr
 6St7WbQs
X-Proofpoint-GUID: o_jBoOa---cI5I81eINeoe3c21kC9ZIl
X-Proofpoint-ORIG-GUID: o_jBoOa---cI5I81eINeoe3c21kC9ZIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023940_224394_A43FDDC1 
X-CRM114-Status: GOOD (  26.22  )
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



On 8/26/2025 5:27 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>> for port i, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>   3 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index e827396a0fa1..8803158ba42f 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>>           Value 0 means raw channel mapping mode. Value 1 means 
>> channel pair marking mode.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 9e623732d1e7..c5f169facc51 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RW(cmbchan_mode);
>> +static ssize_t port_flush_req_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> Decimal would be better for a port number that goes from 0 - 127. If you 
> really want to use hex then don't you need to prefix it with 0x? 
> Otherwise you can't tell the difference between decimal 10 and hex 10, 
> and it's not documented that it's hex either.
> 

Got it. I will fix the code here, and update the description in document.

>> +}
>> +
>> +static ssize_t port_flush_req_store(struct device *dev,
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
>> +    /* The valid value ranges from 0 to 127 */
>> +    if (val > 127)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
>> +
>> +    if (val) {
> 
> If 0 - 127 are valid don't you want to write 0 too?

It's 1-127 here. 0 may leads to an unexpected issue here.

Thanks,
Jie

> 
>> +        CS_UNLOCK(drvdata->base);
>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>> +        CS_LOCK(drvdata->base);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(port_flush_req);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_trig_async_enable.attr,
>>       &dev_attr_trig_flag_ts_enable.attr,
>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>       &dev_attr_freq_ts_enable.attr,
>>       &dev_attr_global_flush_req.attr,
>>       &dev_attr_cmbchan_mode.attr,
>> +    &dev_attr_port_flush_req.attr,
>>       NULL,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 00d146960d81..55a18d718357 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
> 
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD1D767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxHpN+kau7XrRpGD5rceoc4dUpfUE8obwuBKrm0Q/0A=; b=mjnK1O6mcfhGZFcWe812a2w+nb
	0iUCcNj6/n4r1rTToKdqBry/SJH5OUSsnmUEqgIDVW46HlnJOzP5wK8FdoKfToyHnSTu+2nKxnAk7
	4sxwsAU3J7ePYzCjEm6LIAY0wZPeA8EaJsmWO4zGox3loL5ndHmogHQAF4Xxz2m2tZ5LbA1Uuwqir
	/4Qh8b/9I5XKw27velXjbBmCIbED5Iefcihz7YG6aAkKOv+MOBNePL0mhozxnHll1h4DlbJKglTGX
	jPipTt4beP7WxLqw4djaTMLvXIt4ReTsBs+rzInpaUK1/igSSJ8FdgtAqZlJfNQDB2nlwirCoBN5o
	+NCFd8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZer-0000000AIY8-286A;
	Fri, 19 Dec 2025 12:32:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZeo-0000000AIXg-3g1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:32:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBJppw4153892
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxHpN+kau7XrRpGD5rceoc4dUpfUE8obwuBKrm0Q/0A=; b=hctqU2hbzNiziNF4
	s8QJiHEsnt637Fo728r/0YCERcDPtXijpUwni059Y48mb3IBKVk9rshDL2iQXA0f
	ZzkKERRLTicJEv99uD59o9b2HEbrMp3MaroRhl9Hsrrx+Aoa9jT9H/90cIUKDgCr
	jUZMH7JEDJ0kf4CkVMLLbIfkPkbpHWMwPMunSVAhcOqZDD9MbRNGDsU3kOg+41z2
	qHnRD9CvQ9OjlqZd36jFis98Ft22PicEgUeQEt+ulYgT3FnfXEHgUJCUmfTftxGt
	vejVjvqcapHBV4/9pJsxWE+HMbMNpu1id+AoR5LHe3Ekpgza7uoPoMfXB91sN34x
	GSIxmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctnny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:32:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34abec8855aso3578860a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766147549; x=1766752349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxHpN+kau7XrRpGD5rceoc4dUpfUE8obwuBKrm0Q/0A=;
        b=E2nApNZlajIH3svdhrlZsUfMxGfcsYExBzdNozZrB3zrWkj+ctdHoIxQMTnXYfJ/4P
         VdtqWclWU6lsJCg9TGjOhFLQkYbHILd0ohVysOXBm3fjbjkgpgEor25LdzgzTy4/vbm+
         tTxUeTTMDTdO0nFbzy2XCNqu6DATgKiYxZ+CVj1iD0SpQ6vWxxXgpdCGsHArl1OYXfIC
         MK51BhpLvUt7LnvMfO3vrnSnWmtlEIzhH9xnxvrLQa7UtVfH/HIVExc/FsbXMsXgfWN7
         Tj0yOao3QhVy8+N9t3yFZmYpQx+eXgTO3l1H3l61cE/qWppWERBdchOIhT9PobD7LVAj
         khXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147549; x=1766752349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxHpN+kau7XrRpGD5rceoc4dUpfUE8obwuBKrm0Q/0A=;
        b=MmGCkdWG6qJ1g067j8a9TkbeU0uAS7+qGHT/I5uLnFWixo+7XwOxcjGxLXBPdf6iFT
         eX8Q5xmvXXLdi5vnRtWZwhRmo02oS12zvuwQ6HF3ir8a8fyuBuEL9vYt5p0ZYBdkRYYg
         JIXm5Jag6r8NmrZKWe43hto21lFmbNrH31ucIDXKftpk5UHfTDRA3MMyrMnsM2nc4TUH
         7rtkPWx/NbweJRJqmfGABD3vCSF+30YbxTdszqnZZ4mAcV4/gzmYyb9A520yNV1MTLPs
         Jf6BW5dxaesUOESMVOp/i9ne0/2wx4E2pZLvt2BuR4g4Cfew4WjJm4vPMsVYHasftFNg
         AIeA==
X-Forwarded-Encrypted: i=1; AJvYcCWCtRGpdDIzNuyo0eX9u9QWNHSeuRBA6L/VbfraVGRWKjPUez62UuTbkpCA6lnomb1Qs8vEgHbBpSI/4mRKMzrF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1FRu1yxSQW4RhIApmxvxZBUfaDF723msrTPJQ1IJ14SSLsv3E
	Ln8MPa7mATfZfknZZvxUJoWwib5jktRpDij0vsyFoszzvhUbhQWXM2SYV8J4f6D8WO0IpwULjzY
	vSrB9fnBgWhJBkHrxKsUMKiJmRq1xZhhE/hAC1BtRDE+D3ocA1ugfzHcgdk+H6OFPGNUCeDsCzp
	NPVg==
X-Gm-Gg: AY/fxX4w1nBI2fd6l/Ln7Pb8qTP0Ccn85GcoOKD8VTFu7bZ9ih23YdjdBfcReRtt+Q6
	Z2dvc5dRQMsM/uxdzoumYgQjRTggbYSjJV+VnwMq0Qjp7axRdAFG4KAxWA8pFMBoEVPgXy3jwVQ
	JV/kTOjjYVVXLfLpaPZfMf3JMOilfyearMfHZ+7yWScYZnr+YNbVQ/ruNjre3cExCJtZefMCZEt
	+/xQRdmoaHGT3uV0vpRwsH9EfM0G5a7yjmZ/70nAtumIEfEcSkfYO1rP4AXabFntWNtB9+i9Yjn
	+TfOJTV8dPN4fItbyp8l8ANzZYXBB8MBD/RTLdP/dPGKxQkHqishR+KgbDz8BWIeuqL5Gj3SoCJ
	TGj4r+gzQD7uucM3xo+pX+fPygab0o7qsPFY7qFBTGqYxcgPm88l+yPnM1hHK0Ht3UzG3e4IFin
	g=
X-Received: by 2002:a17:90b:2dc6:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-34e921370camr2120371a91.4.1766147548704;
        Fri, 19 Dec 2025 04:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5WcginvI/EXY/d2mIbBxPxVBYC5DbZJCgImRp6Ae+Ac8yYDIzUleSa7cA08IkCLWAgKOl5w==
X-Received: by 2002:a17:90b:2dc6:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-34e921370camr2120352a91.4.1766147548181;
        Fri, 19 Dec 2025 04:32:28 -0800 (PST)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbc9d6sm5197547a91.10.2025.12.19.04.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:32:21 -0800 (PST)
Message-ID: <2aa33df9-de5c-4db2-bc7e-28b15adda099@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:32:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-3-ca93ddfe9d30@oss.qualcomm.com>
 <ec3804b5-30a1-404b-ae82-0b606a8b5d6a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ec3804b5-30a1-404b-ae82-0b606a8b5d6a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B6yzuBUqn5eVIUoARtrDfxb1VPTqysUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNCBTYWx0ZWRfX6di0OsLU3weI
 1ft2nHHPp011drZNWbIqaschrjqW0I4iDEC91nv+MzaSjyfWTudH5o8UCmnywonB3RJoT0i721C
 9Z6EOq72l+zTJx0QXN1K3WDGN31+RhhsWNPUSMn7FBYIX/qB9sxzWqb/lKsFDk1GVgCj628k2I0
 RVNeYSds/aqEIjrDRmbLjIIsxcH4jPVs0M83ZIv0P8vT0snEJ08gI93vErfGVPWCjPjdTBCP4fn
 GsPZ5y/8lJak8XV41oLgJV7BErHwTvJq/lLNbvVaOltvb9T4bYNsCcYfXXl5924Glz0puwrVb9Q
 N+qii/Y5ARYdU+NuJmelBA7aUOdcyV//XNanhttdMVhiC/kR5FKWnim14OLF+1i6utjlqOuBPEb
 odCJFwhwGHpFBHDMHFF74Y78NPAt/AWLlGNcAbtObnt5966e4ZFFHXFTBRUOjeK2kVJVmTSEa2W
 dMINin3g/0qqgj+DGDQ==
X-Proofpoint-ORIG-GUID: B6yzuBUqn5eVIUoARtrDfxb1VPTqysUj
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=694545de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LklF7o-fHLUnHnnKXNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_043230_920134_174854C4 
X-CRM114-Status: GOOD (  20.85  )
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



On 12/19/2025 6:33 PM, Suzuki K Poulose wrote:
> On 19/12/2025 10:04, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>> for port i, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  7 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 49 ++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index a7855922328e..ef2804f87d1e 100644
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
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index d378ff8ad77d..5b4a9e41b067 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -375,6 +375,45 @@ static ssize_t tpda_trig_sysfs_store(struct 
>> device *dev,
>>       return ret;
>>   }
>> +static ssize_t port_flush_req_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>> +
>> +    return sysfs_emit(buf, "0x%lx\n", val);
>> +}
>> +
>> +static ssize_t port_flush_req_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    u32 val;
>> +
>> +    if (kstrtou32(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(port_flush_req);
>> +
>>   static struct attribute *tpda_global_cr_attrs[] = {
>>       tpda_trig_sysfs_rw(global_flush_req, FLREQ),
>>       tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>> @@ -385,13 +424,23 @@ static struct attribute *tpda_global_cr_attrs[] = {
>>       NULL,
>>   };
>> +static struct attribute *tpda_attrs[] = {
>> +    &dev_attr_port_flush_req.attr,
>> +    NULL,
>> +};
>> +
> 
> But why ? Why can't this be a part of the tpda_global_cr_attrs[] ?
> For that matter, why is tpda_global_cr_attrs named as such and why not
> tpda_attrs ?
> 

will move all attributes to tpda_attrs[].

Thanks,
Jie

> Suzuki
> 
>>   static struct attribute_group tpda_global_cr_attr_grp = {
>>       .attrs    = tpda_global_cr_attrs,
>>       .name    = "global_cr",
>>   };
>> +static struct attribute_group tpda_attr_grp = {
>> +    .attrs    = tpda_attrs,
>> +};
>> +
>>   static const struct attribute_group *tpda_attr_grps[] = {
>>       &tpda_global_cr_attr_grp,
>> +    &tpda_attr_grp,
>>       NULL,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 97e2729c15c9..ec93f9cb9648 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger Global (all ports) flush request bit */
>>   #define TPDA_CR_FLREQ        BIT(0)
>>
> 



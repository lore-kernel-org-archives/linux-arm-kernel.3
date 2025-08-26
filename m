Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE36CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paLKss0IUBWc+jaJlEOsMKMsvnxtyXrSg9oZkdly/Ns=; b=qDox5hRArcXH9+bwxa+7Vff4yo
	zY4FcwBBPskQnEUrd4+Kws3rLDO1VDXrcSPUJTZh/4RaZIEQkRk0GHAF1PgdD5HzjKQ7hnpu59H53
	qq9YmPNYS+mny70pM91x3t+KahQ/qOdzHTh6IltQMjP68+j/DGYtuf82smUigXzvEpQcjWT3PXPCP
	Sc2kvfrApOkc3OfaBZaXra7c0cDYVFTsogDdxGfpJd9BsGGj81m2ITe8QRguKBx6Oe39AwkWIaai1
	jYcP62w68RhSTPS7YmEbkZLRE5GTPKHj9/FYVvhUvBHhsCTTOwuZssBq2aNsZeO3LDO+sMDxeVtbv
	shhqcbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqssD-0000000BxNG-3ShY;
	Tue, 26 Aug 2025 12:34:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsWk-0000000BuQd-16qR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 12:11:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5VYfb007747
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 12:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paLKss0IUBWc+jaJlEOsMKMsvnxtyXrSg9oZkdly/Ns=; b=dLqBO4s7mv5mKici
	wuWjk/+jlVhmLhv4egor9qx27Ty0KbfEn1hKUgeeBFT6BZMy+4bInHT/Wo+JXzdO
	avLuoNj3sF+GK7l+5A/Xb7F869eadzkLT2QJV/0mIuPCB3p1+hFt72zfFTzU77ml
	OZcvgQqZOqw0wZpHGXZvcbhwuarwdSTe6RgXKjpzF7lnKup3TIGbn4pEdTzqpF4/
	Mcliv4vFszOGAPGP8F/rTxjl+ijRZ4JM4gyjE0SkSEF/VEFQM3LI8M/f5fV6UXZe
	kS8ANmcgsNWqE3zFeZEBce9BzO93PiOtucfRz9qk9ncpFrPj/h2M/T9wPY0T8Q6m
	wrExPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfgnmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 12:11:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2461907278dso53336465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210308; x=1756815108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paLKss0IUBWc+jaJlEOsMKMsvnxtyXrSg9oZkdly/Ns=;
        b=QdI+tmLHMV5Z6AGSFFVyLrOLLEUdosrkU9i7trQlz+qT3AkzTkcrjVSD1l+GmeVAMA
         IDuP851OppPfBKKQlgPoQ1LFZeBM9JULAHhEUcvMybs9uJ41SDJb9vCuIpYy69kn7PRR
         RI2RQTZpspW6lCoUZ7+oPZaygnzMxyENXTZ7IfKSz9hSMnSrAaPg7B3vHQCHszKDPJVY
         imh/wo41R9Eanhkn4zeCM7YT4+NqArRLJGQvr2ijvHAFYxRLoqc8lqr0c8jUozsrw9F6
         CSMH+AUPy/CjJDH3apH2q8vIdmc6qXeZw3BLD3P/gaxvrWuiehkaozXEbM9eMtXLADbK
         CufQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1EtN/keFe7p3ed++mH+xp2mRz9SVkJk3jxtTVuZNGCJq5OqkW7aqSXKBxvVcL85bHq5FvrI0Yg2da9IoesNq5@lists.infradead.org
X-Gm-Message-State: AOJu0YzU2s/s1haA9SyC9dAy6uoW98Y/hOzWXcXaRaEurirEmch7dXyS
	pZA7ZAnj+h72sMktsFtIAcoYN/Xo4KzeXd7fpqaqnJpQD5AUBo7g43jqhlWgm1WrfiNYdbEsvSH
	nlbfTM3kfzTjxmCofe17WMPSLJL16A5SQW7mXfw3UiurBuXXdiL8yo/hnH4eeOGOrPD6159ZJR9
	oGSw==
X-Gm-Gg: ASbGnctwLPOBzQ9Y1mdMBaFPBVBiAPGh7Qbo00/4COAakDynSZBiFcEyfoVBwd0I3My
	KhqLbrZPiLLY6ZaADRsxAJGEMmWKAbtXA5uPmEhe1JX6jNdLtYcQiFH+NcVPoCn7uv9rImdHDfs
	WRDqgzXc3zj+bVy1K4xSYty1+OoZAkrah0XA74yuITYZcsdKpkn6xVK/t3BK5H8xMeO9QGJjxZt
	kcCxImHdCpD9F/hjnPisgzpgmxfhaBnZcphXgCCT7tQbPTKKk6/thm+m4MWGRFSf2Q3Gk930qRN
	c43zAwzBvIIC5DAiyAX8TbgPdT7pe9tGY4xPtcRGxXRbVRbn1jv1iFrTFq2uVQxntnsft4EiFsE
	gI5FldDWzDFaWEyzuLnmZZYp7KLuN5g==
X-Received: by 2002:a17:903:40d1:b0:246:d00b:4ae3 with SMTP id d9443c01a7336-246d00b549dmr78980185ad.61.1756210307949;
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWt+ZKuYL/s7XdOx51tNH2twlSp1YzsVOyChmLbB+Co/aIapze6oU9D35MvVYX1XhVnb+v5w==
X-Received: by 2002:a17:903:40d1:b0:246:d00b:4ae3 with SMTP id d9443c01a7336-246d00b549dmr78979735ad.61.1756210307420;
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688645eesm94817945ad.99.2025.08.26.05.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
Message-ID: <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 20:11:41 +0800
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
 <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
 <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4oAbezVT4q7+
 TcUwrueTHrNkO5fTw8BVeRM+7mxdf7CcxCCN58G1+6AFFOS+iDSKuhZDt0Hb0ktOdscQUHziQpI
 EVfnWjc+gJcS4J9Y8jS1gDWvWt4eeygFHQTnbYG/1a8bO6iBdppweFOdXAqOnHMd/K8yhrjDDaA
 pkS7enYR6jmFCW0JjauHcE4hyz1x535UhC5xyQkaCtJpn8yb7y+vJAC/2dmJONA0YSjPri5M/C2
 qbjVz4fvV09JvILP6HWq546ozxLsInuLCbQbnVQqQom8tOL080zolz0cgvXOxxRzY1avTEBO5OJ
 8AJ0LWx3rviXMkIkudNARtV4wizS9gtsUTSfv1rmWFSUSuG8x1icighZ4IA+/XL9Ag9xuJvTo+e
 6gclBaj+
X-Proofpoint-GUID: tDWyvxTN5qi-58ujc5ICoeRDvm1jyrjL
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ada485 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-hWpzLsPYw3_ZpqOosEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: tDWyvxTN5qi-58ujc5ICoeRDvm1jyrjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_051150_424053_BE4D791D 
X-CRM114-Status: GOOD (  27.33  )
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



On 8/26/2025 5:54 PM, James Clark wrote:
> 
> 
> On 26/08/2025 10:39 am, Jie Gan wrote:
>>
>>
>> On 8/26/2025 5:27 PM, James Clark wrote:
>>>
>>>
>>> On 26/08/2025 8:01 am, Jie Gan wrote:
>>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>
>>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>>> for port i, forcing the data to synchronize and be transmitted to the
>>>> sink device.
>>>>
>>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>>   3 files changed, 53 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> index e827396a0fa1..8803158ba42f 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>>   Description:
>>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>>> ports.
>>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>>> channel pair marking mode.
>>>> +
>>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>>> +Date:        August 2025
>>>> +KernelVersion:    6.17
>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Configure the bit i to requests a flush operation of 
>>>> port i on the TPDA.
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.c
>>>> index 9e623732d1e7..c5f169facc51 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
>>>> *dev,
>>>>   }
>>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>>> +static ssize_t port_flush_req_show(struct device *dev,
>>>> +                   struct device_attribute *attr,
>>>> +                   char *buf)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EPERM;
>>>> +
>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>
>>> Decimal would be better for a port number that goes from 0 - 127. If 
>>> you really want to use hex then don't you need to prefix it with 0x? 
>>> Otherwise you can't tell the difference between decimal 10 and hex 
>>> 10, and it's not documented that it's hex either.
>>>
>>
>> Got it. I will fix the code here, and update the description in document.
>>
>>>> +}
>>>> +
>>>> +static ssize_t port_flush_req_store(struct device *dev,
>>>> +                    struct device_attribute *attr,
>>>> +                    const char *buf,
>>>> +                    size_t size)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    if (kstrtoul(buf, 0, &val))
>>>> +        return -EINVAL;
>>>> +
>>>> +    /* The valid value ranges from 0 to 127 */
>>>> +    if (val > 127)
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EPERM;
>>>> +
>>>> +    if (val) {
>>>
>>> If 0 - 127 are valid don't you want to write 0 too?
>>
>> It's 1-127 here. 0 may leads to an unexpected issue here.
>>
>> Thanks,
>> Jie
>>
> 
> Then can't the above be this:
> 
>    /* The valid value ranges from 1 to 127 */
>    if (val < 1 || val > 127)
>      return -EINVAL;
> 
> But I'm wondering how you flush port 0?
> 

BIT(0) represents port 0 with value 1 and the default value 0 means 
nothing will be triggered here.

> Isn't the default value 0? So if you never write to port_flush_req then 
> you'd flush port 0, but why can't you change it back to 0 after writing 
> a different value?

We can change the value back to 0 but I think we shouldn't do this 
although I haven't suffer issue after I changed it back to 0(for bit).
Because the document mentioned: "Once set, the bit remains set until the 
flush operation on port i completes and the bit then clears to 0". So I 
think we should let the flush operation finish as expected and clear the 
bit by itself? Or may suffer unexpected error when try to interrupt the 
flush operation?

Thanks,
Jie
  >>>
>>>> +        CS_UNLOCK(drvdata->base);
>>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>> +        CS_LOCK(drvdata->base);
>>>> +    }
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>> +
>>>>   static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_trig_async_enable.attr,
>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_freq_ts_enable.attr,
>>>>       &dev_attr_global_flush_req.attr,
>>>>       &dev_attr_cmbchan_mode.attr,
>>>> +    &dev_attr_port_flush_req.attr,
>>>>       NULL,
>>>>   };
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.h
>>>> index 00d146960d81..55a18d718357 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>> @@ -10,6 +10,7 @@
>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>   #define TPDA_FPID_CR        (0x084)
>>>>   #define TPDA_SYNCR        (0x08C)
>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>
>>>
>>
> 
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77A9FB5E97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSTTg7WrmP4vWV7U3/LWvBJzroo+eR8G0HMjWnSLhR4=; b=tWSBCqn2vQzaDdnAjxDPCwcFhi
	YGNh7FPTm+fQt+EsDVjoE6QPg7dCqZVPBzuEeXwanCitz4WKaj05E385+5gCFa1dg1G6qlaoONYpp
	1PkPm+ZUJPm8zHhz3XCG6ZDR0+tng0uAlKh0XSqsHrQ2E0sM7D2KD4sWtAmquIb9IXdJdySYy48/I
	9JXnwj73IZB1z/hu0fFhE2lR+tehC3ro6grrcVgNJlFtAVEIx821hy54J8Tb+w/zW0I+g0ox5ig6s
	7Vlw+W7jJM7+/hA6qv3X6EotIAYn5KgJlS8eChBIpLeidPtCOiQ+KSURiKTRAshT7ulZ0s6PVC7l1
	RS6sMSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JJF-00000005BhN-2FnG;
	Tue, 17 Mar 2026 01:33:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JJD-00000005Bgr-0lzc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:33:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GHX0qf1428813
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSTTg7WrmP4vWV7U3/LWvBJzroo+eR8G0HMjWnSLhR4=; b=ORDYvrvfUOtQ5rIE
	GXQIzJsQWlOXr1AnMz9BuTWrc3ieWYavytBTQES6Xoo04H4zl2614PCQ0HOScFYs
	2YQODQiq1EBoh6dWFPp5kJZYkM/MF7VDWGQFy5jWsVSMy8syzb4jaSqF8tTJVXte
	EVFmE6FrC4t0hiO58Bm2CsJRTCM8NPE9XbWuQhyAlfRqm68lccDc1NiAcGwtQXIj
	p102Q6vyHsrLHWvfzGNiyiPE67MehhZVAsCXVzQiRLZs/JqDSRUMvXUt2g+MTrsN
	PxV9blAIUR7vDbyg9V9O/42QWQorFGTlEWUZRH++5vm0w1RW+eeJaIg+uvb1+JNf
	YzjjqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99amyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:33:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4020106a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773711202; x=1774316002; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSTTg7WrmP4vWV7U3/LWvBJzroo+eR8G0HMjWnSLhR4=;
        b=WpP3P+as7ueXdd9yazJ64J1XyldOs8O72v1TKCVjdFUpzsbPe/vtJBLTxU8S0tPGr/
         T2iN6l3bkbcqVWPGMpg66QSwYKAi5IJqHtg/v4mTD7nO6g0q178bbi+vewJoSnWKBUgS
         ZRBkKBNSek1/nSqLAiHS4lhnb+RscP3B5wlbAdwkKA9dNqhvXRwiBNq4jHrbOhhGYJ9i
         vAlmmd2s2e6SCc7zkl4m6bJC8dMxa/mk+Y4Ls+IvDDl4G3uYjfFv8Tupbit0+3pJBQA7
         XcCGmtdsi/ZXhJ7LA7fXhFBYghAMeXxpEk9P50w0N1jCzXKew6qMdKnGZqmfoitmfC0R
         j3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711202; x=1774316002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSTTg7WrmP4vWV7U3/LWvBJzroo+eR8G0HMjWnSLhR4=;
        b=CskRDdynXcxa16dtqy3H5nwd/8a/XEvy95qImBItg0ZnYoy0huNC8S5m/XfQ9KvpN2
         4MISkFEVcQ8xD5jGRw5ZPgCgjSXoq4y/hZLsI9YAKFhdY+10HSKrERxc8HIswAbO5VEi
         uppiwFMyzZA87p6aB4JLTamfZvjgRGOx6uWlepsE+G7n8Mce3szTq89InExoUdwjwr08
         B0Uy5kTDlCC1pQYEEuqOl7+YWwBscji70FDamti/bRtGG++3MVURdCLyL0iHgIQk8D/H
         bUg8bdS1C9T0GEcQ/JJgkTX9GngkCOB0NNzBMchHBewUSbjyStH4qnL7PvwZbha5VedO
         I+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXT0roP25S39NpozOIxGddMwHxpyJzOFjmgJGa3QTwfVw1kgo3E+R4jCYMadtdCABeSI5tS/8R9jFkaXm4+2z7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwuVcMiJQEYyweDUzczEr8HwdLsp1z1gBCrbiYNSGcBjYO3xWqE
	Q9Hu+OxQV1pdyWvQz9rpa9H6S75EHimq8GOrMPgeEvwol7UwyrryvM/hjpRHtEHtnIRIVdwJvSB
	TvnL74B1XeWE7RCQWuLels2f5lzxDUTa1/vCLDAN0HqjABLTPmszg2UPozEOBqyniSG44QCquwF
	i6Fw==
X-Gm-Gg: ATEYQzwEvVk5D6bOL3e9qX4vigqHxiBhnBtFmboCE4CdBJEZhj02Mxajm79gYDc5d1A
	ldznTCszVc2xsiJKMstYQWehSLx7pHlpUkjopbxqWZtsw685xZ9k3dE73ntTLZO50317/4wTkX2
	wUvoCpJl2vMubbqapnzdQvznzHHU1DuNdoJxWIp6v0axT7Ewfjm7KQDDdUfcydhu22e9/zFQDe/
	7cO8vWEH7BiM43NruL4fs5tbpOa60XFTrEazxqhe94Ksx2xBZCFhJcyUWP8Za+86QJVIRyokKiU
	h9cedtMPMfsDgjf2jtZ/NKydMJl4bp76jFFOJ+lnw0UvV+DR+9SWlkzB93vWfzCPrwo6DJBKvF0
	Tr8S3XaqxtO241pFJRx4Ycx+em0lfvCyZcuZrxEwqngb1MAYnuvwKsAJLDRv2KmvdRNIWM1qpjx
	TYUYWp3Pl8LL0=
X-Received: by 2002:a05:6a00:21d4:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-82a197173cemr12676600b3a.22.1773711201753;
        Mon, 16 Mar 2026 18:33:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d4:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-82a197173cemr12676567b3a.22.1773711201127;
        Mon, 16 Mar 2026 18:33:21 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725bfd0sm17779184b3a.14.2026.03.16.18.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:33:20 -0700 (PDT)
Message-ID: <f0511054-9557-4b3f-99cd-152ff438c1e7@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: tpdm: add traceid_show for checking traceid
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
 <a503ecdc-53e9-4c7a-b228-f697fb9c0ac6@arm.com>
 <8f37ae07-f211-4d43-bc01-4ab17a0d1f32@oss.qualcomm.com>
 <d1d1cbc2-c828-42ff-b4b0-53fced4afb01@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d1d1cbc2-c828-42ff-b4b0-53fced4afb01@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b8af62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s_LNS3maTIwMnbWpHXAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAxMSBTYWx0ZWRfXwt7kh8UrRHHC
 faBtj8OHcDxnqy16DtlqMR/ofcmC86lGEp50Nh3X95cmBr6nl++gNx7WSV4GAOnyy8KipctlzVx
 K3i0B2/HV/eNzkfFrNhy2qk6TO5V6lYfESCs3tcMNCPqKoNN4bX2zLGxsDyFA9U+ECTfZyCcnP7
 CgpBwvmhCI1skOOFZXHgIR/f5d6C3bo1ol9r+IKJWD7SIg+BJ9Hl3TS66dJB2JDwHMCVBOvjhp/
 2CiDLbsGePWg90AsnhDUNKAYHQqfRw1ZO2RvnDbivWMoJtM4WK4ZmoQX2MnAJ9/Buo7rHdPnhKf
 YnWIFMN3bhEf2DYQtI8gClTSVtlBfkmv+w7ZE5Bx0GYf13omg3UmXbbARM4S1ugMVLtldidlOnj
 DQ9CfdrEwivYeS2HLFHCuUsOwoJj6GOYN5uYmWg9/O2oJWED/KEkfHSMTfZFZ1HDpcshNG2+j45
 ViRfIaKVzv1rSBwEsOg==
X-Proofpoint-ORIG-GUID: dakgSM4CItW2Nem2klOhLkpIWwZz7Vps
X-Proofpoint-GUID: dakgSM4CItW2Nem2klOhLkpIWwZz7Vps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_183323_240182_34052C77 
X-CRM114-Status: GOOD (  33.60  )
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


Hi Suzuki,

On 3/16/2026 7:20 PM, Suzuki K Poulose wrote:
> On 16/03/2026 10:29, Jie Gan wrote:
>>
>> Hi Suzuki,
>>
>> On 3/16/2026 5:32 PM, Suzuki K Poulose wrote:
>>> On 16/03/2026 07:23, Jie Gan wrote:
>>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>>> to userspace to support trace data parsing.
>>>>
>>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>>> to the connected TPDA device.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in V2:
>>>> 1. Use sysfs_emit instead of sprintf.
>>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>>>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>>
>>> Why is this patch required even ? For each TPDM there is a single
>>
>> It's taking effort to retrieve the trace ID of the TPDA device because 
>> it's not a source device. The trace ID is required to identify the 
>> origin of the trace data and is essential for parsing the received data.
>>
>>> port in a single TPDA in the system where it can reach and that is
>>> fixed for a platform. Can we not get this from there ? Also, there
>>> is not TraceID technically for a TPDM, right ? It is all a property
>>
>> Yes, we dont allocate trace ID for a TPDM device. The TraceID is 
>> allocated to the TPDA device.
> 
> Now if you combine both your responses, don't you think they contradict
> each other ?

Yes, the expression looks self-contradictory. We cannot locate a 
specific TPDM device using the trace ID, yet we are attempting to 
retrieve the trace ID from a device that does not have one. Since each 
path has only one valid trace ID, and it can be easily retrieved from 
the source device (as there is only one source device per path), that's 
the reason why the function was added to the TPDM device for this 
specific case.

Besides, the trace ID is useful to help to identify the originating 
block. Within a block, each TPDM device(DSB TPDM) outputs only a single 
type of hardware event (for example, a single bit value from a specific 
register). Therefore, all TPDM devices in a block can be treated as a 
single TPDM device, using the TPDA trace ID.

> 
> Also, the TraceID we show is *not valid* if the TPDM was never enabled.
> So this is inconsistent, isn't it ? Unless we return an error in this case
> 

Understood, we should only return the valid trace ID.
I will add an error check to guarantee it if this patch is acceptable.

Thanks,
Jie

> Suzuki
> 
>>
>> Thanks,
>> Jie
>>
>>> of the TPDA ?
>>>
>>
>>
>>> Suzuki
>>>
>>>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 31 ++++++++++++++++ 
>>>> + + +++++++++-
>>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>>   2 files changed, 32 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpdm.c
>>>> index da77bdaad0a4..774a63def817 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>>> *drvdata)
>>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>>> perf_event *event,
>>>>                  enum cs_mode mode,
>>>> -               __maybe_unused struct coresight_path *path)
>>>> +               struct coresight_path *path)
>>>>   {
>>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>> >dev.parent);
>>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>>> *csdev, struct perf_event *event,
>>>>       }
>>>>       __tpdm_enable(drvdata);
>>>> +    drvdata->traceid = path->trace_id;
>>>>       drvdata->enable = true;
>>>>       spin_unlock(&drvdata->spinlock);
>>>> @@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
>>>>       .attrs = tpdm_attrs,
>>>>   };
>>>> +static ssize_t traceid_show(struct device *dev,
>>>> +                struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    unsigned long val;
>>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +
>>>> +    val = drvdata->traceid;
>>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(traceid);
>>>> +
>>>> +static struct attribute *traceid_attrs[] = {
>>>> +    &dev_attr_traceid.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static struct attribute_group traceid_attr_grp = {
>>>> +    .attrs = traceid_attrs,
>>>> +};
>>>> +
>>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>>                    struct device_attribute *attr,
>>>>                    char *buf)
>>>> @@ -1367,6 +1388,12 @@ static const struct attribute_group 
>>>> *tpdm_attr_grps[] = {
>>>>       &tpdm_cmb_patt_grp,
>>>>       &tpdm_cmb_msr_grp,
>>>>       &tpdm_mcmb_attr_grp,
>>>> +    &traceid_attr_grp,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>>> +    &traceid_attr_grp,
>>>>       NULL,
>>>>   };
>>>> @@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, 
>>>> struct resource *res)
>>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>>       if (res)
>>>>           desc.groups = tpdm_attr_grps;
>>>> +    else
>>>> +        desc.groups = static_tpdm_attr_grps;
>>>
>>>  >       drvdata->csdev = coresight_register(&desc);>       if 
>>> (IS_ERR(drvdata->csdev))
>>>>           return PTR_ERR(drvdata->csdev);
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpdm.h
>>>> index 2867f3ab8186..befecbb896f4 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>>    * @cmb         Specifics associated to TPDM CMB.
>>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>>> + * @traceid    trace ID of the path.
>>>>    */
>>>>   struct tpdm_drvdata {
>>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>>       struct cmb_dataset    *cmb;
>>>>       u32            dsb_msr_num;
>>>>       u32            cmb_msr_num;
>>>> +    u8            traceid;
>>>>   };
>>>>   /* Enumerate members of various datasets */
>>>>
>>>> ---
>>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>>
>>>> Best regards,
>>>
>>>
>>
> 
> 



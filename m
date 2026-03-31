Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E91061B2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 03:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz0wrV0Vsid/9chd+7DuoeZAxy8rSDSWa1ElC96gy+k=; b=hXnIqUvAf29562r4cpkExZMdH8
	NCaqUTUDVno++fVQxD6ZlOs7hrG1RsDJocGPqpoaOtR1rIg3Rzatq/lTZpqKaaXWkC+X1sHA3u2Lg
	1EBlfc/schW26XjYYTYPvAcNVoCMPPEOxTfS9afmN/WKVQP++8OHS74lHAh8xaEn22KvL+DRK2IaN
	3/Fmz8pzcTaetB3VIGRuU6dxTCPoqgSW0DWshiysDbOFwrcDLFj9gNzfXCiPyXM59n6omso3ILwvL
	yHFhcQ5HwwJgW/n+92FneS/kE8zqoiorjd3CY3IghtL1i8aCu9aaIjGzE9fXRn6md/6hGl6uAfJmp
	6a/bIZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Pd5-0000000CDbe-2OXd;
	Tue, 31 Mar 2026 03:18:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Pd3-0000000CDbJ-2n1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 03:18:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIwlkW4054054
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wz0wrV0Vsid/9chd+7DuoeZAxy8rSDSWa1ElC96gy+k=; b=nPTK2JFKVOyTqJ92
	TUrkNqVYHYRiamIJDn0Ra2+erX3VJAjz3ds3xlp2jbtIW8FJFksysRH+eCgiw2vz
	2az09TzoPuVAkkLFV7djaq5o6zdDdi7ThQexW1kZXkTE5vf+0C3z+9Dybm3zmrpc
	j7xtKjjUurr6UWiEtbKqVXAPmxevCMeXTbUi5+0RjJDZ6jCqiJjtbF2zfPmFrHO3
	uflsGsrlXZeJw7fihDRdwd0OIV+3fNPvJEDZ5+Nq/s2I4JH+zy6yEHR4ceZm8nph
	idBRsNDsdMYxWjdoA3gNYDE8FBJWwGrFDNinTeoZadm5yuaLARzM1/tzLkTlmH/0
	Sm+Ylg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx39dmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:18:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0be75dfd4so67477235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 20:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774927135; x=1775531935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wz0wrV0Vsid/9chd+7DuoeZAxy8rSDSWa1ElC96gy+k=;
        b=cokaj/285WAwb+aJXTVKUlsnOGbZK8HVDocOZHhE2zeDh3QjMgKyU3rNJcz3aktU5k
         BGQlIwfWnBwoSqXkoY9mijx1HYySY56EDErk67TLTGT5jHIutz4lOJ8x8/dYruKOECBM
         jzWrqKMHoi7PIqbst6+fmpNGIOqkvXVY/+DITuEGU3MaVubRWYPHwAuI26yea/Uw5PLi
         I1BzlJhXaKLrUoqbhty9hpI9ppAUWD4CSp7CLlBNSclc2yDjzY8mhJpPI5NkPRBVEI99
         uFJfJ9DXnhQUcIRlGlu8ai0cax+DrAj/OLA0N5Df9ddDPRPR5oZPMkUSPpu472o7xOyQ
         J/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927135; x=1775531935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0wrV0Vsid/9chd+7DuoeZAxy8rSDSWa1ElC96gy+k=;
        b=rJ8DFX+GTq6ShlWMuiiwA2cSOh5h+1pmmEGWzGB9TAuIJ0Jy/XY+fb/5WRHWxVxFd0
         ZrK5QXRa0UCd6oluh+UwKwPgP8szxr8stLQ34udUnTSnPJT1avp9h4HTEx4fCtj3efX6
         7EMF1QxC8nvutuEkfLTI359WZdP2a72eyWNk6MxkTg1DRWgd9DMtfWMySOqs757cyMXh
         mJUe7omHEBMAqkVgzRbMjIHL6nt2zTXr8Da2wtxnT9eOahvKmmJmIdQwrOCwOMf1ft3L
         InlAYgpvnIXG+d9bC8NvEEZCzVdlKx7K4qBhJms39sYeJScYhpfWdaysbUBXVo77xURe
         CHxA==
X-Forwarded-Encrypted: i=1; AJvYcCWp55emts/M3IKzr2wEsCMWRO206mmPu8nkG77Y3QLl/4qNH70KdptJqKlBLTV49UNG59Dm/g1tK7DuEcRV58bq@lists.infradead.org
X-Gm-Message-State: AOJu0YyEKq2fz0vsA3xGMdhABT/hF4lIXgWWC1VrEthUzz2momOM81MD
	S54xfme+X1Ewy6b8SDHDr2qChr+zge81NzrmIWBcdooo1uiJWOQi9r1/jJelauRgfXnBa9PU4Mh
	C/+lIheY2qvgiK2YjzrB1gCAtHBVAXmYd6Tu9UVo32BsCgV4WqxnCj2K3n2C5kbjsQZNdW70319
	kAneJ8LLT+eTfn
X-Gm-Gg: ATEYQzx19/sbgDRkxM/a1qhB6l2JZje5Gj1s1Ghxn8PkhScCu95BbbITJDfrmdgBkm4
	saAdUPmhZoM0K1qf5OHWaWU8rNTYpVe3NBnCa2/q69uR4HR2F2uolCnw8/G2SEcPciUYLDJx63u
	w3xmYG9wrUuoaWB6BdVr/iN35TkHBF3swvWwBK3UTfbdvUi2amKr/QDiql7+uh8dsktE0zv49Mz
	9fl8nWkOCcnpxRPTucbRndC6+7isP7LViAWcVZX/KgevbUDnuyKoRWCeZS45CO85drv+Ff1mlZm
	7y5czi8SvjIFhOvmJy7KB7hHZETJ47yGXFlfzLaBayB4rZ1GRvhvHEoLicES36pyfcxAq11Jvwx
	RcO+13hlku3eeX9dsMNizuPJx0/4CtcYLr0utq6CruNIEn3kqPPy3u8itEOzYAWpOkKAEr+IfTg
	q0QadRxXKNeHU=
X-Received: by 2002:a17:903:292:b0:2b2:4e70:631c with SMTP id d9443c01a7336-2b24e706a7bmr70603945ad.28.1774927135369;
        Mon, 30 Mar 2026 20:18:55 -0700 (PDT)
X-Received: by 2002:a17:903:292:b0:2b2:4e70:631c with SMTP id d9443c01a7336-2b24e706a7bmr70603605ad.28.1774927134881;
        Mon, 30 Mar 2026 20:18:54 -0700 (PDT)
Received: from [10.133.33.252] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b0csm115670235ad.50.2026.03.30.20.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 20:18:54 -0700 (PDT)
Message-ID: <207b78e5-ed6b-4caf-b9ce-546cf33d6dfd@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:18:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com>
 <95610981-ad68-4a31-a776-27894b7bca59@linaro.org>
 <ca1fe6ba-ec56-47a5-99ea-017dcc7a28ed@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ca1fe6ba-ec56-47a5-99ea-017dcc7a28ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb3d20 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X2wxhp3QJxJ_gFXpOJgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: BunBHBFM8RtF-aEdJbXnLl5pJqyNcLhh
X-Proofpoint-GUID: BunBHBFM8RtF-aEdJbXnLl5pJqyNcLhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAyOSBTYWx0ZWRfX0RYllV2tdmxq
 Lwuec59HBHJWd0pODmzvmlSYiMhUSElzyvLgoQDKXF9W6WxbAaR/bS8sUVLHzgjJ+FmAb8OxXvb
 AHYTFtmQgJQzw9xxMrd1Qo56SF/pmUc6wGx6T/P+cRiYEW/fJNtxo7sMmFrF0WVHizd24suoaCK
 Od4kSlti7OB6BWXItbBH7f72Gu42nGikqPUGPSNfPN5CRVBsdaZokkFfQFpazEwvCGKNCtlk9g4
 1uZpLceMy638b3zvO3zqNrDERt3pwRDqlfqV8RTzRIdmjG+GMl1ZPJxgrV+b7pDa+w67zedtzI6
 jH2E/4h1FEJu+HPioP2dcLqcotv4faMvs+ivP+msR9rmkbQ450U+RB4SsKGUn/WDw6smr3CV2Wg
 BgCr1cXHEzOcJQ2thwkO5CBEvWFoDqJdmUcVm70FP+euj/rj8p07z5ahD7vKoL0FYHUA5ZsyMlp
 Ras7E80+PrMyi1/G3nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_201857_733031_DEAB8F03 
X-CRM114-Status: GOOD (  34.30  )
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

Hi James,

On 3/31/2026 9:29 AM, Jie Gan wrote:
> 
> Hi James,
> 
> On 3/30/2026 10:55 PM, James Clark wrote:
>>
>>
>> On 25/03/2026 3:10 am, Jie Gan wrote:
>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>> to userspace to support trace data parsing.
>>>
>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>> to the connected TPDA device.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in v3:
>>> 1. Only allow user to read the traceid while the TPDM device is enabled.
>>> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show- 
>>> for- tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
>>>
>>> Changes in V2:
>>> 1. Use sysfs_emit instead of sprintf.
>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>> ---
>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 +++++++++++++++++ 
>>> + +++++++++-
>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpdm.c
>>> index da77bdaad0a4..c8339b973bfc 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>> *drvdata)
>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>> perf_event *event,
>>>                  enum cs_mode mode,
>>> -               __maybe_unused struct coresight_path *path)
>>> +               struct coresight_path *path)
>>>   {
>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>> *csdev, struct perf_event *event,
>>>       }
>>>       __tpdm_enable(drvdata);
>>> +    drvdata->traceid = path->trace_id;
>>>       drvdata->enable = true;
>>>       spin_unlock(&drvdata->spinlock);
>>> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>>>       .attrs = tpdm_attrs,
>>>   };
>>> +static ssize_t traceid_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    unsigned long val;
>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +
>>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
>>> +        return -EINVAL;
>>> +
>>> +    val = drvdata->traceid;
>>
>> You probably need to take the coresight_mutex here otherwise you could 
>> still return an invalid or stale value despite checking the mode.
>>
> 
> Acked. I have missed this potential race condition.
> 
>> There might also be some value in it returning the last used trace ID 
>> even if the mode isn't enabled anymore. Because you can still read out 
>> of the sink after disabling, so it makes more sense for a script to 
>> read it at that point rather than when it's enabled. Also, you 
>> probably don't want to be doing other things in your script in the 
>> point between enabling and disabling.
> 
> That's making sense. I shouldnt add such restriction for the read process.
> 

I missed one point in last message.

Is that acceptable to export the coresight_mutex from the core module?
Currently, the coresight_mutex is used within the module only.

Thanks,
Jie

> Scenarios for reading:
> 1. device is enabled -> trace ID is valid
> 2. device is enabled then disabled -> trace ID is valid for the last 
> trace event
> 3. device is never enabled -> invalid trace ID (value 0)
> 
> we only need to check the validation of the trace ID.
> 
> mutex_lock(&coresight_mutex);
> val = drvdata->traceid;
> mutex_unlock(&coresight_mutex);
> 
> if (!val)
>      return -EINVAL;
> 
> return sysfs_emit(buf, "%#lx\n", val);
> 
> Thanks,
> Jie
> 
>>
>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(traceid);
>>> +
>>> +static struct attribute *traceid_attrs[] = {
>>> +    &dev_attr_traceid.attr,
>>> +    NULL,
>>> +};
>>> +
>>> +static struct attribute_group traceid_attr_grp = {
>>> +    .attrs = traceid_attrs,
>>> +};
>>> +
>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>                    struct device_attribute *attr,
>>>                    char *buf)
>>> @@ -1367,6 +1391,12 @@ static const struct attribute_group 
>>> *tpdm_attr_grps[] = {
>>>       &tpdm_cmb_patt_grp,
>>>       &tpdm_cmb_msr_grp,
>>>       &tpdm_mcmb_attr_grp,
>>> +    &traceid_attr_grp,
>>> +    NULL,
>>> +};
>>> +
>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>> +    &traceid_attr_grp,
>>>       NULL,
>>>   };
>>> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, 
>>> struct resource *res)
>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>       if (res)
>>>           desc.groups = tpdm_attr_grps;
>>> +    else
>>> +        desc.groups = static_tpdm_attr_grps;
>>>       drvdata->csdev = coresight_register(&desc);
>>>       if (IS_ERR(drvdata->csdev))
>>>           return PTR_ERR(drvdata->csdev);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpdm.h
>>> index 2867f3ab8186..11da64e1ade8 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>    * @cmb         Specifics associated to TPDM CMB.
>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>> + * @traceid    Trace ID of the path.
>>>    */
>>>   struct tpdm_drvdata {
>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>       struct cmb_dataset    *cmb;
>>>       u32            dsb_msr_num;
>>>       u32            cmb_msr_num;
>>> +    u8            traceid;
>>>   };
>>>   /* Enumerate members of various datasets */
>>>
>>> ---
>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>
>>> Best regards,
>>
> 



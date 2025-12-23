Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9131BE6B26D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAGEBzhF/yKM+ObibcBG8MNheJoaTXjhoRXLmTtewT4=; b=1biQeD+6Nq/HhI3dU164B59MCN
	3NffyrkRgCPMwgZKagzV2UaA49xx5MeyX1M5eQ5gmamIQE3TNcgCqNhLq3Fp7Akifh6RGRDU4ISCA
	GE4tT/5PSPn0bZl4O90FWKo2b75TmKax1BNPBflX5R+LmaMlkJSPFKkoy44tWSLqc9aDRk6spvAmK
	wtqz/XfnITgQuCJH3xrr0B9+pPm5RvJWwvAjjpUmd6ZF2UUd0DnfMIvkiGnhifFJCMywLYRNsPYTD
	7KFeGKbULNILhBfQcDP2KlklmDfFmzYoJZVgbFCFy7cwD1xuKPGmN0Z6vTHSC+desNtMv1k/CUjNz
	rDZa1vWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrx6-0000000EQ7P-148Q;
	Tue, 23 Dec 2025 02:16:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrx3-0000000EQ71-35YT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 02:16:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEC0q71528829
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OAGEBzhF/yKM+ObibcBG8MNheJoaTXjhoRXLmTtewT4=; b=TynbB+1pu7f4RaPL
	1otAERzdSlAsKy8fzpH0v3yGVKSkisw0O0SNKmjKyWlJ/y2nbKbNxF8mvsIQSSdL
	gujFzzw4SRYAf1XJmpD6pABZxJPkm549RPheh1xHmPZCDoNr544xXjAuCioVljXk
	yIRPzJTjyXFeYR3OzfKuiK96OYpMreyPQQSsgELbLLRzIPjMdInjoxXPCB6n21tG
	w+FQWcCo6pgN7kU6RpsK+y9HPSj4d1QIVJIRT9CGDsafxbeE6uDnL7xpnYYHq4OQ
	m2le/ZqrkgdUz4YzZYsIQyAQD9aHmAZRLRgGlNf2c2gJOSt6NFK7IgyoetyR7tdB
	e0wrdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y22t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:16:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a31087af17so65093305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 18:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766456200; x=1767061000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OAGEBzhF/yKM+ObibcBG8MNheJoaTXjhoRXLmTtewT4=;
        b=GoMCjfdBhz+UYVdmCTc0sV/jjFanFDajvScfiHTIGLGX13YYtG4kuixQyow6CYTrOH
         TKyelnafdFJ+Sik9r5zAXQIvW3bjHm4J3QcmIAz6SfgSq+6fH/ciSiJIJ4Npv8vYUbO8
         KiT5kLCw+ExrBaDPNolPWI0hHdf2jlf4/yK8zbyqxW/+dXGAf6pViYenz7MMQvzFAXmF
         hSggDvkk97PDUeimKnuwNHmG3fPPub7k/pBTggJCCyG6K0o3GYCSlJj5HhuRuR5KyqdN
         0NaiNPN5TkY3bQgZa2gCIvt05PCpwsaKN3sGri4iIAVqeYeJ1/541+2Vjkeqm4LrxV4I
         6cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766456200; x=1767061000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAGEBzhF/yKM+ObibcBG8MNheJoaTXjhoRXLmTtewT4=;
        b=A+cO8RepzlA7K0000PWn/Wamxhrdr0e+uybNFgoMC2zi3IDy+P22/kQ2swEYoHwClH
         41I61huRwV8xXP5KE9sd0X7w8hYKDxSbRmsKbBCfdM5TwbH3V81rrQknvfa4UJ6ZUob0
         RT2M4+/0zYVp2BnXXb3eubrBzrgkEf/0OwEQ7R3qlFMflEIy2Kpo6sOWEyDzZmGpHPT+
         SqBXLbX8GFxpXnWr3kjErxNo8pwd+fRVu2xLDcvcyy0jFTQc5fDWmWk8QuzAq0i74UWv
         c7gTZWX/Ue+VoW0mmaPGnpxTX2nO0P95ZZD2CDpm6+M5QnmiNYdUypgyYi/TynqEvZkl
         EU3A==
X-Forwarded-Encrypted: i=1; AJvYcCVPRHyCEOIA01rfWQ4L5oGWcvYvVt5bF/XjkvZmwSPtVTgDVYLYTVmC6jGhLvQ9hJbdbjF9clC1pIqkAcGdcfKp@lists.infradead.org
X-Gm-Message-State: AOJu0YxcsImvphujr/SOegXQXGpuEMtLnfmLMHlGOlX3gjB7D+3Uee9U
	gSQ4g/pksF9ybm4RPmmqiNy9JuasvtE2ytXO9J2yak03/NHK02HigbrGQqcoq3P4HX/0TQ0gW73
	ex/+gZ39sgmzFus0jAOHME/BW0/NxWeZTnmCX5/C5CdZSl1wvdSuKzGyhX72EMkSP8qZ6elVFtv
	5O1w==
X-Gm-Gg: AY/fxX5nM2XopehuSPx3rmVndv5XY4MbsICXfWBHOL92D07hHDvbDbR3//cn2BcKiLp
	5aHlXgrvQUw2+bDmxXWKQ/eoNZdKPcj4TLDUPTgjZP7TnU9eZ0seNF3E89V7othZYzzDtKtqfm7
	6giXfni+wMgn/yEi3b27ZYQGCLQszy8GCuOqITqf6FsIGvKZ4qGTGYIC3VWETsbkcKfysgUpy07
	s6Wif33rmD+pePdF+FIltfyzRWeBjq65Z+L26GI0rjNaoWzchKyTPF0ED27PHqz1XLgWpyxXyYY
	ckJ/OUik5Q3ksqE47elFNp1OhLBqUsinjY5UbcC6mkC04UDjC/QNve1A/DNndlLVI93O9KGZ3Qa
	ApjuIeXuDRCDPyKjR0lh5umIJyBVmaLy64QWtSq9qir7RgQfCUyLNLYFPb9LXFVPzX5DRNEqZyi
	w=
X-Received: by 2002:a17:902:e885:b0:295:557e:7476 with SMTP id d9443c01a7336-2a2f2202fcfmr152554225ad.7.1766456200239;
        Mon, 22 Dec 2025 18:16:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVBRgfThPoFR7Ln8zAfm9AsxxuJCcTFpPemwjttS5fNMquFHI6a2ecuCIBUl/uvqPdsyZ8gQ==
X-Received: by 2002:a17:902:e885:b0:295:557e:7476 with SMTP id d9443c01a7336-2a2f2202fcfmr152553975ad.7.1766456199713;
        Mon, 22 Dec 2025 18:16:39 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bbbsm110349625ad.94.2025.12.22.18.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:16:39 -0800 (PST)
Message-ID: <b3b1e130-4592-4863-825f-e00cb9d996b8@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:16:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] coresight: tpda: add sysfs node to flush specific
 port
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
 <20251222-add_sysfs_nodes_to_configure_tpda-v6-4-b27143d45c86@oss.qualcomm.com>
 <9899b6c2-2bdf-41b8-9156-dcf1b611da39@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <9899b6c2-2bdf-41b8-9156-dcf1b611da39@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=6949fb89 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LklF7o-fHLUnHnnKXNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: U-UwOpZE29VuhJMi0Dp6UNGytSn-lZjp
X-Proofpoint-GUID: U-UwOpZE29VuhJMi0Dp6UNGytSn-lZjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNyBTYWx0ZWRfX3lLh19QvmGe7
 O9zmhe9DOJdfKPPitXkTQBhqbFLZxpwlqnLkUmWPXGYwHpWI7vYll6wXaz13LjcPrniNvNpe93U
 usQbjcgJ5QWlNwWOfkWrVU7lo7dDRvWWGi0ZiVM99jRawka23oZM0GRMP2xR0onbJmOU2OxVjGw
 G7pkVLWnH8q7PFDzy1L6rf8n3GsJfB9jnWW56n3RY9ElIzwG1Ih1XcV1k00BXvzKxkVpS8+rWN6
 N2SVmQlm2sVorYQmbWcRPm5xkkGPkVHNehZweEn51yYFKlmLyy45ZDCwfXT7XCBTL5cO0ean79M
 j7VxJiJuGHhz8IKmanH5AKBYvr8Sdp8bs+0Ddy4d+INbLjrrvbxrVxtdpzt+R9gJvJcG8J4YFRu
 j7zBt/505sf4NczdovQrjEDTzlelzp89WfxB70NL60fjUksNRQ9O5iw5xvHpzluQNHN7xZX66pT
 ujdkSO00socSGdozglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_181641_791730_24651006 
X-CRM114-Status: GOOD (  24.16  )
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



On 12/22/2025 9:12 PM, Suzuki K Poulose wrote:
> On 22/12/2025 06:02, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 40 ++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
>>   3 files changed, 48 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index d359d90dca72..df8f03d4b573 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -51,3 +51,10 @@ Description:
>>           mode 0 - COUNT[11:0] value represents the approximate number 
>> of bytes moved between two ASYNC packet requests
>>           mode 1 - the bits COUNT[11:7] are used as a power of 2. for 
>> example, we could insert an async packet every 8K
>>                    data by writing a value 13 to the COUNT[11:7] field.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
> 
> Does this have similar semantics as the "global_flush_req"  for "Read" ? 

Yes, global_flush_req triggers all ports at once, whereas this node 
initiates a flush request for specific port(s).

For reading, we can check whether the flush request has completed.

Thanks,
Jie

> i.e., the bit stays set until the request completes ? Otherwise, why 
> isn't this Write only ?
> 
> I don't see the point of "Reading" this value back.
> 
> Suzuki
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 7baa8a0965d3..f79fea4fbb2c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -430,9 +430,49 @@ static ssize_t syncr_mode_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RW(syncr_mode);
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
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_global_flush_req.attr,
>>       &dev_attr_syncr_mode.attr,
>> +    &dev_attr_port_flush_req.attr,
>>       tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>>       tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>>       tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 1d2de50bb9f9..ef1ce2ce36a9 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger global (all ports) flush request bit */
>>   #define TPDA_CR_FLREQ        BIT(0)
>>
> 



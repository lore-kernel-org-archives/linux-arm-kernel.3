Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DFC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 00:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE2mv/XyFgD4b+TvkQGaKdoVQYDSr2EgRQz4YF0xCJw=; b=LVBAwRri1fEYSQWy1hCVbfgQAx
	SMdZi36QxaXIcHEIaSFzeNzSE2ro0zcrvMeO9FoD8QHvyFaf/7rh7xMPi268EP0+29lc4wiKWtnu5
	/KajMGyuQeWKFQrXlPB9AJoDvrvQJeatq6gCwWn+wkuOrlU1pO4qJeKA9PN4Wp4VZJJ2mki529jGs
	Gew3QYMD2vYgcvJ8UT1fXT1ivAAarV7iBAqi02mTFHzvzJo1pt2ouOJZauD8VEFk6FtdeAqyacz1k
	UpT/RYAvLuxCOtguANeQpCS1hOnj/ZuR+WfCrIup66qxWn12TwCxFGfvd9qAWQNYr892sOgtLbikD
	xiZR6EKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCx3-00000008wvK-05Tr;
	Thu, 17 Jul 2025 00:58:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCub-00000008wo2-30XH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 00:55:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDVto007196
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 00:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE2mv/XyFgD4b+TvkQGaKdoVQYDSr2EgRQz4YF0xCJw=; b=OCNca29K4/heGuRI
	EuoPnowCMwoZD2GJk0v9O20MttCKZB0gRAcvZzZPPCbx9Q2uMUzQ21mJgoqzFQjD
	Odfj+DMhJXRXXz3uKKqBhI3F0JEgq4VHi1N+6mY+igTUdBhaTFTcuqu5QecEvyuF
	ztD8SErr+ku9d/WRaz0H8UbZP5ykZGIXd6/M+xHcgYf1WJ0NjWru43SgQT0t7B0t
	zWnHQh0LVS80FQXNkuc14oju7UtxAmzb8SGkj1SsVSjUnsFscUOHJgvuO7R3N0Fi
	LSTVtwEh8b0uR8be32h8vzzSQoXSUQXZS7+2BMLjyuLksnggQO6yEk0qkkf2BmQv
	9SkOzA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca71f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 00:55:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c37558eccso317766a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 17:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752713746; x=1753318546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE2mv/XyFgD4b+TvkQGaKdoVQYDSr2EgRQz4YF0xCJw=;
        b=ZCA7qvXgKWjTf0S7+pKbsAlzAFXjMkT0zD3o6ot9xQH9+380s4WfqzU5W2uUY5XgpF
         B0Wur6sy4yGkpU0LeE5IWRiOdagrk7FmruLr1fa9ZJNBuzuJKbHX1A64Ko+mY/Z/8o3o
         pmKs/AKoG9vVQVN1EaNpnNz2qDHpTxIozPqpYJKjJZ375WDxZrGe0bzxyB8/4X3wXMrr
         7QkWyUH+eGPeIMCFPOGA95xkCsmoEC6/Trd7qmAwEzRtOIcjdo1ly7tMXovw91m1T/6m
         oOZlx9/wwuh1ZyAGF872lp+ldAPIVmTZlg27GI+UURZvUYdtEw6ZU9S5Devy3dQSIrQA
         HYFA==
X-Forwarded-Encrypted: i=1; AJvYcCX8bmuRdx+AIdhibdSkIroRO66znfFtfYLZu3/H49k8rWZdtX2mF0dMTYEBdrTYypaTrf2Ls/VZZc15aF1kk2rG@lists.infradead.org
X-Gm-Message-State: AOJu0YwrYag+BCpqNdHDnLvQoUUFM2tly7mlCAvGmzVIV8WUnviksD3Y
	cfPyXXtSYa9a0eaD1QRmAMO8h3jjDJoHSM4FPdPwwN3C0Khvreysew35AhQHFYDO/i2aYlB/5HU
	FM/VuC5LI/Rtgi8Y72Zu8WSixRgrVNJN9WVSN8eXJ9uROjAE5I69yOtSrdyltXkQN8V5n7oaDrR
	Zb7w==
X-Gm-Gg: ASbGncsXqxwyyzo4TPYyEGYWWgD5eT9AlgZgJm5DPUZVFt0enp9k8GxtK9osw79+Tvz
	/a08S3gBBxExtJjvBAPGRw88eEbKvgRhBC5cxM00HrJfD0EqMu7aTRIKgw4OKW3xOJqbMYP7Ua0
	MCBn7U3u4dMP+TZyEHN5LNHf2p2qDWuRG8+xYXrZkoH3PltWlez0c5SwVt6qeKT8mh8D3qsa4Dl
	eyyVJhaTK4FL6yFg9NgOKqPRecStRuwXkxD1C+vprApcUAJPkPEvFbECwOIchVYCuDefj0y0oq7
	raqMsjdNwChxtFkETJi7+2yqZZXTGWntU6S79PBCSOAClXTtuuzbw8nOlIBO5Cp18uxYOP2jWx4
	ej+N5+iTeYh8GEY6pCkNUvhoL
X-Received: by 2002:a05:6a20:431b:b0:215:efed:acfc with SMTP id adf61e73a8af0-237d5f28f06mr9124563637.7.1752713745958;
        Wed, 16 Jul 2025 17:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsusfkryQNV4zgPxlZ3pgSGcpHupRiF5HVteLlYpaFodV/KYUSAfdyKsskldFXBYJwvAiNtA==
X-Received: by 2002:a05:6a20:431b:b0:215:efed:acfc with SMTP id adf61e73a8af0-237d5f28f06mr9124527637.7.1752713745535;
        Wed, 16 Jul 2025 17:55:45 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd7d1sm14379656a12.35.2025.07.16.17.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 17:55:44 -0700 (PDT)
Message-ID: <4850a2a5-dbeb-43f4-9005-1cc022545dcd@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 08:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 01/10] coresight: core: Refactoring
 ctcu_get_active_port and make it generic
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-2-jie.gan@oss.qualcomm.com>
 <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAwNiBTYWx0ZWRfX50qv695FxNz0
 nMUSt6jvAzlC6MM4puSXxxUWqNJqCwS6Gpo6pwhwzxK+ZcXJXbWZc8atZR86zbN55jrj7uXLjO3
 XtAV4b2NaTHeeNJyK+WsYCW9Se9+BwM4EuIHLDhp4n+MHXcecvEfbkX+7uJ07mdaaCuJwVx/j7f
 U/Fsy2eH7oe0+7PP4V0QMZ5X+xm+IJ13Z9z7QBgBuUI8vklVJ8GB7bw5yQIlZ5MiQpwYom9eddM
 jijs4iHs9zN2mVJ93lIboNSsEpWZpr8DSrEur4/+NgW6SJrEfNVIILEMlXHaQHpEzVLoSAiTQ0a
 F6uwfF1xEM5NGEpAVvi6/raZ6VURlACCAR7IGfu6OAV2bY/7X8aysH09Ehn5l2qYhMFHJ0LhU39
 vQ4h7v3DI3ci5gRxJlP9x4iXasRhyA3YpefXD3EPwVtRzhnUzZHkL0TdCeV8ncnLQLAVApVw
X-Proofpoint-GUID: 804ZVRJiie22SjJP9zSInukVT7W9gk42
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68784a13 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CCvaVWANnUWFBPVUepYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 804ZVRJiie22SjJP9zSInukVT7W9gk42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_175549_907129_7D69FEF2 
X-CRM114-Status: GOOD (  28.65  )
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



On 7/16/2025 6:20 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
>>   drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 1accd7cbd54b..5297a5ff7921 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>>
>> +/**
>> + * coresight_get_port_helper: get the in-port number of the helper device
>> + * that is connected to the csdev.
>> + *
> 
> As written this looks at all connections, not just those that are
> helpers. That is fine, so perhaps rename as such.
> 
> e.g. coresight_get_in_port_dest
> 
> and name the input parameters src , dest respectively.

Make sense for me, will update in next version.
Thanks for the suggestion.

> 
>> + * @csdev: csdev of the device that is connected to helper.
>> + * @helper: csdev of the helper device.
>> + *
>> + * Return: port number upson success or -EINVAL for fail.
> 
> sp: upon/upson
> 
>> + */
>> +int coresight_get_port_helper(struct coresight_device *csdev,
>> +                             struct coresight_device *helper)
>> +{
>> +       struct coresight_platform_data *pdata = helper->pdata;
>> +       int i;
>> +
>> +       for (i = 0; i < pdata->nr_inconns; ++i) {
>> +               if (pdata->in_conns[i]->src_dev == csdev)
>> +                       return pdata->in_conns[i]->dest_port;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_port_helper);
>> +
>>   u32 coresight_get_sink_id(struct coresight_device *csdev)
>>   {
>>          if (!csdev->ea)
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index c6bafc96db96..28ea4a216345 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
>>          return 0;
>>   }
>>
>> -/*
>> - * Searching the sink device from helper's view in case there are multiple helper devices
>> - * connected to the sink device.
>> - */
>> -static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
>> -{
>> -       struct coresight_platform_data *pdata = helper->pdata;
>> -       int i;
>> -
>> -       for (i = 0; i < pdata->nr_inconns; ++i) {
>> -               if (pdata->in_conns[i]->src_dev == sink)
>> -                       return pdata->in_conns[i]->dest_port;
>> -       }
>> -
>> -       return -EINVAL;
>> -}
>> -
>>   static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
>>                                  bool enable)
>>   {
>> @@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>>                  return -EINVAL;
>>          }
>>
>> -       port_num = ctcu_get_active_port(sink, csdev);
>> +       port_num = coresight_get_port_helper(sink, csdev);
>>          if (port_num < 0)
>>                  return -EINVAL;
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 33e22b1ba043..07a5f03de81d 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
>>   u32 coresight_get_sink_id(struct coresight_device *csdev);
>>   void coresight_path_assign_trace_id(struct coresight_path *path,
>>                                     enum cs_mode mode);
>> +int coresight_get_port_helper(struct coresight_device *csdev,
>> +                             struct coresight_device *helper);
>>
> rename here too

will do.

Best Regards,
Jie

> 
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>> --
>> 2.34.1
>>
> 
> regards
> 
> Mike



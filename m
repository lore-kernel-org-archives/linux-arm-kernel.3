Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191CED7496B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=; b=mV4xhicScHlsxceYBMGdSolx0+
	7EFP05EPryikn4HDOc8IB/MIhLeezybZTOCG6W4e5UkbxtWuPwD0Q0fxtN8RZux7XUOabnC942H62
	6vAoq2RSzMoKWp1apoJHtgS+Onth1/rRAHptOY0Xx+MQRcXt35BDF34n6mLlo6Ym3yWjs88vFI3sD
	b4hna9niDxkelk2xiDhXkX92yJpQ29kYIwYPVLtSwOaILHhPegGzRXX4TKXRqdjURaWDWHxEvwh4y
	NRBF71mavh48drL989ftGO/EVB4qrL6zLEFpNp+VWqiaZlrUoJg5Q313F78NAI5QMIdVJBDONbmVt
	qzRH4EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWio-00000009w3p-1FHC;
	Fri, 19 Dec 2025 09:24:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWim-00000009w3S-1ZLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:24:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c3v44101088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 09:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=; b=aCDgLARS3jQj54UJ
	L6gWb/8+Zn7EWzsA7zGPjFEF3ux+FijNYfSxC4l2oKnQwQxGYdvkbhvsQgEcshMA
	QkeCjd/Y4XPtQiWgTcNNXXZXNQ8wP5IU0H1BwcKpQOmDGWlAkxYlKrx20IyjwFe8
	osd94TAxaIuWEimju+EcXFw9676ozmgchZpJz9HYI2AAEQxFs69fKv0ns+tI8n4c
	FS9UPWhrNDBeHovozQtlVc2tKeiZWURJR/B5h2xyaboUe64N5kI1BfP7VQtMuDSm
	Dy6hSmq1+YNwYx8XjAUxdtp/GBtlI2zn1DNiCOJ6D1NInVSc3zaG2/13xxPlq4YR
	ww9Y4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c23aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 09:24:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso2496671a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766136263; x=1766741063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=;
        b=LR5UIvwX10KaD/SdOdN8tc7X+Zg8s/2aRV9jQxrgKvLvfYwNJmZkP6qWkB6FdnxwnB
         E10L4qC9GqXO3kthMi/r+kH98oGjsaJz9T/G+ucoj/F04ASzZNE7GC2He1kd9dP+1IHF
         SY94HMUS+AqL6E+T2dqWho22X5WvNSx3g29hzaNa7iB2vAVBa/ZfXwLANUpiOaxORrzq
         AMcDa+ctiGlq1oen1tgC6IkVN1nPmXtNDruOnsa32cctqeUi3iST2okDhIxPa5E46iUE
         YilOXunGaGCKLbY1I2t+IGuk3a7yy/O7HsMglpCh/Y9nkLQWaIJMt1E7z2FAPAvMA5EG
         RGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136263; x=1766741063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=;
        b=SvyRIE2FDxF8p+NRtOSBfh/dShT4ZwLlkUkS39WuEhsw0t6tYa8TwULxgX+f/OIfpY
         rmGWt5C3Ezz2NbVR+RStsJw0aELJZ3I0NHsV0nNl5bNLj1cqE34dd70b+krsZYI+kaS1
         qAj5e4KVYLItZZQtVR0gqacGE4c4FUy8233oFkPUKGlMP7FNCmll1zd4Tf/KU//GIK85
         PBFZrrEa7VLFm6i5pHR0ObKUUTlvt6kFiarJxm4UASFJPQ9s9o2e1bR8nxgfdrvA1sUz
         IeFtVzgJkAiOdVAqNXuJU3swkqMDTGhEEMYqe6IMgAjqaawGfL58ipV+HAZd2qP7XNdh
         xyrA==
X-Forwarded-Encrypted: i=1; AJvYcCUojxncQ6PU2HoOULIFgld/ZybKyv6yocAdS3ufm9j1Sr6UXWucbU/WnfR41FrjFGRkvVWNx7nl1XR+e/Ud1+/L@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoy/tV7czsfoRdDI99ODKSbn0m1RkQWSCMNid4OcxZ435SSSFC
	FjjUzvQy+xMsbSbqKQzorlkqVw1Z/BsnGwJyL5N8Obm3rAQZc+x/BexEPPW6KHcFsAR8KBEd+CX
	SpDLM7IgM30Ejgl6JMtfeZKgYYF1kPKyCNzB6Y3BlSJf1WQMqClkiJcYfx+Y8E7uU4BLkTunxpq
	E1Ow==
X-Gm-Gg: AY/fxX4R+LgxVaxBZC4LXX0TKw2Qz3w6RzIv/pqVvj0HFzRBgiWLJftGXbjTCWp38Vu
	dfDpWG+mNZ5Oo/a7c2IljoZKebmqUO6V+QsCtq9GaHubZ6+egvARWoEMDdXw7lpF+rkyk2k6OXU
	B83uD0FghdNtDqMyxOSvY5LIm4DTFFtJknf58M37aj3dkSzxDc2p6DUKitBhIjqZPSqe0D9ZO4y
	/2sdjwM08XiUxfLBEgmpO57sBJO7LTfmd9hwbCNIcE7CjGJ1HJ/M2pG3KB5pnlx/qPR/wjwDn41
	IFEC/erb6R1THnn/X7gSKmaPbGC0MtUpq5kAMoWbWFfqO+cHvtdlMeIKrRDqRTXHQ+Was4K1ERE
	A1S5yS0/gSADYBR+VG/9TRp+pzzYpL5wQ01cWB8d5mcThtKkwdN7U6h5iXWpLsCE2OPEwPsTAqm
	U=
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr5077765a91.14.1766136262589;
        Fri, 19 Dec 2025 01:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaHhZUaMUo8PyEk/p7xL6WeDX8rPW0yBK8DGzdCz4GjR2TbHsdfsLYyys2Yz/uQfK3XDzmBw==
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr5077738a91.14.1766136262041;
        Fri, 19 Dec 2025 01:24:22 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbcb6esm4744373a91.9.2025.12.19.01.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:24:21 -0800 (PST)
Message-ID: <ac1dcd53-87f9-4b6e-ac95-dfe5fc972a89@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:24:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
 <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NiBTYWx0ZWRfX4kLqUqofh03U
 trhFhQn7C/RmseyWPy81jYpe5WlTB01Wr9xywVpWbXkpsCTNQWA0BTLxgk9hHRMXzXJshRnTItY
 ySjkqF5CwmanI2B+UFia+EAqnntfDbnDeO3GEDZRSNgeBIWucgEanoDpg0eNnyWwSE6zz9iALYg
 +d/63/K/hkBlls5KnnPtaW/BHR7aykpRKT/DdDntVgp+a4SsaNCyf4OuLt/KUXtKd0Yy9JZPKMt
 Hs/C+km3HH4YT5NZ5QmwakTDhCkzQhA5JAKmnMJhXZQ6wRWMG3SEGa1LqkwSGLwIbGXirJG4VLB
 aeKKr7dUwdLsACYdOm22LudDgB1AOLjvWdput2S1ZVJO9U/v3U/ErtJvT182PF+1VovWG86B5wG
 Tid4HolsRT0o5orn1gWby5chaZwYtppincKrFEkSnZOl9uwW0bhx+W9CsVOllyl+G+mwiYHcv7R
 PNRVFJ5Q1n6BjJv/QJw==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=694519c7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=t5fKABB059AxcEZLcEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0nkbbnjmG6-Q26rPQ4onGfUlrT5fuXKY
X-Proofpoint-GUID: 0nkbbnjmG6-Q26rPQ4onGfUlrT5fuXKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012424_451327_3BE91DCD 
X-CRM114-Status: GOOD (  22.86  )
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



On 12/19/2025 1:50 AM, Suzuki K Poulose wrote:
> On 11/12/2025 06:10, Jie Gan wrote:
>> Retrieving the helper device of the specific coresight device based on
>> its helper_subtype because a single coresight device may has multiple 
>> types
>> of the helper devices.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 0e8448784c62..667883ccb4b7 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -585,6 +585,41 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_helper: find the helper device of the assigned csdev.
>> + *
>> + * @csdev: The csdev the helper device is conntected to.
>> + * @type:  helper_subtype of the expected helper device.
>> + *
>> + * Retrieve the helper device for the specific csdev based on its
>> + * helper_subtype.
>> + *
>> + * Return: the helper's csdev upon success or NULL for fail.
>> + */
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
>> +                          enum coresight_dev_subtype_helper subtype)
> 
> We have almost a similar function in coresight-core.c :
> 
> coresight_find_output_type(pdata, type, subtype).
> 
> Please could we reuse that, instead of adding similar funcitons ?
> 
> Please be careful about the mutex.
> 

Thanks for the suggestion. I reviewed coresight_find_output_type, and I 
believe we can reuse it to retrieve the CTCU device.

Thanks,
Jie

> Suzuki
> 
>> +{
>> +    int i;
>> +    struct coresight_device *helper;
>> +
>> +    /* protect the connections */
>> +    mutex_lock(&coresight_mutex);
>> +    for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +        helper = csdev->pdata->out_conns[i]->dest_dev;
>> +        if (!helper || !coresight_is_helper(helper))
>> +            continue;
>> +
>> +        if (helper->subtype.helper_subtype == subtype) {
>> +            mutex_unlock(&coresight_mutex);
>> +            return helper;
>> +        }
>> +    }
>> +    mutex_unlock(&coresight_mutex);
>> +
>> +    return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_helper);
>> +
>>   /**
>>    * coresight_get_in_port: Find the input port number at @csdev where 
>> a @remote
>>    * device is connected to.
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index cbf80b83e5ce..8e39a4dc7256 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct 
>> coresight_path *path,
>>                      enum cs_mode mode);
>>   int coresight_get_in_port(struct coresight_device *csdev,
>>                 struct coresight_device *remote);
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
>> +                          enum coresight_dev_subtype_helper subtype);
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>>
> 



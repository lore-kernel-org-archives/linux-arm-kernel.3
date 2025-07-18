Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C841FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72fuRZDHA2C4w80oHJ+JOeIuL4vnW4n3bjADol5r4EQ=; b=L/G+BBO/zS/+eDqTQUOdmAEmEB
	P/bawz8qd72Kg0noMmqcScQT3e6DB+ztIzEXc6Bz4xTZ4rJUv2vUGdDki2Nw7HpawCILjYJcPg9yX
	6k5BfqAvsXKwjSfHJrMDSejxIBoY/M0XGKiJyfP4M5QMsLiREh0owW0v/yBYE6ecRyucNAqUVnvPY
	2vsNpXptzRac1CFfTQCuV459Dh7U896e1vi0cT3OYq9hkXM1KKxniSeU8o0F7E54/WFOMf0bZtvE0
	ECOWQHeB9xYBr3BIM8DmSzfkElvjXDFwDh/3v+o5qgn1prJaNcCsLmWYQmjFOpwa+CwjOzGrkr+GZ
	jGOxxliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciBj-0000000CHfK-0OZk;
	Fri, 18 Jul 2025 10:19:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchWF-0000000CCvc-2hAz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:36:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I70LSl022251
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 09:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72fuRZDHA2C4w80oHJ+JOeIuL4vnW4n3bjADol5r4EQ=; b=OOpgf8hoD7V37vAx
	B2k1F++oE8DrbU5e9psagCXnTfbdUG664WOHtYv5bXYTWSZYWUNVbXFOTKF+VkTE
	TXrVjMF0uzp9pzSoumW8oAW0JzeYMw3u78Uq4vO+tA2Vo/oRw4kmLFp6KbLdJP1K
	z+UBkzh8jHVpRKXM462OwntkvVH1VQRzmwnLzNSAVMI2vj2apa9WVuOQlMILUhBH
	x6VDwpiZ79+qs9zOGAo+M5i/fIlsNJlSbOIdAzRQYIhLE0RnIBDGh35ZZ5SMtaPU
	7iRu1qFz+yqEuuAEvTLCIOXQuZ6rlIPZTGqOvXBeYKRwdjsUzoJF6wzs6JfWbc1J
	Zqaleg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyayva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 09:36:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235c897d378so18003395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 02:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831401; x=1753436201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72fuRZDHA2C4w80oHJ+JOeIuL4vnW4n3bjADol5r4EQ=;
        b=h/20pdAEl8mTG/Qol6XaHemOcJXQ9an6ZdIq2X4t/IkV0zGBA8Om7ZD8t5rzN4LUad
         cNINXHGFc53Kdg8kGrcvWXbHTviysp07aFJPl5/f/LXwnOzg/TPVREaNXFN0V+bBYKFy
         hSgoNpJeyXACnu3oeD2gvNSsjw5CMSiQj/PzlVW3a9paJxXTcoeg7P9leW1XiNfY/4Ct
         u1U7XS9uiKfD6dVdM9m0jY6p4JxYjmLMzYI/oe1MERZ2+IfCEoloSetgigPM5CXWpq/U
         cxFPqI+ralYjTa1xJdkTQjxE43Q+4SARh5Dk9iLlvb0OWZ8wDuenW6rtPbWZh2tWEI+p
         c02A==
X-Forwarded-Encrypted: i=1; AJvYcCWFvw4aUL782mukHTWul9BV2y5/PQwmbpseyq4SfnPVL5jH4jOBe8++309tCu+tN7/K+w6NXDBQPTqWkSRZLuMY@lists.infradead.org
X-Gm-Message-State: AOJu0YyxZaK7iVSOUUZbUS8dXwUSS/6Q6BmnLp1HJwS9wjqGNdAmIHTC
	jcCn8riGkvR2TLTDp/Ki0BKYhLir2aQvmencyqZ6fnK7fq19rx1Q7dnng0PtNVfsAU892erYVKn
	0IgSzHO1iOZICPg8HbKxO0+aX2b9QtlIDNWIxPDJqEh8Ir16ki4IBFOvS1VB045mrNxgWsKfysi
	eoZA==
X-Gm-Gg: ASbGncvsapgXB3NC8vnsqO6HtRlcaqe8DRQbTnuUy+YPR2BS/wf9MgmPpHlFIlrCWEP
	BuZZUYyib9qNqMmOK4798jV/xMC1BCmv5IQvnaLt7GV3+vJOdlFazOqUYiLSh52Pi4Um8hoX9vU
	wTOzcnmy2gKq6U63UKSr8r1y8yC0juZICzGtnxs5MWNRldPt9eCuc0iRI3CdY6VgkAx5d1PaNZS
	M6otZ48oCZm3u+h08WQHEArLHV0HfBG0sdR5JbF4tjKBxeA2oBWH3Wz6aUStMS/qdpgEaNr0UUW
	5YBH/y8KyhZYgOobihR4FxZKByfBspRSRQOufCux+5OiTqiZ5iKR5c0lJPun2+D+7Uw3Nlt4WLJ
	o73VZFVZ7x+ocMyXGU+5w8us=
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr130870395ad.25.1752831401603;
        Fri, 18 Jul 2025 02:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp4sFfqHaGHRuWJ/EeS/AGLmlnSykkRcmXhCvLfBNJz2Ba7o/Pxq0DoSFqc2RPSb3hpiQ0Kw==
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr130869955ad.25.1752831401127;
        Fri, 18 Jul 2025 02:36:41 -0700 (PDT)
Received: from [10.133.33.13] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a82sm9687825ad.156.2025.07.18.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:36:40 -0700 (PDT)
Message-ID: <da49f445-7365-4863-bb41-f7a55150c4dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 17:36:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 02/10] coresight: core: add a new API to
 retrieve the helper device
To: Mike Leach <mike.leach@linaro.org>
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
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-3-jie.gan@oss.qualcomm.com>
 <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3NSBTYWx0ZWRfX8+6y3EwhLH5F
 9y4jm95IX4u4wGF0fqItwIKLAy1WltSrZPgw062yCxeOOiAHPc6MGnbb3PWPoW9//flG25gjOd1
 FTLNuqrBfIhdni0zTRKjgCVDXIaUib3DzfeBUlWwk9v8qEIaCD5vID0e3rB5nDJIi/AUC1l6jq0
 Uc0BH5JJkwvePxV2HrLweg3UbAB0qm5H00CeWLDTsWt0wXg0iFT8eaA8rqdTD+BrYsZWUb2sbT7
 OR4QQX11hqRTaCuu4ZWdN4QPgwHzjOiXWsfP6/W/sjL75JtbiLQCr1WjbZ7Cg/Zr4YRX5W5zszB
 BrDBVfLRuYeJQX7hqmGbKsq0lsfzqi6wtv1kcwexky0g/+uLvHegdfxVtOSELqmOEwZ/6PrikqP
 3TOGCoQS6IuOvkOVfxkMQq//ckIpU3R2eVGzsnfLB90bkXJ7BuFZnLdEHcTRanJ9e4zekcL6
X-Proofpoint-GUID: 7JxT4LD89EBrudH-rS7l6GKWuK7duNf0
X-Proofpoint-ORIG-GUID: 7JxT4LD89EBrudH-rS7l6GKWuK7duNf0
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a15aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4z_qIjeFvS-qpd6pgFUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_023643_689433_3618CBA2 
X-CRM114-Status: GOOD (  24.29  )
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



On 7/18/2025 4:37 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Retrieving the helper device of the specific coresight device based on
>> its helper_subtype because a single coresight device may has multiple types
>> of the helper devices.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 5297a5ff7921..76e10c36a8a1 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>>
>> +/**
>> + * coresight_get_helper: find the helper device of the assigned csdev.
>> + *
>> + * @csdev: The csdev the helper device is conntected to.
>> + * @type:  helper_subtype of the expected helper device.
>> + *
>> + * Retrieve the helper device for the specific csdev based on its
>> + * helper_subtype.
>> + *
>> + * Return: the helper's csdev upon success or NULL for fail.
>> + */
>> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
>> +                                             int type)
>> +{
>> +       int i;
>> +       struct coresight_device *helper;
>> +
>> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +               helper = csdev->pdata->out_conns[i]->dest_dev;
>> +               if (!helper || !coresight_is_helper(helper))
>> +                       continue;
>> +
> 
> Manipulating the connections list almost certainly requires some
> locking. See other functions in this file
> 

Thanks for pointing out. I will fix it in next version.

Thanks,
Jie

> Mike
> 
> 
>> +               if (helper->subtype.helper_subtype == type)
>> +                       return helper;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_helper);
>> +
>>   /**
>>    * coresight_get_port_helper: get the in-port number of the helper device
>>    * that is connected to the csdev.
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 07a5f03de81d..5b912eb60401 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>>                                     enum cs_mode mode);
>>   int coresight_get_port_helper(struct coresight_device *csdev,
>>                                struct coresight_device *helper);
>> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
>> +                                             int type);
>>
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>> --
>> 2.34.1
>>
> 
> 



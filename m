Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD15C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=; b=k3ndYtvx0NPlQUMEau9YTCqX1g
	2qFWBoQLP2Mr195lMYBHlLOr9HHrYHHrolgdRShQr9+kcxtOIuAx5vUzw00X7mbOLH1lEmeVhGeaR
	Nvd9k8h307sBG6oHg7a+hORlMOItEYrHnfA39cHfyr3NQTm56eI+SvX/dQEjKyFXfH8EOApHe8n/u
	LPKJQq2m5xrE3Ta9Skm/0hxiasaDXAm67tIM+fEpotHmC9JRK9hLqv2BjF9xX29UWMU99ZLpfWJ8C
	lFnT3j7Ak6Qd7b+4tOYo2GtiD2kpCARwWvxTbAKiHYUsT5rxuLSAukkDERm7pooMcewGL9N2R6AKz
	ooJzFiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gRG-0000000E6vb-2206;
	Wed, 02 Sep 2026 08:35:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gRD-0000000E6uY-3AlD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:35:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vd8Z758754
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 08:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=; b=Y5J5G6Uj49qg8dCS
	OL12tnKb7BByLHCnzkaw54zOLjwmqimeJ1CL/WZoZRJsUDk/0CDPPFunhfN/YUjM
	OsU4LafWAJD9gQB/PySzrllEnvoK9qEHX7mfMBb0HueEGW8+lO/b7mBVHtcnn+xw
	7NO9aQzgqLc2YzFWA4pCun6TymPalUZtTmTD+4CYnH/IW4oZEyt8lD5TKkPWB1+d
	UvFQ0s4llECibPUvI23DYRrIYNE5Y2aylU1Ys2IKWPZrCA9MfwHxhsAg2LpKVRhz
	3kZF+VWU8BWYy0vprpGEQHG1NmZpySWO4guILYHXrfe9/+D1TgFGYxxdPSnxhmO/
	MLbp4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j2xxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:35:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1050240a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338118; x=1788942918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=;
        b=YXE1260yxLjFdpN7jE1QnGt+Q7rsNYZwZiUlCyqIeanBZINbk6xrMTMDqm/FxWVqZ4
         YuT+UXGnZFPkl0SEnd+f5gFZkOR7vK2zT30/Wh51pfZnQBrM+ahPvi3Th9gFrhQ/YcCS
         N+lEsfFMkMj7Cs/3/rqCAqbuYD2BQcUSv48aysQUhH8h9ghufOfQBL24lW+ymeXOVchD
         SkV1c/RH4rD1Wj+ixqSCNaZpl06mIgxYwnb0WKOvzsYaqSGxI6kK9Vivf8luCZiraMQz
         52/pnoqHw9kpgkL8demZJnxPe53lczIa30j6+Qh8S5/Xa3IOOfFPmcNC0S5KdT2D+bbn
         B0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338118; x=1788942918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=;
        b=k5FSkWNA/2f1pq1HSHNWIb4aW247OydVdNYFiq0hM8nIr2tn2zm4TQQPgWhoFztWET
         uQQgGzkjnIud2uSdBqQQhOqwm+Yl0IWKPD1WEhLPa31H2XN8hJTpV88Z1JIjEI0zsu32
         qeIHqstV6Qkr38q+Zhxq3gzjKmabikT+bC0HmKz0UCbrRXBgmp3J6bJPCXdqTw2tns1C
         rbhdFF4GfhFbF4J0q8su6luiOcON0isNDhsRQTQMi75hhh3X5TXF/TS0trSqWG1CjU2C
         O0xgU2m4WjOK0YamScUbAO/UM3Pu0X6DVsL4mlWKN4K0fLi7clcmPfJv3cHgi0t5oISv
         UyOA==
X-Forwarded-Encrypted: i=1; AKwUvByd/1bAXJiXm4/oHL/8ue4Us33oYz/2ZAtC5IqWBawUtxpd4QWJIoAg0BMafSL5WA5KuTEJuJvLJTLgYmXLO9wq@lists.infradead.org
X-Gm-Message-State: AFuF++noM7OUwpYZZbZqt081YkC6H6gvFpv9wA4xrilVSBfwz9Zl8OFh
	dfOtvPpn0e0xPyq3luuiYUrQqc3rWTz5j1UzMrVfyv/c3tB8NxUgaiRNq8DftWo+KBzI0qCV/bG
	amoy+L2aoRiT4PuUWg/sRnk5TZOZgMYNAEaNF879dCa5LM4axoc1cT3FZ+kETqUw0vKi4KMDJNK
	+d8A==
X-Gm-Gg: AYBFou1oa1oYyYT0IpjIrIhcqHnuF/tlFPY48uTCQCDENwT+7+LpXtp85EX/d4L1cFA
	FKFAVzEKa6TLsFaNhxcS2337JUtwgo1HD4iQuOFqthf1ASgfHPodMLj6QUg8uXpk9zDpNdgbh+Z
	IRotcE6GLdTwc1NAqx+52/5EInPJEEyhPvzUDf7WYWUokt+grbouB81PfD9H5yGiOOnIUxVDWi9
	W4jQAp/j+SrNhlor+u5hUn1/8VRl2j7ZSC2O3xNTt/OLNqyi8ElIlIqIJyi7jWtNH+Cy8OpksNO
	MRGcLAfm4iHDzEz5mgYpZlK4rPZ7++6DupvfsaR3uc6+pjP0piS8nQKi/fVmd65YmgJxOzL/xsM
	pkT2nZ2IQRwucK3x8/d8s
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr4837755a91.1.1788338118501;
        Wed, 02 Sep 2026 01:35:18 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr4837690a91.1.1788338118013;
        Wed, 02 Sep 2026 01:35:18 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a315sm5013948a91.8.2026.09.02.01.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:35:17 -0700 (PDT)
Message-ID: <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:35:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902082209.GT8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7w9QwLcpGggDQOlT9x0MVv8EayBKp7ZW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfXy6nvwWW3GeAZ
 RKWbBFCj2dLL7J+mYKcPuW+hzkCsoylC9AyJmdkzsK4uVORVtQksFnISsmXjgS9vfvuMDfKWfYN
 /8BxOY07z6nYBVCpRq/qMuCoKTWnKW0=
X-Proofpoint-ORIG-GUID: 7w9QwLcpGggDQOlT9x0MVv8EayBKp7ZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfX/zTCVXVfODKg
 zPD4ueg2fOVdHFgMDXxgZh3ETpYQA+tYeXCkq9DDppy7mDMPodrYvaVfhxiWkaIRkARJytOwQKw
 KH736BCR/JSUpz1JrQY5/PAxTimkKMR+/sIDrf7pD/BvofpOCRqrcaXVoFx8uYmvwdl8U4+7tgw
 ENa5855Htl0oRFyOSONCcJCc93lnZo18rzTY2ui4RzBJ5WEW5Ahsf1dxLdiDoM7Vb0YsPKZ6NqO
 Se92wJp2z16I5ck9cWtS4/XJ366JK0E8NtBcI0dZW3yzp/HTxGfW0waHoEduhIUKhlEkpxWnsFF
 p7dBG1E9AhIIKDpsZ44hwZVICxFkGglNJ8xuUCRazV5uzV3e7psgJtqzRcZBea1edWk/DYTi73v
 sGx+6gQGP0u3T+WD+AB/Z8X+t6q9F3hjPFM4l86HzLpsrgdWni4njzNVQOx3QHrjVhOoEklK9md
 hY0zu/b92wT+2tZP/gA==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97dfc7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e4JKUqTIyT31dI7uBdsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_013519_803698_A0EA02D0 
X-CRM114-Status: GOOD (  26.89  )
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



On 9/2/2026 4:22 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Mon, Aug 17, 2026 at 04:50:15PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>>   		/* Assign a trace ID to the path for the first device that wants to do it */
>>   		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>>   
>> -		/* 0 means the device has no ID assignment, so keep searching */
>> -		if (trace_id == 0)
>> +		/*
>> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
>> +		 * means the device explicitly declines to assign one (e.g. a
>> +		 * pass-through NoC) - in both cases keep searching downstream.
>> +		 */
>> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>>   			continue;
> 
> Based on IS_VALID_CS_TRACE_ID(), I see 0 is for no ID assignment,
> could you improve a bit tnoc.c instead?
> 
> If so, We don't need to add a new error for the same purpose.
> 

Hi Leo,

Thanks for the suggestion.

I will fix this in the TNOC driver. I agree that there is no need to use 
additional error codes to report the failure.

I will post the new fix patch after below patch[1] to be applied to 
avoid conflict.

[1] 
https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/

Thanks,
Jie

> ---8<---
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..bf221c1e5c48 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>   {
>          u32 val;
> 
> -       /* No valid ATID, simply enable the unit */
> -       if (drvdata->atid == -EOPNOTSUPP) {
> +       /* 0 means no ID assignment, simply enable the unit */
> +       if (!drvdata->atid) {
>                  writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>                  return;
>          }
> @@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>   {
>          int atid;
> 
> -       if (!dev_is_amba(drvdata->dev)) {
> -               drvdata->atid = -EOPNOTSUPP;
> +       if (!dev_is_amba(drvdata->dev))
>                  return 0;
> -       }
> 
>          atid = coresight_trace_id_get_system_id();
>          if (atid < 0)



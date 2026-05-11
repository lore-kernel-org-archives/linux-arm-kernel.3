Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CFACD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDzJzgTlV5b542Ln2r9Arcy6fy3pq0bcMcvkAhVBoGU=; b=c8d8gLM2IDOg8CVMo71bNbQJR+
	+dFAzcynjQqJ0FJNyUNXh8H65z2QZxTEHveI41/7Txq7RIJVTI5MBs9vbs+js9dTms32+5eahoE6R
	pJ5eelSCfEPAqT6+uqc7M7pdzuxU5sRyI7pZP1TaqJADagAv45P5l11LVuox92+THG8rmF3HjSkh1
	tqqBziaTln8dNx5imD13enQtl584rHIod0ipemI7C/GBRe530ruq9Ir28bFdGW8XuM2vQV9/ehyMS
	erLMm+yBmrzDRJ4m23WaLdZ4pjxucdSKjq04IhNEcNZAOc/CotNn7gyWP3UhszboKl2WZHfqN8gtK
	/RJUcM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMv2-0000000CvMb-2lsY;
	Mon, 11 May 2026 09:27:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMuz-0000000CvLd-2Wx9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:27:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8Ehnq1358568
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDzJzgTlV5b542Ln2r9Arcy6fy3pq0bcMcvkAhVBoGU=; b=nDshcLMQzSgQ3u3m
	vG59/VoMFaU8bnAe7dIcL6rgghFbBVw9yFX/zLKv82BHnhtW5Suq71AR7YNb9VFv
	Km/CmgtNA3e/v4QWA4ELav1gClmHgBuygrrHdt7dMcFQ9e2z8b6ztZw84DHtCKzQ
	fxcv7me+0GKSeGEW+wq2RKHtbx/l691kyYIVsG9AV7yoyJ/9fBd2q1baQEJHYTpx
	/ae4ZoKV2U50t9sQyf4rzzOaOvNi8oaivz3vSDrw8SabZMfmaGseNtoPgZcJ0oML
	LtEgNGk7W5YnS2kmtlEgk2utDEA3FPBZ7bV1oFjqMrUio1RqtkCkMzgwAtjFxgNc
	DFHZxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4k42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:27:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso2965263b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778491636; x=1779096436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDzJzgTlV5b542Ln2r9Arcy6fy3pq0bcMcvkAhVBoGU=;
        b=WxTqEHYIPT/aBnpnXAsXgMcfWhZWNesUj3Be9k0C3j2z/0V8Ao0QoobBhQ5As92JTr
         rNdw1F5azRwZIBiTDra73nstTjX+ARtK5sppRZEBrxT9LbzSB96b1RjP/3zvGSwF3GDa
         +JAXlEwoJ3OWYvvVRm7RJcbWNR0I2aZ1s0+Ko9wWbe0DjwTNOAUaCDiaSM9AvVa37B7Z
         yGFItcGK1aD7JoQkTzqphOeStXlexoAdyDCLOR9hfwWzxJC40ctjQf2tYVhxVK0CIimc
         izdTDumtG5zYx7cwDm2U4kNjFD8vdLUW2j3HQa441P+I8zuov28fifUq42eLam/Dx/8P
         5zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491636; x=1779096436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDzJzgTlV5b542Ln2r9Arcy6fy3pq0bcMcvkAhVBoGU=;
        b=AagsAY98geAYNay+84SoxrJNG58DzyNlCg1kbAEBdvzmUAv8P81X2VPBTFRcvGK2n3
         mUWzmaJ+YND7njMKH+kMOT29cbguKIMq3e2OckvEbLMvY5d8TT2HWbtQFpg+/L+oEzxE
         HLOjDJgq+sHe+5V1AI5GhxUx+mShGNY9Q9kNtOg6qsuCd+lGPafFMzUXFWxN+sippoiV
         0NH7nt1GJUyucGPOimS0pdACbrJU8HPlpq3y/UZ320oeUfXdFpRXZGUqGHQBupD5/ot1
         ZCT+S3SotgycTg5SrQ0mJanTT8+Ri0l932yWl4QVRRWGm7uOVrs29LzMCNrikXLZh/BC
         8tEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ihvhk+gBtBJbsfLCcHPZkQulS28oxE4lmSZbUSE6iJz8WUzwVAnhw0nNXdLxNIWvedqLkfRm33hhmE4TbCwP3@lists.infradead.org
X-Gm-Message-State: AOJu0YwGJgLjXSe+lMtSUjndqiIXwkmQ3f0yVTfJCakgWnbt2JckMgoP
	Js/aWtiWWpjG8kVDEPiNQkH+6pHeaQ48xhX7Y9ZrsY1VCAWUI70ZvidBPUY+hZDzC/uJYnrIScJ
	FEtM7JFhYIWqXN7db8vf1TeLeBiMKNEfO0Zg5ZI3Nv1LqR7YxBo21ofCoFWEJHgCI1nV+mrR90y
	4bbw==
X-Gm-Gg: Acq92OGdmpwxS8eUqc7VvCByn5HcA5lgXtLiD7MIhrGKlJdTwv6qZ7EPNqEeqOUjY1e
	CpcLILDc9LLvDBPyEs1/R2mIkPk2r+hpj7o5MgfVNe8X4oRroWq9N4qmc0H3ZPfD117nVJ6F0Ca
	1jeNRhBTAsIV4HDWIJ0KdPuUqLPRlNmYWP22dH/0/pCyBHQk1Vi99VIHZAASaKhjaqUsbliKC7u
	PpFGJkmmi+cUXkAnSRvtV7dhhRr8wNkUxlshF2JPCUSM6rHq8kooiH1ce2pi8mQD7Jicg6l9qrg
	AJRHNNikuKcJcqehKzxjXYH/YFN8mhVIcK+hFtYEPWYY7a75nq96QeowBdvS5idGQbd/xSld0LF
	JlE1jDofhbM3rvHW9f43T+xmWuz2krvd0bHYg3UwxnS+zL9TrURvtdI5dGSQdkorVUNRTvwE3l9
	qMU6NRHH4vLg==
X-Received: by 2002:a05:6a00:a907:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-83cf4f760dbmr14044025b3a.8.1778491635550;
        Mon, 11 May 2026 02:27:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:a907:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-83cf4f760dbmr14044000b3a.8.1778491634961;
        Mon, 11 May 2026 02:27:14 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839656464fasm19766905b3a.11.2026.05.11.02.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:27:14 -0700 (PDT)
Message-ID: <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:27:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
To: Richard Cheng <icheng@nvidia.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
 <agGd1AB19yz0U2s1@MWDK4CY14F>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <agGd1AB19yz0U2s1@MWDK4CY14F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMyBTYWx0ZWRfX61YzO6mDnvmo
 c8xKd1ix3I/YFvINXM0LmYD/Xn6X6kK/1+XoirRLSuQaaQLwGDHUu0ST3otuDsxYjwq1vM2cz0h
 TuTHy3Lf3p6U1ikGj8+ZIR25R2oUOt+Ut3XaDQ5MeGjpxoHatFwWsrvh/ewiH0GdYFczuhqbOZ5
 ta+7khr/DwH3r3FdWJjEW9z4zLQDxrnkAX2unEl/bYWZxxKQaAgHf0YspI5ISDOXrzSkyBKAbhf
 /1C4exSgMyL8TxrUYpLozervG8LeOwQjxfrL7s5fqxeUJH73ebfzeLlngti6tepXuGEHnouSM9v
 pIdaeSoDrMk9tj110SEVahj4tEFi9KIDU7tX9Ld29dBTL63KxdBoRWk1W2iZRjqCG7XLEDpvr26
 vXTx/hX3o0W3rnSpiTR7mFq0wcDbZb5lcofomM2frlPzykke01afPKqCS6d+67fy/zBDmydwK5g
 FSaApLRF9wvzDHxNTDA==
X-Proofpoint-GUID: Q4BLa48_gIUCPCWDwJXLhryaMGc4j7Gb
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a01a0f4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=wMIg9ovz4t81wBIZ_fcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q4BLa48_gIUCPCWDwJXLhryaMGc4j7Gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022717_776703_BD56A315 
X-CRM114-Status: GOOD (  28.46  )
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



On 5/11/2026 5:19 PM, Richard Cheng wrote:
> On Mon, May 11, 2026 at 04:36:18PM +0800, Jie Gan wrote:
>> When coresight_path_assign_trace_id() cannot assign a valid trace ID,
>> coresight_enable_sysfs() takes the err_path goto with ret still 0,
>> returning success to the caller despite no trace session being started.
>>
>> Fix this by changing coresight_path_assign_trace_id() to return int.
>> Move the IS_VALID_CS_TRACE_ID() check inside the function so it returns
>> -EINVAL on failure and 0 on success. Update coresight_enable_sysfs() to
>> check the return value directly instead of inspecting path->trace_id
>> after the call.
>>
>> The other caller in coresight-etm-perf.c discards the return value and
>> continues to check path->trace_id via IS_VALID_CS_TRACE_ID() directly.
>> This is unaffected: on failure path->trace_id is no longer written, so
>> it remains 0, which IS_VALID_CS_TRACE_ID() rejects the same as before.
>>
>> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - directly return the value for clear expression.
>> - Link to v2: https://lore.kernel.org/r/20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com
>>
>> Changes in v2:
>> - Refactor the coresight_path_assign_trace_id function.
>> - Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
>>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
>>   3 files changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 46f247f73cf6..254db91a8ac9 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -739,8 +739,8 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
>>    * Call this after creating the path and before enabling it. This leaves
>>    * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
>>    */
>> -void coresight_path_assign_trace_id(struct coresight_path *path,
>> -				    enum cs_mode mode)
>> +int coresight_path_assign_trace_id(struct coresight_path *path,
>> +				   enum cs_mode mode)
>>   {
>>   	struct coresight_device *sink = coresight_get_sink(path);
>>   	struct coresight_node *nd;
>> @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>>   		 * Non 0 is either success or fail.
>>   		 */
>>   		if (trace_id != 0) {
>> -			path->trace_id = trace_id;
>> -			return;
>> +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
>> +				path->trace_id = trace_id;
>> +				return 0;
>> +			}
>> +
>> +			return -EINVAL;
>>   		}
>>   	}
>> +
>> +	return -EINVAL;
>>   }
>>   
>>   /**
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 1ea882dffd70..34c7e792adbd 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
>>   void coresight_remove_links(struct coresight_device *orig,
>>   			    struct coresight_connection *conn);
>>   u32 coresight_get_sink_id(struct coresight_device *csdev);
>> -void coresight_path_assign_trace_id(struct coresight_path *path,
>> +int coresight_path_assign_trace_id(struct coresight_path *path,
>>   				   enum cs_mode mode);
> 
> Hi Jie,
> 
> Thanks for your patch,
> 
> I'm thinking will "__must_check" should be added so in the future the next caller won't accidently
> introduce this class of bug ?
> 

Hi Richard,

The return value has been ignored in perf mode. It will introduce noisy 
by adding __must_check. So I think its better without __must_check?

Thanks,
Jie

> Best regards,
> Richard Cheng.
> 
>>   
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
>> index d2a6ed8bcc74..b6a870399e83 100644
>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>> @@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>>   		goto out;
>>   	}
>>   
>> -	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>> +	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> +	if (ret)
>>   		goto err_path;
>>   
>>   	ret = coresight_enable_path(path, CS_MODE_SYSFS);
>>
>> ---
>> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
>> change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
>>
>> Best regards,
>> -- 
>> Jie Gan <jie.gan@oss.qualcomm.com>
>>
>>



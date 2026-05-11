Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B4CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex44qEyr1kPvsvTryMSWOrqALilXfojvWkgwTiJsRgQ=; b=uavho8eEmZch2Xh3lShVUlzomW
	gdufMoNyoXZMupPsMis+T6aIpwlHkrrwAZcIeThESn/WNLp8j+Np368QqKSdReFPVvbIInpVj6C6c
	1g0rLK/hm4LOArdcn4Z4EbK+j9HTLYOAQosgaaOmMZqh7Rr6W/qlefv/x5gv24uZu4kB4D4PJo2aE
	tDrjZXpKxk0QJdCapPWIYsUuCePVAtjxzSDXcvt01p/qJ80XtA1HdbAgj2RDgJ+By3ecGToVkoiXu
	goIv+eUDf3BE3PaNoZFOcMTO/9QgrAGAJt3daolqq/8lvrE5gf1ao/TbV/H+TnGNC3ZvEonLZTvWU
	+WYxX5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLrq-0000000Ck0P-15Ax;
	Mon, 11 May 2026 08:19:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLrn-0000000Cjzl-3C4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:19:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B2lmd51902429
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex44qEyr1kPvsvTryMSWOrqALilXfojvWkgwTiJsRgQ=; b=LuxdsXgdgLT+ZUNS
	EY76ORA4HxVgswueRvoTLhMrTog1/sRbGK8GqH6EIXh69sQi3NoOXciujAVXQOLd
	sirKLPwELDiG/5KYQEj2s9N1x8P/tBq7fYgsiuU9tDZRFAKt4op8rZwETQeQxlGl
	FGR+GwYFop7BuMwy/pDOGctHaRdRkbDC/hiS1nRlUtVIeUS0czZfHbkwyn/Sgfzj
	C9Vgub5JzUlHdeg3kB6ttpPkeKqZjij1h3CStxT3KGimEP7Rfz+DW4XUaYmXFW1m
	5tLfLx3T6CO+5ecwQUPJ7/miv+ygbZW+J3tTXWYqeDXuUbrl2cEz9rGw73C/cg2d
	n7ZRiQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4b48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:19:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8279604464so1478627a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778487594; x=1779092394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex44qEyr1kPvsvTryMSWOrqALilXfojvWkgwTiJsRgQ=;
        b=eOYecvKWjgLldvlMMH6t1tEQZcOt03tl8C+U8z9hIjPD1kBIQclSIWN9Jh2EGMkTq0
         m12Ct82bDxtsAsWCuQZAPEEigxkgm78YVSXKqVZL0IH7eNE/5RTVfVsC5DfGTGNvKji+
         hWdknMK6RwGy4RLrfJ1IqswLlFr8ijGDi/66Ts/YKnwk2lJBWeOOiFrf/Ad2BHnNL2hN
         KZ9vz08m7hcZpTgrU3DMfs9tehWgoopfKHyzZ1W1T+3ah53ALi7zbWE79MIo87Z1jI63
         GRKKU6hbyEbKxHf/+wEbY+o3RhuZQ9XZ63ITrpOQai8cmVEN5LNsIUrEGPMhlnKMrNSZ
         siwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487594; x=1779092394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex44qEyr1kPvsvTryMSWOrqALilXfojvWkgwTiJsRgQ=;
        b=mwjJke4io9aFKkCmbMX4xhb3etNsh3pUVu5A2Nys4E3HeVs/iBSis5zwguZIKO998B
         /K16FJmGCFW7E03xE80CL/y/PLYYUoQigVMmgPRhq1SWU6jg0K3gZYL24KNHv8/KsUTN
         tkcxzF8A6d+IDBnTUOiihNLvcZ6W+46wq9/V+5xX5B+d55tVG0g8Ws1R9CCZqWuHL0qr
         Q3DHUe3/OblL9lD5QDuEv9BlO9Hx5oofTWURnX0UVUX2sboz7UmDBUKjk7yeEfU3z6Yp
         cD/jowKvBmQG1svZwyPLpVluXgi06o43lbj+FPYfcGVWaZxlIOttoI6D89HwzGzOxb+D
         C1hQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LTWvqilNa1ecQFR9pkOIuW/LQ/SjgsBrwmjP2cAXzVGdPIwFFCnEOj8uvxgfy+H5bTE9L6hW2BZN8vSg6wvfK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9xJLyymeG6+1plKNQpBmKzIinsXDu0KW9i3JTBBcptsnk0oT/
	YGsef4u388HcGOfRgakHMyX8ys/uDlKvtbAZK52YhW1pEEWmDKPQSojiIrKtvuNwBGyICVYMVI0
	5tTgRuFwFEqWSfIrFp7F0KOy7mQnKF6cky5Koz2Xh3GLCerY/NSxkcxBJt9pXRL0X/M5GHwd+Y2
	Z5mA==
X-Gm-Gg: Acq92OGjR9rjN5DtdSdW8oT/2VdCt0uP25D8HEwek0yuDJ3dfnfy817v3KxgyCN++Q1
	U9iWUXdHZdHkcUelZvnYhRFkFroHQuGPsOeOQYwknNyWIHO1bYCZwycXc+tT1sQX/1y0ZrVaIM4
	pR1KXGRI6EgeYZWQ34x+6/TTMwJNjfH4rqSXcJ4+FRjeJmySRplHfSET2CV1mMIQx/lPdGkX+KB
	75b+9QLTIqGB4QMSVv3azlNdnBhFd0Td8BKn1Vwq360zjQ5fjdzBFCoHBZLSto6wpAx2RvHL/2m
	bjZlY6zuV7P9yeA1hlnvdepZa3QD3BFi1bIXZFwXvl7Q36uYSejip2VwvQezBjgQ5nJLqPQ8w64
	4fQFV8Pfklb2HmrOmjOaMhfrfG5ur/eQ7WX2bSTpG6LCBtTIOPg8T070MKp24lIp7nzz/KOsZsh
	HWYLHdl9svsw==
X-Received: by 2002:a05:6a00:f0f:b0:836:3faa:967b with SMTP id d2e1a72fcca58-83a5e45615amr22805985b3a.47.1778487593671;
        Mon, 11 May 2026 01:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0f:b0:836:3faa:967b with SMTP id d2e1a72fcca58-83a5e45615amr22805959b3a.47.1778487593137;
        Mon, 11 May 2026 01:19:53 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm19651595b3a.59.2026.05.11.01.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:19:52 -0700 (PDT)
Message-ID: <f46f2944-4494-43f4-be39-81b4fb40f4d8@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:19:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: fix missing error code when trace ID is
 invalid
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com>
 <90d86e62-1116-4daa-b557-fc86c40a0e69@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <90d86e62-1116-4daa-b557-fc86c40a0e69@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MCBTYWx0ZWRfXwefr/nRB6kLw
 QSDA9d/fCMV7PrFqaYCJ9eYEG3x2N7KyBXJMlBp1l073MwLbKiUt1u4Cpb1uutPv07AVLHyq046
 phTuQr524IbfzwC+tm3qYtSlt6bssuFOc/brPm1FmsZXddpKpycpQW/Mt8EqaJlMuyQHr7QKTj7
 EQxzphL892iFcRKdq7xQW/2hLAWyPE+QOVpOUd8jtWfr8pBUHBC2maoXI8w+IWM8UBahw3HQXPy
 LQaRVJzy7kBfmvubimWKixEg3f5Uu+LpMWiXPvENi0lbcEC5bj5/L1aqO+vkw/8uFodCK1Co26C
 kLfKToO2lkJQyMfH02EiCZuilTr+9pO3NNDsL3yxFdv/vH+UWjljdvZZYMyMLIKyx/n7ZPnqpFU
 vU08X2+GOlF9bRbGhyBvEjicreijO7w56GSNU777tbdFEcDeTjZ3dT9zildKUpM85dqOSmA4/pV
 ExiCeG1ZSgU3RNa4K0g==
X-Proofpoint-GUID: yB-XXG6fzOL2xI0CZd-QBrnup8k2zqiB
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a01912a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=wMiEN_vx28wPb7PzzUIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yB-XXG6fzOL2xI0CZd-QBrnup8k2zqiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_011955_925726_23F3007E 
X-CRM114-Status: GOOD (  26.66  )
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



On 5/11/2026 4:16 PM, James Clark wrote:
> 
> 
> On 09/05/2026 1:58 am, Jie Gan wrote:
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
>> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the 
>> path")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Refactor the coresight_path_assign_trace_id function.
>> - Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error- 
>> v1-1-5f11a5456fdf@oss.qualcomm.com
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
>>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
>>   3 files changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 46f247f73cf6..cabdc0c72f38 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -739,12 +739,12 @@ static int coresight_get_trace_id(struct 
>> coresight_device *csdev,
>>    * Call this after creating the path and before enabling it. This 
>> leaves
>>    * the trace ID set on the path, or it remains 0 if it couldn't be 
>> assigned.
>>    */
>> -void coresight_path_assign_trace_id(struct coresight_path *path,
>> +int coresight_path_assign_trace_id(struct coresight_path *path,
>>                       enum cs_mode mode)
>>   {
>>       struct coresight_device *sink = coresight_get_sink(path);
>>       struct coresight_node *nd;
>> -    int trace_id;
>> +    int trace_id, ret = -EINVAL;
>>       list_for_each_entry(nd, &path->path_list, link) {
>>           /* Assign a trace ID to the path for the first device that 
>> wants to do it */
>> @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct 
>> coresight_path *path,
>>            * Non 0 is either success or fail.
>>            */
>>           if (trace_id != 0) {
>> -            path->trace_id = trace_id;
>> -            return;
>> +            if (IS_VALID_CS_TRACE_ID(trace_id)) {
>> +                path->trace_id = trace_id;
>> +                ret = 0;
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Minor nit, but just "return 0" here is a bit simpler.
> 

Will remove the ret, and directly return the value for clearly expression.

Thanks,
Jie

>> +            }
>> +
>> +            return ret;
> 
> And then "return -EINVAL" for these ones.
> 
>>           }
>>       }
>> +
>> +    return ret; >   }
>>   /**
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index 1ea882dffd70..34c7e792adbd 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device 
>> *orig,
>>   void coresight_remove_links(struct coresight_device *orig,
>>                   struct coresight_connection *conn);
>>   u32 coresight_get_sink_id(struct coresight_device *csdev);
>> -void coresight_path_assign_trace_id(struct coresight_path *path,
>> +int coresight_path_assign_trace_id(struct coresight_path *path,
>>                      enum cs_mode mode);
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/ 
>> hwtracing/coresight/coresight-sysfs.c
>> index d2a6ed8bcc74..b6a870399e83 100644
>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>> @@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device 
>> *csdev)
>>           goto out;
>>       }
>> -    coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> -    if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>> +    ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> +    if (ret)
>>           goto err_path;
>>       ret = coresight_enable_path(path, CS_MODE_SYSFS);
>>
>> ---
>> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
>> change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
>>
>> Best regards,
> 



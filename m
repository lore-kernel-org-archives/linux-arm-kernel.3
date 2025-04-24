Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D8CC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY8TuvINZq3xaLhDJPXgJlOQHqLQNDKDcNKgYWGRTk4=; b=r4qIuaq+T/lJnVACHwYna0BKCQ
	m259Uom9I/xAt/VUsmEsaaxf+kO4LB/c+IoxRhEZZhMkezd0pwnb5TjFirlSYYNJq+gzuTo0768Hv
	49tVJ7m4la9QFsQIVetEhR71R8vSOxZcMnOH9XU4RUfA553uS8Hdo34YqWu5UcJeIBlxSqxAWGpp6
	DDat8XSgIKkrHYGfOqtVvgmoJ8vqnu4ahuSciP6842QgYus0kE1US7ErR7gVU373jeexc28lZ0HQY
	Bg7g6A56URMikIiMjdCiDgTdokP9u2rx6JHCQgvnhNfR6pxnKDpsPdD67HZyWrWLwhBnh8dCW1iWv
	PYdiO1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7mpx-0000000CfyA-0MTR;
	Thu, 24 Apr 2025 03:01:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7mnt-0000000CfUD-0PYC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 02:59:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7g0028374
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AY8TuvINZq3xaLhDJPXgJlOQHqLQNDKDcNKgYWGRTk4=; b=l6crTg6+kMI1540S
	ky4VuzKWaBxcvgVVLXxBnyvhFjH7vCr00jRgLrveGff9wpRhZKW26yx957FDEL4T
	TkbekYOptWOpA4q7cwjNRT9uSA6KTg/+nnXVMnQhRRxpTGpRgDVU4tElbuFhRjT5
	kNzzNe3eHSCOLB43mpthliHh8Rly98Bv0W59WAFlol2njVhN5E5Hz+1MCiswE6Qb
	3qq8eabENHCQKHJz92zn05zjlNNDKuHLm0bhKRx6jDNj6NySwhWfqdvbBk4s7QL3
	4RZSXmXLybbd8N/0eYp+gHpivlKct+noQWsvCMPWXYw0qLC/tHOgf18445kfEPPZ
	HgOyrg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4112-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:59:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso16276515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 19:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463545; x=1746068345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AY8TuvINZq3xaLhDJPXgJlOQHqLQNDKDcNKgYWGRTk4=;
        b=em8NIO9SEDjgKwkb4k4cMTAnonSm650MYeWDtxwoIB4PEF9ep/iXDRYLap7LPUHDrI
         ekkk+c8cWnPQ13KoPcmJpiA2MMXpkXRxL5iXM866eIcmIm6jMbm7XRJQIPm9T+y7mh7P
         oroPKP8UfZL78Q6kV4Aw0g5TASBEAgYJUzm7y00AuGOXitrcAqZX14/sp1gyoxuyv09a
         eGCaZarqB63RXGsAcad46lHYnmzz0OpROjgoLO1MBnWG7KIKbiYHNWkmv1IPpW57IR3+
         z+f0uWl0R4mGudCsV6CQayxZefgWuBgFn+0ffRb3e24SX808dV+Uz2KshsRo0IWrMmLm
         +BcA==
X-Forwarded-Encrypted: i=1; AJvYcCV8b4xrKxVilBeoTcCYbEMk8r+HYgD/GaH9Dz66lfWBgqLb5PorOMZGDftWzCrrGnVCbNbQU8ac0L2M46JnRAa/@lists.infradead.org
X-Gm-Message-State: AOJu0YwKvxzKYgX/628dTOSCz4ZiXdAMwMlxi4hg/z1cOw7Au8Sm6WhM
	xutcyAMlH1oosZ/q4yyA/eb7O8aEOjFn0VKxFamDCXQ9nvrEPZpH8vVNCbzSJBOVAX+Oki/+71m
	v2ku6jTMgYn9qpMLO/9NSIZc3fCKtVMGVnuOK5fTJP0wEhqH7MNjNP0pAuvSBvTuqB+xyVm7cxw
	==
X-Gm-Gg: ASbGncs4Zngu5pfTUK9ZIT5lL0Ed5tE9rmdbKxFO+gthvHZqBbL2zs1NLS9Zvlb42Jf
	of040WFeaPtqnT/qmZ+vYqmQFxgctGX7NgyyX/7z3ljymj+uz+s6QbDuN1p4QpNNEI5UseRWU+Z
	femQc4oE/V9AFe2vPgarh4pT9LFQxUwZ9WE8cFyu5ID+f8AisUrx8xC4P4Ndn5osFWyn6DDPjvF
	B1mbZc9UtyYMKeuiAeey3DTGZld0jy6D8XqAmxxeCJISat5TW92DRrAYp2fEXJ2t0HUglgwZIDs
	7dmiosmA7hr64iQMlG9OOLNgCLoOTrnOtsI7ghmAcoY70x6nv+wreTLuUcG8Y1IXxOFXstBx
X-Received: by 2002:a17:90b:5104:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-309ee3f9ac3mr1009146a91.11.1745463545402;
        Wed, 23 Apr 2025 19:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1uoQJIfPOjYS5c0t8qEcdJBa/XSSVaDhhDbxUVf2wYW3p+2ufJ1iKpn+iSg1y1zlPpsMSVQ==
X-Received: by 2002:a17:90b:5104:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-309ee3f9ac3mr1009128a91.11.1745463544995;
        Wed, 23 Apr 2025 19:59:04 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm120027a91.36.2025.04.23.19.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:59:04 -0700 (PDT)
Message-ID: <87314d4c-e98e-4fc2-950c-52593a7a9ffb@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tmc: fix failure to disable/enable ETF after
 reading
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
 <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAxNSBTYWx0ZWRfX/J6kqS4wKrM+ mWnmcb9/AelIktMsqZ8XHF23EF8Pl+2LTSgO5zpRysbeM+4VaIcrRi9+XCH/mxCJpQmCTbnSaX9 Mj8/JZW8sm7yjGYBD1kkyhqUm+hveQL/F3nfjyNvlsP00aypcSEhvNTQIA0dAfckD+Ho3GUfqye
 g9sedo64HvZdrKiG/RIV3PQm6UJ12WVAT7tcFsJJYTMBguup18W6I19Yd1qL0mn8IUQrEJRyQaX oAkn7MvclGa0VuyajA2W344hUYbwMaKpCBfrygm/yZUWx+AzgwhEOIybI6GToShbH9DNl3qCGgo pSWWAfvXWh09GXG4Hd7/7FZF9KHuAnD/GOopuyEr+4iYeJolIbDFXlM6yArftITUmuzr018Jb4e
 UPnWuHfTuRDcLy+jA6F92widAUDeV1/ZpnJ5q1vDwUJKY2XHfJ0zxmVciUZJ8UGfeYqbV7ub
X-Proofpoint-GUID: 5vxQPvfr0WT8dyfSqQVqbGdcQOUtpIrU
X-Proofpoint-ORIG-GUID: 5vxQPvfr0WT8dyfSqQVqbGdcQOUtpIrU
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6809a8fa cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=6sRczlYm9dJ-c3QEjcgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_195909_358003_8E3600E9 
X-CRM114-Status: GOOD (  33.18  )
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



On 4/23/2025 9:56 PM, Mike Leach wrote:
> Hi,
> 
> On Wed, 23 Apr 2025 at 11:37, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>>
>> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>>
> 
> What are these extra email addresses for?

Sorry for the mistake. I did not aware the commit author is changed from 
me to the original author.

> 
>> ETF may fail to re-enable after reading, and driver->reading will
>> not be set to false, this will cause failure to enable/disable to ETF.
>> This change set driver->reading to false even if re-enabling fail.
>>
>> Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")
> 
> This SHA and message appear not be present in any upstream / coresight branch.
> 

detail for the commit from linux-next git:

commit 669c4614236a7f78a2b693d0024cbdfa8536eb5a
Author: Yabin Cui <yabinc@google.com>
Date:   Fri Jan 27 23:10:01 2023 +0000

     coresight: tmc: Don't enable TMC when it's not ready.

     If TMC ETR is enabled without being ready, in later use we may
     see AXI bus errors caused by accessing invalid addresses.

     Signed-off-by: Yabin Cui <yabinc@google.com>
     [ Tweak error message ]
     Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
     Link: 
https://lore.kernel.org/r/20230127231001.1920947-1-yabinc@google.com


>> Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index d858740001c2..8c9f14e36bc2 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>          CS_UNLOCK(drvdata->base);
>>
>> +       /* Check if the etf already disabled*/
>> +       if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
>> +               CS_LOCK(drvdata->base);
>> +               return;
>> +       }
>> +
> 
> What does this have to do with the stated function of the patch - this
> is unnecessary.

I agree with you. I think it's ok to disable a disabled device again.

> Under what scenario can this function be called with the ETB
> previously disabled?

Combined with the fix code below. It may appear a scenario that the ETB 
is disabled but the mode is CS_MODE_SYSFS.

> 
>>          tmc_flush_and_stop(drvdata);
>>          /*
>>           * When operating in sysFS mode the content of the buffer needs to be
>> @@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>>          char *buf = NULL;
>>          enum tmc_mode mode;
>>          unsigned long flags;
>> -       int rc = 0;
>>
>>          /* config types are set a boot time and never change */
>>          if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
>> @@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>>                   * can't be NULL.
>>                   */
>>                  memset(drvdata->buf, 0, drvdata->size);
>> -               rc = __tmc_etb_enable_hw(drvdata);
>> -               if (rc) {
>> -                       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> -                       return rc;
>> -               }
>> +               __tmc_etb_enable_hw(drvdata);
> 
> Dropping a valid error check is not acceptable. If a TMC cannot be
> re-enabled, then that is a hardware error that needs noting and
> dealing with.
> 

That's the issue about the error check. __tmc_etb_enable_hw may fail due 
to hardware issue or just a timeout for tmcready(may restore). The error 
check captures the error and returns directly without setting 
drvdata->reading = false.

So the current mode for ETB is CS_MODE_SYSFS, which implies the device 
is enabled but actually not. This prevents us from processing another 
enable/disable session for the ETF if drvdata->reading remains true.

Thanks,
Jie

> Regards
> 
> Mike
> 
>>          } else {
>>                  /*
>>                   * The ETB/ETF is not tracing and the buffer was just read.
>> --
>> 2.34.1
>>
> 
> 



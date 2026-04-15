Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC828F9D0FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL+hCT29+A3C+moPfcDYFN3MVGqIHZLQytI5dcSdkrk=; b=uSXCnoowbm+nSyo2fM050v16RL
	SjBHH1z6MYpcicH5FvMGy2bEcLxfV18mZWYinCmT3XY4aSiehIafA8NkIV5Zt31yVYDU4G3YiSOyi
	w8i3okW2nRtXDE+ZgjxdJYbJWbbA0KdjibipSJJjfuqHzvKbf++HoeMF3aA5C5EuPBksoD1PDIFbC
	AYDAAsuoYfiNloZCeo3iYxGslYnW+pIwevCB1dTeMS0shVJtk2cvTJsLaGuGKYOdYzz0dX8oMWYUn
	fX6iSVk5+qx0epDtfEcS3DStpbmsylDsXRwkU/nxK2VqT3MkHsCbostJX9YJTgTX3JcEAkyp9m6B2
	Ytzao2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCowd-00000000QCm-1opb;
	Wed, 15 Apr 2026 01:21:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCowa-00000000QCG-3eL6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 01:21:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI109A3759657
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 01:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL+hCT29+A3C+moPfcDYFN3MVGqIHZLQytI5dcSdkrk=; b=D8jSNY/06kLLhRho
	guGDqS6Ad4FlnIhXuXzly234mWz6dDTK9SP9rBFfTkKfhLibSzqnCHedznu5BRFc
	mKsX4fn7r8L7agpFNmL7/mnbDghCbMxuXV9MrHc4Uv9PQM8x2UJJtsOKQvrbamEU
	XjaVSi2qPhgUI/WYfMjh7kZciXwCJZUHAoL4HjZJWa+kAsRoLRigAuwBWTu8rTUX
	kOyur34V5i8s29d5BML6+k/44gIz37JxedP9kYRyTPv3YELFUTI6r/cfZwSEDl+w
	6gT17nxgJEixWYe8Tajf4SKbPONU7lWft0f4/SAGHkj/ILbldV1yyRUnyCmdldFh
	y+VWYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg093uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 01:21:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so5803272a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776216087; x=1776820887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL+hCT29+A3C+moPfcDYFN3MVGqIHZLQytI5dcSdkrk=;
        b=Mqg/57ucMIRfdVM2h+xOd/IKePz7CQNDeKknfR2wrKovjRSdEbLdFmcEWMGmXBA442
         AmWY0AuI8tDZEo+u9QyRQp1uHizu4XWUmfo8scJUnHPD2fR/aYqGPkHP5Eg1gql6N9hZ
         NHirTo9hX+kWXa6DTPnnG4CxP4cDjTHtOP65tsgfYS4PaNPw6eYmnlW0nMBAgzz+kdkj
         DrJ71rcqxIVs57+tyEKgZ+h3rNv8qxue2prptDgAoSbhg4AtgBgzKdXRjl+Fc2GiPCZQ
         A6Hx1bKXuXN0sE99aAJpIaey4UjFRQQlzb7S46g2X7qi/ocBWZDLpj38LDahRh9WnDmZ
         xkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776216087; x=1776820887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rL+hCT29+A3C+moPfcDYFN3MVGqIHZLQytI5dcSdkrk=;
        b=RZdAZuCYh/cqYCsmMy+oiEAn/OrHBcZhkTbVFol9FZmi1OOUtBnfB0CxrCpoRNnQce
         X3iRNJhYVe3fuHJSKIsWphJok3oU1OMDUArS6F8uHvYmOUw1T5ZPj5GzOqeuh1Nen7Dc
         UHrIBZOXeOhXcKAMaq5StMTNgu77UOst05z8qKVJtEEVHrf1ODFfwFP4ocD1l5j3+LFq
         pwujMIBXArgRY3VpuLo80mT7oJ9tDTcXtAEXpp6BiAX4rxqeX9gy/zkR6uy1ti4Oo1u/
         OVQMgAVdcDl7OVn31iyNwNkD0O/eJFgMzx02MwxmCv8Z4+QRtdSWJBtaaN6mXd+fW3Ic
         HsDg==
X-Forwarded-Encrypted: i=1; AFNElJ9bnB5osV0M2NQU2r0w1AdUh5WJfAIq0zy0w8vttwVvcruy1B0PD5fhBpfLK4ZBLl6+LI+fedtgdRDDYuJDur0F@lists.infradead.org
X-Gm-Message-State: AOJu0YyxOWTsdGTS+tYv+KI5OKmZHCkqYxVDFuncoWYYeY/VZEz+kvZQ
	gvMr5hqcq2teRiJaYBQqalMfzEanmrzBCVrh2VYtyG4NX2O08QuR6PG/nC0bLX7gS0dYNxUiv6b
	PgCc6zHJMu1xnuhmOsFB1kP0EzWXugxp6lwpDpL0sYVgNACumf4MVY8lI9MRUTHp+9KSdRhWk27
	Tgxw==
X-Gm-Gg: AeBDiev3a3Esp7WvTbOFJeYgEGKSvc7aQV8Ik2II2P/SBjYkgxZLDqtV3SU8MiKaZLk
	46zm82Ny4gZXXOjJn/ikXIbZigFvXXDvBsocJTZglo/aHEpXp0RjB0fZavk3XL1KtsWbkzsCCJh
	k1DHDgixKspVZHLNMcMhXREFVa0fzUIVMJC9BXlu5fVtwHvoVQtIDX7PSPucW0uAgn5EZwII6Vh
	crfo1jQQ3PC7MFZP2vRNG/svKhqXD4K9v3/ukkZtqQnTNw9K651IlRJMXfzdICBay9hQDPUFGQP
	tAbZ3cKKdilUnVn7NSD5VNiF0NROlcvJ+czCEyF4e4h5Ks9HOe9JnouepQmvz0R85NEkvVwjBEZ
	H0IDxdi0IJDUtqgJv/Rf3erXbMV4BqNWkCMX7hAUi6hxsYHAduhai4+h2Ai20I5nDCxwb34pcXU
	UJu3N4MAHSzeA=
X-Received: by 2002:a05:6a20:3c89:b0:39f:fe4d:ae14 with SMTP id adf61e73a8af0-39ffe4e167fmr16457253637.46.1776216086623;
        Tue, 14 Apr 2026 18:21:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c89:b0:39f:fe4d:ae14 with SMTP id adf61e73a8af0-39ffe4e167fmr16457221637.46.1776216086077;
        Tue, 14 Apr 2026 18:21:26 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6747541bsm274402b3a.59.2026.04.14.18.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 18:21:25 -0700 (PDT)
Message-ID: <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 09:21:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
To: Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
        mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com> <ad5wVVnUw1jnkCdn@e129823.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ad5wVVnUw1jnkCdn@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69dee817 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=i5J-H8vbHws4jmN2WCEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: pBSb6fLV9nZB88F9POpM9sbuzIApveXH
X-Proofpoint-ORIG-GUID: pBSb6fLV9nZB88F9POpM9sbuzIApveXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAwOSBTYWx0ZWRfX9H37jnfa+bIZ
 yAf/CiRGTENjFbYSv5jd3QGV8LRnrd5L0PuVVu0Dh56MYcnngkKB+XPxquLdKM8SM2DiROG8Itj
 AccdGi7sQ+/TIX87BriFza54azb3ed1PQZe5iRmOd+K/6vd1H4MeP9DBLJjGt5XfXxiEn6CGO/1
 3LR3mgYw4ZPtMDasIR5nTCdao/UWfNTMiQe3CA/B2dexIzQ57QCiiQ8MkIZUPQqGzFI942UTIPE
 6Sbb9sNy0bi/yxuS0ste5V7Y0v6gtSVmotjMfyMpr8dRdQsgG/1QcnO+Te/CsCLaCf5/gkvUPR1
 YIWVF5uxz37HMpVFdVfY+0UBcozlm6fa9SrwdJdfUnrLPKqo3/6e6DEJ6LNgs5UcUjVfn8A06K4
 zw9YebzsdDztnTDERihFt/xH2QdnGPp6Un8GOJpdQ+9Hm3wmCDPW19/dNKP3SZ9zuoFZLBMSzR7
 hgBjZHcwkpAtZxBK+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_182129_036652_45E9DC73 
X-CRM114-Status: GOOD (  26.08  )
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



On 4/15/2026 12:50 AM, Yeoreum Yun wrote:
> Hi,
> 
>> On Mon, Apr 13, 2026 at 03:19:56PM +0100, Yeoreum Yun wrote:
>>> If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
>>> the trace ID may be leaked because it is not released.
>>>
>>> To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
>>> fails in cscfg_csdev_enable_active_config().
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index 8ebfd3924143..1bc9f13e33f7 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>>>   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>>>   	if (cfg_hash) {
>>>   		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>>> -		if (ret)
>>> +		if (ret) {
>>> +			etm4_release_trace_id(drvdata);
>>
>> I am not familiar with the trace ID, seems to me, it just allocate a ID
>> for each tracer from the ID map and then always use this cached ID for
>> the tracers.
>>
>> If so, even an ID is reserved for failures, and the ID map is big enough
>> for each CPU, we don't need to worry memory leak or ID used out issue ?
>>
> 
> Agree. Practically, this is not a big issue and I don't think
> because of this new id couldn't be allocated in 128
> although the one id is occupied by cpu while source is disabled.
> 
> However, in theory, this could lead to an ID leak,
> so it would be better to release it in error cases.

Actually, the 128 Trace ID is not enough for allocating. That's why the 
TPDM devices share the trace ID of the connected TPDA devices.

For the QCOM platform, we may got plenty of ETM devices (SoC with more 
than 20 Cores), lots of TPDM devices for each subsystem(CDSP, ADSP, GPU, 
GCC, MODEM, etc ...), and lots of dummy sources...

What I am thinking is as SoCs continue to grow more complex with an 
increasing number of subsystems, trace IDs may be exhausted in the near 
future. (that's why we have dynamic trace ID allocation/release).

Thanks,
Jie

> 
> [...]
> 
> --
> Sincerely,
> Yeoreum Yun



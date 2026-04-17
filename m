Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AA7F8E498
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/u9RhBo3JBBNTyMzBllN+ZTtf/E9vfpiyWfUGP0fBo=; b=Ji3KciNjHJJmqUAeA6qIbCQiBQ
	oYvpaobMduqGpAk4RVMtqoHfi77ndpnHcGb2FpUWyte/juKWaDxI03w9LO8h4oHnaZz4MbKXA4NJS
	6SR68/2VsSUHybEGGt2gT1MICxUVXzWN/gV7nwry4IsJICcvCCtusL5WHE6vhjlqkVVCFL9oRPABn
	5+yLGhSYkwnq6Xyl1yaFIQ/kXkUJgga8vR1QrObEr5njgG/rxIAafhIg2mo7h2kg2fvxczwRw164X
	Ox5eNYuHohCQnGrZJS/5XTptZXAO4vgMbbpdmZ7gWEfezd8hGuZP792QUd7cyUYV3BrxuDSUZGtKY
	pjFYiHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXaK-00000003GFx-2A0E;
	Fri, 17 Apr 2026 01:01:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXaI-00000003GFC-0K7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 01:01:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fkNP2593567
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 01:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/u9RhBo3JBBNTyMzBllN+ZTtf/E9vfpiyWfUGP0fBo=; b=YkdTYqXZoMXU3R/h
	dEbZ8WUDAWXiOYmRoeiismBDOWfoWvlEVi8g1LC+mGRMbhkmG57zV3mNR4MLobCF
	o4hdaTy2S0XIu6pyjYKajLIxALQ0ZkVGqEpr77jGEL87vTVZJM/uBzB55zMlS3+n
	TN0lDoQGhkqU+fouSwQsu4Xzd+tjRMBRt6tCdD1LkgprZMY6FPtOJ18ZzDr0uSwh
	SG/lxRTv549ImYyE51S9N8Ad14TNd08bhFSK7t7d3Ni5h9g6ofa6hyBZJ7PF1kB8
	mM+XUYihLGcjb3Yps3Ec1UbOkPnZVrlUfa/6dRH8TD8vMTitGifezXYh+iyAarQd
	bONhPQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuykjd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 01:01:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso280992a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 18:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776387683; x=1776992483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/u9RhBo3JBBNTyMzBllN+ZTtf/E9vfpiyWfUGP0fBo=;
        b=XWPp7A6jGkeAewomtdpFcHeUpOxZBdy/gD6+JsL1e8jddrsn8WyIgpr3rPhpkrNHEG
         6ctYdnNoLuELVMvvD3bxe+x+3M93YTM5RI9p9nxmg+/BmOx9/LryWA6gANncFyQ5wwMy
         Uy9dm1k2nRx81lDttKCq7bkewvXhKw0YCrucAHo/RvuYdym++486Fzf5m3WjWUJ5Uj6o
         nku2IkWTQUqVWaL/KbdBCKAagJnBnEwoE9qQznAIpM2f/zunhpGcJSg1Lv/4ua5j5gb+
         aqM6Ubnd5A+5kfKo1i5twax6gcClqqtn8fKiSauBMS7I/BoV+Nd+wcv8TSdwfnEf2poE
         6aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776387683; x=1776992483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/u9RhBo3JBBNTyMzBllN+ZTtf/E9vfpiyWfUGP0fBo=;
        b=Iw90R2FypxBSn8CYy27dKbdLL1mayMcOmQpa+enz8MyTswW5E3bU/THKSn4qvZ2PN8
         SX30iY2Xo1BcTFuVN9R7X0ad27dnhDc09BmwmsWliXsDuH2EC3eeq6P7SibWybFhvcbq
         XX0VCyycg5N/pRBrkW9ZtZ3XFJ4qBgmYA6NDfbM5Jql8HD+a7EoKj+tFkNu5b3ldjy+U
         ZGvgwEUvjgNXvUPgRtk/YdMGLuU8wMvK53Wd11FPtc/x+awxF4GQ5o6S1TNlyzMxN/E6
         jf7HU56QfF0zOKsUp3wd0+6cx7ANhcxv66Bp3Rlyg5+dvTmBWvTgZ0VHsRQ+HFNPn+IU
         V0cg==
X-Forwarded-Encrypted: i=1; AFNElJ+fLDjsvmAKwPVfY1aRBb5seh2Q9nsoSsLFSi1SsZ/bCRsPSmYiKQkNStIunEh5PByg418dn00RRHzniVybwa8K@lists.infradead.org
X-Gm-Message-State: AOJu0YwUr5XdrNFXihaKbyB/PnkhUacTFqc0R/gBS/WQ4OYW80I/jXVQ
	QDzgk9/bGWUk0mZMqwIUnvYr9bhTxMNd6fL9TKx8ZRAB3Y/FRB88Ptr3vYk9PukdJU4Vw7nG6XU
	LzE3Hpt37aO/dlPNp0i1rjbH5ecPZC4+E/YZrAJunvMvi7++pSBRs6eQsh4ZY8J4FTwWAaOiddH
	Cx1PxEcwv0ag==
X-Gm-Gg: AeBDievb4p+eszwxcrSU5FsdkcoQi2wMFt0qD1ETOxzeOdlTnvJI/tdB0g5s4sjGdk1
	fD84FForI4CGMWygCo8ZFsNMB8285kdBVxxnig60c9TenDWeQSQ7EFeOD7LACZMFply7LxhjRN2
	01yP0+VWW4F6koMKuO7aphIEv95dSkm+P+t0H6cVVJAFcnEWAOnb+loz1zym4Pm9ibdl0+3tZne
	bIejzZAu1sLDpmGRYQtyy/F4QXr2vbZavxxXoFfCelHZTDsV0KG/KR3OMtaQVPGb4td79zlR59O
	QTsRuySRQgk8/Xf+LgmlMSLIYnyMGOQZ6yxGqMHK7elNMTJbUqeI8vv2f/jvFKCTzsUhxvuCJFa
	Xf7wXQqhUOU1gtnkU4GV0vYNs4Nqx8T0l8+9zdWBIG6BVXzyxhW3LQFFspMJGMgHymoHe8x/6h1
	2ZL26gfrRHqctTC+6J6hPHoQ==
X-Received: by 2002:a05:6a20:9185:b0:398:9a90:65ae with SMTP id adf61e73a8af0-3a08d89ae6amr652305637.30.1776387682829;
        Thu, 16 Apr 2026 18:01:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:398:9a90:65ae with SMTP id adf61e73a8af0-3a08d89ae6amr652222637.30.1776387682230;
        Thu, 16 Apr 2026 18:01:22 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f4e8sm49890a12.1.2026.04.16.18.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 18:01:21 -0700 (PDT)
Message-ID: <e994bf83-a66c-453e-aee6-c15b6888499c@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 09:01:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
To: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
        mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260416165541.GN356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAwOCBTYWx0ZWRfX1qvVQ/pivpby
 aGXJg5gmpGRc1icMG4l1DsXmsc7HkjU9ZEZKQVRkZxkWTNnM/NxlhKWfV21OyFuItdqXj6qDZyr
 R3iWdQRunn0LKuIjf70RP3ff115GiUneXd4/9KCB1fTtrvr97GlIyqBH51UwjCsW1BnjKG6T/2C
 513jLCTpGTMGtg9dy5H27CJmI6egFywRgjn3mu6ljBGnXrCPCcHTc4kq6+cvy+h4hGildj0JU4m
 UAxo80MilbrI0lbV8r90cHI3NLUmqsS6apSI/zkepxtU/lVWx+sW7Y3sGkEBYORCUljHhUQ1mZG
 Ko61SNlMYUC5h1iTFTUqD5TDNwSCzJl/pyMI787Ou4l1GjAndxfKgEXxLAkdV2aXt0iNus51qAJ
 yC3Fb68Z5rVA/ksctH3IX/wLIFZcZOfB37vOQiXzpXSm8gaBZcKA+DqcjH2r/HZMtcFZKXJWICC
 aA68nd19GRspXU15YTg==
X-Proofpoint-ORIG-GUID: iN2NIsf5Uh2fF_oP42jApyKKhoIJO_Kr
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e18664 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=g7HzkWLkDZsDcvuO9ksA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: iN2NIsf5Uh2fF_oP42jApyKKhoIJO_Kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_180126_322400_30E78B88 
X-CRM114-Status: GOOD (  24.42  )
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



On 4/17/2026 12:55 AM, Leo Yan wrote:
> On Wed, Apr 15, 2026 at 05:55:22PM +0100, Yeoreum Yun wrote:
>> If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
>> the trace ID may be leaked because it is not released.
>>
>> To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
>> fails in cscfg_csdev_enable_active_config().
>>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index f55338a4989d..b199aebbdb60 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -920,8 +920,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>>   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>>   	if (cfg_hash) {
>>   		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>> -		if (ret)
>> +		if (ret) {
>> +			etm4_release_trace_id(drvdata);
>>   			return ret;
>> +		}
> 
> LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Just recording a bit thoughts.  As Suzuki mentioned, it would be better
> to allocate trace IDs within a session.  We might consider maintaining
> the trace ID map in the sink driver data, since the sink driver is
> unique within a session so it is a central place to allocate trace ID.
> 
> We should use paired way for allocation and release. For example:
> 
>    coresight_enable_sysfs()
>    {
>        ...
>        coresight_path_assign_trace_id(path);
> 
>    failed:
>        coresight_path_unassign_trace_id(path);
>    }
> 
>    coresight_disable_sysfs()
>    {
>        coresight_path_unassign_trace_id(path);
>    }
> 
> But this requires broader refactoring.  E.g., the STM driver currently
> allocates system trace IDs statically during probe, we might need to
> consolidate for all modules to use dynamic allocation.

Agree. That's making sense. Currently, the trace ID of some devices is 
allocated during probe, and never to be released. It's kind of waste of 
our trace ID resource if the device never to be enabled. But we still 
need support static trace ID allocation in parallel for the dummy 
sources and we should not break this logic in future refactor.

Thanks,
Jie

> 
> Thanks,
> Leo



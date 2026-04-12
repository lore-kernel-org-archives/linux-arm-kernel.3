Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A6FE937E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4augNhnZzxcDYuM5Vn2lflfqX3dlBBM5l0IVDhiLb4=; b=RFl0V4PWuon+PrBANa25uaW4cH
	VvFXBveyvpCOjPL+bM85uUpvZhEx5frzb5fKnOXLG6rtVhkow1BfpU9LHCCNHf1kmmIQQmL/vH6I0
	gVltK5x5SoshFCL7N01I+QEClyljxVWRtOtZu8lhYVKmQ2OIx4rGwfDpn7SE0PkXV5WrD3O9fiSUN
	hkt9THUDvjn6CN8Y4TFToPENypM3aXpgW9WofvyKv0Uv+ger3/hAQ7HwI/VZHjBxOkBYZYja4U3/A
	SAHEsaPtTeUFvIEEwLbq6h01Xv368u5Alt4P37CNfssHiGsXuyCJRt/OMOtHWGj48+QCoYOBfBF8q
	I71N0dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvjU-0000000ENkV-0kFd;
	Sun, 12 Apr 2026 14:24:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvjR-0000000ENiH-1FOe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:24:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4cW63829755
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4augNhnZzxcDYuM5Vn2lflfqX3dlBBM5l0IVDhiLb4=; b=oP2JmK7Sc2PQAiKm
	e4j9LBMtCoVEuUj+uGDVLq8giidOGWDTvz86HgRZcgJRJThMhJFMjU+65YIOO4Mi
	GCYBwHCeuiAAXdFEOyLl7senBicyukE66+oQra+aL4+yvRjbr5l/PamEPhbAEYoJ
	TPpVJgW9+xCjzJDTwY6NIk9O3OWvHC8qYD4BoTgB9dQ+r2vR3PhsVdDBV8gt8rxL
	RKaKaB902V+8G7bxrWlHhCBnUK57tP3TVsqHfHjMznGixk1nkMj7/eYg09IAyJnH
	8K5WNximrRwHaFFEWCDLbS3Pie9v/OYxIVPyv6WSh/ISsLud2MCD6zRj2jrzSbFj
	lPrnpQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew02f9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:24:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso1348776a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776003851; x=1776608651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4augNhnZzxcDYuM5Vn2lflfqX3dlBBM5l0IVDhiLb4=;
        b=f5J/zAATbiLA4IQDe19DONybJtzX6YxvqATnTdcc9YCMWPyqUifw4omaNUsTrqMKir
         JAXC8sHgzr0F4da3kSKxQ9QwxfG8mTVRZddKLWCAHvoyA5kAc0qAHL5yg+vIcbx8J3YY
         +wyMqHmfVth9Yse8ciA7Kh24eCP1XiLZht9ef8dD8OGYM9kzDgohNEcElfPNh6Uqlf2T
         JCiS58pnujlHWKeNOwEvFzdURzgToDbHHwE7eJcht8c9vLbb9WRJMSOWsRGsZysvFJXD
         Um8hrZZMQS7acGTqU1r/AZUIRh1E93R5i+1xXQOWpNGJZxUNGUF5jag8m4emsiGZ36ji
         l99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003851; x=1776608651;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4augNhnZzxcDYuM5Vn2lflfqX3dlBBM5l0IVDhiLb4=;
        b=PY1hmF5TShF2w1f9vXW/eYJIJMAum9DmwqMEEb5LlzbNq5/QS0MPWqCi+q686xobXV
         12jzoclBE5+t0fJlIfow5K7INK+QkcvIIo2zlzkDNxSqPDGRG6bjy2V2Dwg2PLSMD4RG
         363j4ptAI0bpr48BVUVnXs7pwvAxSxADkISQxuygnmce8wu8mL4hR8O9OatfXlk5Rrl5
         4QCPayjl/DmNNaQgMab6ffq8mZnItpmDuwsjfTVI1g29HUS5/41dzxgR3hjab9KnJQy2
         1LfspPqa2DPqXb8FR84jrNEGuBmRj3P8TzwvZZuFwB5lWVamlTYKkHo5EgwNyQ2musza
         /YLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOW5ArKz0Tbcmk2/vCkmSaZbhKVfC2BCSauT6pkDhd0bQn4O5lpSarqGYw7SIeTYlyouOwFGslFVc1MkZd3wfX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1f9M0SM9C9PPv7pEV7I9Px4ZsV4kmQRJjS0CEKvHajNq+SzWf
	YouJT3VMcL91cNXtbItDuEoPezRQ+Lm4fln9yr+DkG6wm6OOLG/km/DG+Ae6uRuM8pEhw4wfsEe
	cn5uGGuR7WJkVr8E43NcDwNx9HkswUGDz48TQQPf5xkj61Nh7ncf4C+w1uyTNgBOnE4er7KBIpf
	zw+w==
X-Gm-Gg: AeBDievDPJG+XwkDhsIpN1kaboiJBZsfz7E409NHfhypfrfcDo1FUzxUNvvRPS3xNZl
	6QkN+YIhasAJi7h/xcMyU7/J7w9YygrhpN4yOM4DNKNK65xmoNTUnVmIZV59n3QV0GR/Ga4ce4h
	Th5M5yP8dm82RNfdGoStbUX5TKgAgnwR9fVm2kZxnC9ps6zSRe68jAK/2P19JKXHN91RFealJTq
	+a5xWOXH0PrM+zl766ysk6SgmsNojGAnhIyLc/v8280pSd/R8yAiWKqm0pU0TRgZ0Eg/zNnt2dL
	2cQwPN88Bdjz75lDrqk66f2hlQG4D7ZmcTKDZEEEB4hU+IqoadBKrrjKFJecZm/XicFvH/LESW7
	MTGp1ny7Yf5GsLc8Ic+Ibe955ZaP0o+nSZQHsih0FOSjlZV7RrWmiHlatTm/vQcyWegd/148aDx
	1CPCkhVBOdiw==
X-Received: by 2002:a05:6a20:3956:b0:398:7d6e:27f1 with SMTP id adf61e73a8af0-39fe3c1a4c8mr10823452637.9.1776003851050;
        Sun, 12 Apr 2026 07:24:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:3956:b0:398:7d6e:27f1 with SMTP id adf61e73a8af0-39fe3c1a4c8mr10823419637.9.1776003850509;
        Sun, 12 Apr 2026 07:24:10 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216fff97sm7921214a12.7.2026.04.12.07.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:24:10 -0700 (PDT)
Message-ID: <67e15215-68ea-4941-9fc0-41348396b151@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 22:24:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] coresight: etm3x: introduce struct etm_caps
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-5-yeoreum.yun@arm.com>
 <4feaf157-4015-471e-accf-d588e2345c13@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4feaf157-4015-471e-accf-d588e2345c13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE0MSBTYWx0ZWRfX7RN+/qgJGvI+
 HHyvbeUZ3JaAXd+gF7Rml+lnq0iHEXOJPTf5nmxsj8bejNKj9GTb2szJbeVNIv321GcRGlbMHbk
 qlFoESMOZOfKsW5hTrYCSeASfcRuF6i/RiRrt1Qy9q+sC+qoa0f0NOkpIsFgTCTP+8kfMpCoSee
 dXqCS0KAa4jt1/2drNbjMuIZXiqKiDXtmBSwULJSC+aKJTv3MTbJz0NQG2UEJbdwE7YxVjFNRbF
 O1Xc4cINWAIn9wXeNia1/Le/8OY7cIE14B/PRfJmJoNyxHScBw1eV09VyJJozU1995i75C3VEhH
 njNg9v4yAGlYBDhn01HAshitolFaFvEIAELPxANX0zFZp4hlfev2ongAEZNfVYRgkT6/P8ewXXi
 jBrDEIm1hh/FRuCRIlNLjkx0OEpDcMgYfJxIViAujk3RAppZlEXD568usTMLUzPn8N8dS7wxJ4y
 harhpYoCfuqL5n7LxQA==
X-Proofpoint-GUID: go2FizI_vdST0yORiW02gc5n--oS9Si-
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dbab0c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=ELTZeuvpnPH4xIe2SG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: go2FizI_vdST0yORiW02gc5n--oS9Si-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_072413_547924_58084C54 
X-CRM114-Status: GOOD (  23.35  )
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



On 4/12/2026 10:21 PM, Jie Gan wrote:
> 
> 
> On 4/10/2026 3:43 PM, Yeoreum Yun wrote:
>> Introduce struct etm_caps to describe ETMv3 capabilities
>> and move capabilities information into it.
>>
>> Since drvdata->etmccr and drvdata->etmccer are used to check
>> whether it supports fifofull logic and timestamping,
>> remove etmccr and etmccer field from drvdata and add relevant fields
>> in etm_caps structure.
>>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm.h   | 40 +++++++++++--------
>>   .../coresight/coresight-etm3x-core.c          | 33 ++++++++-------
>>   .../coresight/coresight-etm3x-sysfs.c         | 14 ++++---
>>   3 files changed, 52 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/ 
>> hwtracing/coresight/coresight-etm.h
>> index 1d753cca2943..6fda26039db8 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm.h
>> @@ -140,6 +140,28 @@
>>                    ETM_ADD_COMP_0        |    \
>>                    ETM_EVENT_NOT_A)
>> +/**
>> + * struct etmv4_caps - specifics ETM capabilities
>> + * @port_size:    port size as reported by ETMCR bit 4-6 and 21.
>> + * @nr_addr_cmp:Number of pairs of address comparators as found in 
>> ETMCCR.
>> + * @nr_cntr:    Number of counters as found in ETMCCR bit 13-15.
>> + * @nr_ext_inp:    Number of external input as found in ETMCCR bit 
>> 17-19.
>> + * @nr_ext_out:    Number of external output as found in ETMCCR bit 
>> 20-22.
>> + * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR 
>> bit 24-25.
>> + * @fifofull: FIFOFULL logic is present.
>> + * @timestamp: Timestamping is implemented.
>> + */
>> +struct etm_caps {
>> +    int    port_size;
>> +    u8    nr_addr_cmp;
>> +    u8    nr_cntr;
>> +    u8    nr_ext_inp;
>> +    u8    nr_ext_out;
>> +    u8    nr_ctxid_cmp;
>> +    bool    fifofull : 1;
>> +    bool    timestamp : 1;
>> +};
>> +
>>   /**
>>    * struct etm_config - configuration information related to an ETM
>>    * @mode:    controls various modes supported by this ETM/PTM.
>> @@ -212,19 +234,12 @@ struct etm_config {
>>    * @csdev:    component vitals needed by the framework.
>>    * @spinlock:    only one at a time pls.
>>    * @cpu:    the cpu this component is affined to.
>> - * @port_size:    port size as reported by ETMCR bit 4-6 and 21.
>>    * @arch:    ETM/PTM version number.
>> + * @caps:    ETM capabilities.
>>    * @use_cpu14:    true if management registers need to be accessed 
>> via CP14.
>>    * @sticky_enable: true if ETM base configuration has been done.
>>    * @boot_enable:true if we should start tracing at boot time.
>>    * @os_unlock:    true if access to management registers is allowed.
>> - * @nr_addr_cmp:Number of pairs of address comparators as found in 
>> ETMCCR.
>> - * @nr_cntr:    Number of counters as found in ETMCCR bit 13-15.
>> - * @nr_ext_inp:    Number of external input as found in ETMCCR bit 
>> 17-19.
>> - * @nr_ext_out:    Number of external output as found in ETMCCR bit 
>> 20-22.
>> - * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR 
>> bit 24-25.
>> - * @etmccr:    value of register ETMCCR.
>> - * @etmccer:    value of register ETMCCER.
>>    * @traceid:    value of the current ID for this component.
>>    * @config:    structure holding configuration parameters.
>>    */
>> @@ -234,19 +249,12 @@ struct etm_drvdata {
>>       struct coresight_device        *csdev;
>>       spinlock_t            spinlock;
>>       int                cpu;
>> -    int                port_size;
>>       u8                arch;
>> +    struct etm_caps            caps;
>>       bool                use_cp14;
>>       bool                sticky_enable;
>>       bool                boot_enable;
>>       bool                os_unlock;
>> -    u8                nr_addr_cmp;
>> -    u8                nr_cntr;
>> -    u8                nr_ext_inp;
>> -    u8                nr_ext_out;
>> -    u8                nr_ctxid_cmp;
>> -    u32                etmccr;
>> -    u32                etmccer;
>>       u32                traceid;
>>       struct etm_config        config;
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index a547a6d2e0bd..b7e977defb1c 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -367,6 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>>   {
>>       int i, rc;
>>       u32 etmcr;
>> +    const struct etm_caps *caps = &drvdata->caps;
>>       struct etm_config *config = &drvdata->config;
>>       struct coresight_device *csdev = drvdata->csdev;
>> @@ -388,7 +389,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>>       etmcr = etm_readl(drvdata, ETMCR);
>>       /* Clear setting from a previous run if need be */
>>       etmcr &= ~ETM3X_SUPPORTED_OPTIONS;
>> -    etmcr |= drvdata->port_size;
>> +    etmcr |= caps->port_size;
>>       etmcr |= ETMCR_ETM_EN;
>>       etm_writel(drvdata, config->ctrl | etmcr, ETMCR);
>>       etm_writel(drvdata, config->trigger_event, ETMTRIGGER);
>> @@ -396,11 +397,11 @@ static int etm_enable_hw(struct etm_drvdata 
>> *drvdata)
>>       etm_writel(drvdata, config->enable_event, ETMTEEVR);
>>       etm_writel(drvdata, config->enable_ctrl1, ETMTECR1);
>>       etm_writel(drvdata, config->fifofull_level, ETMFFLR);
>> -    for (i = 0; i < drvdata->nr_addr_cmp; i++) {
>> +    for (i = 0; i < caps->nr_addr_cmp; i++) {
>>           etm_writel(drvdata, config->addr_val[i], ETMACVRn(i));
>>           etm_writel(drvdata, config->addr_acctype[i], ETMACTRn(i));
>>       }
>> -    for (i = 0; i < drvdata->nr_cntr; i++) {
>> +    for (i = 0; i < caps->nr_cntr; i++) {
>>           etm_writel(drvdata, config->cntr_rld_val[i], ETMCNTRLDVRn(i));
>>           etm_writel(drvdata, config->cntr_event[i], ETMCNTENRn(i));
>>           etm_writel(drvdata, config->cntr_rld_event[i],
>> @@ -414,9 +415,9 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>>       etm_writel(drvdata, config->seq_32_event, ETMSQ32EVR);
>>       etm_writel(drvdata, config->seq_13_event, ETMSQ13EVR);
>>       etm_writel(drvdata, config->seq_curr_state, ETMSQR);
>> -    for (i = 0; i < drvdata->nr_ext_out; i++)
>> +    for (i = 0; i < caps->nr_ext_out; i++)
>>           etm_writel(drvdata, ETM_DEFAULT_EVENT_VAL, ETMEXTOUTEVRn(i));
>> -    for (i = 0; i < drvdata->nr_ctxid_cmp; i++)
>> +    for (i = 0; i < caps->nr_ctxid_cmp; i++)
>>           etm_writel(drvdata, config->ctxid_pid[i], ETMCIDCVRn(i));
>>       etm_writel(drvdata, config->ctxid_mask, ETMCIDCMR);
>>       etm_writel(drvdata, config->sync_freq, ETMSYNCFR);
>> @@ -572,7 +573,7 @@ static void etm_disable_hw(struct etm_drvdata 
>> *drvdata)
>>       /* Read back sequencer and counters for post trace analysis */
>>       config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & 
>> ETM_SQR_MASK);
>> -    for (i = 0; i < drvdata->nr_cntr; i++)
>> +    for (i = 0; i < caps->nr_cntr; i++)
> 
> caps undeclared.
> 
> Thanks,
> Jie

Have comments below in previous message... ignore the mistake to end the 
message...

> 
>>           config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
>>       etm_set_pwrdwn(drvdata);
>> @@ -754,7 +755,9 @@ static void etm_init_arch_data(void *info)
>>   {
>>       u32 etmidr;
>>       u32 etmccr;
>> +    u32 etmccer;
>>       struct etm_drvdata *drvdata = info;
>> +    struct etm_caps *caps = &drvdata->caps;
>>       /* Make sure all registers are accessible */
>>       etm_os_unlock(drvdata);
>> @@ -779,16 +782,18 @@ static void etm_init_arch_data(void *info)
>>       /* Find all capabilities */
>>       etmidr = etm_readl(drvdata, ETMIDR);
>>       drvdata->arch = BMVAL(etmidr, 4, 11);
>> -    drvdata->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
>> +    caps->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
>> +
>> +    etmccer = etm_readl(drvdata, ETMCCER);
>> +    caps->timestamp = !!(drvdata->etmccer & ETMCCER_TIMESTAMP);
> 
> caps->timestamp = !!(etmccer & ETMCCER_TIMESTAMP);
> 
>> -    drvdata->etmccer = etm_readl(drvdata, ETMCCER);
>>       etmccr = etm_readl(drvdata, ETMCCR);
>> -    drvdata->etmccr = etmccr;
>> -    drvdata->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
>> -    drvdata->nr_cntr = BMVAL(etmccr, 13, 15);
>> -    drvdata->nr_ext_inp = BMVAL(etmccr, 17, 19);
>> -    drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
>> -    drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>> +    caps->fifofull = !!(drvdata->etmccr & ETMCCR_FIFOFULL);
> 
> caps->fifofull = !!(etmccr & ETMCCR_FIFOFULL);
> 
>> +    caps->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
>> +    caps->nr_cntr = BMVAL(etmccr, 13, 15);
>> +    caps->nr_ext_inp = BMVAL(etmccr, 17, 19);
>> +    caps->nr_ext_out = BMVAL(etmccr, 20, 22);
>> +    caps->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>>       coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
>>       etm_set_pwrdwn(drvdata);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/ 
>> drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> index 762109307b86..0d8dac29d055 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>> @@ -111,6 +111,7 @@ static ssize_t mode_store(struct device *dev,
>>       int ret;
>>       unsigned long val;
>>       struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    const struct etm_caps *caps = &drvdata->caps;
>>       struct etm_config *config = &drvdata->config;
>>       ret = kstrtoul(buf, 16, &val);
>> @@ -131,7 +132,7 @@ static ssize_t mode_store(struct device *dev,
>>           config->ctrl &= ~ETMCR_CYC_ACC;
>>       if (config->mode & ETM_MODE_STALL) {
>> -        if (!(drvdata->etmccr & ETMCCR_FIFOFULL)) {
>> +        if (!caps->fifofull) {
>>               dev_warn(dev, "stall mode not supported\n");
>>               ret = -EINVAL;
>>               goto err_unlock;
>> @@ -141,7 +142,7 @@ static ssize_t mode_store(struct device *dev,
>>           config->ctrl &= ~ETMCR_STALL_MODE;
>>       if (config->mode & ETM_MODE_TIMESTAMP) {
>> -        if (!(drvdata->etmccer & ETMCCER_TIMESTAMP)) {
>> +        if (!caps->timestamp) {
>>               dev_warn(dev, "timestamp not supported\n");
>>               ret = -EINVAL;
>>               goto err_unlock;
>> @@ -286,13 +287,14 @@ static ssize_t addr_idx_store(struct device *dev,
>>       int ret;
>>       unsigned long val;
>>       struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    const struct etm_caps *caps = &drvdata->caps;
>>       struct etm_config *config = &drvdata->config;
>>       ret = kstrtoul(buf, 16, &val);
>>       if (ret)
>>           return ret;
>> -    if (val >= drvdata->nr_addr_cmp)
>> +    if (val >= caps->nr_addr_cmp)
>>           return -EINVAL;
>>       /*
>> @@ -589,13 +591,14 @@ static ssize_t cntr_idx_store(struct device *dev,
>>       int ret;
>>       unsigned long val;
>>       struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    const struct etm_caps *caps = &drvdata->caps;
>>       struct etm_config *config = &drvdata->config;
>>       ret = kstrtoul(buf, 16, &val);
>>       if (ret)
>>           return ret;
>> -    if (val >= drvdata->nr_cntr)
>> +    if (val >= caps->nr_cntr)
>>           return -EINVAL;
>>       /*
>>        * Use spinlock to ensure index doesn't change while it gets
>> @@ -999,13 +1002,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
>>       int ret;
>>       unsigned long val;
>>       struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    const struct etm_caps *caps = &drvdata->caps;
>>       struct etm_config *config = &drvdata->config;
>>       ret = kstrtoul(buf, 16, &val);
>>       if (ret)
>>           return ret;
>> -    if (val >= drvdata->nr_ctxid_cmp)
>> +    if (val >= caps->nr_ctxid_cmp)
>>           return -EINVAL;
>>       /*
> 



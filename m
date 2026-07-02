Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B65C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=; b=Q6OgCakq8/OOi+Ykq1ZZwRGSUi
	f6Hhj8Mrb4bt7Tgmu3Mwu77xxnKr3wp2EG+3yN5BB8d6/wzdk7hk0dvsYT3X5ZV7byqVt1p2hrJud
	IJIVbgETXZdwARzxvj613qWKx6fHDgbIJpqGfd1QnryTwUuO3N4nwWZ+WGITbSKKD+0OY9aJR0vor
	PqdUk4AhXBcbUqx7SR4ojafQlSQHrl7kkd1IHyPn5v2oAxbJduHsgU0wYFcK7LEHAKn4rS9yadTqT
	1+PmZi3JRgOTwfBMmdhw+HSuFnxRRWUPqhVXtF5hD5eSsfqD5hEuCCOcrnc9B+Q38vbnPCT9jk5u0
	s65NnZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5lm-00000003JwL-00B0;
	Thu, 02 Jul 2026 00:59:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5lj-00000003Jvz-3G8o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:59:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Lht612468356
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 00:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=; b=JF4qzEFXU+yZIg8T
	/wqtw9aJGtGfaeaQKbaGfomaPrPefT+PcKuRvfCds5RVKim7r64NQ3zTjxCTQZze
	WynCW2jdv/jP44CMKHkTDc4UqYfcrEmpcBywB0AueE4wsWNA4vK+se4Gy6Dndo4g
	7caQpDzv28GbP80sC/YIjXQFFsRJUd8bLB0I6lLhkCcW8OfLqe72xRJFunsfkSH/
	D7cfMYD7EKVbRw6jtVdrTFCbYGmOttG1u9Q9etWBVPGjIbBTQ1eEyAVdWU3iy+LP
	q179ryI26lltqmqNy9aPcoeqdt7qDvjXA4A5iFX2aW2lrV63r1hwch0WAIpi65Td
	gfiqhw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tmc2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:59:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so1740819a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782953946; x=1783558746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=;
        b=iNjCdINlKyZyRWOozGtKJFAh3lRxKkrpFUb6hkxRO5ysXHf4b3Syq/dlOCWgw1wpp9
         gvx5jHVE+5n7lKPbscK/0RpSkcQ6Nmv+qpAFJavB0NNh5WPJ/zMZD6qkaQCVtI59puDe
         HrraWDtQ7aCzKnUzwfRRR+spnocqlRQu1ihHZlweRTW/QPXytwwnEkCRFWcMEH8msz7o
         09Xm5EmIEaxoCtY3MrdBoIVyrVTsjBvBmZYefIY5Uzx3oFt4BSgK2YaKDRfwx2OUGmKf
         Nc/4NWn2V9yFPU/2OVgwiW3hHoA309MUjtDA/L0fLLtRTNlKjmzSh04X7FxM5FpaTgQv
         6xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953946; x=1783558746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=;
        b=tKTitG67q0olQ8DHDTgrUXXG6R4Vev/umqw2a69tKlK1Q77ANggwVsza1OwH4Q4Jq9
         n0+HsFp90ve7BDTu88IJ+QvUQs7s3EWxmrHycG1WMgA9y5wc/pShFv9tgGiLvSRvJvJ6
         QQlPXcViRE/ddV1+Z5AXwOKnCuJwBr3h7MZ+nPTb56YBO6h6vFuUgCIGThJ2y5Ahr3pD
         y3UkxqDi3no/OwHJy6mYSz1lKW3kjyFsYkhvXFIg6+7DxMIruHm2NI9uu4cLnGyA4RzJ
         7xe+EvI1+YG7ZaV3DLX01v4+wHMePqPUQ3p17UtMKFBN0UGE9s/CwiHJiBckEMEP2Ey4
         laww==
X-Forwarded-Encrypted: i=1; AHgh+RrxFpwbCPen2Oe7jOBvPOtevhmWbnWj74NNUnC4mN/v+ZE1Sv+KLrRJ+5n0RzP5nHi09H1nf2rkPb484WImWlYc@lists.infradead.org
X-Gm-Message-State: AOJu0YyLVGMx8CEQ01bPdydy9AIs3Pgqdadxe4Jp2SwLxXiySIBtFGVp
	hxGGMKHi0L+SxGQogDZAU7UpldKDl49OP0ofqLp8eAZr2fM6sHNT9tC8OvxBlYEffSGOE7o0FPH
	oFhOkAT3zNc4RRZDBtHBfLgdHnp9OmiEc595RgB8GPHa+Y01CZWTtGhqEUw6IREi+gOBtAV94EC
	pjfg==
X-Gm-Gg: AfdE7cm2hJaaiwd1ujN68+osZ6zmdtdJ0Wlqsq29J46yOZmyHDKGCsdCUhWjiuii0je
	rtTiCljs80sp+VkoARYgokB+J/hoHThJumD5Wjj7Ku7EuKfgdm7QdfrgWkwM7KKpmyzNy7696CC
	lMpFkBfH40aNTanbPcWl+rR/Pt3umJNDGy8Ho7cz4c4RetUA0x3jaf/c0QjbwO5DLFaykqM8Wfz
	Wr/yez2Gm+nDwgsqeHooibkWp/wustoD/NgRB5TCx70MduyWDTuWS1g9cGz6oJnNXKInF7dveTs
	NnVZ12yb1AvalR6S/dLsFcqK+wxGfpJWRdvpd83rF+X8msKV/moLzZhBo/rGFm6bE6wwPx3bt1+
	OwJQdAd4QjA4Vt/qQRjqT0yJY0OSqhja11TbAtqv4OSHTanVk9dJEYp2p7ZTRubesC9u+Iun32/
	uC
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-380aa0ac3d4mr4195452a91.1.1782953945637;
        Wed, 01 Jul 2026 17:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-380aa0ac3d4mr4195422a91.1.1782953945182;
        Wed, 01 Jul 2026 17:59:05 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15e6e33sm86819a91.5.2026.07.01.17.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:59:04 -0700 (PDT)
Message-ID: <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260701162321.GG1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NhpHL5xtopU3u980oVzTYncflpLoaea1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAwNyBTYWx0ZWRfX2WSzVfNM8Fh7
 v8qygiQ13XypUlhEFh9wwmmA3mrbDjhutIM12Jv9HNwgHz9PureazrHRHAeIaXph5j/YxfEVXRM
 ofBYqnmBxthzxbp49Dqr+vK5bOR2Xsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAwNyBTYWx0ZWRfX8oNchWXa+ogq
 6zcqsSpd4nB8oeBmNd+v4v8ftSSQY+WAL4HvHotVAW0MGHL18k9xDbgJBd/A0WKu6tGrsmmnZxv
 1cONE9iQefVNSoUznD64vt6F20NfpKCry/WfGODIN11G+DcN07ALa7hfaOi/+VADglIPea71vzd
 DqCOA9qn7+TqadlUZg+a+5CctnEZu1KYp/NOs63zn8nBmP15KqrpXPbUVGO392cwcTs5KvMWGNZ
 xILPn7821sovkwoGlcEz3ucNb+rto+ExAqqmtTMf0c8kzcLLt7tsdmuSP5saO0XTRxe9TuWDE26
 uTOuyvDb3JYgCe602rignz+4yoUv3rIVcgisDGZ+F6+2FOCBjOw3VTVEuM7NQLJyoCmJGkeRU2w
 q7K20HEWBgeqGoo1KcCVqKGzYZVM7RkaS6cd5OwUNuqc6nXpTPDkKPGzKUeVKCHut1D1pFf4zab
 DCXsyy+d82F21sWj5zQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a45b7da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=2XoT9cGsJh1acgpUKzsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NhpHL5xtopU3u980oVzTYncflpLoaea1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_175907_939435_A857B4A0 
X-CRM114-Status: GOOD (  29.08  )
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

Hi Leo,

On 7/2/2026 12:23 AM, Leo Yan wrote:
> On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:
> 
>> After probe, pm_runtime_put() allows the device to suspend and the
>> runtime suspend callback disables the same clocks. During remove the
>> device is left runtime suspended, so pm_runtime_disable() freezes it
>> with the clocks already disabled. The devm cleanup that runs afterwards
>> calls clk_disable_unprepare() a second time, underflowing the clock
>> enable refcount.
> 
> Thanks for fixing the issue.
> 
> The problem is that if the device has already been runtime suspended and
> its clock has been disabled, afterwards when remove the device, the devm
> cleanup disables the clock again, resulting in clock count underflow.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
>> index 0abc11f0690c..4c5b94640e6a 100644
>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
>>   		return;
>>   
>>   	funnel_remove(&pdev->dev);
>> +	pm_runtime_get_sync(&pdev->dev);
>>   	pm_runtime_disable(&pdev->dev);
> 
> Let's use the funnel driver for the discussion. Once we agree on the
> approach, we can apply the same change to the other CoreSight platform
> drivers.
> 
> How about the following teardown?
> 
>   static void funnel_platform_remove(struct platform_device *pdev)
>   {
>          struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +       int ret;
> 
>          if (WARN_ON(!drvdata))
>                  return;
> 
> +       ret = pm_runtime_get_sync(&pdev->dev);
> +       if (ret < 0)
> +               dev_warn(&pdev->dev, "failed to resume before remove: %d\n", ret);
> +
>          funnel_remove(&pdev->dev);
> +
>          pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
>   }

This proposal looks good to me. I forgot to add pm_runtime_put_noidle to 
drop the useless reference which created by pm_runtime_get_sync.

Thanks,
Jie

> 
> The idea is to first resume the device with pm_runtime_get_sync(), then
> perform the remove (which is safe if they need to access or clean up
> hardware state), and finally clean up the runtime PM states. I mainly
> referred to drivers/iio/adc/stm32-adc.c.
> 
> Thanks,
> Leo



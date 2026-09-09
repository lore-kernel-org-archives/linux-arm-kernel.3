Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE15EC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=; b=zOTWLT1sitQHm/gWCH+1B4AvpR
	PVAAjQgpEEbkKvQ0v5HJYwK002L2pjnCAJZW0DLCpLlhH1yhW747kob9NypjfEG37IGuls+nWyF1y
	u2cE9k8ICEmIUeuxFQ9tNDs9fp6N/NfUyS2KhShwgFbXCpA2YoqkneQLopqhXrR8ZpThKMabF5YyP
	pwpyHeqUw7ej5/YFAFvsh4b7BmLOWlZY/HuVYqJmLBYPwApM6izfwyAqCesRjMQoUsaW8dOFhCU4+
	ROiv13UQJcoaywcl/l6tpeuBZwEKuMFT+DtUY+S/uyTL0nZ7UN4xiPMWQU/Q7ZStqJO29aH6BFnM2
	iMkaXJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HPt-0000000BfIw-2EAK;
	Wed, 09 Sep 2026 12:28:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HPq-0000000BfHS-0j0W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:28:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1ak1722978
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 12:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=; b=inJhSTBEUkY1zVDm
	AflTwEiXrUlrlDONiLUPimYJTsY6te/FjpSTIl1et4br2T0DraEhm1zohNUEF/Z5
	8ZbmUMAENjxTS6b/1j/i2jWU9tIzx8qpDW4DI59cIJ6LoEiUkX1xcAQfMvFjDAfS
	zATn7VVlq97adXpOKn/YyjmKM/jfNDRB7a1yU5ExqsLn644QZEJUj9b7qiSEcgP2
	b1TXsHnjx2RhYcyy4QBkilZUOZ0n7Xr7Ze+YssV7vr3M2QkCokFKOB6cqSoe3w+m
	piO82ZnxB8YEFJ3Y/mpNq5ksGw3u40B/JjskGZwXV6yrcSbU7TE766dV9c3Qrp7b
	71awIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrh5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:28:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so7296528a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956915; x=1789561715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=;
        b=hr8rV35isVJ8G3AmFhpIYyAk/7dQ5ZSq6jB/ccXm3ICjundiB246AT7Km2BagUImNm
         pjoKe873jI2ubzcbSWqsgpUNhO9BK4gRMaaF+1X7rQo9erIU0hEdUrs2idQEgDqbaZo3
         W2JLMcM/uf5rVE6c3+OxgmE7q2EuJA9PATtQcT7HRz7QQvVLp7cm225F/HIvsVflf+cP
         0jIuAv/cYKatM3TssD+cvhmZpYWt/NrUZI537vlwyLC6gUw/aixcNbWasK5xAwE9LCBh
         nKSs9Ln2nzVxecDlmIj4BCDmk28956tBXpKdIDv0AISvNMgPFWTh3X6yIesdpgMLn+1b
         fCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956915; x=1789561715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=;
        b=Ad1vw0O8FKJbkdxBuSNcZlDFiQ3lQwj/aZ2g7TNfhXxf3S+DH7bmvhjiiickPagpDr
         ri8h+BpK9cUngElENZj+bnaVSRYCwNmTTBPWFIGmhOLBwI9PggN9zyXkZnKk3/H5ymek
         qKZd3R/6bScYTl+sGfEuNeujspMYj7z26VW74K5jqHeQbe/h6KQ9miAdULSzc7Fn39C6
         YgLJJwqXZLGFflSa6ZlZdWUx6NjvbeAwq4ST34I0oJ3JBhZJSDHNRDlKpjITnslpmxPA
         XpLlB59hEfOWoPiQo2OHLTk/nQ6QxRVcjVfhjkajfNARzSKrdFeKMkkrpxN+1d8CGXtn
         Lqkg==
X-Forwarded-Encrypted: i=1; AKwUvByBA3uAt7ZkWhEbdOuLUCbkRJUKRRCwSfyaAOj8nRamwLd/WwbP1MvvYjhovtaFpiilgbOSitg4q8mPodec2Snl@lists.infradead.org
X-Gm-Message-State: AFuF++mjSqitH48TPo2GG29mCZpqcXZRqQb+F86xSAutXPjo20KBhygi
	2D3vSJXYszBbNGk2ffcszcDIqQ4V8rAvfUd9tdlZnpZYZzSi0rH/nkyT6XJY4r4QP/iiG56GiIz
	KySX13fcwEwmYF/mZ/FX7sZRkDEbwgndHqURfR2B6ce8YUw8+UG7D25xwEisKGTHxSioRMzom4/
	t8Cg==
X-Gm-Gg: AYBFou3XuLFySgD+SLAHmwOsxpYnJGKydaR5QNEqKNMgGHpchRro94jDFUj80WZNzkI
	8FyrG8caJx5IoX2m7u+USX+YvETAdDR8UtGVNLVXMkTPSNCWbSi+dIOrpHh9k7aD69N3Fncbvsp
	PbaVTFpe6TORgU5sPikeWnqrEVhuDOhnOTYog2cZQgnw9SUVwdTpJumFd1DyDx2jun9AUUMj/iq
	7X39QQWj5f4s/GQE6g5/HoA+CngxuuRMWDRNz/om33lu1n/T1zlFcMhIYaFWFsCGHpBKvjAY1mZ
	kIkb9FHKias5SasUoTXAGRNxJuMzE2mhSb36vHPQ9/YduJ4uaaplscm84m3JMcDpTmsHmpFGhJP
	Q4dOx5mAZNo0aV+JzAVZ9LrJTr946NX1spy0l0pTzfVHUElnr/2Or8w==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr48492417a91.3.1788956915185;
        Wed, 09 Sep 2026 05:28:35 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr48492376a91.3.1788956914697;
        Wed, 09 Sep 2026 05:28:34 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm32612857a91.15.2026.09.09.05.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:28:34 -0700 (PDT)
Message-ID: <627b88c8-4b36-40c6-b6f4-4ef291d985e9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 20:28:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix clock refcount imbalance on platform probe
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
 <20260909092817.GC200420@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260909092817.GC200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q10VMznvKyGq4E5u6BqGBA0HDZ3r1TaM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXzLaVlTsOHnlr
 XTLpG+679ncDD8rfYp0+C6MisguBttejfYT97Uj6eCwA4fKJcwPJxlpTS8+D6EvtPshA9bLzeX5
 x1Z8ZiZh4lSL38Uh7kpTeBhUqYRJ6sw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXyUGau9IrSGez
 rtKBfQ/3k4MF2cROxhW1ezIt98G+PFjjfXGoBu+Q9P7DWF0aA7xzKqjJWQ/9BNJA1Gomk+E0HHd
 GCxd/5+xfFpPSZVQA3aVdTLJt8RzV2jWKz0EBxABhU/fAM8gFHu4/bxyj74d8F1jFvqSMmOAInf
 7Y+aGNnGIiUobHvPBtsE8iHPha2PJjnPHU4ErMRDKk/MiOE1jfA0RPiRatWpun+R8ooD8utrdjr
 K98GOSbA429Ge5Ynupt9AVmQmU4rAfahf1fitr6WvjiF2OtFaxTStduMj1llH2FbklycSYnNMtJ
 Rh1dV81jvViZ9MQ/GS3SHUWl1kY2dqKdB+UJoKbDITw/j9Ugnlogx1v9N6vboPpXurD+zdpzSC6
 vkHFg1FxNTy/K5JsCxekLVvK0x6sIHyd1teRugrpqFfJrKCCkzddZORZUAUeQgCsWvKu5t9TQx0
 yR208v02Fk4+qh0I1fg==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa150f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=LRGHgEY_j3VPEFJSYgMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: q10VMznvKyGq4E5u6BqGBA0HDZ3r1TaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_052838_353739_6ED7E762 
X-CRM114-Status: GOOD (  26.26  )
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



On 9/9/2026 5:28 PM, Leo Yan wrote:
Hi Leo,

> Hi Jie,
> 
> Thanks for fixing! It is shame that my single patch caused issues both
> in driver's probe and remove - I have to admit that I don't understand
> runtime PM's state machine.
> 
> TBC, this patch only fixes probe. The driver's remove is fixed in:
> https://lore.kernel.org/linux-arm-kernel/20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com/
> 
> The series above and this patch should be picked up together so can
> have complete fix.
> 
>> The probe wrapper then unconditionally calls pm_runtime_put()
>> regardless of whether the inner probe succeeded, so on failure this
>> also fires runtime_suspend() and disables the same clocks a first
>> time.
> 
> pm_runtime_put() can be used for success case, but for the failure
> case, we should disable the runtime PM but not release reference:
> https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-device-probing-and-removal
> 
>> @@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
>>   	pm_runtime_enable(&pdev->dev);
>>   
>>   	ret = __catu_probe(&pdev->dev, res);
>> -	pm_runtime_put(&pdev->dev);
>> -	if (ret)
>> +	if (ret) {
>> +		pm_runtime_put_noidle(&pdev->dev);
>>   		pm_runtime_disable(&pdev->dev);
> 
> Nitpick: please reverse the sequence between pm_runtime_put_noidle()
> and pm_runtime_disable(). As we need to first disable runtime PM for
> the device, then release usage reference.
> 
> Since the driver core will reset device's active state, AI told me that
> calling pm_runtime_set_suspended() is redundant. It is still good to
> explicitly call it for bookkeeping. This can be aligned with the change
> in driver remove.
> 
> Thus, please update the flow:
> 
>          pm_runtime_disable(&pdev->dev);
>          pm_runtime_set_suspended(dev);
>          pm_runtime_put_noidle(&pdev->dev);
> 
> With the update:

will update the flow in next version.
Thanks for reviewing.

Jie

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>



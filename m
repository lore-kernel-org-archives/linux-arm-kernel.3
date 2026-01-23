Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E7FD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=; b=CSmWvFqJ0LZfLch7jPbNEBjzwa
	/N6yAserWy8aS737yD/nLMCz08iZgq1IbJtGAJmIpSNyBzp8ssnxdP9shc4vWme3NZkWszOROEcw0
	sesTco0P/bEMID8ctN3I6OrquuMM86VmENcRwYY98mW0P3XfyrNvP7IK6qDjjkt3cDk8Yg2v2mTA3
	cq1kOv5A7yUdLU+ZVeAKDIBI1IGLE1LR1D12dhQWBJGYSKNawMJR0Z2AOU1daIrjD4/ZYQlNkO/tC
	URotIwGo8UAWtkPoo7OJp8q0dcl/GbIktFvsDu0/dNowcKIh2oxL7WbyWdhTYrZD7BoIz2DLEvHiZ
	Q0MA8EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5xz-00000007xpp-2oFU;
	Fri, 23 Jan 2026 01:28:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5xw-00000007xpH-264A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:28:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7qH14135764
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=; b=TkPKQxZKY18/K1T6
	/glZzMFAAMzoQdwb94/IWwrZ9r36Z8AP7PuT13/n0NAt9LDji+3JGPSXfgwALrr1
	dXAqlGFWFng6pMbzO3TCmdBP6kr0PnJSd3pr3+nmxSpbLC8ihb/xhEH58ZNZi8qG
	WSuB/huyQoJXUmOq9IN4vISWnSJmGzIaIoB8AYMdrDba+CytYbR42KjFpp+G8bVV
	4WcHF+qcIbpUd2daKtU6KjisqSwGK7uzStIGkrqU82b1O2hIL5tQpmIr6aykvr+O
	QJaqdiaebxb7TKffJiwQtZTl3tayvxOKbPoc37y9JGN+dqE1R73hRYZn3QCXYQFi
	KhIWvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2jmks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:27:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so1498311a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 17:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769131667; x=1769736467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=;
        b=DquSdot3tx0fW8Op97j/ql6BDtlafIemPT6PVzN/IZfok80XTUHEcQUfpi12D4DXtx
         /zXP7oJpdbl2gsS5IO9c0+5OCckjBrBNNETb0zwPLDs0ZAQZ6mntAMlUXs3pdxtuvNiy
         9d48McuO7hViKDEURexmPQhibcwXRJindP85K9IapgoYOuhaRNEiOKeRU21XNM845ZWU
         5IFwi9RX/BHt0riQUi6zFBwrzhZjTX6UTRbGYsOx542ZXvERP4e0385jULJgZ9gWWmjk
         DvjIewrKyzAeaSWKvv9tMVdYkrbUCB1xsRmzWk8tZw1E0iCOoKH9dkUDmOueYtab2gGs
         sweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769131667; x=1769736467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=;
        b=LFa0oeKA7VXN4ea3oYSLtoLiZ6pbsdx1YZ4WSysPze8w33rhnx4e0xXxOUz/ualeFX
         xZHP7dbFw538lyGZDT//ao2mBCdsrBMAykM/4j46iKRDHRozXz7AQsCPSW6pPG6t/G7T
         AhC6i1kN45kmwWkboKFyHerwpey9/AoU/p1sxEq7+/sw7FAPQYtpgVGCw1gR1H9pZz3f
         Fd3j488q0rK+vYdXJr//ckYQL9eKBHhpsqj+4vL0QrqamG1DtGZjWCbkQ47v7QMQuXQ5
         B49e0qq4vHTClRVdZzuEfQ3Hp7BnVca88YBCBPQCQKakQ2h/j/GmddB65RmkiJt6DrYO
         D9iA==
X-Forwarded-Encrypted: i=1; AJvYcCX0l0Hfaett+5ufdE4sH3b550h+Al+L1npia8po36kH0ElNjcwMBKnvXLtNWYZkOu1vnbmcAfzG1jPI30ED2yTI@lists.infradead.org
X-Gm-Message-State: AOJu0YxuGSoS8sPTxdgB/sn9uy6J2QignUmWsHyLe+fw1dFMM3S2GbwY
	SWZUwX4WlEaoN7/rLKC03KrA81TySWQa1s8U6YOyV0FodrRI2j4/IhXTfT3OpBLchfxNEjxPlNo
	IOYD6RaB1mdnRsVLIcMk/h+11E5juUHBJvyOGsBhGZ8kc2LGbnrng01/LNL87ArOqFM15oiQVm3
	dzEg==
X-Gm-Gg: AZuq6aK6qbFTVnJyvmnzcgZhai7JYFyngRDgmr+04e1wPOGtE6nhbbzyU+4B2pnUr7S
	Qypynq3i6yVuBlxdz828K1yxz9ZZO+vZdSNHsNajblCKVSp4fI0zQB+SYCi5tR5WYfz7iHCGbpl
	e+MLfesedGi3zMj4mEcyoplsmXiOG2dDkVA8cXljXZ/I8+v4euoICQ8embSsfSRqRKfjUUqZBuE
	6hpxWDuFcOC/NdWqZAhcMP5guinLF5RYT19Dg5zmfOrfJ8EejPC9T61NdUI0H/UC9QNGu3En71M
	PnakjeS2ERF3qALaerI0JoNTCmk98abDF6OnS1ilwdinoX24NCdEjvX5D2tp38BaZhX8gJhaOxw
	PJFn/AnphNmPAZx0PE6vn0JPQ5Q9ckgKScnjiZkIeM/lJ3NQx+00gEIxgg0thz93x/uuGNYIkt8
	M=
X-Received: by 2002:a17:90b:224b:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-35368b44712mr1380899a91.26.1769131666706;
        Thu, 22 Jan 2026 17:27:46 -0800 (PST)
X-Received: by 2002:a17:90b:224b:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-35368b44712mr1380868a91.26.1769131666182;
        Thu, 22 Jan 2026 17:27:46 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353355e1161sm3480323a91.17.2026.01.22.17.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 17:27:45 -0800 (PST)
Message-ID: <d032a4cd-235c-437b-852e-998db8635056@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:27:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
 <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HlrlJ1zkfAEkuATNWkUGt05VkSQWOoZc
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=6972ce99 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fsjGGd5fPUumY84vGlEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAwNyBTYWx0ZWRfX0fFXedWw6yFn
 fvU/SexcPKAzyzpBBFru0sqMtUM4eLjxknAmDfsuZC3SfXjYOCpg87C27r/4yas0vGK+rdvX82K
 +KvFMZTAgRgLvNCfp6oGZmiCHitULjteSUM+LLqPAw8+KIkCLkYFj/4LepWDqACM29Si4ZthQXb
 TaN2ouzW/OiKvKPq56Yz4kphwDxmcLpqae2napgOaavfOlAFU+hv9ZednoOb60UOXeOIUDIWsjA
 qDK7p9SVinPuSLd720JuEQBb4yPgylSRO+TfFa6rXzsbgYSbZIuWW3wp+/U+DJukbJGv6qI5UM7
 MEo7uUHP3EGfcqkfOTTs7bKH1CVjNiacd5j8Psk9iMGAJK35PE5lnjEx9Lz9dNJBrMJTFR76lMt
 tbZRRrQZs09Z97XJgyZMgLTTvP7XZoW8CTaZ5AmBthtJ+b7rAxcZHt/tZDXYUpOx6iR+x1HvWHv
 yRxyaJ3uwXIEC1zksGw==
X-Proofpoint-GUID: HlrlJ1zkfAEkuATNWkUGt05VkSQWOoZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_172800_672944_6E9C9ADD 
X-CRM114-Status: GOOD (  22.86  )
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



On 1/22/2026 6:00 PM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 
>> +-----------------
>>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index c660cf8adb1c..0e8448784c62 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -585,6 +585,30 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_in_port: Find the input port number at @csdev where 
>> a @remote
>> + * device is connected to.
> 
> This doesn't match the code ?
> 
> We are looking at the remote devices' in_connections ?

csdev here is the coresight_device of the TMC_ETR. We would like to find 
the in-port number of the CTCU device(remote) which is connected to the 
TMC_ETR device(csdev).

The description is incorrect, and I will update it in next version:

Find the input port number at @remote where the @csdev device is 
connected to.

Thanks,
Jie

> 
>> + *
>> + * @csdev: csdev of the device.
>> + * @remote: csdev of the remote device which is connected to @csdev.
>> + *
>> + * Return: port number upon success or -EINVAL for fail.
>> + */
>> +int coresight_get_in_port(struct coresight_device *csdev,
>> +              struct coresight_device *remote)
>> +{
>> +    struct coresight_platform_data *pdata = remote->pdata;
>> +    int i;
>> +
>> +    for (i = 0; i < pdata->nr_inconns; ++i) {
>> +        if (pdata->in_conns[i]->src_dev == csdev)
>> +            return pdata->in_conns[i]->dest_port;
>> +    }
> 
> Suzuki
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D0CEDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kSshX4uGfYBdsUzyeF3oIoRRsOk5V44gKiKit90pj8=; b=QjXpzh175I0mwWQU6X4dKPPfMF
	ndg6SNuxk1njWbJbJniJ2WBLGtsubMWSkrfZO4CRM5mSwhpYQ1+qiKmdNMcRAelVmYWtUXkK5OjpB
	6bP1/2UwJAuqa6e5znqoZBnY0+CQ0N4hOeHLNeecQFCDXl6TGf5j5Z06M1cxKo9BxeK6jDWyfK9iS
	Aj93uUt3+RLxtPcpS51pph4XIIWBPMlT0z2CA1SibgVX9tNa56ecdCMrGjgM0aRjgf4/PwujOMOMl
	MZ7k27XGGslicMjxTJGNEpZyNPAnpCAEiJV7qqL6UXeltX38VN8LFUU2nQdAFXff0YQlatv5mBuOI
	jgaOmnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1sJ-00000006AGU-430x;
	Tue, 07 Apr 2026 08:33:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1sH-00000006AFi-20hU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:33:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Rumg2550324
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 08:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4kSshX4uGfYBdsUzyeF3oIoRRsOk5V44gKiKit90pj8=; b=ODmahafT0X8Kok4l
	JDDnqwm9Z1QwvJkxLoLupmOVTP1dHgHqiBuGvgoQACBZ8jpaJomVaHSEVaTjODzs
	UZIFCwBGypyGEmiGs19ibXI4OOuehJosL4IkYiQxCr4WrczUNB/rONrJ2EFeKNpL
	94mXiEVs05PunpoWP/mWVGCHtwAQVUfgE6RnLo5QwBJukFHjYGhQ7ILw4iUahVCF
	sy5S+pvRMvBancjo7G3ox1//5qS9Hy5Vp7adZdwzkUHpTPStUPszF5fMvnG4det/
	dc3ur7uUlK1CtHpjnVDlgfIviJZRKHYRjywmgayGdurQxmIRTJQnsWCSq6SFLJKk
	8j4s0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmre9ues-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 08:33:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so5327785a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775550808; x=1776155608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kSshX4uGfYBdsUzyeF3oIoRRsOk5V44gKiKit90pj8=;
        b=AQvyaOSvywkvCnpz72kxMdRh5YqQlXgEAS1l4467hxusnAVuTnSgmqo4znurE1UnAS
         7CpUJvWTp+wLLY96TJsU0Vtak6w264hsRf2Pf2UBwIQWjzWMSZX9X13osA/uLwMeEeMl
         r8He1cbTRVQSAEPrBHWq/Gr8Q1TCN4HLSNgx8whL1lUCddorJ1ayC+Y67OZ0m9qDzNtq
         R/GlVmbFPKy1Z6tRiZAnvGPmBZQxRpn4UyeoRHKRGToUHUvSsgdjzrw5uW/iPUQzMjMk
         FV+nAkQO+Gb5yIVV31lDI0YEY0DQeQM/EYQCiR7o7OvADL3yQPP2DftU7IuqpKiKgYMn
         HCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550808; x=1776155608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kSshX4uGfYBdsUzyeF3oIoRRsOk5V44gKiKit90pj8=;
        b=lyGOnaLKRX+pcrJunKbWND+B3S8+Q++cuUAwldSVkFSU/Re00T3H3nzS/JBQ1hJfvY
         +HSj35tp5JceUyz/jJ7t1Hq1ocqQtOl0TM+YvAB83mXGIpVoz7dKegEOWtp1iphaJW5A
         Bjc4cUPRCaji17Ow++IAONY5yHi6ab1boY2G8HaDLT4dSLI+Lhh7IgQ2F1gPPgYsrCa2
         FoKK6eFdP20fgBMsqNvkrW9Usw09sIRdvFVHB4uLbZkHylt7dBpxR9sTBsXiIyGbuGBK
         6gh5ZE13fvgzuhNcZbRaNSorX1dxPmhm3rgx0iuSPAPXMXAJsyl/NmE+HESCAKABSn47
         sMIw==
X-Forwarded-Encrypted: i=1; AJvYcCUzIiaqyRFfvB6bqIutv0PeLxyGJFPtYU3IUPdpTDFKIe40BOiONHhhT5oYPpQmAJCLr7Z+gfmd2m6twL3AGVk3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8uXBoq0ci44j6DYGex2SIR/7w39phw1aWEKhVsLIh5sqtU7GD
	38mJRQMNTMgUpbz2MDEAFZweWxqw+IC7y1N7U8jU7cd5Yn+YRf3j9315Zvr6PBUVC6E1w3BqB++
	+UsIe9LpS0DGPCeh22l4KSfT7i5hRUlwvZm8hGcOTezq5P9+486CZLZ/D5mBc7+hMXPrqyMgaOg
	2O2Q==
X-Gm-Gg: AeBDieu2N0S7Uw9buiiD1H/OTRsObKJQ1773Q094IivkWiUoFLSTpU7bhxjgMxj4LcK
	DyUz6c8JL9tT/yC5eghN/4Jgsf8ZOjH3etMo4mR74fdZKISaTpsMEGzR8JrPf8xV76TGQ2B9exq
	B+V1IAvqaRdYZONyR/tJnHqGRuM8t+C22Iwg8koYCuXcj5tPi5vfpzXqH6NeQBW/whkOFD3qEV5
	TY5M5mdJ6CB5D6bE4C7nwVo1UWDOsw2NwoAv4bFnd+UfFThB2p3zymOiQ7aw3WCwRlpRzsEgOGI
	ZSmfwtVWp/gbEiKpfx2kPek/Nh3Nz3eAK79MJTggh9BhFSOZ/k2wA6viBtLipoIlVtLFEoJ98Sq
	1YIkMNjgK6U7qdkau2qwLnZSChV/3zhX2dWBPwOZd7z4IFQ0M7wA0xyhhfWjuNx8xrWfuLxn1Dy
	eTcEhe6lPuJt0=
X-Received: by 2002:a05:6a20:7d8a:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-39f2f01de23mr16865065637.35.1775550807922;
        Tue, 07 Apr 2026 01:33:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d8a:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-39f2f01de23mr16865009637.35.1775550807264;
        Tue, 07 Apr 2026 01:33:27 -0700 (PDT)
Received: from [10.133.33.187] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657e703sm14677176a12.22.2026.04.07.01.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:33:26 -0700 (PDT)
Message-ID: <0a4911f4-168b-48c4-9554-3962d6e96efa@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 16:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: fix invalid MMIO access issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
 <20260407081048.GJ356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260407081048.GJ356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4c158 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zqWVOipMogyA4RGV3iUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9CbI_lNU7YlVbzrR97LXW80gh77g8dD3
X-Proofpoint-ORIG-GUID: 9CbI_lNU7YlVbzrR97LXW80gh77g8dD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA3OCBTYWx0ZWRfX4kkxdzOWOJem
 U34gvyfwnUAMOy2L+YY2wXnD6siGiXtVMW8YktR1DWcAY+67dS99jWNmSXerr4GYSYWBQYD2ssI
 fmcmoqXycYhtu13y2YtI6uyE7hAoL6XYURip/+MxJhpu1ja4/o4vsCFF42Ryfvvcs9UkGgndIRE
 NZqYzIfsrdrauLoNFmk24UYqmyFe+VEg6wlC5ToT1M6+BOoURJwJE420v8pvIgrnNAx1xcrGdPK
 tZCs38r8Dd4yFrAVAjvXBB7WwKzPmVoLSg9vHtnpNh+dV6oKR0A9XadB8UMzvKceJX7RtYXwPLm
 IMTCibSZ8A2jpZtUvG4ZmZBO4jmPM4MB3HcK+pmYZQKF+jMWN87RPGDGKCQYsdNuxaNB06C8jgj
 D1BGroU2IFOv/7M/c0244POZCsa3/wLrG4I4wak4Mq4qpvZhS20SIhRIHCu2PtxRFe0CaWvo+uf
 i0tc9WyCBf6H0HelxoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_013329_532816_F2A2D63A 
X-CRM114-Status: GOOD (  21.15  )
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


Hi Leo

On 4/7/2026 4:10 PM, Leo Yan wrote:
> On Tue, Apr 07, 2026 at 12:47:11PM +0800, Jie Gan wrote:
>> Create the csdev_access struct only when a valid MMIO resource is
>> available. In tpdm_probe(), base is uninitialized for static TPDM
>> instances that lack an MMIO resource, causing csdev_access to be
>> created with a garbage address and potentially leading to
>> unexpected issues.
> 
> This patch itself is fine for me.  However, I am wandering if this
> is sufficient.
> 
> As mentioned "potentially leading to unexpected issues", can I
> understand some code pieces access register with uninitialized base?
> If so, you would also explictly add coresight_is_static_tpdm() to
> prevent register access.
> 

Actually, we havent MMIO access for the static TPDM device, So no issues 
are observed. The commit message here may be misleading. do I need 
rephrase the commit message?

Thanks,
Jie

> Thanks,
> Leo
> 
>> Fixes: 14ae052f7947 ("coresight: tpdm: add static tpdm support")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
>> index 9b16f368a58b..eaf7210af648 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -1430,6 +1430,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>>   		if (ret)
>>   			return ret;
>>   
>> +		desc.access = CSDEV_ACCESS_IOMEM(base);
>>   		if (tpdm_has_dsb_dataset(drvdata))
>>   			of_property_read_u32(drvdata->dev->of_node,
>>   					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> @@ -1452,7 +1453,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>>   	desc.ops = &tpdm_cs_ops;
>>   	desc.pdata = dev->platform_data;
>>   	desc.dev = dev;
>> -	desc.access = CSDEV_ACCESS_IOMEM(base);
>>   	if (res)
>>   		desc.groups = tpdm_attr_grps;
>>   	else
>>
>> ---
>> base-commit: 816f193dd0d95246f208590924dd962b192def78
>> change-id: 20260407-fix-potential-issue-in-tpdm-b07b44416051
>>
>> Best regards,
>> -- 
>> Jie Gan <jie.gan@oss.qualcomm.com>
>>



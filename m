Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C8D0C856
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=; b=OTy5PE7JmUlIrmlH+5HLvgWsBo
	k8kdMD/1eKxeBNGhHRXmbz70Xzdc/WyXQJmGSyt+8pYNnrsW9GAqNOA0Aw4CRHe8JLykS+BNdid7F
	yqvqywwKAVyT64V30lcn9bXYFbWWuZ9IRBziFgyozPXrGYqw9VW/OlOZiyGQSTBHxc+6FQDjtQFVK
	/i+XPn4aM6zuyfaJXvfjJPu5gp7qFsERT9j8lVSth70SXVj2uRiA1s2PINtrn+fHd4+5r0W+0Y+tB
	daeQGmFZe9EtLBcBc2EeoRavKF3G7HcMAnEoXAdwA+149bfEBOuGVCYywD9Zss9bLdQRxFeMGkA1p
	7c3yRJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcQx-000000070Wa-05LF;
	Tue, 13 Jan 2026 11:19:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcQu-000000070W0-2JYd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:19:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aqYR3636928
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=; b=TTTjn3unAgUSm7uy
	I0La02DOGqycxFT+QDE9RDk+ZOE82En4EOGET+SmfDPYtOmRN3G9ooW0N6pB26I/
	Mq7JCKU0t7tiowAUxfe+vQozciLtQyaSLeQFIL9xDNNr8dcKCzHv/7ChZ0S7gdAr
	HBezKGRz3CDBlsD35+mNoPYMxEaJM7phz+lPzbiHoTgjmmArgLnnqvYGWxdworLU
	js5DdNQ0BSOP7o8NsKFtu57Dd66VLeTJzIrvF6JgEJ4B1j7FIJB/SeSmmhVlvmKs
	bgTYyxkC1uBQHZ7cYIn3FqErO76eb/XxlHiZP0PvQcpA6tJA3HcMkCGUPHGWP3f9
	B8KfBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c130d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:19:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so39369341cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303171; x=1768907971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=;
        b=YWiHuaerLKMlgav6b+YcIyZolOUC4EIi7UilGFU+N2dOsKPT1Da1aSbeQ5Bo6OVeC5
         DNmXVykJAND6xrPuqxlMlM8kVS0Unp84wPG7DBgB6tr06GL2FZ9dGkoPj89z57sXhTPy
         BzrpFCzLt8fRiyA7lGHnQgPwXpG9omi+azHjYsbRjZ34UL1hdSw3xhCHoLR+Kh28UDLs
         trm7UFR3+6dlVFWI9JepF2v6pmUr4kwOh6QTRkRexRg+KF6ZnSk+DFf5Xyd9AfZzY30l
         1yEo1VnQh4U26WvHRy4v0UnRJ4mlJedLWdq5NMo9lmRi56dAGu6YXMbxLssM2wcUAVeF
         yMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303171; x=1768907971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=;
        b=FkoHx5ZAEkjPT331z2KBYpbHFsCmAm0Yd/2zU1zAt+8LiZAt3i1/QFWSPD+T1lBhLd
         icvLEbwcSyCtMrrj8pQZjaOx49bYWvrloT3U9IK+dbIA/v/1AdE2ZGXOG27CwI9TTu5V
         HhiA14g6GwT5SiUPdFirMCJTL8QK88Fr7W5oFlEIDzMhYACOTK69vuM35V6EBUIjKNKp
         iUx6Nz/s/GStNMuAgsMQjXUoY3oGTkoom0wiWDhiQ8HcXgpLzWSirMYp1Ix38yJnaZ9p
         4OHjYKwj0rf0UAdFwxVP4EwaEPOGepyGagXQubTnKSmHtUd6EnJwGdukEJTv6p6EBD1y
         PW7A==
X-Forwarded-Encrypted: i=1; AJvYcCVdk9MZZBAaofhA1kaPUu8jT36/TVyXfe4pj+opoqRluxrl5xsM92IFEbqyajjUq4FjpBwX9F/pFPzdAL8x3wKc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvr9m0rZ/Dge51wpCOI2Md/+Mh+/XWsaIf3obzQl5f6PxGB2f/
	X1o+Lx9O+82b41MOzTdXla6qs5FsGVPIFoodrbXfmQ09ImsaOmYmBPr1GfQiSMOXyA7qHGelU2e
	o9Sf9Z0bQnHEAMuAQ6bNzuMQj2AJsv4nAOFqEiCxZckRJg4xT8/i0RsJaKfmcFhsFvn35OcZwI6
	2aeQ==
X-Gm-Gg: AY/fxX5QJJJdftOzawF1oEjmN1RSLNFxc1qUxPY65GCbpgfRJARhSuNWaLKUYrtxL/E
	sIUEUo0XqEVwQCy+LM+nnZeUX/tfaCxogfa0PSHFoe5CRVYkDIaYKRzWyc+S/Uz9sr2UA3Z7Sla
	YO3UmDn3C59wzLOnpWVNg1NDxj8WOjPBA9kUliloxyr4nA3M4eVtS3TqzjVVIkxGw6da2RojCR1
	PqDSr6sYIHtFMFPP9kB7qPHbMWM3drDDJKLPrlqJJfu7C5nk037m6v/VW7OfmCUit1MXuiPRpYb
	kf+dha9ghKzeDgn4iROhCLpJSsUjfBKYedvUnwfDAqVcXALEXdcCwVtTgLy7aX7udJByPXbYHQK
	8zoqgr5wYpQq/O4XQEHDGlvtSMXjY+EQdZF3cHyEkr5RWNYsi+0AwG+zMg9jvFj/lEIc=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr227003721cf.1.1768303170822;
        Tue, 13 Jan 2026 03:19:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBaIEoMj8LfHl/NgkrhjmaWz8P4907NXHKNWZFwZcaH7zOvWKqQ1r+uQU7MEguvL/cQrN4zA==
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr227003491cf.1.1768303170411;
        Tue, 13 Jan 2026 03:19:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d44bfsm20060625a12.8.2026.01.13.03.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:19:29 -0800 (PST)
Message-ID: <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX3ZkpoFJxs10Q
 fOl3xnibKO+gclAJTRbo1AIBPm7kS7UNWriNOTX5qw+bGs2vmHjnzUpLPkAipvLmGH6ThEVL1am
 9w02QdA0zg8jJ4+rHQlGOCRx/eCTAqaAfB2EW7Qc9HTmhyU3rOHDTGjgO087+cltuSXuoKwg2i+
 cRfBHC+ITA9GHu4foCiEJGMR2Kq5gsMriNdOD46Mke+ji2ukCZoLxU3zY5oZG5Fiu731FgeHEr7
 tAxtfJusV8dWVdtHBGW9BQC9ECT3cEQc9lqqGUOAyTeSWq3wBEI61fy/LV5GecsiLRC9igSfHh7
 iY21ZLBDSxm4GH9Y9uZUlcdoBz85/ynX41/OZBaJvAMND//qRrEZyIwIOiX2OHchZull5l9ESdJ
 u3wko/WuNmXNuuxzG1GrckdsQHaBzHlQj9G8mban3PaikqoR1tKv0tbhbf8IaFXckBDY8h6ffrq
 JIdyR6HWpghRHzGs5kw==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69662a43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CsthYWZRQT8_EciR9E4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6v0sWWj4zjTZ7fuCpxAz1WH_qUJe5y-_
X-Proofpoint-ORIG-GUID: 6v0sWWj4zjTZ7fuCpxAz1WH_qUJe5y-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_031932_635677_81867217 
X-CRM114-Status: GOOD (  20.64  )
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

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
> +{
> +	int num_timers, num_counters;
> +	u32 devid2;
> +
> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
> +
> +	if (TGU_DEVID2_TIMER0(devid2) && TGU_DEVID2_TIMER1(devid2))
> +		num_timers = 2;
> +	else if (TGU_DEVID2_TIMER0(devid2) || TGU_DEVID2_TIMER1(devid2))
> +		num_timers = 1;
> +	else
> +		num_timers = 0;
> +
> +	if (TGU_DEVID2_COUNTER0(devid2) && TGU_DEVID2_COUNTER1(devid2))
> +		num_counters = 2;
> +	else if (TGU_DEVID2_COUNTER0(devid2) || TGU_DEVID2_COUNTER1(devid2))
> +		num_counters = 1;
> +	else
> +		num_counters = 0;
> +
> +	drvdata->max_timer = num_timers;
> +	drvdata->max_counter = num_counters;

int num_timers = 0, num_counters = 0

if (TGU_DEVID2_TIMER0(devid2))
	num_timers++

if (TGU_DEVID2_TIMER1(devid2))
	num_timers++

etc.

unless you want to guard against a case where TIMER0 reports as absent
and TIMER1 as present and you consider that invalid (I don't know)

[...]

> +	timer_size = drvdata->max_step * drvdata->max_timer *
> +		     sizeof(*(drvdata->value_table->timer));
> +
> +	timer = devm_kzalloc(dev, timer_size, GFP_KERNEL);
> +
> +	if (!timer)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->timer = timer;
> +
> +	counter_size = drvdata->max_step * drvdata->max_counter *
> +		       sizeof(*(drvdata->value_table->counter));
> +
> +	counter = devm_kzalloc(dev, counter_size, GFP_KERNEL);

devm_kcalloc, perhaps?

> +
> +	if (!counter)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->counter = counter;
> +
>  	drvdata->enable = false;
>  
>  	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 8c92e88d7e2c..94708750b02d 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -11,11 +11,17 @@
>  #define TGU_LAR		0xfb0
>  #define TGU_UNLOCK_OFFSET	0xc5acce55
>  #define TGU_DEVID	0xfc8
> +#define CORESIGHT_DEVID2       0xfc0
>  
>  #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)

This is NIH FIELD_GET()

[...]

>  static inline void TGU_LOCK(void __iomem *addr)
> @@ -197,6 +247,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>   * @max_step: Maximum step size
>   * @max_condition_decode: Maximum number of condition_decode
>   * @max_condition_select: Maximum number of condition_select
> + * @max_timer: Maximum number of timers
> + * @max_counter: Maximum number of counters
>   *
>   * This structure defines the data associated with a TGU device,
>   * including its base address, device pointers, clock, spinlock for
> @@ -213,6 +265,8 @@ struct tgu_drvdata {
>  	int max_step;
>  	int max_condition_decode;
>  	int max_condition_select;
> +	int max_timer;
> +	int max_counter;

num_timers, num_counters definitely fits better here

Konrad


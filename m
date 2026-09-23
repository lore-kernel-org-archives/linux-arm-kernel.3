Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90362C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=2ScSXR60ZYLQiuDCfmO1yWiIXd
	l41MVlgqjrjUb4hQUcplTSKWzXoaBSFTUx5qyRu7ErdgmCHbrgBYnsBc11LgSrB19H08fA5xBFw+0
	iLJXuoTwHdNS6lWay9fVUaGHsuEoKMYOLYXn+xzXrZYEVYwkCpVM62kjHubXnZz3ezgG81V0+MNfo
	no/hsk99WkZYsA0LXJOTNSPprXU6dhPFrrCo9G5LX3hHgARFOXcRMR+SSSMAsajwOr7jOxYbRIkCK
	FXFePHXVUBQFxDFzqTWuzOga4l6qjlqiq1+AuHq9QanVvFD9tL5S0V6GCIX4sfbUF4SZv+xiDxkNf
	qznr019Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L71-000000083yM-0kyz;
	Wed, 23 Sep 2026 11:26:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L6y-000000083xB-15WH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:26:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vs43409856
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=HptVv/MmzLlyy6aW
	SWMDsOq9FeecDMFcKgSUvkiXmdZx3LxUnhHOgkV9PLObA5OD5u7aoJc8DrK3qCGp
	1PZd2HLhj9W9950/cYWWaeekldN5+7tV/xRqyNHSVxa07Vcrxs5tCeXwty1fI8MM
	qBb+olSYXpK6Rm6Dh3qfs5mPrDJbNSZbKWSP4MTcDZ27d62mNpOHfUOhf3zEBFSy
	suqaTrw712vgO8ruwiI7BKyRR3PCCpdx4Xt1GwT0tquW9SGBxZH8ikKg8Py8yhD/
	2AGNTLQ2HwcMCnicaq7njhTS9g8R26O5h5z7Y9hoDUEQ7+/9tNtDiJU7bYt9ExS/
	HFBYaA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8643wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:26:02 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1575056c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162761; x=1790767561; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=gicNIz+LvmZkYAHr6W4y6Ke1vf2SN03RbZ4ECbUnd6jvTUQO7aHTOq1I2sQhjQPh/z
         jTjFdY33oXGwZA7v35AXF3MS3YruZrHkpMJzjB7QGeA/mJ8bS8bkkcMOtbqzyi6zuEoP
         WUpxMbG8GxL8TRFVj684S+zeYiETqVKLfgIQik8phXMCZoRmomF3dbU7RnnvvRhKu+LU
         TbtQD0UEeVktN3Fi9Acn/uIiEhwwpeHollJU6HifNdHEQnLRCvVufxUovFmFs0pr0BJl
         6LPtO1GJ120aogabE4xNZNOTrJpCINnbVVkvBUitaFihb25VC83q+dngmkfhvOOkeTqI
         Dj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162761; x=1790767561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=koWsCrZetw9QxvmQ+lQT80WbUTACozjZLX/SguOHZld0NeaAnMqmjyzX1bI7hcxmSR
         DSZf6DJsDlTxFTm+FzwLAPYsLmTnm0LmPAv/YKx1K23r+JPFPSuHL9PjMyGDpGKuXTZx
         Xo7zGCf8SXvcD3BYiLdFw5oQnnrLLgfQWIouFucpq57hDPL8bhtgeuTmy/FInyxRGnFw
         +PSQTS8//VoYksmpZ+DIp9J4T7mD/eajb7ADD5KqwvRDE+SXxn/KpWY16FelCFBa7K+b
         AmSwRndmCFPUHJAENfxqYqURshLjo0/L648kK2jeH5eL9DIlVEoIQ84r3KzWLaSzayfi
         XUVA==
X-Forwarded-Encrypted: i=1; AKwUvByxn0mcrdVbFqdcme03IG5zj65RHxnyGycVFmG/t+fcfJuWF0FMQsNkX2iBuODTxQXXnKyCqovXrLbn3rDEpYY/@lists.infradead.org
X-Gm-Message-State: AFuF++lBowKOXfv2hP2XHHmb9OT8Od59AgHZk2NS3ZASAWw4xgFV31kx
	yG6tve0Sw3aGQzv5Q1Of/NBIvZnW9Nhm5+IHijw3pBMc1BKGTZr3ycYXHFxa8daJoipCi2078m5
	22QJctvzy/P5LNsYrelKW9j6vpuSbJdgKFRg39whhwpL65UxNjBX086ZdL+T43pjxN5IGAREfyM
	r64A==
X-Gm-Gg: AYBFou3I9IM+zfekrQcj7THcl6RW+1SmP4Aw/m3Rw5aN5DQGzUkc1PmgRbrqgOOcdvM
	CQ2xKNJu1zdcrThj6JMPqZOKijTUuqCSGv4NJz5SRGTiJVaZzErRJMAazbNTW5qC2mMWtmBXe+G
	UEIHLQNE8pubTMyTolaqHvZNiVrgL3SeGf9FGpjfRoA+rCZkrSAf0GWE5r/cgQCZjOL6YLVahRO
	zGBldwCpxoQMIE7ktpiz6yiJ7VisGfKqkB+QxBFvQ4l/N0NJZjTuHH/oH+qWrYZFsOoQo6bkPU/
	w58mJ2q6fiIwhnC743t/IlZ/mMblNsyyZqHKGetzHFW1IJ4wngK+4LKohegveRJT+/dNjVRwARw
	XXUNGV5L74gjqWkgC8ZS9AHdDVdbrOy0=
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757116c88.37.1790162761171;
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757074c88.37.1790162760586;
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm5682402c88.10.2026.09.23.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Message-ID: <c132d8a6-f845-44bd-b0c9-33b5a99f9759@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:55:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QF4JrBv1w8x4bTX7PIpHK6ZgBIavoztc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXywL1StMra0RX
 Nt3/NF4gQgoeztqjQM2sekoIZ+30bSLTN3f1IhMElIMyonG2X2SlbMjN0HIdUfrNzynL/PJkKpL
 RJ7pWXQjI1ndbMSdnYMZ02jg7l6R4Jg=
X-Proofpoint-ORIG-GUID: QF4JrBv1w8x4bTX7PIpHK6ZgBIavoztc
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3b74a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=2jq_lC5E59YAp211iCsA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX3Gad9iz/OXiS
 2eOwXNGy39K0G/zYOKOzWqLjz0W+yHlfa1pXh59JmwuLdUk6Jx9NeySlevICDzbwkeyufzScBLI
 1LAXWWJqvlK5/bK2v6xpCc7X2lCzxsajnf21CvPRGUEGUOmWLR/LT+iTWipxapilpJ4/wxflnbF
 tIFOn1EKQCZlMJe41pUOp1dBsZFWdbGlgHuIHlh1IsDk254YxC+r3u/DqSy/+VqQegtKWj2fGDG
 iXFZURdpKYj8PmcHIvx8YIyOiUBYoC/1v6/F0zUFYHOmPv3WXTMZRvAX3hsXmJnU8YjlF0qPI6S
 XAWErXaPrsZCViVkC2L3NTvtpPs8T1v1M2wf27mwuUsGCbUjqpoMpAqO9PP4a1ZozEnXxFayh1m
 VRE8fQ1ItUsKnV6kDYlPjMKQgbzDtjjr1kXHN+hHVyjm8exMH9N4UgLepoYoEr4JaN5V3HwL9lR
 Y6Weqle36fu3JNWKDkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042604_422338_3AB84116 
X-CRM114-Status: GOOD (  21.07  )
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



On 9/21/2026 8:36 PM, Ulf Hansson wrote:
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +       struct auxiliary_device *auxdev;
>> +
>> +       auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +                                               "psci-cpuidle-domain", NULL, 0);
>> +       if (!auxdev)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id arm_psci_of_match[] = {
>> +       { .compatible = "arm,psci-1.0" },
>> +       { }
>> +};
>> +
>> +static struct platform_driver arm_psci_driver = {
>> +       .probe = arm_psci_probe,
>> +       .driver = {
>> +               .name = "arm-psci",
>> +               .of_match_table = arm_psci_of_match,
>> +               .suppress_bind_attrs = true,
>> +       },
>> +};
>> +
>> +static int __init arm_psci_init(void)
>> +{
>> +       return platform_driver_register(&arm_psci_driver);
>> +}
>> +core_initcall(arm_psci_init);
> I think we should move this to arch_initcall().
> 
> To allow the platform driver to probe, the corresponding device node
> in DT needs to get populated, which happens at arch_initcall_sync().
> 
> That said, to be consistent, we should move the cpuidle-psci-domain.c
> from core_initcall to arch_initcall too.

Ack. Will update it to arch_initcall at both, cpuidle-psci-domain.c and 
here.

thanks,
Shivendra


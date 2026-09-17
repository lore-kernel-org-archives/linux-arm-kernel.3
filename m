Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1A3C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=; b=StP7a/yTMsCPleHghq7fUV0sRj
	7IQcQqEHy3HduENVLFWS9LHZzpdPUY0CuN6EqbgMJBtENBEGJz/sDavj4pFVd7dEmogrHYLv0SioD
	r5/n4hQGDHUwJ75bGKzcr+VTSJeQA9WJMqZwMRmMvdfHQInSWNdjJDsd/7LpuqgPiNiuYtqOTCRP0
	ofBda2963S289uyf51N03rBn0l0axGwWp8V1Jz/yRv3ITkIG9Y2iIXmTKV7Jtt9hrS7zaX5CGaQdx
	BjjIQp8l+H3r9o5A1T6w3H/YyF2D4G5qiwgY6tEgCzW+PHgr1m6RXxxzIJNmzV0uzSOiptMwYcSC9
	4Gr+lVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B4k-0000000BGcL-2ham;
	Thu, 17 Sep 2026 12:18:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B4h-0000000BGbe-46iQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:18:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zt0S1390178
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 12:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=; b=ol6zTXKFnD4JTeBU
	LZXVlSGRIKpqvNI1JClyH012G5SMoW8Ppahz1raOklot6VsMWHMYfVhtpyAaWCPj
	WTgTCywUIvGYku13D8HmsBIWW/pVIDGQJIdsMnS+tcIVHq2vjIvxPnsjrNYdbfc2
	eJdfsaO7QUfPiJo0wGQwacAQnmbDxkhHKCuxMrRzI2R22cFj9V2UNjrDp93n5+pe
	5mgoEIrhrg+Q+uTwPhqe6QR9gn627UkrHHGaXuEJLqd5iXgtBzxQiiCSNBYO8lNj
	2UoeA8Oo6OkdXu07QvdSnKXptZhDFtDz/eoxuPlHLBdZqBIxlzIS//t1nIoX6nkv
	xyuEHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d4ajb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 12:18:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso663123a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647526; x=1790252326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=;
        b=IUqrq498qrA2oWTLWffTyZGQYXBDHF/hde74EAyLx1XUt4PRxlpBEwrbhvuM2z8SCc
         9/3cLxEpcoMAYct2YAzEHmxkce1I47JnRi5v0G+Zd3zKNEVjiETmXplQfayCFEetFeAY
         Cy8o/QICyGLGcHKAOZ7EAuH8TWDqdLh9THoJagsBdCFKs7+w6nGLsrSbI2d936FXsWRI
         LA0Re3qwFh9F0tGzeMIlCFP6cSMdNqmsu46bsvS6R1MqmDzFyYsGupf00BhBNbPO6ACx
         MDEl3pC01bS+NrHW78+boumHFiqXoS51S3veiwAQmR1TIrojB+iFtbj6e55U0apio9IY
         eCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647526; x=1790252326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=;
        b=rcUYMqyo++K1irviHa41PsKkGu7vaMe/V5+g8r0575bTUbA559A2vHKLJYm5L1LpbT
         Loxv6LmTqxxhkJsmyrj34Yx2ddfoQHSKKXJXAo3BzyrCgbBuk3ay+LrJJpRdwafA495j
         bHS0sZVkyQKLlzPNcIbToEDIBZl/7Q4uKivKwpKs3aL395FMTQnQDDqX9LykSFT95MKI
         heb1p4k+whO/We/RoGt/D3BuZLnpWJupurhyU7hZ7lWZfgm3p+ueuAM6JKj1YKsL7OmS
         +ol4WJBNLioFkqGCvis0ofcxQ1ZgAXGmPUnaN0HZnqQ3LSOJjl3iATu0P25tJ3gS8eTi
         vvfw==
X-Forwarded-Encrypted: i=1; AKwUvBy7BRJwb+goByTQ0JesUpc7ViU45ktxijXCZUWgJDiCrKcZJLKxTI95uHIoFiIS9H5EsYkoH/Z1kO8SBROesZhi@lists.infradead.org
X-Gm-Message-State: AFuF++mjRADdNjA9Dshr3CFuKfjmo1DIHPChXczGWmHbR60JDZj2mHIf
	LUSaszAUVYkUX7VI4Xl4fSRWK5b5HUGjqyqSnXGhBwU8hRkEuJHkLgKSFCVowDJ9Rf++ZM+D37T
	7GaxnJZ1ptbFpQ8GFfAitvI8P4FCICT8v9Kvu3QCqE72jFcKlJPjfUNg3oxUWxfpXU66y3IU9Lf
	Smpw==
X-Gm-Gg: AYBFou2eSygGmZgRqNq1IVuzp/p7Oc32qbQXUsWmjPrmRI1c1UPjxRUpVG79Ghwz4OQ
	BH3f43AZR6Y586WLMSyVGIUv8xyPDAeEYlKo86et8e3ADKYHePtnD/cz2VgPm65vTXhmP+7rmJU
	/Qsu2D9OvzTouDlcRDN3G7FFINZgLaB9ViTZhPsItJweqnVGmSaboVpmASEQonY/MsEphhFbpNJ
	hZhRU7DI6Pg9HmenyKgBWLR7uM4o7LzP6T+lirTCQYNgEgAdIMXpx5eJIMKXAU+uzQgoUOhG+RE
	H72KJxVqBvbCpC1geWA4hdpbNJOA+CWymaYpSJSnrRQc808zsPNGgitFlwlA8jCmgIdBmmFSCjh
	KRJWIrqdNOSRRIpSuQ28qlcZsK3kZRPo=
X-Received: by 2002:a17:902:f686:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2dd8e76a15dmr143388055ad.21.1789647525395;
        Thu, 17 Sep 2026 05:18:45 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2dd8e76a15dmr143387145ad.21.1789647524708;
        Thu, 17 Sep 2026 05:18:44 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89c3316dsm25970945ad.0.2026.09.17.05.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:18:44 -0700 (PDT)
Message-ID: <f14f40ef-47dd-453a-875f-6cdc6804a9fd@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:48:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
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
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qs3G6JlBDP67PpLgKnaRwfqLDZb54dqo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfX2eUT3Uxwpc4L
 qzuQ35mGCfoYho8bWs1RM+odcItJVO0XxRp0JQOlnZoubev08pe447W2tOPWF1rbT9xH2Fy/9sn
 dYNRa6q0V4iC7pKnuiZDrvC7wZqforY=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabdaa6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=mLyWk11G7CGH-Ip0H1gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: qs3G6JlBDP67PpLgKnaRwfqLDZb54dqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfX1HobGpSv8T9o
 G6okZVAimTZZwhOCdSlSa0HhH+ic7TswODt0r/j1nLJin/4WgujO7mpUFjSAUTiukC56bkKNRI8
 0gviIzRcBqSSJrns5OYk2ADG1r3cZ90j+CSX8t2uGDpkF+7xjVAeuPK7W69aANA0dceyVS9tNnU
 bI9FiEUbJ5e7pLpZVU4NuJnKhda8WmekdjpTm6wLN4xDO+gwptKdQ/fkWcfWls3kdM9Xckmn0Tr
 4CJCXOsl/P7ESv6F0bVkPBUU65OIGM3nEx8Yh3Z6BYLFLftgG6VUni9HfwfNdhfqQPyANnEZD7n
 vZ9Mc8u8FKFg/dMRbxTykkZDJXZ92lvqGsQaXydbUGY9Mtn/dSdD/ohMcF0ovqMUTlX3HE0z67S
 f8Y+bqnrueAx07eA4OSHH1c6lIKo1RxmdqtooDrpBARuzP+pZ8ABi0drIvH7Mx9DGVovkwdHWD2
 jzIdscfOGAQMshUwG7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_051848_028773_60FAF021 
X-CRM114-Status: GOOD (  30.59  )
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



On 9/16/2026 2:59 PM, Bartosz Golaszewski wrote:
> On Mon, 14 Sep 2026 16:59:08 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to multiple
>> drivers attached to a single device node.
>>
>> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
>> and registers PSCI child devices on the auxiliary bus. As the first
>> user, register cpuidle-psci-domain as an auxiliary device.
>>
>> Update cpuidle-psci-domain to probe as an auxiliary driver and use
>> the PSCI device node for power-domain traversal.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>   drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
>>   drivers/firmware/psci/Kconfig         | 14 ++++++++++++
>>   drivers/firmware/psci/Makefile        |  1 +
>>   drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++++++++
>>   6 files changed, 76 insertions(+), 13 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 207a6e2db70c..9c0334ee2ed2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21932,6 +21932,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/firmware/psci/psci-devices.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index b88b01aa5829..f22e18b05053 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>>   	bool "PSCI CPU idle Domain"
>>   	depends on ARM_PSCI_CPUIDLE
>>   	depends on PM_GENERIC_DOMAINS_OF
>> +	depends on ARM_PSCI_DEVICES
>>   	select DT_IDLE_GENPD
>>   	default y
>>   	help
>> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
>> index b9e4ad7d43a3..0ce6a83f6588 100644
>> --- a/drivers/cpuidle/cpuidle-psci-domain.c
>> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
>> @@ -9,10 +9,11 @@
>>
>>   #define pr_fmt(fmt) "CPUidle PSCI: " fmt
>>
>> +#include <linux/auxiliary_bus.h>
>>   #include <linux/cpu.h>
>>   #include <linux/device.h>
>>   #include <linux/kernel.h>
>> -#include <linux/platform_device.h>
>> +#include <linux/module.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/psci.h>
>> @@ -122,14 +123,10 @@ static void psci_pd_remove(void)
>>   	}
>>   }
>>
>> -static const struct of_device_id psci_of_match[] = {
>> -	{ .compatible = "arm,psci-1.0" },
>> -	{}
>> -};
>> -
>> -static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>> +static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
>> +				     const struct auxiliary_device_id *id)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> +	struct device_node *np = auxdev->dev.of_node;
>>   	bool use_osi = psci_has_osi_support();
>>   	int ret = 0, pd_count = 0;
>>
>> @@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>
>> -static struct platform_driver psci_cpuidle_domain_driver = {
>> -	.probe  = psci_cpuidle_domain_probe,
>> +static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
>> +	{ .name = "arm-psci.psci-cpuidle-domain" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
>> +
>> +static struct auxiliary_driver psci_cpuidle_domain_driver = {
>> +	.probe = psci_cpuidle_domain_probe,
>>   	.driver = {
>> -		.name = "psci-cpuidle-domain",
>> -		.of_match_table = psci_of_match,
>> +		.suppress_bind_attrs = true,
>>   	},
>> +	.id_table = psci_cpuidle_domain_id_table,
>>   };
>>
>>   static int __init psci_idle_init_domains(void)
>>   {
>> -	return platform_driver_register(&psci_cpuidle_domain_driver);
>> +	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
>> +					   THIS_MODULE,
>> +					   "psci-cpuidle-domain");
>>   }
>>   core_initcall(psci_idle_init_domains);
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e6..68e381f1a618 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -2,6 +2,20 @@
>>   config ARM_PSCI_FW
>>   	bool
>>
>> +config ARM_PSCI_DEVICES
>> +	bool "PSCI auxiliary device support"
>> +	depends on ARM_PSCI_FW
>> +	depends on OF
>> +	select AUXILIARY_BUS
>> +	default y
>> +	help
>> +	  Say Y here to enable auxiliary device support for PSCI.
>> +
>> +	  This creates auxiliary devices for PSCI functionality implemented
>> +	  outside the core PSCI firmware driver. These devices allow PSCI
>> +	  child drivers to bind through the auxiliary bus while sharing the
>> +	  PSCI firmware device as their parent.
>> +
>>   config ARM_PSCI_CHECKER
>>   	bool "ARM PSCI checker"
>>   	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
>> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
>> index 1956b882470f..8e75a0ed6f74 100644
>> --- a/drivers/firmware/psci/Makefile
>> +++ b/drivers/firmware/psci/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   #
>>   obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
>> +obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
>>   obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> new file mode 100644
>> index 000000000000..f1eca61e3269
>> --- /dev/null
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
> 
> I think you need module.h not init.h.

Ack.


> 
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +
>> +	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +						"psci-cpuidle-domain", NULL, 0);
>> +	if (!auxdev)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
> 
> I would prefer you to move the code between the patches a bit. This patch
> should already be introducing the full, future-proof infrastructure for
> registering multiple auxiliary devices, so maybe add a static table with device
> info? Then in patch 10/10 you'd just extend it for reboot modes.

Ack. will update it.

> 
> I'd also not add any ifdef guards here and lesses the build-time dependencies.
> You can register the device alright, it just won't get probed if the reboot-mode
> support is not there.

Ack.

thanks,
Shivendra


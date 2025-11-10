Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2180CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS5NUTTv3FdBLmHBPmYyttDzcW9cweq8QpTX4mKQofw=; b=2jmKJUdMJ9wj1R0UK10Q3hzWTG
	zoudidUuOHnRlAfknKDAnq7Btp3MtzXzb4etAnR0Sih4bcm8Rznsato4UkvRb5zArgBUiGlENNc7S
	5tH6DY4EkTaDlX8yup0DPZfJhhvw0UH9KrauRhY3QXVk02n6z14lpCU11yBLHzl/AP6vF91194BnY
	KLDiVg6oAoZyJ27mWNRyzynBNpxrTEjUDbd6E0UJGkXTdLr3FYjIiPNAYrN/BBcAulP3uRHYu7d0l
	2GB0LM+YlVkxMD2TF7Orj05z35ifVNLt4HXogQxYXNQpd0kMg5dCv/9KD+XsLGeBqrPjCaoNozc5w
	8Ds44x9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRoe-00000005U36-3cwk;
	Mon, 10 Nov 2025 13:20:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRoc-00000005U2c-3FVD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:20:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA997cw1809060
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS5NUTTv3FdBLmHBPmYyttDzcW9cweq8QpTX4mKQofw=; b=YSjH+mIdOYFs2Mxh
	eEgTOHYlQYj4B2WIumQaiocY59afZzEYa2jfmodQal7oMbx6Hz1QrR8IEju6v8CM
	h2GI/W0DS8pzYC6D+qyGES+HZybkMClZJN6D0cnGN+ntODjCUNeyb4xyu4o/pmSL
	LXl4TEsqL4EsHk5OCgcoI8mIdaR5XOL5O2kRyvu7Du3aQV5/7CovPXl+UhUyJlD/
	6uBEHMs8lzPZvhaWbwxO2aXey2Bjql001ayuVH48S9vf5rbiGhHVU+7PApme7Faw
	jzavIpXn/moLfI8hNDLQGysbglrqgHDOlDGf68V723uHjEnrfkgeFdL85pAUcIJe
	gkoxgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1hyxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:20:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2954d676f9dso26301125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780814; x=1763385614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aS5NUTTv3FdBLmHBPmYyttDzcW9cweq8QpTX4mKQofw=;
        b=bYAkNGd42G7lPdZ2rOBKZiZQEMvw8QP/sAZ7axCkXi2VIycPxOA+lSERlb1I9KjlFM
         4TmxashK6X28YT466lnl+IXuR+KuPvj28rB+AWnd4nyAws8MN1Q2M5yViMFHrW+Ewww0
         7EdgWvZdm5fz0M65HPsc00z/pIgoc4FRZJmZIhzFgwfQRaVa4HWjJqRD65ZQqImwjaO6
         SJlYZgTPKDv2TDnzsNI1CPphZEIoPtiowMl4hNqpKxA4TTDTPfiasLL/h815RgtaIm9F
         uaqPzQT5LScQmA5QHg04WQ7A8fc02tSmlr/1qKDomXC0mDn29zDAR+uY7OtiuERlbhcE
         3z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780814; x=1763385614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aS5NUTTv3FdBLmHBPmYyttDzcW9cweq8QpTX4mKQofw=;
        b=RaSbWoZcGMhUXiJAgiwo6V5q7Z+BfKRAu1mkdi+2KrySzkrr4EGw6GncysMKEuyd7I
         cR557OkGPwa8T5GRVJ6oFbAhhn6DgTLXRTQsgnI/LpHeiFn3kzrLEWzGiZuGPD1mBRDt
         Xjr0hPwKIr+Y9SU2pzY4moyORBgBywDPXFuAh3pS1BMMciFD6wMd8AwXmqkN/uOl+qrq
         n25zx5q1Na4RJXz1BvtC8oNVj9faUmTOBSiKONdjQUoL2Ur2Dxxne5dIFaUqHZ1Cr1H3
         4AHmec/nSeoNADDe5WnL6Lzv+Gok4EHdPeYJhiPmuMcK/56U3I20LOaZA3e34KsPmb7B
         buUw==
X-Forwarded-Encrypted: i=1; AJvYcCX8uuZzb/2zjllOEQdoiI8PAKJ294FQoEgfvJ55oARAdMGNst13yEgNqax3718oTU11mByOOeeIgoVsx3l3h+b3@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQVoVOI28VI7dBJ8ndpujeyYFYwCmE5Wz2euJD+3/nacoGTi9
	b0MD/jvlAyxdamwkRkIXiyySS/4aZtDwxYYaCuMdRzUIqSNig2P2MMLbtiuVlwMEUFbCVhFOMQ5
	ZyAz83ad+zdO5fs57T+I5JIuT7PYyoy5My7hy98bt6e1Sd8X7P+zawu9P9wC61170W/UAP9R5Nq
	Eb6Q==
X-Gm-Gg: ASbGncsk5zzFpPNET1gza7xZUXQdhr1O+GhfTLSxz1fASluBdoNRqcpDkwxPt24S0UE
	+mwnCzSFM+JwqXPcwhjvHd7UB2XtgA1Hbv+zsuqiI+8uC2USJZkHN1axqnlKPATg6ivGQ4fydtu
	lsoDHhgguIcXMMzKOp0XCEFdkYEkPyOm9V48tAXTcT3WwkRzUibSYOs+pM8UlYn4wBFQVXrBLvC
	jEuplGB9RK/qbAAvt+0x0jSuo1hnmive24+yYH1whttO8kYgD6zsT/Tw5F5Hpz+KKEbyDJEq5pq
	G8vy+FldaU6CM1hQpRGX6+DLW2A9ygsN4XmQmvxc5Bn69ESXrpHFSwyLMivej+IRawtCPKVxJGd
	A8eOFfMwJ10zCrjvEblMMbA58NsNetcXH
X-Received: by 2002:a17:902:f690:b0:298:321b:2694 with SMTP id d9443c01a7336-298321b2b47mr16560985ad.19.1762780813066;
        Mon, 10 Nov 2025 05:20:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTU/9CTN1kUz0aU6N4B5Am7ZyLyMmtt5oyD6FCGHb0vg/r8pz70jik7u/krNQAcxQRtx7PiQ==
X-Received: by 2002:a17:902:f690:b0:298:321b:2694 with SMTP id d9443c01a7336-298321b2b47mr16560465ad.19.1762780812519;
        Mon, 10 Nov 2025 05:20:12 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c72esm145613585ad.33.2025.11.10.05.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:20:12 -0800 (PST)
Message-ID: <c3dc392c-eff3-199b-c047-7fabe155ae98@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:50:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
 <20251110130159.pzfmh7mr3p7xz5o7@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251110130159.pzfmh7mr3p7xz5o7@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNiBTYWx0ZWRfX8VCf28Q0pXY3
 +ZMgcx47RdUVo4ofPz5ftrCFT/twuyqXbzqi4T4Vi3U6jIEj1ttCxEG2nqi3alz1Sm7ZlESeR/a
 MjmaRXdOr0UT0PpfyDaqdiwjedQZasVTQc/oLkq/+d9qsj7Xu0zD7K5vNpSObOA9JkWdSv+890w
 ljbOaqUprgj8jPQ4vUe4jmb1Bln4yxvlK4hpZJFCh/dfg5e1nj/JG1X3fBAnEFICRC/guEqFDDd
 jDMhGBVVTJMS7HmwKxs7j7+wDPI4kuYLqg5Md3BVLIB6JSaS6iMrG4S1t8T5mBgPNhL2yD3eK6L
 hDNABLgrrtgdw8y3NKNsvTGIJxOiZupGVtY00Vm7xCM5bWIbZQ4ZvkAin9KsNkLEygZj+MPWKTq
 8OwYbFE+TH+yhl6eQZcjWRAu8tCs/A==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911e68e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=otca4u8OHQj9NKxAAEcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 87bWLKkXxP4rPcUDfjLovk67vJbumW5s
X-Proofpoint-GUID: 87bWLKkXxP4rPcUDfjLovk67vJbumW5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_052014_855044_EC95F1EA 
X-CRM114-Status: GOOD (  20.20  )
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



On 11/10/2025 6:31 PM, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:14PM +0530, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, and they should be
>> avoided in shared subsystem code which is being used by multiple
>> drivers. Avoid using devres based allocations in the reboot-mode
>> subsystem and manually free the resources.
>>
>> Replace devm_kzalloc with kzalloc and handle memory cleanup
>> explicitly.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 30 ++++++++++++++++++++----------
>>  1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..ac4223794083f36960b2bd37a601b7e1f1872de5 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,6 +3,8 @@
>>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>   */
>>  
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> @@ -71,6 +73,7 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  {
>>  	struct mode_info *info;
>> +	struct mode_info *next;
>>  	struct property *prop;
>>  	struct device_node *np = reboot->dev->of_node;
>>  	size_t len = strlen(PREFIX);
>> @@ -82,29 +85,27 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  		if (strncmp(prop->name, PREFIX, len))
>>  			continue;
>>  
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
>>  		if (!info) {
>>  			ret = -ENOMEM;
>>  			goto error;
>>  		}
>>  
>>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -				info->mode);
>> -			devm_kfree(reboot->dev, info);
>> +			pr_err("reboot mode %s without magic number\n", info->mode);
>> +			kfree(info);
> 
> This as well could be avoided if we move the above memory allocation
> after of_property_read_u32()

ok. Will re-order the code to avoid the kfree(info) here.

> 
>>  			continue;
>>  		}
>>  
>>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>>  		if (!info->mode) {
>>  			ret =  -ENOMEM;
>> -			goto error;
>> +			goto err_info;
>>  		} else if (info->mode[0] == '\0') {
>>  			kfree_const(info->mode);
>>  			ret = -EINVAL;
>> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -				prop->name);
>> -			goto error;
>> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>> +			goto err_info;
>>  		}
>>  
>>  		list_add_tail(&info->list, &reboot->head);
>> @@ -115,9 +116,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  
>>  	return 0;
>>  
>> +err_info:
> 
> free_info ?

Ack.

thanks,
Shivendra


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0CFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nCrpRv1Mz+G5QXSFlJHgBDudrIiUMOp8bzN0yyhpp4=; b=cXepVmGoUAWLEdo0OhQWV68REt
	XzgYCSSdgViqNSXEzK5oezHKWEEB8I4L+mRsALcMrA5mMMcfaf27Cx8PSgOwJiveRkJbQE74/17QS
	SeMX4OKxYA9jyEFeBeSzQopi4XFPQkgzRZTnxtxE8UUPRhAVURXUGuqr6dI2pTuTo/fv9HuU2wdM/
	X1pOesbL19OW2iUa0tPqAviwXkrAl1t9JhpA7Ipn+g3ix/yOCm2rflNpw/pXSXZbuME+xTAKZWyKb
	0JP/EN09619IJYj6PaddPKdfqW4JyWy222oQy52c6PHY4YX7ScEkXDrOc7oByzRg7NUJrvhs3aUKP
	uSV4nxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFzH-000000032jh-3oFE;
	Tue, 22 Jul 2025 16:37:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFgK-00000002ziC-0fKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 16:17:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEfumq014177
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 16:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nCrpRv1Mz+G5QXSFlJHgBDudrIiUMOp8bzN0yyhpp4=; b=IFqYFtcaX36DN33z
	f3HQlKpeuDNBFnpQMHdxfv6Y7ay3qM99z2oZ9kwZOvd3r6kd3umiMUjGG5nYXiJ6
	x7bpCfI6TXNNDis7RbkPo9vSsgZcikqTK8VWuWttIXDNorCWGO7xPj5s98tj2yCf
	7uo3pSTDbmLEHM8a+OI0B7HgDWHaubFS1efZGCZohoJXQuNobWBy7L+d4CO4sGUb
	ou1nAFt5Z1qqm0RXzj9lcGtmNIj91oupeYr9Rj2znT8zsetyjurawRl/YKGWEFnD
	eHYNX+3X8ZCzFJ9AOXVliTRdoO33tr+713q9EMz6AA30nnnrz7EJW727Lo0/w8Pq
	cQrEFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emxu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 16:17:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74927be2ec0so7080063b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 09:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201050; x=1753805850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCrpRv1Mz+G5QXSFlJHgBDudrIiUMOp8bzN0yyhpp4=;
        b=b1ocR/xRv9+vCM+DIcQ0+GREs7jJ7yNeoXV/cr1mCFIdMp45DaJqG8m4l/+T5Q25QC
         8339yHyTEjGBbrN/GMRaiQWN93MZPttQ2UZq2gStne9j/lcC7lIiec9uOwpGI8LSmEn8
         n749oHImkGu6C/3d7YOj99Ro6wjPIAEmo/1bs/H6buf1SYQrhNYyEycrkZlh6rSoVS0U
         81I6D1nsemzB5XXSCSOjqP6FDCf/7kTBn287fuvvNbORB2D/Zoea8T1Hm9M1G6l7SH2h
         Ny4x7i2z8EGZ2dv0X/iOy3fmeq4oBF6yEpe5vsUatlkmKCJwA1gAl4rC3ttQDsSXYamO
         AbyA==
X-Forwarded-Encrypted: i=1; AJvYcCVILqGJn300YXx39jalJITmMsvHCdISFC3Ypvb5+Ig+cFTgTAvHSJB+aCdMTz6fQ3OJ/oYb6QgOHa1jNvDuZlVt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9jZBMpCJqi57wNVqSVyxkIXdOa2uaTBdldNyEFm3Vtifu7BOU
	3vPEttLR7WWzOmJIAlIkRuBD/ytxbHQc4LvIBoLFKSWAZwaJjdn2RaWkRrYqPYfPIOhMh/xisp/
	Efk1UUDiQZUsEhlpsEunUq4sdbFUIjv0toknbhV5KwZ5l7NCxDrDP0BuCkZdjGL/SzReLsyyY+K
	uwdw==
X-Gm-Gg: ASbGnctxID9ciO7pNBq8EUpPK4UtKaB9ocD8n6GuINGjMq/6IBbViLjKPZoBHwcHLsR
	BQhlDju+cfgDOs1bSMTIIFTC8IVd1PQ07sVHoZO8A1MAQTNivH/D+VhBziqR4ujIAFMFrMomotP
	iDXr4510ZJNTqQsYApAwbhc0BRrnux4OzYYKoqUTZ3JO0nF5l8l39G+B68vuS/oPfzSLTnijI/L
	B1s1kOvDGkcnqEHVfOIHLBJPgqS85Fgwh1tgBzE7wpOXIew+XdCfYSIOZCXQ7g9frI7dF1LYU+I
	21PFBPj2Y87wIIsotrWo7gHKWJWFfKtZCC2ZQHd98TR7zuwBT7H8Ety74LYKrQ/lMgmycSsXTW3
	wBS7lHIs=
X-Received: by 2002:a05:6a00:3d07:b0:756:d026:10a7 with SMTP id d2e1a72fcca58-75725a89319mr35996866b3a.21.1753201050088;
        Tue, 22 Jul 2025 09:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm++ZLMXmAYAQkNZgMSqeo/I7WJon6D9QhDXy0vQr/omCJkB9Jb05Hhf+LFMrk9yKOHj21Ug==
X-Received: by 2002:a05:6a00:3d07:b0:756:d026:10a7 with SMTP id d2e1a72fcca58-75725a89319mr35996814b3a.21.1753201049597;
        Tue, 22 Jul 2025 09:17:29 -0700 (PDT)
Received: from [10.211.220.100] ([152.57.179.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb76d5d8sm7849327b3a.112.2025.07.22.09.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:17:29 -0700 (PDT)
Message-ID: <13b6be8a-9cd6-e49d-2311-142f79c27328@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 21:47:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <20250721-arm-psci-system_reset2-vendor-reboots-v12-1-87bac3ec422e@oss.qualcomm.com>
 <33gq4iyx5jxrr6f5w3ctgy7l7om53jdvb4tmfmxzourhfvpc3t@cr5re2dab4tc>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <33gq4iyx5jxrr6f5w3ctgy7l7om53jdvb4tmfmxzourhfvpc3t@cr5re2dab4tc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qC4sV6J0MWLsCkINxaZbs-y7_UqGNPay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNiBTYWx0ZWRfXzj5xod5DLKQr
 7wiOsOiHcqqFAPtbBE5pYQy0hQISL+ceXJALW4kgjUrnFBslemEZULqfZdI4teaBwWrlSxd2fyP
 nyLxDd7M2ZKqiGK+xLxwIf0nMZjuFmzA6adUt1sP1EbMKnV99CskqCc3GhFNTpXdOSbynMkBq2D
 pPeKHF+m76509KQdvre0PZMeTMob4lTm1Mf7c8wrRmdmJhtkqddR741/zKrhPlQNEUzS9zlk43X
 joR6IB75fEeuozOpSJt/jq+3cFes5eeRSkDG2urMwD6xLxngdd7lHVo71bNzObHNNF4aUBVvPqj
 9DB5HlDNbfDRNAuJ4cDlIjeny9kEoU4jp4DDX/31YdoLy+sE63y5f9Cu31G+DbV/2q0A2wtRQui
 hJdiSs0IO0Mn5JLrzr9eWG+bs/W5nCQBcWomR1xG/H6NhAYU6nBuwFTT8qcAX5FyZpfy8fQb
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687fb99b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=p0YknvR/5ooNN0yes+ndXg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=33cFMSo4UqZHzB7ybJ8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: qC4sV6J0MWLsCkINxaZbs-y7_UqGNPay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_091732_207777_3D7F4276 
X-CRM114-Status: GOOD (  22.17  )
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



On 7/22/2025 3:06 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 21, 2025 at 11:58:48PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
>>  include/linux/reboot-mode.h       |  6 +++++-
>>  2 files changed, 39 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..5dd3f06ca88cb28606d9fd2100ce03383c14d215 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,13 +3,17 @@
>>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>   */
>>  
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/list.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/reboot.h>
>>  #include <linux/reboot-mode.h>
>> +#include <linux/slab.h>
>>  
>>  #define PREFIX "mode-"
>>  
>> @@ -55,7 +59,9 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  	unsigned int magic;
>>  
>>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>> +	mutex_lock(&reboot->rb_lock);
> 
> This one should go into the get_reboot_mode_magic() function, otherwise
> it's not obvious why do you need it here.
sure. will update.
> 
> Also, please split mutex addition to a separate patch.
Ack.
> 
>>  	magic = get_reboot_mode_magic(reboot, cmd);
>> +	mutex_unlock(&reboot->rb_lock);
>>  	if (magic)
>>  		reboot->write(reboot, magic);
>>  
> 


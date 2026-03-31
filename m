Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C6FF60F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=; b=WtjeWR4UGbUuWQbSjNTtg32uJS
	dUI6OtCbSS7KTv9JnHEnfiBXjYi2iS15YsL75+z24pH4jkiZAlDq6+KFLQ8DPCkAiK7HLUHklTMsv
	JkLyWCv7hMwYCZXpu0XWvdsO35/7BLVFZGhERZOLhiVNTX48aidCRjj7k0vZdupmVBQpPDymINarj
	kCR8t5Nl0fUvSp2AANAC42lLXXxjSDbfRuYoq7X8hHsacVx0FyVGQV4ldmvOr4ZwIeeraPYgLMtWf
	39OVsr/mZzso+3nJ7rUkcJepySOtZCGWdmlNhTcSQZDyChsMqmF11c7bN22lLBb14FyCcrze+SgBJ
	k6ulKfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dP0-0000000DO84-2k2x;
	Tue, 31 Mar 2026 18:01:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dOy-0000000DO7a-1JKU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 18:01:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VHX9er3104016
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 18:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=; b=mJGBOu7cmnVlWToe
	p26xjkmWqNlEUU2kL0ft4DSZNw7b9Aaj8gs5oNf8YbiYGW3yTT5x1UeRAjrFDMjb
	pnK0neiAJtrjjZAW7sEByzwzTFG7pdwiUWfLo/wRI+e8X1sYCWriQ9oc5kDIsUFp
	iT+1BumGzjRS4V/eUzFo8oRuBRFKtjfxDFsEwv+4HP/gNREeWEs1B0rYggtqWFwc
	esIy7WDvb8/IZV3fnslc2mbnRnOEE294HdCQdkUtBK2w9zYY8Vw3060w/yX8Oxes
	Dx9l83OddKeHGS2/8ndTiwzPp0ktwKp/1M082bqPAArGMEXHwT4IzB+yMWsQLJb6
	x1Ba0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js204x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 18:01:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cdaf0f934so1612440b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980021; x=1775584821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=;
        b=AQqO9impiEoNeM5WARBpqdzEKd1jylMpSVgS92DDls2Rx8HmY5NgUR1pGB1ynvJhzP
         d4sbWB65XdSeVV6mjnzra1mRQzT7Qdw23ZmdaejsXW8mEYb3Vf2KbdwbRLzrf/Yf3nbH
         9ioJa2wAnDJlCmtj5kDQx1KTkyyGPR1tHg9LnhvFqRBS8c2AcZNE97D6TnPL1S0BN0qX
         Ha+LyiW2zytsGze9ofYPYHFio3fSsqrfLRFAhsR4YUb52GCxZOmSzVtYbudIlTrDHZWW
         Ll+hjbTJYFDrtgFZbKGxmNwqKhUf3EC+G5Yz6fwtPl6u5IsT3Uz4n2xbbqLu8LqJdaxW
         Y+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980021; x=1775584821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=;
        b=mTIUMW3DuQXWNimpasSwczp/AilXicKMeqg+PHIXIhzabsDIAlxzC5ZRD0rAVtbhWQ
         uOWVSm0NFUPRHMpUQ1JCElVxpgKxxTXmsYxipv2ehQIie7m2gCYCRrkeQWs5qxK84UWy
         cKoEKNFgjB5rZoK5YntHmtQ7kbaJlesazNIB7IoVPL3Xo05DJkNLK3nzr945MLiFcG0Y
         ih7Ovwh/6bIQAsoZEIHFa5ZuIP6WoMb7wsonTwuDnzm73jGIOuad77K9+UKOe8d/Cyu2
         lkGIKPCYxRihjSqN49M0jgb/g4LSELInbqPzRYWMCgzTRbD38OZpTwJfgDJCEKcSd0vq
         3BBA==
X-Forwarded-Encrypted: i=1; AJvYcCUvV4AWsmRnzQD1kL2bludMJSrVSPCi/wX6ShngHZoiE6bW5HR97/Aov560137wrKJl0DAI7qXGSN71DyBxfODb@lists.infradead.org
X-Gm-Message-State: AOJu0YzX1mdrwDayoFyFRtnfHfKWecL+7Bz9nMnJgWHM7Y/GCPG6A1wb
	O3SDvmMfOxms9qCX1NZpUv46z2QfvHJrDqoBkLYR3OSTvOjgMKd86DnCzXqexT3zuxZXrL1pEJ7
	qIfa/4xai0eg0cQ64SYUEhJ7XWZDcoGQMhZoKtt2I//n30SuunzwWehMM0rZQDbgFcUA+yTmtHm
	h9hA==
X-Gm-Gg: ATEYQzwSgxl4A1z29cVALrfxPR2fzAn7LoUUcq4X4+zZeJuLaCg26sqBOxURsIPfYP6
	4YzcF8wW7bM/nCjFvIVNnS/Aznl/zp1Da7P78qhbIvxQOxJtUl9EnuMx3qcr+iClqeUq8S1+Ze5
	7Focm0ryFsSKDiSaGCFiYKOZd+VR8kRcF8iYE4b5rh8g/TVFWZytO3Egf6FDaJFc/4YUv4wAhYC
	YAypp+AuAdkzlk53J9wGN789vDLUtgDjtGAPlIAOmBukwN1bDsBpgORgvoYp1JCFogwjlk0ezKj
	CIE5JBxaAQFoHPUqPUToCGrnDylNyEWVoOpA24sQgjIMWWkilLualeieH2vichL4iOG12m1oEvJ
	HBuvSFKF3eg7u89IZBTjUEqnr6GJAldDjyySmtOofDMiCOT8Zd0O0n94=
X-Received: by 2002:a05:6a00:278a:b0:82a:6e7f:4c14 with SMTP id d2e1a72fcca58-82ce89b58c1mr495089b3a.27.1774980020656;
        Tue, 31 Mar 2026 11:00:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:278a:b0:82a:6e7f:4c14 with SMTP id d2e1a72fcca58-82ce89b58c1mr495025b3a.27.1774980019787;
        Tue, 31 Mar 2026 11:00:19 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm11012404b3a.48.2026.03.31.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:00:19 -0700 (PDT)
Message-ID: <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:30:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaMPgRALnoUIHMC@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JtnHK-xWcjVtuPbvtR9e8mrKH5IhwQ_U
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cc0bef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xx8M9eIzLlJJCfGiN1QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX9jJcfFeoxShY
 7wE+dhbGZ+k3/c0xkYwKujh99J8cpk8juhMj4qYtqAWAlLF94tvsrdYKLofuUPcviipDRhPN50c
 ZbeaqJN8dHg1Y2t9D23T+L8WI0yD0/yspRxEY90Z5Uycb4ZTuu9/D013SS8xOpRwyivRaBR6UA+
 NCBShPrX64qGEm+P0PhPTyCzmo0UjEw/7ftP8Z7flbirhC2Dx8q3Fxewj0eY1C/KBb13QYQEg4n
 kBj9+9p5Vl1bqJPu8OYBCKov7T7veKOY1xlScNnt2uW47CYJr0uPBkKe2aRoZF2HNA3O7KWL4Nz
 3O4Y2CJw+v8ACLp/W8IeynK/YwYkGG25J/QTIcpOWxw5ALL6++9PPBmzBd3ie/tQnFhMnSBHZf8
 ZPf0j7UVgEbHv/iXKWICn+Eyc05VRVG3vHhkUwN3XRjBCYbxTx/ObaMdvE6F4+SgN9jtfKYi5bK
 RU4ZEWHI933AOzeqhpw==
X-Proofpoint-GUID: JtnHK-xWcjVtuPbvtR9e8mrKH5IhwQ_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_110120_363208_836DF68C 
X-CRM114-Status: GOOD (  39.45  )
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



On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is
>> no common mechanism to issue the supported psci resets from userspace.
>>
>> Add a PSCI reboot mode driver and define two types of PSCI resets in the
>> driver as reboot-modes: predefined resets controlled by Linux
>> reboot_mode and customizable resets defined by SoC vendors in their
>> device tree under the psci:reboot-mode node.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/Kconfig            |  10 +++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
>>   3 files changed, 130 insertions(+)
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && ARM_PSCI_FW
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +          the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/device/faux.h>
>> +#include <linux/device.h>
> 
> Nit: swap the two.

Ack. thanks.


>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/psci.h>
>> +#include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Predefined reboot-modes are defined as per the values
>> + * of enum reboot_mode defined in the kernel: reboot.c.
>> + */
>> +static struct mode_info psci_resets[] = {
>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>> +};
>> +
>> +static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	INIT_LIST_HEAD(&reboot->predefined_modes);
>> +	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
>> +		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
>> +		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
> 
> This looks weird to me, why can't we just initialize the array with the values
> directly ?

Ack. The idea was to avoid Typecasting. Will check on this.

>> +		INIT_LIST_HEAD(&psci_resets[i].list);
>> +		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
>> +	}
>> +}
>> +
>> +/*
>> + * arg1 is reset_type(Low 32 bit of magic).
>> + * arg2 is cookie(High 32 bit of magic).
>> + * If reset_type is 0, cookie will be used to decide the reset command.
>> + */
>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>> +{
>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>> +
>> +	if (reset_type == 0) {
>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>> +			psci_set_reset_cmd(true, 0, 0);
>> +		else
>> +			psci_set_reset_cmd(false, 0, 0);
>> +	} else {
>> +		psci_set_reset_cmd(true, reset_type, cookie);
>> +	}
> 
> I don't think that psci_set_reset_cmd() has the right interface (and this
> nested if is too complicated for my taste). All we need to pass is reset-type
> and cookie (and if the reset is one of the predefined ones, reset-type is 0
> and cookie is the REBOOT_* cookie).
> 
> Then the PSCI firmware driver will take the action according to what
> resets are available.
> 
> How does it sound ?

So we mean these checks will move to the psci driver? Sorry for 
re-iterating the question.

>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	int ret;
>> +
>> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot)
>> +		return -ENOMEM;
>> +
>> +	psci_reboot_mode_set_predefined_modes(reboot);
>> +	reboot->write = psci_reboot_mode_write;
>> +	reboot->dev = &fdev->dev;
>> +
>> +	ret = devm_reboot_mode_register(&fdev->dev, reboot);
>> +	if (ret) {
>> +		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init psci_reboot_mode_init(void)
>> +{
>> +	struct device_node *psci_np;
>> +	struct faux_device *fdev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +	if (!psci_np)
>> +		return -ENODEV;
>> +	/*
>> +	 * Look for reboot-mode in the psci node. Even if the reboot-mode
>> +	 * node is not defined in psci, continue to register with the
>> +	 * reboot-mode driver and let the dev.ofnode be set as NULL.
>> +	 */
>> +	np = of_find_node_by_name(psci_np, "reboot-mode");
>> +
>> +	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
> 
> Same comment as Bartosz (have you picked up his work and working towards
> a solution) ?
Working on this via MFD. Some issue as again MFD framework does not 
allows a fwnode based driver registration. Will update.

thanks,
Shivendra


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ccFeXTR7pLPx1bBuVe3LNgdCi8JdpQE+Z5torLzxTE=; b=TMAVK/HtosmrXAcXl/TTpGUklU
	6l6RuTEA/hr6FuNN2/tX20o2VuNXsSGRvy2hEEo7eYq9stisAMegQ5WBbhyFF1EVGUOBzmKVAiEza
	saQpRAq1KL3STP5IL4Mm+LP0aIHIenLIpki5S8+pyQJvMHka17rjKIcrOgUEve/n/9M4/o/RJfSOX
	/Mq5rSuOUTvJ+IbD/U7bayprUECB94cYIvQwFRul0y4A5EMHYXkhltPeE2XUqt1RQpPskljqYf3yL
	sXvJbLH3gpf9uO4fRbGnQJZnbyXLCanDfxfyV5I7bx4P4dA0zDHGYhkdzbePM0MCCa30oPdG/BiDQ
	1errqT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhM16-00000002wYW-3WtK;
	Thu, 31 Jul 2025 05:39:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhLwf-00000002w8H-2KWW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 05:35:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fbNs003828
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 05:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ccFeXTR7pLPx1bBuVe3LNgdCi8JdpQE+Z5torLzxTE=; b=Kqmfks5DQbfxR3gV
	+a6RHyxwYbL9rRsvvbrLdPvILAO4sJg35j8ajZ7ukurS1CLSqrcFKrV9nk423OSe
	rahz6RU9Jh7jDf/XgYuCWykvPmZ4rjnvBjWeak9K+/+pJty88yikVz8HdMb9HTjs
	24k8HXy5NgysDpWfh8RB9DDDPScRmY8oy19e+VzCAp14M+sGv5XjOouVt0o87OgL
	XEqo0Qjtp49nKVeDHXjP5s7bwt9Swk7PEqbFB6fhv65gSjPBgoDe5Dk4nL2f8Kbb
	gREgk8fuOlHssiQFOy1a7rLATeJyI5vqJS2ZaKHywJttLFH9BTFxyjD9pTqP8yYS
	+B5n2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgavyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 05:35:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748d96b974cso598351b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 22:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753940111; x=1754544911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ccFeXTR7pLPx1bBuVe3LNgdCi8JdpQE+Z5torLzxTE=;
        b=FeB9szZj73Ys3EPSrTzrGdV3eYAmFUY/a6/KrxVBAGufA5puRxTED0bopAKqQZG85r
         TkQUxFEuUsRsBur7UAmdZLpzWVolY3c9x8EL3hF7WTPuRfWwxn5AnohOpOX3K0V7fMSO
         hXQbAZeEw1+kVPaz2NaF9olKQdNcopqHgn7qulrIc8udPTdGVFVExb20voorVBEEZRF4
         zSh8vHd0nWFmm9mS40KtAW58PDBZZTh3zJC/FYovdbHujZPbMiFMCqvnT0SI1Ujs6hvB
         OCd83QjeD20jYcfMn/MrlSQlU2F+4J0p9PPj3Q6Tyn8OC2x0PIK292TVSl+qd3doq1j8
         jH/w==
X-Forwarded-Encrypted: i=1; AJvYcCW7MozckdcKtVyw29GgLr0ketAyr+Cn7PRnlX+5CVA83kRWJ6EhgHO5+IKT3pCRnkAvxRvkFkMglj4uJ/piJUfv@lists.infradead.org
X-Gm-Message-State: AOJu0YyXzuYhrX5QjtMMJuvd3vJOP6INFAMIellLNdu3jlZWM5UCmDIH
	7wp9Mz1o3Dl1n9oHqh4AHMWUdTRMMZ4AYcixCdwjWPrYlsJwqm6DmGGtKAE/24E83XCR3WeOS9S
	RYTc/q0BY9AEAry1qDfhuwYLVqm6im9upj+7xoOMeDbsUZprR//bvEGZgh0u4Mi1HTrGRv3goTj
	0SFQ==
X-Gm-Gg: ASbGncvIVVojb73kHjNhALPrdKGqA2cAg1x9mkTLsRRNc28wz6wIWgw8MOXdYaP/3tj
	Yi7BlcVlgUH9bebGvTSgndeA9MJylREhCo9JdAxrKBO0OuNvtnRQvxTRKP/ifb2Ana804LeZYoj
	9mwOCrBwer7ZEfKCEbKfVfBM7GTYgS2OtNsF9x2ISzItfdUuF9nxwS5S3I2Db0r5LWOgjzmVJRB
	rvVfaOuGYzxLtjvHOPejvULzlXZpwcnOMLJNpysKTMWFEeB+joQ88FPJiudULsGDkBTbKFyGlRX
	EQkxZGBD9PevEn+19rMUjltRGkvMd9d59zeRvvq1AGVkLCc01iNWX2aXV6oVl5KbmjDzaALEOg=
	=
X-Received: by 2002:a05:6a00:7601:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-76ab306de54mr7689432b3a.23.1753940111388;
        Wed, 30 Jul 2025 22:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaifupYStAioKzSiqVhcYtVa3o7OtXWpuYLllgS30iPPMtdEGkyK/10qHMAwHvtNzs1loIUw==
X-Received: by 2002:a05:6a00:7601:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-76ab306de54mr7689405b3a.23.1753940110951;
        Wed, 30 Jul 2025 22:35:10 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd88dbsm559110b3a.103.2025.07.30.22.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 22:35:10 -0700 (PDT)
Message-ID: <473f7269-3852-64a0-8aa6-7299be0fc85f@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:05:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
 <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
 <34c52c88fd8fcbf68c453c1e94e4cd6294becff1.camel@linaro.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <34c52c88fd8fcbf68c453c1e94e4cd6294becff1.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688b0090 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JUEddJpOQUfTzmi4ydgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: X3n-y1n4uzMq5YobxamjJm6-i07hV2dC
X-Proofpoint-GUID: X3n-y1n4uzMq5YobxamjJm6-i07hV2dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAzNiBTYWx0ZWRfX+EUmqyuRhtm2
 6BXJg6X/E7fMkc5WoAIBLcAVZH7VNvJVtO1glBxv1AGxzHI6iCwchku7xdEvOIeUgrIDFa9VDnJ
 FE2T3jOU5cPpdvx2ekW4Gjx5LEVZMnrVXRLjvFsCTWkviHtvm6LW7QmDszHAsDWsJvBuON7aqmC
 Vxwtr4RntykSi7S6laOIkDnI5sbKl3rIBJeZ5kaWQDMSBOnyuM96H25SCj5ENUkcHIxA55eeQ93
 iAOr0KJo1t5eJMRfYXtwPN/qbfiujIJdmJScWN2MFw9AxIR8RYIYlKkZvrFJiM30SmExqHrJeZe
 Bv02NU6VMAv1BwiM5fpsHq4wRNv4nhQzYmM/0MTf58gxP2dNnBWcq25/8ARDaCGGZ39FzoYMAaH
 ieE9hcJHo+gQ0jCbraw7MLHeyp+DPQYvWHWE6i4HGXhRnJMnywTO8Su/17BMOMVKbXTVMkWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_223513_604520_A4B2B5A5 
X-CRM114-Status: GOOD (  45.04  )
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



On 7/30/2025 8:53 PM, André Draszik wrote:
> On Wed, 2025-07-30 at 18:33 +0530, Shivendra Pratap wrote:
>>
>>
>> On 7/30/2025 2:14 PM, André Draszik wrote:
>>> On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
>>>> SoC vendors have different types of resets which are controlled
>>>> through various hardware registers. For instance, Qualcomm SoC
>>>> may have a requirement that reboot with “bootloader” command
>>>> should reboot the device to bootloader flashing mode and reboot
>>>> with “edl” should reboot the device into Emergency flashing mode.
>>>> Setting up such reboots on Qualcomm devices can be inconsistent
>>>> across SoC platforms and may require setting different HW
>>>> registers, where some of these registers may not be accessible to
>>>> HLOS. These knobs evolve over product generations and require
>>>> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
>>>> reset which can help align this requirement. Add support for PSCI
>>>> SYSTEM_RESET2, vendor-specific resets and align the implementation
>>>> to allow user-space initiated reboots to trigger these resets.
>>>>
>>>> Introduce a late_initcall to register PSCI vendor-specific resets
>>>> as reboot modes. Implement a reboot-mode write function that sets
>>>> reset_type and cookie values during the reboot notifier callback.
>>>> Introduce a firmware-based call for SYSTEM_RESET2 vendor-specific
>>>> reset in the psci_sys_reset path, using reset_type and cookie if
>>>> supported by secure firmware.
>>>>
>>>> By using the above implementation, userspace will be able to issue
>>>> such resets using the reboot() system call with the "*arg"
>>>> parameter as a string based command. The commands can be defined
>>>> in PSCI device tree node as “reset-types” and are based on the
>>>> reboot-mode based commands.
>>>>
>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>> ---
>>>>  drivers/firmware/psci/Kconfig |  2 ++
>>>>  drivers/firmware/psci/psci.c  | 57 ++++++++++++++++++++++++++++++++++++++++++-
>>>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>>>> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
>>>> --- a/drivers/firmware/psci/Kconfig
>>>> +++ b/drivers/firmware/psci/Kconfig
>>>> @@ -1,6 +1,8 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>>  config ARM_PSCI_FW
>>>>  	bool
>>>> +	select POWER_RESET
>>>> +	select REBOOT_MODE
>>>>  
>>>>  config ARM_PSCI_CHECKER
>>>>  	bool "ARM PSCI checker"
>>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..e14bcdbec1750db8aa9297c8bcdb242f58cc420e 100644
>>>> --- a/drivers/firmware/psci/psci.c
>>>> +++ b/drivers/firmware/psci/psci.c
>>>> @@ -17,6 +17,7 @@
>>>>  #include <linux/printk.h>
>>>>  #include <linux/psci.h>
>>>>  #include <linux/reboot.h>
>>>> +#include <linux/reboot-mode.h>
>>>>  #include <linux/slab.h>
>>>>  #include <linux/suspend.h>
>>>>  
>>>> @@ -51,6 +52,14 @@ static int resident_cpu = -1;
>>>>  struct psci_operations psci_ops;
>>>>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>>>  
>>>> +struct psci_vendor_sysreset2 {
>>>> +	u32 reset_type;
>>>> +	u32 cookie;
>>>> +	bool valid;
>>>> +};
>>>> +
>>>> +static struct psci_vendor_sysreset2 vendor_reset;
>>>> +
>>>>  bool psci_tos_resident_on(int cpu)
>>>>  {
>>>>  	return cpu == resident_cpu;
>>>> @@ -309,7 +318,10 @@ static int get_set_conduit_method(const struct device_node *np)
>>>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>>>  			  void *data)
>>>>  {
>>>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>>> +	if (vendor_reset.valid && psci_system_reset2_supported) {
>>>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
>>>> +			       vendor_reset.cookie, 0);
>>>> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>>>  	    psci_system_reset2_supported) {
>>>>  		/*
>>>>  		 * reset_type[31] = 0 (architectural)
>>>
>>> I don't know the PSCI spec, but it looks like with this code it's not
>>> possible to set a reboot mode (in DT) and at the same time instruct
>>> the firmware whether a warm or a cold reboot was requested.
>>
>> The code added in this patch is kind of dead, until vendor_reset.valid is set to true.
>> It can be true, only when both below conditions are true.
>>  1. A SoC DT defines a psci->reboot-mode command say - "bootloader".
>>  2. reboot sys call is issued using LINUX_REBOOT_CMD_RESTART2 and the arg* as "bootloader".
>>       reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_RESTART2, "bootloader");
>>
>> With that in place, warm and cold reboot just work same as before until above conditions are true.
>> There is no effect on regular reboots or the reboots with a "command" which is not defined in
>> psci->reboot-mode DT.
>>
>> Now lets take a case below, where a SoC vendor wants a combination of psci->reboo-mode command and
>> warm/cold to work in combination. For ex. a requirement below:
>>  - reboot command say - "bootlaoder" should do a cold reboot along with some extra HW reg writes.
>>  - reboot command say - "edl" should do a warm reboot along with some extra HW reg writes.
>>
>> 1. For this, both commands will be defined in the psci->reboot-mode DT Node with the arguments that
>>    are defined and supported by the firmware.
>> 2. Further, such requirement will now be taken care by the underlying firmware that supports
>>    PSCI vendor-specific reset. When we call into firmware with vendor specific reset arguments,
>>    firmware will take care of the defined HW writes and warm/cold reset as per the mapping of the
>>    defined arguments. Firmware and the Linux kernel here are in agreement for executing the
>>    vendor-specific resets.
> 
> So that means
> 
>     echo warm > /sys/kernel/reboot/mode
>     reboot bootloader
> 
> and
> 
>     echo cold > /sys/kernel/reboot/mode
>     reboot bootloader
> 
> can not be distinguished.
> 
> The firmware can not know whether or not cold or warm reboot was
> requested in this case by the user.
> 
> More importantly, if e.g. an OOPS / panic happens after the reboot
> notifier has run (and set vendor_reset.valid because a reboot mode
> was requested), a panic handler changing reboot_mode to warm to
> retain RAM contents will have no effect, because the the original
> code above making those distinctions can not be reached anymore.
> 
> Above scenario with OOPS / panic after reboot notifier could e.g.
> happen as part of device_shutdown() - see kernel_shutdown_prepare()

We can handle the panic path by adding a panic_notifier in psci
and make vendor_reset.valid = false. Do you think adding this can clear
the panic scenario above or there can still be some leak?

thanks.

> 
> 
>>>
>>> Doing warm reboot is useful if e.g. RAM contents needs to be retained
>>> for crash recovery handling, or other reasons, while in normal cases
>>> doing a more secure cold reboot.
>>>
>>> On the other hand, of course it's useful to be able to specify the
>>> reboot target for normal reboots.
>>>
>>> Is this a problem with the PSCI spec or with this specific change
>>> geared at the Qcom implementation?
>>
>> SoC vendor should define a vendor-specific reset in psci DT only when they support them in their
>> firmware. 
>>
>> Do we still think we are breaking anything in the spec or in the warm or the cold
>> reset path? If so can we discuss such use-cases?
> 
> I don't know the spec, but see examples above.
> 
> Cheers,
> Andre'


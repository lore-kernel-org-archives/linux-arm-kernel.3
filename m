Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F833C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkI3WQWbywiMbx9yHKEjkAeAkd4dqWhZHzhHA1MpbUc=; b=mbaXEI/szXXDcLu+I/SLDogPAX
	aqzg1Rae0L5vMPQUIrMl5nRO1PGk2bJnDet970avfTSCAYid9EIIMf0YBSXFKyIMZVeC4yQ7K/prx
	S+15jvrHORRb4T5OK/TGbltZfsHH8W3g1sD1JwEmPyki4lozrHHpZv/ytfkmqcl/X4JIIKHfrXp0w
	Cnv5jxMItKF2656cBOyatl4qSbgVNazWKebqaQrl5DutnvAa9g7ZDlGC1VJrdmQZQHwKn2Z330vmX
	RKByDBuKBEaeOqH6z8Y3WUKNGqsx5JuxD8ra25JRA9vCtQlZn+Wo6gZtHIrVG8Pl6zFx0dVgt65Rj
	uOC/gTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6aS-00000001Z1G-2Y2p;
	Wed, 30 Jul 2025 13:11:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6T9-00000001Y4c-2WFR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:03:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbucO007273
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 13:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkI3WQWbywiMbx9yHKEjkAeAkd4dqWhZHzhHA1MpbUc=; b=ac6+sWuVIk66bbmw
	+1wNn2vLJNkhWxYNALy2HU7n8y3t3/O4RRpaz8tE5maqxeJ8RY0JVT8t4H9Lo6h1
	BUAx8UKlUvmJJpcUJGzdIO/03PrAgJKXDOdbG4jPVonCLE0BkRay1AmQoKXd+C4o
	hCxkY7cExrTlC5GnXPJRBtuisMq5IeUUWIFcRtrspDxnhahujp0DWyRXEIMFYOJW
	7rcFa27cDDheKyAN/2aMz1CGGiv1l3lxN0IP2NZPzDPar2RTyveoJjiy0zWZhOO4
	W0MgDtSC9l8HpWQ8lyetBHPQovYQXZsPanPEDjs2wRE1g9HYnmRasZK9rYtTNYrH
	kydUwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwg85t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 13:03:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-240607653f4so16882565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 06:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880620; x=1754485420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkI3WQWbywiMbx9yHKEjkAeAkd4dqWhZHzhHA1MpbUc=;
        b=PPnH6sw6U/STHROE6PJkIDq7wMcOnm8T3l1fGtjmb95QamSK/sVvwc9TYqJzFk0OOK
         aB3iO6d6H+uUdZqfJ3sVJGeNUrXu5NDt5L8c5pr9ar2bf246Nj74c7m3QnD9ZuvccsAD
         TP3iOBWvguQBvaXRJdRzmF74fdc7+TnN7NbGazkvc6691/xBDRfMVpYxiomlRsS1lLSb
         H2ug96Rq0vawOlur3fy8H3PDcZ+hsj3HCYS8m8584SWK0F9/zVGQSKKXmZaUTqNiJPl1
         jiqJhmPnJa3aUyFaPWvphA1pcNwu/t6f7/naBCH7X5ACxXH606i2omAnHJYK9AeqDify
         6SNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIio2QNQyt9CJ/EbxVgEak8r48ScjcedWi14PmMoW3ULYvz73jqSqhVXRCqD93elBLDU9kQx3+wUGRrjYL3Bt4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj+irKkhrESijDmlJrX9vZaVbyVLhyLWaC/sxO+wGNb1qasB/i
	I9WJ1xEGzD6Lp8QJVuQqP0GGVwzc0lwDRczpfMEE10ggJaghKnrSMKbHCtl65YgWBI831dWaVy3
	my5N6c0zoB5tO/gu++DUiTAvAjwlQTz7efMP+/lv2S8PoM4VZPFDg7/7VkiStt53BWF86bZ2nbP
	2eHA==
X-Gm-Gg: ASbGncuumw6eL8LW5a0Es86SKFOgTA3rkshBT23v4SSi2eErz10rzbt3lOitstqV1Yn
	QoQtYUrtKqeCkRj0XW5z+ZKZoV8wFIBmuX5zpTh4vYxLam1RobOg+sjAFteMd2+VO9z+LwDNxuD
	M9M4p2ZFDfkptrA60CUHPxdtX44nZDcA5xMaBF5dgFaEerGRPTA9CUmW7lw8cYV71L2Dh19Tp1l
	BQqSnQx5DIBKJCOq40cf2NVJe2G+KSxmzwgtq64JdSGtMAle1y8k2rLM+3KmJthM+OMnrkdoa/V
	juiQ69yqEkTsoW95OrIfI+P2AGCnzUbbL8Yea993bZDUWX2WBB0YYvJU2MP2+SsI3hcg5K2zWg=
	=
X-Received: by 2002:a17:902:e5cb:b0:23f:df56:c74c with SMTP id d9443c01a7336-24096ade845mr42859735ad.14.1753880620310;
        Wed, 30 Jul 2025 06:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNUn1eUO9r0CsK9snk8Amv0Q5O2izLQsu4h9m62zFXz39lSAwZnmqj49t0viIaY9A0s5Gjxw==
X-Received: by 2002:a17:902:e5cb:b0:23f:df56:c74c with SMTP id d9443c01a7336-24096ade845mr42859175ad.14.1753880619783;
        Wed, 30 Jul 2025 06:03:39 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2403ed55780sm62154095ad.166.2025.07.30.06.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:03:39 -0700 (PDT)
Message-ID: <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 18:33:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
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
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688a182d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dOR7WsgJQ9bLIEUHlCUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: tgq2lUKSmkTyWx0x6CAfUrm-SfBSaeph
X-Proofpoint-GUID: tgq2lUKSmkTyWx0x6CAfUrm-SfBSaeph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfX9eEJov/wrs5/
 KHXNIkfn9zO2leLfTLEn4fQcnCy7peWG/OpNXU+uOoQypHoGMSiyvBaP7Sf8hl+a+4RodD7Liqx
 LqA87gODMlJ5pvOJeyIA2PoCQReF+GvdHcd7X43ka8navY9D8+W97mMhIBf3KJ1sT7UZMEPnDlz
 eRG93OsJoSjX9wPu196SmmmaS1IofiqXsilRT9PdrBOW2ShwCdEt86qq3hKYo3+K1g1k87sXmEl
 dXak3LPFK3xqxWKNqtBzZRljoVgpigndQh+Wj0u2puvh7s7nwxjmEs/JH1GGmeD76Blab8p2Vbh
 zbinELxHH2FMaCR653Mm32rdxvfp93cDJklkeQztfYwjvUrQP269poBZB/jiFpCYCN10ZFA8qVb
 Bp8rWRHlNflUO6R5RQHyO8cZQvixFFz2aF+7Cm49kG0AOkjTCLNgUyb8+p/q6Fjf61OQc3/T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_060343_650747_CF3022C5 
X-CRM114-Status: GOOD (  44.88  )
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



On 7/30/2025 2:14 PM, André Draszik wrote:
> On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
>> SoC vendors have different types of resets which are controlled
>> through various hardware registers. For instance, Qualcomm SoC
>> may have a requirement that reboot with “bootloader” command
>> should reboot the device to bootloader flashing mode and reboot
>> with “edl” should reboot the device into Emergency flashing mode.
>> Setting up such reboots on Qualcomm devices can be inconsistent
>> across SoC platforms and may require setting different HW
>> registers, where some of these registers may not be accessible to
>> HLOS. These knobs evolve over product generations and require
>> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
>> reset which can help align this requirement. Add support for PSCI
>> SYSTEM_RESET2, vendor-specific resets and align the implementation
>> to allow user-space initiated reboots to trigger these resets.
>>
>> Introduce a late_initcall to register PSCI vendor-specific resets
>> as reboot modes. Implement a reboot-mode write function that sets
>> reset_type and cookie values during the reboot notifier callback.
>> Introduce a firmware-based call for SYSTEM_RESET2 vendor-specific
>> reset in the psci_sys_reset path, using reset_type and cookie if
>> supported by secure firmware.
>>
>> By using the above implementation, userspace will be able to issue
>> such resets using the reboot() system call with the "*arg"
>> parameter as a string based command. The commands can be defined
>> in PSCI device tree node as “reset-types” and are based on the
>> reboot-mode based commands.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/firmware/psci/Kconfig |  2 ++
>>  drivers/firmware/psci/psci.c  | 57 ++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -1,6 +1,8 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config ARM_PSCI_FW
>>  	bool
>> +	select POWER_RESET
>> +	select REBOOT_MODE
>>  
>>  config ARM_PSCI_CHECKER
>>  	bool "ARM PSCI checker"
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..e14bcdbec1750db8aa9297c8bcdb242f58cc420e 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/printk.h>
>>  #include <linux/psci.h>
>>  #include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>>  #include <linux/slab.h>
>>  #include <linux/suspend.h>
>>  
>> @@ -51,6 +52,14 @@ static int resident_cpu = -1;
>>  struct psci_operations psci_ops;
>>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>  
>> +struct psci_vendor_sysreset2 {
>> +	u32 reset_type;
>> +	u32 cookie;
>> +	bool valid;
>> +};
>> +
>> +static struct psci_vendor_sysreset2 vendor_reset;
>> +
>>  bool psci_tos_resident_on(int cpu)
>>  {
>>  	return cpu == resident_cpu;
>> @@ -309,7 +318,10 @@ static int get_set_conduit_method(const struct device_node *np)
>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>  			  void *data)
>>  {
>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +	if (vendor_reset.valid && psci_system_reset2_supported) {
>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
>> +			       vendor_reset.cookie, 0);
>> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>  	    psci_system_reset2_supported) {
>>  		/*
>>  		 * reset_type[31] = 0 (architectural)
> 
> I don't know the PSCI spec, but it looks like with this code it's not
> possible to set a reboot mode (in DT) and at the same time instruct
> the firmware whether a warm or a cold reboot was requested.

The code added in this patch is kind of dead, until vendor_reset.valid is set to true.
It can be true, only when both below conditions are true.
 1. A SoC DT defines a psci->reboot-mode command say - "bootloader".
 2. reboot sys call is issued using LINUX_REBOOT_CMD_RESTART2 and the arg* as "bootloader".
      reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_RESTART2, "bootloader");

With that in place, warm and cold reboot just work same as before until above conditions are true.
There is no effect on regular reboots or the reboots with a "command" which is not defined in
psci->reboot-mode DT.

Now lets take a case below, where a SoC vendor wants a combination of psci->reboo-mode command and
warm/cold to work in combination. For ex. a requirement below:
 - reboot command say - "bootlaoder" should do a cold reboot along with some extra HW reg writes.
 - reboot command say - "edl" should do a warm reboot along with some extra HW reg writes.

1. For this, both commands will be defined in the psci->reboot-mode DT Node with the arguments that
   are defined and supported by the firmware.
2. Further, such requirement will now be taken care by the underlying firmware that supports
   PSCI vendor-specific reset. When we call into firmware with vendor specific reset arguments,
   firmware will take care of the defined HW writes and warm/cold reset as per the mapping of the
   defined arguments. Firmware and the Linux kernel here are in agreement for executing the
   vendor-specific resets.

> 
> Doing warm reboot is useful if e.g. RAM contents needs to be retained
> for crash recovery handling, or other reasons, while in normal cases
> doing a more secure cold reboot.
> 
> On the other hand, of course it's useful to be able to specify the
> reboot target for normal reboots.
> 
> Is this a problem with the PSCI spec or with this specific change
> geared at the Qcom implementation?

SoC vendor should define a vendor-specific reset in psci DT only when they support them in their
firmware. 

Do we still think we are breaking anything in the spec or in the warm or the cold
reset path? If so can we discuss such use-cases?

> 
> 
>> @@ -547,6 +559,49 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>>  	.enter          = psci_system_suspend_enter,
>>  };
>>  
>> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
>> +{
>> +	u32 magic_32;
>> +
>> +	if (psci_system_reset2_supported) {
>> +		magic_32 = magic & 0xFFFFFFFF;
> 
> I believe usual kernel style is to use lower case for
> hex values.

Sure, will make it lower case.

> 
>> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
>> +		vendor_reset.cookie = (magic >> 32) & 0xFFFFFFFF;
> 
> dito.

Ack.

thanks.

> 
> Cheers,
> Andre'
> 
>> +		vendor_reset.valid = true;
>> +	}
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	np = of_find_node_by_path("/psci/reboot-mode");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot) {
>> +		of_node_put(np);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	reboot->write = psci_set_vendor_sys_reset2;
>> +
>> +	ret = reboot_mode_register(reboot, np, "psci");
>> +	if (ret) {
>> +		of_node_put(np);
>> +		kfree(reboot);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +late_initcall(psci_init_vendor_reset)
>> +
>>  static void __init psci_init_system_reset2(void)
>>  {
>>  	int ret;


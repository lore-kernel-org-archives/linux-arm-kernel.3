Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBECC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v+KOlxVQQuHrXP2BzwGqdrb5703hR1R+qZ3XSvsTjw=; b=FzQNphLwDXU5V90AMyIUHKJA5P
	f3qluk91VfUp/ez/HTrQmtYongylq4p6uMli6PXRQrIPXOLfFTubuyZ1Vxzcr+JP+0l+gyF8WB9a5
	x5vqqMOh5SUVCJrYMrBwyXSox037ux8DqXYIq4ZA2PozTAhsSPbG8pqKvN4cMmCE6MFMF1YUHZmy1
	lGHRVjjh2C4sXZjS6M1rSxHUhK/Sdewen8LUJfslWRVimK992swA/x+R2wg1Y78QeHmEf0APIBHAU
	F0CbWFJSA76yAQwk6WhSCnlxNE9RN2yuSa5iZC/6fCiQacpKjMmY3uvQVX23Mm5EF8CKZLDW9010N
	eHfziKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwdU-0000000CmOB-2yz4;
	Thu, 10 Jul 2025 19:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuDy-0000000CSv2-1wFg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:34:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A96j9k031763
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7v+KOlxVQQuHrXP2BzwGqdrb5703hR1R+qZ3XSvsTjw=; b=TiuGIBY+SnjWlHzr
	SpwydSFznLuBhG8LBEgO1Ue0EtJ5+OYdCJkHMLN7KKjO64vG2Wx3zbblqK3noMpe
	JuDBJwojNhChgZKqIAh9XHREznOLHrFR3uBoX/3evqqAbfQqIB04NyJ/UDz8y7N7
	I33HJaPPCrLugdSyTnjHY7HgafayqwwgytzWaksUwV/TtnszfXmhFyAk2RJqfXiB
	/FQ80qAZJXSaz31ewu3sPKRQ2Uf6O9JEakaaJMVu3z/vDErDw85jYG7qmDn/MXuv
	xUepfDi9U4e4Xuw5gBxlYnuEjy+vXCRY7Amsf8KDJJRMUadsUY6uVGbFFKGzncro
	C8Ls3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7r09p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:34:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so8954645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165257; x=1752770057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7v+KOlxVQQuHrXP2BzwGqdrb5703hR1R+qZ3XSvsTjw=;
        b=CPuxb+dk871Q8o3HDTuCwmO0x/e9EwPSgqJOOZUihkrynLxZQ1f3IjqQnZzlTLWUIf
         LSk7YjQ1yzMB8vp3qSuN43ZEOGkbJ8wlZk2uhtB4xlrzcUa0os7yG4V9Xh3V13DmUhCH
         6F5opgMs5ey71h38Dl2sShQqLcpN0Qa4GnO+3HCXRNJzUlucLUIrQh5v6dB+0fbeIXNz
         TJrMFq3fzEvhbtqd7OEhsNpsI2V9l4i8Z3ib0nQlIy1iCw4GVLFuvlTrVrCTjIVZyrnw
         SUqFZVJ4Lrj6oMgbTt1Jd+dpN+any5na469aIZ14ulA/Out4sQx4rUvQrYqg9FQqNfy3
         rArw==
X-Forwarded-Encrypted: i=1; AJvYcCVNz+EmyjusqTq1PIjbZGVX6v2zCXb5RE5Cpgt3AKLQ2OudB8jgMy1Hvypi+GRRj1y4XxtKPxizRG9Es8Xd8uO5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81vGS/XWuNGa3Rhuur7fsrHfFbYNYRcI9QU1f6UQhCmc7VmtI
	1htqKYUTG5hP8oydfXDhpIySmoObYnlCDlLB0awufNTUvZ25ojII3qPkdjH0+qE8313RJpr+YC9
	8IvIKlEKPgP0BEOmoKeP8CJ4vt6P25DMa3oN0TeVaeBA1pI6uHNBZeOUNvrR0lPcB3mQQxjeHht
	AncQ==
X-Gm-Gg: ASbGncs7e97Xh3WL5Nf5UlR9rZBDFfayaktaHrKxTE63lb6QdJeBtZMHPQjMMps3xm+
	J7VOc5Clru9s4wPT/3eLridIvO/jgmJ44H78DE+Sefqg/W1wPTHVJStGNxzWpUdXYfe6jF2vqQj
	16Yiov6Y9dDaxcsddGAxIg8ENfFWvl0jZcj7jeeDKtw7MvcKg/RiVzL2J7TOSP9rV6OSkF6BuSP
	nX/A8z2aMIy1fKl/I4Re6PZ+c4lUx/1wMmSVlbc6faFy5ePIlo5gKxiXvlsMVs0vLJu8ZuyouDf
	4rmNQnAdSNJfXPDNHe7v8EB9TGwsrIUs2xtDaoGQ+NOMvMWh1aPb+EVi
X-Received: by 2002:a17:903:240a:b0:23c:8f21:ac59 with SMTP id d9443c01a7336-23de4870255mr58912635ad.29.1752165256707;
        Thu, 10 Jul 2025 09:34:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB4rnPjqJKSrNHIQvF405YfcZfT/Y4T9Mez0G2+iXfOjNPRdQpTDwA1RKIVvdQzWG4WI0fXg==
X-Received: by 2002:a17:903:240a:b0:23c:8f21:ac59 with SMTP id d9443c01a7336-23de4870255mr58912015ad.29.1752165256183;
        Thu, 10 Jul 2025 09:34:16 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm24645205ad.240.2025.07.10.09.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:34:14 -0700 (PDT)
Message-ID: <62cd2efe-2a82-72b0-c4e0-df8a0d8fcfe4@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:04:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 05/10] firmware: psci: Implement vendor-specific
 reset-types as reboot-mode
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-5-b2d3b882be85@oss.qualcomm.com>
 <4ca0df4e-7697-4cfe-ada4-6eee8224938f@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <4ca0df4e-7697-4cfe-ada4-6eee8224938f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MSBTYWx0ZWRfXyUPBeZ9T8T2f
 Ti0QlIpwBOxKNjZReJIVmkuYegn+JLmyc9ZnyIGV7M6Az47PmdgijtQqHQOCFOIGtG5r58xGavw
 FXU0OG7K0evpfzs3cvqymhqaohUSpof9AzgIcirxog7uy2ThQbRZfLwiST7yuh8Brd0snyuf/7r
 GiAzx5/6oLWmvBNYFFKbt+B/MXSkyq8DQ6E0Z3YOnkH7ZvLRhSEBYBqtqbrCs+6bd/gkVrEymJY
 Sbp3mnd8UQB5QkCgok9HbydTQegOWPRwIc9jjpjjutuFeWS+Cn5KcUkdqPAFdhvV+HVA8NGNmqa
 +sUihbyK6w62sia8GvV56GHjFLAXM5HOQH8OY/79P4yF/K6XBnKnn7JczfScSYo2Rte/d6tp/In
 EDDcAhVG5Ie72q5yjTvnBQ0ED21JZ2rp01r8iZEB+1ywFn8iI0GF3BRoEI1778PtOBsS/SXm
X-Proofpoint-GUID: f2K8ERzqp2SVRqYjCobwrbMI65vZRDon
X-Proofpoint-ORIG-GUID: f2K8ERzqp2SVRqYjCobwrbMI65vZRDon
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686feb89 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IRR_k5T4b-fJqLONmWgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_093418_504659_2636B111 
X-CRM114-Status: GOOD (  30.61  )
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



On 7/10/2025 9:15 PM, Konrad Dybcio wrote:
> On 7/10/25 11:15 AM, Shivendra Pratap wrote:
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
>> as reboot-mode arguments like reset_type and cookie. For a SoC
>> where, PSCI vendor-specific system_reset2 is supported, the
>> appropriate value gets filled to reset_type and cookie during
>> this reboot-mode hook registration. If the secure firmware
>> supports PSCI system_reset2, restart notifier will make secure
>> call to trigger appropriate requested reset type.
>>
>> By using the above implementation, usespace will be able to issue
>> such resets using the reboot() system call with the "*arg"
>> parameter as a string based command. The commands can be defined
>> in PSCI device tree node as “reset-types” and are based on the
>> reboot-mode based commands.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/firmware/psci/Kconfig |  1 +
>>  drivers/firmware/psci/psci.c  | 53 ++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..9d65fe7b06a6429de8a26d06f9384e5c93f36e5f 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -1,6 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config ARM_PSCI_FW
>>  	bool
>> +	select REBOOT_MODE
>>  
>>  config ARM_PSCI_CHECKER
>>  	bool "ARM PSCI checker"
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..87293f78ed83eb33ba67ded73728729811693ea3 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -13,10 +13,13 @@
>>  #include <linux/errno.h>
>>  #include <linux/linkage.h>
>>  #include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>>  #include <linux/pm.h>
>>  #include <linux/printk.h>
>>  #include <linux/psci.h>
>>  #include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>>  #include <linux/slab.h>
>>  #include <linux/suspend.h>
>>  
>> @@ -51,6 +54,14 @@ static int resident_cpu = -1;
>>  struct psci_operations psci_ops;
>>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>  
>> +struct psci_vendor_sysreset2 {
>> +	u32 reset_type;
>> +	u32 cookie;
>> +	bool valid;
>> +};
>> +
>> +static struct psci_vendor_sysreset2 vendor_reset;
>> +
>>  bool psci_tos_resident_on(int cpu)
>>  {
>>  	return cpu == resident_cpu;
>> @@ -309,7 +320,14 @@ static int get_set_conduit_method(const struct device_node *np)
>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>  			  void *data)
>>  {
>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +	if (vendor_reset.valid && psci_system_reset2_supported) {
>> +		/*
>> +		 * if vendor_reset.valid is true call sys reset2 with
>> +		 * the vendor_reset(reset_type and cookie).
>> +		 */
> 
> This comment repeats the line above and below it without
> bringing additional value
Ack. will remove or modify the comment to make more sense.
thanks.
> 
> Konrad
> 
>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
>> +			       vendor_reset.cookie, 0);
>> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>  	    psci_system_reset2_supported) {
>>  		/*
>>  		 * reset_type[31] = 0 (architectural)
>> @@ -547,6 +565,39 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>>  	.enter          = psci_system_suspend_enter,
>>  };
>>  
>> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot,
>> +				      u32 reset_type, u32 cookie)
>> +{
>> +	if (psci_system_reset2_supported) {
>> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | reset_type;
>> +		vendor_reset.cookie = cookie;
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
>> +
>> +	np = of_find_node_by_name(NULL, "reset-types");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot) {
>> +		of_node_put(np);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	reboot->write_with_cookie = psci_set_vendor_sys_reset2;
>> +
>> +	return reboot_mode_register(reboot, np);
>> +}
>> +late_initcall(psci_init_vendor_reset)
>> +
>>  static void __init psci_init_system_reset2(void)
>>  {
>>  	int ret;
>>


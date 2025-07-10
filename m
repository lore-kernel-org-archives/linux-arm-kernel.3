Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC653C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ncm63/MfiuPbDjDVklTQd8+kupDoVzcsE+k6jeIleo=; b=l1QL/nIT/UkcUlOR9hrphBLCIk
	Fy0HFs9DWbXd7ZVX+O9vamVuPKheaoJ3sklJkBGjPLhhaTIMqwMcl4wtp8tW8gJUCEAlPJAkJTwZc
	FFJFwSpL02gKtPFM0g0en7YGMOM+yVEvw7WZVo+5u8cJKAZNZp4GMWaqLQibL7BpKWbosUiSoDGUG
	mcWd2xyj3cwo1UhPwodg6XifPRJxZ3xskIDfPAVlentn/6qw19OC4KXk/ajPh8wCicShWCkX8a0v5
	aJayYQx0XbUvSKZqW1EcowQHzqbpvu6tGe6nMCvLZ9NnVajs2iXSJjnIJGpMSDZwBbyD9jQCMAaID
	SmdVlfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvKl-0000000Ccey-2JZr;
	Thu, 10 Jul 2025 17:45:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtSd-0000000CIPh-0I4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:45:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9UNTX013096
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 15:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ncm63/MfiuPbDjDVklTQd8+kupDoVzcsE+k6jeIleo=; b=KnNb1FX5hzQYi1xI
	zA7Uh98UKUkyt/1X3LPA+iboHhUo60Q8NsuQ+j/+pYe+V7qm/tdkojBRTi5GoUkX
	nPMaDQzL3Wy8yMmK8Bke6qmNICNdt+b+pJEo7gOKKm7moVknA276ngxWtJI9K7ux
	hadHKYaTyBxM3ndfT+EmJPJxL4KWJbITB/2JWZbHJK6k1zpzRYszhYf366yP7Q5+
	VLnfL+zNUfcmJk7YHDU4yqMlV+1NhXfhYElD9wD5zJ6gWVPTKY3rqFj8xjkk4Hhf
	2hUhXMgwOTO0cGdte45iIxSOpCdFB+1zryLDHG6KpNvv0jVVCJ9ouQgDdAd50ChW
	t9iZYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn904r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 15:45:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9e504faa6so681631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162318; x=1752767118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ncm63/MfiuPbDjDVklTQd8+kupDoVzcsE+k6jeIleo=;
        b=MxeOPTAFmXZA/DPT2o016Py2SA+Svf6tAo0D3DSP05vwM/QAV1gyyHgNjY/O2qWLuh
         P6ctj+wwxXf4sMfLX8XpFYErwwEQxWM+y/s1f085498jFKIM/dCDwwQR/6olCEn9lAVP
         MZueuMbxW5ob2m5FwQ7J1C1O2hthI0/mSRtxOhn6slTHKPzv91Tdlm8DkZuuQKyeL9HD
         bzNHcdeemSZoqc1mEBF7p1XEtAOlKmrCvxf4ja5CD8URfXH8fA6GEvxGY0PYmKdOgDqS
         q056urz3P6Z8LQVlT8TWeHN6JFd+lzP2QkSiAwUm8xFexYPgOD3fttnDceMK7HcJIEPv
         BVDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbHjdBskLryIjrzClDt/ZqBQ34nkTOE8J+BUy5mq2mRW/xcNzf+A2S7wVVpbeZoKncgLVmZ5KKnLS7nTmPRkeq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx252b+35AYQNTBfWrhT9VB4Ug6hm3sqOaHxm+qoV9jYzR+T0xU
	24Teyd4bp0HCjeEQtm5vPFR6mGAChtAxyl6rFrxdQlEZrECIrlM7FmiOXX9YQImZc7aR7lZJs/f
	H7wgygXBO4eE+0qrlQ6NIGu7GQzGHrXV6PbXo0hbZBLUpTFor/oPpX8jwf3KlfldYf5PzigEEEj
	mczg==
X-Gm-Gg: ASbGncvepTxHD7ez/aZzzYuh66h2FTt40dbrC9ZIzaSlF2FkYeD8GGBLP3kMOMxCI7c
	KB6F5ZxQ/jOQgCM4ruMTEODrNLzQ/n8pSmPryawnbi3d1vFD77cOufx1s2U+QKQmcZscpjBHp48
	kylALCyM1j0YHzktzRsH+djOenAPqCo/68az8K8m02QHA0jpBCr91Aw1Bo35TVrtppaCt1yxoBy
	KVc+XqUn93m24R59HK/ibItNODLWt3rSHCiWsOINohrNvqHTvUnVsb8O0u+Kmjzwk4tv7qBcBU7
	vuEycuUSUB6APKbDNnyeTr5mhvwghfEgsLh/2BVvnH/k1qYJsGSmK68v9I7MWul5tpQGJCcWQN2
	h/LA=
X-Received: by 2002:ac8:5e46:0:b0:4a9:f582:dc03 with SMTP id d75a77b69052e-4a9f582dfcemr10046581cf.9.1752162318045;
        Thu, 10 Jul 2025 08:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGMNtJ4drdObgcfuSdkFknAQN4Odw7/i1HjVhwWIis053P28UmmNK+qrTjCWD2/caZ4V7w5g==
X-Received: by 2002:ac8:5e46:0:b0:4a9:f582:dc03 with SMTP id d75a77b69052e-4a9f582dfcemr10046111cf.9.1752162317396;
        Thu, 10 Jul 2025 08:45:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee44basm152828266b.42.2025.07.10.08.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 08:45:16 -0700 (PDT)
Message-ID: <4ca0df4e-7697-4cfe-ada4-6eee8224938f@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 17:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] firmware: psci: Implement vendor-specific
 reset-types as reboot-mode
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-5-b2d3b882be85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fe012 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=GLYJuuS3cqMp142eAlYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Wxv4ePuOGKSOiqK50wU5zHqxMOhBVHiE
X-Proofpoint-ORIG-GUID: Wxv4ePuOGKSOiqK50wU5zHqxMOhBVHiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNiBTYWx0ZWRfX1y/dxDUHXw8W
 wOa2kcfO3oOpdVQsdJ1rWZ2YgdTBBRXecFeLyiqiCQSvPjg3oDTZ5d71RizzT6c1ysV3yOU0I7N
 lLXwJ6iNhmU6oKxOvSriXgDx7VBONj0+EB+G4oJqZkFw30BnOA/u11NexNx4tuF+M/CMbe9MhHB
 Mv1qXXvi43Gy2k100L7z6EARd+SsOLRkvRCVBgPin+C7DRbhtohntgorYoWJtwp8Y5m4NizzTqz
 4w6LSQGmRPN1pGCQROCTgeoBjInuws0w6uOdEQ94wvMcqsxN02xuXGL1lKDczrHPOSX/GCmxIxj
 YhQbMr/S+4t5L+b6f1nT4b6cL1MqYC0sSAJs0FQhrJ6RhZfJdp+ePZ4LK3lAk0lzxa1Y1lAiIwO
 9G/aKBamqS6+5b2sI7RXkpRoE45Oqs+aEWhxNcp6AA/HC12Qoc0LeaBHE+xEH0L+udxeQjS/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_084523_226772_43F4574E 
X-CRM114-Status: GOOD (  37.07  )
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

On 7/10/25 11:15 AM, Shivendra Pratap wrote:
> SoC vendors have different types of resets which are controlled
> through various hardware registers. For instance, Qualcomm SoC
> may have a requirement that reboot with “bootloader” command
> should reboot the device to bootloader flashing mode and reboot
> with “edl” should reboot the device into Emergency flashing mode.
> Setting up such reboots on Qualcomm devices can be inconsistent
> across SoC platforms and may require setting different HW
> registers, where some of these registers may not be accessible to
> HLOS. These knobs evolve over product generations and require
> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> reset which can help align this requirement. Add support for PSCI
> SYSTEM_RESET2, vendor-specific resets and align the implementation
> to allow user-space initiated reboots to trigger these resets.
> 
> Introduce a late_initcall to register PSCI vendor-specific resets
> as reboot-mode arguments like reset_type and cookie. For a SoC
> where, PSCI vendor-specific system_reset2 is supported, the
> appropriate value gets filled to reset_type and cookie during
> this reboot-mode hook registration. If the secure firmware
> supports PSCI system_reset2, restart notifier will make secure
> call to trigger appropriate requested reset type.
> 
> By using the above implementation, usespace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node as “reset-types” and are based on the
> reboot-mode based commands.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/Kconfig |  1 +
>  drivers/firmware/psci/psci.c  | 53 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..9d65fe7b06a6429de8a26d06f9384e5c93f36e5f 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config ARM_PSCI_FW
>  	bool
> +	select REBOOT_MODE
>  
>  config ARM_PSCI_CHECKER
>  	bool "ARM PSCI checker"
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..87293f78ed83eb33ba67ded73728729811693ea3 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -13,10 +13,13 @@
>  #include <linux/errno.h>
>  #include <linux/linkage.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/printk.h>
>  #include <linux/psci.h>
>  #include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  
> @@ -51,6 +54,14 @@ static int resident_cpu = -1;
>  struct psci_operations psci_ops;
>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>  
> +struct psci_vendor_sysreset2 {
> +	u32 reset_type;
> +	u32 cookie;
> +	bool valid;
> +};
> +
> +static struct psci_vendor_sysreset2 vendor_reset;
> +
>  bool psci_tos_resident_on(int cpu)
>  {
>  	return cpu == resident_cpu;
> @@ -309,7 +320,14 @@ static int get_set_conduit_method(const struct device_node *np)
>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>  			  void *data)
>  {
> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> +		/*
> +		 * if vendor_reset.valid is true call sys reset2 with
> +		 * the vendor_reset(reset_type and cookie).
> +		 */

This comment repeats the line above and below it without
bringing additional value

Konrad

> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
> +			       vendor_reset.cookie, 0);
> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {
>  		/*
>  		 * reset_type[31] = 0 (architectural)
> @@ -547,6 +565,39 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>  	.enter          = psci_system_suspend_enter,
>  };
>  
> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot,
> +				      u32 reset_type, u32 cookie)
> +{
> +	if (psci_system_reset2_supported) {
> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | reset_type;
> +		vendor_reset.cookie = cookie;
> +		vendor_reset.valid = true;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *np;
> +
> +	np = of_find_node_by_name(NULL, "reset-types");
> +	if (!np)
> +		return -ENODEV;
> +
> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		of_node_put(np);
> +		return -ENOMEM;
> +	}
> +
> +	reboot->write_with_cookie = psci_set_vendor_sys_reset2;
> +
> +	return reboot_mode_register(reboot, np);
> +}
> +late_initcall(psci_init_vendor_reset)
> +
>  static void __init psci_init_system_reset2(void)
>  {
>  	int ret;
> 


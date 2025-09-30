Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA06BCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+cYdN/Q52kS7p4GHmBZmzPjUkGPEpyNfvKUw3IGkUE=; b=V+gZyBXKah1s62yoYbcKtSAMHc
	3eslJapKb8qA0xIC9GVNLcQJprfjcgZ4J0wXvcnX++WetnO8Dgxgw765OyhiTwkhobldj0lmOi/7v
	ZFhKyhIMDPbT+liCaE4NY5S6fT44TQuZtrEg+Epzfmx0WQLJaU6XZsfSohXanVGfxo1IW3kYX0cpq
	Q70IgyGS6eNeU1aI/DPYB1TaLoVJZZl798871Ppc4omtuBIZA3Il+hcbdSSIbMEzDm/UkyyCxQYBD
	fK9t+JD1x95LpE6aD36+FoyMQnHvTMdsEKiAUSwF+de0fFoXPqczqW8FbzHMJVXpbRzDecvIsrZEh
	Cu6TkRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TBD-00000004Gpg-1oEv;
	Tue, 30 Sep 2025 05:45:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TBA-00000004GpG-1Fuk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:45:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOPb009314
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+cYdN/Q52kS7p4GHmBZmzPjUkGPEpyNfvKUw3IGkUE=; b=CJmIWjj+s+7hFNw8
	Dn0WwLij4xqCtAyGV+eWk/+XhZMFMVt0YVD5Bsk0FxEn7f4Pun4CWRacVh1pNWkH
	SWe4oAX/zdNtqdaNeM4hciVc1mS6OZv47F3aN+G215hiFGjObpkotSfRUVYGjzvM
	JZNIlbwL7sCJRBE9EC8ZXeckAsSB0qHzj6MW2rd28i7HFhGaAgx3al2Nyszzom9d
	iHnGCK5CIjoyA/HIgXrm4N7+Q0qHXu+L6m24QeWYme6aa6m2VzyHF9Y1dqP8iv0o
	XaC3sFSAuufM9LjA2A4/TpZT0b9HRYZkjkIhRWdJAaw/0EFN2zNbDaDgKn7IJmOr
	ltPOBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qhks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:45:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269880a7bd9so67389805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211134; x=1759815934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+cYdN/Q52kS7p4GHmBZmzPjUkGPEpyNfvKUw3IGkUE=;
        b=o9azh5GDm5lwPjQGVMqogzo2zioVyBRevx6q5i1VMYdNvmIAjcQv6DofFNf+G/3jjI
         cVltU48ph9Xp40z0ASr+4I4+qOlg4HC8OUvmt1gyFUaAgHINY+uF6/ZsGSziODf7+ToK
         B71gIrWnwqnnBoCZmpj8p6jMCb15yzk/j8AA9G69PwIY5vS5BLUn1mD6Ax8NcZibSVZf
         3lo45Xv98Iiblxyi5iAbHCwKQ9fLrwaFazeZMwximSCtfhOwKiKtKBYljxBUS35z2wiN
         x1Mdy1acxRoaSzGT1LwvrDXVAtkDG+wzK7jUA0Q3b1tMQLMX3kN/Qp8j0jF8BWZmnBE3
         UFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFn9QyQCwI76onvLh7daDHR4wMa529E4EaT9LARZQRJ5zFutAnMAlxzCbWrgUOQwV8NmUZgHDkmLHGFdXmnHkX@lists.infradead.org
X-Gm-Message-State: AOJu0YxOxZTDNO+ClzXKQKuFuXdfmlNGd2GtDJgsQYqrb9xtUNb33vKV
	nxt/gff5eS4pNN0vZ+36QDtPBrCr4Z14u56/na/Cz958nil4fXnicvKUC/RQaA6V0nZ6B+l6xO4
	8JuW0c8tXeMzKXJRX2cBzHdV0YAu/5iewfKsZfgOek3iNChXvRM9C/LtHINWdQli3ns6ZmMd5w/
	Oj6g==
X-Gm-Gg: ASbGncutS2QekMRB4RXir9HVqdNysSE41gCPVXlretxZ5X+a9UNWk/hMlHHuQsXyEH2
	8xiNICZd363dNOkToc5BgREtOcIOmJvSfEWxt+lXal5b8KwFZEGswxw45xNQnBfACR5hEidrmup
	yEuy3xSudCStc4ostZHA6gEFwUGjZXVWKBVqmai3Yjb8lGB8UAcr9vRJr62ZII2wB04OcJCiX2t
	g1Bm91P9rIkwgI8K4WQLHIcBJ1/rtm1F7wTkptf5T54BK/GJxuxYISt2mBBJbaVH/uE8x6AgTwM
	xVrl0HiR8e9P1ByM1zr4sDKF6XyvBVQxQw7aXz/sElVm3EIRt7Mti1TkybDB5U2knFRuRa8K558
	TA2p9DqAv83WhaA==
X-Received: by 2002:a17:903:19f0:b0:26c:e270:6dad with SMTP id d9443c01a7336-27ed4ae51c6mr177949175ad.60.1759211133839;
        Mon, 29 Sep 2025 22:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaNwtMS+L7JYb6fXEGvaAzNNfpnL39xLAuGz7lefMMjZVgnylqawU22M4IEG2k35nREeiThA==
X-Received: by 2002:a17:903:19f0:b0:26c:e270:6dad with SMTP id d9443c01a7336-27ed4ae51c6mr177948835ad.60.1759211133375;
        Mon, 29 Sep 2025 22:45:33 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm149919235ad.91.2025.09.29.22.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 22:45:32 -0700 (PDT)
Message-ID: <4276eeea-5877-4420-98da-a5f2eb5c0505@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:15:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
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
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3i7eqhabLfJMo__Nso_0pugM-OfMXDQ5
X-Proofpoint-ORIG-GUID: 3i7eqhabLfJMo__Nso_0pugM-OfMXDQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/UHZcWb7PnoF
 FerHe1WntRAnZZvigdBTmJA1rSup0k593is90NZ19QBq6xb0mAQK3U0MvgPsQSAjZuqDaJMO9a/
 pnHEemUBKjX+M9gjEcBdya28noiR5wt+y3ITRMcGdPCR/cZ/lxkMGd/nYacVQO2eixIiWVtE1pK
 5B3j7KMRoGlk5cvtoSKoRbHC46I4irgVXLNn8WT3h4Loly7O56WA9U/9rrnZH1asAFmSQD2DWbB
 SEocEsvzZ31xl1Kg0UGSyfFX8nHS+1Y6PSBE1RouksVcfq3zbWUOJgQTKLJ4HiFpfwx0PcTmsKR
 jH+ZKfxGP/09V7x1sCbSyPllnBslG3L/w7RJ4lB13Szb34Wen01CFEXolH+zfOtzH97xag7/pwv
 wTDpeUlzrbv30YRRCqWFjsfh5gj6zg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db6e7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=us_dTBczMLAT1r8_uQAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_224536_349318_3554EA6B 
X-CRM114-Status: GOOD (  39.71  )
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


On 9/22/2025 7:10 PM, Shivendra Pratap wrote:
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
> Implement the PSCI vendor-specific resets by registering to the
> reboot-mode framework. As psci init is done at early kernel init,
> reboot-mode registration cannot be done at the time of psci init.
> This is because reboot-mode creates a “reboot-mode” class for
> exposing sysfs, which can fail at early kernel init. To overcome
> this, introduce a late_initcall to register PSCI vendor-specific
> resets as reboot modes. Implement a reboot-mode write function
> that sets reset_type and cookie values during the reboot notifier
> callback.  Introduce a firmware-based call for SYSTEM_RESET2
> vendor-specific reset in the psci_sys_reset path, using
> reset_type and cookie if supported by secure firmware. Register a
> panic notifier and clear vendor_reset valid status during panic.
> This is needed for any kernel panic that occurs post
> reboot_notifiers.
>
> By using the above implementation, userspace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node under “reboot-mode” and are based on the
> reboot-mode based commands.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/firmware/psci/Kconfig |  2 +
>   drivers/firmware/psci/psci.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -1,6 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config ARM_PSCI_FW
>   	bool
> +	select POWER_RESET
> +	select REBOOT_MODE
>   
>   config ARM_PSCI_CHECKER
>   	bool "ARM PSCI checker"
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..40a27bc2cc3a3393acc14c7b2314155540ed06c9 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -13,10 +13,12 @@
>   #include <linux/errno.h>
>   #include <linux/linkage.h>
>   #include <linux/of.h>
> +#include <linux/panic_notifier.h>
>   #include <linux/pm.h>
>   #include <linux/printk.h>
>   #include <linux/psci.h>
>   #include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
>   #include <linux/slab.h>
>   #include <linux/suspend.h>
>   
> @@ -51,6 +53,24 @@ static int resident_cpu = -1;
>   struct psci_operations psci_ops;
>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>   
> +struct psci_vendor_sysreset2 {
> +	u32 reset_type;
> +	u32 cookie;
> +	bool valid;
> +};
> +
> +static struct psci_vendor_sysreset2 vendor_reset;
> +
> +static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
> +{
> +	vendor_reset.valid = false;
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block psci_panic_block = {
> +	.notifier_call = psci_panic_event
> +};
> +
>   bool psci_tos_resident_on(int cpu)
>   {
>   	return cpu == resident_cpu;
> @@ -309,7 +329,10 @@ static int get_set_conduit_method(const struct device_node *np)
>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>   			  void *data)
>   {
> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
> +			       vendor_reset.cookie, 0);
> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>   	    psci_system_reset2_supported) {
>   		/*
>   		 * reset_type[31] = 0 (architectural)
> @@ -547,6 +570,70 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>   	.enter          = psci_system_suspend_enter,
>   };
>   
> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	u32 magic_32;
> +
> +	if (psci_system_reset2_supported) {
> +		magic_32 = magic & 0xffffffff;
> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
> +		vendor_reset.cookie = (magic >> 32) & 0xffffffff;


Minor Nit: Can we use GENMASK(31, 0) instead of 0xffffffff? Apart from 
this, change LGTM. With that,

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


> +		vendor_reset.valid = true;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *psci_np;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!psci_system_reset2_supported)
> +		return -EINVAL;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +	if (!np) {
> +		of_node_put(psci_np);
> +		return -ENODEV;
> +	}
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
> +	if (ret)
> +		goto err_notifier;
> +
> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		ret = -ENOMEM;
> +		goto err_kzalloc;
> +	}
> +
> +	reboot->write = psci_set_vendor_sys_reset2;
> +	reboot->driver_name = "psci";
> +
> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
> +	if (ret)
> +		goto err_register;
> +
> +	return 0;
> +
> +err_register:
> +	kfree(reboot);
> +err_kzalloc:
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
> +err_notifier:
> +	of_node_put(psci_np);
> +	of_node_put(np);
> +	return ret;
> +}
> +late_initcall(psci_init_vendor_reset)
> +
>   static void __init psci_init_system_reset2(void)
>   {
>   	int ret;
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCB0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3c4sR4353DjBzDMx8m0ul/gY08rkAG038+aE+8dUNU=; b=ty1QOMfdzERHmh0S2/Xzh1IhJ9
	YB5mxf+u/hi9cPtuWPblYGnoogKjQQNYvXtvVvnTWo31YNF/usMeTQJofC+pFUGcYli/i4rCitX4v
	8fErV97yfRBz171N18EmRzSN+6DBf51GSEc0z8YAox5xECKAJ/ZB8DrZ/8H6enfCJmWuYy7pZ0FCy
	w+jhGOk6Vz7tvteWcmFdooyRN5iU8y24/5s5srcGNbizy9pgSZNy5o4vUiFcqcz7P7sxiQ45APmnw
	Z5MymQjlhSj/1pEYjJ+HYunoOtTSrzmCza+1NJN+RK38VYPIwU0g3vwgPhf3teljvtTilcRXfaqV6
	i/8uH69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVbo-00000005tZz-3OZw;
	Mon, 10 Nov 2025 17:23:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVbn-00000005tZt-1sho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84E62601B5;
	Mon, 10 Nov 2025 17:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F51BC116B1;
	Mon, 10 Nov 2025 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762795394;
	bh=WYTcByahqL1XJ5FT3lBhy0MI/HDkJwgwIwz+0jeqOm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQfdSfc0cfZHtzUJ9FIF2TJPMrgiis+AW5bqE72iUAr1kJTRaaPZbUtpwRp9k3Fg7
	 kaDy+FJn/cM1RWvxz80jjg/KfwXU4WVPC7cyBKmTISUBRh5fMuslJq2kDzqgp3s/1/
	 ZL0GbW3pDL2bXsP+aocNuYRsgHgV4GNIN4A4zduz9RMakhewq0lXbWn2KGyT3KCHoM
	 W2vqrLu1S2H0Zz4lIJqrVVANUtH9jRz2N0TIscjfYZk29tRsZM3j9SmEDlpEdxRwEv
	 ee73ebFLg9QXRkGag3O1kxh/sVnZ5dHp2DUn/ZDsisMa/2lA/xybzW4CeaY3SsB3V9
	 Uuwb4FSO7OR1g==
Date: Mon, 10 Nov 2025 18:22:59 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	John Stultz <john.stultz@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <aRIfc9iuC2b9DqI+@lpieralisi>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
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

On Sun, Nov 09, 2025 at 08:07:20PM +0530, Shivendra Pratap wrote:
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
> reboot-mode framework.

I think that we should expose to user space _all_ PSCI reset types,
cold, warm + vendor specific - as a departure from using the reboot_mode
variable (and possibly deprecate it - or at least stop using it).

> As psci init is done at early kernel init, reboot-mode registration cannot
> be done at the time of psci init.  This is because reboot-mode creates a
> “reboot-mode” class for exposing sysfs, which can fail at early kernel init.
> To overcome this, introduce a late_initcall to register PSCI vendor-specific
> resets as reboot modes. Implement a reboot-mode write function that sets
> reset_type and cookie values during the reboot notifier callback.  Introduce
> a firmware-based call for SYSTEM_RESET2 vendor-specific reset in the
> psci_sys_reset path, using reset_type and cookie if supported by secure
> firmware. Register a panic notifier and clear vendor_reset valid status
> during panic.  This is needed for any kernel panic that occurs post
> reboot_notifiers.

Is it because panic uses reboot_mode to determine the reset to issue ?

> By using the above implementation, userspace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node under “reboot-mode” and are based on the
> reboot-mode based commands.

IMHO - it would be nice if could add mode-cold (or mode-normal in reboot mode
speak) and mode-warm by default (if PSCI supports them) so that userspace
could issue those resets too without having to set the reboot_mode variable.

Reason is, since we are doing this it is worth going the whole nine
yards and try to decouple the reboot_mode variable from the RESTART2
syscall argument.

Reworded: just use the new userspace interface you are adding for
all PSCI reset types.

Thoughts very much welcome - I understand this is controversial.

> Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Reviewed-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/Kconfig |  2 +
>  drivers/firmware/psci/psci.c  | 92 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config ARM_PSCI_FW
>  	bool
> +	select POWER_RESET
> +	select REBOOT_MODE
>  
>  config ARM_PSCI_CHECKER
>  	bool "ARM PSCI checker"
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ff82e7f4c27d1609a75cedc3a9790affaf839801 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -8,15 +8,18 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/bitops.h>
>  #include <linux/cpuidle.h>
>  #include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/linkage.h>
>  #include <linux/of.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/pm.h>
>  #include <linux/printk.h>
>  #include <linux/psci.h>
>  #include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  
> @@ -51,6 +54,24 @@ static int resident_cpu = -1;
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

I think this should represent all possible PSCI reset types, not vendor only
and its value is set by the reboot mode framework.

> +
> +static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
> +{
> +	vendor_reset.valid = false;

I don't like this. Basically all you want this for is to make sure that
we don't override the reboot_mode variable.

One (hack) would consist in checking the reboot_mode variable here and
set the struct I mentioned above to the value represented in reboot_mode.

Good luck if reboot_mode == REBOOT_GPIO :-)

> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block psci_panic_block = {
> +	.notifier_call = psci_panic_event
> +};
> +
>  bool psci_tos_resident_on(int cpu)
>  {
>  	return cpu == resident_cpu;
> @@ -309,7 +330,10 @@ static int get_set_conduit_method(const struct device_node *np)
>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>  			  void *data)
>  {
> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
> +			       vendor_reset.cookie, 0);

See above. Two calls here: one for resets issued using the new userspace
interface you are adding and legacy below - no vendor vs reboot_mode, this
is a mess.

> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {
>  		/*
>  		 * reset_type[31] = 0 (architectural)
> @@ -547,6 +571,72 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>  	.enter          = psci_system_suspend_enter,
>  };
>  
> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	u32 magic_32;
> +
> +	if (psci_system_reset2_supported) {
> +		magic_32 = magic & GENMASK(31, 0);
> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
> +		vendor_reset.cookie = (magic >> 32) & GENMASK(31, 0);

Use FIELD_PREP/GET() please (but as mentioned above the vendor reset type
bit[31] should be part of the reboot mode magic value, see above).

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
> +	of_node_put(psci_np);
> +	of_node_put(np);
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

I don't like adding another initcall here.

I wonder whether this code belongs in a PSCI reboot mode driver, possibly a
faux device in a way similar to what we did for cpuidle-psci (that after all
is a consumer of PSCI_CPU_SUSPEND in a similar way as this code is a
PSCI_SYSTEM_RESET{2} consumer), that communicates with
drivers/firmware/psci/psci.c with the struct mentioned above.

Thanks,
Lorenzo

> +
>  static void __init psci_init_system_reset2(void)
>  {
>  	int ret;
> 
> -- 
> 2.34.1
> 


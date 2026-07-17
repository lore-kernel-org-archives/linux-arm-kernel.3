Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA51C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr4K9W4zSBp7ugvOioqjoC7LhcbtpeRE+OSsCxkaQ+8=; b=v+x45B7+uU8zjFQpMtIRnd5oOi
	3/SnCDrwMUsht8b0XJS6LJ/kbeySuPsdVT5RQmDKldIH15ASnqKFRan0y8E58vSmz7IljijFCNodK
	IqScw4EWLr+cnXwuu5TCAa0JbX8svsGpBSDb+KeD+QTblgYxegt5jTTK5Q+1FZr51hV8mg2wLLYMC
	4OBVs2WlsteKO510d88nhwLh/7fLx16CTJh8uPtQXLdALnll03NXlMroukflkwhDX3kliOh63rtsc
	QrO+i5IcXbkG9hiIwgYehnlZM9TArQ7VEhV/zbgAh5J0cVfWlYwZvm4npdVoWSuSVdBA855C31twh
	QtXUuj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeU5-00000001lsX-4BaQ;
	Fri, 17 Jul 2026 09:03:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeU4-00000001lsM-33M9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:03:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 384D9435DE;
	Fri, 17 Jul 2026 09:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E321F000E9;
	Fri, 17 Jul 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279032;
	bh=Jr4K9W4zSBp7ugvOioqjoC7LhcbtpeRE+OSsCxkaQ+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RFxL/kQnblkUczJjYXLKDe5WxvYNqWFZbROAYSYbTafjRDBjn+VyLJh+GUh4EmSUb
	 MXMnVtSAHj/pFuj3LvOSoo4cWjeTPsImzhgcWKMs19DZqJpU5fzNz16oOJJbcF9jbk
	 3DgxeREFu6AmVMBEKYVJgWGY9l455foLmUbgmgfWGA8rv7Fc0nCc7S7wH2g0HT7CLf
	 BrAUDyKhgCMIbrDRirv5WhxCvtVOmcTE1yPbuygmNCUaw8YjcvvQZbsQS2wApwcrK4
	 BmucM3XB/faseHnkTGifFXkI9SRaJb9wOzQYsJQaHffocWS+2I6qcoilJarEWGRWuC
	 EohxbJWufOdYQ==
Date: Fri, 17 Jul 2026 10:03:47 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <20260717-bipedal-courageous-alpaca-4fb54d@sudeepholla>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706134455.132091-3-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2026 at 03:44:42PM +0200, Andre Przywara wrote:
> From: Salman Nabi <salman.nabi@arm.com>
> 
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
> 
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
> 
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
> total 0
> --w-------    1 0        0             4096 Jan 19 11:33 activate
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
> --w-------    1 0        0             4096 Jan 19 11:33 cancel
> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
> grep: activate: Permission denied
> activation_capable:1
> activation_pending:1
> grep: cancel: Permission denied
> cpu_rendezvous:1
> current_version:0.0
> force_cpu_rendezvous:1
> may_reset_cpu:0
> name:TF-RMM
> pending_version:0.0
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
> [ 2825.797871] Arm LFA: firmware activation succeeded.
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
> ==========================================
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/firmware/smccc/Kconfig  |  10 +
>  drivers/firmware/smccc/Makefile |   1 +
>  drivers/firmware/smccc/lfa_fw.c | 725 ++++++++++++++++++++++++++++++++
>  drivers/firmware/smccc/smccc.c  |   5 +
>  include/linux/arm-smccc.h       |  15 +
>  5 files changed, 756 insertions(+)
>  create mode 100644 drivers/firmware/smccc/lfa_fw.c
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..7fd646d515f8 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -23,3 +23,13 @@ config ARM_SMCCC_SOC_ID
>  	help
>  	  Include support for the SoC bus on the ARM SMCCC firmware based
>  	  platforms providing some sysfs information about the SoC variant.
> +
> +config ARM_LFA
> +	tristate "Arm Live Firmware activation support"
> +	depends on HAVE_ARM_SMCCC_DISCOVERY && ARM64
> +	default y
> +	help
> +	  Include support for triggering a Live Firmware Activation (LFA),
> +	  which allows to upgrade certain firmware components without a reboot.
> +	  This is described in the Arm DEN0147 specification, and relies on
> +	  a firmware agent running in EL3.
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 68bbff1407b8..cddf2c460ab9 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>  #
>  obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
>  obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> new file mode 100644
> index 000000000000..b333b1e28c0d
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -0,0 +1,725 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Arm Limited
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/array_size.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/psci.h>
> +#include <linux/stop_machine.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +#include <linux/workqueue.h>
> +
> +#include <uapi/linux/psci.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "Arm LFA: " fmt
> +
> +/* CALL_AGAIN flags (returned by SMC) */
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
> +
> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		1
> +#define LFA_BUSY			2
> +#define LFA_AUTH_ERROR			3
> +#define LFA_NO_MEMORY			4
> +#define LFA_CRITICAL_ERROR		5
> +#define LFA_DEVICE_ERROR		6
> +#define LFA_WRONG_STATE			7
> +#define LFA_INVALID_PARAMETERS		8
> +#define LFA_COMPONENT_WRONG_STATE	9
> +#define LFA_INVALID_ADDRESS		10
> +#define LFA_ACTIVATION_FAILED		11
> +
> +/*
> + * Not error codes described by the spec, but used internally when
> + * PRIME/ACTIVATE calls return with the CALL_AGAIN bit set.
> + */
> +#define LFA_TIMED_OUT			32
> +#define LFA_CALL_AGAIN			33
> +

Why do you need this if it is purely internal in the driver ?
What is the guarantee that LFA spec doesn't use these in the future ?
It shouldn't be big problem, but I do expect things may get bit complicated
during transition to a firmware version may start using it.


> +#define LFA_ERROR_STRING(name) \
> +	[name] = #name
> +
> +static const char * const lfa_error_strings[] = {
> +	LFA_ERROR_STRING(LFA_SUCCESS),
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
> +	LFA_ERROR_STRING(LFA_BUSY),
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
> +};
> +
> +enum image_attr_names {
> +	LFA_ATTR_NAME,
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct fw_image {
> +	struct kobject kobj;
> +	const char *image_name;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +
> +static struct fw_image *kobj_to_fw_image(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct fw_image, kobj);
> +}
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",

This doesn't make any sense to me. Why do you want kernel to assign
some random name base on UUID. Userspace is well place to deal with
UUID and give it any fancy name it wants.

[...]

> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2e..956a5af96c70 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -304,6 +304,21 @@
>  			   ARM_SMCCC_OWNER_STANDARD,		\
>  			   0x53)
>  
> +/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */
> +#define ARM_SMCCC_LFA_FN_BASE					\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
> +			   ARM_SMCCC_SMC_64,			\
> +			   ARM_SMCCC_OWNER_STANDARD,		\
> +			   0x2e0)
> +#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))
> +#define ARM_SMCCC_LFA_GET_VERSION	ARM_SMCCC_LFA_FN(0)
> +#define ARM_SMCCC_LFA_CHECK_FEATURE	ARM_SMCCC_LFA_FN(1)
> +#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)
> +#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)
> +#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)
> +#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)
> +#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)
> +

Do you expect these to be used outside of the driver(for now atleast) ?
If not move it into the driver.

>  /*
>   * Return codes defined in ARM DEN 0070A
>   * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
> -- 
> 2.43.0
> 
> 

-- 
Regards,
Sudeep


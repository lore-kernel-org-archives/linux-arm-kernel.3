Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CC5D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqiOhoGDw+BPboSHxhPITnKVP3jEKyNGhR/jFsdZduU=; b=G0CHgYIzmKf4YXxwD33+QNLCGS
	Ke/qyVU/1008lKyW2cUdbjMMM1sowoJ3Xq/jEARfPr8aix/tkCS893PWXqQqDPeiVi+X8NLQVdlZp
	l7bsDGA7LgnuleetaQ58UvSlcTTiwefGA8GyFo45feDGCJiG/+2GIMtnuQgP9JBCkXel8MwqUqfNc
	ELm3QqvzgKfCMIDKbdSndcLnmVjuGgQSuEscLa5kLuMjvHltWyRjf996b8AzIsqWdtTONXCi5rkDl
	X+7w52aMuQPQJqYf2i+BTkioQbvGvCtaR3MOR5/g7HkOdlhJz+BS03+964A50dnxBiimoYe3G8n67
	LVuFDUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwCD-0000000ED44-2gKV;
	Tue, 09 Dec 2025 11:47:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwCA-0000000ED3Z-3rGe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 11:47:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A551691;
	Tue,  9 Dec 2025 03:47:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8D43F762;
	Tue,  9 Dec 2025 03:47:51 -0800 (PST)
Date: Tue, 9 Dec 2025 11:47:48 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>,
	<chao.gao@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Message-ID: <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208221319.1524888-5-vvidwans@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_034755_072910_0BA11BFB 
X-CRM114-Status: GOOD (  34.91  )
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

On Mon, Dec 08, 2025 at 10:13:14PM +0000, Vedashree Vidwans wrote:
> - Update driver to be in-built kernel module. This will ensure driver is
> installed in kernel and would not require any user intervention.
> - Register the LFA driver as a platform driver corresponding to
> 'armhf000' device. The driver will be invoked when the device is
> detected on a platform.
> - Add functionality to register LFA interrupt in the driver probe().
> This LFA IRQ number will be retrived from the LFA device node.
> - On IRQ, driver will query FW component details and trigger activation
> of capable and pending FW component. The driver will loop to update FW
> component details after every successful FW component activation.
> - Mutex synchronization is implemented to avoid concurrent LFA updates
> through interrupt and sysfs interfaces.
> 
> Device node snippet from LFA spec[1]:
> fwu0 {
>     compatible = "arm,armhf000";
>     memory-region = <&fwu_payload>;
>     interrupt-parent = <&ic>;
>     interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
> };
> 

This will be gone in the latest beta of LFA, so please discuss and get
an agreement for the LFA device tree bindings.

We don't just use ACPI HID as devicetree compatibles. There are more
aligned with ACPI CID IIUC but I don't expect you to use ACPI CID just to
match DT compatible as ACPI HID will be defined for LFA.

> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/Kconfig  |   3 +-
>  drivers/firmware/smccc/lfa_fw.c | 124 +++++++++++++++++++++++++++++++-
>  2 files changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 48b98c14f770..c21be43fbfed 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -25,8 +25,9 @@ config ARM_SMCCC_SOC_ID
>  	  platforms providing some sysfs information about the SoC variant.
>  
>  config ARM_LFA
> -	tristate "Arm Live Firmware activation support"
> +	bool "Arm Live Firmware activation support"
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
>  	help
>  	  Include support for triggering Live Firmware Activation, which
>  	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 0e420cefa260..24916fc53420 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -19,7 +19,12 @@
>  #include <linux/nmi.h>
>  #include <linux/ktime.h>
>  #include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
>  
> +#define DRIVER_NAME	"ARM_LFA"
>  #define LFA_ERROR_STRING(name) \
>  	[name] = #name
>  #undef pr_fmt
> @@ -129,6 +134,7 @@ static const struct fw_image_uuid {
>  };
>  
>  static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
>  
>  static int get_nr_lfa_components(void)
>  {
> @@ -374,17 +380,23 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
>  					 image_attrs[LFA_ATTR_ACTIVATE]);
>  	int ret;
>  
> +	if (!mutex_trylock(&lfa_lock)) {
> +		pr_err("Mutex locked, try again");
> +		return -EAGAIN;
> +	}
> +
>  	ret = activate_fw_image(attrs);
>  	if (ret) {
>  		pr_err("Firmware activation failed: %s\n",
>  			lfa_error_strings[-ret]);
> -
> +		mutex_unlock(&lfa_lock);
>  		return -ECANCELED;
>  	}
>  
>  	pr_info("Firmware activation succeeded\n");
>  
>  	/* TODO: refresh image flags here*/
> +	mutex_unlock(&lfa_lock);
>  	return count;
>  }
>  
> @@ -510,6 +522,106 @@ static int create_fw_images_tree(void)
>  	return 0;
>  }
>  
> +static irqreturn_t lfa_irq_thread(int irq, void *data)
> +{
> +	struct image_props *attrs = NULL;
> +	int ret;
> +	int num_of_components, curr_component;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * As per LFA spec, after activation of a component, the caller
> +	 * is expected to re-enumerate the component states (using
> +	 * LFA_GET_INFO then LFA_GET_INVENTORY).
> +	 * Hence we need an unconditional loop.
> +	 */
> +
> +	do {
> +		/* TODO: refresh image flags here */
> +		/* If refresh fails goto exit_unlock */
> +
> +		/* Initialize counters to track list traversal  */
> +		num_of_components = get_nr_lfa_components();
> +		curr_component = 0;
> +
> +		/* Execute PRIME and ACTIVATE for activable FW component */
> +		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +			curr_component++;
> +			if ((!attrs->activation_capable) || (!attrs->activation_pending)) {
> +				/* LFA not applicable for this FW component */
> +				continue;
> +			}
> +
> +			ret = activate_fw_image(attrs);
> +			if (ret) {
> +				pr_err("Firmware %s activation failed: %s\n",
> +					attrs->image_name, lfa_error_strings[-ret]);
> +				goto exit_unlock;
> +			}
> +
> +			pr_info("Firmware %s activation succeeded", attrs->image_name);
> +			/* Refresh FW component details */
> +			break;
> +		}
> +	} while (curr_component < num_of_components);
> +
> +	/* TODO: refresh image flags here */
> +	/* If refresh fails goto exit_unlock */
> +
> +exit_unlock:
> +	mutex_unlock(&lfa_lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init lfa_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	unsigned int irq;
> +
> +	err = platform_get_irq_byname_optional(pdev, "fw-store-updated-interrupt");

Nice, "fw-store-updated-interrupt" is not even mentioned in the example DT
node above, let alone proper DT bindings.

-- 
Regards,
Sudeep


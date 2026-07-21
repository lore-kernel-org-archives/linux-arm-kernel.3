Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F249C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDJLucVT4R47Wn7AWbEmW80xVYNcqomm0n8kCgC52XU=; b=lLGQvXwd1plc+ZBltxkTe/A+5v
	XKSmlY34xZuDneXOs9knpkse4+LatrHZkUXSM7p91q7b66ygvY3rzuqPyhhwadV/JWSEuv/Rdy/LI
	z83JTID1/OIdNJlnJDaYYkekriAh8dx1PhonUy74ywabV+598LcVm84ZmOOGCcIeXGwIC8V0UVBmv
	6f1ysVkYiLtAgmtUbS17xI5jtH8MUoWVTbmQ2njLNfM1Zq4j15cpXZZV89J5CYm2V4g/FrroJjm1D
	jbH/xnIwMQc+83NdN+ubidVi/U222JEpHYtgUwwVvx6Hj5V6yr4wZ9xLuSuxC6HsX3vZIh4IfEzhc
	NpRDC5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6ms-00000008zNJ-2Iqi;
	Tue, 21 Jul 2026 09:29:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6mo-00000008zMF-1Hsd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:29:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB81B43F5D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D011F0155A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784626153;
	bh=CDJLucVT4R47Wn7AWbEmW80xVYNcqomm0n8kCgC52XU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dwNzD8SMh2MvQuc5sqz/UiAJTf62dy5g1tNLKvIcNpR92JwKHLAbZnKG9zCBN8eWq
	 MrMH8Tz5rckp13IJsdjv8FCdR/wCh0SvhD1tRPvykWBRuB9Kny3MJE6D5tXUvYHLHt
	 e9gTI02n1YSCvtA0u1kXTJ3kd2eHnzpDLAfSEvOfMaZZI/B4hx/ZyaRIOYW86JlTiQ
	 IPv6esWtjqeIdRSL8wUW7vbywDMIugP2XsNzIUDt6tdWpkHynX0moFyZVGQRbxPn39
	 hFvVMs6Q2rXSSoFf/d9HonPzb2zIyNObWSCt1AOf3fTGHn+Iu2f840V/wstBPCrnNf
	 wVnpoyAQ5kJ8A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so881664e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:29:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLeONJAZEJ26mbWFAde1WgzEhfDcih855ylrtl2AsJ4LOIaF8pHkgQ4hkGKbtVL8+sZguLBlJSEJkaT4mnIbNE@lists.infradead.org
X-Gm-Message-State: AOJu0YyIi1rSB58kwKTt1CzTUlhSaEARmd1DrwaYAQMHdkfUasHaMOJO
	JEUIJa+93ijZgCOoQB4tL3A7cQILqgPilH7aGENDXm4nHgEWr+V3kDi1/mNNWVbFSJXxsDzWhsc
	o02Wxgec/VWiDtTehuvU9roHB17Xgh0g3GzBC7RuFEg==
X-Received: by 2002:a05:6512:1328:b0:5b0:eda:de2a with SMTP id
 2adb3069b0e04-5b28f998d04mr3384385e87.35.1784626152102; Tue, 21 Jul 2026
 02:29:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:29:11 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:29:10 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:29:10 +0000
X-Gmail-Original-Message-ID: <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
X-Gm-Features: AUfX_my1mbfO1VN9YoJGd-EpwSTRR3Y3NySq4UuDtatqCVxMuFBT8FxEQjVt8Jo
Message-ID: <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Jul 2026 19:16:36 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> MFD core has no way to register a child device using an explicit firmware
> node. This prevents drivers from registering child nodes when those nodes
> do not define a compatible string. One such example is the PSCI
> "reboot-mode" node, which omits a compatible string as it describes
> boot-states provided by the underlying firmware.
>
> Extend struct mfd_cell with a named firmware-node field to identify a
> child node under the MFD parent. The node is added to the MFD child
> device during registration when none is assigned by device tree, ACPI,
> or software matching.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
>  include/linux/mfd/core.h |  10 ++++
>  2 files changed, 131 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 7aa32b90cf1e..ba9682ead2ca 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/acpi.h>
> +#include <linux/fwnode.h>
>  #include <linux/list.h>
>  #include <linux/property.h>
>  #include <linux/mfd/core.h>
> @@ -22,6 +23,7 @@
>  #include <linux/regulator/consumer.h>
>
>  static LIST_HEAD(mfd_of_node_list);
> +static LIST_HEAD(mfd_named_fwnode_list);
>  static DEFINE_MUTEX(mfd_of_node_mutex);
>
>  struct mfd_of_node_entry {
> @@ -30,10 +32,91 @@ struct mfd_of_node_entry {
>  	struct device_node *np;
>  };
>
> +struct mfd_named_fwnode_entry {
> +	struct list_head list;
> +	struct device *dev;
> +	struct fwnode_handle *fwnode;
> +};
> +
>  static const struct device_type mfd_dev_type = {
>  	.name	= "mfd_device",
>  };
>
> +static int mfd_claim_named_fwnode(struct platform_device *pdev,
> +				  struct fwnode_handle *fwnode)
> +{
> +	struct mfd_named_fwnode_entry *entry, *iter;
> +
> +	entry = kzalloc_obj(*entry, GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->dev = &pdev->dev;
> +	entry->fwnode = fwnode_handle_get(fwnode);
> +
> +	scoped_guard(mutex, &mfd_of_node_mutex) {
> +		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
> +			if (iter->fwnode == fwnode) {
> +				fwnode_handle_put(entry->fwnode);
> +				kfree(entry);
> +				return -EAGAIN;
> +			}
> +
> +		list_add_tail(&entry->list, &mfd_named_fwnode_list);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Temporary MFD-local cleanup for named non-OF child fwnodes.
> + * Remove/rework this when platform core starts owning and dropping
> + * dev->fwnode references for these devices.
> + */
> +static void mfd_release_named_fwnode(struct platform_device *pdev)
> +{
> +	struct mfd_named_fwnode_entry *entry, *tmp;
> +
> +	scoped_guard(mutex, &mfd_of_node_mutex) {
> +		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
> +			if (entry->dev == &pdev->dev) {
> +				if (dev_fwnode(&pdev->dev) == entry->fwnode)
> +					device_set_node(&pdev->dev, NULL);
> +				fwnode_handle_put(entry->fwnode);
> +				list_del(&entry->list);
> +				kfree(entry);
> +			}
> +	}
> +}
> +
> +static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
> +				    struct device_node *np)
> +{
> +	struct mfd_of_node_entry *of_entry, *iter;
> +
> +	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
> +	if (!of_entry)
> +		return -ENOMEM;
> +
> +	of_entry->dev = &pdev->dev;
> +	of_entry->np = of_node_get(np);
> +
> +	/* Skip if OF node has previously been allocated to a device */
> +	scoped_guard(mutex, &mfd_of_node_mutex) {
> +		list_for_each_entry(iter, &mfd_of_node_list, list)
> +			if (iter->np == np) {
> +				of_node_put(of_entry->np);
> +				kfree(of_entry);
> +				return -EAGAIN;
> +			}
> +
> +		list_add_tail(&of_entry->list, &mfd_of_node_list);
> +	}
> +
> +	device_set_node(&pdev->dev, of_fwnode_handle(np));
> +	return 0;
> +}
> +
>  #if IS_ENABLED(CONFIG_ACPI)
>  struct match_ids_walk_data {
>  	struct acpi_device_id *ids;
> @@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>  				    struct device_node *np,
>  				    const struct mfd_cell *cell)
>  {
> -	struct mfd_of_node_entry *of_entry;
>  	u64 of_node_addr;
>
> -	/* Skip if OF node has previously been allocated to a device */
> -	scoped_guard(mutex, &mfd_of_node_mutex) {
> -		list_for_each_entry(of_entry, &mfd_of_node_list, list)
> -			if (of_entry->np == np)
> -				return -EAGAIN;
> -	}
> -
>  	if (!cell->use_of_reg)
>  		/* No of_reg defined - allocate first free compatible match */
> -		goto allocate_of_node;
> +		return mfd_claim_of_node_to_dev(pdev, np);
>
>  	/* We only care about each node's first defined address */
>  	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
> @@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>  		/* No match */
>  		return -EAGAIN;
>
> -allocate_of_node:
> -	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
> -	if (!of_entry)
> -		return -ENOMEM;
> -
> -	of_entry->dev = &pdev->dev;
> -	of_entry->np = of_node_get(np);
> -	scoped_guard(mutex, &mfd_of_node_mutex)
> -		list_add_tail(&of_entry->list, &mfd_of_node_list);
> -
> -	device_set_node(&pdev->dev, of_fwnode_handle(np));
> -	return 0;
> +	return mfd_claim_of_node_to_dev(pdev, np);
>  }
>
>  static int mfd_add_device(struct device *parent, int id,
> @@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
>  	struct resource *res;
>  	struct platform_device *pdev;
>  	struct mfd_of_node_entry *of_entry, *tmp;
> +	struct fwnode_handle *fwnode;
>  	bool disabled = false;
>  	int ret = -ENOMEM;
>  	int platform_id;
> @@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
>
>  	mfd_acpi_add_device(cell, pdev);
>
> +	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
> +	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {

Use dev_fwnode() instead of pdev->dev.fwnode.

> +		struct device_node *named_np;
> +
> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
> +		if (!fwnode) {
> +			ret = -ENODEV;
> +			goto fail_alias;
> +		}
> +
> +		named_np = to_of_node(fwnode);
> +		if (named_np) {
> +			ret = mfd_claim_of_node_to_dev(pdev, named_np);
> +			fwnode_handle_put(fwnode);
> +			if (ret == -EAGAIN)
> +				ret = -EBUSY;
> +			if (ret)
> +				goto fail_alias;
> +		} else {
> +			ret = mfd_claim_named_fwnode(pdev, fwnode);
> +			if (ret) {
> +				fwnode_handle_put(fwnode);
> +				if (ret == -EAGAIN)
> +					ret = -EBUSY;
> +				goto fail_alias;
> +			}
> +			device_set_node(&pdev->dev, fwnode);
> +			fwnode_handle_put(fwnode);
> +		}

What is the reason to have this split into OF and fwnode functions? I don't
really see why you would need to do it twice, isn't fwnode sufficient for the
OF node case too?

> +	}
> +
>  	if (cell->pdata_size) {
>  		ret = platform_device_add_data(pdev,
>  					cell->platform_data, cell->pdata_size);
> @@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
>  	if (cell->swnode)
>  		device_remove_software_node(&pdev->dev);
>  fail_of_entry:
> +	mfd_release_named_fwnode(pdev);
>  	scoped_guard(mutex, &mfd_of_node_mutex) {
>  		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
>  			if (of_entry->dev == &pdev->dev) {
> @@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
>  	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
>  					       cell->num_parent_supplies);
>
> +	get_device(&pdev->dev);
>  	platform_device_unregister(pdev);
> +	mfd_release_named_fwnode(pdev);
> +	put_device(&pdev->dev);
>  	return 0;
>  }
>
> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> index faeea7abd688..8daa83dd31ea 100644
> --- a/include/linux/mfd/core.h
> +++ b/include/linux/mfd/core.h
> @@ -80,6 +80,16 @@ struct mfd_cell {
>
>  	/* Software node for the device. */
>  	const struct software_node *swnode;
> +	/*
> +	 * Name of a child firmware node under the MFD parent device.
> +	 *
> +	 * Used only as a fallback when no firmware node is assigned to MFD
> +	 * child and no software node is provided.
> +	 *
> +	 * For Device Tree parents, lookup is by base node name only
> +	 * (the part before '@'). Unit-addresses are not matched.
> +	 */

Side note: struct mfd_cell could really use a proper kernel doc but that's out
of scope of this series.

> +	const char *named_fwnode;
>
>  	/*
>  	 * Device Tree compatible string
>
> --
> 2.34.1
>
>

Bartosz


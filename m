Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69ECD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFobpbpWp8lxREf0EH5OsMiXNiERdzzRvetVBp/957w=; b=y/kVgEKW6gBlLtuFYo9BRLg+AO
	sWqTwjx1NMsjKoTaOCSMIfYa2Z2I8ZfcUVq8KxGBTFoJBSjFzay334Pt/ufdjpBPxU7GQVMY0OFjJ
	qX8POTWLcYyB5sq6wSINkKTnBPW9pmcy9Ifo+Vs0h+Z9/XEfT4kfh30F9UAriF/wsOP070tOLVLWz
	/X0treIXvIU2t7Y5pBxYYG3n5cbPsSJavW5IHmCz7MkbO/sm+McajcYoiT3nYjKBixCvZlnjZbtQ0
	df+XAzwsO3oiasjpou5RX/WwicfqKSGQFpvmzvvl6fVpzpq4E5U2yuR1MXC+S+OmRqQATnFf9PPX0
	jjx4c7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtj7-0000000Etta-2oQW;
	Mon, 18 May 2026 08:53:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtj5-0000000Etso-0Ul4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B171F443C2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FBAC2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094406;
	bh=BeY2D1xhKXuMNqWiLMcfM8mpDskYF1/TSSDTA7pllLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BiUPWewpY7R5J0SFM+oxT1KFVOoRyuzVuZK4mkARnjO3rH1mtxsBxdRfjVRpND3ZQ
	 udKva8WH8yafbXxhS5Rf0Umgh9L1/2aOJIWOnoVjtTgSzNB/751Bu95d+eV+BPi5eG
	 yZiDT6sxun6iz9iTeLvsPVNwEohNheDlEw3i2ohSkyzmWtC8Fd5aYX4FooRtY6Aie+
	 xAgy/XlMO6Ow5KJklTNJOZxeLgBdLk6+hvkKG9xec0+Kbq5nlV0auoN/HvHHRw/xm6
	 5eWtMLdmJ8g3TmeYLeP+eMnw7KAZs8R7dFGuSsHXr6+xr5H5RGzgCvvK3iG0k+6wRR
	 uC0lkvB9Nvmiw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e97e73234so18737481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QQC67+ytLV7EIAD6NMuTUD0ZCQLdmP8MqYRJHYPebLKB16HNv4EzO7vii3y13TrNAucjKGmL3/YuPDe81hXoB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg9YjVVUvmLUQhCC9nJWyaYyE2iwUYzHMibzqad+rKYNLFQapq
	sCC+Xn5ZDZN6YJSowREAWwpNKdzp0NMrtnh/AAUyk+0wicuk8YUBLA9ScgErpVDuJcyww7ZxqcE
	vqNLzGzMFpBVTQy01FcagJpanWONPokSaVTmV2ht1kA==
X-Received: by 2002:a05:651c:548:b0:393:7ab3:6d50 with SMTP id
 38308e7fff4ca-395619b0770mr39038201fa.6.1779094405178; Mon, 18 May 2026
 01:53:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:53:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:53:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
Date: Mon, 18 May 2026 01:53:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdMKGm2R28Kh3baXTWa8Bo5Yt8ybnL11-12ZJF8BbDB9w@mail.gmail.com>
X-Gm-Features: AVHnY4KUs56aRoXVmyMp6zYpUiaetiLn907dXUa8eSIFV9OSLRkKS3ZdNxw4t9A
Message-ID: <CAMRc=MdMKGm2R28Kh3baXTWa8Bo5Yt8ybnL11-12ZJF8BbDB9w@mail.gmail.com>
Subject: Re: [PATCH v22 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_015327_252589_8AAC1795 
X-CRM114-Status: GOOD (  23.42  )
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

On Thu, 14 May 2026 16:25:50 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> The PSCI "reboot-mode" node does not define a compatible because it is a
> configuration of boot-states provided by the underlying firmware. With
> the new firmware-node based cells in mfd-core, this node can now be
> exposed as a proper child cell.
>
> Add the psci-reboot-mode child cell to the psci-mfd driver and associate
> the reboot-mode node as its firmware-node.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/psci-mfd.c      | 18 ++++++++++++++++++
>  drivers/power/reset/Kconfig |  2 +-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd83452664edeccb09290fe4f43186..852d8e294a438d4ee6789c556d16a83739af2013 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c
> @@ -7,11 +7,29 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +static struct fwnode_handle *psci_reboot_mode_get_child_fwnode(struct device *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +
> +	fwnode = fwnode_get_named_child_node(dev_fwnode(parent), "reboot-mode");
> +	if (!fwnode_device_is_available(fwnode)) {
> +		fwnode_handle_put(fwnode);
> +		fwnode = NULL;
> +	}
> +
> +	return fwnode;

Is this reference put anywhere once the cell is torn down?

Bart

> +}
>
>  static const struct mfd_cell psci_cells[] = {
>  	{
>  		.name = "psci-cpuidle-domain",
>  	},
> +	{
> +		.name = "psci-reboot-mode",
> +		.get_child_fwnode = psci_reboot_mode_get_child_fwnode,
> +	},
>  };
>
>  static int psci_mfd_probe(struct platform_device *pdev)
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index d9d1f768b8691abc3b32f2675519f2ddbaf19b84..79559206d5852ae5eae4c8eb2c390901cea7531c 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
>
>  config PSCI_REBOOT_MODE
>  	bool "PSCI reboot mode driver"
> -	depends on OF && ARM_PSCI_FW
> +	depends on OF && ARM_PSCI_FW && MFD_PSCI
>  	select REBOOT_MODE
>  	help
>  	  Say y here will enable PSCI reboot mode driver. This gets
>
> --
> 2.34.1
>
>


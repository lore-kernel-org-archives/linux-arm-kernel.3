Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA99CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTiRIOvyrnbBe56DNVUfZzfjuOs0jdrr1NH4cMoTGyM=; b=20p9AljIdfJimwO8RA5dchZSyN
	oIf8+mJal1kbEBHQ2XCuKxVaZk9G0QPCaDkKDZJMWOWM2kiI8DCDjpMZRxDCrrd6MenCZITazBNGN
	VtdllcMBQzIwkBkopSHRdXTvY7AhAHJeIePVkIzx3Q1SoSVQpx4h0JoDbAzqYC1AQxP5WjnKzavoH
	Uu5iaxJl9PbXHhSG3NqPd1agaxyiKxRmoePTVCIPnYLO/0+k5WoqzZKO/0xBA0cbHgNAtmNucSv5K
	RtfGurCN1rWC0VnYEGCxmHgUvCeRr11Iid22GW6SM0XrcLTXWK3jn7cHmFzldA6Dg9u42ZhX+n53R
	HfoOqElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGXC-00000000sMz-0Aqw;
	Tue, 19 May 2026 09:14:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGX8-00000000sM0-3bOi;
	Tue, 19 May 2026 09:14:40 +0000
Date: Tue, 19 May 2026 11:14:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779182074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JTiRIOvyrnbBe56DNVUfZzfjuOs0jdrr1NH4cMoTGyM=;
	b=uFdOrz+GgwEtLYeIM+wqq0pdhsZG3lN7XAJlA1KS9vnj3pKHHX/LTAMFavpc07ShXcv8KX
	MV5xgkv/AP7PGQhddTKgPpCzVhUXR2ybLV39NeptPLv6/+dhQoao7uDMC81nnak1YNK9gu
	KT39jzZNwp9wj8D2+FJklrfjbe1lSdrLHO5r4Tfdf3dVzaez6NK7qr060KpxISVkItW/AF
	3TdgrOcRA8EniPuISHgOhqtD9aX0zGbVzbWMgWcCzEyvJLFpbMJwL64q5Ta5zvbZNrT6Dp
	yJHq+lzQNtggOng2EjWQKgN30TrV9DzpceLFrfA7GUcEc3zeQqMbb23pfjU56Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779182074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JTiRIOvyrnbBe56DNVUfZzfjuOs0jdrr1NH4cMoTGyM=;
	b=MoJiPS4UpagsPqF4WAMNPHpPn5nNqYyVRaH9bgZ10wI5dxKm1fB0sX8i14FUGA8ZFZQsCk
	VqQlNxT4zisXVhAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <20260519110041-2d8d92c2-d265-43d1-848f-bf9231a106c8@linutronix.de>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_021439_041913_A7B7D685 
X-CRM114-Status: GOOD (  29.27  )
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

On Fri, May 08, 2026 at 04:42:45PM +0200, Gregor Herburger wrote:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  drivers/nvmem/Kconfig                      |  10 +++
>  drivers/nvmem/Makefile                     |   1 +
>  drivers/nvmem/raspberrypi-otp.c            | 130 +++++++++++++++++++++++++++++
>  include/soc/bcm2835/raspberrypi-firmware.h |   9 ++
>  4 files changed, 150 insertions(+)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..aac31f43385e 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem_qoriq_efuse.
>  
> +config NVMEM_RASPBERRYPI_OTP
> +	tristate "Raspberry Pi OTP support"
> +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)

The '&& !RASPBERRYPI_FIRMWARE' clause looks weird, is it really necessary?

> +	help
> +	  This driver provides access to the Raspberry Pi OTP memory via the
> +	  nvmem subsystem. The driver supports the customer OTP as well as the
> +	  device specific private key OTP (BCM2712 only).
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called raspberrypi-otp.

While we are here: The empty line here is now missing.

>  endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 7252b8ec88d4..8ca2095e068f 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -95,3 +95,4 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
>  nvmem_zynqmp_nvmem-y			:= zynqmp_nvmem.o
>  obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+= nvmem-qoriq-efuse.o
>  nvmem-qoriq-efuse-y			:= qoriq-efuse.o
> +obj-$(CONFIG_NVMEM_RASPBERRYPI_OTP)	+= raspberrypi-otp.o
> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-otp.c
> new file mode 100644
> index 000000000000..393640cb9e32
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/overflow.h>

This looks unused.

Instead maybe add linux/types.h, linux/align.h

> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +struct rpi_otp_priv {
> +	struct rpi_firmware *fw;
> +	struct device *dev;

This looks unused.

> +	u32 read_tag;
> +	u32 write_tag;
> +};
> +
> +struct rpi_otp_header {
> +	__le32 start;
> +	__le32 count;
> +	__le32 data[] __counted_by_le(count);
> +};
> +
> +static int rpi_otp_read(void *context, unsigned int offset, void *buf, size_t bytes)
> +{
> +	struct rpi_otp_priv *priv = context;
> +	struct rpi_otp_header *fwbuf;
> +	u32 count;
> +	int ret;
> +
> +	if (!IS_ALIGNED(offset, 4) || !IS_ALIGNED(bytes, 4))
> +		return -EINVAL;

Isn't this already enforced by the nvmem core?

(...)

> +static int rpi_otp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvmem_device *nvmem;
> +	struct rpi_otp_priv *priv;
> +	const struct rpi_otp_driver_data *data;
> +	struct nvmem_config config = {
> +		.read_only = false,
> +		.word_size = 4,
> +		.stride = 4,
> +		.reg_read = rpi_otp_read,
> +		.reg_write = rpi_otp_write,
> +		.id = NVMEM_DEVID_NONE,
> +	};
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data = dev_get_platdata(dev);
> +	if (!data)
> +		return -ENODEV;

I would do this before the devm_kzalloc().
> +
> +	priv->fw = dev_get_drvdata(dev->parent);
> +	priv->dev = dev;
> +	priv->read_tag = data->read_tag;
> +	priv->write_tag = data->write_tag;
> +	config.dev = dev;
> +	config.priv = priv;
> +	config.name = data->name;
> +	config.size = data->size;
> +
> +	nvmem = devm_nvmem_register(dev, &config);
> +	if (IS_ERR(nvmem))
> +		return dev_err_probe(dev, PTR_ERR(nvmem), "error registering nvmem config\n");
> +
> +	return 0;
> +}
> +
> +static struct platform_driver raspberry_otp_driver = {
> +	.probe	= rpi_otp_probe,
> +	.driver = {
> +		.name	= "raspberrypi-otp",
> +	},
> +};
> +module_platform_driver(raspberry_otp_driver);
> +
> +MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
> +MODULE_DESCRIPTION("Raspberry Pi OTP driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:raspberrypi-otp");

Instead of the manual module alias here and the implicit matching of the
platform driver this should use an explicit matching table:

static const struct platform_device_id foo_id[] = {
	{ "raspberrypi-otp" },
	{}
};
MODULE_DEVICE_TABLE(platform, foo_id);

static struct platform_driver raspberry_otp_driver = {
	...
	.id_table = foo_id,
};
module_platform_driver(raspberry_otp_driver);

(...)


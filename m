Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B1F483F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdX/pRgcF2jMFax0V2rjF4BHxVeHyQtxfI9W1Ym48ho=; b=rdpY2TKbNICUzKwVl31RXZljBv
	PVy4pGfGzpoLW1PrtrK9vihRnzV8zv1HUs3iQzFaWdTjJwO3tZ31wDLnMbU4V2qQgz4uzFCd7eKLm
	LeQmHjmF13uvFFx7kLV43dtymhU0cH9wRceHWIpymNm6Vm9bm/n5uCse3HpxFw2Gt+6jLYyW5ClJx
	pAZ3VQRxPWLB7K4Kis7fSzIO4bZX7RyknLuy2k46rI4s6Jo2BJxHTjUb3B7bQMyJyd4n0O7PnyPL7
	VWlgmP23OOzMNYVkScgDEqk6B9vQnXjcE2hKeYbKTW3XXNqa7yvePBgfbjUJQnIYT2r7aXioSSbaD
	5P1dsUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lrU-0000000HZFG-28gZ;
	Mon, 23 Mar 2026 20:26:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lrS-0000000HZF5-15bP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 20:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48782600AC;
	Mon, 23 Mar 2026 20:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B58FC4CEF7;
	Mon, 23 Mar 2026 20:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774297613;
	bh=eJqp0aTOV24YJS1B68dp7Z5kq7N8KFIPaziEH3KjERs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Si9wOXU5yskTij/CpHNAswrYN7z1hP2kFejALyXxwfk2VLaXHVkRyKuhIJCW6h6Ff
	 9E4MD7A5iwFX2RF0MVh6ZMxZ7/IN6DAm8qYEjI0k743z2p7Odul2ziNIwtReIseYQY
	 Gamdc7YmeXsdmvMZr4VkuKb0xdRAtfbknryupxfLKn2F0VXpvnwKZRKi/mle8iKKFF
	 CuRh69LWwcX7YYv4VWWr3CTPouYuQENkiDmGxNp1UAIIJZr2oVS8lA9nVD4tNT2Wfn
	 zuvuCJC4xPhC5sZqsFTfq6QTsTodgxTZk+dNVDotX++XIc3ilUc566H5RQKYzfLWbC
	 yqwePCv3cK8zg==
Date: Mon, 23 Mar 2026 20:26:42 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH v2 3/4] iio: adc: xilinx-xadc: Add I2C interface support
Message-ID: <20260323202642.0cc73556@jic23-huawei>
In-Reply-To: <20260323074505.3853353-4-sai.krishna.potthuri@amd.com>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
	<20260323074505.3853353-4-sai.krishna.potthuri@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 23 Mar 2026 13:15:04 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> Add I2C interface support for Xilinx System Management Wizard IP along
> with the existing AXI memory-mapped interface. This support enables
> monitoring the voltage and temperature on UltraScale+ devices where the
> System Management Wizard is connected via I2C.
> 
> Key changes:
> - Implement 32-bit DRP(Dynamic Reconfiguration Port) packet format as per
>   Xilinx PG185 specification.
> - Add separate I2C probe with xadc_i2c_of_match_table to handle same
>   compatible string("xlnx,system-management-wiz-1.3") on I2C bus.
> - Implement delayed version of hardware initialization for I2C interface
>   to handle the case where System Management Wizard IP is not ready during
>   the I2C probe.
> - Add NULL checks for get_dclk_rate callback function in sampling rate
>   functions to support interfaces without clock control
> - Create separate iio_info structure(xadc_i2c_info) without event
>   callbacks for I2C devices
> - Add xadc_i2c_transaction() function to handle I2C read/write operations
> - Add XADC_TYPE_US_I2C type to distinguish I2C interface from AXI
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Hi.
A few minor things inline.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig            |  15 ++
>  drivers/iio/adc/Makefile           |   1 +
>  drivers/iio/adc/xilinx-xadc-core.c |  28 +++-
>  drivers/iio/adc/xilinx-xadc-i2c.c  | 215 +++++++++++++++++++++++++++++
>  drivers/iio/adc/xilinx-xadc.h      |   1 +
>  5 files changed, 256 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/iio/adc/xilinx-xadc-i2c.c
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a4a7556f4016..5a3956a5c086 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1767,6 +1767,21 @@ config XILINX_XADC
>  	  The driver can also be build as a module. If so, the module will be called
>  	  xilinx-xadc.
>  
> +config XILINX_XADC_I2C
> +	tristate "Xilinx System Management Wizard I2C Interface support"
> +	depends on I2C
> +	select XILINX_XADC_CORE
> +	help
> +	  Say yes here to allow accessing the System Management
> +	  Wizard on UltraScale+ devices via I2C.
> +
> +	  This provides voltage and temperature monitoring capabilities
> +	  through the same IIO sysfs interface, but using I2C communication
> +	  protocol.
> +
> +	  The driver can also be build as a module. If so, the module will be called

line is a little too long for Kconfig.

> +	  xilinx-xadc-i2c.
> +
>
> diff --git a/drivers/iio/adc/xilinx-xadc-i2c.c b/drivers/iio/adc/xilinx-xadc-i2c.c
> new file mode 100644
> index 000000000000..3d802b907260
> --- /dev/null
> +++ b/drivers/iio/adc/xilinx-xadc-i2c.c
> @@ -0,0 +1,215 @@

> +static int xadc_i2c_read_transaction(struct xadc *xadc, unsigned int reg, u16 *val)
> +{
> +	struct xadc_i2c *xadc_i2c = container_of(xadc, struct xadc_i2c, xadc);
> +	char write_buffer[XADC_I2C_WRITE_DATA_SIZE] = { 0 };
> +	struct i2c_client *client = xadc_i2c->client;
> +	char read_buffer[XADC_I2C_READ_DATA_SIZE];
> +	int ret;
> +
> +	write_buffer[2] = FIELD_GET(XADC_I2C_DRP_ADDR_MASK, reg);
> +	write_buffer[3] = XADC_I2C_INSTR_READ;
> +
> +	ret = i2c_master_send(client, write_buffer, XADC_I2C_WRITE_DATA_SIZE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_master_recv(client, read_buffer, XADC_I2C_READ_DATA_SIZE);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = FIELD_PREP(XADC_I2C_DRP_DATA0_MASK, read_buffer[0]) |
> +	       FIELD_PREP(XADC_I2C_DRP_DATA1_MASK, read_buffer[1]);
> +
> +	return 0;
> +}
> +
> +static int xadc_i2c_write_transaction(struct xadc *xadc, unsigned int reg, u16 val)
> +{
> +	struct xadc_i2c *xadc_i2c = container_of(xadc, struct xadc_i2c, xadc);
> +	struct i2c_client *client = xadc_i2c->client;
> +	char write_buffer[XADC_I2C_WRITE_DATA_SIZE];
> +	int ret;
> +
> +	write_buffer[0] = FIELD_GET(XADC_I2C_DRP_DATA0_MASK, val);
> +	write_buffer[1] = FIELD_GET(XADC_I2C_DRP_DATA1_MASK, val);

This is odd enough it might be useful to have some comments.  Why do
we need to write the value to two places for instance?

> +	write_buffer[2] = FIELD_GET(XADC_I2C_DRP_ADDR_MASK, reg);
> +	write_buffer[3] = XADC_I2C_INSTR_WRITE;
> +
> +	ret = i2c_master_send(client, write_buffer, XADC_I2C_WRITE_DATA_SIZE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int xadc_hardware_init(struct xadc *xadc)
> +{
> +	struct xadc_i2c *xadc_i2c = container_of(xadc, struct xadc_i2c, xadc);
> +	int ret;
> +	u32 i;
> +
> +	for (i = 0; i < ARRAY_SIZE(xadc->threshold); i++) {
	for (u32 i = 0;

Though why a u32?  If size doesn't matter, convention is pretty much always
use a unsigned int for the iterator.

> +		ret = xadc_i2c_read_transaction(xadc, XADC_REG_THRESHOLD(i),
> +						&xadc->threshold[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = xadc_i2c_write_transaction(xadc, XADC_REG_CONF0, xadc_i2c->conf0);
> +	if (ret)
> +		return ret;
> +
> +	ret = xadc_i2c_write_transaction(xadc, XADC_REG_INPUT_MODE(0),
> +					 xadc_i2c->bipolar_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = xadc_i2c_write_transaction(xadc, XADC_REG_INPUT_MODE(1),
> +					 xadc_i2c->bipolar_mask >> XADC_INPUT_MODE_BITS);
> +	if (ret)
> +		return ret;
> +
> +	xadc_i2c->hw_initialized = true;
> +
> +	return 0;
> +}
> +
> +static int xadc_i2c_read_reg(struct xadc *xadc, unsigned int reg, u16 *val)
> +{
> +	struct xadc_i2c *xadc_i2c = container_of(xadc, struct xadc_i2c, xadc);
> +
> +	if (!xadc_i2c->hw_initialized) {
> +		int ret;
> +
> +		ret = xadc_hardware_init(xadc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return xadc_i2c_read_transaction(xadc, reg, val);
> +}
> +
> +static int xadc_i2c_write_reg(struct xadc *xadc, unsigned int reg, u16 val)
> +{
> +	struct xadc_i2c *xadc_i2c = container_of(xadc, struct xadc_i2c, xadc);
> +
> +	if (!xadc_i2c->hw_initialized) {

Seems like this is always called once on first access?
If so just do it form probe and simplify the read/ write_reg() functions.

> +		int ret;
> +
> +		ret = xadc_hardware_init(xadc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return xadc_i2c_write_transaction(xadc, reg, val);
> +}

> +static int xadc_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	unsigned int conf0, bipolar_mask;
> +	const struct xadc_ops *ops;
> +	struct iio_dev *indio_dev;
> +	struct xadc_i2c *xadc_i2c;
> +	struct xadc *xadc;
> +	int ret;
> +
> +	indio_dev = xadc_device_setup(dev, sizeof(*xadc_i2c), &ops);
> +	if (IS_ERR(indio_dev))
> +		return PTR_ERR(indio_dev);
> +
> +	xadc_i2c = iio_priv(indio_dev);
> +	xadc_i2c->client = client;
> +	xadc = &xadc_i2c->xadc;
> +	xadc->clk = NULL;
> +	xadc->ops = ops;
> +	mutex_init(&xadc->mutex);
For new code (feel free to update the other code in a separate patch).
	ret = devm_mutex_init(xadc->mutex);
	if (ret)
		return ret;

As gives a small amount of lock debugging infrastructure and is now
cheap to do.  The devm form didn't used to exist.

> +	spin_lock_init(&xadc->lock);
> +
> +	ret = xadc_device_configure(dev, indio_dev, 0, &conf0, &bipolar_mask);
> +	if (ret) {
> +		dev_err(dev, "Failed to setup the device: %d\n", ret);
> +		return ret;
		return dev_err_probe(dev, "Failed to setup the device.\n");
Which will pretty print the error and hide it if -EPROBEDEFER (because that should
be silent) or -ENOMEM (because memory allocation errors are very noisy anyway!)

> +	}
> +
> +	i2c_set_clientdata(client, indio_dev);
> +	xadc_i2c->conf0 = conf0;
> +	xadc_i2c->bipolar_mask = bipolar_mask;
> +	xadc_i2c->hw_initialized = false;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C1ACAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uvk7bkh26T5CQs8XQp0T1vD1hsUR0GW2y2xcFvzhreI=; b=o8dxB+YXNrA+SR
	pwz0sv7yYHyKHi4vfnvFzWYnZpmghznF+XwLH+BrJmndEjXDXvcAuZDX3xKa8J6yHMJVSQyxzsOl4
	K1BsTp8Yg7Q4ySFw7xr6Lwb/YBP6APHy0b+6jnfdK/HvMyqa2bpwzjhsJeNI4y7ELt0U8TS7eQnue
	3+gYKALDl52xWW9hE2kncmu7jxzmSDvEI4WrvCfX2XUP2nk6usOrIMMkmGUW70he3WXe5zf0V3NJI
	dMBM2ARpIQYV1yl+2kxPSOHC0snPmBAZqTIx8QYrKM4UZu16voih7SUa/xXznPotFNkvWsskFz3dy
	uB+7Xd0CDH10PtNndxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n8B-0000000AAC1-3yQP;
	Thu, 25 Sep 2025 14:39:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n8B-0000000AABR-0UtL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 14:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=uvk7bkh26T5CQs8XQp0T1vD1hsUR0GW2y2xcFvzhreI=; b=Uocs1OM2vfLJF+IBmO9Mp3QuIz
	LgQ61ywVCR0w+QxkSXpw4xSmuN2F7fO1JC+78DKw/vgYS+NJQOdxNZSiyGET2/vSeOMHmu5KQUlCe
	zhRA32S5cFKrqW/fU182OR10ekW7W+aeGaARmoJHsYDrXuw5JktA4HRNogC2+mdtVuds89dVin1du
	HGAP+46ybo/qHfdR6wyywlbW6Hzajyp0EhKjy1ZeFT7Jxg/KkBaI6e31CXzu1G/ZHmOlmwM3VDpIC
	Pulau83zh5WT9m3gJ3sdja2P0Jb3sD2DRFyWsfNdMEcskapt2uHFH2/lnb65cngfTaqeVsGqsHfD4
	5FWg6ZWA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n87-00000009Gd3-3RQE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98248440B5;
	Thu, 25 Sep 2025 14:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308C6C4CEF0;
	Thu, 25 Sep 2025 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758811167;
	bh=CV3LAda4lJ9p5VIyU9vPKz79eilp+9UWaYrjz1ywHC0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=f0tBB6KamJshauRbna5oXFUwvHN2nJGuYZSyduJVRViSZL8ji1kmdL8b7P7kzCmr0
	 dR610MvQyBXiN/e6SuWwX/z5OsqHwDNjprLp+LROu4GsmxZPmUdxefcFCFpH8Y/ZvT
	 aeaTAUBMdAIxSQNMf4NrZKRecbjzYo9kBxBl+CCKYoJgCu/1BNp+X1FS5zhuXtRGpG
	 m30vVExt54y5i9l/LYG50/tRJ20bqyiVgaCP7LI/x7hfFok7mc7+8xIodIDtNA9H1o
	 VhAcE/sjOzLUBp6fpyE5mfSnfNxKQXm/McQ+hl3E3c1isUZ3sooU0pgfSTFh8roLGw
	 rSJnijx3MNyLw==
Date: Thu, 25 Sep 2025 09:39:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 8/9] PCI: pwrctrl: Add power control driver for tc9563
Message-ID: <20250925143924.GA2160097@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-qps615_v4_1-v6-8-985f90a7dd03@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_153932_360219_2EB74B6C 
X-CRM114-Status: GOOD (  29.73  )
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

On Thu, Aug 28, 2025 at 05:39:05PM +0530, Krishna Chaitanya Chundru wrote:
> TC9563 is a PCIe switch which has one upstream and three downstream
> ports. To one of the downstream ports integrated ethernet MAC is connected
> as endpoint device. Other two downstream ports are supposed to connect to
> external device. One Host can connect to TC9563 by upstream port. TC9563
> switch needs to be configured after powering on and before the PCIe link
> was up.
> 
> The PCIe controller driver already enables link training at the host side
> even before this driver probe happens, due to this when driver enables
> power to the switch it participates in the link training and PCIe link
> may come up before configuring the switch through i2c. Once the link is
> up the configuration done through i2c will not have any affect.To prevent
> the host from participating in link training, disable link training on the
> host side to ensure the link does not come up before the switch is
> configured via I2C.

s/any affect/any effect/
s/.To prevent/. To prevent/

> Based up on dt property and type of the port, tc9563 is configured
> through i2c.

s/up on/on/

Pick "i2c" or "I2C" and use it consistently.

> +config PCI_PWRCTRL_TC9563
> +	tristate "PCI Power Control driver for TC9563 PCIe switch"
> +	select PCI_PWRCTRL
> +	help
> +	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> +	  switch.
> +
> +	  This driver enables power and configures the TC9563 PCIe switch
> +	  through i2c.TC9563 is a PCIe switch which has one upstream and three
> +	  downstream ports. To one of the downstream ports integrated ethernet
> +	  MAC is connected as endpoint device. Other two downstream ports are
> +	  supposed to connect to external device.

s/i2c.TC9563/i2c. TC9563/

> +static int tc9563_pwrctrl_bring_up(struct tc9563_pwrctrl_ctx *ctx)
> +{
> +	struct tc9563_pwrctrl_cfg *cfg;
> +	int ret, i;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(ctx->pwrctrl.dev, ret, "cannot enable regulators\n");
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +
> +	 /*
> +	  * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
> +	  * wait for 10ms for the internal osc frequency to stabilize.
> +	  */
> +	usleep_range(10000, 10500);

Possible place for fsleep() unless you have a specific reason for the
+500us interval?

> +static int tc9563_pwrctrl_probe(struct platform_device *pdev)
> +{
> +	struct pci_host_bridge *bridge = to_pci_host_bridge(pdev->dev.parent);
> +	struct pci_dev *pci_dev = to_pci_dev(pdev->dev.parent);
> +	struct pci_bus *bus = bridge->bus;
> +	struct device *dev = &pdev->dev;
> +	enum tc9563_pwrctrl_ports port;
> +	struct tc9563_pwrctrl_ctx *ctx;
> +	struct device_node *i2c_node;
> +	int ret, addr;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "i2c-parent", 1, &addr);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read i2c-parent property\n");
> +
> +	i2c_node = of_parse_phandle(dev->of_node, "i2c-parent", 0);
> +	ctx->adapter = of_find_i2c_adapter_by_node(i2c_node);
> +	of_node_put(i2c_node);
> +	if (!ctx->adapter)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find I2C adapter\n");
> +
> +	ctx->client = i2c_new_dummy_device(ctx->adapter, addr);
> +	if (IS_ERR(ctx->client)) {
> +		dev_err(dev, "Failed to create I2C client\n");
> +		i2c_put_adapter(ctx->adapter);
> +		return PTR_ERR(ctx->client);
> +	}
> +
> +	for (int i = 0; i < TC9563_PWRCTL_MAX_SUPPLY; i++)
> +		ctx->supplies[i].supply = tc9563_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, TC9563_PWRCTL_MAX_SUPPLY, ctx->supplies);
> +	if (ret) {
> +		dev_err_probe(dev, ret,
> +			      "failed to get supply regulator\n");
> +		goto remove_i2c;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "failed to get reset GPIO\n");
> +		goto remove_i2c;
> +	}
> +
> +	pci_pwrctrl_init(&ctx->pwrctrl, dev);
> +
> +	port = TC9563_USP;
> +	ret = tc9563_pwrctrl_parse_device_dt(ctx, pdev->dev.of_node, port);
> +	if (ret) {
> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
> +		goto remove_i2c;
> +	}
> +
> +	/*
> +	 * Downstream ports are always children of the upstream port.
> +	 * The first node represents DSP1, the second node represents DSP2, and so on.
> +	 */
> +	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
> +		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port++);
> +		if (ret)
> +			break;
> +		/* Embedded ethernet device are under DSP3 */
> +		if (port == TC9563_DSP3)
> +			for_each_child_of_node_scoped(child, child1) {
> +				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port++);
> +				if (ret)
> +					break;
> +			}
> +	}
> +	if (ret) {
> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
> +		goto remove_i2c;
> +	}
> +
> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->stop_link)
> +		bridge->ops->stop_link(bus);

Is this pcie_link_is_active() test backwards?  Seems like you would
want to stop the link if it *is* active.

pcie_link_is_active() is racy, and this looks like a situation where
that could be an issue.  Would something break if you omitted the test
and *always* stopped and started the link here?

> +	ret = tc9563_pwrctrl_bring_up(ctx);
> +	if (ret)
> +		goto remove_i2c;
> +
> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->start_link) {
> +		ret = bridge->ops->start_link(bus);
> +		if (ret)
> +			goto power_off;
> +	}
> +
> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &ctx->pwrctrl);
> +	if (ret)
> +		goto power_off;
> +
> +	platform_set_drvdata(pdev, ctx);
> +
> +	return 0;
> +
> +power_off:
> +	tc9563_pwrctrl_power_off(ctx);
> +remove_i2c:
> +	i2c_unregister_device(ctx->client);
> +	i2c_put_adapter(ctx->adapter);
> +	return ret;
> +}


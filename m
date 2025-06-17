Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACB7C71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 02:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ur4M96epg96VPq4InRPg/HFk/6ttt8g71w9EhDzLH8=; b=GbVZrHnIQQ6SgnoDGHcTU12Qf0
	JRuqHNsDo2ia3FHoG0UpiT4rlZZA8XOrhHJ/c4KhrZHcCoRt8atR8UaCx3705tU9L9YCF1/xrBxa8
	CjrvIS1C93he0nRBh6qHThEIBr+SXm8SnDfO79yZN6v5j/fHOGTrRguRERX4UgC65Yn3I9T3zc/Ay
	Ppp5czkC49X/43xH1Cg7/mNkQjiKdnmoXkRWDUnykgM6b4TpktRvWi+71h6TOPIObBwJhJUYluZ9I
	vNWcGIE1dzvdS0yRV0sW4/3BMsW8fd2aO3RwaOq1gDa/RMeCo+FHGU5Jg9IzyQM9w1OqmKC3t/gzv
	D6gr5Vkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLeT-00000005zLa-1KHf;
	Tue, 17 Jun 2025 02:02:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLcG-00000005zFm-3NCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 02:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 101AEA519ED;
	Tue, 17 Jun 2025 02:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95901C4CEEA;
	Tue, 17 Jun 2025 01:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750125599;
	bh=8AHskTTSmpL1cVyJIzyA7INB00VBnp62zgkfDcOrtS0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R42I15/WkdBn4FZ6+Rja1IQ1QOAbBCsq0EtRuDOa0VNQFd72Q2luG+ZgvHaRBitCV
	 hpwn65LydAI8h2a4EWCti/O9yGwt4nIAnihrfgZIFFXK21sX6zGK0n/zufBd14YgoE
	 kKn9sCOzipPfOS+0SwpHqmU4g4tolPPIuYq6q+Y1AM7xWT8S0Le0LULOwjQqbSliAS
	 c1kHdG1n65CtjzuSwURDdzuO/vkd+rlp7qxTJHutUkUA46iZfNzTjQm4AHhlAXX1YO
	 2J83Wwd8raNbgO3TXFTx5qmUGNjHEkTsHTLcIBV6uzyqpUDJEoJNxF/0qbobwZVYkP
	 tK4ZXnfGK5ZCg==
Date: Mon, 16 Jun 2025 20:59:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, David Lechner <dlechner@baylibre.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org
To: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-3-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
Message-Id: <175012559872.3174543.9779809862801791863.robh@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_190000_975548_E0AE73E9 
X-CRM114-Status: GOOD (  12.24  )
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


On Mon, 16 Jun 2025 18:00:47 -0400, Sean Anderson wrote:
> Add an example of the spi-buses property showcasing how to have devices
> on both the upper and lower buses.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:40.15-25: Warning (reg_format): /example-0/soc/spi-controller@ff0f0000/flash@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:46.15-25: Warning (reg_format): /example-0/soc/spi-controller@ff0f0000/flash@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:52.15-25: Warning (reg_format): /example-0/soc/spi-controller@ff0f0000/flash@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:39.21-43.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@0: Relying on default #address-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:39.21-43.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@0: Relying on default #size-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:45.21-49.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@1: Relying on default #address-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:45.21-49.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@1: Relying on default #size-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:51.21-55.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@2: Relying on default #address-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dts:51.21-55.15: Warning (avoid_default_addr_size): /example-0/soc/spi-controller@ff0f0000/flash@2: Relying on default #size-cells value
Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: spi-controller@ff0f0000 (xlnx,zynqmp-qspi-1.0): $nodename:0: 'spi-controller@ff0f0000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/spi/spi-zynqmp-qspi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.example.dtb: spi-controller@ff0f0000 (xlnx,zynqmp-qspi-1.0): Unevaluated properties are not allowed ('cs-gpios', 'flash@0', 'flash@1', 'flash@2', 'num-cs' were unexpected)
	from schema $id: http://devicetree.org/schemas/spi/spi-zynqmp-qspi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250616220054.3968946-3-sean.anderson@linux.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



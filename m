Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14F5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zWDE4vNKO/FXsXJuKZlL/iXpVrXuELtxAg4QURSIDc=; b=B7lXZSMibTwPvo60a7bjKzWhFw
	S2KzPGfC/wm+E3t1ZR5YMtJ/R8FtF7mKYAaUp09WjXWEcHToWDabT9Z6HnRqxgrun5pagDzyhbkAO
	z7+JsYlt4vPrcK2hvSAL/lfE5he/VvW2qNfMouTlN4WNhfBKAeOCIvubE8OMq52PiOJHg+xLfskqQ
	PPb6puz5mB1b5dgFjSHiAvrgerNfCYXia1EHgvRGdBWnp7xy944GoXKCEN0pZ09qvJugp22MY29Og
	qVbkmFyGa/bcsu2etZROjAPfSg0Y8M9Av188O9cDKfEvRMl7pD+ViHY0WHsKRRygYGoU7o16FUQqL
	z2XTMicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnJB-0000000Bigq-3qi1;
	Mon, 05 Jan 2026 16:19:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnJ9-0000000BigJ-3D58;
	Mon, 05 Jan 2026 16:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 867A960147;
	Mon,  5 Jan 2026 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE25AC116D0;
	Mon,  5 Jan 2026 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767629990;
	bh=AtN7od0JeLsN9YbMUfbbQk/4L1P9KKm0XcoR8cmj7CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhHlARlNAGXphZOOMOLPXXdYboH6rQGoEW00D0fi7fuAHJOXGzeRgKYG5X1gpaPFj
	 uzXh4SM8KE4Na2K2V9fmxDxkWzBKNxqKopKgrNor3jKn7aZ4gRQLdsF3X5+jLkxh4U
	 0SjmlPwW3RkL7OZV9qDHm54Wi5IR/Al4nYVxEV392JoniVlmeAEahNMfp1JOK7ns/o
	 liXgqtNjg/fiLGTcysf30O4NzJSIrFMFIdeHpIqm/F1jF8Uc7Kjsgi/Ihe8FPPnrY3
	 DDJqu93pjX4IWDHcObkDD4CagtAouZaUKOTXJ3tft846K9m7kLSRbZtQZs8CYaPD91
	 0Xn6ZM8O1egOQ==
Date: Mon, 5 Jan 2026 17:19:38 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pratyush Anand <pratyush.anand@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <aVvkmkd5mWPmxeiS@ryzen>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
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

On Mon, Jan 05, 2026 at 05:57:55PM +0530, Sumit Kumar wrote:
> The current DesignWare PCIe RC implementation supports only the controller
> (Host Bridge) node for specifying the Root Port properties in an assumption
> that the underlying platform only supports a single root Port per
> controller instance. This limits support for multi-port controllers where
> different ports may have different lane configurations and speed limits.
> 
> Introduce a separate dw_pcie_port structure to enable multi-port support.
> Each Root Port can have independent lane count, speed limit through pcie@N
> child nodes in device tree. Add dw_pcie_parse_root_ports()
> API to parse these child nodes.
> 
> Equalization presets and link width detection currently use common DBI
> space for all the root ports. Per-port DBI space assignment for these
> features will be added in future.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>

Hello Sumit,

Is there a reason why you represent this as a list of ports rather than a
simple array?

The number of ports is known by parsing the device tree, so it should be
static, no?

At least to me, this seem similar to e.g. how a gpio_device has multiple
gpio_descriptors "struct gpio_desc *descs":
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib.h#L68C1-L68C26

A list is usually used for something that is dynamic.
I don't think that the number of ports to a PCIe controller will be dynamic.

I can see that struct qcom_pcie in pcie-qcom.c has struct list_head ports,
but that does not necessarily mean that we need to have a list of ports in
pcie-designware-host.c. (pcie-qcom could also be modified to have an array
of ports if there is a desire for similar design pattern.)


Kind regards,
Niklas


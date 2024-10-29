Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBD8D3E2D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu2v4WeUNSaGQfEBppxnzHyQe4gJcsCrWzjMQguXKtc=; b=4hvYSX/QyaLIY+1rWLvpET/Y6L
	kHX+VSnmc9/P5dk+jDsiZXhMWpQS3ArOpNCBw+7EzZh5BNxbZ4/mqoITY4WQ6mKqSztZwiN6JEDd1
	UwUEKlf4r4jRlcRZsexQworsqGiQHAUGf2PJgQ/ML3esVLcJ29nHafOykZZhU++yV1sya9tR0DbKI
	ce+ImVtkHBQUwtHXnBlMjUmArgm/yhFt7E0ON9QrrJvS6OtDA3QOgcmlFL0VFy5XeWiKeeZ4t4u5c
	mxV6nfqVCk7SvdOnlbA+XUeSEAsoF/9TK7/CbHFK4qfHo2U6dCPgJsvO4G86UB/7vgM5W3vLutnsC
	dLjUsLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gng-0000000DWwP-1tnY;
	Tue, 29 Oct 2024 07:38:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5geo-0000000DVL4-0Op2;
	Tue, 29 Oct 2024 07:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66A02A416D6;
	Tue, 29 Oct 2024 07:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5953C4CEE3;
	Tue, 29 Oct 2024 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186929;
	bh=4OezFKJ8MU5/YXoAOGFAMmcNkpVGOILX+5gHrcEYsAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7/pDNwmoBcuZ8ZUxAatEvL+iCSnS31nAHnZdra4shS2g+rY6tNpIPTxMpjwlrkQn
	 Hmr5F7fHufGJnn0xpuYts4DvVN9iwtfodTPg6ghbovmkMGm2SJWBe5fCU8ZwNwV532
	 Ge8b6DSbcOpsxoaY5a1Pjf8eiZcR/YMZJWypSUqbnrSwVSOaPEu+jM6SoZq2ov32vB
	 iQbT+gj+uJlRjtKA3SjQk/8HV/vTCM12bAbC4I6gIlI3cN/muOER+6HxW4zaDuIgMo
	 QfQ4yxFxrfwYDppaPjpMd1rA8QxbbjYDBMCwX+3O4FQdJpSDyNQnVGm7gN8spKY087
	 nG57VuL6Ra4Ew==
Date: Tue, 29 Oct 2024 08:28:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 03/12] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <fwqcbnub36fk4abmhbtuwsoxdlf64mx4v65mxahsxmiv2sz6er@bfjddapvb75v>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_002850_307549_3E6E497F 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Oct 28, 2024 at 03:07:20PM +0100, Andrea della Porta wrote:
> Common YAML schema for devices that exports internal peripherals through
> PCI BARs. The BARs are exposed as simple-buses through which the
> peripherals can be accessed.
> 
> This is not intended to be used as a standalone binding, but should be
> included by device specific bindings.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> new file mode 100644
> index 000000000000..e532621f226b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for PCI MFD Endpoints with Peripherals Addressable from BARs
> +
> +maintainers:
> +  - Andrea della Porta  <andrea.porta@suse.com>
> +
> +description:
> +  Define a generic node representing a PCI endpoint which contains several sub-
> +  peripherals. The peripherals can be accessed through one or more BARs.
> +  This common schema is intended to be referenced from device tree bindings, and

Please wrap code according to coding style (checkpatch is not a coding
style description but only a tool).

Above applies to all places here and other bindings.

Best regards,
Krzysztof



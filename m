Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69260E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBV9j4BPyjValUeNedtz5efCKdJ+slFlC5TlpbQkvbM=; b=To/gK0qiB7sXDUqrPpuYZplMkc
	S8PyieqCZag0mhmZM7+uYF1XIDVXWpv33XXjXOe7NX3a2PUv9VLgW198p+AY+DzwCkc1w1CKlSXY9
	FRglftdXi24optIet6vDFlux7Z3PgrWVehALynJXQwhIeMPJPCkcggMnZcjHnR5AATZPq2sYqvFTt
	0JcOIPglDL55fEwrABeHjyuM3TeT6N1rxoDkhe+p98KIkk/1n3c7KHkLGs+DGssC/je2+Y2X83Z4e
	STqkBMUD+GFQa8oNYSQ8O2MO6VTSLtILGO5O/2ezLTfq0l4zNi4NKj1ZEscdv1kCU6KOTQ6uCWY3y
	DcGVMglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObRc-00000004oRe-0hOn;
	Fri, 20 Dec 2024 11:45:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObQH-00000004oDi-0HPH;
	Fri, 20 Dec 2024 11:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE8675C5E98;
	Fri, 20 Dec 2024 11:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F39EC4CECD;
	Fri, 20 Dec 2024 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734695039;
	bh=1qaji/tPXJ3XFWsCN7ydyqQqoYJ3IFUXjpiRi1Tvqos=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=N3mLsHPsylqpb12A3xvUwgV8NZl0bbI9kcs45hj4BqnkU6osyxMMBlQFie65QfwsS
	 mBW+X6SzrmWicuTrBDsGUhI5h2oeAJA+FxR+LrF/DHMw3INKYEmXhnJG6BlEgig64s
	 8g0mkjguAbx1YiWJe5rC+4Yr/5gajiaO0B7PjkGwLfmjyA8p8JIGg1DLsFkogdQkW9
	 gMA89iOlR32OtqKVjFjrk0wF2Fs+GiRoHxkKg/+Uq43LnrsYo6OR5iQUAe9U6/Tnyb
	 chhOQRFYaEvBFOPONMcDGRL+gAMh65LnDRTzQgiB1rDr0wSBEyQhGYl5DGkrMv7Q8b
	 wpz4Ct9dYYkBw==
Date: Fri, 20 Dec 2024 05:43:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, heiko@sntech.de, 
 linux-rockchip@lists.infradead.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241220101551.3505917-3-kever.yang@rock-chips.com>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <20241220101551.3505917-3-kever.yang@rock-chips.com>
Message-Id: <173469503748.2890446.9450914997693920466.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: PCI: dwc: rockchip: Add rk3576
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034401_197599_500E276C 
X-CRM114-Status: GOOD (  13.12  )
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


On Fri, 20 Dec 2024 18:15:46 +0800, Kever Yang wrote:
> rk3576 is using dwc controller, but use msi interrupt instead of its,
> so the msi-map is not required, and need to add a new 'msi' interrupt name.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 1 +
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: interrupt-names:5: 'msi' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: interrupt-names:6: 'dma0' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: interrupt-names:7: 'dma1' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: interrupt-names:8: 'dma2' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241220101551.3505917-3-kever.yang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



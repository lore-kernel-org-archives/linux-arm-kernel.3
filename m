Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE97C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqgfFQeguDzi6Iue43JRl0nWsNFaYuYHIxBk4ijiSmQ=; b=zBCMD4DK7xFUSaC04+/q7lAGfc
	RZhXgFXiA0ws6DaPSWgiaESvxSTaPK2kbyYXx6mk33KK3GDz9s+13ThlyPTTTSgyTujK/4kN6D2h8
	9eFLX8EK/wqtYJEf59k3hFlT2LU7iiTcFdsrHGSte1k/A8B2hn62Hcvp6f4hgoM2+9rFlCgqRHhYG
	5xWDrToAKz8A5e6DiikP5vHu6iY0ikUEIfprh3D3gvVjdrj9+vvHtHcOve7hiJnTxlKcbdzc9unwJ
	ld5T7oV+mdrTlmz1NXJ+KjHYKJb9Xfot6nfsU3ztu6rhYHOYtHTTgpCcJPei6Bxznx9KVPMwyukJw
	jwntUrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hN6-0000000FfOF-22At;
	Fri, 18 Apr 2025 08:46:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5h1a-0000000Fc45-4BCT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3E4EA4B36F;
	Fri, 18 Apr 2025 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E8CC4CEE2;
	Fri, 18 Apr 2025 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744964677;
	bh=/9OfrWnCUxMfe0bzWWpOCEaGqaGAQjbwJjWfCuAqTJo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Jeu8QH+M1Br42zGYHGcZhAAXWDmCsjRzAlZ5hrEVlRdeHLRNgShMGYULuWj2jXTUu
	 Gz7qZ/eC1LrK3mZRFcZPWAT+IQyGAZenZFtPYjcTwJ1eHyVOd433z8hLR083M13UnG
	 Yz/+BNG057GgyY5KPqpOgSbRjjTVgnHLeq1Ud0qZ2tGps68D/qD0WQ7yukthbeyyXl
	 Paw/QUmFQnR9Kbj1T+Hv5MbVp9AdYXzzTInkm93qqgjZdJGkWNWWB3uLc4zoT3AMWE
	 N6c8o0QTJOlGOc0MMWELCLcwB8D4a+uh/yHZFCLHNgGQafGvhfq5bL0WPin3TZ3DYa
	 lL5fCH47k7yLw==
Date: Fri, 18 Apr 2025 03:24:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nm@ti.com, baocheng.su@siemens.com, linux-pci@vger.kernel.org, 
 diogo.ivo@siemens.com, krzk+dt@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kw@linux.com, 
 robin.murphy@arm.com, jan.kiszka@siemens.com, kristo@kernel.org, 
 s-vadapalli@ti.com, linux-arm-kernel@lists.infradead.org, 
 lpieralisi@kernel.org, vigneshr@ti.com, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, bhelgaas@google.com, helgaas@kernel.org, 
 m.szyprowski@samsung.com, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 ssantosh@kernel.org
To: huaqian.li@siemens.com
In-Reply-To: <20250418073026.2418728-3-huaqian.li@siemens.com>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
 <20250418073026.2418728-3-huaqian.li@siemens.com>
Message-Id: <174496467399.2597920.14844354232532512833.robh@kernel.org>
Subject: Re: [PATCH v7 2/8] dt-bindings: PCI: ti,am65: Extend for use with
 PVU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_012439_162415_414EAB67 
X-CRM114-Status: GOOD (  15.48  )
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


On Fri, 18 Apr 2025 15:30:20 +0800, huaqian.li@siemens.com wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The PVU on the AM65 SoC is capable of restricting DMA from PCIe devices
> to specific regions of host memory. Add the optional property
> "memory-regions" to point to such regions of memory when PVU is used.
> 
> Since the PVU deals with system physical addresses, utilizing the PVU
> with PCIe devices also requires setting up the VMAP registers to map the
> Requester ID of the PCIe device to the CBA Virtual ID, which in turn is
> mapped to the system physical address. Hence, describe the VMAP
> registers which are optional unless the PVU shall be used for PCIe.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---
>  .../bindings/pci/ti,am65-pci-host.yaml        | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/ti,am65-pci-host.example.dtb: pcie@5500000 (ti,am654-pcie-rc): 'memory-region' is a required property
	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250418073026.2418728-3-huaqian.li@siemens.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



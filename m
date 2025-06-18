Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E713C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Um0R/UeKKhzjfUIA/AIuhIiMa+gKykm1XulYnDyioE=; b=sXmL/m5kcfAeMxulpDLes4/IbA
	cHyA9fXLzZ+w1cQNMVUC4tq6nO2MgJi0meCoL9fcawwAc0gPZP5WOUp2qcA3jQ5zEhyUVK5IjieZv
	JiHohhQwo7GkGWF5CmQVvtK65a91UdPWPIyc0N9rmdGY48a01WCjtE/7cXcNZ4Xswmd1LH1BxQxzt
	ZoizBzrz5G0+wsj3Zm1SYPhUVuQ8CrZUEz5BWFpECEOhJiPyjfMsFNJbet9IBAdWdHX8ddlnbrFd6
	5FuwDZou+Rnu85KQkek6wNQ6IfdZXafAdmtMQMGO6dZszMf4lhRaXs9A7h3ZCjxLIqhsNsKFkARhg
	CXe2tVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfK-0000000BEdV-1yMS;
	Wed, 18 Jun 2025 19:41:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxts-0000000B7EP-2LvZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0222629CE;
	Wed, 18 Jun 2025 18:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA7DC4CEE7;
	Wed, 18 Jun 2025 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272763;
	bh=eT+6E7j8MKpA8+JuN8R6/MizW9cXPn/MID8D+godm0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e14iU62kh532Ydae2EKi/eDJxL/gMzuUZYstiZIrzXP54BHZd0y5VwL1wkYK+QDGX
	 F3AFZ9wL4NL1dpyvtxuFRG8tirtdcv315QCN8nNaayXQXDWYUyzqnhQx9w2sPsgYz0
	 +EZHmF0n9J0RrasBf89OH6yxWdjGdhsac+QmfqB4RqEMJsAsfx3SoNIrA4oiCUWhNh
	 lEciGngaQJLAKAyhA+I2rTf6P4Pm9vd46BRUIOhNa5MEXCrLkd2ut4VD/znDZIuRiC
	 2fALmk4jeJCzNOFm680tjXnOsfC6J/rxsQsXwb6KJRFXYPSBYteOVWqNrGQbgDGqWX
	 AE6VYyVduXLwQ==
Date: Wed, 18 Jun 2025 13:52:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 01/27] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <175027275990.2508078.7812820935724706534.robh@kernel.org>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
 <20250618-gicv5-host-v5-1-d9e622ac5539@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-gicv5-host-v5-1-d9e622ac5539@kernel.org>
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


On Wed, 18 Jun 2025 12:17:16 +0200, Lorenzo Pieralisi wrote:
> The GICv5 interrupt controller architecture is composed of:
> 
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
> 
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
> 
> IRS nodes are added as GICv5 system component children.
> 
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
> 
> IWB nodes are described as a separate schema.
> 
> An IWB is connected to a single ITS, the connection is made explicit
> through the msi-parent property and therefore is not required to be
> explicit through a parent-child relationship in the device tree.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  78 ++++++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 267 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  3 files changed, 352 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



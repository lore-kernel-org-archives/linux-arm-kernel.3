Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F66C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y1+upEHw2aVmmfQc7NmwlD1vJ7ldcPCjL3K67v3kVM=; b=RKSEfDtDqCk2GPRgdIFwkw/2eK
	DCq8swrkMKn2xdJRKkmqkRrCGPsSpIT2b+jsi70553l8BzJxv0SZVTY7mVSCJYJFrDuil1h8GXyx9
	FSF/2DbuB5Zc74yG6fAa54tbqE8g0MhstVOTx4ti9+CloB5FOT9mEcBpzxUN+b55OGWRqQz43Iip9
	NwUMrH/ufZ1aGQgrcNNyWm0cjykeOtYOEqsyaIUvrJuLnMLaoNB7kjb5FCmDeAGelpg9grFWrqOwM
	EXmN2yYul4RUX3XaKO0wzet8pjMr9ICYw2H3wb2LASbfgIdHM7GvH5+TkWoaViwpNkrVLHdU+x7Yb
	GaAWkXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webUo-0000000HUc8-1GMG;
	Tue, 30 Jun 2026 16:39:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webUn-0000000HUbv-220r;
	Tue, 30 Jun 2026 16:39:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B021A600BB;
	Tue, 30 Jun 2026 16:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415601F000E9;
	Tue, 30 Jun 2026 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837576;
	bh=5y1+upEHw2aVmmfQc7NmwlD1vJ7ldcPCjL3K67v3kVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c2jZtrhLB2/QXI1U1YIaFApsftQcs9m8LqVlyzcANboeutPLdeCkiwTnVEZjDCyit
	 X0Y95SAAFZgUpm79p1I3UcPbtEE5ZfChErW8ImZ8QQQi+s/CoOWak3a0TkOzFFp4OV
	 a3GvWRGmUMRGgLCitrKIltfYT/jx8mT/FDP8R52885EKIIBJIrwR/LkBmkY1aTBYbo
	 Lb+NkW/k9yRSJHsXzz8Kv7x6/Mnj1AFFigALczLhMUCmIY/L4tpMbHaRh4FTUqcA13
	 Gxw92QgmmLPLkhff3nVK5s7Wt5roeuaD9CgYhtEgHvTSlj5UhfeGVFbyVVrueMX7Xa
	 REMo4LW/Z/R4A==
Date: Tue, 30 Jun 2026 11:39:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha
 schema and document 2-lanes
Message-ID: <178283757491.3920026.421543369418004225.robh@kernel.org>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
 <20260626092029.3525264-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626092029.3525264-4-ansuelsmth@gmail.com>
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


On Fri, 26 Jun 2026 11:20:27 +0200, Christian Marangi wrote:
> To permit proper documentation of required property to support PCIe
> configured for 2-lanes mode, split the Airoha schema part from the
> mediatek-gen3 schema to a dedicated schema.
> 
> A PCIe configured for 2-lanes mode require an additional reg for the
> secondary PCIe to be configured and the airoha,scu phandle to correctly
> configure the PCIe MUX.
> 
> Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
> introduced for Airoha PCIe properties.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  2 files changed, 256 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



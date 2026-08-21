Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ABCC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNOKOMup41cy8sy1MgQ/pJy8Y4KSbPC2AV3M7PYDDFw=; b=lD4efXJUXBgEGehZNCJIEHPYNW
	Y5HUr7Fwq2F/JuDEg2AgdYXp72ltZIpcmIebZbQ9XBHWzvcKke0s4zqgv46rFwOASl2Wqm4GNbmRr
	z70ZNPp+uq/Pr1xg7I0WJ7+yM/YAewpk0bSQ7iHhaeiDWd+Lo7Pz5af+wgPXowCx/CltAxdopBtUX
	rg7Hv+3aU5s3SAUtQTV1Gb0BxvcJ5BE7KxCeAGDaZjuXMsHWcwz1D8LJZD4cBDoXncIcjsSQ7Y731
	H2PsA3pGVQBlurm6SQ8lLe7xgfXOo8J3gWe3HFpBd+cm010Iux7PPsD+h7XPqGD2JlD1snJOV02at
	atpx3M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVyl-0000000E35o-006z;
	Fri, 21 Aug 2026 20:36:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVyk-0000000E35f-0gyE;
	Fri, 21 Aug 2026 20:36:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57D92404A9;
	Fri, 21 Aug 2026 20:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0931F000E9;
	Fri, 21 Aug 2026 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787344601;
	bh=MNOKOMup41cy8sy1MgQ/pJy8Y4KSbPC2AV3M7PYDDFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJ+k3CsmTQrcJFYjF9/BMPSeebNFmPybuKCIqJZNrYkOX6Zhpp/fbLONzPQPY9R38
	 iELMw+ToE+JJFAer7hWAH84UnDU3AVk1BOR7UMqs2DInl/Z40thuBXSbV6O0gUsR3i
	 cWE+X6iqXdcGtOf5bGaqNAqb34GDncJQF7Nrgo2WqKSdklnDlWTOq88umzoHupv+6E
	 LlrOJTWj0I0vnvz6YiQTUj0Wp6fKITHsldWUcJQ6yVrNDG+dYdaWbNoJmw4kVY5Tb3
	 oqc1xwN2uo9hbJ+CQlQBZgIDzHVK0tqIuQ24CBsev+YU4b+RkGnZ1txVoJ3KSfNwFh
	 OWoFRGxJCzMoQ==
Date: Fri, 21 Aug 2026 15:36:39 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support +
 clock
Message-ID: <20260821203639.GA4153689-robh@kernel.org>
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
 <20260814223638.GA181706@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814223638.GA181706@bhelgaas>
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

On Fri, Aug 14, 2026 at 05:36:38PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 06, 2026 at 06:53:30PM +0200, Christian Marangi wrote:
> > This small series introduce support for 2-lanes mode for Airoha AN7581
> > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > normally attached to this SoC that require a 2-line PCIe card to
> > correctly work (and give the proper performance)
> > ...
> 
> > Christian Marangi (2):
> >   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
> >     2-lanes
> 
> This is applied on pci/controller/mediatek-gen3:
> https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=39f758dc5fbd
> ("dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
> 2-lanes")

As reported by 0-day, this introduces a bunch of warnings and I don't 
see any .dts fixes (plus the need for fixes indicates a ABI change).

This should be dropped if dts changes aren't going in in the same cycle.

Rob


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE75E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=i/xa5vKa6paMVJDaBt1qHkF9/8yb0Y6DDqw5rXWWb3s=; b=0DR6tRg1Gwpzk7
	RMx3XQZ94cx0BfUsfmLyYZPP2xJzxE6HxAcZGddCE9ytTOGyIyoHN0S/pRhY4xhw2ovHRCQRhHrhH
	McHZBzPre4HAKLbkaEVpQxBEaB2DnptVAO0WMZwrl5T+EWkanQAE81nTk1OBGuTsnEzX4cThYu93u
	+pmqpmMRZPhjuxAdInh6DqRDXDacxMpDIfjUJEAqjduRvaXOgRPPLE1Xz00E1RU5ootj79RyXsy1K
	Guevk22EyokcGBqNpp404ljrHrp9BbCINiqqG5P6oqq23yfFzRa6AlWPXVAXyLGJ+YfWsipvXO3Gx
	Gx70w/26v+5PbVZA2evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmyo-0000000DnHf-3gR8;
	Fri, 03 Jan 2025 19:05:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmwb-0000000Dmum-0UCz;
	Fri, 03 Jan 2025 19:02:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33BFEA40B02;
	Fri,  3 Jan 2025 19:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2241C4CECE;
	Fri,  3 Jan 2025 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735930968;
	bh=Gl8y8BFlpRrWQhT3zEKHFDQmjYssrJwQ6kgjlUqJeBY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FP/2iUAUQJAkEPy4at/mC0I0yGQE0HwhCEVHA3IY2KvDFvb3r0rkiH9+WtqWJv7FT
	 8dY9Sx5WKgbb5FQvdB/9ht1/K+u3qMUzX5ZbF+21NmN0DWpflt2qVNMIpXkEkHbPvz
	 FRTFPfZ+/heqSC4nT51U9YgXN3sv1t1B3ifZJbQejyrwQhtTSr8B23iJT5BkZ+6oeC
	 E2H7rx1S2XYvqTQWhVbtPl9vd7bpTxASP9J0UVQCFQj38A9Nlzi2KpjImDyBQ3dkyC
	 koSIfCZx7NiHs5Zgs4K2mT2Hmk251mzjqcKR1iCJhYtxJFcfSDbDPvj3oWts31SdBs
	 07mgyjtawzQgg==
Date: Fri, 3 Jan 2025 13:02:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 2/5] PCI: mediatek-gen3: Add MT8196 support
Message-ID: <20250103190245.GA4190015@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060035.30688-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110249_215943_E77B46CD 
X-CRM114-Status: GOOD (  10.81  )
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

On Fri, Jan 03, 2025 at 02:00:12PM +0800, Jianjun Wang wrote:
> The MT8196 is an ARM platform SoC that has the same PCIe IP as the
> MT8195.
> However, it requires additional settings in the pextpcfg registers.
> Introduce pextpcfg in PCIe driver for these settings.

Add blank lines between paragraphs.

> +	 * The values of some registers are different in RC and EP mode. Therefore,
> +	 * call soc->pre_init after the mode change in case it depends on these registers.

Wrap this to fit in 80 columns like the rest of the file.

> +	/* Adjust SYS_CLK_RDY_TIME ot 10us to avoid glitch */

s/ot/to/

Is this an erratum?  Is there any spec or erratum citation you can
include in the comment?

> +	val = readl_relaxed(pcie->base + PCIE_RESOURCE_CTRL_REG);
> +	val &= ~PCIE_SYS_CLK_RDY_TIME_MASK;
> +	val |= PCIE_SYS_CLK_RDY_TIME_TO_10US;
> +	writel_relaxed(val, pcie->base + PCIE_RESOURCE_CTRL_REG);


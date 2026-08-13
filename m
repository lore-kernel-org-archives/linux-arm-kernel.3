Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA7FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/tDNXXSVjzn3sAScu0TDdXMw0z3yQb5ScgBh+NGltk=; b=hKyV0ppAHXH8/u/Y2UaYSYx9eA
	we+RwRD3Lbfbt+w3Z1e0gvEtyNgdzADVOnVEW31XVb1yZovwu80Gku02L3U7/eHoiMYB5OHsC48kp
	hqbq+zs3a2Ba2StkZSR6oEZmEWAxeqnkcbG0i3M9QzYPknkvfziwqEQidGJs9LUwqfRGkFSuStnEz
	Y5BNGitRJJ83RWMJZDETgR9jCja1ZMn1NXLveblPEXK9OJDhCLeptXy6rh7qd0qZJMqdtOniVzIZD
	zPYiwBKVQPUG+QIsEuwPA2ApsQbXmXwNcP6XW5mkalZO3uUhEGt+p7yQPRs8YF+aagUIbPx2DBpGV
	GzVZ0NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNtB-0000000HP90-2PWn;
	Thu, 13 Aug 2026 05:22:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNtA-0000000HP8r-24qV;
	Thu, 13 Aug 2026 05:22:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E26FA43B05;
	Thu, 13 Aug 2026 05:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD61B1F000E9;
	Thu, 13 Aug 2026 05:21:54 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support +
 clock
Message-Id: <178659851441.407130.13996130568120882339.b4-ty@b4>
Date: Thu, 13 Aug 2026 07:21:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Thu, 06 Aug 2026 18:53:30 +0200, Christian Marangi wrote:
> This small series introduce support for 2-lanes mode for Airoha AN7581
> SoC. This is needed for correctly functionality of Eagle WiFi Card
> normally attached to this SoC that require a 2-line PCIe card to
> correctly work (and give the proper performance)
> 
> The first 2 patch address a limitation of the PCIe implementation
> where the PERSTOUT reset were indirectly asserted and deasserted
> all at the same time (for all the 3 PCIe card) with PCIe
> enable and disable.
> The 2 patch address this and introduce correct reset to control
> reset line for the relevant PCIe line.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
      commit: c48c637255625f23bbeabbe63dc2d6a4b70c680a
[2/2] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
      commit: 8d076be9a10c68f7fac5d6a180bff19053b91dca

Best regards,
-- 
மணிவண்ணன் சதாசிவம்




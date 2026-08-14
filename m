Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C4C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YUAbOEyEyBMxZ+qzv/qxdrNwShBAdqijr1A2NR4ulUQ=; b=D/BY7xmydRTfIc
	QQchibT8HxZO2sY2ThCypuU5U2yBCFaphUEUhOXE0TtuvDm5aEelEFGS6Iiozz0UibyZPkJXsHPed
	0NiecHvijr+K4SSov80voHOSRC73lOiqyPFXdcua4UrOEjApT5LwUVaC9A02KB7XrZx+z3+fkzU8Z
	cYhC0o9zC8wBKDqQV1XGMJwVT+Q56Uepbcn8dCJlzCexe0IFihDG4Cc8PF5OyOfBaJCt3hYaI8uFo
	9Gmtq5rE30GREpdosT8zveZZsDHr1JYKR5io43tKh85iEup5qQHCyjTGAyRwnNUAs/er587arocL7
	ggD9KabRDaKTsVhNTxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0W1-00000003H4J-0tuT;
	Fri, 14 Aug 2026 22:36:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0W0-00000003H47-1WK6;
	Fri, 14 Aug 2026 22:36:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B05BF438D9;
	Fri, 14 Aug 2026 22:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6684D1F000E9;
	Fri, 14 Aug 2026 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786746999;
	bh=YUAbOEyEyBMxZ+qzv/qxdrNwShBAdqijr1A2NR4ulUQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=dqimssAJJb8IVS+A8bwvUFYFMRA1HzWgD9IMQJxF4NfE0BSnHnoTzzBWHbCSK9lDA
	 iovQLPN+qGeBAvEO3wGcQFoRoqAeL0k7jSXUDXJvI/IJERvuuTh12zeU1BbAwwc8SX
	 JyUPqb/eDe/ua8JMX99aKksyKcGZc4N/nzc+X7vYdRoXwin/dgtA/+CQyRmScs5Bg2
	 qhHsJVGoJXVtZTj6p8aVBvPIXXpGQfXdAJ27DB7gT+09MJKsYuv9a/H/NbNJSCG5UT
	 IgZ55c1tTS1NphLDEvpD5ANVxQmgAlX04Ts7byuIbEFlVGeWeu7tYy8b8JLTu7iBUa
	 fhxgpkIkYqXcg==
Date: Fri, 14 Aug 2026 17:36:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20260814223638.GA181706@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
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

On Thu, Aug 06, 2026 at 06:53:30PM +0200, Christian Marangi wrote:
> This small series introduce support for 2-lanes mode for Airoha AN7581
> SoC. This is needed for correctly functionality of Eagle WiFi Card
> normally attached to this SoC that require a 2-line PCIe card to
> correctly work (and give the proper performance)
> ...

> Christian Marangi (2):
>   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
>     2-lanes

This is applied on pci/controller/mediatek-gen3:
https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=39f758dc5fbd
("dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
2-lanes")

Just a heads-up that it conflicts with Chen-Yu's patch on
pci/dt-binding:
https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=7e38b7b0e0e5
("dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted
DMA buffer")

https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=f281334a4e82
is the resolution; let me know if I did it wrong.


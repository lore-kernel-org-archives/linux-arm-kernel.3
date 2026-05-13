Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA70ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqoWDJsbI4YlhBTV0oRNS9vO4MGiI1gRi8Q9p3RXt2k=; b=TOIofbb/wxAzgtq5dIQ2KHvFY5
	8Y5i2w02MzJQqHJb8CwRGFc79ToeH84fkCDzAbBTqA7pGGKHI1SSRRPfaYciIDERYaNJGkxRwyLPO
	egwH2/VT7kRZbtYJ0Bupb80Ne2pGFdZS4LOegkmP2W/0OxY3BpIkfCx9j9gaE8HuC9zJy3FiCvoA8
	ZdoKIXnxJwqCuRASzdN49RLvT/Xc4puxAzb6pDOWGZoXY2JwLnz4ilBGi0650QIbZQopgrxhLPcZp
	S9R6nVBOiHkoHwsVt3hbI4Ti0Ng8uXTmUt6v7gzEa8RGyIdLIgsq4Gn0EBF9yNI6MnynJf76a3zF/
	w7j04dfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNI8v-00000003vi1-3xh4;
	Wed, 13 May 2026 22:33:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNI8t-00000003vgx-3pW1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 22:33:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AE8143E4F;
	Wed, 13 May 2026 22:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCC8C19425;
	Wed, 13 May 2026 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711605;
	bh=hwTH+6hUhoEyj5JZNYIPEtUSA8SkvfuKwQ7mDWYWBoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGKO7okSgOVQ9IZrUm25mf71fR/4z438lhcaWg5EFEAt6bMnUoUYv7uyYc2jyW1RO
	 ZvNRX/He8KuHhzu2WbQYVDNit4HiSaJ3OQIVQNRdAolxdLHYGvD9P9a27K5o1aLjq0
	 xDlVkx0srUtuzR6L2cyChOIZnSNRpj/yDv4ADydw6HSgxp2TnS0Qb0QJ39rrzrn/vP
	 qruV+E04+ScJ4ihorRjadeGcbtwiKjaQOV3z4t2oWZwVPOMn6ujEATAPj3wfGD2JGm
	 vCW8dOyZZhFP+Q+JK2xZ733PW7zArcH9Fz1KMGpxpSNxtlpPlDMXW+1SdqfBVo2RUo
	 OUXl5sG+9LZtw==
Date: Wed, 13 May 2026 17:33:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-acpi@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Orson Zhai <orsonzhai@gmail.com>, Ge Gordon <gordon.ge@bst.ai>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Samuel Holland <samuel@sholland.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michal Simek <michal.simek@amd.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
Subject: Re: [PATCH 03/16] dt-bindings: timer: arm,arch_timer: Fix
 requirements for interrupt description
Message-ID: <177871159980.2167014.13931408615582570920.robh@kernel.org>
References: <20260507125544.2903406-1-maz@kernel.org>
 <20260507125544.2903406-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507125544.2903406-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_153327_994513_298E8118 
X-CRM114-Status: GOOD (  17.14  )
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


On Thu, 07 May 2026 13:55:31 +0100, Marc Zyngier wrote:
> The arm,arch_timer DT binding is extremely imprecise in describing
> the requirements for interrupts.
> 
> Follow the architecture by making it explicit that:
> - the EL1 secure timer irq is required if EL3 is implemented
> - the EL1 physical timer irq is always required
> - the EL1 virtual timer irq is always required
> - the EL2 physical timer irq is required if EL2 is implemented
> - the EL2 virtual timer irq is required if FEAT_VHE is implemented
> 
> The consequence of the above is that the minimum number of interrupts
> to be described is 2, and not 1.
> 
> Finally, clean up the description which made the assumption that
> the timers are plugged into a GIC (unfortunately, that's not always
> true), drop the MMIO nonsense that has long be moved to a separate
> binding, and use the architectural terminology to describe the various
> interrupts.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  .../bindings/timer/arm,arch_timer.yaml        | 21 +++++++------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



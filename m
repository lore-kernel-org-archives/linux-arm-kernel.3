Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37FEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Z0pD/ma+V7F4Eb4/a1KsfqWZzZZ+OZaCFFfV1XhxM=; b=p+xYy6rNYumYOb/rYkmHccl9ni
	VK4hDsLHWVvbPueZ5Eg/YAt//9B+5eyV0U4MNaLutYksNqYhuPQY9LWILw3kZMf/80pakQHKDQNBa
	lbiAErUHOQoOLzZi9emPKw5PoG7L3xmeY4X4lavzvzGcDJWRTvAsP01is09e3WjWCAraTjgYBeIcB
	aAgqgnRFRf7PRc7logeuZTyxcLzk5MfjXNgUXzls7fdDtzQwvmG9N+fQEnz4WavRBUGqhWXAR0oF7
	lo5FOV++0shJ7U3KI/oOXibwYhFST8ib+nBG7GqrZWl32sA3wcKq5J7Opexc6XTQ07dzjc1hQ/4wA
	jvEzRwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93U0-000000064IO-0aS5;
	Tue, 22 Sep 2026 16:36:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93Ty-000000064I7-3lQg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63CBC43422;
	Tue, 22 Sep 2026 16:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F9B1F000FF;
	Tue, 22 Sep 2026 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790094998;
	bh=B8Z0pD/ma+V7F4Eb4/a1KsfqWZzZZ+OZaCFFfV1XhxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fw6YGeVHDr+R7SgoWSTXATTIo3hYzUfkKsXg9gozGxvpBk4fzqwDtW5xZnYvALi+5
	 N7duEStGtOqQUVhgiX8MuNIotF6nGA0Q/56T5fAX+IVHayaO0G7F1qd6FPPCvSVDTN
	 LttD++0jR62WFI5Ch4mugFQ6CylKkGUXDYoU786+XfvsHdod9mMCzaUn4ikL52Kgyr
	 iD/vawBxb6FPf2FyybYsSBmUWTAfdlJxpv1EFfqidT1r1MNQHnKVE96m2ffQd7C+L5
	 p0qKaqdbcJEIYBnYbD+61T5dQPBwSKaKRkG+thtm2FasTkHB3uF4/kFuYx2DK/2TB+
	 ZvDuh+UY5I1QQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Zhijian Han <hanzhijian1991@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
In-Reply-To: <20260904012307.3434449-1-hanzhijian1991@gmail.com>
References: <20260904012307.3434449-1-hanzhijian1991@gmail.com>
Subject: Re: [PATCH v7] PCI: imx6: fix resource leaks in probe error paths
Message-Id: <179009499346.50213.9073558313167610848.b4-ty@b4>
Date: Tue, 22 Sep 2026 18:36:33 +0200
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


On Fri, 04 Sep 2026 09:23:07 +0800, Zhijian Han wrote:
> imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:
> 
> - imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
>   and adds device links to them, but nothing detaches the domains or
>   removes the links on probe failure or deferral, so they leak.
> 
> - A failure of devm_pm_runtime_set_active_enabled() returns directly
>   without destroying the pwrctrl devices.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: fix resource leaks in probe error paths
      commit: 3e7a0a4f2aa5e8392f005d7ea1c8e783e90453cd

Best regards,
-- 
மணிவண்ணன் சதாசிவம்




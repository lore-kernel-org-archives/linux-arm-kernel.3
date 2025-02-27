Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0AEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U34QHAF9nYxu8HlHXRkd7BxvMNDWHYZmnsn/Do7IiKQ=; b=SiPxlP6aEVwjcz
	NIWj/+W+fb0vcmgsFMPteVqmnlE3uhaq/oa/mfVixsLhdh2xDwC4R/OgXnbp92XJCCPmBznbfq9z+
	1hC4w5XBVKAo2Da/ZDvwKfrsDbN/SdBcyLV0ArDDFR1znOvuOGzTO1U8ntRB9phICNqbjaN2eWmsF
	eTX8zURbO7TL5mLnfLP5eQkkf+Dx4rU2uSiUDQAXNKpshkmvWenubv6Tw72s5ApFqBB+3qASUgppb
	tkMD+2eu4DG+MT602HunlxObC+BLIQJurWVxgmTiQSvJa6puJxoPhxWTZ/qy81wd9IysIoDzl+ZUg
	+o4dsI8jYZNU+FUubsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRZC-00000005nXj-1X5i;
	Thu, 27 Feb 2025 00:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRXe-00000005n6d-3wBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50D30612C8;
	Thu, 27 Feb 2025 00:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7857C4CEE4;
	Thu, 27 Feb 2025 00:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740615257;
	bh=IJhzRI5FvZjHtS5FsY6CYde4Ud9At1eLFATFNVXmvmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m5gY2KkKsdtpUFD1g8/Sxy/IgPIMpjbJaMk6IJb2+7Oa4e6UO9xn8uxrgsLGWq+nz
	 zUVLwbjg93GR1rbkoU4nsWC8vQmFnGNDK7BakN2lLOdD3K/ZaSCysIV+h0jJiDNnRH
	 3ZHVygXiNAfEuuF4zdIz9kgmCjPbgL89p7UnpmwdKzb7Jfbg0o06lWF2xM5YLsegyx
	 jVhnMlO1S6M3Bre/xwfQN0oc5O2YQ6q0kFsokXDObQjFx7NUiCda7i6kOfCO8QH8+9
	 wbvGyRN1zMJKSqbvc6R+gFesykDrTQYZonoZqM6gM3kYVGa30yhJiLT/6D+v2ALKtm
	 BSAqeNJTHjWxg==
Date: Wed, 26 Feb 2025 18:14:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 6/7] PCI: dwc: ep: Ensure proper iteration over
 outbound map windows
Message-ID: <20250227001416.GA566334@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227001211.GA566164@bhelgaas>
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

On Wed, Feb 26, 2025 at 06:12:13PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 28, 2025 at 05:07:39PM -0500, Frank Li wrote:
> > Most systems' PCIe outbound map windows have non-zero physical addresses,
> > but the possibility of encountering zero increased with commit
> > 700cafbb642b ("PCI: dwc: ep: Add bus_addr_base for outbound window").
> 
> I don't know what commit 700cafbb642b is.  It doesn't appear
> upstream, and there's no subject line or patch match for
> bus_addr_base.

Never mind, I see it's patch 5/7 of *this* series.  I looked at the
0/7 list, but missed it.

In any case, the commit ID will be different since we apply patches
from email, so the ID from your tree won't be useful.

Bjorn


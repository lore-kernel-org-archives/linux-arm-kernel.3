Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F1AC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 23:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4peBAsnWme09BQ6woZ305p/0tw0c7pP6SdCRfkMgd/M=; b=t/qbDp5FAD8z++
	uFhKqfv7aXh2XIWQQRaBuqhnw/wNvO8Dy7z6MwxWFzQSWtheYolA+jxWWK9QN2s4DT1aBpKcTDUvq
	0rWSNzFqTKeXYLGNPhz8EH7xICgqQzg8G7kulyHCwKaEv2QsYREqiQc1SpXHWpZDrj0IALJDCp8Gb
	kdGqwl/0vhMQuHpZq0iIlhdT9CaP2KAQezZZx1omXK0tG1C+v60XuwhfgjRxyrjZbuJqG5BTFDuui
	f1uYsEtpAxmBtlCNKenn5Q2E/aptcSAbvH+RPPgiOj3g0QPrw9OOV4VYtlzZGx2o8CJiQdInPwr7O
	GhbIo5VdneNEnumD3i7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L5y-0000000CkD4-04hS;
	Thu, 17 Sep 2026 23:00:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L5w-0000000CkAq-21Fl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7D744125D;
	Thu, 17 Sep 2026 23:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4D51F000FF;
	Thu, 17 Sep 2026 23:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686043;
	bh=4peBAsnWme09BQ6woZ305p/0tw0c7pP6SdCRfkMgd/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=hk95nq6EWlvY2MjWuIEtn9vj8KRLS9zn5Le2QUthvZbNDuGnEzRmzpOzl1E3IQ3nO
	 /vqpQw9EiTp80get3fNEVJlriq+qaOoWaqQrWiApbEQgR7u4RHgKfEnz8q5tB0O197
	 EQL9q/ddlt5WoeovLzzxCuOofyjEkbG10ZBcYS8M7bccJbkAH6nPMqJo3nRImz2OXp
	 CvBAEh9rTuDEqOTqRho5IhsqSTJqkXokd9HgWPVf8xA7cBiT6gPT3Z+DtvXM3Sm1EF
	 RIz7Vg1UTqMKf97cYz6Bc1MCXC59qiC34OzWPpv2i2ugCganI175vCM4ST6YXlwQKL
	 S8lAxC+QAnRKw==
Date: Thu, 17 Sep 2026 18:00:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: vladimir.oltean@nxp.com
Cc: linux-pci@vger.kernel.org, Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Manikandan K Pillai <mpillai@cadence.com>,
	Felix Gu <ustc.gu@gmail.com>, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] PCI: Remove device links to Generic PHY
Message-ID: <20260917230042.GA1091862@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912161440.1032188-1-vladimir.oltean@nxp.com>
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

On Sat, Sep 12, 2026 at 07:14:37PM +0300, vladimir.oltean@nxp.com wrote:
> This is a request from Bjorn Helgaas to replace commit 9a9d18547ddc
> ("PCI: Remove device links to PHY") from the pci/next branch with 3
> distinct changes, per PCI controller, to handle conflicts with bug fixes
> in the same area on dra7xx in a better way:
> https://lore.kernel.org/linux-pci/20260911221209.GA587622@bhelgaas/
> 
> The patches are formatted against the v7.3-rc1 tag. They do *not* apply
> to the current pci/next, as the change is already present there.
> 
> Previous submission was:
> https://lore.kernel.org/linux-pci/20260810124315.433448-1-vladimir.oltean@nxp.com/
> 
> There is no other change than splitting up into individual commits and
> adjusting each one's commit message. All review/ack tags were dropped in
> that process.
> 
> Vladimir Oltean (3):
>   PCI: cadence: Remove device links to PHY
>   PCI: dra7xx: Remove device links to PHY
>   PCI: keystone: Remove device links to PHY
> 
>  .../controller/cadence/pcie-cadence-plat.c    |  4 ---
>  drivers/pci/controller/cadence/pcie-cadence.c | 16 +---------
>  drivers/pci/controller/cadence/pcie-cadence.h |  2 --
>  drivers/pci/controller/dwc/pci-dra7xx.c       | 16 ----------
>  drivers/pci/controller/dwc/pci-keystone.c     | 31 +++----------------
>  5 files changed, 5 insertions(+), 64 deletions(-)

Thanks for this, I put these on:

  pci/controller/cadence
  pci/controller/dwc-dra7xx
  pci/controller/dwc-keystone

respectively for v7.4, and dropped the PHY link cleanup patches from
Felix that are no longer needed since the PHY links themselves are
gone.

